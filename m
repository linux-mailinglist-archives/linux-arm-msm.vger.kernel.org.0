Return-Path: <linux-arm-msm+bounces-80357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3EEC33247
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 23:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8313C18C24AA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 22:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C41D26AA93;
	Tue,  4 Nov 2025 22:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCFKYNr/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K33pKP2B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BFF219313
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 22:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762294513; cv=none; b=hAg+i7WHZw4ntOBnDOLXxMyQV9ZnQF9zWqLRrxSlzHbr+HxOs+ExDsJ/HrNIrnp76ViGohUnJIQMG17M1PD+B0+Ai55adb5ZgDlJ+X7bHj63madTqkKxIJwH961oZnZJm1jslzVUbE7bwQBnvoiGmKNeUbxFIAl2KeAUoyI31IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762294513; c=relaxed/simple;
	bh=Dc4kqL4A0k+kCirDqu7t00i8lKGuYTBpwR/YdNPIuAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mIlrq6rkFTauFohJy/pebkpBILmMUx/2uLiBcBPdF7Dr2eMx1PiPlfWdVSod99KdXhnsW+6ew3hkuIotTr0apkbAm3tNBxxOFxPckaHIhFz/3PvK3KPGKPg3APxTkhs96B7FRhyb/d8Rk59R7b8ZnL7bi8o5wNtY6ppOQvAI/IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCFKYNr/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K33pKP2B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4KfmvX2978786
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 22:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ogbBgd/Tv25LIQg1F6++n7axOZ48HuYuD70xNJM/fEQ=; b=FCFKYNr/ialbd9JR
	pHORa2NYr5qUtOAxtzEzhdloSYdIhKvmqVj9ntsGL0McN4s1pCOmXirkCBE31WGq
	snFcuo17qKaA1mtkbA8rlxUoVfseOylW8Az5aOM5x1XlwdXVcpUkwT4qzu9l+CRw
	MDCsSObf3ojBQmlgtLvhrDrFFiVRfivzXt6I8vnLyR+SuGewkxNp2qbcCNmqDUoW
	WCiZnQq5ff0T8eW11zjyxPFl5vvKf/yfkicTo64QeyZW4bijiJrqZV8jvYu8fDF6
	4QnqP6zgn6t3NqtvTfd/OGL6CysJLMZLacxK3IQHI8ekUcZs09lx3U0i+KzJJiAG
	Xp4Gkg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7hbjsq34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 22:15:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a2885329beso302346b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 14:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762294509; x=1762899309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ogbBgd/Tv25LIQg1F6++n7axOZ48HuYuD70xNJM/fEQ=;
        b=K33pKP2BTFixdM70iOG/3Kd3gFe9sp97LTpnr73YurtTY+bK4nrozBknFiKzZgiVmD
         qj34TWnMDImE3cV5yTIuEOO/npfFWvMK/AVkcJ67N1Hbkwcj7hJmBUV0cAN3jBPIetmU
         x5FrnzdY2/eDv3iUv6oXZKFj3cS6ZCmuK4OTVQfKLhkHsfZ4W8tXR6seJ/vDfakUH0sf
         NE5OUc9BObfPTVvb1G/ua9nkVa96MFPIrvz/EBAkAHN2Q66daY7Nl2amozbx32jgs3DB
         BJtxZSRzVcoT/cawt2p7AVkae4MpAjtPbVoW4akvJf3o2zJLaSSLWghSQUc1fV2jM3aS
         E/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762294509; x=1762899309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ogbBgd/Tv25LIQg1F6++n7axOZ48HuYuD70xNJM/fEQ=;
        b=PHHBn9IaVS9doDjOZ1viPUfPHXdjE+EeiOWS7vWKwjVtDMgRgmv02YOvBFQXAO3UI/
         gEVQ00JV9MD6xGtrtsjqFlBcZ+gPx1OhZ5RS6vb+naK5zmGgmrl1tWt10ECYCVc1mihg
         EY8TcDwuTxxBrXLxlcMF6raBiyCgnF4u/K3JwgFJI1dM7Cwp0VZBz3y+NxEPtGfm10ZY
         RuakyOmmE9E118N4Nk+aVCY7h51KbjKiHG3qo421hp4sVbfU4PCCYCYeGtWV8785mw2X
         Wmq/U9yZDJqKMHQbOx4DS54ZKxbp4JWjQ3547L3fEukaO5u+1nm+lLnXZrrpNnMr10sS
         3xdg==
