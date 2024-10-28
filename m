Return-Path: <linux-arm-msm+bounces-36242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 286229B3EA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 00:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9A5F1F230EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 23:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D384E1F4261;
	Mon, 28 Oct 2024 23:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="So+x5pGh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68761DDC06;
	Mon, 28 Oct 2024 23:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730159152; cv=none; b=hd54tPZHDY4pjk1fUPOGcpVIXbGEySCF7vR+KCdVML4k0XcSeiX9JAJ/NylndQn6/oiJBgxB5xmIuG2xRmO2W9mTiKIRIkd84+L7JGpkz4JhxWU5MwK0uowbCJavOKCVYuGR+1PQXFScM0htbYVX0JzOkzNhAkm2VKziLvCB2+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730159152; c=relaxed/simple;
	bh=fL4xTGUyjfaIDRvymwtjnaUIh4XT0RoVRXEu3I7MQUU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=VP3cpuCLtWW0SW+TNmYxfxEBbNKHltCHlkzWV0Gj8FJtbs4SOagUmsfpTATzM0cIQ3FGSKxGPwBCudPUN0xPcSZGoW89XiU5m/E6ZZcpukoKsa9tYWOdJSWi7F55rOgDs2indd9MX2PUjCLlEph7k9er9V5upHc/+Uv5DO9U1OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=So+x5pGh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2065FC4CECD;
	Mon, 28 Oct 2024 23:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730159152;
	bh=fL4xTGUyjfaIDRvymwtjnaUIh4XT0RoVRXEu3I7MQUU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=So+x5pGhmoF9fU73rar06TWH9HdR2XSmcUY09wKCcXg0hXaL9wojmm2c+BFXEt0dY
	 fWMB0CJAW4hrUsepmOEMu/QEuRXdP+M13HzXhYv5gTqdpdQCrIu46twPVDkHT7jQU+
	 GbalZmEwKEruCiEW8jh3+jyWI2da1n9sEI4dLCaBjvePGqnjeR1i8CC23Xig0SutEF
	 YYyNtw4DkWkJEl4WmPLdVOLo9LdHWahBKYmkEX0w5H4RtCdiP3BAampJtDUceGiEUW
	 ts1K4oa5idp7smysH59F1e+8YvK7/D4hwTBczZtpdpTilelxkCmrL/gMF/aZqvDFmj
	 plVhSTlyPiy0w==
Message-ID: <cad19645bf903f6647b7634d942b961d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241024-starqltechn_integration_upstream-v7-1-78eaf21ecee9@gmail.com>
References: <20241024-starqltechn_integration_upstream-v7-0-78eaf21ecee9@gmail.com> <20241024-starqltechn_integration_upstream-v7-1-78eaf21ecee9@gmail.com>
Subject: Re: [PATCH v7 1/3] clk: qcom: clk-rcg2: document calc_rate function
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 28 Oct 2024 16:45:50 -0700
User-Agent: alot/0.10

Quoting Dzmitry Sankouski (2024-10-24 03:13:09)
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index bf26c5448f00..0fc23a87b432 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -153,7 +153,14 @@ static int clk_rcg2_set_parent(struct clk_hw *hw, u8=
 index)
>   *
>   *          parent_rate     m
>   *   rate =3D ----------- x  ---
> - *            hid_div       n
> + *            pre_div       n
> + *
> + * @param rate - Parent rate.
> + * @param m - Multiplier.
> + * @param n - Divisor.
> + * @param mode - Use zero to ignore m/n calculation.
> + * @param hid_div - Pre divisor register value. Pre divisor value
> + *                  relates to hid_div as pre_div =3D (hid_div + 1) / 2

Can you use kernel-doc instead? Then our tooling can easily extract it.

>   */
>  static unsigned long
>  calc_rate(unsigned long rate, u32 m, u32 n, u32 mode, u32 hid_div)
>

