Return-Path: <linux-arm-msm+bounces-112500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b1S9HqNuKWpAWwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:03:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E45F466A10C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:03:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=IDf90Vp0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112500-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112500-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33CC93186313
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF69541168D;
	Wed, 10 Jun 2026 13:56:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348261E5207
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:56:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099776; cv=none; b=TrGCG0i8q8GxFmS7PmOyZ2G4c8K0K0mCv3lsprLiZ2xkZImLXkbcJSjM8nqrTY8Gc8oYmVwza4AUZmRQdTWIOPwmis0il9tgfBTk3mXk5c7UuQFKOpeI2hMuQqP3EN25ljUsgLQ1CE4oFvcVoy2HQ5iEKHcR48u8Z7dpZOJ1XYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099776; c=relaxed/simple;
	bh=vce+NqjQ7OjaFBCXPFO1vr5ngJPOjbpOuZAOPi0vtGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXrN2ttr72QFRhWygR3GTnJF1q5t0lGb2FpUfRQzGzjBqwv0nqW6oR7tZrHfzi4y6sgfRI/RETjPhQy7qEGuZ1/ECLjKp9Vi5TFTys9Z9mBX+cjhijwFgNfkfUpZ4Wgrr2hj5kTb+OoNpqPZ4Rlv0uoogjpr4wLxKfVb0zPPjoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IDf90Vp0; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so75682445e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781099773; x=1781704573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6x/S1LXWAlJufNMKimrj1YiILxNLEh0GgAmijqMitjY=;
        b=IDf90Vp08ivu0qRkijHQYXx6AE4dMuLY3EEGc4KYjfAisGUGyYGViF2AMKKrVtT5aL
         AB93YZBwJo9h41L7aGFbude9ZUQOqbkcaHCp4qlQxSqlWxDJXS9BJnT31CecXdPQtfMG
         dRP9aYkKDAgaJYYr0nD6F/il8qPzkvdQM785K1UWsmV/1z12ADMK/snw0wD6DIEYsAr1
         L/A4lmhxauH74r+5Po8C/dvl7QRtWm998q3TejijL06KGur7uRu6y9Yh1UDv610UFs0w
         WNyhxS1AyB0VkaHDsPtALTDCjuZPbHfXENq1JT2vD9o+slBzQRJZEKp+DXWkXwCGdN5M
         yhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099773; x=1781704573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6x/S1LXWAlJufNMKimrj1YiILxNLEh0GgAmijqMitjY=;
        b=qCgcpaxlZGdhzcOTEPn/jhy3CQtNfCrNuKeJZxeik0yozGD694ISpXKAy8scq01uYu
         KmyMFIMQ4GnW+PNUNBhHL5HuT9sxgIRYJgxhnFUMGwY6tArfsDWxnvrRSgest62m3HuT
         oQx/bqF5BHKmf/GrO2rCYHlwU1SJ/wIWqnODIBlv6P3wXTArZHQbqY24OvPb90k8gFSa
         /7+7r6413OnZ6SOA8CTHx6e4uN00L6Dim0ZRdmHvVuoHhBftc1LZZhodD4yTCR7TQpgb
         nz9nJ4PPnvfozMdLgxztTyg4AUaaAw2b6WT/hRRWjv901Sv0MhQVOePf+GqyjleXoVw9
         yZJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PEa4eneRZ/g+bywkKiD1saEgp/9LW4aLU6C3UZysLK5fhCPrajT2iyZiI1N2fEq+GnGBT2Cj8K5k9Lr8A@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6fEZ7P5CsYz7DQ9qCAovFsXZhehC2QK2V8LquclHhsYP/xcr+
	4dpRdTAUwSqu/qXUGZ9QKA6NrlMTxxbJyVxqxcwx00yCvXEOKZA+DZHG3yMjAwcdC560y7Ot8Yj
	aUmQVr/4=
X-Gm-Gg: Acq92OEcn/Oe7rKZMw1FSDKQAH7ngbAi8hbfkwn2hM3G6/nh75vmw/E+0WrqOUKOFZz
	8DAfbiuQ89KF5Oq4G++K/pGTg8zg7mVtPt2rrQYXrt6cKdHLXYrYKcnM0PMODcodoJ1oJKSoC2e
	EPB/7RxCKwspQNajj33c+7i27TaNoCUMxEiuYAlxyEWK5Aqm0yOfDT6sAtqCKAHU+BhBVungooN
	zZtg7SM6pLbMcLk2kGuRKIFm+6X4iv2oakLI+QiEd7KEBG6HhabPMJe/7X1pmt0sRZWsQkTnfpr
	XnoqekJ3HOL8oaEOzhtbfOUA3sQMu1HWONKzedt0cQrHtjAv+EmgwPRcigVUQF2ggPQ4MRJfiL6
	XPK2lrv5+OBmC1kZP4bCJTKSdnXfhY8DWb46f4paz3z0D7NpqhuKfuK63kQQiN8+Qq2y/FkG6aa
	q4t9OeYROxBV/If9/xCegV721Z6p3gcIjI+fE3WaMpMri3KfZ/LvdIA5L57g==
X-Received: by 2002:a05:600c:c491:b0:490:b9d3:a9ce with SMTP id 5b1f17b1804b1-490c2606a1fmr426581085e9.30.1781099772623;
        Wed, 10 Jun 2026 06:56:12 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:7c57:ff85:2733:9342])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413541sm606240735e9.14.2026.06.10.06.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:56:12 -0700 (PDT)
Date: Wed, 10 Jun 2026 15:56:08 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
Message-ID: <ails-CZAOrq_wWBm@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
 <69cc948f-bb4f-49e7-b050-9e3805aef758@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69cc948f-bb4f-49e7-b050-9e3805aef758@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112500-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gerhold.net:email,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E45F466A10C

On Wed, Jun 10, 2026 at 03:46:00PM +0200, Konrad Dybcio wrote:
> On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> > From: Stephan Gerhold <stephan@gerhold.net>
> > 
> > The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
> > match nowadays is gcc-msm8909. Looking at the differences between
> > gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
> > definitions for the BIMC PLL.
> > 
> > It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
> > MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
> > used for GPLL2.
> > 
> > Replace the definitions of the BIMC PLL in gcc-mdm9607 with the ones from
> > gcc-msm8909 to make sure we read the PLL status correctly and don't make
> > accidental incorrect changes to the PLL configuration. With this change,
> > the rate of the BIMC PLL (600.6 MHz) is displayed correctly in debugfs.
> > 
> > The clock naming typically used for Alpha PLLs differs from the older vote
> > PLLs. There is no device tree upstream for MDM9607 yet, so we can still
> > safely change the dt-bindings. Nevertheless, by keeping the old ID values
> > and swapping the two entries we can preserve ABI compatibility for compiled
> > DTBs. Previously, BIMC_PLL_VOTE (71) was the final PLL clock to reference
> > when needed, this is now just BIMC_PLL. The previous parent BIMC_PLL (70)
> > is now the parent BIMC_PLL_EARLY clock.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> 
> I think we may be better off removing the NoC PLLs and defer controlling
> them to RPM, on all platforms that define them..
> 

Well, this is not controlling them, it just allows reading them. And
that works pretty well, so I'm not sure why we would need to remove that
on platforms where it works?

Thanks,
Stephan

