Return-Path: <linux-arm-msm+bounces-44022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69092A02E4B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 17:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58183164141
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 16:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2C9137930;
	Mon,  6 Jan 2025 16:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sWKwSRxt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6923A3597E;
	Mon,  6 Jan 2025 16:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736182398; cv=none; b=gL21ccZjeSrf7HD9ZqRDmoOcY81vPRIejqOulP1NWlRF32eZ9oUwuYwpG/xIIlCDfNd7Rmml/r/z5z32MXBeZpxgMZc2j2UQ/qnuWNXY+8Cjkr8a9eelK0biv342L3AmjA2/1e/HnOBIc7irSAz+OADXlJV+BjpfAfLh51HypO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736182398; c=relaxed/simple;
	bh=t1Gt9KmG/u6OattpKgvHM4Zl+EOpPIzkQriwa49lsD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E25w0+mHZOjSWxW3ioHorv6dwTMSYJ7cFwk8iWSjqNuUcmRtSwXItFrwNnfn+lSAQcWAiFNnZsQtqB6F3lsG8dPzCfgNLlNbxgxuUmbgHXsD1CxCsGkSbB1O/6aSEN9opPTEZaIecp5sEG7zYe+9Eh54WbzuT1ERxq7In9wP7Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sWKwSRxt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12914C4CED2;
	Mon,  6 Jan 2025 16:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736182397;
	bh=t1Gt9KmG/u6OattpKgvHM4Zl+EOpPIzkQriwa49lsD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sWKwSRxtHGyG9/aaBcsoIiwKG5anTrcJDL9LgOl+emwI8Y2XIs5TTEAAq+ey6/bvx
	 Rz8L3zWwCayk8f5pz4wUVemuCIlgLY093yVdXHp1b/Qp503vgZ9c2g1/BnZuAhyuHu
	 +El89wthg1zDjq7HQr5W+aO2iC0D89zkhioy7I275eYn5I2tY6ZcQ7mVJxcP3LWBsG
	 T/qSs2YRmGUGRAxV1xC21QFQN2gzcOVuKH+AZP5bS0mhMroB0G1BbsE2NUyVGRaaGq
	 Fi30vxkuVQ10jTIteSh7zoMR4mEZwDtZDCMECjBsfvY0QubP9frs7kxSiuXbn2P/fR
	 oVBUPEpDPQJKA==
Date: Mon, 6 Jan 2025 10:53:15 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v9 1/4] clk: qcom: gdsc: Release pm subdomains in reverse
 add order
Message-ID: <3nq6zehelawkkdsxuod32pyntxdgbijsjm5bwk5hu6l3nni7lo@5aeutzvdefku>
References: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org>
 <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-1-f15fb405efa5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-1-f15fb405efa5@linaro.org>

On Mon, Dec 30, 2024 at 01:30:18PM +0000, Bryan O'Donoghue wrote:
> gdsc_unregister() should release subdomains in the reverse order to the
> order in which those subdomains were added.
> 

This sounds very reasonable to me, but what's the actual reason?

> Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
> Cc: stable@vger.kernel.org

Without a reason it's hard to see why this needs to be backported.

Regards,
Bjorn

> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/clk/qcom/gdsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index fa5fe4c2a2ee7786c2e8858f3e41301f639e5d59..bc1b1e37bf4222017c172b77603f8dedba961ed5 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -571,7 +571,7 @@ void gdsc_unregister(struct gdsc_desc *desc)
>  	size_t num = desc->num;
>  
>  	/* Remove subdomains */
> -	for (i = 0; i < num; i++) {
> +	for (i = num - 1; i >= 0; i--) {
>  		if (!scs[i])
>  			continue;
>  		if (scs[i]->parent)
> 
> -- 
> 2.45.2
> 

