Return-Path: <linux-arm-msm+bounces-52676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F35D7A73A34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 18:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90E66188C7CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 17:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0B91B424D;
	Thu, 27 Mar 2025 17:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFObRSTT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D531A8418
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 17:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743095617; cv=none; b=SUDkAlioeypZLWqAGLSBd5b1vUNWikxBGGh/yAJ7rinQawgsbXuEfDRyFTgX24BILkTzOjml4nH4frZtNi3jsqphHiS9bg5lv4zOl3nRQtZquGg7dxSzOuSFIfXRKFkGWPFbKuccRpdCPNN8ihJ5fvLRXi+k4w8k5qt+q9J4rmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743095617; c=relaxed/simple;
	bh=Ry2ql3oYn0+PXs++SMI2qhXTuxptcdhdy+H9lwOmsdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XRfLRvUqtrJIhX78hMEDC5/SUE2teRI0fnfzkWNAauqth1Hg56pfh2vn8GNaWRc2sZA6ns6L9OD/sZ5vgl74XVUOPjIlFDFdM4cjqdkMIa5RGLEpQyp19KUTOuZcyGo0mAQW075BkBczU4e3sjdhSTZ7iS2TQWaEDSZ3v/cNLnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFObRSTT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RETqI7021230
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 17:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nZNnq/2n+A+VOod1fjxwK/OJhSfOHOhjsmc4N6VyA3A=; b=oFObRSTTJLII0Xwl
	2bBaLR/gf1iwr0hdOsJeTOcJxU6plM3mQYjUSLT9QaCijm0z8A7INDile9r4aQsC
	KdZ3gk30FQwgRqNPTD07RG9s8DgRFVF+8Q+FmoeJCbg8KsmcPcwWVeskuRfqQkrZ
	Ez0Vhuc7h4GAFPan8v8KNCETVkIi5JgWycGLH3+9xeOcs8fLafz3acLOLEpSFF6L
	m0NNJTtqU/Weo04YrA7hhvWdwx23oH1LBmDA1o26SEQdH1F4kqv3Z06RBx9NAhkA
	CBnmKs3BzhnoVCnr52od7xDKFMOuy90WCjxejaqi5P/cQ5YacY+hrMoMSsrOZxpO
	xK+nZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kyr9q4ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 17:13:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ad42d6bcso29530485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 10:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743095613; x=1743700413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZNnq/2n+A+VOod1fjxwK/OJhSfOHOhjsmc4N6VyA3A=;
        b=FqGDIItL9vZMWIOb+6GoMOX+/xiypjKuNAVUH/BCf8m+3RM5mqv54gmjgA0OiWJ3ro
         IqMko58DQjwPSN27LKX8NvSQ4BovaHd7Jz0bwmeQohtZm6+P9qsjBybi6m3OFqavo3pY
         u/ANAwJDtdUHqWzyX98LXQOE86FKIUtzA8e4VUmeLkCruAiZBb52FjBJLQ1ViS3drvgR
         OEFKSKkyhnbatNOPvwhCoYR9kppV2vbD3HTn6MmJ5EXr1mfVslcLElyt8t4OCAX1YXGH
         m41zWJfPYXIBG5ens6BPPT5i/0WY52W2sbSUIm4sgZYmfV3iYrOuLCrVQbNBuJzqGrjU
         1Bbw==
X-Forwarded-Encrypted: i=1; AJvYcCVa3xnZX8bCysM9Lkl6pYnNNn4l9OoiNNwwc0CHkZx6vjRBZ8SlTcCh8vIB8i+p2fzRSvnEZ/MTXGxFBdW8@vger.kernel.org
X-Gm-Message-State: AOJu0YwG6sv6md0xAM6WpwRdwUEVMk2pzVQLd7xH8US0h+jq1eI7SU+l
	o68hItMKYVpx4d2nP+C0UTBLb/pmNKag8v7qzutKphgK5MOKno2o2GC5Azh9YXVdjHtQonflOqg
	WcIemG0h4uhUuF4uEiZQw4Cd8qW82MqAQ3STmOq5A1y/9mImu3maY9MoVDpkNJjIU
