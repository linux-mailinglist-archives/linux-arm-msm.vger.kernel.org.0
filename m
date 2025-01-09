Return-Path: <linux-arm-msm+bounces-44559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B74BFA075C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0FF43A6D88
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 12:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998272165FB;
	Thu,  9 Jan 2025 12:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="s+406ge8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531BC17D2;
	Thu,  9 Jan 2025 12:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736425899; cv=none; b=kH0YPC6jduF+YSDlwMENb8xUinnI5UAMEjCvWqVa6c9RyWl3wMKQPpcZ0AWmXwh41CMLo1JRZbLfghCbm3BikQblSN5ASj6fAdnN6SkF1vnhfa9CCZRQUsa7HRptgfZ1fz8VMTo4XuvwBw4bPqM8l4XywfsQzxey1oIbk4GvJ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736425899; c=relaxed/simple;
	bh=rMuMS314XNGWQFiBiA/QKvOELH6i9cSo5uahuA3ShC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVIhce9qDqmchdRy/kcgRDZ+JaLCXARTadUv5UUD7wrVdP4uDp3H4vthxpqDif40sI0caWdLULkDw519QH7f/L6xSUEyccwTNCi/vM3A/445Am/+DSNVD1lJqKLN1q+P9KG5nLVbc4CpKlDp62leIaaN+uAEJNxYvsRuE01mNjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=s+406ge8; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from localhost (unknown [10.10.165.14])
	by mail.ispras.ru (Postfix) with ESMTPSA id EF3D1518E772;
	Thu,  9 Jan 2025 12:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru EF3D1518E772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1736425895;
	bh=FyNPIbZfssEGNxAGRt1nSlLDfMlVqQxGXkpQqjVV4MY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s+406ge8zRVBIuV86X3dYSt7194MJUzoyG6k5f83KGR5uXwzixxk2p7mXtXmammXY
	 BL3YHJ9vIyULwUPzDv5u3aA0aLGlZDRUb17xec8GATPr0L6asR1XC0M51ZDTfUA1o+
	 0EECLJhzWyoafnAwsoSTyKjoUxiYVqmahc64m+lY=
Date: Thu, 9 Jan 2025 15:31:34 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Anastasia Belova <abelova@astralinux.ru>
Cc: Bjorn Andersson <andersson@kernel.org>, lvc-project@linuxtesting.org, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, David Dai <daidavid1@codeaurora.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-rpmh: add explicit casting in
 clk_rpmh_bcm_recalc_rate
Message-ID: <qd6shnygj7mzyeq6h7z5gbhxvpzm4omtcl2usui7jeywow7spf@ggq6w7xcbvik>
References: <20250109105211.29340-1-abelova@astralinux.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109105211.29340-1-abelova@astralinux.ru>

On Thu, 09. Jan 13:52, Anastasia Belova wrote:
> The result of multiplication of aggr_state and unit fields (rate
> value) may not fit u32 type. Add explicit casting to a larger
> type to prevent overflow.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 04053f4d23a4 ("clk: qcom: clk-rpmh: Add IPA clock support")
> Cc: stable@vger.kernel.org # v5.4+
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---

Already applied here [1], no?

[1]: https://lore.kernel.org/lkml/173525273254.1449028.13893672295374918386.b4-ty@kernel.org/

>  drivers/clk/qcom/clk-rpmh.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index eefc322ce367..e6c33010cfbf 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -329,7 +329,7 @@ static unsigned long clk_rpmh_bcm_recalc_rate(struct clk_hw *hw,
>  {
>  	struct clk_rpmh *c = to_clk_rpmh(hw);
>  
> -	return c->aggr_state * c->unit;
> +	return (unsigned long)c->aggr_state * c->unit;
>  }
>  
>  static const struct clk_ops clk_rpmh_bcm_ops = {
> -- 
> 2.43.0

