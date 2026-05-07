Return-Path: <linux-arm-msm+bounces-106320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePKiOMNX/GlOOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 11:13:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CDE4E5983
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 11:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2ACE8301CFCD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 09:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9DF3B95EB;
	Thu,  7 May 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aaj2kPf7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eaayxXqs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904073B6364
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 09:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145054; cv=none; b=PlWAPq/X/0+FeyCOjbfo/32bJ5FHwgbH9y4MsKCtU0IGGykZGUGTqvHWmRnTvit9/S/tEoK/ONTT6xwlOlQVwiSdEMWRscIPnKIYqfpBR38ivbF9J87uAP7ISjQmuytJuBjlHhHktzI+pr8l+a9F7YuPGVRMt4IrS+dYbBVMqVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145054; c=relaxed/simple;
	bh=cSbnmKIeK5PiH7jDW+BQqyiKxH8RY05vb4L396PVn/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGbthQ0pdwSBtRd0VgGMPik6IoJvNpfdOItgVZ4xlLCnI0j13S4uB6XpM9UwaxhOf2p4ibeJaIFwpmdu97knRJTLXRju/4hR5yt8XwBrmyl6B3Q9xKaWIPa9WTllqW/xlOpLF0QCgoVRCmYTHnwKUwwv7WrHt3cxke+Gcg98L0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aaj2kPf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eaayxXqs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475PsxV3924293
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 09:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fiLRyqVWGS0Ix+7Et8ZETjKI
	EZ4pzdPJfw5gz/TlT3w=; b=aaj2kPf7Vt70KA2i3+8H5rqr4GaTBRUxUXfFCAIX
	1wdBO8jPUfsMqMrznswtbQ2P2Sc+PW6u3Lv/QSqcGF6r0+iMf3u3kaQtK6o9hdEQ
	CbqLEGnxg2KU0oLYXWLl4EXauJIGscXmUQ7FkaJ5ATmeVNCi9CPdyPreNdMhujls
	lo2BJ7dWx4/ULLNGvksEnomZ1gSIjLo9AVuTUsGBgxibOK+a9ikaCy7nV2o1vnKy
	+7+q98leDPrDHpE1aow5LsCT1+nLVzy8Pwfnb6CvPbz7NcYllukprl0QwQL2LNMG
	cMQ0cNd/S3qW7IY5fCfePp5fy9uOvRNQhHlP8BRedEPrmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c88ad1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 09:10:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eb04352924so130459185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 02:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778145043; x=1778749843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fiLRyqVWGS0Ix+7Et8ZETjKIEZ4pzdPJfw5gz/TlT3w=;
        b=eaayxXqsFRTvarNydVcHFRARBFPSw+J57YxMg9pETfh8Dga987mHzV4BWW/Np7q1u6
         g3MtwRlgZ4/rQksxVHQQC8hyu5qCqtpMHtKyd/wNSMP8q0I6bp86lycopKq+FeOBuKPo
         NpLT19srU4rmTZH1UMu+19x9fCIuFl9TIfS1sdKzQMGIv97rsHnoH7SWVVHEjjqsZywM
         Sxpft5Hd5cGHKWV3zLyFrAyDiFaSJiq/qQhN3Or2GP0TXk2ZJ93X7KCxnZnPEaxGHYwv
         kf7u6M0+fxHKa3WueAMgXYneJGNfFvv1cPPfyy1cFfYmezT+GzBajtZi47wIu8toiRii
         68ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145043; x=1778749843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiLRyqVWGS0Ix+7Et8ZETjKIEZ4pzdPJfw5gz/TlT3w=;
        b=JjZaQzCyWbhadttpXT6KJchQsbkO5EKgOPJaQfXfPilWBKFnF/BpydZS0FmE9kaxpO
         h5T7l+tSvr1RqGctI8+AksKmh13VNSC/Ub0N/Po/OI1ryyd3vWdU/conIzmhO9wgSjuu
         F4ZXPUoTEP7FbUuC9QF+3rCWH3yCF+Y4/tfcWRNv5kAh3mkGNu9+jnwm9A0HP0FFx1vT
         jipO8lZmIYlRaVgLs60CXSUJGSKqyUNurOoSEFC4BVp9+UVTajqzaACYzm6vXMvNs0Xy
         omqb7U7+YvrYVmPIB734yLpc6ZyWtqyadJ2XPeOF539uTWivEBDf2YzkWEMZUD5YyLwK
         fTMQ==
