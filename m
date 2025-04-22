Return-Path: <linux-arm-msm+bounces-54967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EBCA9729E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 18:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FA82189C20C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 16:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8C629117D;
	Tue, 22 Apr 2025 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MBGuEXkb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B13314BFA2;
	Tue, 22 Apr 2025 16:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339098; cv=none; b=MLWz4UuKDu0w2T/0hE0wz38wemIO+yLrAZk7XeMdtP273HKjwwd2kIogqTvBN/2cVh2NEoyYCSBUBu/V4AIeWTKeqAOtJTJyIiWDuWhsEipiVwY9r9BcJfG1q789PFBO6c/GVE46Jrq1EN0Md8e+yIAz8JG9xHArQG4+qdldolI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339098; c=relaxed/simple;
	bh=Fd55HwLWpIcUEmhEc2iSRZbNis+L5TuMMcgLmPgwxPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jYwLJ6cSHn72vtrQlDja1V3NReHcnVnLalqLZarg41uG8H/blkLheS6ftTJ6WUR0/C5rhGri+bj9dSlczJbfEVH2zTrkpl9Qe70/HhmMfpThbjkLUR+3oSkzmMq7s5F89UNsy1V35jE5CXK/4phu8SOJFISo74phs8fjDoTheDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MBGuEXkb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCfuRa011409;
	Tue, 22 Apr 2025 16:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+GBlme62cc9ct3j+qFz5egtXSnDnsW+UicVAxIRzACo=; b=MBGuEXkbNgyFZDJG
	uR88ATuPLjt4XdFjw1GWR0MY9vJrVdLMwuYmqi7GSeWX4uPx8I1UHX3lxUfxiuEb
	j7T/hjF/B/5a7hAguzBCffjFZN8odcfbJvlvNkKIo25l29MHvQDH52HzdYB3VZ+Z
	fPF8gNzAfM8i41E1Yx1v7ogWMiMiqvkdpXq+OE+6LDH4PvCxvKYMJqqcNf9aINTR
	Y+zfpQz5IxUQ8fAwgO5Hybnh1ViZB6FgNA271d5HZBgL33SG7xnBMhwlk3j88git
	tJJtH40pBlqG9kG04vLW9maCLp7EGaAIDypftxTfcXVJAby7UyXTAVzuyMGtumrJ
	QbTmGw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46450pg51f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 16:24:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53MGOrb3018244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 16:24:53 GMT
Received: from [10.216.4.61] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 09:24:49 -0700
Message-ID: <56234550-4156-4a3f-b970-7a98bd067e45@quicinc.com>
Date: Tue, 22 Apr 2025 21:54:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] arm64: dts: qcom: sc7280: Add WSA SoundWire and
 LPASS support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@oss.qualcomm.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <20250317054151.6095-3-quic_pkumpatl@quicinc.com>
 <xwspvzrzzhqqhpt5ix2a6itwizmgc7lcazxba2mteccg5d72tp@wrzcr3wflvlp>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <xwspvzrzzhqqhpt5ix2a6itwizmgc7lcazxba2mteccg5d72tp@wrzcr3wflvlp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=6807c2d5 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EkdEwCnvp131_jYCVQ4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cOhq8vOIzzut56-zQnErenpM0EwS3SXe
X-Proofpoint-ORIG-GUID: cOhq8vOIzzut56-zQnErenpM0EwS3SXe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_08,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=818 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220123


On 3/27/2025 7:42 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 17, 2025 at 11:11:45AM +0530, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Add WSA macroLPASS Codecs along with SoundWire controller.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 68 ++++++++++++++++++++++++++++
>>   1 file changed, 68 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 39fbd3c40e47..90b2f6e2b7c0 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -2602,6 +2602,64 @@ swr1: soundwire@3230000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		lpass_wsa_macro: codec@3240000 {
>> +			compatible = "qcom,sc7280-lpass-wsa-macro";
>> +			reg = <0x0 0x03240000 0x0 0x1000>;
>> +
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = <&lpass_wsa_swr_clk>, <&lpass_wsa_swr_data>;
> pinctrl-N
> pinctrl-names

ACK, will takecare on next patchset version.

Thanks,
Prasad

>
>> +
>> +			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
>> +				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
>> +				 <&lpass_va_macro>;
>> +			clock-names = "mclk", "npl", "fsgen";
>> +

