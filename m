Return-Path: <linux-arm-msm+bounces-77361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C91BDE01E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1D62F355882
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82678306483;
	Wed, 15 Oct 2025 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F77YPgJu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53CF31D743
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760524120; cv=none; b=JkDnvsuwnuI5lbSs3k3kCJUBkcULthY29ehDg59REI5ErMOCx96p4uHhB+pzz0U92huq2LmcJbD8GaQtZf5kHUEaj6pYLj3YlrU0gGEG2/icnUTeshaLMFsBq4yCPXw01r5d+A8UV2rqFZ3WvyZCo1/BhfaqV0tSu8Jf8pTd0pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760524120; c=relaxed/simple;
	bh=0tvqjA5g5nXTtWkmeWJomxbNRZvUvJaMshuYYM2spUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hp6341ztZ/G0iwUoRYQsVpp7FPKWQtjDYK/9F+BdvqSrt71oKrHK/J4+goVjHvDIxMtmuooDgrEJ+T2J3jsh7CgZJeLEoTQldC7Q44GzSH/3PnqknUY2guESg/qzvO2uWGWUKaZcICt0NdcBYZVQz3vfLIo6K6NS1PnxcAwuf28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F77YPgJu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sSMU004236
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OtCuBzfMS782vxBLNrbSA6yWo7+oKeRaHTDzQnpUByc=; b=F77YPgJufPc4+VPB
	aUtGpNZb3u+Dncakf0e5YdtCVESkYOjvfINYg9aELyOuCiVDpJ5pH1msWoAFcyHv
	Y/X6bs6PBZcefBcZpBnd7F9mO/WjgV00kDq5xn3bc5LA9nHMig7YUi5TKUBd+yVN
	hf+R3TL6qk0yCfw2iuW4NapYMXl4YD3foUZma4eZKTGuRhlImkgaPq0nhqiHg3XD
	xQoPvgtNAHYzuaVebEKjOeH7wtVp0cNxbW9V/hF1zWKG3F0zLW40JsINdcxto74X
	h3xzv5YGfJzg2kayjecLmRgcNrGNwvavhlhtYEQeEIxYnwVGPjwmrfclCslDiaso
	dunnDA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwpbnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:28:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6474cf4573so7082807a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760524117; x=1761128917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OtCuBzfMS782vxBLNrbSA6yWo7+oKeRaHTDzQnpUByc=;
        b=uCh4jSfyo9HOxsIKyK48CWhD43IeJEquhGuglPLkrQ1w9JaA37z7nj/IyZYs5ATm7b
         FLn3UgLx1xEEj1oEQ+Za2QiLLRl/BEBMemYAkZyjMUuQwm8R9MG21wkg6LTXguut011X
         b2jJ8zOE1aaV6zroHSUllGkYMD9gs13pYOB8Kc03X89jctCOx1m2UGg8k9dNEVAjm4hd
         /ip0cmcvROkCcjKXhsip4SdRcmKj8tKGJ34E025HpN4wgECOULi7TaUIsKUOdAOyuPMq
         SlU0KCDcZjGs7nottNiUxU84gh/xCMXgFDAo/omM3C9gOv/c7Dg6/LS/TR/s9WnKL46o
         EgpA==
X-Gm-Message-State: AOJu0Yw60UEZSuF1BpX+nu+SeRn+GuAvnr+I5kXKhqC5JkOvCUeGd+1f
	3VYY1MnUEeA7L1yLyArMCgtSSA3PC1KOaGPHkiYYLbVF59//ZZfou6EOkLhOQfwlWEoMnrlZ/8c
	QHs9mIdxrjgr6X74Q2J0rxz77QszrfQeIGLce0I9HR2XFdCIxDpTHCIFqlPGOwFAOYYCL
X-Gm-Gg: ASbGncsCSukN0qQ6q88mFAZZ/Tc7L6rwCArStNaiMkhdwZyWz/acvWi7bNl2kJ8E8xR
	AISfiytvbezBQHbKpcrZdTSGPejhnmyF/AQdU7wuUXyYXFm49AwMprh5QqPz4ADKKTBrv1yMuYb
	wf59AH/5zCE7D569I+2A45bzvNAai1c3G7q0rjD8KYUVMR22Je/CDbzXsOSGzkEocMminSsN07B
	vlvVqonY/UV18z36o8QkSifSO7tVtzpQnYabvcONRjYCZgIRNc/GAYSvtQ8jW7dajSYle2b/tz7
	5pS/MBABkw/FBdybdY+/oUQnfWNWoslhqHRPCmud5lRLtlxcZljxf/B89cNh3esJitVov9g=
X-Received: by 2002:a05:6a21:32a3:b0:303:b64b:e44 with SMTP id adf61e73a8af0-32da83e38bemr35878496637.43.1760524117202;
        Wed, 15 Oct 2025 03:28:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFMeBDWmLwGmtvM1sNbU+BcXtiGukpKU9b6FpL+kUTBWyczFWyDH0DN4wWF25eRGbf5yYZSg==
