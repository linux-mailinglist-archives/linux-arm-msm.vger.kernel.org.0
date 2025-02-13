Return-Path: <linux-arm-msm+bounces-47849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DDEA337A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 07:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1040C18851E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 06:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6884204F6E;
	Thu, 13 Feb 2025 06:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fG/jPqPx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A761D86E6;
	Thu, 13 Feb 2025 06:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739426430; cv=none; b=GAD25CITJI13x5mhbCk3921d3tgOr9VMgduRjaGEg1pn/x9DA9j6fZx/WEzPh0ztMG4o5R6ZAT5glNJ332+RfvbRg0ytOLG5C1X61ZvnARLJC3QivnxRE2Y57Zjpu/sOJE5/eprWmdoHhH9aErXl3b69Af4EtJ2B1rVhQ7cNVYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739426430; c=relaxed/simple;
	bh=8s/bTDUVIWxdrqH6fipakZGBYO9lwvpZ1w8a5gGB1Cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ayNknybPmbqMUSwsjJg2DoQnc6plhjfan9U8owC9kA51YruriMpqVZ9k3e63JhxI275zabYGfKd1c+Z5BoIB/jAksD4haonGWxwRR66z6DcHlJjEShNWAiFnXoZjikpED0XvgTfiXK0wkwh+Z7EGUIr1yt06v1AKzSOBT3WNVW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fG/jPqPx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CFl1kh006169;
	Thu, 13 Feb 2025 06:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pU35+8aa/1/SkLGu1AkjE4CxlpoQx7T26Qs2oC5MHXY=; b=fG/jPqPxbu9B/v41
	/Z0bBxJIxqqLF2DgoPOOuoRJIs/piiTtoVdxpm6YGrZ2SrKn7IAbV/hGyaUXYCDz
	bHOfN+rDe/isfoLXATlaWsEZtIFICWq8/7+/0JbqzmHvVrID8rgk5CbSXJmp9TsB
	E4sXp1wqBo6wCGtDgyvMcgxpkfGNAhk3qMb73amzzG3d+urnA6UkNktnvr+JokDW
	x7xeeUgipf4K60hPUlfeU7hT0vNwlyKFdLsne0nHbBjd0ed55hM+uYBRdsmmEA7r
	PdLs5O5XSZgQUyhthTNeh8NFRYbleO3vo1LkgOPo/g7xG/5oOj85OJdNtx4ruJXK
	2ynfbg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5n1q95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 06:00:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D602X0029415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 06:00:02 GMT
Received: from [10.231.216.52] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 22:00:00 -0800
Message-ID: <ed6a0be1-f7c3-4ada-9413-730c85a5cd3c@quicinc.com>
Date: Thu, 13 Feb 2025 13:59:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: qcs8300-ride: enable BT on
 qcs8300-ride
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_jiaymao@quicinc.com>,
        <quic_shuaz@quicinc.com>, <quic_zijuhu@quicinc.com>,
        <quic_mohamull@quicinc.com>
References: <20250211104421.1172892-1-quic_chejiang@quicinc.com>
 <20250211104421.1172892-2-quic_chejiang@quicinc.com>
 <b74f0591-242d-45eb-8c5b-bfc7edb0441a@oss.qualcomm.com>
Content-Language: en-US
From: Cheng Jiang <quic_chejiang@quicinc.com>
In-Reply-To: <b74f0591-242d-45eb-8c5b-bfc7edb0441a@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9ThJRlQAWjSp9nsuc8MjF4FexPaWXi5y
X-Proofpoint-ORIG-GUID: 9ThJRlQAWjSp9nsuc8MjF4FexPaWXi5y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502130044

Hi Konrad,

On 2/11/2025 10:34 PM, Konrad Dybcio wrote:
> On 11.02.2025 11:44 AM, Cheng Jiang wrote:
>> Enable BT on qcs8300-ride by adding a node for the BT module. Since the
>> platform uses the QCA6698 Bluetooth chip. While the QCA6698 shares th
>> same IP core as the WCN6855, it has different RF components and RAM sizes,
>> requiring new firmware files. Use the firmware-name property to specify
>> the NVM and rampatch firmware to load.
>>
>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 24 +++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> index a6991e8e2df6..93458773b72d 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> @@ -17,6 +17,7 @@ / {
>>  
>>  	aliases {
>>  		serial0 = &uart7;
>> +		serial1 = &uart2;
>>  	};
>>  
>>  	chosen {
>> @@ -451,6 +452,13 @@ &serdes0 {
>>  };
>>  
>>  &tlmm {
>> +	bt_en_state: bt-en-state {
>> +		pins = "gpio55";
>> +		function = "normal";
>> +		output-low;
>> +		bias-pull-down;
>> +	};
>> +
>>  	ethernet0_default: ethernet0-default-state {
>>  		ethernet0_mdc: ethernet0-mdc-pins {
>>  			pins = "gpio5";
>> @@ -544,6 +552,22 @@ wlan_en_state: wlan-en-state {
>>  	};
>>  };
>>  
>> +&uart2 {
>> +	status = "okay";
>> +	bluetooth: bluetooth {
> 
> Please add a newline between the last property and subnodes
> 
Ack.
>> +		compatible = "qcom,wcn6855-bt";
>> +		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&bt_en_state>;
> 
> You should use qcom,wcn6855-pmu (see e.g. sc8280xp-crd.dts)
> 
Ack. Will use the power sequence for BT power control. 
>> +		enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>; /* BT_EN */
>> +
>> +		vddio-supply       = <&vreg_conn_pa>;         /* bt-vdd-ctrl1-supply */
>> +		vddbtcxmx-supply   = <&vreg_conn_1p8>;        /* bt-vdd-ctrl2-supply */
> 
> Drop these comments
> 
Ack.


