Return-Path: <linux-arm-msm+bounces-89736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB0DD3B4B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 18:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2DFCB307D2F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 17:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBC532AAA9;
	Mon, 19 Jan 2026 17:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LbMW0k8U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6F+XaJr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37746322557
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 17:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768843215; cv=none; b=CxAYB4EhNzvt/+RiQmjyOZn3U0O3kGlVMQqvWx8e4fmuSAemMU19Xcjzt36ug/Y51vq+yqIfTPUnCuN+7W9z6qp3lvcuc+6bIee+ktfg6bJh0pNvDEKqsro8P04E/+uPevLSh8sav0dfvGy0WuIk/O0BcCz2859rgZHFprwHujs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768843215; c=relaxed/simple;
	bh=UFWgtlEi45JP831hnm7YlUnd0L54ZYdyiNGZdqQvwDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnbTgCRGYEp0K6I8363wAGJRLJcIwP9uVMJAxPvWAYr1mF/PA/xttMjCrZ6YX9851L52NLVp215o0P4jzr/I3VGuASojTCBc9dq3Vy4P5rEQnXBogVDdbw7wTzKB5QXqHKscfyBHKZHZsfuLs/obAce+NHhd/zATbMHhi8nR7Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LbMW0k8U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6F+XaJr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JA7Zlo597715
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 17:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5dCKnQqgcn4FwURv24c36V1b
	4GyaBk0u3IWkPTU4lJY=; b=LbMW0k8UwfxPriKgy8ReMoO7YrURp4bkQP38ghT7
	P6oe2A0+AVOmmezfIk8mDsXVl5bDwGhoS4lSciJ12Blzj2muRsmaUP2Q/7seAUro
	gwMM9OWcj6KaJo9oc4gw0b4IHph2cRNvfIAjMZwMwmg/mAIt8i3Q07M2goJaWVkx
	MsHpMRhxdNFP4Y4BVzhSZSYBt7QyWau4qBW2psGJvUGoE7dxfoSB6Ic+4AfCubfO
	OtH3bgm67dkpaJJlgQ2kYj5a6B8I7ZDiX7si/8jjEJ6k4oo7FrsWCyAeNRplcCFa
	vhpwEktHNpfrhAumczF/SnoKFOoww0GT+FqoR12hMMfYjA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjk7h82k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 17:20:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c1cffa1f2dso1370306885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768843212; x=1769448012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5dCKnQqgcn4FwURv24c36V1b4GyaBk0u3IWkPTU4lJY=;
        b=I6F+XaJr06MxpKBvPfEouVKxAKT5FQRTw8pCdPRo7nXfiDhIv5yPLzKnE8ymIxeZjQ
         LbFIFaO71ZY3gxtdEfGO1fuUAsyxIMIYPfBQgfCWJkuzoqyITpBvQTTbJsXcp1XXEnNL
         ydYvOxcBAb8qYFLPL1lsJMKS+NPJYA6C/QBj2/qokOnYPFmZL+JQrN7NBV3YV3cKo768
         R/TOUeebVt0a/oC6sSHFvpczdDr6hzfS9Y0LRDg+8iJzrqS6qMLKnYw3HjsajdGQUzZD
         ZN0YlVo3aVQjUv003NqaSCls4ku73HdBR8cp1kyAOJIRBf3sCNob4q6WbGwXsnEp0+P/
         PbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768843212; x=1769448012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dCKnQqgcn4FwURv24c36V1b4GyaBk0u3IWkPTU4lJY=;
        b=K+iSniAXLqvAm3WamscTV6kZKWk/lW1wkgsXUxsSS/Xi23FQI+TS+ENpw6oNeAjHiG
         UArwoWKr9DJl+b/Chg7Gaj99ULFBHvffDxqppceDKH8eFkF5o+uoIXAKjuu2f9K9S6kv
         cxbaW4+e1EBPTFulwgJR81934siZ4AXlRHwhH+rKhRT6Fb2hy5GkBF3gtvhjmF6qfFiI
         sT6ARn24IZifq8eNIIhrn8x1AOrvXASlCWZk26uLxFwHTFLjVZA+92rqENsAWQ6zqQuy
         Y/gehlU73wGqS+cwrzcwRE14OeXDYhShql+ZkbZUZ0u8kftrR9K8zYwE2+WFjZoCamWx
         xtvA==
X-Forwarded-Encrypted: i=1; AJvYcCUpHT7LRG3011ceXPSSIHwieFfePJj4ndUkxtIK3P1VG69AN+LrZHTBQjGr2z89U+3UptaLg4PHheFUaurw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8V6knDMydVWcMGkCI5R9+L7+geqHiXn2OC9bBYIPZBvlwvuSt
	/Cy20kHCq9aJ8xVnkdcQZcEHmgqe9yAHcDnpMN5elYMed9XBI/Sk6Yd//P9aNLpufa/pMulALTL
	dKmU+JZz+KvGkk6+t7xDpGl8Bo0onbTvXMLtNdSU5sobrD+aYECPd3iC9H97ScmQ6Jm1A
