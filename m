Return-Path: <linux-arm-msm+bounces-83741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E69C91BB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 664A73A3F29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 10:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282E230DED3;
	Fri, 28 Nov 2025 10:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FvrxJgYP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+KXACsd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CBB30DEAC
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764327133; cv=none; b=G8f4Dug3ZvKMDyb06TNr8P+bLg/DigYihOtcOxxVGtd/SdBxiesBuh1a4NY3nKsPPfU/n0lU/E/vDzq8FYve4BLsuv+vNNLWbYQsjCp5NDuLoGhTDxHYUs6romVura1HmA/yIUaOPKPo4ZNAcz8KUsxMB1glEPKeH/5cRiv0KMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764327133; c=relaxed/simple;
	bh=RPmxVLBfpCHVLHwRjkIdjCGzbN28a0PTPzEMX/3sFlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kYhL5GkZoS+RQwjD7Kmv/c1M0XHYyA+vqOKoQF1nY7Pqocfyw6IGT5x0H8NVtap7WgZu622BRt6CD1fW4riKIlj+VbVo4NU39zk8VJSyL/V/ggsmKP+6gRCxTDA0cER+yPlAA7P5v+X8vZjLKAq0pkgepTtpSZVLvkJXGk2IpeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FvrxJgYP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+KXACsd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8Oh6Q3627275
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	86KnzvGu3GEj7n2OOgrtzoYiFDBvCiTUgmN8lQcrmNg=; b=FvrxJgYP2KlyfPNd
	f3zibxh/13UnLllrD+Bmo7nM5c5k61++HFTqbPydw+dH/BgpUVVUikcb06gxcQ0h
	jY98lEeR+LQudUpJ0F6bdtud8pMy9CNe9YtQLah7VhIpA4O9RjVPzSJVV5gW+iMr
	XPA2rIK/7pB/eTbg3spLupE+c6zBkZLp8t4siT0qjnoXZwLv6PWkh7z6IDvR4ynu
	bxB8BVSyyX0uElTvTHfhPRQSZYlbnw/TLZ/veZ+kbO+THy33AFYjrT6o8G1CbykH
	2FYKpFaxTd5CljXEnWHMm2O7ZPnZezat84nrZvWn5nxWEFAso2i9aui9spz5Owgq
	OKAZQA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmynu2j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:52:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso3226871cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 02:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764327128; x=1764931928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86KnzvGu3GEj7n2OOgrtzoYiFDBvCiTUgmN8lQcrmNg=;
        b=h+KXACsdjDpXnzG52pEKzH4+be+WpVo46dIWTBr2nXcq3EJ3OorsQKXFoYYFr5Nqfh
         PDdcOGbEqKEos2k0DqzWJp6kVSbCgwrT1K7H4xVYZO88XbLLnsRAU6QwkANrqebaPjdH
         ymykGLXSrEkDxQyHPkLZovKB4SwOB/MpgdH6o8MeMGZLvlxnSHJaMIjYyagOTjP0t8sA
         aVLIu0adMBB2fuWnA02umto4SEftBYbuXWFfqaX5Fa6vafw283SPKq349SImxceYW/8A
         eFI7lPGSN2bL8FgTwxxZzq+TLH56zrzXNkduwy2aupxkz/VcekSDBe45H0dTz9bcIjhr
         nb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764327128; x=1764931928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86KnzvGu3GEj7n2OOgrtzoYiFDBvCiTUgmN8lQcrmNg=;
        b=sneT/dLLDnabsDD5LyUQTywStDMndBs3txcum2vt7M4u2vyD9BwR2bpyhFVumCU0C6
         U7FzB7aDUIv9zso5m/uc0hX4sUJRrly+4CycJX6B1M275nuwJw1DOKP7ALTtK0FXyPD8
         Q0L4D65HYczMjaUzZfgUnKqNH1vpne5jqiCkqe0d6xYFL4qxRqtb6bOZ54PNyCcS4rTu
         G/gGwYeN2oCnX+yEDU+0Kk9sjjQyfKK7XR12VusITvfGq8RFNP3cayBignhjaCGyHJYI
         e+cHrPvxsngrKAVvYq6YWdQR8+itHIfW5WYCbHYosX/DXITbfKrdiIWJXETy0et7YN0p
         StRA==
X-Gm-Message-State: AOJu0YyYf4soeTpQGz3CWGwgZlQhUXjf52qLxhFXqU5CQHT1WVQmuCTN
	bU6Dj8sx0HburTXdFndjU3P/+WPd8I7KKRpp6TNuuKNbodkwr19WAPFZyUTLtOwkpPFKsY1C1Ve
	Fx7npTegA8BCDNmN+Y/wt4Ek0SUgynZS59bgC2Sre8scwS+vH92CvB/TJdWblMXjEJPgATHnqod
	7Z
