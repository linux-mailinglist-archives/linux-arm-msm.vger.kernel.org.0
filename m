Return-Path: <linux-arm-msm+bounces-44330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E57BA0552A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 09:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECCF4165ED6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 08:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45FA21ACEBA;
	Wed,  8 Jan 2025 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KTxR0P5u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAAF13B288;
	Wed,  8 Jan 2025 08:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736324484; cv=none; b=EHSM4/Bgo/lKN3XJjUwInET/ixc41l/vg2wOypziTCaNPEoZiiPwUh1Fq7A+ta1Emxw93N1u173BI2Q47neGiPSGNYTkdRuBq2VZIR/2Tf1tgfu+2pWIW+X6qJcngAnyl1ygBJs8mWlwrHNgUdaakLVpd7p60zkrO0o+UKny3t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736324484; c=relaxed/simple;
	bh=jwBW0HA5sSpZ3Sv+gxfQudRgUoee76TNfDEugDjn6tI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ate7TVUL9NfPGTU1HYBMYe6RYMQiNLV9lc6aLcPDV8uCoUhAfMVBJOARXaXrfnwD4PqK/psyzuhwDZ15Yb/1wzIXcJnJIaSIfvRJYyfY2MYpnUhfGrrWPEppI8HiHSfHuYpEos14aV+aJtv956OWMA0oxvHVVXnabfZ6xW2xtik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KTxR0P5u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50829ps7017552;
	Wed, 8 Jan 2025 08:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iGd/aoxmFfTgRJcu1d8QAEXd/JUUWfsl02GLKmPEa80=; b=KTxR0P5uiZaBkAXw
	i7ZvaMfrm6eNIn9KhHsf9ZDJqoDu5nZJHSQQGS5KWrvakVZwuCHE/zdbKqi5zK/p
	IcxdoxeTFf0HdHupMHXQtwXtICUlqAFqgn1zyE0Dyp/6Ikp8wkJduUj6Qj5baS3F
	9DLAfVRYtD6F0rVeMZ5+Au+Zc48V0ZRK37DrK5QJ0M5juZxxsYRvVrY/xB//dmfN
	B5oc4FJRXz4+MUEzqIoGXBEznbN3Gn45Y9vplZz4obXHxYDGgMRPW0RE8fOYGpsU
	ffsFsNXUF6C0VjpsdU4UOLxN6rIFHAKxtS2JYaRSpOJuyRYZkOU8CO7zUyZo9kDo
	KpR3tA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441gb58tpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 08:21:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5088LAak025745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 08:21:10 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 00:21:07 -0800
Message-ID: <8cb5aa2d-54a7-4f41-b07c-b3c8256bf762@quicinc.com>
Date: Wed, 8 Jan 2025 16:21:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs8300: add display dt nodes
 for MDSS, DPU, DisplayPort and eDP PHY
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241226-dts_qcs8300-v2-0-ec8d4fb65cba@quicinc.com>
 <20241226-dts_qcs8300-v2-1-ec8d4fb65cba@quicinc.com>
 <85d6703c-ffd2-4a57-93f2-db00f054a864@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <85d6703c-ffd2-4a57-93f2-db00f054a864@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8q8FuyOgDkR2FEi9ZjOQM_8RcMcxeNXd
X-Proofpoint-ORIG-GUID: 8q8FuyOgDkR2FEi9ZjOQM_8RcMcxeNXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080067



On 2024/12/30 22:34, Konrad Dybcio wrote:
> On 26.12.2024 11:43 AM, Yongxing Mou wrote:
>> Add devicetree changes to enable MDSS display-subsystem,
>> display-controller(DPU), DisplayPort controller and eDP PHY for
>> Qualcomm QCS8300 platform.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 204 +++++++++++++++++++++++++++++++++-
>>   1 file changed, 203 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> index 80226992a65d867124b33dfa490c3c9ca1030c75..8d88fe4a266432f05192d7ef0dd80362bdbdab85 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> @@ -952,6 +952,206 @@ camcc: clock-controller@ade0000 {
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		mdss: display-subsystem@ae00000 {
>> +			compatible = "qcom,qcs8300-mdss";
>> +			reg = <0x0 0x0ae00000 0x0 0x1000>;
>> +			reg-names = "mdss";
>> +
>> +			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +					<&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +			interconnect-names = "mdp0-mem",
>> +					     "mdp1-mem",
>> +					     "cpu-cfg";
> 
> Only the CPU path should be ACTIVE_ONLY, the rest should be
> QCOM_ICC_TAG_ALWAYS
> 
Thank for point it. will update it in next patch.
>> +
>> +			resets = <&dispcc MDSS_DISP_CC_MDSS_CORE_BCR>;
>> +
>> +			power-domains = <&dispcc MDSS_DISP_CC_MDSS_CORE_GDSC>;
>> +
>> +			clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
>> +				 <&gcc GCC_DISP_HF_AXI_CLK>,
>> +				 <&dispcc MDSS_DISP_CC_MDSS_MDP_CLK>;
> 
> Please align the property order with x1e80100.dtsi
> 
Ok got it thanks. will update it as x1e80100.dtsi in next patch.
> [...]
> 
>> +			mdss_dp0_phy: phy@aec2a00 {
>> +				compatible = "qcom,qcs8300-edp-phy", "qcom,sa8775p-edp-phy";
>> +
>> +				reg = <0x0 0x0aec2a00 0x0 0x19c>,
>> +				      <0x0 0x0aec2200 0x0 0xec>,
>> +				      <0x0 0x0aec2600 0x0 0xec>,
>> +				      <0x0 0x0aec2000 0x0 0x1c8>;
>> +
>> +				clocks = <&dispcc MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
>> +					 <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>;
>> +				clock-names = "aux",
>> +					      "cfg_ahb";
>> +
>> +				power-domains = <&rpmhpd RPMHPD_MMCX>;
> 
> The PHYs generally sit on a MX-like rail, please verify this
> 
We are currently verifying this power domain. We will validate it and 
update it accordingly. Thank you for pointing this out.
> Konrad


