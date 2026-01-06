Return-Path: <linux-arm-msm+bounces-87751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3668BCFAAD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 20:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6754730217B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 19:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A2D3563FC;
	Tue,  6 Jan 2026 19:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNSAHLng";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJa+y7Ky"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25C23570C8
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 19:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767726810; cv=none; b=GGeqYBvkfepgteHPO+65LIyryxlzkuNpOKDKMIAjhuSy/eW1Vv6qwRRTFj8RiMEqyryYXEoHGp68XuqMqhWeCw022joZEvPNdkGLb3/At55RsEHwXlj3mkB/7dlVCJ1DKrRGKvVQKlujGieRFR+b5YJfS/zII3cXuFVYAwllZ3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767726810; c=relaxed/simple;
	bh=eDD2FWgoSh2TK/K8n6PfDP6iG2eUOIPYxyXBMrukQEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5yzyMoZYEtvj0dnVIwPgz90hwD+9MpSPY2KGR8hwRXiAf16sNayyRyo/QSp0RTMtmaL/brV2zFXbC4g9pIeHrYbYwAmrgxapgm9nlfJEZmMlGmDy9BG5KKzCRH9E2RywCMy1ciJiPqhbYqGFme7B5kt32cp5yBd024hyNzFfAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNSAHLng; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJa+y7Ky; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606H1QKV822688
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 19:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=afCtUlAR0uXNVQVVDPU7058+
	Dilium7T7k3JLL+yz/Y=; b=mNSAHLngy5iSc9D/wyh4LOH2LYo08rVs68ihJ9Uf
	o1ddre1ReDDyaTwda8vPN/2IlEyhp1GyI9l7CeQXZnHrJeaVugRAob72H+ooBfnH
	uaiQmN4oCS9lzBPaDnZ6Yb1W67BGF8VML0hvaikZ6CEHeg+zj/20c1b1dlT4SnoR
	yJRV50LF6PY1iIw8h5R69K5WcarvdFBlO9c5mxwo+s1QG3zJaWRMBZM9JyqdUszu
	crW9NKUroGeKqVtNvgSWNRXPflcCazdEXxj/d2mXacrap7Kw4D1o9UaZHktKuTIS
	dCmcmhptm0nkXSUdc3Lf2JFZRRAUEN9hcMiRhusmLRLmXQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6e80e67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 19:13:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed69f9ce96so42161341cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 11:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767726807; x=1768331607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=afCtUlAR0uXNVQVVDPU7058+Dilium7T7k3JLL+yz/Y=;
        b=CJa+y7KywokD7FmtUXMPpfLR9CMHJFHxyBtuxVKbnoXnhB2gtcurS1ShloeZPSgQVE
         dtpSP2d7RWY+Jth5+9JPfqPs8N0smD4VsoOxHmiq+VY1u/vdhDQYuY/GpXxxwnkNLxXZ
         CoXognzi1zwLYvnwbhWYUJ3s+2lG7YL/KmaqHeAlx+xMQs0b/miyEXyta9+HFdSu+ZUk
         N9ZYFSFSkvPHcocXcq084JXL+9T4uCMsozO7ziOnkM6gMVlZyPs3tC0ea4SXr/s0EOVl
         P6jBMYCGpl9oqG5IpCSGnWC5Z79CsZ5/1S1QR9qmcus4fEDagwyQwCf+Ed0IFK+4UvZ5
         LRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767726807; x=1768331607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=afCtUlAR0uXNVQVVDPU7058+Dilium7T7k3JLL+yz/Y=;
        b=R68H/Gq8R3XAH1Vo/NWzDIfHR73Ik2WDuo2Ix0tZDvmPO8lYdd43bFJMtk9l+f7cUK
         6qw9qXJiDOdipPgArQPtTPOpBW6kFVNUNF9pJb73NQ3FNPbyfFWlX/gxM015RJtvnTGA
         GRdmSLxPEJUe9MczysHhkXEGwtrm6YwvvGx5mQYGZfb7S9RpT/B9/2oBzmZkl0QdvzKJ
         8z+0gtkYedyRqaG8Y0cGjvrwlZ9ua55J7pBKernckvy5Jmi+aGoOU4L/4bT1zSOAIFyJ
         R/ZST1bTxdLG4hewjkVr+ikLFSxdNxiPzIOkZ9bqSWu8KLh2GU93O1JywLAFVT1rQeKR
         +gBg==
X-Forwarded-Encrypted: i=1; AJvYcCWjZnLHO/cIob6ez+zH5e36sFtOOnd3y3U9XpGiwP4SmXJ/3Vdc+7FmIvsCFM146gRAStU0or+mUCL9FKw5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywahy4Ra8QbNI7we2EGU1vZKKhBMw28hQFRvyRavhmOhhysmFMZ
	txeAp9rNUkixEFjuS0AZWOi192DFVaA3umR77g3RUmClx8PmpM8HZqIdTIfARGn7MWkxNU63xBA
	4Kz/F0E/xF3qNNxprFEjzTJ9lvbXuwSyqZ2raf2NpSr8soiEyfhND9pVBGVKya4lB9eBXmZwV85
	h7
