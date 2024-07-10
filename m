Return-Path: <linux-arm-msm+bounces-25888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6721892D9A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 21:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6030B21477
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 19:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D317119645C;
	Wed, 10 Jul 2024 19:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZokzrRdC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135D88F66;
	Wed, 10 Jul 2024 19:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720641492; cv=none; b=QqUezpsnvcMo3V+07a0Qmxv4DpIne9DJvYNUKEBDuInu0EPobgECmZj4C1wVSZMo8seCBROl0FSgGtYsbAHFOAdt5Nr+1clDcRPxQCV7dsf7NjTAOXOYXlrbsbUWXzOUB+SQSZhQwfEngW23mILMk/hxuAQq7dk4X2NeVYw/KvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720641492; c=relaxed/simple;
	bh=+gR3q10wxHVkIFkAz79jK6nbBeOfiCGBURlUBKgbsus=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X1dRqKyHwOssEIBOdQCtX/1woOaFl4ebZqXwMstXkHHX+GeIjuZ9bF2fFns2Y2Ti9WsIOcsU+toj+hfZgSMkzWEDh8itihP5kLWbqrZMRf9dqqReIlk1x8NE1nmR9BJF20xEK5NSLR0xnWdIqPqUvDRX8EabbaByhG9FPUP7NjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZokzrRdC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46ABrgcu013428;
	Wed, 10 Jul 2024 19:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yK8WpDsctH5uUuSiIfXEO5S4d0JYL6hL5LkGzcQ5Ifk=; b=ZokzrRdC/lGYGN3L
	kbfbmOMU9bdxsjPLgUrBBUZ59QK+9YuVuqGdjFhdboDvmKisCKD9ckGOiigCHnNU
	su4XvwBIG+M2KSFpOuf0IcD4N6SnohXagj+h1WJ21BQLMQLFTHWXs3ePpIB4I04j
	3VhQFmX+V56Rb5WWN54OGVUNFI7ZbYKXvwA0YVgVzA3UnZA23L4srS33UAvOJizA
	th8ZImH5L9q9V2CpAmT1l7kczxywY0SXwyqqjNsGCeUXgtDX/orNFAyfVzbniwMy
	XKUjhjyKY+4q51Pi2ZIEyyFqdqDWiruE4IuerM9q2HgRXsQmFRMwPg1TP3Ls0SOe
	xLuzGQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wmmthdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 19:58:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46AJw5JN017348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 19:58:05 GMT
Received: from [10.110.122.74] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Jul
 2024 12:58:02 -0700
Message-ID: <24302005-d9a5-400e-a28c-40276a3f7250@quicinc.com>
Date: Wed, 10 Jul 2024 12:58:01 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: soc: qcom,aoss-qmp: Document the QCS9100
 AOSS channel
To: Tengfei Fan <quic_tengfan@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240709-document_qcs9100_aoss_qmp_compatible-v2-1-6c7f35bc9ec3@quicinc.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20240709-document_qcs9100_aoss_qmp_compatible-v2-1-6c7f35bc9ec3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: g7CZcu1snt0AASDvXEBMtu__PlMXLa3F
X-Proofpoint-ORIG-GUID: g7CZcu1snt0AASDvXEBMtu__PlMXLa3F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_14,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407100141

Hi Tengfei,

On 7/9/2024 7:24 AM, Tengfei Fan wrote:
> Document the Always-On Subsystem side channel on the QCS9100 Platform.
> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p

/s/drived/derived/

> platform use non-SCMI resource. In the future, the SA8775p platform will
> move to use SCMI resources and it will have new sa8775p-related device
> tree. Consequently, introduce "qcom,qcs9100-aoss-qmp" to describe
> non-SCMI based AOSS channel.
>

Were there any differences between non-SCMI and SCMI based platforms 
specifically for the qcom_aoss.com driver?


> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
> Introduce support for the QCS9100 SoC device tree (DTSI) and the
> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
> While the QCS9100 platform is still in the early design stage, the
> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
> mounts the QCS9100 SoC instead of the SA8775p SoC.
> 
> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
> all the compatible strings will be updated from "SA8775p" to "QCS9100".
> The QCS9100 device tree patches will be pushed after all the device tree
> bindings and device driver patches are reviewed.
> 
> The final dtsi will like:
> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/
> 
> The detailed cover letter reference:
> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
> ---
> Changes in v2:
>    - Split huge patch series into different patch series according to
>      subsytems
>    - Update patch commit message
> 
> prevous disscussion here:
> [1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
> ---
>   Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
> index 7afdb60edb22..80e1a8b43586 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
> @@ -25,6 +25,7 @@ properties:
>     compatible:
>       items:
>         - enum:
> +          - qcom,qcs9100-aoss-qmp
>             - qcom,qdu1000-aoss-qmp
>             - qcom,sa8775p-aoss-qmp
>             - qcom,sc7180-aoss-qmp
> 
> ---
> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
> change-id: 20240709-document_qcs9100_aoss_qmp_compatible-a7376629ea6c
> 
> Best regards,

