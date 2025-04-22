Return-Path: <linux-arm-msm+bounces-54972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDF5A97375
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 19:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFBF67A65A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 17:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC49A2973BD;
	Tue, 22 Apr 2025 17:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DoiaAl5b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4AE296D15;
	Tue, 22 Apr 2025 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745342362; cv=none; b=I1Z8OouWBLuV7w2L334+Ei3j3LmgeH+Qb6WMhkw9HfCtgJGUBFSoAUjwitADTWqMJarKVN7tE0Cd7+NKqd9Gv8OxhQzZOoqBzD1GiHt2W3y3G8MEUtts8ASfLnWpSY7xx2FZyypmtg1qbH1hfOlCbABj//mFOQTYtiZ+Q95FUso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745342362; c=relaxed/simple;
	bh=zxmQJhaD0Jx7np6ox/4CDrz8WPw6dRpUvgDoO1voHyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ocsOpOdD5LyFhYGVnrgYDVpKjclqTOy7eI2N0Mi0lA5ngNf88/fUIutzl7w0/DtRXZXxq6opPJxPISsp5kD9h4tOANH3RGynRujlo8iQVjILcSE7cib0zkhI3tjMIbT1fy32NFXHgMa4881qdNPAZWVnU4ffqaTdhp9cDs4lILM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DoiaAl5b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MC6XAT019392;
	Tue, 22 Apr 2025 17:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nK+Db4mhiEUSM7oAVNyZrsDghh2QBsZyD+JXp4oq5ks=; b=DoiaAl5bIfVv8kgL
	zAxPdFo+fnFDV6pT4nnL6lv/mk+DJKxnHGECZ5LaAWxk4mvw8j/uZx7nNVLGD9kr
	UW0D8thEslcbDP+QMnjowFZ1uVlbD1pd3EkjKoKNqFjRwOMqRFk24qEZWBzKPDMt
	+Lasa6lMAHsDXJ/zKXrggOzuGp/UdzTt1RwCvEFXDWWFuWkDFFMo+yoCjqWKBkEC
	RBMAl5X2aPq+mz/yhzLypCDEOZXaUpYlcySlkWsT6TcWVOk7/yqzdIasBRNSfvYV
	hSDM4bak6+1ohWuYPycocnvYlZlphBPQRVH+ZUEQsMgAJjxYqe1VgxXjujRLAeCi
	/bzI1g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46454brfeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 17:19:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53MHJDg5008618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 17:19:13 GMT
Received: from [10.216.4.61] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 10:19:09 -0700
Message-ID: <fb1ca5fa-6bf8-40ee-a7bd-8ce356687714@quicinc.com>
Date: Tue, 22 Apr 2025 22:49:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/8] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
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
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <20250317054151.6095-6-quic_pkumpatl@quicinc.com>
 <5917043c-9f22-4d3e-abc3-855ca84ea32a@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <5917043c-9f22-4d3e-abc3-855ca84ea32a@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=cdrSrmDM c=1 sm=1 tr=0 ts=6807cf91 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EkdEwCnvp131_jYCVQ4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kacnnrTLN2TKEo7Sj36SNKrw92-zOi7U
X-Proofpoint-GUID: kacnnrTLN2TKEo7Sj36SNKrw92-zOi7U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_08,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=787 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220130



On 4/2/2025 3:02 AM, Konrad Dybcio wrote:
> On 3/17/25 6:41 AM, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Add the sound card node with tested playback over WSA8835 speakers
>> and msm mics.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 80 ++++++++++++++++++++
>>   1 file changed, 80 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index a1a3df77ad57..5d4d3df6eff9 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -219,6 +219,56 @@ vph_pwr: vph-pwr-regulator {
>>   		regulator-min-microvolt = <3700000>;
>>   		regulator-max-microvolt = <3700000>;
>>   	};
>> +
>> +	sound: sound {
> 
> The label is not used, please drop

ACK,
Will fix it.

> 
>> +		compatible = "qcom,qcs6490-rb3gen2-sndcard";
>> +		model = "qcs6490-rb3gen2-snd-card";
>> +
>> +		audio-routing =
> 
> Please don't break the line here

Yes, Will update.

> 
>> +			"SpkrLeft IN", "WSA_SPK1 OUT",
>> +			"SpkrRight IN", "WSA_SPK2 OUT",
>> +			"VA DMIC0", "vdd-micb",
>> +			"VA DMIC1", "vdd-micb",
>> +			"VA DMIC2", "vdd-micb",
>> +			"VA DMIC3", "vdd-micb";
>> +
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +		wsa-dai-link {
>> +			link-name = "CODEC_DMA-LPAIF_WSA-RX-0";
> 
> Very unusual link name

ACK,
Will check and update.

> 
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&left_spkr>, <&right_spkr>, <&swr2 0>,
>> +					    <&lpass_wsa_macro 0>;
>> +			};
> 
> 'co'dec < 'cp'u

ACK,
Will update in next patchset.

Thanks,
Prasad

> 
> 
> Konrad


