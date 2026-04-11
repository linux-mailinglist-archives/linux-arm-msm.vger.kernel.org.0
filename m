Return-Path: <linux-arm-msm+bounces-102763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id e0QlDV/w2WkMwggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 08:55:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C123DE8F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 08:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFAE830131CD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 06:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C45C3264F5;
	Sat, 11 Apr 2026 06:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idXEI6Ul";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PbAxD6tR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E7C2BDC0B
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 06:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775890523; cv=none; b=QBZmn7G3vvdm6iKgjI4NOoil2hDDZ4o8ZincFjwH+i5oZHf6NS6b8Etskn2rwki4vfeUKltP5rYq7D7A1klGLnPuE66qzfC77fBuOohO0HbRe2jDgoXyh1hAMjHr9AaAJTkR7+xaAPYEOJgEeIgAtGxW1a/RhP7pKFpg0Ayw3kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775890523; c=relaxed/simple;
	bh=MA5GTAanaW796ZrIDAwpmtb/vdrskv+s1zS/5cubXdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+7omjCrRtr9NFUTeyGuuj5AxSJm2eZk+fnv08gBjhQUAsu+p2ENWqn2Hn2hyfIQQWQw13hx3RZ8BFo4y8lrbIHJUuEKJ5NAFi9JjE7XImagBs1lpP7ugyuzKhALKJIE5noMOtGCgPYUFBMadWjaWqBdiE9VSTrcGRbFd6FTE9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idXEI6Ul; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PbAxD6tR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B43DQF620989
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 06:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hHKEi7uH4ZAa8e40WTkZOguWjTipDJeR1p4bGjZ8ENc=; b=idXEI6UlmKGRfxfq
	QwdM1iGI6ih4tpHt+IYgaig5Rh6jqXupsUNaRiQNXWquXyAe4Ozqhe31FQ+7tHfK
	pi0h8aAXDeZdh9cggY8a35U8j6JNc9UKfSkaxzkVNbD4tq2NmXn676ShZuyIIGHL
	4fRPL8Pc9/h/9Rew6kbLA79SNfCW16vGfBZnrYqYsfT9QZ5EM2eyzg51cP+ufLc4
	VL4s3BWS3cj++a1PAnLJNaSFn098OI05SKifd6S79OX7mGovP+uZwzRaK4eiuxPR
	OitCzpXjiYNYyDbVReq/vgdosj/xOiDxA4M6xDwYi7nbB7r5WH3ONt/5dHZGEBhO
	eg5BEA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfr8pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 06:55:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b249975139so56717405ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 23:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775890519; x=1776495319; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hHKEi7uH4ZAa8e40WTkZOguWjTipDJeR1p4bGjZ8ENc=;
        b=PbAxD6tRiPxroDC1lP7K7a0X+ycrzIjnM2P1/9sdoteLKldgh2agvmJiQiao29xzqP
         5BbNJw91IP4jXaT0K3ij7WPeeYYTKKTnD6jgvEIBhU4RScd1gpzHsS2dYdAPKtsgCLiN
         kyzDLy2BHz4aDGjkCf6CQmQ3i5i+36XOs+SBXCZfjdDQ0zJRvzijw//7xUIMDzRtBw0i
         nJju+sa+yzFDxQXMucq9FG6EFmLEIaMjk7UUTiyFoEZD0q6FWnqW7w3EmHFYZYApTux+
         7SULzocIAYzrw0NgKzu2wAqgdWHlVoVb0Zy7j6nstqWaApI9kYlWIewO6ONqqkB6Bas+
         Dbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775890519; x=1776495319;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHKEi7uH4ZAa8e40WTkZOguWjTipDJeR1p4bGjZ8ENc=;
        b=ERLTif2cKZQKfDzSchTjn98WZgaRVjv3Rvq9F7sESTf6HnepsxuNNeBqNK+70USKIo
         OaM4DK4bDI3DFDi66nz2crsa6nhxt985U1z2ZkW+OOFgPiWs+J3Cee/2M7kbRK4mfbHU
         EW1ZC4HyplLNy74oPNpnHZmmWt7TiZsd4yEhEMQbQZVWH97/cmJg+8dxYfUeZyVgji8C
         TDhLrd+vo9gvp0eHfoKv+EgNHPaeT9rGtCx9bQJZmMnFlNPJgHkU291fQgt7Rl8I90qv
         2dGjRe9TO8MQInCinOCCqU2E0YWEoMAX03iHhA6nvYqYe9c0XEPPX4PHs8fQvyYVcbZ1
         l9FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpcQ6keEZaTqaIgEPYpkuXBE7Udao/EbxUcKRUQjUBHyPmcPAw4UR4ADCkVZmq0Vw+PmrsGENGjvfJM8P6@vger.kernel.org
