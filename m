Return-Path: <linux-arm-msm+bounces-62269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A1EAE7631
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 06:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EEB55A08CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 04:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28C31C84CB;
	Wed, 25 Jun 2025 04:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgjRnURX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B4133E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 04:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750827066; cv=none; b=cEp6OzlVbIhaeMCgqHFhAD64ahvFYFRUYKrGM/vaE/ksasBQjxW0HqJqxl9pdApdfOH+73HIib7JtY/rgNqvrzA1jGzqWOCOwLei22z0tK7eR8BUgPnQ0X7V3rYXTaMrEJnoA7KYfZ9S3SWJhh6vLezKKQ32keVsniXmwGWO2og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750827066; c=relaxed/simple;
	bh=R+mi1MfMmFECvU6BHoLstxhB5ir4ugMn68hS+cemcik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RtOuM6l0zLktn1QMgJkhRK1k3Z8aqtEAh4giX3V5cD4EbdZzDW4jIdT5Cuc5RNJlY8BXOjzc7qEeDYcdo1RKWEVMpZKaX+fQ8GIZ02xolAS3VvBHnFqmsWRPtB3QmwcaMJg1kkZiztUz9FNGiIB0craogX2+ZbuH/Wj6l6PXn60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgjRnURX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P39qGH026338
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 04:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uWANR5imRlXfhmMJ7ls8Eqd60uAyLbrR8SUFg1XYKMg=; b=NgjRnURXrMAhT35O
	+l826HaMXBtyMLPC2egxpyDkwnabJXINeAKp0J4s1TAkGlIbJWAPHuk800KH1JA3
	rBiXfrEFuqlZ0PUMDrjuUIMB5VFvqC36OXZ3AX+sFBKxOPVZ5BXF+da6wV9i08Rw
	H9RyJLxHwuQsfTkKH6j6aFIFsVfGQdMc0AzltxqU6rbynqlvl694GzmAGtM6pMrr
	TsQ59uF5hvQjlnefbLDp9JvjtLlmy5OWCBgUURXdcoSH88Nv1dQNSWjggf6+EJ39
	jPFJrFuiHNSc+fWi15MFvn7QeNjeH4soTG3AB0991Mh6oS70hhfnrkqS7YZzgnOR
	WdcmEw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmr500-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 04:51:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so8296215a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 21:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750827063; x=1751431863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uWANR5imRlXfhmMJ7ls8Eqd60uAyLbrR8SUFg1XYKMg=;
        b=mzoLo//Vnn+ZECGe1e+BWqJeucsOo9VevunyKcIzOtc2K4i5A+uqGsj50g9CM/1G8q
         7EjKlv5viizSvijkEeyDxZ2QgqUM/Cq6CZCFsEgmUBamrAQnOWuTuBUUFAIWBRII9u0t
         yCoAGxF/OVQKTDvNwztHnPzIktpCOw+MicNG5n7L34U8GCk+Dybii/2++h9utTaRGNTf
         FifdoZl3FExBnnh9HaENbMDbOxizMAvTbIcIa2BBrakhEqRwyYbnxFdYF9HtdTOvgcLU
         qofIJI1yBIO4azfqCZHWztzdtSPMBHgyphbWxuJZrnIsnsh5v0WLBoKIGen2yRU411ks
         uv/g==
X-Gm-Message-State: AOJu0YwjBK8bd7G/Kjf1f0i/R/FPKK2qXO51EhGdXo81TpWAgHB1/ue3
	vPdlF4nnfALfiNP1XNdxGmqLJErcBPaAdVr7/x7aCbTp156WDstyCM106cRIlYgkZ3LGajT8zO8
	XrBLi3+3jq6XAUkwV5J7XxspFwErPHfPj2cOPifeTgZE2BfC9wCovK+ijMIgLyqkS2mBV
