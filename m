Return-Path: <linux-arm-msm+bounces-48348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA39DA39D02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 14:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A03827A32D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 13:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED37267B1E;
	Tue, 18 Feb 2025 13:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mEoZZXjW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D566226738D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 13:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739884226; cv=none; b=TsjrKW2qDhpdkce8OrfD2eSc/ctryXThvPBG6EdLGwNnUUn0hPj6y76LIRuNBOepMhZ6Wp1Q6Vk9esefIT2xMe0PbHOTDbbLpwjLqeRGSATLPwe9usNJmo9OjutOeqW5qx0U2jDFWOLMwSpdZ0JFNyCItYQIoyFhrLzgr0wSbsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739884226; c=relaxed/simple;
	bh=2NX/soq7o1lmsjPfkOJXZgeMODahB3el6IQKzgFoXO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=moz+Fo7v+j5wx/xFntxyLIAhGW7xP2tkfEnUEjPgq6J9wItAEEMYDIJD5LJ5PWJZ70rgOfFhCJFRasIFXgOzSACFnYY/GTkjJ8Fr9hwpMZKcMcOZU5vhPCZTvRPRJmXokm2HZih5gqM6mSODBdvkiA22y4iiQBBJKz1XY+lsFtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mEoZZXjW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IASrns010736
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 13:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bu+FrAFzuDjPYs9/S2U5VhFeI0pxwHRuzCoCg2u+mJE=; b=mEoZZXjW7wH3BjfN
	YKr3q5FdUFJ3ZqTs9IwtJrNR6FG02i6BLnvctz7xfoNniEoWj4qckmhSJxoonNy7
	f2/rX0+5aMNQddbBiBthfxW5XxPRcKsIoQ4l49uvyg495dLwUz2Z1PSJy4J+WEAm
	gu73UxuzwMLKHDyX8dTz/pQ0J+eY+d5PVXAPl98GpN39wy3vadaabvlxSFPCnfHv
	si3f9M6QCpy8Zo1V6SjCFSae9JiV3ha0JzMFK5oBR0zFbKMEqnnG3kOnAMh/rh6f
	vsnZWHEy8PJ6KdUBnpkzf+/yDP3RS/+dMkZ1OgWeriAtrIiFCZrAO0wQQ9lanW09
	FhZLuA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7smxc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 13:10:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e1b2251f36so10423576d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 05:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739884222; x=1740489022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bu+FrAFzuDjPYs9/S2U5VhFeI0pxwHRuzCoCg2u+mJE=;
        b=FmQGFDPqgcs4TQj4LEJeW/Pe2SG5vUf4rBWpR+M4+A7yiyV7r4fRauYW+x2BykkhE1
         aq2h3zQwe9P6PULLbjD3sSOCbAvPtVZkd2J18sffFsft+k6MsGUWHdHPotYpKCJk7jIq
         kjbpk7lWdYROxSBF8nMYlrgIuEw+bMNMf2gn9E/Pe99JM5dI63wwyzo8kTiSrSWR1suI
         IjrYQZfvpgbgj2baI+DNfrMp8B3Enn58vZBp49ikWgaTTa7HlmV9KVPHLuyz5k/VEpDJ
         q4fYod/K/UprnSx1FzUa/rVUyyJ9pSZPT0+ghg0uFmJ8KesVmAW/bQ8JyaChZcD5CPc9
         +azQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxeEQCl4j48+keuHUxYf212CXOhPaie9yYmCCc83LqwV6bGDP6pp7IzHA01F6A6dgAW3Tkz7vHEOJvO//E@vger.kernel.org
X-Gm-Message-State: AOJu0YwJEmacPjEXfcYr31CgH+Kpoc3u0999Kqi6zOTtXQMyVNshs2ZJ
	BOjGc5bH0K6HVJUZqSO2smbD5S7Rdq8i+Vah92q0JOXaWIeQ7QPgTTTAf7Vf++xvAxCAcMsjWFc
	R5AK051VjJDGjcZJivKFB/Qg6gOJvQXU6ampIXCr3w6yRVPygKJT6W6jFQ4ba5NEI
X-Gm-Gg: ASbGncuM97blbrVJaHo36BkrcnCOHDfx5pp3FwT/0s16FlREVaFi9ckA4aeOnMZjTT/
	EXnGAWeFq6J5ORH/qDB62U/FAgkybkYna3dHjJX8f8kJb9Y0KW9gNY1MJ0Fzm5hi/0HayUDOvi0
	nPKDa0NQH0TGwGAAIWFa7aeVuA0tykwKx2PywbUDaAjC6LNUg+xWmU+xmxvuNv9tFg2wM/s2ZvP
	ntpW+by4FpnBAkIyLvf9PfVzlMTz8AEeTU1LOJobYjYAKCzWybw0sCPhv9ehsRfnPh91Oye8LbG
	4KMRpe8pD0XymT52Ea0bfD0/I22mEWzUoanjsjPSvyK2OdWQ8a1EuxXD+Ag=