X-Gm-Gg: AY/fxX5VUW9MHRMLVKVkl3OVgQX4GnCG6HpfKBrHWI8reEoxCgXCmcL3cb+2lUUlYmS
	44V/OXdwrT7cwrhNg1QwgSGy66zpHNaUn/2YB2s/pow9iw6Wz/oCTgPOglmrEPEzoiHheKUNxZd
	8rcPODQRxfsS50oetvK7dJF0BQcDbnUOll55/fgntQlj2qO1KpvUelnbKHXi5rV4E0Nzf+S0uQz
	miqnBGwV6APDQVTRAdFs9/2t6M0wjyILoA3Qc4ZhR2jnApguQ4VBufEVU5W4ytrytWPEq1X9Ag0
	BP78JKwO91ilxit3k5UZqyXYKkGDxqLXu+/lnwN4g3N547xNlefObNXiTtLovx8cnEE4Cng48sj
	qBeXeMC88qSlHVWJTy0zPWVzlV5TpLJag5ctCn3y4FzkPzn2fa4tchl0KeeZHR0F/kCsMUDw/GZ
	Sj6r3Fcwm/uEJF0MIsu5UU7h0=
X-Received: by 2002:a05:620a:4446:b0:89d:b480:309f with SMTP id af79cd13be357-8c589b85a2amr1894324685a.7.1768843212294;
        Mon, 19 Jan 2026 09:20:12 -0800 (PST)
X-Received: by 2002:a05:620a:4446:b0:89d:b480:309f with SMTP id af79cd13be357-8c589b85a2amr1894320885a.7.1768843211804;
        Mon, 19 Jan 2026 09:20:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33ecc7sm3436162e87.3.2026.01.19.09.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:20:11 -0800 (PST)
Date: Mon, 19 Jan 2026 19:20:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <3ldzdsyspd3s6on3cwyanjeheegoeba6kn6qaybojtqeca7335@cyemyxk6kck4>
References: <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
 <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
 <aW5Fdjag_w7i0zWN@bogus>
 <vvvq5rnbzs7ngtahqrar4iqinizthyrv3ipqnjp6ln34di365j@bbwdyda6gw3u>
 <aW5iQABCRukZXpZH@bogus>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW5iQABCRukZXpZH@bogus>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE0MyBTYWx0ZWRfX7cBco7iRGrEy
 89yN1DxNMicsSMTqVp0gGlATp8+m8IbA2aEjEZLBUQM+tQcSIG0fTTIR2VCYOXPHcJR6VeLcUzk
 S7fAbblbrevUlia1iB/xv8k+TGAMRPq10tlj4wYmXZrqOE8NRa64XGpRPVKMVHZyqpO7M5VE0lb
 rkgW6B+XstWVPe7grg69Y7IuhuWUbCgwQFPK4rmb1vSdCf4MrkTrGNM/XHK+suVDSUUHOU5C4uZ
 oeM+N/NGpLLEuP0uz23an8D1CJfuYOPxNgnopaDezeJNf6q0M7rfWrUSl02nbt/raruhn3bJOgg
 qoeQpEOyFxrYGVxB/w/PfcHLrxGWkgeXwEz6QcO5B9Uja1tI2rL9S0tDaxyK8IUQQLX7IBHqEFS
 ET7zdH/QqkpcXEjlAruySy3CKpL8c3i6lg5rUuFWDBpjVk+hkNfxFNl+q6DnV9o3jMg4ZsYlznm
 WWtsA/6Xrfrv4Ic6iew==
X-Proofpoint-ORIG-GUID: o0Sn0vdLFZWyv3HhNgycnHw827o9KjIq
X-Authority-Analysis: v=2.4 cv=WoAm8Nfv c=1 sm=1 tr=0 ts=696e67cd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=654gc9IM5QJH5ztBADMA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: o0Sn0vdLFZWyv3HhNgycnHw827o9KjIq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190143

On Mon, Jan 19, 2026 at 04:56:32PM +0000, Sudeep Holla wrote:
> On Mon, Jan 19, 2026 at 06:44:23PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Jan 19, 2026 at 02:53:42PM +0000, Sudeep Holla wrote:
> > > On Sun, Jan 18, 2026 at 03:16:50PM -0600, Bjorn Andersson wrote:
> > > > On Sun, Jan 18, 2026 at 02:31:23PM +0000, Sudeep Holla wrote:
> > > > 
> > > > To me, when you decided to add a second caller to soc_device_register()
> > > > you created a regression in the userspace interface. If nothing else
> > > > it's a leaky abstraction.
> > > > 
> > > 
> > > In that case, shouldn't soc_device_register() made to give error when an
> > > attempt to call it more that one time then ? Also should be change the
> > > ABI documents to refer it as soc0 and not socX ?
> > 
> > Then the whole SoC bus is an overkill. But I have a strange question
> > here. Consider the device having the "BT / WiFi SoC" next to the main
> > SoC. Is that SoC a legit target to export informaiton through sysfs /
> > soc bus?
> > 
> 
> Just for clarity, I agree with you and there could be duplication of
> information if there are multiple source for that information. E.g.,
> the setup in this discussion where the EL3 firmware provides SOC_ID
> information via SMCCC SOC_ID and DT providing vendor specific information
> about the platform. Both are getting exported via sysfs but the problem
> here is SOC_ID has displaced vendor specific DT info from soc0 to soc1.

I understand the context and I understand that we ended up having two
soc devices for the main SoC. And that's exactly why I'm asking about
the WCN SoC exporting the information through the same interface. If it
is a legit user, then it is a possible outcome that WCN binds to soc0
while the main core gets bound to soc1 (even without SMCCC_ID in place).

Likewise if WCN if a legit user of soc_device_register(), then we can't
make it fail after registering the first entry.

> 
> We are exploring ways to see how user space can survive this.

-- 
With best wishes
Dmitry

