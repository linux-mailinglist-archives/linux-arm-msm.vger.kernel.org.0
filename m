Return-Path: <linux-arm-msm+bounces-102762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rUWqDP7o2Wl0vQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 08:23:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9786F3DE85C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 08:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7413D302C33D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 06:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872D530F7FA;
	Sat, 11 Apr 2026 06:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djAW899L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CcEH5YX2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE2423EABC
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 06:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775888634; cv=none; b=QjY3dYhbjycu79/WuWZh14edfMZGMIwRdBHc8LgL3ZzuvbcgcLPozhGYdPMjC93yOFE4vhgnwo3yikv8oOlWoITXN+zmZnuPlHKfsoRSrHc+JeUdAZQLGERBQyLSlT7S3764X8pUsJJKRdnVgnjd+3nIw0tMVJ1oBOtHmEy6DUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775888634; c=relaxed/simple;
	bh=3YPHg7r64YrngGP40JXKZCB5q0R1LvMBFjLN1Aph8GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHkJHePBupK4G5CNR8fjL4Jp0XaY9LGGrK+aT5rb1O6pMUeIjDw3i63ZxdvRyvadsiDpokL+vKBSWKQoXz5N0wjx8E9Td5zy2KxM0UwqJHQGFld9kPJ6wVpYM1O3Mx0HsetXiKGIJkyhkJtvaHKmShrEpuDwB4aH10F5nYT6tkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djAW899L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CcEH5YX2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B43rTv621772
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 06:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EON6Gc6C60/l73Ca3YOnXhe0
	CaA7ihPiKL27DUJ/8XU=; b=djAW899LiaxJD3cSs72Q0V2k2KMowEaNstB7gpqH
	6gtdLxeJpsQl0tb7/cAXXWJ0KqCZGt/2qhmJn1RU+r4ECI54ky/TtYd8gsSDFLx/
	nBKWFtfRtmugNIi1gGW37GBnHVydkR3GnF1+JlSjGSz+mPWorrf2qFEjfvjjicVw
	A3JggY0c6srzzFzBMnjo787g0KzcX7tjIrZ3AQKNDlc/e2mvM4GZT3KGoRCxfEy2
	7YFkHk9jWGPED+cMH0BZbR20xQq/nJdVU+e5dl58Eqz5Mwz1AdNHH/Ifzhm69w69
	LFn3LrHv+ytyIck1jwnaWbr7ISTce2R1sgxggINlWtr2bg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfr78k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 06:23:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2489af602so26695025ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 23:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775888631; x=1776493431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EON6Gc6C60/l73Ca3YOnXhe0CaA7ihPiKL27DUJ/8XU=;
        b=CcEH5YX28i4U/OiTfTS6BTbVP85ixqlvGYNrsyWH/K39OENmy2omaw2IHhrzXLRvct
         Ol5EmEnvrkM34xHNH9/0VuHbdd9H742ydxocdxDkETy8H1DB9wzrmFTwztn+/HrtbxHr
         LCSidJPoUtDg2T+gNeXTE8lkL4ObedAoZ2InczlzPI4TyZ3S06A30vm10ZRTNnZ261gn
         v0ifPwZhPHFVMnkt/46aYsTL2ZRGdb9G4+mYzGJ1pwY1KpTsb44acvGE/PWrhBCaEk3B
         XK1u0/HlmiV1gotv8RR1HXJQ63y6XSWV548cyl7T6JgaZq5D3qHSzn97qTxIh3kUt3zQ
         4+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775888631; x=1776493431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EON6Gc6C60/l73Ca3YOnXhe0CaA7ihPiKL27DUJ/8XU=;
        b=U5EquEXKj9jbHI3eThFLiaMYeFXuGNYieoa8ka9DZgxTC8YjDWw1rnfjfgof+1yqJf
         lbqL4/Dikc10KAg9bwXyEG9NmUtza4RhzyCb71XCQwIHoMlNmFfTGh9UtQVPZqaRKSIu
         J3Aiuczq0QV/usjBm3KZ+zQe4eOQEeMfH7W7dpKaBNC6hcT68QNVuWFVWQ/sR1An32Gk
         DLPjI9kzGZrnEYc8s2j0fR2aamkkQfqPhcWrga/gw+KwUirpT2G22ydwexcgpBVvDvp8
         YHLX6Lfnv1LkHqHBWRoAhGqF6DsQCNsOtwFLOctHnmI5cs6cZypwFZ2Dp2E6/p06yU0q
         /RwA==
