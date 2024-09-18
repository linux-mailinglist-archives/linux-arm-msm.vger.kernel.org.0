Return-Path: <linux-arm-msm+bounces-31945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA2D97B6D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 04:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B0A51C21AA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 02:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4B641C69;
	Wed, 18 Sep 2024 02:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N2vYRpUF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C921D10A1C;
	Wed, 18 Sep 2024 02:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726627043; cv=none; b=cN4JUohxyoKv67M0cypU8ngmhj0f55eZ0xzKPDLbU/FjwlumfpLfOL7nFC5og4D5x0zxLVCxezf5EbihF8RxZ7KpvsBu5yhqbufy8kl41EXWb2qdmY9bGn4sjy723nBw+gNqUGCZtZg9siGYRAMIUds3ls16tGZ3F0cpEUVeXTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726627043; c=relaxed/simple;
	bh=2SgDmPF2tu0rxh8NLZGVhv66VyP/tU2WlRm3WvEadSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ntAihGSPgbaq4r/+eoP6vLWkM/sDkReEvHUSBV63SS/0bI4XT4FWQ5H/ef1Var6ilkUN0ljV9nXwb+8+wytevo78rvo3ydca+uVMb2Xntd64uuHFzIbIoYzmTJT4+hqoTq5VTmh/3Lbj6dhxXVFhlkZETq9zo+YsluxQtWhvuBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N2vYRpUF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HIo1X0014062;
	Wed, 18 Sep 2024 02:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n0Q9RprhLJjui0lSDTxr9f9l24/VUBMygwI7Buzzqdc=; b=N2vYRpUFrCncU0kw
	KpfU7pkM0ngg6VpTP3KGNL+oOq8I9gSzwFQJ372M58iEoWoWPhHcy0YqDD/PUJFD
	rhrjbhxBM7+EzPKyAOydhnbLn51fnHb5VNgcU//lG9qSoQBcKw7izQaSOB/Iz4AO
	z1fsId+1/q2CE5N1uGAytA3cXWRzKFuTgI59eWh2KAXYylrWT+kr/3peiAnj4qzD
	fg51umZU1MrU9aYj9uRrR9ORpm720UrmsB00QV5FI/oaga9lhCVf99/nrReFIe9E
	B2e3BING8oSm07hqORbJkRCTqTjLODcHWCUuMIz243mgNL6kmoaXjK4rdLJ7qLh/
	y+4zYA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4ge8eus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 02:37:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48I2b4jZ006782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 02:37:04 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 19:36:58 -0700
Message-ID: <900aa614-d735-4aaa-ab73-bee30231aa25@quicinc.com>
Date: Wed, 18 Sep 2024 10:36:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Add initial support for QCS615 SoC and QCS615 RIDE
 board
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <devicetree@vger.kernel.org>, <kernel@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>
References: <20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com>
 <172623730756.4076334.1076664597052385217.robh@kernel.org>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <172623730756.4076334.1076664597052385217.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _IHIhUdMJoTT6oE6s4g9U6kIQZ4ltxyX
X-Proofpoint-ORIG-GUID: _IHIhUdMJoTT6oE6s4g9U6kIQZ4ltxyX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409180014