X-Gm-Gg: ASbGncvPs8hEeB/yNV7apjD30nuRLnlD9eT7h5NFw3O99I3slaqP43SrppDXWEI1CJw
	MEc3AISFM5lsDM1yex6Uhq93qHQWN06VzVg+0F7gvr2JgI5CyLxrV2eegzcSQeMPj/TtUoQhrT6
	//47fUpjUiuTi9+tIZaC3TvGrZMyhel3+kQrN3TAXy5doYNqXkh4COY+0lqCtC09FTcT9VlDWo4
	uhaHWGTXIzMjs92f6UnsT9ElR4AjI02euHUuNA+wqNz6UT09g4Kg/6dr1r8Ag/MQDePSgW/K95C
	PGXDtjIk22N9cI28zTtGuL0H0werU7DmXZCByQ4rG9wL4JEsLw8TkfQNan8e75t8qoB9QA==
X-Received: by 2002:a05:620a:24c1:b0:7c5:75ad:5c3a with SMTP id af79cd13be357-7c5f7c2662fmr20089485a.8.1743095611592;
        Thu, 27 Mar 2025 10:13:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtb3fH9DtqhD3xsA7DIKr92vSXeiPbO4fQg4BdyVVvqQIp1LaEpYpP1zSRICVWP4L8cnvlVg==
X-Received: by 2002:a05:620a:24c1:b0:7c5:75ad:5c3a with SMTP id af79cd13be357-7c5f7c2662fmr20087585a.8.1743095611113;
        Thu, 27 Mar 2025 10:13:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f9absm22821366b.103.2025.03.27.10.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 10:13:30 -0700 (PDT)
Message-ID: <12e011f2-1aa3-4e95-a081-bf81e00912c2@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 18:13:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm2290: Add crypto engine
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250327142842.1138203-1-loic.poulain@oss.qualcomm.com>
 <h3ol4qc242w7h3u7uiywxyc2v6op6cvxhzuk2dx5q5dvhitolp@pb6c53ki3cag>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <h3ol4qc242w7h3u7uiywxyc2v6op6cvxhzuk2dx5q5dvhitolp@pb6c53ki3cag>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iuKEOmoxQGFB2Mo1ckK4GzSJAvVsStw3
X-Authority-Analysis: v=2.4 cv=UblRSLSN c=1 sm=1 tr=0 ts=67e5873e cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=L3SEVPxwON1qY0H_nQ8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: iuKEOmoxQGFB2Mo1ckK4GzSJAvVsStw3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_02,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270117

On 3/27/25 4:05 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 27, 2025 at 03:28:42PM +0100, Loic Poulain wrote:
>> Add Qualcomm Crypto Engine (QCE) and BAM related nodes for this SoC.
>>
>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 28 +++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>> index f0746123e594..c9ac06164d43 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>> @@ -749,6 +749,34 @@ config_noc: interconnect@1900000 {
>>  			#interconnect-cells = <2>;
>>  		};
>>  
>> +		cryptobam: dma@1b04000 {
>> +			compatible = "qcom,bam-v1.7.0";
>> +			reg = <0x0 0x01b04000 0x0 0x24000>;
>> +			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
>> +			clock-names = "bam_clk";
>> +			#dma-cells = <1>;
>> +			qcom,ee = <0>;
>> +			qcom,controlled-remotely;
>> +			iommus = <&apps_smmu 0x0084 0x0011>,
>> +				 <&apps_smmu 0x0086 0x0011>,
>> +				 <&apps_smmu 0x0094 0x0011>,
>> +				 <&apps_smmu 0x0096 0x0011>;
>> +		};
>> +
>> +		crypto: crypto@1b3a000 {
>> +			compatible = "qcom,qcm2290-qce", "qcom,qce";
>> +			reg = <0x0 0x01b3a000 0x0 0x6000>;
>> +			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
>> +			clock-names = "core";
>> +			dmas = <&cryptobam 6>, <&cryptobam 7>;
>> +			dma-names = "rx", "tx";
>> +			iommus = <&apps_smmu 0x0084 0x0011>,
>> +				 <&apps_smmu 0x0086 0x0011>,
>> +				 <&apps_smmu 0x0094 0x0011>,
>> +				 <&apps_smmu 0x0096 0x0011>;
> 
> Don't these fall into the previous entries + mask? The same question
> applies to BAM SMMU entries.

(effective sid = e.g. 0x0084 & ~0x0011)

Konrad