X-Forwarded-Encrypted: i=1; AJvYcCWOQCFrivVW16BVpKr/RYjg60VH5fw7Ln735k38vUKNC6mYyMnwEuxPJqSwD9lThzZvIAPeZw2Z90o+xtuJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4F7jlEkkouKOnJeFHWT2ET9m6/w3792K0nAbfBJemDugQFaOx
	qmznRm5TXLlcHfkf7LoazMAV5g0vqNGAT0TRAj6R3QF9qlyyPgmNJuHZdco967bAcC0L6TPKl2f
	zUR2NiBuFLpBA7cpTXx8fU8RU9s0T2+MIDpejqEiLMjT3uyX9EBDFyLBwuac8n/xtcX1o
X-Gm-Gg: AeBDietcgpmiEZ6izwbH/zMsSw+wwvrdp/9YjAFO5ndJkyHPE89ozaZKizz0yLOCaN+
	dXydzW+fN34IU2dz73MWOUFvg2NpPK9HiZhRspqMknVPIfGx4y4ZCbl2XKm5K7+dP8+eJLbiJAI
	Ewb4XJKXNKEJSc3JiHezxeCOMdVM/ueVOOf+k4RDy6g5AdNJxJEKHpioGNOhDEOXMEpem1xU2v3
	vNMe4dBAnPn2vyFpFqtE0wMUymHhnM1PUi57SfvQxzlAR8cDs49Wb79iJa7OxDQssILEiZx4wqp
	cKiwjb6JdfACA8OAd/SeP80YhJ0BZ8rCjaUAeu9+jTTU7oL/kUjCLkAPzkdKQ4gHOD4FCbsGfO2
	GApuOy4tM54yYQFPEGsDDZ3qDk7uLmuhztTs+n4muCyXwX0Lx
X-Received: by 2002:a17:903:120a:b0:2b2:6cab:3127 with SMTP id d9443c01a7336-2b2d5d7a278mr50669915ad.20.1775888631014;
        Fri, 10 Apr 2026 23:23:51 -0700 (PDT)
X-Received: by 2002:a17:903:120a:b0:2b2:6cab:3127 with SMTP id d9443c01a7336-2b2d5d7a278mr50669585ad.20.1775888630373;
        Fri, 10 Apr 2026 23:23:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f26a97sm65595815ad.61.2026.04.10.23.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 23:23:50 -0700 (PDT)
Date: Sat, 11 Apr 2026 11:53:43 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 04/35] irqchip/qcom-pdc: Replace pdc_version global with
 a function pointer
Message-ID: <20260411062343.moksimqxjomts44a@hu-mojha-hyd.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-5-mukesh.ojha@oss.qualcomm.com>
 <adm0X2ybeG5McXVv@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adm0X2ybeG5McXVv@baldur>