X-Gm-Gg: ASbGncs0322RvpHMa/hQbEn4gRky3TpN84aOjX2Gp5GaqwQByCrPxmAnaNnfp49SHBD
	lmQEAey0rSRwoVrmsmwY/FpeXqArqcAl2mCipaIolqZFeE1nor+SS0LRqXsZCfpJHTw95/BIY2d
	8kOy4qoPAZwbLPeDP+d0AFSBhwWMBMGz1iBbWepKiwN1URn97swQ8oAf+9SqYExjNg6szRoAGk8
	yl6EKgqshJDNoWS8Dihv890mE/P0+lYqUI20lXxbG4kiTr6CAZvXTGjoEh0lOLdFIXASwYn9gSF
	g9ViuhvCDeAG6xCFW/I/SgKyy6L0rxUD0h/qpGCa+rjNnGcENK3QX4/l0aFEaIo=
X-Received: by 2002:a17:90b:3f10:b0:312:eaea:afa1 with SMTP id 98e67ed59e1d1-315f26b1d47mr2056904a91.29.1750827062808;
        Tue, 24 Jun 2025 21:51:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnvuHz5aGAcqZ79k6lfdJe3XcpxANsWACfUa5ytAc/H7t4vpU25I7oBD2Z4sh750DNF1tWVA==
X-Received: by 2002:a17:90b:3f10:b0:312:eaea:afa1 with SMTP id 98e67ed59e1d1-315f26b1d47mr2056879a91.29.1750827062384;
        Tue, 24 Jun 2025 21:51:02 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8396182sm122012895ad.9.2025.06.24.21.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 21:51:01 -0700 (PDT)
Message-ID: <7d641576-7ec7-46f2-ad53-e0b8b36351d1@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 10:20:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5424: Add reserved memory for TF-A
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <quic_viswanat@quicinc.com>
References: <20250624-atf-reserved-mem-v1-1-43b1940e2853@oss.qualcomm.com>
 <0826de9f-0125-44d9-84cd-1c52ba199a4a@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <0826de9f-0125-44d9-84cd-1c52ba199a4a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PpOHjetKMBae_JIa0WADZoE-43xOxRTs
X-Proofpoint-ORIG-GUID: PpOHjetKMBae_JIa0WADZoE-43xOxRTs
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685b8037 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=sl2Mi_gxeYHe-Mi6R-oA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzNCBTYWx0ZWRfXyW6QfvXAWDWx
 8XoiSbBb8KWTq67wC/ojCL+cSiIYiqMPuRBynaZoqFkcVUfcetLnvhwQ9Nsu3OvrFxh7bshyie/
 dJA9oyujV1lzOpTiUqx4FfI0F9pu/cmnkgKiwWz1im6j175suJOqZWvIHAtfr6qT7cyWv3H9W+Q
 s8CDTPOvvIMWucuxDV7ZfuH+jOIZyLDMmUi7eKUzi+ukraG7l3Ic7F5HsMYwD9Xwg8VwhdWPcAN
 bnW1TqiVaDR0MbX55eISZfgcgm04TgM74jlI5nM89UGWGMha0dPSjyny8R2Ver20pBAYrMeZ5r8
 KA41UZiXQVlkhlw8FxNmeO0m+IWq5U9UDSiKRl86OVhvTF1v8VMJRRvJkaOMr9LAW6wBgpXiaM/
 Bz49uEG6XV+4vlZT/t69xEEUT/0nvDY8hC818DleZHcW8/05xEFT1FrnYHVIxDQ/TJ5KyuOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=439 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250034


On 6/24/2025 6:57 PM, Konrad Dybcio wrote:
> On 6/24/25 12:36 PM, Kathiravan Thirumoorthy wrote:
>> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>>
>> IPQ5424 supports both TZ and TF-A as secure software options and various
>> DDR sizes. In most cases, TF-A or TZ is loaded at the same memory
>> location, but in the 256MB DDR configuration TF-A is loaded at a different
>> region.
>>
>> So, add the reserved memory node for TF-A and keep it disabled by default.
>> During bootup, U-Boot will detect which secure software is running and
>> enable or disable the node accordingly.
>>
>> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> Can the said u-boot simply dynamically add the reservation then?

Yeah it could have been done in U-Boot itself but it wasn't. 256MB DDR 
configuration solution is already shipped out and the stock U-Boot 
enable this node to avoid the random issues.

>
> Konrad

