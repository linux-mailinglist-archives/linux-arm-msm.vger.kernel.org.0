Return-Path: <linux-arm-msm+bounces-89746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35804D3B78B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 20:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 337E63016EDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 19:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D4B21ABAA;
	Mon, 19 Jan 2026 19:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbAt42zC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MA0jIyGo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559881F4C8E
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 19:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768851974; cv=none; b=nf2iyJ3mBG2PQnx+tM9sK9rP931AmCg6B1HoTegC33+/oiDuPZsa+lHXB9CngsyGWMJpQhLexUh7q+bFbntfDglirDIiKGW8y3q9/jpsOq1Aa4mIw+kFGLxJnASbhzerdBqOG0fQyEwNxkM40Al6VU3+BIeYu/chZ/eidtLxzfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768851974; c=relaxed/simple;
	bh=OrCs3M7XbcHaHB+WFTqGGYi95ZT+gm3Sb7kAwFX3USw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOf8ETZKDxa2+zQzhQhcFrjepS7Nv+8eBWMOYZuCXAOXEVwwBss3iM4ahVyeRbfrkNt2WclqO5/+3gG87SKaSWISfVGhbzQjAFh7661kQ1nVovSoifaXv8mvjwTmzw0CkgB9gMwa9OUtqynU7gEiOFS2OIDO4HfU5KwtrI/GClw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbAt42zC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MA0jIyGo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JDdAn61347376
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 19:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KjLqg4NCZW5HVeSGJD2IDu7K
	Y/jOeFMsx7bzNX3Cq+4=; b=mbAt42zCnE2LHYfx94GGHwF/iecPPZ7e0bX59MPE
	8pgi7v7ShqAvBHkJWoUGfeFqGGEuWmU0UI0F81LaY/j5EQEzZH9okL8yJlbkZiKg
	gRBzcrWvPtR9eUqxbERBJzRXBnaqCVWH0QUaLgq9o0aVzW+uIUmbopMsQjyGkoXw
	hfuaX9CHH1lPVXQGPZzgQ3F11Mnjd3a0ZXofTq2Um4tfOZbskgvuayZE7JJU1EsK
	Zx9w0aG5ZbQ4edPwkCQgLb9CifBRoNMYnIOrb0LpJrlGObnmMKj6AHkpXPSGq3L1
	TjQ/Es1XeS6+YPlyBQTESK6iXp1XTDbl9swni0KqapgoJQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsnpdgx2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 19:46:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6b315185aso788820685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768851971; x=1769456771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KjLqg4NCZW5HVeSGJD2IDu7KY/jOeFMsx7bzNX3Cq+4=;
        b=MA0jIyGoBCJzBMDbmbgUzc1DUh0r4bc3xII6mdgGnl6VmMzLniKjbU+tD5iV06xI7J
         /F2vKLXjmfu4srfGu/OG8e9dGlUZwMwdhjk/MnO2jRgSNJKrY3U1/bGjNJAsd/5w4SMB
         GYEWuv5rTPdYKuZXoOImtwqAXcxO0oKIXIQ291F2HPlOIXvVaCODRGpadyUMGQh4pC+Q
         C/BRDWRe2rEcHbOK7ymukfvF0WhKB/qvxlevteE1MagIK4sqdfghh7pLbXylGmEBcY0n
         F+/9mJwzi2xMwKWEmkt7OpMOVMT+I0k3HKU6lSMq1b/jaHunHz7ZSmYslN/UJiFAMHWL
         E7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768851971; x=1769456771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjLqg4NCZW5HVeSGJD2IDu7KY/jOeFMsx7bzNX3Cq+4=;
        b=r1McBPzEji1Tom7dhOq4aXXC6KRMbGwyR6iMvdLQ9+geXOjewbDEjK3WcxV7gCy2+6
         yUPtRLX9MKGuPo5q5HUW4tk8nENA7gV860AK/rkuXkXY1yppYj1uRrw5DaqWrO7OJwTN
         WvofXweJNnU+YOIBZ0V+n+lIHs9jYAuUR85dpmnZTYfz7Xq1tL/IH3MirWR1w+dBBk3P
         Q5uSnkEt+AYdFjcuUzGWPeUW/bSPo79cI/1QhsqvkqYW5A1rzAYLI7/bjeNvAX8QT2QC
         AClaqM6NJr1MCyM/z4vudD1Jzz7SoUUWZ+AnzhZ9l69dTZcLXXkaZg9+vWOHZX4Q2L7T
         0PtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIEMCo6H/eDQnnNIdwKnmIFQYcYHqNkVigRERjtcPrYjMZOEJL0suQUcjPJPYcMVutaayHF5D114N5piIG@vger.kernel.org
