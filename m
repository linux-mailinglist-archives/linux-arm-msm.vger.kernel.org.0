Return-Path: <linux-arm-msm+bounces-112504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aETbD5JxKWrtWwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:15:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A805866A262
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:15:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=N0LL6f+u;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112504-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112504-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17B083206060
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F19C3F44D3;
	Wed, 10 Jun 2026 14:09:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1CB3F7AAD
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 14:09:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100573; cv=none; b=DCRiSIaYH3CGxKl7k8+3ema+GarBMDeJqSJm/lNbkYctk5j0aA2l5wrSUE0fTCcI7loSF+VwHO7+15bJe/PA3lTNyAmEjYmX0kCo28gcdRyPngCnu/uTZnCWLFC++XgWUqTEdTgkJvSXc/cYKiBdKs2zhFX3+FETdqDmZk9db/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100573; c=relaxed/simple;
	bh=xOBnAKbfMwDSEwiOfNlKTQ/sIOMtTg3T6ON0DZHh4gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4Djj/ZYEgI7SDbkqNTDnI/tHbW6JuSZd9muhIut4cyOX9Kq/mCJWTNNkEbyAdPSqUHQBP4wyq+m5AHDpbwmjboarS7GxkXyb/ri4dU5PaFEHksIkZCJjxecUXbDkMJGpq3sSijY28zNUUSNP5JYA+HzBgNRStaX3Aa1CDsqv34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N0LL6f+u; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490a76757e5so45112445e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781100570; x=1781705370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Yp7dQIH3qFqTFCTwClldJqvJ4eJdBAvpo4TLN8Qmpc=;
        b=N0LL6f+uTVBdblveTqDHTS79wedP5+/lItTb5xiZmk11jHcWHRP0qYD7PTINm6tfrP
         sWcUsVITDTYAG2HLwO0cM16/KVaXPtGa6IcDvQq7FKmQczuWXbwGKo1UnJ4+VbYOZci9
         8IHDBDqrLzLUxh1UXLsvXtwM7GMxwj30OnAOUNFDy5nqS/0SA65VjbCgkCS3RxR1mxnd
         P6WpfwyME7QQo+niO5/H2jBNkwIeIm3W4Q40dV9/zdTBUnT/JJPlhPs8hDFE9hIclAEd
         WpNvFp1lrmvrYOOsEJpiZQpy/+9DFz2iXJ2kgaanNCk4Rc/zaH8mmXfGGPBFO92VXSi0
         9I2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100570; x=1781705370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Yp7dQIH3qFqTFCTwClldJqvJ4eJdBAvpo4TLN8Qmpc=;
        b=XZuNzZp4xXTb0YynjlxUjd30+7LlYbTM7H8EaJNjw4IDj1Oc8aNjtQaAVOmT08rHkU
         cl3pN5VFgz/ufiOgAfWdcRrzeMSRDDNZAOcAZ8yjtRM92MmMA3aX4u/EaO7AWSmcXBvV
         iazh/bG9ENxl+VmFQDO0OiWJ31ziiPxMdHMo1pvbOqTdINcN48cWMenr2Omc8y+LyEYl
         Oc3MNXuBBQuTalcVaFeGtclbx3JEK/gtausxPlXrv1NOij5ZpE/4uQb5Z47I1b84WYPH
         U0ReYOIYddacC0ViLOSRyFfFUyaMtJ6GnxsUazypGGYVQWPMvP8UP17o9mOEufQrLti3
         QX8w==
X-Forwarded-Encrypted: i=1; AFNElJ9cIsNiG0SU/VW9YdqZQgLvUgtD9XqBPxri2VTXMRxwNodDPm1fZrCPEij6hlSRi2XD812pKRtT/i+a0aVX@vger.kernel.org
X-Gm-Message-State: AOJu0YzzjOur+FT752OPNU66/oSNRhvvj2FWsLNqXG6CZZYxPquoJdup
	L8L3AfBsXjHs1oALj8Dk/2j6dQ5f2P3SLI2PvmYIc30PkSH6k+74v3kmeiCjdq1bYkNj7L5jOYk
	yMVgaJXo=
