Return-Path: <linux-arm-msm+bounces-81560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6436BC568E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 185213404E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 09:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EB228000F;
	Thu, 13 Nov 2025 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVc8iiB2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AiiVvW4I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7793327B4E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763025442; cv=none; b=n62duiFmP2Ah7lfB76wTAuE55xQ3KfiQ8wi7OgHMDTGghz1IR3WPkk/kleW/rZxgf4KTKdW2k+rFPGMHdqyYihZAYXkIMbPdqD2YzGKMgl7cJp/BXgRPrfFWDcG8Kqh6vsJ1If3hH7vgwoeENrU/6X/BGiWHTKEKIZiTgAFrznk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763025442; c=relaxed/simple;
	bh=1iCBhg4O/Sp62AdZbo2crxvnsklRRrz+t1qwwdctpZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hiltNIxKn845nuz4HtbW+rhMONfvqaNbA1KJqA0nbYmgLq85kJERTKw2PNvFvWrQlr6n2oRctiKiFm5Wd0rNj5ZJ6yN2i68Y9XqQl1FjNoBFXAFP31dQaVS+Kob149aLNqPxUUIxClsjZmL2MA2S5roGfNTR1ojFA/Sc29DAkM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVc8iiB2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AiiVvW4I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD8vtRT3035326
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1iCBhg4O/Sp62AdZbo2crxvnsklRRrz+t1qwwdctpZw=; b=pVc8iiB2zloY/84g
	xmKeS9HNW+6RQGIxxXt165t6CvqF+8/QwPcUNflbNta7ak7yORfu/wE67UtQAAs7
	9DlrebKDe8B3Hrp4cU772hZBkuJzHgXZXM3EWZ28raEnEOAdlAOXC1lSvGVLQLfz
	IlA3ms8/wJBCmWRTuCNx9n69Hbn7ivR5rVIXwUGwGH2ZLhO9tHGwklX0unTFeyHd
	sIa6c1ru546IHJbzvIH3KWQoHKKZl+URNDbCmbP8KvGCAaGLZXceK2yAyyw3IO4J
	uQyj4b8I6Ld2Wt4Pzj/5cshMEz0Y3gJvkS1BuE8YVL+2A3x7kXKS/mPz5C8jrPz+
	9nJYgw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad4ju9gms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:17:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b184fa3ffbso22807185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 01:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763025440; x=1763630240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1iCBhg4O/Sp62AdZbo2crxvnsklRRrz+t1qwwdctpZw=;
        b=AiiVvW4IKfgt9x5U1UQ3exCEOcA5Vc4n2KYV7bYupjjEjFsWs63bYeMPx0HAGcFLSM
         T+oMCZV887azAsLho+E4FisoN8bG3V/LfSrZA72VTiXImpl2Ya95P538MFzKiCO2niTw
         6NzBRcyfSIllx0L9L/MZ+nIyEIMYqcf+AqiNYrwEqpEK0aLQYUaXwW5AXtqLuur1mxV6
         hW1gqQNbpInIDrpPJ2VVvVxvK5gwsQwHtTaH8TStxYDGlB/7c++ciIXX6dV2+aQmSnIb
         +5Fn6v4xoU4wCcgmtGrveDZFCwyJhX6yF+6hMUu/qhx88LywsJSHWRqbrxQGeVVJ29rK
         zAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763025440; x=1763630240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1iCBhg4O/Sp62AdZbo2crxvnsklRRrz+t1qwwdctpZw=;
        b=jkXJAhjffx/L0NBxX0NeKTMphz73vHr4jeO7nosZfQL5GqsqURvdFKzQudBCuxUBoC
         iZZriMUewrhrCmg9HDIo4frGH5nji7/fSZbHt3zZWSwVPSVGXTrKm1JMWjDJVZzUwuWd
         /hzfWIpRKzIRhuKfxFnLDNBQpcyd2s9Aw/oztcPZhAWUNRXHKNE8p4fPduczfaEUdJ+S
         NTAhky4YMgWEP65wOUvmNyOb2G/+kwp9jSMpv/nykWbZPL9dVHm5qbtfCYC8Ss3nv31Y
         5SNsAxFhCUA7ZArAfBuVRJlZyXZLW1DDTsxN27qnRB/d/ebQuG4YszFMg+fP2rXIdYhW
         1krQ==