X-Gm-Message-State: AOJu0YzuU4uOzRfqJuLrwwG5cuC9UuAZYJ9es7lk/WgET2pN9JPfW0bz
	9qXXFxLuAX389kuJf3wiPkU55/EG0l6Wr6rkZktQrwv6TnJfMWXG0bDgszpdykFpqR/qpfvrS/O
	0XFsg9QkyVk1ECn+7lg1l23t56mr9WPa0P0Dc4+D5AU94Q2J5qFAlkYQknDvlGIOU1RG1
X-Gm-Gg: AY/fxX5hkXsJPjcS3dJ5243aGe+BXQyL3nOcux03TdWy0phX941Y7X8FwqaHUXov0sa
	QKsJelS8v6D9bswbJXOUpd2jSX7/FwRgBkXApLk7Ox976q7cgP5mh+RKDdLfJssAr/SE3X72q44
	ush/FenuEBYS0e1Ti11XRp6v60l6zjwtgGHNniAJ2mxEcqzNEg1RBSIhcw4NxWtfwvsOWbPrHkC
	ZzUERdSUAHtvk77SFLlEaJr959UqP5dEgv7RCvrybAFWtuen75tgVGZGaLUPoODmspxmlVdZgee
	eh9b6RNPpml9CqF+NODpMOkwisvR2az6k/xU7LD5M3zFYtBi3PUbOb49BLMp9j0y8C5ioW7a5ft
	1vLY++CP4BvLU/Is7I67tr9SnwpO+5Xt8vhnUEZ8qeGdgPQ+fst4tJDIVLS4xrdp/MgEaOOembX
	kmpCx5D39BDgKtOItq8VZ5dGU=
X-Received: by 2002:a05:620a:2805:b0:8b6:1877:3689 with SMTP id af79cd13be357-8c6a6919d3dmr1637943385a.35.1768851971550;
        Mon, 19 Jan 2026 11:46:11 -0800 (PST)
X-Received: by 2002:a05:620a:2805:b0:8b6:1877:3689 with SMTP id af79cd13be357-8c6a6919d3dmr1637940085a.35.1768851971054;
        Mon, 19 Jan 2026 11:46:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39bc5csm3636078e87.67.2026.01.19.11.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 11:46:10 -0800 (PST)
Date: Mon, 19 Jan 2026 21:46:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
        Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <2fmnaxj2ma2bb5iuuu4yzmenp3tsxjko6rziwuaaqr6rqvegbw@s4x6eiwhlkcm>
References: <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
 <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
 <aW5Fdjag_w7i0zWN@bogus>
 <vvvq5rnbzs7ngtahqrar4iqinizthyrv3ipqnjp6ln34di365j@bbwdyda6gw3u>
 <aW5iQABCRukZXpZH@bogus>
 <3ldzdsyspd3s6on3cwyanjeheegoeba6kn6qaybojtqeca7335@cyemyxk6kck4>
 <i4zd3jesjrbljym7xuhwo5v7gwbsbuesuarnxr462eeuosevij@64hcfdzht6w3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <i4zd3jesjrbljym7xuhwo5v7gwbsbuesuarnxr462eeuosevij@64hcfdzht6w3>
