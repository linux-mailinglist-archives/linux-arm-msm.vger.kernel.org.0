Return-Path: <linux-arm-msm+bounces-46307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF154A2011C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 23:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE947164F44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A91E19F121;
	Mon, 27 Jan 2025 22:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pbptS2Lz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489CF1EB2A;
	Mon, 27 Jan 2025 22:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738018340; cv=none; b=lDadCYvx0MglfHc+pLTuiGpmR0rgq8p8dOq2TRCMa0mAkh3Qx7btYjx2+WXy8tq35g1RiMocmu/NHPGZfcGrECrtFE+Zzkl7h6NV8qtjWI+lThfqfseR8MGVz/QeJNIfl2F9KxiuXP6j7hDgyxx2BGakM0dLcQ9fZ+hoiWH4Omw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738018340; c=relaxed/simple;
	bh=k21KZFwkFjIEiEi+SPMzunnRmZUOqoJ6creHbo8FtdA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=klyXxOaiJPxkHBdYyTJaEFk9VkMGJ1/45cDsuTJlJriEpwXnJSCcFx84ZhSqJ2vioxzw6XNWj1IiPkNjRn9r3lKTw1GmbWvGcGd5fojn1jP3ASttblzdCPPvsTgZHbYqom0VhAmKai1QnZ23Y/+vNMwp/hD/c98pjpbASN0Flik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pbptS2Lz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E66C4CED2;
	Mon, 27 Jan 2025 22:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738018339;
	bh=k21KZFwkFjIEiEi+SPMzunnRmZUOqoJ6creHbo8FtdA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pbptS2Lzae0TNyBamqrRguII90DP0knYpTVK56BmN7jaFirfIqyHgXkgO7nLS0qsu
	 NopEwesOr9Fzvak+V0aB5OsaXw3UOofK8lJJvVP+n1JCeVJ6uu1RLI3Sb5S31QKdBu
	 5r5feDmrJIN1c3+uu2XTC8TCTo4x3W+XVGTRbTTUpZFX3kolr/uERDWufv20t0d0MG
	 f2nMbX5Z6YcMsG8IsGGnXLp6fr4Q53AeqjAIaVwwLBPros07/vLWGFKuDhFVoIuiVA
	 H0FeSV9c47mK7c/36L0fygjwZshGTuZx5L93yol6d5U/ogL3d87JJiUrsBVIleC4U8
	 ulz+tKMVb2Oyw==
Message-ID: <8ec7d5d90529c27bc6f099cb67a915d9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250127132105.107138-2-krzysztof.kozlowski@linaro.org>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org> <20250127132105.107138-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/2] drm/msm/dsi/phy: Use the header with clock IDs
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Marijn Suijten <marijn.suijten@somainline.org>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Clark <robdclark@gmail.com>, Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jan 2025 14:52:17 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Krzysztof Kozlowski (2025-01-27 05:21:05)
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/=
dsi/phy/dsi_phy.h
> index fdb6c648e16f..7541ffde6521 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -6,6 +6,7 @@
>  #ifndef __DSI_PHY_H__
>  #define __DSI_PHY_H__
> =20
> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>

It doesn't matter but I think most folks prefer putting the dt-bindings
after linux includes.

>  #include <linux/clk-provider.h>
>  #include <linux/delay.h>
>  #include <linux/regulator/consumer.h>