X-Gm-Message-State: AOJu0YyrP3DVNB1HLqveLTmkiL8qW0LDm58wqfQJ2E3mTWVGmJAyXvTp
	/xY/htujEbVuo730wwl6e8oiOeiR25PHlVijWUQJ2e0jXESrpOXYb2gwIKkOWiDSawGrANsrFnF
	ivzV4WHwcgJbc6FuMQc92V5ip1QGHRsim4Oo7T7GXrwBEOAB9n6iaBMdSDeJGMHwFx9ge
X-Gm-Gg: AeBDiespPmaDeHp85fpEBUqAoZDk9Hc33OvVMdKgCTZcMfqTAbq+5qN4goqcljQNG5X
	0TkK1QErxDrzSodeh7S+47w9bfuDRjTPJ0CuaRo3FbRQfuaqgrchUm7XCn9d72XiioIJFNxb2yf
	1TdebI2wJ3AcGxf0sEHnE3eb+6CDmMwGXRM8vH1nHKpJyy8uTALAjYinUbyjmAFEg8FynNhmzhq
	6A/fpm9s7bikCoqc5BizDSMEgxbk8EGmofKOda3VIvPmWB5cnrFyz6qILvY4S+IOnLjbHVr/GrU
	Ntzzn1A9thguYI/JXbQEHVekbAA7mDhy/K32vK5y9CHDMZTWevgz2l+Tr8Wgsn9ntn+pGl9iiTu
	ZFPHS5ygLCQ7mv0adC9NBjFkzgK7m1O7oRXJq9EY7wWwOzkNq
X-Received: by 2002:a17:903:196b:b0:2b2:4728:aa26 with SMTP id d9443c01a7336-2b2d5a78154mr73952035ad.35.1775890519381;
        Fri, 10 Apr 2026 23:55:19 -0700 (PDT)
X-Received: by 2002:a17:903:196b:b0:2b2:4728:aa26 with SMTP id d9443c01a7336-2b2d5a78154mr73951745ad.35.1775890518838;
        Fri, 10 Apr 2026 23:55:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f48d6csm64004765ad.83.2026.04.10.23.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 23:55:18 -0700 (PDT)
Date: Sat, 11 Apr 2026 12:25:12 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 00/35] irqchip/qcom-pdc: Clean up register mapping and DT
 descriptions
