Return-Path: <linux-arm-msm+bounces-36985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0309BC0BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 23:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5D401F228BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 22:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECE21D5CE7;
	Mon,  4 Nov 2024 22:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kjx+V1ag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488532AF12;
	Mon,  4 Nov 2024 22:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730758712; cv=none; b=ovWj0qY6NdBuT1utpO6bIgvtnIJOtsz9dIZCz/Na44xTlPMHNgKL3dghdOWJrvvLkGOZhbXV+kvG/WxMcLngQwKM6hUFDyVb3OlmCTz8UWY7ag+GUddHDYyVfxZvzoM/JxO6A+1xmg3P6G8AdDB20oezHnf0vTiC5Xc6DmCSOrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730758712; c=relaxed/simple;
	bh=Eldt51JfsVSZnk2wiDpPmLNco+zZ1T6j4jwUKD0C0Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GtLY8wsd51oih7Unm0S1aSY0KSH5bS3rPE6OxMZBvRNqkcZhT5Y8q636pr3DGWb6delfWORcpOjQKGZTvIqIvMtfQn0IKyk2z+YgxW5T4bHlQ2p8Vof9R14ENHj7kYDQpML2QrAVhHkpP/IboAKVRpfnp4NssX9tTGiRAYyYCeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kjx+V1ag; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LIoBV021589;
	Mon, 4 Nov 2024 22:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tt807o6JdzN3CcSuYLasKXg5k4EIONlXGEsrwB97bbM=; b=kjx+V1agbn3w4mi9
	NSSa5IOf6v0Efju6R9QMzXib47eobqFyF/LTxfCTQ07NneAiHf6w9W6CWAD1H6Jw
	YUG2r1QVgyH34tvO2ZjQUGsaLFlQP3RI+K2M4JMZBkyUtxW0VUzWO4uCf1+49xLa
	nUoDZLgHz/BXsinXWs/ej8/ivi52ZAHNK4iRAwaYk/rbD4/bG3IclkqoZZ7oAx8+
	egaYc4YjSAF9ZWHQ3JzKk4FTLVzodP8Apw33gqHis0558iKFNj2Z1DhFbjUOyYVt
	nm+pKxuqavzPLYBgqKBUOtp6pfVngz7TqNZC2cTUYjrzy1pb70R3EjgEzI1aD3dH
	jyN/ag==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ncyxwjk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 22:18:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A4MIBOR013462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 22:18:11 GMT
Received: from [10.71.108.63] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 4 Nov 2024
 14:18:10 -0800
Message-ID: <a2d34549-b433-4126-b61b-912109de7d33@quicinc.com>
Date: Mon, 4 Nov 2024 14:18:10 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add base sm8750 dtsi and mtp and
 qrd dts
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
        Stephen Boyd <sboyd@kernel.org>, Trilok Soni <quic_tsoni@quicinc.com>,
        "Satya
 Durga Srinivasu Prabhala" <quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jishnu Prakash
	<quic_jprakash@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <20241021232114.2636083-5-quic_molvera@quicinc.com>
 <c4407327-1060-4805-abb8-0c7bcb067ee4@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <c4407327-1060-4805-abb8-0c7bcb067ee4@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qihZL2cftjhuKzEzmqRwHr6EBJMQ36Gi
X-Proofpoint-GUID: qihZL2cftjhuKzEzmqRwHr6EBJMQ36Gi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040178



On 11/2/2024 2:36 AM, Konrad Dybcio wrote:
> On 22.10.2024 1:21 AM, Melody Olvera wrote:
>> Add base dtsi for the sm8750 SoC describing the CPUs, GCC and
>> RPMHCC clock controllers, geni UART, interrupt controller, TLMM,
>> reserved memory, interconnects, regulator, and SMMU nodes. Also add
>> MTP and QRD board dts files for sm8750.
>>
>> Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> Co-developed-by: Jishnu Prakash <quic_jprakash@quicinc.com>
>> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
>> Co-developed-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
>> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
> [...]
>
>> +&spmi_bus {
>> +	pm8550ve_d: pmic@3 {
> These usually go to a separate file each.. But I see why that would
> be difficult here.
>
> Lately I've been a fan of <socname>-pmics.dtsi. WDYT, Bjorn?

SGTM, if Bjorn is fine w it, I can make that change; I'll do it similar 
to x1e80100-pmics.dtsi.

>
> [...]
>
>> +		apps_smmu: iommu@15000000 {
>> +			compatible = "qcom,sm8750-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>> +			reg = <0x0 0x15000000 0x0 0x100000>;
>> +
> [...]
>
>> +			#iommu-cells = <2>;
>> +			#global-interrupts = <1>;
> This is usually dma-coherent, you can determine that through a smoke
> test

Ah yes good catch; this is supposed to be dma-coherent. Will add.

>
>> +		};
>> +
>> +		intc: interrupt-controller@16000000 {
>> +			compatible = "arm,gic-v3";
>> +			reg = <0x0 0x16000000 0x0 0x10000>,     /* GICD */
>> +			      <0x0 0x16080000 0x0 0x200000>;    /* GICR * 12 */
> These comments are copypasted gen to gen and don't bring much
> information atop what's in bindings
>

Ack. Will remove.

Thanks,
Melody

