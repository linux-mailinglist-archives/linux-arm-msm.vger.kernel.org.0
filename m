Return-Path: <linux-arm-msm+bounces-60749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53385AD32F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 900451895159
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 10:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF81428C03D;
	Tue, 10 Jun 2025 09:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPd4HT3b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C3028C02A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549582; cv=none; b=lclwYoi4vMjYgrOz79gneEK3VDWDArhlVYjxrKs0FHaBc2XjzQZFTZhBPRekSlvlwJdaDB13EYPvaplUyEZMYlSA+YzoL5KDw1wy/xJcObo3LtAqkIzHJfbT/+0doNR8NFGhfKFxSsOcNQwDspH/QuhY5NeCBe6FSOfvRrAvWqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549582; c=relaxed/simple;
	bh=F1y1TDuWaauSn1I3U/MZeKUHLkrykxmpbfGLjOlvQZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=upiyL9pn24R1hKpMX3eljEWKxIYWBHyUEy6VnDshjOrWnkihqlstg2wty8OrwAXZQ8Y4vg/0SFohkygnHMq7AILiqqZ72wKFbcz/LOZdvE1niRQadbb0+IrhSlpFTJaCDnig8cow68W43ZGkqUVmPzeK3AMqGMchGHpicnFEMoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPd4HT3b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A93H02017712
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NJO9i/czZYar/OKw/Dt6/+F7Wbhl4a9/21tm9FprFAw=; b=UPd4HT3bLZN+83/m
	PrJMzZ966dXSyLQuH3s5AlWrUuk5O3Ycr4IfsKYXOFODwvk//iHVkKjMtVPYao3q
	PutH2m+mSWkbwD84ST4K4yaxwn0dR0YZMkfdla1wxoip0f7zym7Gw0WQZSWE3d3J
	C5ZLb1+e2kKM5ZiNLioUDVzSE1DOkgVp9/Kg5hongW1TF7ABNcTgTCWXPqwjH9nD
	JE8oLJyRKmDrHgN+e8VaI+jNY/IPI4XeQkdm7Piyar0LHVzxy85Qs7HTp7PpCDQe
	DPQGY70NVNgF54NlF+Gn8AkmMujG1bJOt/NmeOMD8qEU8bfNWn9UOTLki5eBZScC
	PDI0Kg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mchqh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:59:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742951722b3so4129737b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 02:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549576; x=1750154376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJO9i/czZYar/OKw/Dt6/+F7Wbhl4a9/21tm9FprFAw=;
        b=FScDjjlNo0kS5um0IyEXL+NcFOTJiF3NbKpC94M/FuagqylwXmTDe1EDopSa2/egPU
         U+KjjliCxfluO9mGX7wxcMgB3a9ISDlCZjJVbF6vf1cV+ZCDs2a4d7VBJJklElNbeFFX
         Dr7Q09c+xGP4DNTDnypxMsLmNNy8GgozuzaPJfPbYNiB2njbR+ghpafMkCBupRiJcH+0
         seLPato/BdV7ZePGHi7SPQ4JtzxTtEVwoZK+YizrJNCpwBblnSvbp6Qahm2F4A6MsUhA
         F52B2y64B9Q1JC4Aq1lHEfMwI7EDER0SNdgmxe2YxgEPh9ntjLfgo3M4k0F3hnK9S45j
         NBJA==
X-Forwarded-Encrypted: i=1; AJvYcCWtTT/TIKqnq6qbDi5uU4SPwh0XxlgpXBA96Y7ZrRUlFXU+uij8UQGjLvq32UKEsDEvd4p+ssaMuZzFoSeH@vger.kernel.org
X-Gm-Message-State: AOJu0YxnqIuEzUttmGFQYmoJi30MNdH3LflMzVw+e8EdFe07ReS67trv
	A0HCykgmOMbdaI5Aa/HHAdsxbrq5i5XCuEMPsI8QGB96NQl5t1J7n7M449NxKtKQeujUcLeg8G3
	69HQDOxyZVfH6uoBWqHiAxq1pUvCnjeT/fZApL9IEOdCpUw2AdVkcAQIIHAE7WS77SInO