Message-ID: <20260411065512.eyezltamlqqgsgfc@hu-mojha-hyd.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <adm1uXe6QRes8DiX@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adm1uXe6QRes8DiX@baldur>
X-Proofpoint-GUID: bIfIh7Yt7_Pjt60qlcEm8GYeYr1MbuSq
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69d9f058 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=L-6A6lN07slBTXrf2UAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: bIfIh7Yt7_Pjt60qlcEm8GYeYr1MbuSq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDA0OSBTYWx0ZWRfX/5uVslbxDV5p
 MRip+Z48X7Se5mzvIFa5W0KD3qsk7nNH4Ge/CSTb3T6d9UkgjSIzTFXcyzoYcVOojVDquz/XcQd
 UEKKEoR8fnPRrh8e2wVH/JkSaQtD8+ynZLTWS5q8wYqSgP7p29JaY7FmXApDrsldXO2Favk3EFD
 9+rcjBLVU0PUE4CiFf8EJZb/ouZ+qftgqnLmks0xKwRPDYOf+I75T0WtFx8HNf6SFVJha1WHPJE
 VU9uzfOP1/QlpGMaIzN2poVLF2kd71kWSrKlAkBY1DRmhKywI50apsHbnivsmsc3WaFevRw6H01
 OXIbXA/hxQzCJvoGlvVtH5NoyC38c98/rZl2HVfyK90J553WRnXZ7RN9C8BIdUtkFUR6BWpHIuQ
 gJcN8P/R3SWmxTaMhNBASipAqCyizamLCKykjLlxGPJBJieJuA+LO//h8g42i7TYD/bA1M2C0xi
 IV4mrj+FCPrhX6ZHE6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110049
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mojha-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102763-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 74C123DE8F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 09:48:25PM -0500, Bjorn Andersson wrote:
> On Sat, Apr 11, 2026 at 12:10:37AM +0530, Mukesh Ojha wrote:
> > The Qualcomm PDC (Power Domain Controller) hardware exposes multiple DRV
> > (Driver) regions, each 0x10000 bytes in size, where each region serves a
> > specific client in the system . Linux only needs access to the APSS DRV
> > region.
> > 
> > Despite this, the driver was mapping up to 0x30000 bytes (three DRV
> > regions) via a QCOM_PDC_SIZE clamp introduced as a workaround for old
> > sm8150 DTs that described a too-small register window. Correspondingly,
> > most platform DTS files described the PDC reg as 0x30000 in size, and
> > several also carried a second, entirely unused reg entry pointing at an
> > unrelated register region that the driver never maps.
> > 
> > This series cleans all of that up in three logical steps:
> > 
> > 1. (patches 2-6):
> > 
> 
> These patches are for the IRQ subsystem/maintainer.

It's bad on my part that I didn't expect this to be merged in the first
iteration itself, but yes, I could have put PDC register sizing and
related device tree binding and driver changes together with the device
tree as one set. Like in the current patch series, it would be patches
1, 3, and all "Fix PDC reg size..." patches or may be the removing the
2nd register space change as well in one set and pdc driver clean up as
separate ?

> 
> > Split __pdc_enable_intr() into two focused per-version helpers
> > to separate the HW < 3.2 bank-based path from the HW >= 3.2 per-pin
> > path. Replace the pdc_version global with a function pointer assigned
> > once at probe time, moving the version check out of the hot path.
> > Tighten the ioremap clamp from QCOM_PDC_SIZE (0x30000) to PDC_DRV_SIZE
> > (0x10000) now that the DT fixes below make the workaround unnecessary.
> > Also add a PDC_VERSION() constructor macro and use FIELD_GET() for bank
> > index extraction to make the bit encoding self-documenting.
> > 
> > 2. (patches 1, 7-28):
> > 
> 
> And these patches are for the Qualcomm SoC/DT tree.

Yes, As I said, I could have done better..

> 
> > All 28 platform DTS files that described the PDC reg window as 0x30000
> > are corrected to 0x10000, reflecting the single APSS DRV region that
> > Linux actually maps.
> > 
> > 3. (patches 29-35):
> > 
> 
> Same with these.
> 
> 
> I don't see any dependencies between the IRQ and DT patches, can they be
> merged independently? Why did you send them together?

For better context, register sizing changes can be sent together
including binding, driver, and DT's as well.

