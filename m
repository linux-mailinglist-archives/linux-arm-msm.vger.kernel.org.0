Return-Path: <linux-arm-msm+bounces-103494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NhXKe7y4Wmv0AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 10:44:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BB5418DD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 10:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6389931B042E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 08:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEEA347516;
	Fri, 17 Apr 2026 08:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBcqJZLP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Crnm6vJf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146633AA4E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 08:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776415045; cv=none; b=GTcOJ6i3SfJVVbr6X+R3d8t7M1K+n9SiCVG8ABklGoCVNKTlgiju85u9e/fE1k3zUmc0uGLm/0lynHnJV1sht3JAEvgkXo8QQairNY80nlP1GaaVIO0JowPjJFYrWh2bY59lARyyIEJL4atkDF+mCZo3zrFUWRKD/nnhn+Sxhpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776415045; c=relaxed/simple;
	bh=BVxjh68em0az58FU1jrP0G+gzsY4QKCU3HCqtJcO5Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GClJBmZ1hNII5ZFEU5lwxbZP+xWEm5269JEwLaru9CutcitBuAEqyDE/9Jg+rYazhrFTT+8uwiAJ57oexLjCYtVBmngbUbBaS5ikClFM5MIWt/ZcCDElhDbinEt79tPrZTXNCzz7EFUCD7Zs9gdv6zdVyu4K7TejfBN+A9YwbeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZBcqJZLP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Crnm6vJf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H83DcO4018563
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 08:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SkwW+wawVYdZl7fcQDXL0hxc
	DpeGGWi7KG6nFvjMQ7w=; b=ZBcqJZLPLgXvqjUjJ4KFrWF8byNqYoGVTfRZApfT
	MrJkH7uijmUJkeqNNuVZ1nkzpKAWSSQ+5CL/s4sCwgye6VAWf5pYJsEk8XYKWb8e
	XHtvULAKyTPaUbPbuHCAcL/WO8UaBgLRGXIy0x9U7kuVyITkL+DWpATh/uFKdexN
	pZtMLQwI7C19HBBrwzQuGRAiGNZrub1Nxtih/pBu643XE66Kko7ihQ7GATRCivXS
	qmnNWp8M78gwJr24IgRDgkPY2Xgog//zgUMW7d9ZEPUa4qG6eP6qkot8loH3bGaO
	oKtgEYpyHBgK8Cdo8foWtdJMVQPWjhaN6CZtywdtPx92gQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk11rbgge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 08:37:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f780a13c9so425632b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 01:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776415042; x=1777019842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SkwW+wawVYdZl7fcQDXL0hxcDpeGGWi7KG6nFvjMQ7w=;
        b=Crnm6vJf4iJg+Dse/r1NVly+BsT7mLuCFHoSd6qwUU86I43nET43Gys+RAmQCLmlsO
         iJGdG+dGHbXUd7VKK5QjZnhU9ncr36L6fY9PiyjVig6ulCNckqTju0TuS5o9Ys1uqlxO
         DR7RIMAVFreFO5wLWwzgJVD1acKRuADrWzyL5mIEqrY/XS3lrwdTxxANqkg94pkI7QkQ
         Q0amItOW+93uLjDnyDSS5oQY11aDuRNZVyefLR9vV8FYK/d0p/eL4yEuHrfn52jXPh3+
         X7cvvnqfs5WxweZa13JIStOVN+VCH1B0mJzWJd1Hjynf599UJ8NpzJhm+TlkPQxu8Rk9
         bFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776415042; x=1777019842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkwW+wawVYdZl7fcQDXL0hxcDpeGGWi7KG6nFvjMQ7w=;
        b=NLzUEimMFuQqfCR3dCVZAWakNUABpYPqwdlzlXUR8bEx4+R1bNyHXbTbLYbScKguLH
         0C7m7pCQIwnqU71NpaFPUW0NBoEedTOGsswXwQY7a7Y3Ndt3q1z5h+N/WB0JC2KrEC88
         1yx9n9n59ZAWN2g/oyCOZNrrHtPXTvwDpiWKNQOL3aEW5i1n+QD3/BAv5m6KHIosNGkk
         16cVqHJFSCECVIM8rm50rQzKv9hoy7l40Aoywloc1ROHjQiQDO5/0qDrbPg1uUvahyNU
         uV6LCATAy3BhmIlfyQBBFXBID2o2YvkRwYhlzZQ7v/vLZPoNCP+YhLyDCVWNhwW4/aAY
         5JSg==
X-Forwarded-Encrypted: i=1; AFNElJ/yOn50iI2mtzW2yk98BX6nOHJLoeT6wyQt5Rp9gqfZNs4PxGH4E1fS7z0T/QgxVRfYuL+1cFBnt7mE+SnH@vger.kernel.org
X-Gm-Message-State: AOJu0YyrwUhNdSr9hQJlYH/pmJWBUKViNnWpkKRSxrcqfsAZgyhk4FOb
	0U7IQ7jt5htfEB2lSkh/WHFjFW0Rq3F3nZ88f9SM+6R5nf8CaGnY3hL7tDuOt6J3MsXumvUIcSO
	m5Sey7M04We8od/a4/A1OLxnnPQHMqkKVTqRxlE7JrRNqpMlZKXOnso4VWr02Q2G73wrT4z9QHV
	bAYSs=
