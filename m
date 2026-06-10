Return-Path: <linux-arm-msm+bounces-112482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zHr6F7lpKWrBWQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:42:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD59669DA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:42:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="PyTFF/Bl";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d0A2QPyk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112482-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112482-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8BF73058997
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52293E3C41;
	Wed, 10 Jun 2026 13:39:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6941F3B6BE8
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:39:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098770; cv=none; b=AHtSDSrOdv81YyvikeU11XpiqQKqgFNa/giplduvlEkB7o3/nhuGb3jjlkHMsSxpLG02M5rY/YFMAQHKTWwua4WG0GkCr2FcWgZIHDzHjkhuJdMlBXJG8IrPeUBN3D5MF6Eehvu+B9Cci68xhm2zyuq1OPFr/KmoVjaHz/5JHbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098770; c=relaxed/simple;
	bh=H7A/F4SMtA+MlL6psxxUHLW4kr3yvL27FTnGc5CAs2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCxYgmmWOompDkWjT6G1HnfwaADVTnu9TnMyJlX/DlGjGWe0RFu8GbRJ69gpOORyKYCKLvAYNAa7+RdbyvbsKUSaWhPtqqRn19VRFDA625SeObAmXAjJef0MzPQmhuL49QIvNFVZW2kBjgaqMgseLjLWs/Y7dSWmxrZIAnHo+rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PyTFF/Bl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0A2QPyk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCoT71598840
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h+hAhPYAj8DNFBrgO/hXZBez
	gqnqrmjN5oDOEhJKrOk=; b=PyTFF/Blp2tAx0ILFeAADFDO9MZUlP70NOmi95wg
	EW7AsYfyOYg2kXyINTohsBb09sAykyU9p5goKIe+s49TIor0b06aHbmb0dwuGTEh
	SJCdC8SUctql/ylxjo4bZsa3AodjG9WR0vyOQmETanW8xH7h5+eYA3CaqQAFQFMJ
	+Qu2O8l/Vzzpq2F96NXiT4HdEZCY47s8OoWa+wvJyT1g+G48xvHXuM9yFL/wjwyX
	d0hxmu+QhrbLkG6nOThjYcu34U1jtVxo0SDWCZzN7uuQzu/yhLW8wW5pFqavhSic
	pDCmf+QySvH90vwWKo/TLEj9DzmrkLT0A2jvSjeNOpve7g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2sehm81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:39:28 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9661acbf65cso58814241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098767; x=1781703567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h+hAhPYAj8DNFBrgO/hXZBezgqnqrmjN5oDOEhJKrOk=;
        b=d0A2QPyk5iiq1lQnCMrVvkq5rMTYgjKSwU6+kSujjbBinGeGeYSuyRmAAdlJCbyIZt
         R1q70JQCrgB0fOv/YZi4knL0Hv6oL/KXikJ3CpslYFiMrMvl6ZB/lRqpvehfdZNoeoVq
         fNz/GxzKUtBFfXtbWxil5P3QlmHaYNX7QQuiVuKkPrEgcZ4lfHKrnzECjCQ/q5YgDnO3
         n+yZbD9sXMrMMezJeHTWzXhfYM6croE/qehL44N35NPQ2pEs4AuFgNUpxuicjnSjcdNc
         6oz4Gg4TbvZ7Z1yc32/isnB85r5UHheDXfXLHD+ffX7FxS2oX1rv9a5hgmweaWGGWyjf
         DHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098767; x=1781703567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+hAhPYAj8DNFBrgO/hXZBezgqnqrmjN5oDOEhJKrOk=;
        b=dnq0OK9vduHzwMWoHMuOaip2n+DyLg+WX5fZYm9C/MJLnv98vatVXs52rIuvlE/2V1
         dq8FB+aU6Wj8ZKkjZgfeoUM+2IOQTlKPAlYH8pqC/g+7jWyA09HALwaGVKNIkA5L5gjg
         VR4eFWsTi/JzU+rhoEUvt6qYqnuNRdeAR5Ph0EedZqr5+NnhLXuRNF5V5Z/P1r1ExkbA
         j+MsxZDbAiTick6mlHHfUDwbDk7JnITyx9Uvk5EYxcU0Sqx1ekiNBxitTl+RU1YCd55u
         5VFHw3h+GOq3HdRolIDBScoTLQCyvtfFRWUIOxgarTCijkFjVAyzTQkYR4UMizBmCDL5
         JYsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oT+okdzTXwg1xTV8JwoLR25ZeQ3aRVFsei7EfuimqbZzB8to+DxbD1sfucsa6xnjLBTJ1c0jiCaVVY69S@vger.kernel.org
