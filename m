Return-Path: <linux-arm-msm+bounces-42935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 314089F8DD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D66818932CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 08:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1F019F43A;
	Fri, 20 Dec 2024 08:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FVrEUV99"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848501804A;
	Fri, 20 Dec 2024 08:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734682653; cv=none; b=IYGON/iL588XX11pY83YJSCiuKN7f0VxGBwL/6QjlTdaS5d3ColUmApo3tka8L3RQGxwY8JaYOuUSu8XZ69p8wVGIXNRIFMcYt3CvafCZJhz13d1ThlfXJwTpCIxldPasH2+owid711RAiYEGtKj/ewA6rne4TzUdFNNb3Wievc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734682653; c=relaxed/simple;
	bh=zTxPnwWb00tyx5IV3P7ou5G7Z7FrzvbiLd7SdiiiJ2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tLXe3acbmNirK8WlPzkXELdkWy8I7SAo1nSGY0X0s0D+92ebA8cQOqtC4OBQSod0ySDheq5FgMlpQiNFYIv7Q/q4xkF1/9tM3HarKwK2wa98y750QikefpCY/fZfygvAr8yCemF2iSRYzTqo5qVAEnBeTSZFAZ8uL7nNHO5/ppM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FVrEUV99; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK6me3k002947;
	Fri, 20 Dec 2024 08:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zffLWLUSCtFkXCaFxksO/9w2Cv27+Onxk0TFVbWZn7g=; b=FVrEUV99SN1XpoA5
	CknxSjKaQtUO7h7VcVti86s3c8U4OBgt5ZCZsnycSMtKQmsW5G+08d2xl6dQf1mx
	YJj8eyMxqn2d1EguRxU3wIUGiT9/ra1epN/IODM1UhN5r/hnAz20JMtCoOGQvZSG
	LlMQEEaCVOf0+LvoVdhgFSt+r/BTGvemmuImq2StVQwzBbYadJqbY+3V03susqhg
	9cxFvz7B19EAAlGod+ENDQSviwzXuBflAD6q+jJsRx625KsGpZyn7I4Sxs677gxK
	uGyGciY8IittjjrFR+L45FSPgyhxJ1ZZGWrFIvFKg8jDhoJ+CqUo6hOTEXFVCiBc
	Lz/yQQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n3my07nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 08:17:27 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK8HQL7017649
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 08:17:26 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Dec
 2024 00:17:20 -0800
Message-ID: <37606da1-66ca-4134-a78e-ec9befc0285a@quicinc.com>
Date: Fri, 20 Dec 2024 16:17:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdx75: Correct IRQ number of EL2
 non-secure physical timer
To: Cong Zhang <quic_congzhan@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241205-correct_timer_irq-v2-1-7db282a5e475@quicinc.com>
Content-Language: en-US
From: "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
In-Reply-To: <20241205-correct_timer_irq-v2-1-7db282a5e475@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: z14EsJ8OY7KfSbULeYJH-5LzBLH7-WE8
X-Proofpoint-ORIG-GUID: z14EsJ8OY7KfSbULeYJH-5LzBLH7-WE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=910
 spamscore=0 clxscore=1015 mlxscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412200068

On 12/5/2024 6:28 PM, Cong Zhang wrote:
> The INTID of EL2 non-secure physical timer is 26. In linux, the IRQ
> number has a fixed 16 offset for PPIs. Therefore, the linux IRQ number
> of EL2 non-secure physical timer should be 10 (26 - 16).
> 

Please add a 'Fixed' tag, as it is indeed a fix.
> Signed-off-by: Cong Zhang <quic_congzhan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sdx75.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
> index 5f7e59ecf1ca6298cb252ee0654bc7eaeefbd303..b0775173278f3eed0f301b40dfba0f2680d7b0d0 100644
> --- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
> @@ -1548,6 +1548,6 @@ timer {
>  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>  	};
>  };
> 
> ---
> base-commit: bcf2acd8f64b0a5783deeeb5fd70c6163ec5acd7
> change-id: 20241205-correct_timer_irq-d7e6fc4c616d
> 
> Best regards,


-- 
Thx and BRs,
Aiqun(Maria) Yu

