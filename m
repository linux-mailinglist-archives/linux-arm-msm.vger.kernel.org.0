Return-Path: <linux-arm-msm+bounces-57292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E0DAB009C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B80E57AFAB6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C1B28315D;
	Thu,  8 May 2025 16:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aqbnaF2b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64C378F32;
	Thu,  8 May 2025 16:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746722634; cv=none; b=lA6t+AvNTlf0TgQu8XUCUDjHFwD4jTWXgu8Cifs3wv++NkUxNS8+YpCV3tp6kuR/EcmGaDvP0zG/8uoHmj8EugSxDpxziKrQSBqLKLTDTEamMQ4cB66IHoeHTiElrYykhAjpPAuerTkNdKqYxeIFN9s5OH2k0HHW2SanEK6cIxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746722634; c=relaxed/simple;
	bh=jhgHhhEWR3p39tpsnJOLSNiWmpCcu4pZ9KMg5Ergn2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ovUTMEDeSuUD3TVf88YE6l6wO9oun+L9wu6DQ8k4PNjSXxgnWTXAtYv+ixw7RllJ803kqu8dgi/1u0rRoefSmFhI0i1IWf8nQtXMgYyXIxDXz51UO6nmfpTzBMFQNrMPsQKynX3o5Dbb/ZQjnmTZGj4hoJgPsa+sCxHKzjEUsww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aqbnaF2b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548CwkvU008621;
	Thu, 8 May 2025 16:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQgxzTpKegiTRxompQHqKWjAWoUKZvATIqLgXpZXQrQ=; b=aqbnaF2b9TiSacuB
	4O0abu1L1n5zSiveGbwpe6ZyXQenExD0JqaN5kJMbsC6k1LRounaZ9n0dIvxruZv
	Ls//RVR81NTyE9RX8hqzbVpxgKl+vQp6+hFkzCU1b0bAcG11g1NxWo6ye5ij4aJ0
	PIhX8HuVrJm6nm5TcK/wk6vF4pNmXvMODNPb2J8hP8auZXWacTgOac0HDOvn5sKK
	DNwSHWK6vpDeVxkklH5jYAi8FwLOhvI2EBYR6A/De/3UGgkbT8MXGz+aQRdITwX/
	7rr0AFP67uWWiVB2yoH+WxvSIdE+gXYVZiTh+Ra3IMCCaHw4JpRZlTdiy/ySIad6
	N450kg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5a0e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 16:43:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548GhlZK028393
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 May 2025 16:43:47 GMT
Received: from [10.216.33.253] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 09:43:42 -0700
Message-ID: <36e01393-f56d-4c78-b08d-3626df9a7b9b@quicinc.com>
Date: Thu, 8 May 2025 22:13:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830
 speakers amplifier
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@oss.qualcomm.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-5-quic_pkumpatl@quicinc.com>
 <af6200f6-2abb-432d-a196-01a7e77f2649@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <af6200f6-2abb-432d-a196-01a7e77f2649@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681cdf44 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=vC_a7ZyuHw2JGkk7z40A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 12CqDRlP2dcVMSshuwVXea_YcbfMjsjY
X-Proofpoint-ORIG-GUID: 12CqDRlP2dcVMSshuwVXea_YcbfMjsjY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE0NiBTYWx0ZWRfX1bzfFuHN6jEN
 9WwuPuydKX/IyP12Aw7bXrC1mcwxswM7VYKJz27ksSMVVrGaI4vc0TDziYYjOpkkOzZAuUfmY9q
 URIFzxDhKngfb6KKwN1OvLUvOCI39WAsU4jLQ9mo8b5ZXWtZYUKglxFSPNbNBWrukdfd1W0pg0y
 ZYWMp1N6IyAzaOd+OP8aS2cp5JmU0f7FxAfXJGl0L4nS3427L4c4prVWuVczZ07zlp0iCWFKcIF
 LpG3Nc4YZfzj/WuXp6SnK/D9GPwLSDH7werzsDRiwhTtGlV4bo34kanGcjpBRextNWjmm/W5oHH
 u+5YAtovxSveu8zt6hQ9NQ8BZIRIsS/K1gNiozXWfAzbBYkgrKvy9Syz2Q7XrwM5aHcKGXDaOuP
 v6WsKSOytQw81aknum+cMR461WTBTCcqNPdrlRSTKjXFQeSShM0ffRHd8O2A5qLexDgF3+Pk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=835
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080146



On 4/29/2025 4:27 PM, Konrad Dybcio wrote:
> On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.
>>
>> Enable lpass_wsa and lpass_va macros along with pinctrl settings
>> for audio.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 70 ++++++++++++++++++++
>>   1 file changed, 70 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 5fbcd48f2e2d..43cbdbe43afd 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -19,6 +19,7 @@
>>   #include "pm7325.dtsi"
>>   #include "pm8350c.dtsi"
>>   #include "pmk8350.dtsi"
>> +#include "qcs6490-audioreach.dtsi"
>>   
>>   /delete-node/ &ipa_fw_mem;
>>   /delete-node/ &rmtfs_mem;
>> @@ -765,6 +766,44 @@
>>   	};
>>   };
>>   
>> +&lpass_dmic01_clk {
>> +	drive-strength = <8>;
>> +	bias-disable;
>> +};
>> +
>> +&lpass_dmic01_data {
>> +	bias-pull-down;
>> +};
>> +
>> +&lpass_dmic23_clk {
>> +	drive-strength = <8>;
>> +	bias-disable;
>> +};
>> +
>> +&lpass_dmic23_data {
>> +	bias-pull-down;
>> +};
>> +
>> +&lpass_va_macro {
>> +	status = "okay";
>> +};
>> +
>> +&lpass_wsa_macro {
>> +	status = "okay";
>> +};
>> +
>> +&lpass_wsa_swr_clk {
>> +	drive-strength = <2>;
>> +	slew-rate = <1>;
>> +	bias-disable;
>> +};
>> +
>> +&lpass_wsa_swr_data {
>> +	drive-strength = <2>;
>> +	slew-rate = <1>;
>> +	bias-bus-hold;
>> +};
> 
> These properties should likely be moved to sc7280.dtsi
Ack>
>> +
>>   &mdss {
>>   	status = "okay";
>>   };
>> @@ -1039,6 +1078,31 @@
>>   	status = "okay";
>>   };
>>   
>> +&swr2 {
>> +	status = "okay";
> 
> Please keep a newline between the properties and first subnode
Ack>
> [...]
> 
>>   &tlmm {
>>   	gpio-reserved-ranges = <32 2>, /* ADSP */
>>   			       <48 4>; /* NFC */
>> @@ -1095,6 +1159,12 @@
>>   		 */
>>   		bias-pull-up;
>>   	};
>> +
>> +	sw_ctrl: sw-ctrl-state {
> 
> Not only non-descript, this node is not used
Will check and update

Thanks,
Prasad>
> Konrad