X-Gm-Gg: AY/fxX4aF+Onh/qbgpqvdPG83+C9PPbLLUb8DIjOgRDJmo+S7SJ94z6GEHyUANAyPl5
	WaCrYaKyjmessDE3GuiJefqzkSOzUbCrq34fKNKvj7Z6GJY3Oj7i/uaDC/xYCwwBTDRNSrcJA7h
	CM53GHyVBIsRfqd9UsmDlvkpGT7F8Nj6FyL0qy+u3UU2uO4nKiC+7IAZoImxgygpPqTd3rIVw9G
	dXFTZhrTwP+8UCD+Bd8UVPsBA80SlUFTYosxaplu8FytRWAVMsgTV11NFzoIN2Q/QLL+ISaI74T
	PPxxj5SYnYDY6k0iOsp+WTudCPV5UlQF1WC5TIFMUusgNkOs4b5Q7yIJWH/jCX7sNJa77vrX5Z5
	1xW28KFXDjmFNHWAZxr7Cd/85T1C3fD8ti/2BeUnhd+ayqjEweyARytPFueHXNIKE24cPl9IHu0
	rI11puaeQsQgjgqnmmDiH3A10=
X-Received: by 2002:a05:622a:8f15:b0:4ff:b2cd:5ec4 with SMTP id d75a77b69052e-4ffb2cd61e7mr6006501cf.43.1767726806737;
        Tue, 06 Jan 2026 11:13:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt9z+kU2bu5aou7XpxBYYfdIHVMsq2lwLBFfTsJO40pKaHDWeBVV64XA5CqZkOCr+RNL7wJA==
X-Received: by 2002:a05:622a:8f15:b0:4ff:b2cd:5ec4 with SMTP id d75a77b69052e-4ffb2cd61e7mr6006231cf.43.1767726806166;
        Tue, 06 Jan 2026 11:13:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6ac0a769sm418397e87.21.2026.01.06.11.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:13:25 -0800 (PST)
Date: Tue, 6 Jan 2026 21:13:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PULL]: Update firmware for Qualcomm AIC100
Message-ID: <buveyxgldbvsefg4qngpg4uxczwvpjr37ikmbfgm7bl4izmiay@yqygae32jkh7>
References: <8ada0f35-9663-4932-b7c1-53c00f3cdf92@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ada0f35-9663-4932-b7c1-53c00f3cdf92@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2NiBTYWx0ZWRfX/D766ZF2k3f9
 16Q0TPdam9I3LDVIINu401WchTOCANvbjanCdGmD78g0tW5o1UYkb+E5zgetvibtVad/UDUUs+8
 JyyTr5FCo+y2gxLXE5mudslaIeQTw1jH9yYpRaniXDHM482ytdns3T7BSPtyMdIKNElW6lAroOW
 JF7jB1MtgrGCkHCmQaqu5whocJSdzHv3MsaXPBerKA4Gj2L3KgH2kJDCGgGZIt7/PYFzQybHiGg
 XfoDH4MmS3K6WCTMWPCb4/rX69HItM6ZxPRgb0XXXAom4BCvrMsSXYq3DcRNa1sNClcZn8EU4R1
 CItlRev1s5ZfRm6CvyZlMpoaENqDmuKnkFohqpxOotCF04Y5wAcxA60Zy5MJtQPuiMur2Iw0PPl
 vn0lE93J/2S6B00jmwj8i9oNLkysGjYL3tYxxTOSReQ7mp8hIVlJttV+Gl/NtQqrGy8hLUrvwap
 wG7MbIUeOvqQBQCJlzA==
X-Authority-Analysis: v=2.4 cv=F45at6hN c=1 sm=1 tr=0 ts=695d5ed8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=SlpdmATz_RgLBfTfWzQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: HArvz8ixzUXhXJS-vTnK93zjylgCoYA8
X-Proofpoint-GUID: HArvz8ixzUXhXJS-vTnK93zjylgCoYA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060166

On Tue, Jan 06, 2026 at 11:39:50AM -0700, Jeff Hugo wrote:
> The following changes since commit 61a76356fe7fc29479fef362abc1f47bb40eb52f:
> 
>   Merge branch 'upd-wcn6750' into 'main' (2026-01-06 15:37:35 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/quic-jhugo/linux-firmware aic100_1_20_2_7
> 
> for you to fetch changes up to 3ff97fca3cccae8c68b14c3bfe9785f25287bf1a:
> 
>   qcom: Update aic100 firmware files (2026-01-06 11:25:03 -0700)
> 

And merged and pushed out, thank you!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/845

-- 
With best wishes
Dmitry

