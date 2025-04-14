Return-Path: <linux-arm-msm+bounces-54227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F70A87F66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 13:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D83E17783A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 11:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DD729C34B;
	Mon, 14 Apr 2025 11:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8ZlYgP0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBC72D1F52
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 11:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744630805; cv=none; b=swQSmX8pos8Ot5UezJdrfQ3Qz8ipzXEedJf2dvZ1hQssewRR6CTTzasrhthyRiLauVDDq1SanqKXmpgyjiikr5cjnJ8aWsacUS4gor5zgjhq2FPPy+og0jwaZfOFwwExzKwRdce0KWPWMCUDz0PdRrPM0HxkC/6nEqsNB9OD9Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744630805; c=relaxed/simple;
	bh=Kg8lNN2D9PxXCfWAeQsfblY+CBN9LmqT7NHbOJtwZII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GpPNR5V0jsCiLlYxO8vymTkm4dN/1Hn5RVRDGIeTir+jOoX0470TWxdzAkD5NjM3KQIWWnbda1RWJ+4aawDaM8PQ6FF/VxRPMxClqLAhrA06HDUx8scFWBlrOZe9hXljDKkdcVYJYWmxkRncdoriLRnUifaMsCEQp1AKni7lsU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8ZlYgP0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qdX011398
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 11:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DV6qhiKBAUU2imjFAbN+AkEgNtvS7jyxRXDtngWxQDc=; b=b8ZlYgP0nO/bKyvG
	B0H3DK80AYm2/oG18ZJ0U99qoqONX15MY2fJGBOVGfpoCwpRxxyO67Q5G+Y1F5uT
	avl+sT/nNwTcg21E9hjhwJNA1N0009iEWfOffuuqFNKFL/H9ckoiEU6ssf0A2ny1
	FM+XYt/hx8dJ0VzRYdHMRCwAC9EJQ9tj6CfG0SnMAbpWY7FtK71bqWOtVyu5Bi9g
	dldORNiYnfdb+5OSA7WLziG4CXIy6n2VAG4CFRe+u8h6ra2ilPrnSIKk8XefejGJ
	kRpe4oat1/kgg2KtQ4yQUAeaqoN2ksNRUqO2Win5ctdRMzNZ7cuqRekyRrJAB0l3
	0fJvPQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wcby7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 11:40:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5841ae28eso98340385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 04:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744630802; x=1745235602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DV6qhiKBAUU2imjFAbN+AkEgNtvS7jyxRXDtngWxQDc=;
        b=wEraRlpPYYWvBSKybeP4l6SGmHjG67Jc5QSXCMOoslNsPnWBem9XHvPi+buyBAtP8/
         Li2Dg3wNt/47pxMEMF61KqVWmfXkOry/9SEJkCQoabNduEsS7SA2QxvA20abo+IFYwDw
         fIQqZ1rsjMTauJJOXtYDYQZcUXX82ugO/Q7tf0/0J47BFB1GpRFdS/9gkXNPSc0Z4Rgs
         AIxTJdWodvpKRsI8f3lRw++aoW3aOdFK5W9GrnS+tPnnmv3X1tOBSh0b3rb8IGXbQ87w
         OmhgX6xpEqXooLD+V22i6pu0bQVnUzr98FfGiU4Nru4JTbkB85ZAFS9yNvGna27zcUmj
         YEKA==
X-Forwarded-Encrypted: i=1; AJvYcCWSVn2a8OfEo5SwMyvYJN8k2NNmGgsgW5IKBSUa1jyOPQnM6k4sSGqgIwwDBMyrKBf4lgOxGRSk3aFgk1Rs@vger.kernel.org
X-Gm-Message-State: AOJu0YzDz7gFUtJyrLhA+jh7lf2WWlm5dbb24OQeP+47SVLE0Lyhgfyu
	14ZP8mWeen2OIMxdQca+u/cUK5GptRY7EpTaK5kDqnLwkOPsWjoVJRUe4ejh8M0l4r9A5sG+OOf
	jO46WajNn6qyZgYFmnjLAejWD6M+XTT891gU+8GVLs4ofGlhXRc7ooqiJnol/HNhg