X-Gm-Message-State: AOJu0YzWGP4o3iloI9dA/vdPGiNj9X5MsBRTAJgyl/ldZXaGu27DwBov
	/Mo2KtqwAlpIhDDOdQsoFXf7aYrmxCv7+WljY79eAm/9aAfnf3EHJc5nWTn6RjYovnyf4UNZRK0
	21SKAbm2Gr4hIfJsujp7BvcJyC7TH3V1ApIpKwYlx4D38oZA/Q7gmhBXaxISkztW0KAxx
X-Gm-Gg: Acq92OHW+LpczlVoJ+jLHcKSYETRYViwdVv8v4EmWhUEPK/4CjxIKDn+uDLw0J/yfDL
	y+++YZVDKo3rnA9s9L39N5AvT4gFY3x5zoLrh32PCLfGIPpGKhb6XuXxxxNFTE1cBZD1MfX/ws9
	qw5steQwx0EdRhAXj9BoCFJ0pgLl45UmMhetp2Jw8DjZ+6M/4NCIiaOc8lFry76ifRZf3sEIiUN
	LfheB/2T/Vl1+D0Jx1wj4uRiYZayVZC0AQwDL1sqankrDrLpTRXh+oz4b3VV9X8fSXRERw8W3ft
	ulVf/D7o3nsHGmGEkRa6hB0AqQmZrdfzZ061lNNi8UdrSnV/MohpW4QN9jhzTQkYUu76DrZaMvN
	vhVHicraNYxrrN5GqT/HwnSnYGJ4JixZmkuB+6uJbdFPV39exNcXWcKh8nsHqyWxrz/IKK9kzd2
	bzPpHNfF1oubQ/GmvmYfTvlpz6jk/iW0mS6UUCbt5dR/bclA==
X-Received: by 2002:a05:6102:808f:b0:635:420c:9b00 with SMTP id ada2fe7eead31-6fef04ef441mr15031865137.10.1781098767266;
        Wed, 10 Jun 2026 06:39:27 -0700 (PDT)
X-Received: by 2002:a05:6102:808f:b0:635:420c:9b00 with SMTP id ada2fe7eead31-6fef04ef441mr15031797137.10.1781098766707;
        Wed, 10 Jun 2026 06:39:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b906a83sm5419614e87.33.2026.06.10.06.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:39:25 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:39:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Herman van Hazendonk <github.com@herrie.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: add MSM8x60 MMCC driver
Message-ID: <5umlewznxfu7pmprbvbprsqt5uwjzb666kw5gwdxethpfgur54@mlggwypljii4>
References: <cover.1780148149.git.github.com@herrie.org>
 <dae03d8bbd4a9cf14622eff86f8f83460fac5e86.1780148149.git.github.com@herrie.org>
 <a3a6f1a7-5539-48cc-920e-5a555ba04e7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3a6f1a7-5539-48cc-920e-5a555ba04e7f@oss.qualcomm.com>