X-Received: by 2002:a05:6a21:32a3:b0:303:b64b:e44 with SMTP id adf61e73a8af0-32da83e38bemr35878463637.43.1760524116776;
        Wed, 15 Oct 2025 03:28:36 -0700 (PDT)
Received: from [10.218.44.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb1e50dsm18263043b3a.33.2025.10.15.03.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 03:28:36 -0700 (PDT)
Message-ID: <235cf6b7-e758-4d16-b5a1-182cc869b2e4@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 15:58:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/24] arm64: dts: qcom: glymur: Add QUPv3 configuration
 for serial engines
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-4-24b601bbecc0@oss.qualcomm.com>
 <8828946b-3979-4e7b-a11c-740d8a6253ce@oss.qualcomm.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <8828946b-3979-4e7b-a11c-740d8a6253ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX80JpQqOH97kH
 KDmjGtOv5ACYaC5aw01BO3fw34f+EFBGpOoLhf+XWcuSSjU7g4aZoeauWygxGqxC+cNoGIawMq4
 P/buZOkQm8Njyy7lcFucoDjkOjOWjXJ7nwQHkUxMN3UUUHrSBH2JsiXp/gWZhnoAWVyUz36plfQ
 lr+BxFE93qImjpNGQdNgL2woSUFs0eow6SaINyOnSlhPFBupmu3DGaB8P10n+Bcd/IwLamY1ftx
 hxiybylzYMUA+aatEyNPEpRWh99ia06h9z06nexow4y85oBDdI1IM75PP8ooTFYF6CQUdqu3yEE
 HmpT3dLdfl01WS359rAnZYWhpryDYAEuW4hc1/SU219O7nLUFBAGv2D6NocrnWMbD21i5jDtnwN
 RksDgA0xvG7P6KWEcTS2gZv8EONAFg==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ef7756 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5RRmG2Rm61FAXBKOsCEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: S6TKTVkD3OikaKXfhrrWnhqVkcutC8Ge
X-Proofpoint-ORIG-GUID: S6TKTVkD3OikaKXfhrrWnhqVkcutC8Ge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083



On 9/25/2025 3:48 PM, Konrad Dybcio wrote:
> On 9/25/25 8:32 AM, Pankaj Patil wrote:
>> From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>
>> Add device tree support for QUPv3 serial engine protocols on Glymur.
>> Glymur has 24 QUP serial engines across 3 QUP wrappers, each with
>> support of GPI DMA engines.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		gpi_dma2: dma-controller@800000 {
>> +			compatible = "qcom,glymur-gpi-dma", "qcom,sm6350-gpi-dma";
>> +			reg = <0 0x00800000 0 0x60000>;
>> +			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_ESPI 129 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_ESPI 130 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_ESPI 131 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_ESPI 132 IRQ_TYPE_LEVEL_HIGH>;
>> +			dma-channels = <16>;
>> +			dma-channel-mask = <0x3f>;
>> +			#dma-cells = <3>;
>> +			iommus = <&apps_smmu 0xd76 0x0>;
>> +			status = "ok";
> 
> this is implied by default, drop

Hi Konard,

Do you mean we should remove the status property for all QUPs and 
GPI_DMAs from the common device tree (SOC) and enable them only in the 
board-specific device tree files?

> 
>> +		};
>> +
>>   		qupv3_2: geniqup@8c0000 {
>>   			compatible = "qcom,geni-se-qup";
>>   			reg = <0x0 0x008c0000 0x0 0x3000>;
>> @@ -718,6 +744,339 @@ qupv3_2: geniqup@8c0000 {
>>   			#address-cells = <2>;
>>   			#size-cells = <2>;
>>   			ranges;
>> +			status = "ok";
> 
> ditto
> 
> (please resolve all occurences)
> 
> [...]
> 
>> +		cnoc_main: interconnect@1500000 {
>> +			compatible = "qcom,glymur-cnoc-main";
>> +			reg = <0x0 0x01500000 0x0 0x17080>;
>> +			qcom,bcm-voters = <&apps_bcm_voter>;
>> +			#interconnect-cells = <2>;
>> +		};
>> +
>> +		config_noc: interconnect@1600000 {
>> +			compatible = "qcom,glymur-cnoc-cfg";
>> +			reg = <0x0 0x01600000 0x0 0x6600>;
>> +			qcom,bcm-voters = <&apps_bcm_voter>;
>> +			#interconnect-cells = <2>;
>> +		};
>> +
>> +		system_noc: interconnect@1680000 {
>> +			compatible = "qcom,glymur-system-noc";
>> +			reg = <0x0 0x01680000 0x0 0x1c080>;
>> +			qcom,bcm-voters = <&apps_bcm_voter>;
>> +			#interconnect-cells = <2>;
>> +		};
> 
> This diff becomes unreadable really fast.. please play with git
> format-patch's --patience option
> 
> Konrad


