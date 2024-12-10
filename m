Return-Path: <linux-arm-msm+bounces-41252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F267D9EABDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 10:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEFE4162F7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DC4233D63;
	Tue, 10 Dec 2024 09:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFgK7Zn3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6741B2327B0;
	Tue, 10 Dec 2024 09:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822662; cv=none; b=tkXUIaRbaqrUgUnF0OLBZvMxCnskIVDiV5ZjHGvfzZYwFCbUt2NHnRL9WJ+zbEV3MjWZU6QXDTO61iIpYrEaDqzLSV6MvsRddtbb2edbTSYtSi7MeyKQSH1KCXLX6bcIftci9Os4rp4Wx4Jt3UqZIW63Hl1F3KFSDnObZqyMjZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822662; c=relaxed/simple;
	bh=O5XOuyjwnuqX3HgfIz2VRWoSd1CmC83IYUVQVp42D6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSYivcDbWb/xjAxUxE/+8TVGrQewWel9t8VZ5vC1vGfk+8QC8tfsF9E5mL7KPARbLUgPCing55Q7a+Wb8bGySfigpNE5YfK9z2CUe1WQgKLcD2OK/hTiPmBGQc7r8sdc3UCFvWZ05LPjewkn3bt8bX/PwzzpyCNlb4eMHs+DOBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFgK7Zn3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936A1C4CEDD;
	Tue, 10 Dec 2024 09:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733822662;
	bh=O5XOuyjwnuqX3HgfIz2VRWoSd1CmC83IYUVQVp42D6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mFgK7Zn3NmyYLjlZrqNvvTczPGCBGHSPRj13Um9o/qLOzDH1+Mn//zs9OpM8x1Noj
	 7UGT9S0bhazTLt0uZd3TY4RLVoEqyTWnVcU0643XrHuqErrLV6s/FOdUOHayhWDULi
	 wXsxgc5o8pun+UBZXYGR2R5Y0/Y3z3QmQ7ZBcGPmzDRoaMrpc/lW2x+hdCzlVZeblc
	 hMwv6JR1wognVLcYpjxa620f6xB9zncPgUuLlA0+U0lRg7FRnIPRJYLkxV0/AMlNiw
	 crOlIRDK6HgY8JvDZ973+6/lQJ8fg+0bDPAhwcX8vLAuqrWuaVxxH36oiwMcUS2kMS
	 lxZ1JHMhQFiYQ==
Date: Tue, 10 Dec 2024 10:24:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: display: msm: dp: update maintainer
 entry
Message-ID: <gs6zhcauz7kjocgbkj5p6tr6gws4z65pxwrldmb35nikwkrdhv@6xybugfrnhjj>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-4-9a9a43b0624a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241202-dp_mst_bindings-v1-4-9a9a43b0624a@quicinc.com>

On Mon, Dec 02, 2024 at 07:31:42PM -0800, Abhinav Kumar wrote:
> Add myself as maintainer for dp controller yaml as to support
> review of the incoming changes.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


