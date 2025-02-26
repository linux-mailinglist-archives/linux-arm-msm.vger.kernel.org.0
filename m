Return-Path: <linux-arm-msm+bounces-49572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D940CA46FBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 00:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FB2E1888D63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 23:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E345E25D8E9;
	Wed, 26 Feb 2025 23:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFyzvZ+O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D7927004B;
	Wed, 26 Feb 2025 23:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740614090; cv=none; b=Wit5yS/XZ6pFgCFJnkrDUJXh8yKPcwM1LslqnGlgX7z4oRsnlPSE3x0Ei4V64QY2io1/fNmHrIxhY3mUEtkzY5JmthOu7p3yZj3KrgMQN9d6QVUY2N0n4WY0vLIfdcy45L0HAMOzcOAmqWMa9FbWdalAlsSu4+3n8cOyRysAh8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740614090; c=relaxed/simple;
	bh=YUskBTkxhympUP6Mt/bQ164L/YKQXYDZt/yEpEGdp9c=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:To:Date; b=XdIbE3wanLfUTpWU22xf0HHU4CIh0JjHFt7ptmXscKzh1zSoIHHEdoZeyCIKRiCbi8UZ5xgE8wOOeGFCEGW3hrr3xMoAEACJ9LrcSA6rHuCF+XeT9O1GgcpAMnt7jdeSgGhg808ELpBz/YR3ukwzEK5+Zimk8HR4pZVbEE4oblw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFyzvZ+O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DF2C4CED6;
	Wed, 26 Feb 2025 23:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740614090;
	bh=YUskBTkxhympUP6Mt/bQ164L/YKQXYDZt/yEpEGdp9c=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=dFyzvZ+O6w2TFJX7p/NFufQIv1pOXDI8An2gT1zT7nQqP0GPusWu1vEiM2WMUWcmW
	 sItYVpBw12Gmv3SwQOitJb+esi6VjFL3ZwZW3qaFuF+JLNr1EjusjOfzHbBAmx6HJm
	 EOXAALJP09nJKYT/jsKRW2pBpeyCwVpxcxpj9U0fMJNT/S1MfHMZbDTcoB1xMAioxQ
	 oshnfGtb5X7cRAy/j/kNanRYFp90H57W0Ac51V1vGA5wsDfivIAvqi47Q0q8Qmwcxg
	 yBcv5bRlKfO5H3dBs7XSWlgt8rbvC9vHEjMawVBPTPjw7MqUA+YNvKTHJrf6byMVMx
	 aBTYceJ3EUB0w==
Message-ID: <eaae8c47a4bc27d512c76d9f107f1e00.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250129154519.209791-1-krzysztof.kozlowski@linaro.org>
References: <20250129154519.209791-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent
From: Stephen Boyd <sboyd@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 26 Feb 2025 15:54:48 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Krzysztof Kozlowski (2025-01-29 07:45:19)
> The parent of disp_cc_mdss_byte0_intf_clk clock should not propagate up
> the rates, because this messes up entire clock hierarchy when setting
> clock rates in MSM DSI driver.
>=20
> The dsi_link_clk_set_rate_6g() first sets entire clock hierarchy rates
> via dev_pm_opp_set_rate() on byte clock and then sets individual clock
> rates, like pixel and byte_intf clocks, to proper frequencies.  Having
> CLK_SET_RATE_PARENT caused that entire tree was re-calced and the byte
> clock received halved frequency.  Drop CLK_SET_RATE_PARENT to fix this
> and align with SM8550 and SM8650.
>=20
> Fixes: f1080d8dab0f ("clk: qcom: dispcc-sm8750: Add SM8750 Display clock =
controller")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---

Applied to clk-fixes