X-Gm-Gg: Acq92OHEx5QddNaL0icTDA+oC19k50VzzM4QVuwFgR1DNHx2rjs0lYyNpRSKWk58KjD
	0O/Biwrf9LE+pTw9IoCphSt7+jHV39NDZ9jqLdNfT4vY2+IqA0wu2SIlUqakgzW/cfBxESaZiZA
	LSkb9hAlzjVcaBBAS+ayaBAq0aFTKo/hO7fkhb+MsUTO77P1Hf6EQNh1DiNkFQd0gwamB5iUzuC
	VmNaNWeaX60OXCVZibWK5w1H/r8zC9AStjQ0k+5g4kK2h6AhN554AmvTCKZoRPQra8Dj3+Q6VKB
	dwWHPSpUvbZTV9AfAZATKhyOvAIhohzY4y9Tqku3u08+RCee0VA1NtCGhUt8OKAbEx9zR2D8F60
	/WbtjTMVCeP1LmbZzn5oEKxzacmoBsTk2WSL4kINGpkHuuAUyaPLus/t2Tks1rlO9CTU0lUaY9q
	XgVACB4Jfqlo4YcPZ+hGxDLM2TbBexafoZ+ZfIMPGyjjV0nhw=
X-Received: by 2002:a05:600c:4e14:b0:490:4e3e:b483 with SMTP id 5b1f17b1804b1-490c2600ebdmr362021485e9.22.1781100570315;
        Wed, 10 Jun 2026 07:09:30 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:7c57:ff85:2733:9342])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc0f8sm559839415e9.8.2026.06.10.07.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:09:29 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:09:24 +0200
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
Subject: Re: [PATCH 07/12] clk: qcom: gcc-mdm9607: Drop incorrect
 apss_tcu_clk_src
Message-ID: <ailwFPgY13_7dZ-C@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-7-5e9717faf842@linaro.org>
 <f55526ad-ecd2-47b2-8b8f-5aec429bc1c0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f55526ad-ecd2-47b2-8b8f-5aec429bc1c0@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112504-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,gerhold.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A805866A262

On Wed, Jun 10, 2026 at 03:50:11PM +0200, Konrad Dybcio wrote:
> On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> > From: Stephan Gerhold <stephan@gerhold.net>
> > 
> > This clock does not seem to exist on MDM9607. Reading/writing the registers
> > always results in 0 or crashes. The math in the frequency table is also
> > broken. GPLL2 on MDM9607 runs at 480 MHz, so:
> > 
> >  - F(155000000, P_GPLL2, 6, 0, 0), // 480 MHz/6 = 80 MHz, not 155 MHz
> >  - F(310000000, P_GPLL2, 3, 0, 0), // 480 MHz/3 = 160 MHz, not 310 MHz
> > 
> > Presumably, this definition was mistakenly copied as-is from gcc-msm8916
> > (which uses 930 MHz for GPLL2). There are no branch consumers of this root
> > clock inside gcc-mdm9607 (notably, gcc_apss_tcu_clk has bimc_ddr_clk_src as
> > parent instead of this clock), so we can just drop it.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> 
> It does, CMD_RCGR @ 0x37000
> 
> Interestingly, there's also an SMMU instance.. although downstream doesn't
> seem bothered with it
> 

Thanks for checking, but that still doesn't give us enough to work with
it. In particular:

 - What are the frequency tables? Which parents exist with which IDs?
 - What is the hid_width?
 - Where do we hook it up to some children?

The way it is right now it's definitely wrong. I don't think we'll need
it so removing it like this patch is probably the easiest thing to do...

Thanks,
Stephan

PS: This platform has the weird TZ-managed SMMU (like MSM8916), so there
isn't much you can do with it from Linux. Unless you are running TF-A,
then you can describe it as "arm,mmu-500" and use it for everything
pretty much exactly like you would normally expect. But you still don't
need to do anything with this clock.