X-Gm-Gg: ASbGncuCvFHcPvVwmFxUuLf46JMkdXp/CnASTWGxLx57a2oO6IoHsD++Seov0gJRfJq
	HPLbk9d3MVV6x6krVKc431D94O+V1wjGXjtw5+z94Kf6oe3js39uxX0rJO7kZN5/5tPiC+J7i5S
	YziXA1Ncm1yOTqzoEhs+PrzVdOVpQo3AtX8I4U1mQ20lD5FsC/+W0A+n3WOmSIx/vAlNhN1+MLE
	+WmENCXZf4t2Ma6cWBY0Vywb1XvWs+WSNIpFIGq0oQYl1Y7et0C8Ng0rsJs1VNffZRz9XdQKDYC
	gQYTITk9dxa2cnTKWffCSgHdriLQ2l57o2JqZWxVV+aPQRZA1vmyElQO+aeDjG7MYVwW0w3Jg/m
	7JjVqeF4vto2rG/o46oP/34NP+LkTs3Y1TjfmlHMTqxEm+X33x4l4iPQD7Bk/ZIlDpxY=
X-Received: by 2002:ac8:5882:0:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4ee5890a538mr263138141cf.6.1764327128347;
        Fri, 28 Nov 2025 02:52:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/MIO+8FIzsXep4B/K57A72tSDQlBayZ3YTQpTuQMWVPS7WSrr05XyaZaNVpxOe7smpAv5jg==
X-Received: by 2002:ac8:5882:0:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4ee5890a538mr263137811cf.6.1764327127865;
        Fri, 28 Nov 2025 02:52:07 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c68d0sm420699666b.28.2025.11.28.02.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 02:52:07 -0800 (PST)
Message-ID: <1f2c4e5b-2d7d-41cd-9772-374e3de46a50@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 11:52:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251127212943.24480-1-jonathan@marek.ca>
 <aSl48gV9laFb-MR1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aSl48gV9laFb-MR1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: V4v7y-VzFKx-msTdn3EWYaSmqp-kzO-y
X-Authority-Analysis: v=2.4 cv=QOplhwLL c=1 sm=1 tr=0 ts=69297ed9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=5eqlAXZ72RyB-Na0XcUA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3OSBTYWx0ZWRfX2ZjFDn+ST2V8
 F+5TgljnEvIXZd+0xPzdGqhGYSCy5GEoWr25B0JBoC+ONbKp0WYMrVCo+MN+Zfloc+MBshkh7Pr
 k2hw6tXVTMNpy46YsFV+W1t2dZOPC1n/H1sUHD6l6A3i8FOZIbvpJkVD5NXYU5PyOnPfChfMPsK
 yG1pyWrRWcG1QizXLSZtvs2WCMNGX3NJgnl9Z5Qodkp+5Y5UK00J3HHnRV9UG791PjDCn8NZtag
 MZuzJQo8vRCjlIiIxLHXAVPX0ALDkfrrdjAQ5nmjLQ+WmRgPXzXw9u7c9pmvxFDZIuyJ4MxcRAH
 7/ElVnjMXlQrjV8J2Qs1mZCFWOo5NbfvE8F6erXW+mjNRqGRU1jOjW9sxRtH5GNHCj67+bm1s2P
 EFGEHYqJHYAgAectECcIr+0r4V3clg==
X-Proofpoint-GUID: V4v7y-VzFKx-msTdn3EWYaSmqp-kzO-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280079

On 11/28/25 11:26 AM, Stephan Gerhold wrote:
> On Thu, Nov 27, 2025 at 04:29:42PM -0500, Jonathan Marek wrote:
>> Unlike the phone SoCs this was copied from, x1e has a 40-bit physical bus.
>> The upper address space is used to support more than 32GB of memory.
>>
>> This fixes issues when DMA buffers are allocated outside the 36-bit range.
>>
>> Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> index cff34d1c74b60..cd34ce5dfd63a 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> @@ -792,8 +792,8 @@ soc: soc@0 {
>>  
>>  		#address-cells = <2>;
>>  		#size-cells = <2>;
>> -		dma-ranges = <0 0 0 0 0x10 0>;
>> -		ranges = <0 0 0 0 0x10 0>;
>> +		dma-ranges = <0 0 0 0 0x100 0>;
>> +		ranges = <0 0 0 0 0x100 0>;
>>  
> 
> Could you clarify which "issues" (crashes?) you are referring to?
> 
> We need to distinguish two distinct use cases here, which are both
> (somewhat) supported upstream: Running in EL1 with the Gunyah hypervisor
> with the regular DTB and in EL2 with the x1-el2.dtbo applied.
> 
> # EL2 with x1-el2.dtbo
> 
> For EL2, I think the 40-bit dma-ranges should indeed work correctly, so
> we could add your proposed change inside x1-el2.dtso. I'm not sure which
> issues we are fixing with that though (besides correctness of the
> hardware description). In EL2, all DMA devices should be behind an
> IOMMU. In this case, the dma-ranges limit the size of the I/O virtual
> addresses (DMA addresses) that are given to the devices. The IOMMU maps
> the DMA buffers to arbitrary physical memory addresses (including
> outside of the 36-bit range, dma-ranges limits only the DMA address).

I've been carrying something similar in my working tree for quite
some time too.. The USB4 PCIe controllers have BAR spaces in the >36b
region, so this will be necessary anyway.

As for the broken-firmware laptops, there's only so much we can do.
A fix for this has been *long* released, but it's up to the OEMs to
pull it in.


I'm not fully sure, but I think certain subsystems still have the 36b
address limitation (camera?), so it would be good to know whether that
needs to be accounted for

Konrad

