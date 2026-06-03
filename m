Return-Path: <linux-arm-msm+bounces-111070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6nbINzS0IGqp6wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:09:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D7C63BC11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:09:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h8mcAIA8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dm4aP4SZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111070-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111070-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F33463041A19
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 23:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF914DC523;
	Wed,  3 Jun 2026 23:03:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7173B47C9
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 23:03:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527782; cv=none; b=thIBrtBHXwlRK97KU/x6BjDRxkjxz0Swm2bCzZtiwRzhnDt5+2NwLynaWv9BrzzED/GwH9SgF2ZRzXlFvcir5lFotwjB8zqjLbosFW9k0xjM8fYJ8e6x2rI2YXW9XCnFqAPyza+v+s+FH9Jz+wx1MUA8j2psAPhMfjPqt/FxX0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527782; c=relaxed/simple;
	bh=Jx2jRb43wKw1yyTkO/1kCiaxaveGFHfr3mEoKoo2lUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBoLMuN4TAadvhUYAu7FvQe40d9STtu0PKWnrLdfVIy4MW3cZ+q3fHa1kJyMQ441+5bYpj362bfuxwijuCsOCu77YYxriCU4Lc9sdAOD3d14EpYYi5orjXOW4msqEY1c9GOvL758vU27GAnD8pE9osTOCyoeShbZLcU9eY/05Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8mcAIA8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dm4aP4SZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653EcCcv1477935
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 23:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JeN5N58iH3KPzWRzuASBqAKPV6sY1na34kyQoy18huE=; b=h8mcAIA89dCTJUqj
	1ohXh+yidK6GjxzkE2J/mtkGG1R5j6tMMsmyqkZujTpPfbjoyG98Pb6glQAdOl7N
	8O8eHjLDwCpfHsB7Igen8zzJ7pm3ozGC9LJvq/2QQfGseplwghyq1T1x7df0/e0N
	M0HsbfrHi89AtXYF0h5hHZDYfZVmHk3wjFAJDjSX8y3woNwYEUfs6owvJEpsygQg
	ds8NXRDt0aj+bTSgRD+k/ctiFtnsJ2KHm9hPSqKGlIrURum5t2ZH4gpEqCu9Hf5S
	UgWf2ZH+ztsKfKJToDqHt4iLH2P/5grvvf8zoVk8EIqZVE3+2MmgGvnni7f1CNGP
	dp2Rug==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nt1m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:03:00 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6cb279950so77630a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 16:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780527780; x=1781132580; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JeN5N58iH3KPzWRzuASBqAKPV6sY1na34kyQoy18huE=;
        b=dm4aP4SZqm9wZw48EMhFAVLEFu6/k50ryD8G/QcoxmAOi0R6VcXup0+SP7DV2F3qhm
         ZyDIJn/SDE67+G4vtShEIkALyhxvgqKY8u1T6uaGxPhMMhkAHh/n3YtCUfRsfFzi2Lh4
         5KlsGUaGbhDBI9z9YO/PfrwtZzfk4r4iEWTin4RtGydnoc2+oT22YpJrWOpnGccFTjg8
         KG+BlpbrWIrivA9F7cx0d2q0PLl45BwJAd710U2PfYhhrjTsPmwEwf/aifh8oiHQ2Hax
         L0tqW5Dm6Hw9cDXs40C7hzBDUT73SLxngP6oJ25dD/wHo106c1aExS45jliL0dZRt91V
         Vnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527780; x=1781132580;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JeN5N58iH3KPzWRzuASBqAKPV6sY1na34kyQoy18huE=;
        b=jdRu8b1G84xQ1r8/Ur0AG4mod8Lk0x5TVRIVWpJ486qZErIJeC0o+GHqtHmU/ZSpCH
         n30JpEutV3fwOzqJlcipC7NnFoOFRZoHNTTLkb/XxO494ACjMQtj1uL40Z6tjRHkRTjx
         KIc4lbobGHo8qwENS26U2VBd9Ifgc7ChEFFrhhSPtWz6b+L+dGfAcQEMjprqR9GgpVj3
         Qad7HxMadJh5hPVlJRA/k8IspI9hy5F2qG+yuGhEHv9mZ7OvBePbPEiocpAh9VtT9hGz
         3Psx9OLXVP1Sr8RoIXZMvZMmzrgHx6r0XKAwJqnNfy2rKIvUR9NhlWFlO/oguy/QthGx
         pAEA==