X-Gm-Gg: ASbGnctvHRLrKy972in5iGgvuIpDzhnfMwHO2cKDsWXN0twe3rNfTJdGMxW1rqfr4oJ
	ELG/nZQdO2/DY+uH0UoJGCwKRAON0yCnWB8p4vPW6ApmRgr8bUBHuhv4Cj90+445LA+Yn6D3jaY
	4LYd7uc+4kZUxswzDhuEDTrzz+vbXtGa/XPAgl1OVOXeUSOoYPSQ+/AAjdyEFh4183QkYGFxRy3
	qftlskLOedM4xuxXtdr9s0odsI5/4LtnJTFIRuEMzA824SeTQInrnnBjuWp+KrvIdIcbsvyBKLQ
	Mu6a8kAUEMF4MwY0UXfHB7+5O4v8Jn1HQkIvg+WZJiqR6bkEje8=
X-Received: by 2002:a05:6a21:6481:b0:21f:5629:5b9e with SMTP id adf61e73a8af0-21f56295e60mr12309235637.12.1749549575820;
        Tue, 10 Jun 2025 02:59:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCod2Fos0MENsVjz0hvMb9ntW/mBV4cNNsa8Hp9NfSIBo8DRdOx2IIYdOL0IuztGqHPPqkWg==
X-Received: by 2002:a05:6a21:6481:b0:21f:5629:5b9e with SMTP id adf61e73a8af0-21f56295e60mr12309205637.12.1749549575443;
        Tue, 10 Jun 2025 02:59:35 -0700 (PDT)
Received: from [10.92.165.7] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f66adb6sm6521748a12.48.2025.06.10.02.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:59:35 -0700 (PDT)
Message-ID: <c4a5fd70-1d72-4945-ad77-fcb4f3a0e20e@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 15:29:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Flattening USB controller on SM8450 QRD
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org
References: <20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com>
 <7f5b7a49-28a0-4923-bbf4-8b0afdefe571@linaro.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <7f5b7a49-28a0-4923-bbf4-8b0afdefe571@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=6848020b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=YA6QX4G2g9P-5r4Gxh8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: CU2mmbx3-1DtR3m3OVFKhGlsRa6Ull1s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3NyBTYWx0ZWRfX6VXyzs1Hm+jp
 4mnanr3+K6dLkk5yIlKCN3IYggxGg5Zp978b3h709+poCgH58NNuDhkGR8Ljw1tFBiHUODXm3c1
 IGdpxChTGGKUFYEhrp0Umse2IxIttbB456Zg/ihHiod2tphDaE9M+NdxDyCAf2qb+EirrWgskg/
 PFhaxUOhrJs2GsQiYEtJB09rjXdAjjK6M0cWaEv3VdzYcxCdv/Dnh6M0Hlp8oKRhBa5vnQWUvVo
 dBilNTmmZEeG9W9TN08hg5gOFmRfRS+PWiL+4n6Z1Zw8WxRTPepOTOXyuXsGpV5C99IAnQonlMn
 DUiHYZmj3CIo2ZMvsk07Zt0vK1WQTwNWO0isPDyjU8KfvcTPHunxnUO8zKzX1QYBkFVIrieePum
 Nnma1Zcli5biLCch1HgN46/M3aN+NywFg+jxqVRqgYWeyWuQ3xS1/2IQom4zBWDDEkmkwWpT
X-Proofpoint-GUID: CU2mmbx3-1DtR3m3OVFKhGlsRa6Ull1s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=802 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100077



On 6/10/2025 3:04 PM, neil.armstrong@linaro.org wrote:
> On 10/06/2025 11:18, Krishna Kurapati wrote:
>> Flatten USB Controller node on SM8450 QRD to move away from legacy USB
>> Qualcomm glue driver and make use of new one. The series has been tested
>> with driver changes [1] to enable runtime suspend/resume during cable
>> disconnect/connect scenarios.
>>
>> I was testing on SM8450 QRD and hence flattened usb node on that platform
>> only. If the community suggests to flatten all platforms of sm8450, I can
>> do a compile test for the ones I can't get hands on and send a follow up
>> series.
> 
> I can test on an SM8450 HDK, so please flatten for all the boards and CC me
> 

Thanks for the support Neil. Will flatten all platforms and CC you as 
well in v3.

Regards,
Krishna,

> Neil
> 
>>
>> [1]: 
>> https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
>>
>> Krishna Kurapati (2):
>>    arm64: dts: qcom: sm8450-qrd: add pmic glink node
>>    arm64: dts: qcom: sm8450-qrd: Flatten usb controller node
>>
>>   arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 110 +++++++++++++++++++++++-
>>   1 file changed, 108 insertions(+), 2 deletions(-)
>>
> 

