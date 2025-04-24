Return-Path: <linux-arm-msm+bounces-55283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7193A9A52C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 10:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAFB81B679F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 08:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BDF61F582E;
	Thu, 24 Apr 2025 08:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fbAj6z9D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1C719CCEA;
	Thu, 24 Apr 2025 08:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745481953; cv=none; b=rUCvqkkiVNnLT50GMqvsAH7rjUYYDWBAN4l/+e5mVmVOD5YKSoGKyjjJbntew4w0+x5BFoprH9bFd+ccRsHZLyHpUmmzG+mHJUNg59kbjrbbE825TQXb83/vEJlYnM2sHCmpiNVfsyRriRN0sZLGOpluCDmvowjEYxiq/itD+yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745481953; c=relaxed/simple;
	bh=YOqWvqQHNSZzpMeOYXyQ4XYXZbqo1/SLcZjmWmDBC2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SwifY23EGa5RJq0rlBe2czMbFKDozeeXzT70lD195h/1id09UXrnKiM/oBWCn3KTvurK0i9R/oGNa+lHakZCUTRg63HwWwYuaSKef09gSYwHLczdtwpsMhrY5/a0DUTwnBVuD6WQXiRdBNzncVfwc7AOECVvYki3iYxaGFk2j+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fbAj6z9D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F8D0011310;
	Thu, 24 Apr 2025 08:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdVASwzoakQa9tlGahLcn5paQxEMKr5k2AvL8Q6kVNM=; b=fbAj6z9DaAoyR0uZ
	/DbAZT83/gY4pM10j6vUr7IHKyzgjPAXHD2l1cFFYaQjbqtJI7QWuz6wxMA8dOz8
	2xdvR3JCqJCr+4+UoAK/g5Z1BSM+XlLHXgoaCTfpnx7b/4+464Rb82rbfe7BMCSB
	1pXki9YOK5q+O1EQKiawsS5mUbIhWuTRwDpTRVJ4Kx+1mIogpTzyYxuZkd+uk03h
	cj/O2y7PRMmV7CAj2Gb8q5vRmX+kO/4f2yBwMssDz6lJ7jJXBn8NHH5qoHWoxP6l
	7bXL2EooT6GjeVNeEAko34IwdebuKjbYxLjFwU5NrUTZOtuVHDBSAsIbFkD8nE52
	PAwOQA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh24qru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:05:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O85XLr030181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:05:33 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 01:05:27 -0700
Message-ID: <d3d451cd-001a-4162-9332-ed48374a1e84@quicinc.com>
Date: Thu, 24 Apr 2025 16:05:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: dts: qcom: qcs615: enable remoteprocs - ADSP
 and CDSP
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        <linux-arm-msm@vger.kernel.org>,
        Kyle Deng
	<quic_chunkaid@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <kernel@quicinc.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, <devicetree@vger.kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <174541475836.315268.1404586813028809700.robh@kernel.org>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <174541475836.315268.1404586813028809700.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=6809f0d8 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=s6V9Kwf326MwNPl4DvcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EVMKZT0_yKqQOCtgfuD9HdrfypfLGFRb
X-Proofpoint-ORIG-GUID: EVMKZT0_yKqQOCtgfuD9HdrfypfLGFRb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA1MyBTYWx0ZWRfXysIpAJBO8ltu pSigy/2YvGgodlw0DfzU5g4dC7RcJEBKiXF4yS4OmJFNM5z0xO4L14Cgc9txgC6bcC37dDg77zK wESsKpuxO5QkmcMAwqrDki1gJJ4ZEto5Ppir876DCCegKU6hYY5e4jr/mFsdw31rXKBJUtwJq2Q
 8vpK6rCPOqjDoJ4IDl2QAHLsIPSjZWB8VK/8d3Fw9Udd8VLwwqkC5oY2gOJ0G/Fq3soF4td9DLF HUv/nP7blVtCPkSuEegdPKPeCANhzP+AwtuyJyqjHI4hidZZwHugSVxL+e+HvGe0wGFRW7CrKbQ e4kPvqtghURmSuHzy6G3ElB7/3/k8ua6PDq6SdDYOozyfjZK3PLbcG3VnWj1KJdOYZgZeTZh6UH
 F9HI3IhaaF/jvxrOM58qN9QA3/8diM9tFVCL+dl+mACRoC6UtpRuGoIqxfSe5EOS9r3QREpy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240053