X-Received: by 2002:a05:6214:20c2:b0:6d8:a091:4f52 with SMTP id 6a1803df08f44-6e66cd087f1mr65192406d6.7.1739884222594;
        Tue, 18 Feb 2025 05:10:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPVrEvTNH6ixtQsdRndhLJ8B4JHgPLPktdDd05jwA+9wZRDTdteTM3DAb60xvi3qVRSo9nWw==
X-Received: by 2002:a05:6214:20c2:b0:6d8:a091:4f52 with SMTP id 6a1803df08f44-6e66cd087f1mr65192196d6.7.1739884222252;
        Tue, 18 Feb 2025 05:10:22 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb95cc7451sm436932366b.92.2025.02.18.05.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 05:10:21 -0800 (PST)
Message-ID: <39efdf43-1f42-4361-85ed-f41df8347471@oss.qualcomm.com>
Date: Tue, 18 Feb 2025 14:10:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sar2130p: add PCIe EP device nodes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250217-sar2130p-pci-v1-0-94b20ec70a14@linaro.org>
 <20250217-sar2130p-pci-v1-5-94b20ec70a14@linaro.org>
 <17aa47df-1daf-4ec2-8f6a-48c3bc375dd3@oss.qualcomm.com>
 <qafwztwsn3eiz76ot4ej7uv3ahprrri7u6x5jt3tvkx4j7xu34@5yeaj2d5a535>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <qafwztwsn3eiz76ot4ej7uv3ahprrri7u6x5jt3tvkx4j7xu34@5yeaj2d5a535>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pzWXAxk6gJ6EAv7NVMp8-ewGvb27MXzT
X-Proofpoint-ORIG-GUID: pzWXAxk6gJ6EAv7NVMp8-ewGvb27MXzT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_05,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=854
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502180101

On 18.02.2025 4:11 AM, Dmitry Baryshkov wrote:
> On Mon, Feb 17, 2025 at 08:23:28PM +0100, Konrad Dybcio wrote:
>> On 17.02.2025 7:56 PM, Dmitry Baryshkov wrote:
>>> On the Qualcomm AR2 Gen1 platform the second PCIe host can be used
>>> either as an RC or as an EP device. Add device node for the PCIe EP.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sar2130p.dtsi | 53 ++++++++++++++++++++++++++++++++++
>>>  1 file changed, 53 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
>>> index dd832e6816be85817fd1ecc853f8d4c800826bc4..7f007fad6eceebac1b2a863d9f85f2ce3dfb926a 100644
>>> --- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
>>> @@ -1474,6 +1474,59 @@ pcie@0 {
>>>  			};
>>>  		};
>>>  
>>> +		pcie1_ep: pcie-ep@1c08000 {
>>> +			compatible = "qcom,sar2130p-pcie-ep";
>>> +			reg = <0x0 0x01c08000 0x0 0x3000>,
>>> +			      <0x0 0x40000000 0x0 0xf1d>,
>>> +			      <0x0 0x40000f20 0x0 0xa8>,
>>> +			      <0x0 0x40001000 0x0 0x1000>,
>>> +			      <0x0 0x40200000 0x0 0x1000000>,
>>> +			      <0x0 0x01c0b000 0x0 0x1000>,
>>> +			      <0x0 0x40002000 0x0 0x2000>;
>>> +			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
>>> +				    "mmio", "dma";
>>
>> vertical list, please
> 
> Ack
> 
>>
>>> +
>>> +			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
>>> +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
>>> +				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
>>> +				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
>>> +				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
>>> +				 <&gcc GCC_DDRSS_PCIE_SF_CLK>,
>>> +				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>,
>>> +				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>,
>>> +				 <&gcc GCC_QMIP_PCIE_AHB_CLK>;
>>
>> please make sure this one is actually required
> 
> Hmm, this one seems to be present in pcie0 and pcie1 RC, but in the EP
> deivice (in the vendor DT). Are you saying that it is not used for the
> EP? I think I just c&p'ed RC clocks here.

QMIP clocks did something special. I don't recall what clock ops are
translated to, but I suppose keeping them online makes sense..

>>
>>> +			clock-names = "aux",
>>> +				      "cfg",
>>> +				      "bus_master",
>>> +				      "bus_slave",
>>> +				      "slave_q2a",
>>> +				      "ddrss_sf_tbu",
>>> +				      "aggre_noc_axi",
>>> +				      "cnoc_sf_axi",
>>> +				      "qmip_pcie_ahb";
>>> +
>>> +			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
>>> +			interrupt-names = "global", "doorbell", "dma";
>>
>> and here
> 
> This is used for the eDMA implementation. Unlike the vendor kernel,
> there is no separate device for eDMA.

Sorry, I wrote this before looking at the clocks, I meant please make
interrupt-names a vertical list, too

Konrad