X-Authority-Analysis: v=2.4 cv=NtncssdJ c=1 sm=1 tr=0 ts=696e8a04 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=f3c_A7qAZzxDW3Z421kA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: eHYOBgZxQJ8upbkHlS-GYzpe3Ckiv8aa
X-Proofpoint-ORIG-GUID: eHYOBgZxQJ8upbkHlS-GYzpe3Ckiv8aa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE2NSBTYWx0ZWRfXzqxp4gxddwhb
 WSpvMr6eAEBFISrKknVaBQ8jui0Ee5GVHMFl/39mMo2f8cfIaR7pLxESgn/6AUauDjO0QH7BN6H
 +FVgWZ5/I5ABoSBD2Tw7I0QNcjkSKnNrCm0hjFzesa0Q86pqJcWM7zwKrP2dDB0uOZpF7fz+n9B
 QP38vNkOwrCPfcVcVSGOVTWwQW+3aKhMWCJM6XEAYsPGTCZCxE57tr7C2MeKowS1nwcGR9o6bWG
 QWnUrIbkiE9WNbpGjl+RxMOqAUn+YWig1UE+WCvg1PlKwRor8B3zF2/+C3EvQGATP7KxcNPe1Ob
 53MwvmGH3vz8ZaPedONJFbU79BAAm3HA2HFvTdSh4u5pggM0YU49LERsfty/5WEKr4RJYLwrGY5
 dVMazsmyZigJXCq7yRP2PQX2JLrEslh5NTa/cRftWzdyaZmjQK/l4tvxs7lQAvsu+QiLC1nUl2+
 Eo1NaVNRgLh2hVvCajw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_05,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190165

On Mon, Jan 19, 2026 at 11:25:31AM -0600, Bjorn Andersson wrote:
> On Mon, Jan 19, 2026 at 07:20:09PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Jan 19, 2026 at 04:56:32PM +0000, Sudeep Holla wrote:
> > > On Mon, Jan 19, 2026 at 06:44:23PM +0200, Dmitry Baryshkov wrote:
> > > > On Mon, Jan 19, 2026 at 02:53:42PM +0000, Sudeep Holla wrote:
> > > > > On Sun, Jan 18, 2026 at 03:16:50PM -0600, Bjorn Andersson wrote:
> > > > > > On Sun, Jan 18, 2026 at 02:31:23PM +0000, Sudeep Holla wrote:
> > > > > > 
> > > > > > To me, when you decided to add a second caller to soc_device_register()
> > > > > > you created a regression in the userspace interface. If nothing else
> > > > > > it's a leaky abstraction.
> > > > > > 
> > > > > 
> > > > > In that case, shouldn't soc_device_register() made to give error when an
> > > > > attempt to call it more that one time then ? Also should be change the
> > > > > ABI documents to refer it as soc0 and not socX ?
> > > > 
> > > > Then the whole SoC bus is an overkill. But I have a strange question
> > > > here. Consider the device having the "BT / WiFi SoC" next to the main
> > > > SoC. Is that SoC a legit target to export informaiton through sysfs /
> > > > soc bus?
> > > > 
> > > 
> > > Just for clarity, I agree with you and there could be duplication of
> > > information if there are multiple source for that information. E.g.,
> > > the setup in this discussion where the EL3 firmware provides SOC_ID
> > > information via SMCCC SOC_ID and DT providing vendor specific information
> > > about the platform. Both are getting exported via sysfs but the problem
> > > here is SOC_ID has displaced vendor specific DT info from soc0 to soc1.
> > 
> > I understand the context and I understand that we ended up having two
> > soc devices for the main SoC. And that's exactly why I'm asking about
> > the WCN SoC exporting the information through the same interface. If it
> > is a legit user, then it is a possible outcome that WCN binds to soc0
> > while the main core gets bound to soc1 (even without SMCCC_ID in place).
> > 
> > Likewise if WCN if a legit user of soc_device_register(), then we can't
> > make it fail after registering the first entry.
> > 
> 
> But by this definition, a vast variety of discrete IP should register
> with this interface - instead of providing such information in their
> respective functional interface.

I *suppose* that was the intention. Otherwise there is little point in
having socX defined in the ABI.

> 
> My interpretation is that the soc_device_register() related to the
> entity which is represented as /soc in your DeviceTree.
> 
> For a broader "dumping ground for different IP to register their
> version information", we'd need some way to associate each entity with
> the related component - which I believe there is none, because then you
> could have used the specific driver interface in the first place.

We can be using of_node / fwnode pointers for that (where available).
However, I guess, there would be no fwnode for SMCCC SOC_ID.

> (I.e. there's no representation of the WCN SoC in our system, we have
> representations for the PMU, the WiFi, and the BT core, but not the
> whole).

The mapping is really a separate topic. I can imagine "just an
enumeration" kind of ABI.

-- 
With best wishes
Dmitry