X-Proofpoint-GUID: FKKzNcWpFVLAKhes-iv24WJEcj3DI8Wx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX74IId5Ecej3+
 R4UJf3JY+MDhuvjzQoS0MeYIqv6CYxywW3P+iQx8h5t7AJNOuzCIiq1mEvdjEZ6pxFOy5gwL6nl
 AqdTKEaXHdY4AyMpRe5HNlLaSC+jhFrwkJ8jo7Ygz8R4iDQ5uwdAjyQ6h3zao0r8LWZ99L+Swaa
 g7UhZIlONvpUX5BxDpvM5ITJNmUYZ+oRDTRL6KsOffPY9hh8RCrREF8U//rXf3XDdR4ODIXGSgs
 3G4ZHzcCcFRwsYtVccJsfusW7HN5khiAJp+QVtiiJGluXnqcSj4pEE0DFtpTESMpqnsZ3NuTjXt
 bQ6FeBANW8WlRRVxx02uVZrVBZ3bFwrCQiruKCQmuADLLnnSrH13PYQVQLR5HKxqDvMuWNRQBIR
 RTTi7SlhdB+hkJAtz+FNkadQdsfAt1WSVgbACJU/Cg0UA50pS6izyMdoQl9fKlh6b1H2tUUWmR2
 JZ/36JWIXvKYSXhodYA==
X-Proofpoint-ORIG-GUID: FKKzNcWpFVLAKhes-iv24WJEcj3DI8Wx
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a296910 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=cTwmTnRGAAAA:8
 a=wrmej_e3st_QPmaCYGgA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112482-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,herrie.org:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:github.com@herrie.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBD59669DA9

On Tue, Jun 09, 2026 at 03:44:39PM +0200, Konrad Dybcio wrote:
> On 5/30/26 3:58 PM, Herman van Hazendonk wrote:
> > Add a clock driver for the Multimedia Clock Controller (MMCC) on the
> > MSM8x60 family (MSM8260/MSM8660/APQ8060) - the Scorpion-class
> > generation that preceded MSM8960's Krait CPUs.
> > 
> > The MMCC layout on MSM8x60 differs from MSM8960 in several ways that
> > make a separate driver cleaner than parameterising mmcc-msm8960.c:
> > 
> >   - the pix_rdi mux requires a custom set_parent op that temporarily
> >     enables both parents during the glitch-free transition;
> >   - the IJPEG GDSC requires releasing AXI, AHB and CORE resets;
> >   - several rate-source pairs (MDP pixel, GFX2D/3D) only exist on
> >     8x60 (e.g. PLL2-derived 228571000/266667000 for graphics);
> >   - the camera CSI / VFE / JPEG / VPE / ROT clock topology lacks the
> >     later 8960 reorganisation.
> > 
> > Used on the HP TouchPad (Tenderloin) for graphics (Adreno A220),
> > display (MDP4), camera (CSI/VFE), JPEG (Gemini), VIDC, VPE and
> > rotator. Reset IDs are exposed via a separate header so consumers
> > can reset the GDSCs and individual blocks.
> > 
> > Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> > ---
> 
> [...]
> 
> > +	.clkr.hw.init = &(struct clk_init_data){
> > +		.name = "pll2",
> > +		.parent_data = (const struct clk_parent_data[]){
> > +			{ .fw_name = "pxo", .name = "pxo_board" },
> 
> Please drop .name (the kernel-global clock lookup), this is only a
> backwards compatiblity measure on existing drivers. For new entries,
> .index is the best (because well, it's the fastest)
> 
> [...]
> 
> > +static struct clk_branch camclk0_clk = {
> > +	.halt_reg = 0x01e8,

From msm-3.0:

+#define DBG_BUS_VEC_I_REG                      REG_MM(0x01E8)


So, it seems, it is a debug reg, not an actual halt reg (but I might be
mistaken here, I haven't looked into the details).

> > +	.halt_bit = 15,
> > +	/*
> > +	 * The legacy webOS kernel used halt_reg = NULL for this clock,
> > +	 * meaning it never checked the halt status. The hardware doesn't
> > +	 * properly report the clock state via the halt register. Use
> > +	 * BRANCH_HALT_SKIP to avoid the "status stuck at 'off'" warning.
> 
> It may be that some piece of hw is holding this clock online behind the
> scenes. Is there perhaps a Qualcomm-authored commit that mentions the hw
> bug, or is it a guess? Due to the age of this chip I would imagine I
> won't be find an answer if you don't have one..
> 
> [...]
> 
> I see you have a lot of inline note-to-self comments, please strip some
> of them.
> 
> Konrad

-- 
With best wishes
Dmitry