X-Gm-Message-State: AOJu0Yy0gt3jYicbIVfYXA7Ke6G5vIH0W7AiUENuoNEzkwm/QiOzxVJg
	TpIC5SwRhhyU0z+DFffSkJ3asxWmrjd/wX8ViuSnU/NuMSqWd5zzZCyh0EuEXOAjMS2Pv2YGYGx
	IrhaNNgazRJI11Izax8aXpeOVn/51iESpR3pjU5gIhVEpuCDn+YTUeZu5hvQN+VnLM321
X-Gm-Gg: ASbGncsi4vDV7gNYgZOiAs/DJg+fmeRNyI5IQ+FVc9zNXw58kDjF/+wWMOXLTw/HHw1
	D7Y+i7KL5rZEKDdeJfWa96gV33JnnDiGaGgANwfykbsQxmYIeiaOB/y8DKTnFEvyRU6Vaq4FtnI
	+cXDPmv3fgijzwi5odp+l9x1lJrqNt6g4iRBjJA6Nw+hVChDkzF+8GAvWo4dLL250PSUsy2enA6
	hir/dTCHm9cBs8GATfVMxV2IjRgSTcnNSqFbKpRYquEO01scBBvQ7afuUkuLnY27hXmAQqyIAQ2
	8jtH1NQ+CZNTDileV78aL4SoCxxTIt1w43Nz/n3AYc9xuMBkCWomY3PdN9eVpXV2GwdPFhZghFJ
	AoFNTg9M5hbnLh6DMSDtJJxHxbIm0pf8kKBtscMR4vu1TTbf2UwD9Kr+F
X-Received: by 2002:a05:622a:82:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4eddbc80e92mr63371181cf.3.1763025439790;
        Thu, 13 Nov 2025 01:17:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgwH1tbq62hIav4asgnzpyDg+E3ChjsI55cXS382HDS6o/A/DfHR748c6Kzs9DrBEDcRAluQ==
X-Received: by 2002:a05:622a:82:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4eddbc80e92mr63370981cf.3.1763025439215;
        Thu, 13 Nov 2025 01:17:19 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b19dcsm990156a12.27.2025.11.13.01.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 01:17:18 -0800 (PST)
Message-ID: <29278020-7fe2-4d5e-9de6-e32f9d7173e9@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 10:17:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdx75: Flatten usb controller node
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251113084608.3837064-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251113084608.3837064-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w-S-eHJEtJkruepS8uhxXQq-X_Oili8L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA2NyBTYWx0ZWRfX4oSxZPmBaGGz
 vyHshp5Qpo83x1xl692ydfOfUq5XWUspiOVc6sjNpvnnegtxshfWu78mN5rSC5JBAr8VkscyOon
 s1LUVsYilpgmJPSeTw6lkGue6eoD2HNZ3AmihEmT7hQ6lWszHZBRvgeCuTb9mam2lR64rP+sxhK
 llsln0MufqYh/kMLusr6QxIjvO2TYZrUVNkGV0EHj8SAWboqzogIK/vVlV4WSNmG6a3P26V1Bdw
 9Yik9+UGDKsLgkcRYhNzxirzzmmzZDBouM5AK+AsHL3LURSvGnWkfenUYwN3yG/INyjV+LoooPH
 zhKuxmujt2MEnaFGR8uQIzyGWeWQxkxjQl6njouJwnXWH0HQbpGpZaQ54Y58L68q2UoCkoq8XBz
 6Lmxr+kY6i/kP0EJO38C7eim03PszA==
X-Authority-Analysis: v=2.4 cv=BdnVE7t2 c=1 sm=1 tr=0 ts=6915a220 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=4zhbYuK-2X_BnS2RGrIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: w-S-eHJEtJkruepS8uhxXQq-X_Oili8L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130067

On 11/13/25 9:46 AM, Krishna Kurapati wrote:
> Flatten usb controller node and update to using latest bindings
> and flattened driver approach.
> Also add the missing usb-role-switch property in base dt node.

This is wholly separate

Konrad

