Return-Path: <linux-arm-msm+bounces-46740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4142BA25961
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 13:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2C633A216A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 12:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F38204592;
	Mon,  3 Feb 2025 12:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fsd8fqrS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EED200BBF;
	Mon,  3 Feb 2025 12:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585615; cv=none; b=XtN2SRT9VFoXP+Alu5ozR4kq65uIHLJLHNRNlm+RF5KTSRk/v6xitemg2RHradf02U1rVm/mqRHVmBGQ6RoM3NQisOXAYOtbdK1FD9TMk/lazRBQcfpcouIurahvXdxi05sjtupLGwilahOVnCSc4MSPZiiyM3v4HnbXSpKjjIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585615; c=relaxed/simple;
	bh=LGDsKKcrjcBgdskyleX3OlMPwX88WD7KecZR3Hz+/pU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rkEucSTbBijXYGHzCwWx/CKgdFKWR7f4/rlrw9iCq4acLhpMEcrc+SK/3cnKy6Jz8yWYlG4va0nYhY7lIfRH4/o2YvccUHFN9gIV954ICCGhDjyj2ETnOtyboH9AroCDUfWnWeJau93/Kqb3juxk2fkgO/L1wzycwW+o+/c5rYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fsd8fqrS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135NY3U031401;
	Mon, 3 Feb 2025 12:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sYTDGuhv0AVgLzmqPR6nHJlgIrpOkrPWYo7RTHR+cdI=; b=Fsd8fqrSiz6IxLO3
	P2ZgUVipDIO/F3HgbjLFU6NJIER8UGlhwqiNboemqi45CwPqg6GfCd+Iw2p5ImYn
	Kv27/PsTE3kHWZqf8jJHptmitIFm0gyJXUIs3UKincnrfY4sK7MD67RPQ/+tlOX0
	WAMZAevn0njMyIkilm3xAjXBI3q5ifVIzD9JNTpEm4gojSD+xyZqu7GQauDZw0I/
	kI959GSYmaLp7jnqqx21i2cZwOjNUPagJQpvTE26Obji+OFgO6KRqNqSr0b/+bAb
	XevmF3TSpAaLjLRdulQfo45GTHd9cNgBJUXHU9+Gwvn/0xVdmwkSVrJE97KqBQNN
	L6Vzcg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqm410vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 12:26:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 513CQnwA007369
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 12:26:49 GMT
Received: from [10.253.39.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Feb 2025
 04:26:45 -0800
Message-ID: <6bb889a8-08d1-4b28-987c-1218c99a7dc0@quicinc.com>
Date: Mon, 3 Feb 2025 20:27:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: sa8775p-ride: Add firmware-name
 in BT node
To: Zijun Hu <quic_zijuhu@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_jiaymao@quicinc.com>,
        <quic_shuaz@quicinc.com>, <quic_mohamull@quicinc.com>
References: <20250110063914.28001-1-quic_chejiang@quicinc.com>
 <20250110063914.28001-2-quic_chejiang@quicinc.com>
 <6bd87b16-f3d8-4746-803c-cb3c937220dd@quicinc.com>
Content-Language: en-US
From: Cheng Jiang <quic_chejiang@quicinc.com>
In-Reply-To: <6bd87b16-f3d8-4746-803c-cb3c937220dd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WHI9vwKVXVWlszFCq00YJBvigxEj2eUt
X-Proofpoint-ORIG-GUID: WHI9vwKVXVWlszFCq00YJBvigxEj2eUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030093

Hi All,

On 1/10/2025 2:56 PM, Zijun Hu wrote:
> On 1/10/2025 2:39 PM, Cheng Jiang wrote:
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
>> index 175f8b1e3..1697c11f5 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>> @@ -937,6 +937,7 @@ &uart17 {
>>  
>>  	bluetooth {
>>  		compatible = "qcom,wcn6855-bt";
>> +		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
>>  
>>  		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>>  		vddaon-supply = <&vreg_pmu_aon_0p59>;
> 
> Reviewed-by: Zijun Hu <quic_zijuhu@quicinc.com>
Could you please help to review this change? Thanks!

