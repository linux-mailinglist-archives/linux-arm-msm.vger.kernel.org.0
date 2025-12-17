Return-Path: <linux-arm-msm+bounces-85518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3482CC7DEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A621302C4C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F29E3659F0;
	Wed, 17 Dec 2025 13:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJD3XkNO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJnN+Txb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9C4364EBF
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978399; cv=none; b=DyOIxLtA7pv0mEwT+ACU3omlSJPy4mCPY9500ZD//wvCTVWoLYjg+kJYg5QCAtpd9/WevEGY9/KCpKvh2MCPhdBMqoknhqAt5plw/IZKeoSC0+s5frXeRNS+MBJG/DLj9K6Qx3DCjy0B54XRuOXV5HlwzzTpemfi/p8EOEW7k/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978399; c=relaxed/simple;
	bh=LDbCHflosL0ko8Od/F+AII6jXWfSoY/3+Zli7nI+CIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NdDeAOs/eNg9KNmjIz96k2uNNfSYZquJTuUDg/1Pn7F0O534s7y8lYUevngxfecYJHLPA6lXVPjy4Ng41p/zqLF4wUMJPu+rc5b1NRjNnuK6sOv8ozB1oS/nCYz30iw+bwvYQac8NrJ0UMi2+vHgpWRPUFE3soD8u/rSMuINDfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJD3XkNO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJnN+Txb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKoW52465110
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	670vN864gC3iB2bSJ0zYYlz3U0Y8dJI6J9VlkkC8Zf8=; b=CJD3XkNOMmVDiPgN
	8HzvggxK+Pm08SDgncNA8FVI8TFgsrSJf6VFzL8do7egYQ8OlTTGo9jlEFH5lRn6
	EN1EG+QibXsrRPFU2JjwdY6fKm8LpwU0aI8x1YBPWnU1aoJ9HG20+DmE+Xcuus/N
	KkcKO9Nkefj6By1qtv55Kp2Q7Y7O5FTTlNelCWDcRVU48EcH6mkX6fGHWzrD3SUz
	TLQqkFn485zSvMgPZCg4wDE/ENOysyf621lASP+8quCwzZIygShCSUWzjvU7BOY9
	6GNnv0n+MUBIivaEvGpSSvLuUIvBH4t6C0UlNrT7Ul/e3ucpcDMSpV//5AesEwQ/
	3rO7Xg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fe2ahfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:33:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edaa289e0dso22069041cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 05:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765978396; x=1766583196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=670vN864gC3iB2bSJ0zYYlz3U0Y8dJI6J9VlkkC8Zf8=;
        b=hJnN+TxbQ6vnYrNOSQjUgfOjbnHPaU8i9xWGqacGZasm+64M/Ao0fl/uy2csH1Gbc1
         l7LpYm33B67EktZv0OIIWll8OXPUrlDi/Tv3bAQz1sJMZGlXo7zFf4DKGmIy7gBMoN2p
         L3otL0MGjZn2LXbIMAh+qKLQRKFy4AKc+BB0XyIei2jt6C8a4TG3L7/vwrGTUU0WMUHJ
         VcB6WOz4iDKxyIpAsGtqKLYSzKg1RzjOTgske3ZFA0WdFDTt32+pLS83JUciDUR8Ws1S
         2yemQZEtmE7/4SV5suiSVTutZUX//ErZzqQ2R4R+enH0/UzKq7KLjxoFWC1Wpb+4Gp6A
         9IMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765978396; x=1766583196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=670vN864gC3iB2bSJ0zYYlz3U0Y8dJI6J9VlkkC8Zf8=;
        b=t9lo9VvW9Ongq4jJaXvSN+WuKbPRwhdvCY7HtGj7Uirjn0fXg1fR0A/5LZB4FD7mCm
         sDIiSUz9ozvZsgPgrH5VIBQT0jfOAW7HK8gIbfrWvwfGtPayFJOC9gttLtIcll3bVOLP
         IxgF80jw/ymddcnST5XAQRjrupE/ck+V7xne9oe7elrwKGH8yuHPQh5mzfQ7JHDcG0O3
         SgXZD/U9CAx9etRWghdlcWig1spPz++tr/nd641rEkDLbkhWcxeUBio8VLDqch9ACA93
         cu3tdemox/cCfvwaToi9nChbKDic3hEgrRRC5pttUBz6P5MCPw6gIXLg8Lmh5x+khCvp
         uLew==
