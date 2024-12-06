Return-Path: <linux-arm-msm+bounces-40648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5E49E644B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 03:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D3A82848F6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 02:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2F51552F5;
	Fri,  6 Dec 2024 02:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cbMjFzPq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D62513A87E;
	Fri,  6 Dec 2024 02:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733452802; cv=none; b=DYpggNdpmtosrngzryXp3pbAfQSXrGdZJFgR7yyEBxrhZCCjNbNgnqoO8uyzIPhYVBgeQIHo5trfowzNymGVV2P23n0/UrvhPSi2NxAU932WfSZyxY5RorbA8L2AjCXZhHiMeigtXSUbx/dfoCGKf5iJh5sJdSUmxtGFdIbuCxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733452802; c=relaxed/simple;
	bh=vN7kfYVGX7Ui/e/G8mzCoyKlVgGDsyr4JqQpjh9g4SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=or086A5V3+yxNX3WzhtdiB7vWeu3KP5Z10K9P6invUZCSCeVbvpcaKWylVDjojDCQ1VuL6l1SdrdIMJtwBW3hfZ+TaG0Rq4QTXuuSIUwrxjSHOZ1I969XJVDJHHhZgWF7i7Ed39g1vXjQ4odGIe1ZdCz0JDb3lE7125tj/rpP8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cbMjFzPq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaOZ1003829;
	Fri, 6 Dec 2024 02:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ES+0LLK6o5L5hH4IvB8J17J4xxpqhqjEDDhe1N+9LK8=; b=cbMjFzPqQI6kTw6V
	dvS3xRb27GFBA4eN5geZzCitwB/0vipL5/BC2kqksT1WnTd4Bg2eSxWbPCciphvH
	mz40uUITrhNrBiVccacroISs+/ZA+pSOl61Hcu4SdBza7yAhB4rHYwZIXuyFhZ4Z
	w8dv0Lg6gk2d7L0XFJdDFYs9vL43ai7HhbUFpaxLLJLvwZdJWQSsOwO1eFNBME/W
	U7BnOsScJ4VGVCuQ2/7Bzkt/Mcndk5evo/m6rJ4EKH7mEfrwhQeau9wNEudqgZQM
	dm2C1gPRXsXsTJuX0CEJ/N+b8hVSI0O2DabuNoJ6xXFAdtwwpXbMIpSPDqc++y46
	svvd2w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbqm21ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 02:39:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B62dsS4011446
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 02:39:54 GMT
Received: from [10.233.22.158] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 18:39:49 -0800
Message-ID: <d46037b0-1654-449a-9e42-3baf57a6feb2@quicinc.com>
Date: Fri, 6 Dec 2024 10:39:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sa8775p-ride: Add firmware-name
 in BT node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao
	<quic_rjliao@quicinc.com>,
        <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_jiaymao@quicinc.com>, <quic_shuaz@quicinc.com>,
        <quic_zijuhu@quicinc.com>, <quic_mohamull@quicinc.com>
References: <20241205102213.1281865-1-quic_chejiang@quicinc.com>
 <20241205102213.1281865-4-quic_chejiang@quicinc.com>
 <kgxxykbogtdfsnkyk3f5mpht54o3siqkhkfji5nqo7cyck44rf@x7kb2otqdo7n>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <kgxxykbogtdfsnkyk3f5mpht54o3siqkhkfji5nqo7cyck44rf@x7kb2otqdo7n>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SP8Y9ZqXSoU9KyGcPf_62QeYC5I2eeXM
X-Proofpoint-ORIG-GUID: SP8Y9ZqXSoU9KyGcPf_62QeYC5I2eeXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060018

Hi Dmitry,

On 12/5/2024 8:13 PM, Dmitry Baryshkov wrote:
> On Thu, Dec 05, 2024 at 06:22:13PM +0800, Cheng Jiang wrote:
>> The sa8775p-ride platform uses the QCA6698 Bluetooth chip. While the
>> QCA6698 shares the same IP core as the WCN6855, it has different RF
>> components and RAM sizes, requiring new firmware files. Use the
>> firmware-name property to specify the NVM and rampatch firmware to load.
>>
>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> index 3fc62e123..e7fe53d95 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> @@ -857,6 +857,7 @@ &uart17 {
>>  
>>  	bluetooth {
>>  		compatible = "qcom,wcn6855-bt";
>> +		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
> 
> And the rampatch is not going to be board-specific?
> 
Yes, rampatch is chip-specific. 
>>  
>>  		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>>  		vddaon-supply = <&vreg_pmu_aon_0p59>;
>> -- 
>> 2.25.1
>>
> 


