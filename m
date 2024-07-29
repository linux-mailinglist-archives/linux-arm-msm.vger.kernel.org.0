Return-Path: <linux-arm-msm+bounces-27222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EAA93F269
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 704DA2811F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33618142E98;
	Mon, 29 Jul 2024 10:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U8kvQa7s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A141E1428FE;
	Mon, 29 Jul 2024 10:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722248257; cv=none; b=j9F22jKEDeH+/5gWyinpiHepkxrqeQ8KCT3qO6wEMhvlG+AoI4M11YV91EsBxmxvRYSCOk7vpZmJQhMABuJx/RAMqrBNYI3+gSHhxV4ys2rchogGWMCEgScHHHd57MB6fYwLYwy8S7NtOTF8ZzgjAvorm6y0n/1ig3bOY1nzBLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722248257; c=relaxed/simple;
	bh=WfQW0nu+tTflofi5Wm3y2KaGn8nAZ0DqR6ZUsyiPDtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=McnzhcO9rJUwJnu23bTWmwVVB9mvlF5eZB7PAK9+Ai3gZ2wq8wM0otcv/5dZ7+0IPV25WIs5g2cTGS5q9zEE5ne9ljW3fKdtqpiPQrdNOQLOgp+/CzBCgbd0DMb+sIqip3jXORmUZHFzVPiaJHWDSJ+QOVX8TVhbPFE0K9QKQLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U8kvQa7s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TAGKpd023699;
	Mon, 29 Jul 2024 10:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2FS8ccFb334bCr0B1cypfRsnHjV37oyh1MM7jBzg3Rw=; b=U8kvQa7sAR66ImAo
	9wCcMbln2G835w8Oeyn+8krN4QawU6cEtKizOcPbbMk1B1VV9NErD+42lWOCNnQm
	xxQplXLjOPz2GrYTVW3IOR+NeeXoO43UAS3EOD0UH7Ml4Q3lA7eJEPJlgnRtikce
	meYxQwPmNE76ly2glpyNzatq0dzRU+Enyn3o9VpqnI12PJNQ/CYFL2Xi3p6r1lBU
	X3nObNXqHSmTAfYlQTf9kdLEovRR3WXNgW5CpCUxcBDFU0Y3hsYdav0DRktkRPsn
	Ixafp9nnVU7O11Ik1Vo4PsgUOZpaTnCmcAPkqr97PuzC7oOSkU6BRyMVZbSgoCgG
	n5GBKA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mrytuvr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:17:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TAHUSW009566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:17:30 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 03:17:26 -0700
Message-ID: <5c15c22d-54a4-4184-a75a-ea581eccbc4b@quicinc.com>
Date: Mon, 29 Jul 2024 18:17:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: dwc3: Add QCS9100 compatible
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240709-document_qcs9100_dwc3_compatible-v2-1-ed543ae02117@quicinc.com>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <20240709-document_qcs9100_dwc3_compatible-v2-1-ed543ae02117@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: z4dJNTE_oJyiSSrUODzjxS4Qy9Rxdi4c
X-Proofpoint-GUID: z4dJNTE_oJyiSSrUODzjxS4Qy9Rxdi4c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_08,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=993
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290069



On 7/9/2024 10:17 PM, Tengfei Fan wrote:
> Document the QCS9100 dwc3 compatible.
> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
> platform use non-SCMI resource. In the future, the SA8775p platform will
> move to use SCMI resources and it will have new sa8775p-related device
> tree. Consequently, introduce "qcom,qcs9100-dwc3" to describe non-SCMI
> based DWC3.
> 
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
>   Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index efde47a5b145..07b0b6530b78 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -26,6 +26,7 @@ properties:
>             - qcom,msm8998-dwc3
>             - qcom,qcm2290-dwc3
>             - qcom,qcs404-dwc3
> +          - qcom,qcs9100-dwc3
>             - qcom,qdu1000-dwc3
>             - qcom,sa8775p-dwc3
>             - qcom,sc7180-dwc3
> @@ -199,6 +200,7 @@ allOf:
>                 - qcom,msm8953-dwc3
>                 - qcom,msm8996-dwc3
>                 - qcom,msm8998-dwc3
> +              - qcom,qcs9100-dwc3
>                 - qcom,sa8775p-dwc3
>                 - qcom,sc7180-dwc3
>                 - qcom,sc7280-dwc3
> @@ -448,6 +450,7 @@ allOf:
>                 - qcom,ipq4019-dwc3
>                 - qcom,ipq8064-dwc3
>                 - qcom,msm8994-dwc3
> +              - qcom,qcs9100-dwc3
>                 - qcom,qdu1000-dwc3
>                 - qcom,sa8775p-dwc3
>                 - qcom,sc7180-dwc3
> 
> ---
> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
> change-id: 20240709-document_qcs9100_dwc3_compatible-a767738e13c9
> 
> Best regards,

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Let's close this session and ignore the current patche here.
Thank you for your input.

-- 
Thx and BRs,
Tengfei Fan

