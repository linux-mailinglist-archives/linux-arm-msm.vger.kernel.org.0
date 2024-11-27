Return-Path: <linux-arm-msm+bounces-39343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 901E89DAAEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 16:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F49C16469D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 15:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A001FF7D2;
	Wed, 27 Nov 2024 15:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HxpbOTxr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CB6328B6;
	Wed, 27 Nov 2024 15:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732722176; cv=none; b=fSjVSy5BfaRmuEkLPgSnA3FBQUk3hNG9H+sbRxMLX6wpH+ybytq6G3/Cd8Ia3I7ri4nWyZfjPE2x0xlb6j2wzICHC9SlQ4AS+JT20j/JtzQtWundanf5iRFcw3i0NYRvxxpTn8jLf4kesp1wiajO8XKjLck+sRaU0tf0kP+A9Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732722176; c=relaxed/simple;
	bh=PFXgcJiegBnxIv46gcl53V36a+QKsSehT/vWjTwYGxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nsWzO8xQ8/kNYmPYhFr0QJvjdkskiEDS2oiqr+azk7gV6OoJmNjhcW4bHr8UlM4rnZPN/NdN3Q+YEGWB/B8/hm63uJqDo9QncDfIuaJg2aOXZ378Q2Gq0jL58LvEnEd5CHBhv9XavIE6cavkUrugIowpuSJt0ULYleLka3Jr6+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HxpbOTxr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARBGmS4032267;
	Wed, 27 Nov 2024 15:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yExLqwZGvqmSmj+XIYg07lYtBkvx4ifg0IGpGhPL5/Q=; b=HxpbOTxrVA+rzUA8
	rpoE7CzVuLCGTgJ+RdzEA3X1Ntf81tSp4hj4Q4bOcb7PpL/QUfCf3J3NRgloENPe
	xNEGPyNACTGYad+et56oUzBv3b79SuH6g9CONlUD2whKz8pQeo1hwsigNKKopCzb
	IkwpWbyDkLnXFj+FGVq1DuXSg6ryPrtzbAJrco0wKBOCrcmz6ujRZFcmhdHUX6zt
	pJEtzgoWY0z85D+Ael7lzMqbGmQXlYswcCF73l6s80D/uU1/Hs62mohwp1lY6rek
	M4ejFP7rbvHI6OBlmst03b+RdoQfLzULL/783Yl7C6i2Sga+S2NQ1qlrc/fEb8v1
	M9CfQQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4362dmgren-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 15:42:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ARFgoDr007375
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 15:42:50 GMT
Received: from [10.216.26.141] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 07:42:46 -0800
Message-ID: <8de99bbd-3abe-4ffa-9395-84b81d610875@quicinc.com>
Date: Wed, 27 Nov 2024 21:12:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: sar2130p: add support for
 SAR2130P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring
	<robh@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
References: <20241102-sar2130p-dt-v4-0-60b7220fd0dd@linaro.org>
 <20241102-sar2130p-dt-v4-2-60b7220fd0dd@linaro.org>
 <ff7c9b83-0ac7-43a0-a86a-2fed66728a32@quicinc.com>
 <2hka5j3iyml32czhv6k2gr6ss2jthsgaljva5izhzzcoc3l4eq@slsmyp7s6ars>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <2hka5j3iyml32czhv6k2gr6ss2jthsgaljva5izhzzcoc3l4eq@slsmyp7s6ars>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Z3RVRSFgpHeEGHio3ghcO2kTEfLKesbC
X-Proofpoint-GUID: Z3RVRSFgpHeEGHio3ghcO2kTEfLKesbC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270125



On 11/27/2024 7:32 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 26, 2024 at 11:32:59PM +0530, Krishna Kurapati wrote:
>>
>>
>> On 11/2/2024 8:33 AM, Dmitry Baryshkov wrote:
>>> Add DT file for the Qualcomm SAR2130P platform.
>>>
>>> Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    arch/arm64/boot/dts/qcom/sar2130p.dtsi | 3123 ++++++++++++++++++++++++++++++++
>>>    1 file changed, 3123 insertions(+)
>>>
>>
>> [...]
>>
>>> +		usb_dp_qmpphy: phy@88e8000 {
>>> +			compatible = "qcom,sar2130p-qmp-usb3-dp-phy";
>>> +			reg = <0x0 0x088e8000 0x0 0x3000>;
>>> +
>>> +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>>> +				 <&rpmhcc RPMH_CXO_CLK>,
>>> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
>>> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>>> +			clock-names = "aux", "ref", "com_aux", "usb3_pipe";
>>> +
>>> +			power-domains = <&gcc USB3_PHY_GDSC>;
>>> +
>>> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
>>> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
>>> +			reset-names = "phy", "common";
>>> +
>>> +			#clock-cells = <1>;
>>> +			#phy-cells = <1>;
>>> +
>>> +			orientation-switch;
>>> +
>>> +			status = "disabled";
>>> +
>>
>> Hi Dmitry,
>>
>>   Sorry for asking this question after code got merged. I forgot about asking
>> this last time when I commented on your patch and provided the HS Phy IRQ
>> value.
>>
>>   In SAR2130P, I remember that the lane orientation is reversed. As in on
>> normal targets, if the orientatin GPIO reads "0" it means LANE_A but on
>> SAR2130 it means LANE_B. Can you confirm if superspeed was tested only in
>> one orientation only. >
> Thanks for the notice. I don't remember if I had USB3 or just USB2

Basically during "qmp_combo_com_init()" call, we program the orientation 
based on gpio output from ucsi:

	val = SW_PORTSELECT_MUX;
	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
		val |= SW_PORTSELECT_VAL;
	writel(val, com + QPHY_V3_DP_COM_TYPEC_CTRL);

  On SAR2130P, the above logic is reverse. If the cable is set in normal 
orientation, the SW_PORTSELECT_VAL must be set. You can compare the 
result on some mobile target like SM8550/SM8650 vs SAR2130 to confirm 
the observation.

> connected to the USB-C connector. I will take a look and report
> afterwards, but it might take some time.
> 

  No worries. Just wanted to bring this to your notice. On day-1 of 
bring-up, I did struggle for some time to figure out that the CC 
orientation is flipped since every cable flip was working in High Speed 
as lanes were programmed reverse all the time. I didn't want you to hit 
that issue for when the orientation switch is actually enabled.

  On a side note, there were some issues found in qmp combo phy during 
stress testing which are specific to SAR2130P. I can try and fix them up 
after you confirm the above test results now that the target is actually 
present on upstream.

Regards,
Krishna,