在 4/23/2025 9:37 PM, Rob Herring (Arm) 写道:
> 
> On Wed, 23 Apr 2025 17:17:36 +0800, Lijuan Gao wrote:
>> Enable the remote processor PAS loader for QCS615 ADSP and CDSP
>> processors. This allows different platforms/architectures to control
>> (power on, load firmware, power off) those remote processors while
>> abstracting the hardware differences. Additionally, and add a PIL region
>> in IMEM so that post mortem debug tools can collect ramdumps.
>>
>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>> ---
>> Kyle Deng (1):
>>        arm64: dts: qcom: qcs615: Add mproc node for SEMP2P
>>
>> Lijuan Gao (5):
>>        dt-bindings: remoteproc: qcom,sm8150-pas: Document QCS615 remoteproc
>>        dt-bindings: soc: qcom: add qcom,qcs615-imem compatible
>>        arm64: dts: qcom: qcs615: Add IMEM and PIL info region
>>        arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
>>        arm64: dts: qcom: qcs615-ride: enable remoteprocs
>>
>>   .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  59 ++++---
>>   .../devicetree/bindings/sram/qcom,imem.yaml        |   1 +
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  10 ++
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi               | 179 +++++++++++++++++++++
>>   4 files changed, 225 insertions(+), 24 deletions(-)
>> ---
>> base-commit: f660850bc246fef15ba78c81f686860324396628
>> change-id: 20250416-add_qcs615_remoteproc_support-61ddab556c4e
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
> This patch series was applied (using b4) to base:
>   Base: using specified base-commit f660850bc246fef15ba78c81f686860324396628
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com:
> 
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: qcom,smp2p-adsp (qcom,smp2p): 'qcom,sleepstate-in', 'qcom,smp2p-rdbg2-in', 'qcom,smp2p-rdbg2-out', 'sleepstate-out' do not match any of the regexes: '^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|wlan-ap-to-wpss|wlan-wpss-to-ap$', '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml#
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: qcom,smp2p-adsp (qcom,smp2p): {'compatible': ['qcom,smp2p'], 'qcom,smem': [443, 429], 'interrupts': [[0, 172, 1]], 'mboxes': [[30, 26]], 'qcom,ipc': [[31, 0, 26]], 'qcom,local-pid': 0, 'qcom,remote-pid': 2, 'master-kernel': {'qcom,entry-name': ['master-kernel'], '#qcom,smem-state-cells': 1, 'phandle': 218}, 'slave-kernel': {'qcom,entry-name': ['slave-kernel'], 'interrupt-controller': True, '#interrupt-cells': 2, 'phandle': 216}, 'sleepstate-out': {'qcom,entry-name': ['sleepstate'], '#qcom,smem-state-cells': 1}, 'qcom,sleepstate-in': {'qcom,entry-name': ['sleepstate_see'], 'interrupt-controller': True, '#interrupt-cells': 2}, 'qcom,smp2p-rdbg2-out': {'qcom,entry-name': ['rdbg'], '#qcom,smem-state-cells': 1}, 'qcom,smp2p-rdbg2-in': {'qcom,entry-name': ['rdbg'], 'interrupt-controller': True, '#interrupt-cells': 2}, '$nodename': ['qcom,smp2p-adsp']} is valid under each of {'required': ['qcom,ipc']}, {'required': ['mboxes']}
> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml#
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: qcom,smp2p-cdsp (qcom,smp2p): 'qcom,smp2p-rdbg5-in', 'qcom,smp2p-rdbg5-out' do not match any of the regexes: '^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|wlan-ap-to-wpss|wlan-wpss-to-ap$', '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml#
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: qcom,smp2p-cdsp (qcom,smp2p): {'compatible': ['qcom,smp2p'], 'qcom,smem': [94, 432], 'interrupts': [[0, 576, 1]], 'mboxes': [[30, 6]], 'qcom,ipc': [[31, 0, 6]], 'qcom,local-pid': 0, 'qcom,remote-pid': 5, 'master-kernel': {'qcom,entry-name': ['master-kernel'], '#qcom,smem-state-cells': 1, 'phandle': 200}, 'slave-kernel': {'qcom,entry-name': ['slave-kernel'], 'interrupt-controller': True, '#interrupt-cells': 2, 'phandle': 198}, 'qcom,smp2p-rdbg5-out': {'qcom,entry-name': ['rdbg'], '#qcom,smem-state-cells': 1}, 'qcom,smp2p-rdbg5-in': {'qcom,entry-name': ['rdbg'], 'interrupt-controller': True, '#interrupt-cells': 2}, '$nodename': ['qcom,smp2p-cdsp']} is valid under each of {'required': ['qcom,ipc']}, {'required': ['mboxes']}
> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml#
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: remoteproc-cdsp@8300000 (qcom,qcs615-cdsp-pas): interrupt-names:2: 'ready' was expected
> 	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8150-pas.yaml#
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: remoteproc-cdsp@8300000 (qcom,qcs615-cdsp-pas): interrupt-names:3: 'handover' was expected
> 	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8150-pas.yaml#
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: remoteproc-cdsp@8300000 (qcom,qcs615-cdsp-pas): Unevaluated properties are not allowed ('glink-edge', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8150-pas.yaml#
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: syscon@17c0000c (syscon): compatible: ['syscon'] is too short
> 	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: remoteproc-adsp@62400000 (qcom,qcs615-adsp-pas): interrupt-names:2: 'ready' was expected
> 	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8150-pas.yaml#
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: remoteproc-adsp@62400000 (qcom,qcs615-adsp-pas): interrupt-names:3: 'handover' was expected
> 	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8150-pas.yaml#
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: remoteproc-adsp@62400000 (qcom,qcs615-adsp-pas): Unevaluated properties are not allowed ('glink-edge', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8150-pas.yaml#
> 
Thanks for checking. I will fix these warnings in the next patch
> 
> 
> 
> 

-- 
Thx and BRs
Lijuan Gao


