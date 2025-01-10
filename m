Return-Path: <linux-arm-msm+bounces-44710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D468DA088AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 07:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33C651690E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 06:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1592063F5;
	Fri, 10 Jan 2025 06:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WjXoIrU1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77E22063DA;
	Fri, 10 Jan 2025 06:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736492206; cv=none; b=mdaS4Rruc5s0l5DW4ue8WJq/MNcU1mhu0wSy5evK8Ie+I5OQLaunoLPowKNpN07jnlmjTXLZ/6gVZ3fDhTT7N7DXeAj8yKxWYY8xLpG/gDnlhEj3MfGjgYsImT6GcHBB85O9fm46LShrv/KNbj3lZzHDcA+v9ck7+AF2xl0MNho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736492206; c=relaxed/simple;
	bh=pGqGWZX6vL7kNM5mGhnGvbIRjCBYT4m0KqnoeuUcgtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D6Y9ZFRJnhyslnd+tHTK39BiBHbd3AFYKOfxn3eXfSsDDcdXotcubu0yyU9IBIsNiKW1AWALrCILr4FzFvfx/zBqezgcmo3xi0zM8oXnofHReAqx5eWPwS1FJkGKJb2A12r+C3GLFGriUGotKHWeF4j7us7jGqG0ohQ4TM+RySg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WjXoIrU1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509K1d5K030450;
	Fri, 10 Jan 2025 06:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tl728u3xkPSEQ3ZLr1nGjI0WClgqxIo3qt/NfDJnqfQ=; b=WjXoIrU1JSB8oiPx
	ue3FdVHLkk2NebatO3ptVdRi5JhXvnZdkudUp66aaZym1sCcT8Dn+IkoeXrj3W3W
	kGavJbmAXAgLvGyQsTgdcHuABHYOBlCm7Mqucai1qsEo7Vq5PNuL15yb7ZMA8gkL
	H7SC21ECaKpz2VN6o4Nuw4jx05wBn/9Kd8/u8zNBg9cvzt19uM5uy8zvoUh1m9FA
	L2lSkAdNp6a8APD14Lcc1bnw2H/zvmpqOjJWA2p7oSJe9BS4cMXDNQ09sjNa9XcB
	4DDmdD7cvnaaanDxSqnjtLcwq51pU/Ax97i+m7UL5SQ6LwtwGZpg6+9vaA+Y6zLE
	9Xxp2Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442n4r18ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:56:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50A6ucAl030816
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:56:38 GMT
Received: from [10.253.75.79] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 22:56:35 -0800
Message-ID: <6bd87b16-f3d8-4746-803c-cb3c937220dd@quicinc.com>
Date: Fri, 10 Jan 2025 14:56:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: sa8775p-ride: Add firmware-name
 in BT node
To: Cheng Jiang <quic_chejiang@quicinc.com>,
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
Content-Language: en-US
From: Zijun Hu <quic_zijuhu@quicinc.com>
In-Reply-To: <20250110063914.28001-2-quic_chejiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NLt9gkxeijDc_C2f25Lag6PaIHqrEG2b
X-Proofpoint-ORIG-GUID: NLt9gkxeijDc_C2f25Lag6PaIHqrEG2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100056

On 1/10/2025 2:39 PM, Cheng Jiang wrote:
> The sa8775p-ride platform uses the QCA6698 Bluetooth chip. While the
> QCA6698 shares the same IP core as the WCN6855, it has different RF
> components and RAM sizes, requiring new firmware files. Use the
> firmware-name property to specify the NVM and rampatch firmware to load.
> 
> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3..1697c11f5 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -937,6 +937,7 @@ &uart17 {
>  
>  	bluetooth {
>  		compatible = "qcom,wcn6855-bt";
> +		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
>  
>  		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>  		vddaon-supply = <&vreg_pmu_aon_0p59>;

Reviewed-by: Zijun Hu <quic_zijuhu@quicinc.com>