X-Proofpoint-GUID: aeIwXyyURaclnECDm9uOgTDWTLKBA-ga
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69d9e8f8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ASaocV-rLGzqRiZtC3wA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: aeIwXyyURaclnECDm9uOgTDWTLKBA-ga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDA0NSBTYWx0ZWRfX2U/A35POxBFL
 da9RVdMiVxDSgAfr568u5FcyCaHBUI258FRsDplvy62evmE3LIX8Iq5Q+ZdmVwnJEbn1mOnTOKG
 CAboZAL9gvRcAIEd0V8diRympuq2jBZ7GQ27OEPCMe8p6zLdcFINaIp+68hgdHaeV4mQbc86n1g
 IOpiDafmrNQFS+N224GicVp0MGtRxHY9fULHELzghpObLRjPgoDofn6pIvHaPPbnFCemw0KJe4S
 nf5cEfY+NNObeie7yF2rfjo5NnDMtU4/ZKHA6ManGSDSVXyEz1F7krlPmt8khHIcQh4HKzEQHsV
 E1LSuXQAkV0fR9CdnFkW4OZ7Y8bGHGM6hl6g56oS0Fvm2Ckj5/3GHlSgTpq6r2a+qTE50logks/
 4HcO5OBMZXI46AKL9q0XbdOiQ0qkv20Fm0o79fbXrBe2hsfNplgxLcBaDcYx+fqQatlai0d7hTI
 G0tfdCDuVjqwbdiSQjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110045
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,hu-mojha-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102762-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9786F3DE85C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 09:43:10PM -0500, Bjorn Andersson wrote:
> On Sat, Apr 11, 2026 at 12:10:41AM +0530, Mukesh Ojha wrote:
> > Now that the two enable paths are separate functions, replace the
> > pdc_version global with a __pdc_enable_intr function pointer. The
> > pointer is assigned once at probe time based on the version register,
> > moving the version comparison out of the interrupt enable/disable hot
> > path entirely.
> 
> That's what the patch does, but why?

I thought, it was odd to compare against the version every time during
enable/disable instead of clearing the path to take at probe time itself.
however, I don't have data to prove how hot this path is ?

> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/irqchip/qcom-pdc.c | 13 +++----------
> >  1 file changed, 3 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> > index 21e2b4b884ee..734576cdce0c 100644
> > --- a/drivers/irqchip/qcom-pdc.c
> > +++ b/drivers/irqchip/qcom-pdc.c
> > @@ -51,7 +51,7 @@ static void __iomem *pdc_base;
> >  static void __iomem *pdc_prev_base;
> >  static struct pdc_pin_region *pdc_region;
> >  static int pdc_region_cnt;
> > -static unsigned int pdc_version;
> > +static void (*__pdc_enable_intr)(int pin_out, bool on);
> >  static bool pdc_x1e_quirk;
> >  
> >  static void pdc_base_reg_write(void __iomem *base, int reg, u32 i, u32 val)
> > @@ -123,14 +123,6 @@ static void pdc_enable_intr_cfg(int pin_out, bool on)
> >  	pdc_reg_write(IRQ_i_CFG, pin_out, enable);
> >  }
> >  
> > -static void __pdc_enable_intr(int pin_out, bool on)
> > -{
> > -	if (pdc_version < PDC_VERSION_3_2)
> > -		pdc_enable_intr_bank(pin_out, on);
> > -	else
> > -		pdc_enable_intr_cfg(pin_out, on);
> 
> This style is comfortable to read.

Agree, code readingwise, this looks easier..

> 
> > -}
> > -
> >  static void pdc_enable_intr(struct irq_data *d, bool on)
> >  {
> >  	unsigned long flags;
> > @@ -400,7 +392,8 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
> >  		goto fail;
> >  	}
> >  
> > -	pdc_version = pdc_reg_read(PDC_VERSION_REG, 0);
> > +	__pdc_enable_intr = (pdc_reg_read(PDC_VERSION_REG, 0) < PDC_VERSION_3_2) ?
> > +			pdc_enable_intr_bank : pdc_enable_intr_cfg;
> 
> This style is a mess.
> 
> Regards,
> Bjorn
> 
> >  
> >  	parent_domain = irq_find_host(parent);
> >  	if (!parent_domain) {
> > -- 
> > 2.53.0
> > 

-- 
-Mukesh Ojha