X-Gm-Message-State: AOJu0YxRLVvYI6pNLTnS4YhY0bVpD9mV21/QeA0oN36llF/pSTewgPfv
	JBpG7ew35WFSopuzM+bg3k+7ibrYqGfH6Hwu5z2OFzNc7WFMS3MDTkNVaErhMhyUVC7PJX6/gwP
	t5oYX2uu3b00tU4m057u53GSP0GWqF1xOkJ/3tAxDORjel0chCi7V6H+Q9uw5y2dMySMw
X-Gm-Gg: ASbGncvK/f3L5Myb+VsDtoEmFO0CbG+9EkKwoeGgtyTZQ1+1Zb4J2jBB8HrbP5Xf1By
	e74DGz1SMHPn8s6/1LZwmmxC4s9trK4AXTXVfXq/1N8/bTZqmLUDPxi/Gucg8mA687hhe74dg0p
	Hl8Kgt0cYe95w4wIsLLKzM0/k4rON6NNZg03KpDllvvVLWIqHAuLoBqSESS/E6bOwc4lP1N7zyG
	m3ULqquNErTuDrv5VChhhJpHYqFNC1KJs/8KNm7cgMMrZXwqPNY4YEZ8de3hAp+TA0YlTe4ectr
	SrEdhvlfWQkWLQMnpMaQTwQaAMtvut1CQ54OhNKqNVJMPruvyksjX+IlScyWEYTUd7ABA18ZsqI
	H1i7CCz7aBVpgaqmTViSGMvI=
X-Received: by 2002:a05:6a00:4188:b0:7ad:8299:6155 with SMTP id d2e1a72fcca58-7ad82997336mr2710631b3a.2.1762294508747;
        Tue, 04 Nov 2025 14:15:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMSaGzu4ogexmgVVatd2/255fBbWIxfGY0+4QCkMTk6DFn3f8QXyGVUkFdUAVjo2NXiMQ6Dg==
X-Received: by 2002:a05:6a00:4188:b0:7ad:8299:6155 with SMTP id d2e1a72fcca58-7ad82997336mr2710598b3a.2.1762294508107;
        Tue, 04 Nov 2025 14:15:08 -0800 (PST)
Received: from [192.168.1.6] ([106.222.228.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd3b10bd1sm4013047b3a.30.2025.11.04.14.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 14:15:07 -0800 (PST)
Message-ID: <b94eff34-8a10-44fe-ac8b-304407922984@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 03:45:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add Akhil as a reviewer for the Adreno
 driver
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        open list <linux-kernel@vger.kernel.org>
References: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Uv5u9uwB c=1 sm=1 tr=0 ts=690a7aed cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=oSIXvc0h2ZBec1W313aPdA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8
 a=V8cJkdWAq56nonIdhLQA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: QkAXvzLjJyn2-JW_kcQugyLA12J3o7pF
X-Proofpoint-GUID: QkAXvzLjJyn2-JW_kcQugyLA12J3o7pF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDE4NyBTYWx0ZWRfX2yvD/qMfvzGa
 RiifZsmnZNZYY9U77vL/29lReXUO6gza2rVwar4y7Xq4MoWdrdyqtxlaHw8Hk7SYPDl72lM1tc1
 ReIUOJh+HX7EDisGgimvRfcCPeSX46Pth5EAFUci8eOyG7iia4VqDysaH4nE9iRx2R5O0iH+LPF
 c90kkaxzzWdqo1BiUnY2lRiP2oSKxB3IpArJqJUYPnV6CeOx/1B6cNIYqE+icN+PXm7yV2eM2sS
 6fevPp2AW9Zd3MgNgiyxdUNaH4C9AHLGuXVxWVRy4M0i2Nt4ZoCqIIzTe8PqsG9aszPT9/jdcOr
 4JDgfJ+q9UUm60o3+EWPDFufHotQJfxPQ0KhFQntR39x9eME4nDm75pigoxLZHcKuYsZGz3ygq4
 y1+5CCFoUF8iI4xD4pnNbHi6SkNcgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040187

On 11/5/2025 3:32 AM, Rob Clark wrote:
> Akhil should be getting tagged to review GPU patches.
> 
> Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1083598bb2b6..033675aab0d0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7880,6 +7880,7 @@ DRM DRIVER for Qualcomm Adreno GPUs
>  M:	Rob Clark <robin.clark@oss.qualcomm.com>
>  R:	Sean Paul <sean@poorly.run>
>  R:	Konrad Dybcio <konradybcio@kernel.org>
> +R:	Akhil P Oommen <akhilpo@oss.qualcomm.com>
>  L:	linux-arm-msm@vger.kernel.org
>  L:	dri-devel@lists.freedesktop.org
>  L:	freedreno@lists.freedesktop.org


