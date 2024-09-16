Return-Path: <linux-arm-msm+bounces-31829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D538697A413
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 16:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80BFA1F26BC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 14:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD17156F3B;
	Mon, 16 Sep 2024 14:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AE+97GVe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C551DFE4;
	Mon, 16 Sep 2024 14:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726496757; cv=none; b=bfVjVrX5+hI7oHHt11pvHSQCmKx/wzIcL+VzsAujxxGiXDxBfb0du5q5dpewFx7IOxeKufR2mCWN0vJFXPgS8KaFMxVYyoWUKI484IP3DDuvDHcvaxrP2lJgAvWPOVOPx6DlP3vedVx1CiohAyMXzfr9CxTqPF8Oiu6gqWEoSRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726496757; c=relaxed/simple;
	bh=7ShsPPhbY5HL1n40ArcVjEAe+waZaadrqNGiEJAZz5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RXS4nfEX6gvy5nEzdsl7wNtT5a9DPNxwk4ba6Ek3WvRpOee8yyChEQ8Sg8MJsIjm4qb3cZ6lOB1cRlBPvs06F+aWxe8idZ76w6aoqL799Nfxir5OqHbsVuFJml7dT2IhTf31AasTN0f7MJdwSkY3l8NTAxygccErEb2Q1NgXino=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AE+97GVe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GE94sL025497;
	Mon, 16 Sep 2024 14:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nDo/fDh+eQnAfCrUVc5hF3G+HfBZzLi/x9TlSAvFYZw=; b=AE+97GVepbuJ0T7U
	oILe42CRldSKHs8C/ilqnwHrmKlD17WRnpxq2SXyvAw3sBuxdVRfdp8XBou6GM2+
	cQoEvcN02vGdxfmjax9AlnDKlclb3dk6x0QbIZRsp77xlTleF7v3MsBEiNjIDu6Y
	BfDmrBoUXGqlohQql8kwdCMS07JJixQsa/udmWuRSKjnuZbee0v1JJrqtYip3hr+
	AokQ7BsClH+HW7IF2MRCgsHHbs8nOjVFERyiUDL+RCvVHxn/vXIJEpUkLt38ZZQm
	STVdVHn6mxf4HcHxRJ1sLWoN0LGG6zH4ZdwWLbLkmkwBy98ECk+Ha0x2fwdpm4nx
	hjEAIQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4k0m69q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 14:25:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48GEPow8022966
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 14:25:50 GMT
Received: from [10.110.0.24] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Sep
 2024 07:25:47 -0700
Message-ID: <edb25f16-aa9a-4d44-9eb5-63f509f80fde@quicinc.com>
Date: Mon, 16 Sep 2024 07:25:46 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: mfd: qcom,tcsr: document support for
 SA8255p
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
References: <20240905194741.3803345-1-quic_nkela@quicinc.com>
Content-Language: en-US
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <20240905194741.3803345-1-quic_nkela@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7hx6TF2lanK2CPvLvChckodGJOPZ5tql
X-Proofpoint-GUID: 7hx6TF2lanK2CPvLvChckodGJOPZ5tql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409160092

Gentle ping...

On 9/5/2024 12:47 PM, Nikunj Kela wrote:
> Add compatible for tcsr representing support on SA8255p SoC.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>
> Changes in v3:
> 	- Removed the patch from original series[1]
>
> Changes in v2:
> 	- Added Reviewed-by tag
>
> [1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> index c6bd14ec5aa0..88f804bd7581 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> @@ -21,6 +21,7 @@ properties:
>            - qcom,msm8998-tcsr
>            - qcom,qcm2290-tcsr
>            - qcom,qcs404-tcsr
> +          - qcom,sa8255p-tcsr
>            - qcom,sc7180-tcsr
>            - qcom,sc7280-tcsr
>            - qcom,sc8280xp-tcsr