X-Forwarded-Encrypted: i=1; AFNElJ8ApXoqfcnEr8m+gMGte0HELGi5yhEQ6Ktuvf7945Q7uqfeHPascxEqR1HvgkpcRz9B/ujloVWEorSrvCSG@vger.kernel.org
X-Gm-Message-State: AOJu0YxIEVsx4pNuLCk3y6vGxGB6W2qjGEu9b/NDxUUCA/VHpb5Zkk26
	+O5F8/Wb75nvmDgQMdFpNhGg5lLDFcItW4EXtcVja8bx/+jZabH1ALsm48KqlGefDo2HVyc1qbM
	QmMH30h1E1o1yi7oGlJ7hRahUMes9YmH6P94hr1wTc4yirHz4b3yg4SHZ0LAGuiJpvHln
X-Gm-Gg: Acq92OF2ViAfwxIJFqJ3ep2mpyNpfEe2fa/RN2geCRL5IhBHG8vXaJNQawb0/LlqhiX
	Vpkris0t65fiYX+39UAHDCu01vy6aBVX/nk1Yrvcdzw9NG9Kasbexzc0Q9tqC3q0n4cvq9ZV/bt
	YqfSHbsKzUTF+Wc2Bc2yUA1cxcHVvnZfuvO1zntKxTP4ub4L+RidQ8nCI8wnaKzuX4fF0KY5zHz
	z/EMwo066fx3so0tUjnXPV8FxByi0zOPZOXSNWXGmfVTfTA2hHIDCCgYCwUu6+n7Ycmy4tThf7w
	FP0yinJth3rr8aZUmACaQSb5ihWgeCqOJ/Y6wlq/MHK/NrRhmJ55LB20ns0laYN246JfouDARvR
	wasF1yxIPhABXTToqq3oa8BaC3S3ckPDtULSa/iSjaL3vzSkYkVBOQ8zj5HUqYkCGVzfNZvgZQ0
	iHyGgiUuR2DcKiR12hiDf/HIWfNVGWRY7+7dV//Ft0+TTmhw==
X-Received: by 2002:a05:6830:6d46:b0:7e6:dc7a:f459 with SMTP id 46e09a7af769-7e6e9b41683mr3482493a34.11.1780527779694;
        Wed, 03 Jun 2026 16:02:59 -0700 (PDT)
X-Received: by 2002:a05:6830:6d46:b0:7e6:dc7a:f459 with SMTP id 46e09a7af769-7e6e9b41683mr3482465a34.11.1780527779262;
        Wed, 03 Jun 2026 16:02:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac34sm879928e87.39.2026.06.03.16.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:02:56 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:02:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: github.com@herrie.org, me@herrie.org
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,usb-hs-phy: add
 qcom,vendor-init-seq
Message-ID: <46lrfwoahgzoudq3afnhv4kxqs4fwj3w7u2dnx6ns6soo6pxt2@qkqbelan2iwq>
References: <20260603054809.565723-1-github.com@herrie.org>
 <20260603054809.565723-2-github.com@herrie.org>
 <ti5p3oreibkae4pl5sn52g3ctv3ufcs6aklwgbterksrxvxrbj@b6scawz2cqmq>
 <66905f4914dc022629158ac02df1c7df@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66905f4914dc022629158ac02df1c7df@herrie.org>