X-Gm-Gg: ASbGncuWamdNDmRnCoKr8vC0JWitHA8U2Q0IK0UuYb2lkPPCu9t/mput9f0kRbYNR95
	yzkvLNkP+9mcEdE4g878W4a3Px/hEhRFPq7ZAJs6/QZ4jL/k5f4jI9vpGesaLhI7WYP+qjWkU6I
	NrbqXuA15/EnYq3iEIJiF+/236EN/ohcdOa8kOL2oiRRl+0N8DMg4EEDUp5rpc2d2O87PDs6XCg
	UVSOeSzYgHdzvFLOeh+9JAMRe3VJwppQiMAK2Rew8syUxTKERGgwHrK447iPAzhIu7ftdURJl15
	UmQIsfWJ/sjcpDU8VaP3zoJ1OgzxWO9DA3EW+0X4gEEQae+UxoKpw7+seV3XVlWL8g==
X-Received: by 2002:a05:6214:1d08:b0:6e8:fe16:4d42 with SMTP id 6a1803df08f44-6f283adc8e5mr73751986d6.1.1744630802081;
        Mon, 14 Apr 2025 04:40:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3E0L9e0/RIci+ADRrX4qrK6GQFhC+G2QaLdC4aN8GFac4k2hQr5Yh2rzqnOdAyJM+rcAvig==
X-Received: by 2002:a05:6214:1d08:b0:6e8:fe16:4d42 with SMTP id 6a1803df08f44-6f283adc8e5mr73751686d6.1.1744630801548;
        Mon, 14 Apr 2025 04:40:01 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3569sm887225066b.3.2025.04.14.04.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 04:40:01 -0700 (PDT)
Message-ID: <8fe8c0f8-71d5-4a85-96e5-17cb4773820d@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 13:39:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sar2130p: add display nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
 <20250314-sar2130p-display-v2-10-31fa4502a850@oss.qualcomm.com>
 <c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com>
 <umhperyjdgiz4bo6grbxfhe44wiwoqb3w3qrzg62gf3ty66mjq@pddxfo3kkohv>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <umhperyjdgiz4bo6grbxfhe44wiwoqb3w3qrzg62gf3ty66mjq@pddxfo3kkohv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fcf412 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=wOxLtKptuZxHWs9q4SMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: g2jH9vHpsaSx8OozdeAJ9Sw9z56v9VHC
X-Proofpoint-GUID: g2jH9vHpsaSx8OozdeAJ9Sw9z56v9VHC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=685 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140085

On 4/14/25 1:37 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 14, 2025 at 01:13:28PM +0200, Konrad Dybcio wrote:
>> On 3/14/25 7:09 AM, Dmitry Baryshkov wrote:
>>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Add display controller, two DSI hosts, two DSI PHYs and a single DP
>>> controller. Link DP to the QMP Combo PHY.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> [...]
>>
>>> +			mdss_mdp: display-controller@ae01000 {
>>> +				compatible = "qcom,sar2130p-dpu";
>>> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
>>> +				      <0x0 0x0aeb0000 0x0 0x2008>;
>>
>> size = 0x3000
> 
> Existing platforms (including SM8650) use 0x2008 here. Would you like to
> change all the platforms and why?

The last register is base+0x2004 but the region is 0x3000-sized on 2130

[...]

>>> +
>>> +					opp-540000000 {
>>> +						opp-hz = /bits/ 64 <540000000>;
>>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>>> +					};
>> Weirdly enough the 540 rate isn't in the clock plan for the pclk
>> and so isn't 162
> 
> Nevertheless we need them for the DP to work.

I would assume one would like to have dp compliance, so perhaps they were
just not on the very page I looked at..

Konrad