X-Gm-Gg: AeBDievUdpQZeMWUgu49NcrihM3bGkQyyXTCTjirlsdpk21v20TMuxo/b2/VnXCWxNy
	K5t7QNmDMX0V0nsovrHQiWydbb0tZpjCKu0ceAaekcGGO4gOQ2p9OPv5N1yVsLFr5l8VuFPWdXS
	78k1vADnXEfC/HeaxBADgue9nhz5yxsxTO8e9COqtFMTRewBmq4IstTL4nMVmOaW4KmZtFL8IO/
	vMtxcmusb6SWZF5Tt64oaG9+lqMoi4oPlSsFpoODQP8snw2OACeQ2CnKZ2D9FSyMWtAKu9Y57Gl
	IZyhHe8LaCcbMNl8egx9RvSAMbbO3b9uiU8SA4sK+tAsSuShnUZfmxryCUfdoss9Ak1xW2xHCwp
	4S3sVTpCbtSIBWj3zrK2yPMdHu1H6GDGFFa4kX1T5i4kPnmZIncM26ElpVGAF/VxgzAr+
X-Received: by 2002:a05:6a00:181b:b0:824:b304:2d1e with SMTP id d2e1a72fcca58-82f8b389d04mr1812035b3a.8.1776415042590;
        Fri, 17 Apr 2026 01:37:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:181b:b0:824:b304:2d1e with SMTP id d2e1a72fcca58-82f8b389d04mr1812004b3a.8.1776415042092;
        Fri, 17 Apr 2026 01:37:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.na.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e7d378esm1298421b3a.0.2026.04.17.01.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 01:37:21 -0700 (PDT)
Date: Fri, 17 Apr 2026 16:37:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm UFS and QMP UFS PHY
 drivers as built-in
Message-ID: <aeHxPALfVd7SgtUj@QCOM-aGQu4IUr3Y.na.qualcomm.com>
References: <20260417035509.1021860-1-shengchao.guo@oss.qualcomm.com>
 <898874b3-fb73-4a46-b440-6ea3377c2f2d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <898874b3-fb73-4a46-b440-6ea3377c2f2d@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA4NSBTYWx0ZWRfX0YnAlRWb/7aH
 hbPCTooIzAFC/t7U+y0c2kxjoXevUnaVhQ/EaFRX9XhTfeQ/JmKrBOiYyddHJCH8/wxbRn5sIYV
 JtfE6KSL6WgRZdmduRsgdi5hZaP7Clsa5DQgyVnqRSuHEA/DKJbrmX1P3St2LpXO79ymMirgIRN
 MKpWG6K3hydfXPGxjk9BHuG+YKgGHAwNsnYfzPpkzafOXloU4noy8Tzkw5HaOltZTuiprBA31/b
 NZo7KVZ6mQLnzpp4nuSbzKM4LjtZG2Itd0MN3LXyADgAEJGt5kU3+DJCCgVP/ndZoGNDl71oRyW
 yQqVc1rcToPZSTtIZ6065958KxP0apnTT5V+imbS6+pUXpxXmqB6qLe7qoEneqYg6gPiWxFJk+C
 MEpYHQLsE+qQXRXs8ECbVWFYZVTdc1lMz70gbtpJ0GtFhQLSfDSUjgqF2rNjofverWYHsUqIsdN
 2RpF/8t+mnPRewFBnqg==
X-Authority-Analysis: v=2.4 cv=ZPznX37b c=1 sm=1 tr=0 ts=69e1f143 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=dTotpg8-h-tQacFbK9YA:9 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: iDBW9plZ57ePELMp1BQGFbvS_HE4LPzk
X-Proofpoint-GUID: iDBW9plZ57ePELMp1BQGFbvS_HE4LPzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170085
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103494-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 04BB5418DD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 10:14:23AM +0200, Krzysztof Kozlowski wrote:
> On 17/04/2026 05:55, Shawn Guo wrote:
> > UFS is the primary storage for Linux rootfs across the breadth of
> > Qualcomm development boards - Mobile, Automotive and IoT.  With
> > Qualcomm UFS host controller driver (SCSI_UFS_QCOM) and the UFS PHY
> > driver (PHY_QCOM_QMP_UFS) as modules, developers need an initramfs
> 
> Yes, you always need initramfs and every developer has it.
> 
> > to boot from UFS, which adds friction to daily development workflows.
> 
> No friction, it's both standard, easy and all of Qualcomm and Linaro
> developers have it solved long time ago.

I'm looking at a kernel regression by running git bisect, where kernel
version string varies for every single boot.  How do you usually deal
with it by using initramfs?

If using initramfs is standard and easy, I wonder why Qualcomm QLI
(meta-qcom) kernel has UFS drivers as built-in.

Shawn