在 9/13/2024 10:24 PM, Rob Herring (Arm) 写道:
> 
> On Fri, 13 Sep 2024 19:55:22 +0800, Lijuan Gao wrote:
>> This introduces the Device Tree for the QCS615 platform.
>>
>> Features added and enabled:
>> - CPUs with PSCI idle states
>> - Interrupt-controller with PDC wakeup support
>> - Timers, TCSR Clock Controllers
>> - Reserved Shared memory
>> - QFPROM
>> - TLMM
>> - Watchdog
>> - RPMH controller
>> - Sleep stats driver
>>
>> This series are splited into three parts:
>> - 1-3: Binding files for QCS615 SoC and PDC (Reviewed)
>> - 4  : Soc table entry (Reviewed)
>> - 5-6: Initial DTSI and RIDE board device tree
>>
>> Bindings Dependencies:
>> watchdog: https://lore.kernel.org/all/20240912-add_watchdog_compatible_for_qcs615-v1-1-ec22b5ad9891@quicinc.com/
>> qfprom: https://lore.kernel.org/all/20240912-add_qfprom_compatible_for_qcs615-v1-1-9ef2e26c14ee@quicinc.com/
>> tcsr: https://lore.kernel.org/all/20240912-add_tcsr_compatible_for_qcs615-v1-1-5b85dd4d42ad@quicinc.com/
>>
>> Build Dependencies:
>> tlmm: https://lore.kernel.org/all/20240910-add_qcs615_pinctrl_driver-v1-0-36f4c0d527d8@quicinc.com/
>>
>> Patch made the following verifications:
>> - Successfully pass dt_binding_check with DT_CHECKER_FLAGS=-m for earch binding file
>> - Successfully pass dtbs_check with W=1 for dts
>> - Verified CPU Hotplug and online CPUs on QCS615 ride board
>> - Checked pinctrl-maps path
>> - Verified Watchdog functional with "echo 1 > /dev/watchdog", can trigger
>>    a watchdog bark and later bite
>> - Verified functional with DCC console function on QCS615 ride board
>> - RPMH controller driver probed successfully
>> - Sleep stats driver probed successfully and checked qcom_stats
>>    node on QCS615 ride board
>>
>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>> ---
>> Changes in v2:
>> - Collected reviewed-bys
>> - Removed extra blank line
>> - Removed redundant function
>> - Renamed xo-board to xo-board-clk and move it and sleep-clk to board dts
>> - Renamed system-sleep to cluster_sleep_2
>> - Removed cluster1
>> - Added entry-method for idle-states
>> - Added DTS chassis type
>> - Added TCSR Clock Controllers
>> - Added Reserved Shared memory
>> - Added QFPROM
>> - Added TLMM
>> - Added Watchdog
>> - Added RPMH controller
>> - Added Sleep stats driver
>> - Link to v1: https://lore.kernel.org/r/20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com
>>
>> ---
>> Lijuan Gao (6):
>>        dt-bindings: arm: qcom: document QCS615 and the reference board
>>        dt-bindings: arm: qcom,ids: add SoC ID for QCS615
>>        dt-bindings: qcom,pdc: document QCS615 Power Domain Controller
>>        soc: qcom: socinfo: Add QCS615 SoC ID table entry
>>        arm64: dts: qcom: add initial support for QCS615 DTSI
>>        arm64: dts: qcom: add base QCS615 RIDE dts
>>
>>   Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
>>   .../bindings/interrupt-controller/qcom,pdc.yaml    |   1 +
>>   arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  34 ++
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi               | 511 +++++++++++++++++++++
>>   drivers/soc/qcom/socinfo.c                         |   1 +
>>   include/dt-bindings/arm/qcom,ids.h                 |   1 +
>>   7 files changed, 555 insertions(+)
>> ---
>> base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
>> change-id: 20240910-add_initial_support_for_qcs615-1a96c3469728
>>
>> Best regards,
>> --
>> Lijuan Gao <quic_lijuang@quicinc.com>
>>
>>
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y qcom/qcs615-ride.dtb' for 20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com:
> 
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: compatible:0: 'qcom,qcs615-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
> 	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: Unevaluated properties are not allowed ('compatible' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/efuse@780000: failed to match any schema with compatible: ['qcom,qcs615-qfprom', 'qcom,qfprom'] > arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/syscon@1fc0000: 
failed to match any schema with compatible: ['qcom,qcs615-tcsr', 'syscon']
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/pinctrl@3100000: failed to match any schema with compatible: ['qcom,qcs615-tlmm']
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: watchdog@17c10000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['qcom,apss-wdt-qcs615', 'qcom,kpss-wdt'] is too long
> 	['qcom,apss-wdt-qcs615', 'qcom,kpss-wdt'] is too short
> 	'qcom,apss-wdt-qcs615' is not one of ['qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-msm8226', 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250']
> 	'qcom,kpss-wdt' was expected
> 	'qcom,scss-timer' was expected
> 	'qcom,apss-wdt-qcs615' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
> 	'qcom,msm-timer' was expected
> 	'qcom,kpss-timer' was expected
> 	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/watchdog@17c10000: failed to match any schema with compatible: ['qcom,apss-wdt-qcs615', 'qcom,kpss-wdt']
>
There are some dependencies. The above errors are fixed by the following 
patches：
1. failed to match any schema with compatible: ['qcom,qcs615-qfprom', 
'qcom,qfprom']
  Fixed by 
https://lore.kernel.org/all/20240912-add_qfprom_compatible_for_qcs615-v1-1-9ef2e26c14ee@quicinc.com/
2. failed to match any schema with compatible: ['qcom,qcs615-tcsr', 
'syscon']
  Fixed by 
https://lore.kernel.org/all/20240912-add_tcsr_compatible_for_qcs615-v1-1-5b85dd4d42ad@quicinc.com/
3. failed to match any schema with compatible: ['qcom,qcs615-tlmm']
  Fixed by 
https://lore.kernel.org/all/20240910-add_qcs615_pinctrl_driver-v1-0-36f4c0d527d8@quicinc.com/
4. failed to match any schema with compatible: ['qcom,apss-wdt-qcs615', 
'qcom,kpss-wdt']
  Fixed by 
https://lore.kernel.org/all/20240912-add_watchdog_compatible_for_qcs615-v1-1-ec22b5ad9891@quicinc.com/
> 
> 
> 
> 

-- 
Thx and BRs
Lijuan Gao