X-Proofpoint-GUID: RW1uPWweOwTU9rM8pXGxZ4TYuGUO92rJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNSBTYWx0ZWRfX0GeOE91jlul3
 MypkP3ZcXsySe60jeoQBvFwzArHgxHi4h2jHYBnUdtTfwQiOHcKgi2fQnVr6+cyt8UdN7TKCbC8
 Z2N4WIWodn76BB4aLeSC6rkbTGQx+M6FXF6GwEIDf/WIAdH8ypmN1GbMjF2mmxSsOScYJaS3Zn2
 y6WUn4MIQ/jBJe/f+1XmLmtZEkRo7AJWdjp3f3Gr+hADmlWnwP1SED6SWw4UODQbAoEaPHpLA8S
 OPqTav4uoBnrs2v7hmqna/W7nVsfM2ihdhmHZKfiIXh9geslffvmxDcR58F1t4wqPtq832pnM4V
 FkihrxHMRPmkkFXoAUlMJYwVuCRXAVuiLvB+TFMwYuCacspjY6aebMEiPdr6vXDXf4iBmFU+Qvb
 8YF+7hDLg664hDh9jESAkveWm4bAtMhXiV6xO+eopzTYnYgb/BDBeG+Ye5g5dNEdVnYM/VEFH3k
 2WPcEoNEkb8dpHdm9Sw==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a20b2a4 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=cTwmTnRGAAAA:8
 a=q7v_v86hoVCxAHImI00A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-ORIG-GUID: RW1uPWweOwTU9rM8pXGxZ4TYuGUO92rJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030225
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111070-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:me@herrie.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59D7C63BC11

On Wed, Jun 03, 2026 at 06:09:18PM +0200, me@herrie.org wrote:
> On 2026-06-03 15:57, Dmitry Baryshkov wrote:
> > On Wed, Jun 03, 2026 at 07:48:08AM +0200, Herman van Hazendonk wrote:
> > > Add an optional "qcom,vendor-init-seq" property carrying raw ULPI
> > > (address, value) pairs that are written after PHY reset.
> > > 
> > > Unlike the existing "qcom,init-seq" property, the address field is
> > > NOT offset by ULPI_EXT_VENDOR_SPECIFIC, so the new property can
> > > reach the standard ULPI vendor register range (0x30-0x3f). MSM8x60-
> > > class hardware needs this range to programme pre-emphasis, HS driver
> > > slope and CDR auto-reset bits the legacy msm_otg driver used to set
> > > via platform data.
> > 
> > Are those register writes specific to the device or to the whole
> > platform? In the latter case please extend the driver to write them.
> 
> Looking at every MSM8x60 reference kernel I could find (Qualcomm's own
> msm8x60 board, HP TouchPad / APQ8060, and some HTC/Saumsung MSM8660
> devices), the writes split into two groups:
> 
> Platform-level (same across all MSM8x60 hardware):
>  - reg 0x36 bits 1+2: CDR auto-reset disabled, SE1 gating disabled
>  - reg 0x32 bits [5:4]: pre-emphasis at 20%
> 
> Board-specific:
>  - reg 0x32 bits [3:0]: HS driver slope — HP TouchPad uses 5, HTC
>    devices use 1. This clearly depends on board layout (trace length,
>    connector loading, etc.).
> 
> So the platform-level writes should move unconditionally into the driver
> behind a match-data flag for the MSM8x60-class compatible, and only the
> HS driver slope value belongs in DT.

Looks like it. Please hardcode the value for your platform in the driver
(with the comment), meanwhile we can try looking up the actual values.

> 
> > If you have questions regarding any of the bitfields, please ask here,
> > we can try finding the data for those.
> 
> One thing I haven't been able to nail down: every HTC MSM8660 board also
> writes 0x0C (bits 2 and 3) to ULPI register 0x31 via phy_init_seq, but
> the HP TouchPad webOS kernel never sets that register through its named
> platform fields — and USB works fine on the TouchPad without it. Do you
> know what those two bits in 0x31 control? If they are needed on CI 45nm
> PHY silicon but not on the APQ8060 PHY variant, I should probably leave
> them out of the driver and note why.
> 
> I don't have any technical documentation for the S3 SoC family, except for
> the legacy kernels (HP, Samsung, HTC) and a bunch of various HP TouchPad
> variants.

Again, please use the value for your current platform, add a note to the
commit message and to the code.


-- 
With best wishes
Dmitry