X-Forwarded-Encrypted: i=1; AFNElJ81yZA4t3wli+P0vsFUbDdJjYQMvgsWrzru084/NvuDqxizFKfABxvbo1U6xe5DhjS250UrHuAyNbhgJrHT@vger.kernel.org
X-Gm-Message-State: AOJu0YyiehbljMqdvKY3a4Kz6FbN0djXVK+P6rkZ+5Zl3Pds7UJaErx0
	FT+hbEAjYcTrHT/A+gUQMNMWXXhnGiuKX5FRIheni/AcckCswskBB7lD6TLyh8vZom8oZXTBou2
	XFyCaK5FQvWkrST7mHBlKwRKWcq7IhwGgGSOtluUErYQ4Z4JpEa72EmBqF5X8VcBeoYWl
X-Gm-Gg: AeBDievCSsvvZLnuS8Cab8bRZoa8/aevyYeyYUuLSu5Ga5/DQd28Xv0jV6rreU8kpS7
	1FHqhxCd1cCyZsWj7qOs0D2V5pAvD2recXrJXVm2Oxr8g9Re9Pe3Eg+z5xLTK0T6ihGqobvDIWv
	rsG4ytRVKLngaTaMhNopcrhC+TYXZcgVPA1uF7ZO0mrUG+9KR2ReMjZwAkOKEowAE6888T2AHBn
	8AN4bg6Df+jqDh682r6QhsjyKvx2GBZZE3xlTOmvla9CNgCVFfTRGY+tuer+WhLcMTIVequ9fJw
	wg6N5gSh/Rbv56cIFIKGfVnnXGueiKigj6/VTPeuVMalWrYDDeaaGBaruaV5iK0WiBjWY22eUzc
	C/6c1kfEa1YfbxhpC1Xnncq0lYj9BYMg93dDCyrPMXvme1/ge1t6dN+5SLmII/BGNmNT2B3I2AR
	6N8BLkYW6NO3zqtGnGTYDv2hwE6cvij+5q/Ce4EyGpCynhUcUpzFxdvUhP
X-Received: by 2002:a05:620a:2848:b0:8d0:82e:7423 with SMTP id af79cd13be357-904d69d8e00mr989744885a.44.1778145043099;
        Thu, 07 May 2026 02:10:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2848:b0:8d0:82e:7423 with SMTP id af79cd13be357-904d69d8e00mr989741085a.44.1778145042666;
        Thu, 07 May 2026 02:10:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86e65fdf6sm3822632e87.78.2026.05.07.02.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:10:40 -0700 (PDT)
Date: Thu, 7 May 2026 12:10:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, jonathanh@nvidia.com,
        thierry.reding@kernel.org, digetx@gmail.com, conor+dt@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [RFC V6 0/8] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <mplk3qvyslzazuolwlcgy6fb6ta7ts63x3dq5wwybyejaxpyh3@fctfzjkyxi55>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ocBOvJyGXtF3fTpDsBcuPRF79vFz4vhv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA5MSBTYWx0ZWRfX/oaueqZmEa3L
 DMhdvyKhIYJvjXR1Peo9BPjBI4QG24KNNuWmqfd4leJ95DfmguQKaQ0VMiQQ+l68pEAeT0uVYT0
 m42HYkMSQHLkAMpaYy1/tmAHJttIVWIcj7TLrWvTl7KR1EbGwBuTk6FAystOhtCJ/hDJzD3TILX
 ouGsm2LJBpPwfmb0oJ1PRqaEvB9uZmMa6jKn1HVMX8TwZaPWCkZr67ReqO98ZiOFhgnnAi5jM2n
 jNCptXzwejcrL3ReVINeoLYrKK47RRmzgBVbMujLSdwpi6WJJZX5/i5RNuSg/+EIn6AYDKoLgWX
 jJ84L6CzyEWwyiXRgyTNaWsNjt6MgS9HCzoWXmNHLDykHvfbWdUXnPMG/rha4+U2gC4WovpPUxk
 WksfiZM0A3Na4CzUvZGfE/FPhc1VSPeYvsW5sa4rL9EKg+mXcvV7sXwXD3kL3snZMaSh5NBKwE0
 wFM7u34faPKCJ8ELu8w==
X-Proofpoint-GUID: ocBOvJyGXtF3fTpDsBcuPRF79vFz4vhv
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc5713 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=RJIkCpciCD5dGSa3Y80A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070091
X-Rspamd-Queue-Id: 57CDE4E5983
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-106320-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,samsung.com,vger.kernel.org,lists.freedesktop.org,nvidia.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 11:52:29AM +0530, Sibi Sankar wrote:
> The QCOM SCMI vendor protocol provides a generic way of exposing a number of
> Qualcomm SoC specific features (like memory bus scaling) through a mixture of
> pre-determined algorithm strings and param_id pairs hosted on the SCMI
> controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor and the
> mechanism to control the various caches and ram is hosted on the CPU Control
> Processor (CPUCP) and the method to tweak and start the governor is exposed
> through the QCOM SCMI Generic Extension Protocol.


Could you please clarify, does this apply to the common commercial
Glymur and Hamoa laptops?

-- 
With best wishes
Dmitry