> 
> Regards,
> Bjorn
> 
> > Seven platform DTS files (kaanapali, lemans, milos, monaco, sc8280xp,
> > sdx75, talos) carried a second reg entry pointing at an unrelated
> > hardware block. The driver only ever calls of_address_to_resource(node,
> > 0, ...) so this second entry was never mapped or accessed. Remove it.
> > 
> > The net result is that every PDC node in the tree now describes exactly
> > one register region of exactly 0x10000 bytes — the APSS DRV region that
> > the driver actually uses — and the driver's ioremap clamp matches that
> > reality.
> > 
> > Mukesh Ojha (35):
> >   dt-bindings: qcom,pdc: Tighten reg to single APSS DRV region
> >   irqchip/qcom-pdc: Split __pdc_enable_intr() into per-version helpers
> >   irqchip/qcom-pdc: Tighten ioremap clamp to single DRV region size
> >   irqchip/qcom-pdc: Replace pdc_version global with a function pointer
> >   irqchip/qcom-pdc: Add PDC_VERSION() macro to describe version register
> >     fields
> >   irqchip/qcom-pdc: Use FIELD_GET() to extract bank index and bit
> >     position
> >   arm64: dts: qcom: sdm845: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: sdm670: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: sc7180: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: sc7280: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: sc8180x: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: sm8150: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: sc8280xp: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: sm8250: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: sm8350: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: sm8450: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: sm8550: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: sm8650: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: sm4450: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: x1e80100: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: sm6350: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: sar2130p: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: qcs615: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: qcs8300: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: sa8775p: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: sdx75: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: milos: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: qdu1000: Fix PDC reg size to single APSS DRV region
> >   arm64: dts: qcom: kaanapali: Drop unused second PDC reg entry
> >   arm64: dts: qcom: lemans: Drop unused second PDC reg entry
> >   arm64: dts: qcom: milos: Drop unused second PDC reg entry
> >   arm64: dts: qcom: monaco: Drop unused second PDC reg entry
> >   arm64: dts: qcom: sc8280xp: Drop unused second PDC reg entry
> >   arm64: dts: qcom: sdx75: Drop unused second PDC reg entry
> >   arm64: dts: qcom: talos: Drop unused second PDC reg entry
> > 
> >  .../interrupt-controller/qcom,pdc.yaml        |  2 +-
> >  arch/arm64/boot/dts/qcom/hamoa.dtsi           |  2 +-
> >  arch/arm64/boot/dts/qcom/kaanapali.dtsi       |  3 +-
> >  arch/arm64/boot/dts/qcom/kodiak.dtsi          |  2 +-
> >  arch/arm64/boot/dts/qcom/lemans.dtsi          |  3 +-
> >  arch/arm64/boot/dts/qcom/milos.dtsi           |  3 +-
> >  arch/arm64/boot/dts/qcom/monaco.dtsi          |  3 +-
> >  arch/arm64/boot/dts/qcom/qdu1000.dtsi         |  2 +-
> >  arch/arm64/boot/dts/qcom/sar2130p.dtsi        |  2 +-
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi          |  2 +-
> >  arch/arm64/boot/dts/qcom/sc8180x.dtsi         |  2 +-
> >  arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |  2 +-
> >  arch/arm64/boot/dts/qcom/sdm670.dtsi          |  2 +-
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi          |  2 +-
> >  arch/arm64/boot/dts/qcom/sdx75.dtsi           |  3 +-
> >  arch/arm64/boot/dts/qcom/sm4450.dtsi          |  2 +-
> >  arch/arm64/boot/dts/qcom/sm6350.dtsi          |  2 +-
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi          |  2 +-
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi          |  2 +-
> >  arch/arm64/boot/dts/qcom/sm8350.dtsi          |  2 +-
> >  arch/arm64/boot/dts/qcom/sm8450.dtsi          |  2 +-
> >  arch/arm64/boot/dts/qcom/sm8550.dtsi          |  2 +-
> >  arch/arm64/boot/dts/qcom/sm8650.dtsi          |  2 +-
> >  arch/arm64/boot/dts/qcom/talos.dtsi           |  3 +-
> >  drivers/irqchip/qcom-pdc.c                    | 56 +++++++++++--------
> >  25 files changed, 57 insertions(+), 53 deletions(-)
> > 
> > -- 
> > 2.53.0
> > 

-- 
-Mukesh Ojha