X-Gm-Message-State: AOJu0YwdaoDjQyOEKEVhKVGnyUnRhe09oWnefTu2KY13/tnNCdEz8CVq
	BVROn41VZoJZUwD3T0nHMBvhWr8e7Hh8/m4tfn/jAGFSZhyiAk7Dp6650N4nf0BXGo6+PYIUpqT
	R7JzWLpbZO4Edcrxx5/jsfUUBuIzld78N5SQqECJf9YLNVZ5TIphdMJU4rUv5UML4yr5Z
X-Gm-Gg: AY/fxX6JvlaQqLn4tbmB9LT3vgCLxdTnDbdH7HkjA4CWK+8ejN/BfVU2xyNKgDUIDl7
	TTUy1BSMHOCVNTyTgMweVZP20dcZCipF0EOcvrnaJs2A7LdR+/o6+CNp9v/YqP5k9IVR+xfxSk2
	E36qZ5YrfBEpdp29Dkcpd2SEkny8aUE5/7zGRC4Irl7AazTUuchcyuRRrzLjVbG22irjRGaT4Y5
	Bgkdt6NdbtjfUoiQ+sAVhtW6wRxLCzRjW3Y4S23QSAhk9uvIhGOKBe8wRxPsamBeKcpfvusJ7+M
	qWyh7aHPBmJirkFiyVGCoI+/6oVGZ78ZAqLByoYInkT5gMVWg8dBpHU0LgXeVFL8yLxUliTRcUp
	6mFRe6e5px/CvTKWvk0cJxuHyhpJKA9xJmBLky6+s0ljEiYUi2tZJi5wY4CrmezTu9Q==
X-Received: by 2002:a05:622a:341:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4f1d04ab2d9mr182525761cf.2.1765978396183;
        Wed, 17 Dec 2025 05:33:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEV2GtJC2y4ocuXNUmv6DgExU4nq3+bWwZFAeKoHPEqx7LXt6gOi+fSveFCQU5Wg71/SuWM7Q==
X-Received: by 2002:a05:622a:341:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4f1d04ab2d9mr182525391cf.2.1765978395754;
        Wed, 17 Dec 2025 05:33:15 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5c9d22sm1999658466b.61.2025.12.17.05.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:33:15 -0800 (PST)
Message-ID: <6d93c8ac-4d56-4a4a-94d6-08dbfd9d4a9f@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:33:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
 <20251023-qcom-sdm660-cdsp-adsp-dts-v2-1-895ffe50ab5f@mainlining.org>
 <9009eb8b-309d-4ddc-bb3f-081b974b1fa0@mainlining.org>
 <c778f58c-0075-41a5-b230-db6df1f98329@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c778f58c-0075-41a5-b230-db6df1f98329@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XnjGLzS6ZOZoXVer0q41YXWahEJQ-2dp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwNSBTYWx0ZWRfXwAXfQZwwBH9o
 hkVW5ooY+Dky01R2uq185dSvoVE7armDOoLNZzPZrH8AQRzP8Yi1yTz1Uxli4Sr3uW6UVKX6+sj
 6mNHV+LlkxAyF/snEOr2xdEOYgT9qfn8bHZ3STgBxl/LCuFx1I9tayO2Au15XxhDsfVSNN9vITC
 b9V70YjRcShvIXWMCUq0RCjDVeCf1waniMmJv9OvLZhPe5P5llTvBALnnhXFre8f5ZT8bDWLEfy
 PDvjiAlZ1ED5RjG/f4fJbuFOCTqSOxUEuTqKZcwYyr2ThCs9dM54rgq6w4t1Fu8DOPp1DUhu6HN
 nZ6630ACDgXt5CkudYmIxSHGplQSKxv2rcHduCBXdp0MecxPSPY7m70nk2wkQA+Zfo7MLA0pe+E
 wJIKxbl/NMXy7+7KlkPpFF/lnTiuHA==
X-Proofpoint-ORIG-GUID: XnjGLzS6ZOZoXVer0q41YXWahEJQ-2dp
X-Authority-Analysis: v=2.4 cv=HpN72kTS c=1 sm=1 tr=0 ts=6942b11d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=OuZLqq7tAAAA:8
 a=c7Ujzj7b83SAP-xecCUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170105

