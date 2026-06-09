Return-Path: <linux-arm-msm+bounces-112073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /4wvJGTZJ2o/3QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:14:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6860065E2BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:14:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=CTTT9bOV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112073-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112073-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5DC4D30BD130
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96C53F0749;
	Tue,  9 Jun 2026 09:08:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6736F36EA8B
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:08:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996092; cv=none; b=MkxytH1n9yc53FMcrnNU3OW5KqAUn69ddb2OXsxHYpDyRoxWMoA3Vx85YndbgxEapsrBLVx/By4Bngmk2Uh+le0d6Z2l/gsuxSBuiAP6H0dg/epYuYL0OTZnDMuHPRCkN/QwGuoXhOwDGDe7aOz5Jb/m7s5YuBmqH9mY7t6yYxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996092; c=relaxed/simple;
	bh=onUk0eC+bj5IO02NaGoMzSwQ82L62PRWwZ9SDyCVvHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYFvpvmgFIuDRXJiBsfE3Abi5BXX1Sa3YJLWFR/QI8jmNmEqn3P2xqW6mKxzWMAxIXsmDQelk5154Cemy2RUZuUMVyKfswOlFT579ZA76fnoCf2Q15neU6q5QH/p1zWx9oZ73T2BoP+rWzWljOUVgllC6r7wq03wVIbZFe/zms4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CTTT9bOV; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef616daf6so4819963f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780996089; x=1781600889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WcWe6FBXHKu/SjAvczkdQWOlNf7E5opqauX17gbFy9w=;
        b=CTTT9bOVDlOGfuyPdLAfq4WX5VpSeBwytP6Akmzrf0TPDS1UMFzXnt08zMo/b9p6aF
         rhY7GEvUmay9ysAsZR0Pl7gru200x123bbmrACMU21zJKXKSv7/SYgzLgmvcZ0OasojC
         s9hKr5MgNkPS/e+gki1h2miIsfS9XdaJ0GWjBEfM0UEeCcVkseYspK/d5KNPC8vBpwb1
         5oWTDSa9mGHW0dwUukPeEQbMXSeVku0fv1p5yfyh1zYudXeiY6dAK5QGzuGoSeiHFBaw
         +mVlS/8SLLHxNjIcq0N+NRjiNQJ81lsI/bCQB2BX5lYJ4ZHSNukoHxmeGaOR42aiQi6u
         8BuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996089; x=1781600889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WcWe6FBXHKu/SjAvczkdQWOlNf7E5opqauX17gbFy9w=;
        b=f+SuLM0wC/urlrcI6Y7Q83zq0jxYT8V/IvzN0nXkDEe3+Sdi8lrq9M6b6BEFBW/wUU
         mgjY2kiNM04BBYGSvLR3vk9/+iVXkYHQWbXXF6A4r6ysoLPxJyxc6Iv4hUfpdT2rax39
         yr5exZTpYY2iWI1P68ITky0NtYxF6IgE8Y0i7Pj5fm92txKjwLJAoHY8dadj9B5ql083
         g47zh6vhO5GLZfDpntJmuNhf45Y0LfmSyp3jLzssfrcx+Pz0wGIU+RnKREcGpKelBK+3
         jXYdLmNrGq3WxydSszj9Dm6Klkicwncc81wC781uxRYw4kmvhJk3494NXo1KEKysJXGJ
         Ilmw==
X-Forwarded-Encrypted: i=1; AFNElJ+w+f4P2WRnnDLt5hUMNfY9H5VYrBlnvHqEFy3C6Bx1UYIoGe0L3KRmO7nqtO9g86EgYHkgijkl4SAPayyy@vger.kernel.org
X-Gm-Message-State: AOJu0YzAXlOjMFLptLz/d+LbsvdhQRzR2KfGO9WlAd+ysTD5h34wq+dc
	MsKdogGfPEyDKP00728mY0rn6X50uwJUO38TUPyNUfCbgorH3BS23t9ATh2VEcD7tEc=