On 12/11/25 3:30 PM, Nickolay Goppen wrote:
> 
> 11.12.2025 15:24, Nickolay Goppen пишет:
>>
>> 23.10.2025 22:51, Nickolay Goppen пишет:
>>> In order to enable CDSP support for SDM660 SoC:
>>>   * add shared memory p2p nodes for CDSP
>>>   * add CDSP-specific smmu node
>>>   * add CDSP peripheral image loader node
>>>
>>> Memory region for CDSP in SDM660 occupies the same spot as
>>> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
>>> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
>>> cdsp_region, which is also larger in size.
>>>
>>> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
>>> related nodes and add buffer_mem back.
>>>
>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm630.dtsi |   2 +-
>>>   arch/arm64/boot/dts/qcom/sdm636.dtsi |  23 +++--
>>>   arch/arm64/boot/dts/qcom/sdm660.dtsi | 162 +++++++++++++++++++++++++++++++++++
>>>   3 files changed, 177 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> index 8b1a45a4e56e..a6a1933229b9 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> @@ -563,7 +563,7 @@ modem_smp2p_in: slave-kernel {
>>>           };
>>>       };
>>>   -    soc@0 {
>>> +    soc: soc@0 {
>>>           #address-cells = <1>;
>>>           #size-cells = <1>;
>>>           ranges = <0 0 0 0xffffffff>;
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm636.dtsi b/arch/arm64/boot/dts/qcom/sdm636.dtsi
>>> index ae15d81fa3f9..38e6e3bfc3ce 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm636.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm636.dtsi
>>> @@ -7,15 +7,20 @@
>>>     #include "sdm660.dtsi"
>>>   -/*
>>> - * According to the downstream DTS,
>>> - * 636 is basically a 660 except for
>>> - * different CPU frequencies, Adreno
>>> - * 509 instead of 512 and lack of
>>> - * turing IP. These differences will
>>> - * be addressed when the aforementioned
>>> - * peripherals will be enabled upstream.
>>> - */
>>> +/delete-node/ &remoteproc_cdsp;
>>> +/delete-node/ &cdsp_smmu;
>>> +/delete-node/ &cdsp_region;
>>> +
>>> +/ {
>>> +    /delete-node/ smp2p-cdsp;
>>> +
>>> +    reserved-memory {
>>> +        buffer_mem: tzbuffer@94a00000 {
>>> +            reg = <0x0 0x94a00000 0x00 0x100000>;
>>> +            no-map;
>>> +        };
>>> +    };
>>> +};
>>>     &adreno_gpu {
>>>       compatible = "qcom,adreno-509.0", "qcom,adreno";
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
>>> index ef4a563c0feb..d50cce25ccbe 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
>>> @@ -9,6 +9,37 @@
>>>     #include "sdm630.dtsi"
>>>   +/delete-node/ &buffer_mem;
>>> +
>>> +/ {
>>> +    smp2p-cdsp {
>>> +        compatible = "qcom,smp2p";
>>> +        qcom,smem = <94>, <432>;
>>> +        interrupts = <GIC_SPI 514 IRQ_TYPE_EDGE_RISING>;
>>> +        mboxes = <&apcs_glb 30>;
>>> +        qcom,local-pid = <0>;
>>> +        qcom,remote-pid = <5>;
>>> +
>>> +        cdsp_smp2p_out: master-kernel {
>>> +            qcom,entry-name = "master-kernel";
>>> +            #qcom,smem-state-cells = <1>;
>>> +        };
>>> +
>>> +        cdsp_smp2p_in: slave-kernel {
>>> +            qcom,entry-name = "slave-kernel";
>>> +            interrupt-controller;
>>> +            #interrupt-cells = <2>;
>>> +        };
>>> +    };
>>> +
>>> +    reserved-memory {
>>> +        cdsp_region: cdsp@94a00000 {
>>> +            reg = <0x0 0x94a00000 0x00 0x600000>;
>>> +            no-map;
>>> +        };
>>> +    };
>>> +};
>>> +
>>>   &adreno_gpu {
>>>       compatible = "qcom,adreno-512.0", "qcom,adreno";
>>>       operating-points-v2 = <&gpu_sdm660_opp_table>;
>>> @@ -247,6 +278,137 @@ &mmcc {
>>>               <0>;
>>>   };
>>>   +&soc {
>>> +    cdsp_smmu: iommu@5180000 {
>>> +        compatible = "qcom,sdm630-smmu-v2", "qcom,smmu-v2";
>>> +        reg = <0x5180000 0x40000>;
>>> +        #iommu-cells = <1>;
>>> +
>>> +        #global-interrupts = <2>;
>>> +        interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 541 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 542 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 545 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 547 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>,
>>> +                 <GIC_SPI 549 IRQ_TYPE_LEVEL_HIGH>;
>>> +
>>> +        clocks = <&gcc GCC_HLOS1_VOTE_TURING_ADSP_SMMU_CLK>;
>>> +        clock-names = "bus";
>>> +
>>> +        power-domains = <&gcc HLOS1_VOTE_TURING_ADSP_GDSC>;
>>> +
>>> +    };
>>> +
>>> +    remoteproc_cdsp: remoteproc@1a300000 {
>>> +        compatible = "qcom,sdm660-cdsp-pas";
>>> +        reg = <0x1a300000 0x00100>;
>>> +        interrupts-extended = <&intc GIC_SPI 518 IRQ_TYPE_EDGE_RISING>,
>>> +                      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
>>> +                      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
>>> +                      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
>>> +                      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
>>> +        interrupt-names = "wdog",
>>> +                  "fatal",
>>> +                  "ready",
>>> +                  "handover",
>>> +                  "stop-ack";
>>> +
>>> +        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
>>> +        clock-names = "xo";
>>> +
>>> +        memory-region = <&cdsp_region>;
>>> +        power-domains = <&rpmpd SDM660_VDDCX>;
>>> +        power-domain-names = "cx";
>>> +
>>> +        qcom,smem-states = <&cdsp_smp2p_out 0>;
>>> +        qcom,smem-state-names = "stop";
>>> +
>>> +        glink-edge {
>>> +            interrupts = <GIC_SPI 513 IRQ_TYPE_EDGE_RISING>;
>>> +
>>> +            label = "turing";
>>> +            mboxes = <&apcs_glb 29>;
>>> +            qcom,remote-pid = <5>;
>>> +
>>> +            fastrpc {
>>> +                compatible = "qcom,fastrpc";
>>> +                qcom,glink-channels = "fastrpcglink-apps-dsp";
>>> +                label = "cdsp";
>>> +                qcom,non-secure-domain;
>>> +                #address-cells = <1>;
>>> +                #size-cells = <0>;
>>> +
>>> +                compute-cb@5 {
>>> +                    compatible = "qcom,fastrpc-compute-cb";
>>> +                    reg = <5>;
>>> +                    iommus = <&cdsp_smmu 3>;
>>> +                };
>>> +
>>> +                compute-cb@6 {
>>> +                    compatible = "qcom,fastrpc-compute-cb";
>>> +                    reg = <6>;
>>> +                    iommus = <&cdsp_smmu 4>;
>>> +                };
>>> +
>>> +                compute-cb@7 {
>>> +                    compatible = "qcom,fastrpc-compute-cb";
>>> +                    reg = <7>;
>>> +                    iommus = <&cdsp_smmu 5>;
>>> +                };
>>> +
>>> +                compute-cb@8 {
>>> +                    compatible = "qcom,fastrpc-compute-cb";
>>> +                    reg = <8>;
>>> +                    iommus = <&cdsp_smmu 6>;
>>> +                };
>>> +
>>> +                compute-cb@9 {
>>> +                    compatible = "qcom,fastrpc-compute-cb";
>>> +                    reg = <9>;
>>> +                    iommus = <&cdsp_smmu 7>;
>>> +                };
>>> +
>>> +                compute-cb@10 {
>>> +                    compatible = "qcom,fastrpc-compute-cb";
>>> +                    reg = <10>;
>>> +                    iommus = <&cdsp_smmu 8>;
>>> +                };
>>> +
>>> +                compute-cb@11 {
>>> +                    compatible = "qcom,fastrpc-compute-cb";
>>> +                    reg = <11>;
>>> +                    iommus = <&cdsp_smmu 9>;
>>> +                };
>>> +
>>> +                compute-cb@12 {
>>> +                    compatible = "qcom,fastrpc-compute-cb";
>>> +                    reg = <12>;
>>> +                    iommus = <&cdsp_smmu 10>;
>>> +                };
>>> +
>>> +                compute-cb@13 {
>>> +                    compatible = "qcom,fastrpc-compute-cb";
>>> +                    reg = <13>;
>>> +                    iommus = <&cdsp_smmu 11>;
>>> +                };
>>> +            };
>>> +        };
>>> +    };
>>> +};
>>> +
>>>   &tlmm {
>>>       compatible = "qcom,sdm660-pinctrl";
>>>   };
>>>
>> I've found out that all (both ADSP's and CDSP's) fastrpc-compute-cb's in downstream are defined under the one node [1], and all of them are handled by one adsprpc driver. There's a node [2], where a memory-region is assigned to this driver.
>>
>> Does this mean that both DSP's are using this one region for FastRPC?
>>
>> [1] https://github.com/pix106/android_kernel_xiaomi_southwest-4.19/blob/main/arch/arm64/boot/dts/vendor/qcom/sdm660.dtsi#L1349
>>
>> [2] https://github.com/pix106/android_kernel_xiaomi_southwest-4.19/blob/main/arch/arm64/boot/dts/vendor/qcom/sdm660.dtsi#L1342
>>
> I've also noticed that both DSP's are connected to the mas_crypto_c0 bus [1].
> 
> Is this bus neccessary for DSP's to use the FastRPC?

No, that's covered by the SCM device

Konrad