X-Gm-Gg: Acq92OGXcjQG8So8uTPUHA+Ue/jOvWkV7iDARCnep8okr5HFnMPUSYYVfiLjvkljk/b
	M145OXzVzrRKcdDDtW4naXmlWuNpp28rNOIsPldNLfXe23Opt1d9LpnWnLf0mwy2XhmmfK3YHsd
	eTvkO5Oe6ERGFKCGX0R0Ar83CZhIsPZXB8+zfhx2d5Gu/cx7JtkiEOvjTujF9BerJEY/cxKd21y
	fHubGe5zQEj+QENJ/nWHRkGQuWnq0DBHg4UklRRClD8Ic1oGQQXoZ94nS4ynOXMpZiJ1ZeUiPYt
	tKOUNANIDvX0VtOPJtj+QgCvDdkMfANTZEWOeWpJGhh+s1LtOj6AMXUjosM8FOUu9TZ2kOQZ36B
	Iy1oo/bcMBoiAelwjgRzXiEyahN+OVkPHtcEt6WbBJCaf6Wb7w7iuSbKtLeDcUFmOVT3nxgh9vD
	oWPFUW/W7+NNadOYhVSQTU9wdBulleZfGrW+eSXN94jqEFgw==
X-Received: by 2002:adf:e30e:0:b0:460:1233:ecf2 with SMTP id ffacd0b85a97d-46030609798mr22478117f8f.30.1780996088589;
        Tue, 09 Jun 2026 02:08:08 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:919a:5e38:ea48:32e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dce6sm53232795f8f.30.2026.06.09.02.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:08:08 -0700 (PDT)
Date: Tue, 9 Jun 2026 11:08:03 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
Message-ID: <aifX80IHM8TLQiV7@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
 <20260609-quirky-rat-of-criticism-aea1fe@quoll>
 <87mrx4b164.fsf@bootlin.com>
 <aifKejyF7n6QsI9h@linaro.org>
 <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
 <35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112073-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:miquel.raynal@bootlin.com,m:krzk@kernel.org,m:mani@kernel.org,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6860065E2BB

On Tue, Jun 09, 2026 at 11:01:18AM +0200, Konrad Dybcio wrote:
> On 6/9/26 10:55 AM, Konrad Dybcio wrote:
> > On 6/9/26 10:10 AM, Stephan Gerhold wrote:
> >> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
> >>>>> On MDM9607, there is only a single controllable clock for the NAND
> >>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
> >>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
> >>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the second
> >>>>> clock ("aon") that is required by the dt-bindings. This is not really
> >>>>> useful, so avoid doing that for new platforms by excluding the second "aon"
> >>>>> clock entry in the dt-bindings.
> >>>>
> >>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>>
> >>> What is the problem in giving twice the same clock? If this is what is
> >>> done in the hardware routing, I do not see the reason for more
> >>> complexity in the binding?
> >>>
> >>
> >> I had that in my first draft for this series, but this would be wrong
> >> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
> >> this platform at all. I'm not sure about MDM9607 in particular (maybe
> >> someone from Qualcomm can confirm), but a similar platform I was looking
> >> into at some point actually had *3* separate clocks for QPIC in the
> >> hardware and none of them were called "aon" ...
> > 
> > gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_src)
> > gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
> > from GPLLs)
> > gcc_qpic_system_clk (32 KHz)
> > 
> > No clock containing the substring 'aon' in its name on this platform
> 
> Looking at SDX65, perhaps the 32 Khz clock is the "aon" one after all..
> The NAND documentation says
> 
> CC_QPIC_SYSTEM_CLK - Always-on timeout clock (32 KHz)
> 

Thanks for looking this up.

IMO, if we want to describe the actual hardware routing, we should
describe all 3 clocks and assign all of them to RPM_SMD_QPIC_CLK for
MDM9607).

The resulting diff would be basically the same as this patch just
inversed (3 clocks for MDM9607+SDX(?) and 2 clocks for the IPQ* SoCs.
The complexity of the binding would be the same, so is it worth
reworking this patch? At the end, there is just one clock we can toggle
through the firmware here and I doubt anyone uses this SoC without the
RPM firmware.

Thanks,
Stephan

