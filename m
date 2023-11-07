Return-Path: <linux-arm-msm+bounces-43-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 999DA7E36F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 09:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34F2FB20B70
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 08:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B875CA4E;
	Tue,  7 Nov 2023 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nYrIdn8L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A2ACA46;
	Tue,  7 Nov 2023 08:55:36 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B329D11A;
	Tue,  7 Nov 2023 00:55:35 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A77MtcZ023680;
	Tue, 7 Nov 2023 08:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6pa11KNsKYAxwvnBF32BvIbYj+w+9BXSuYGDwT/lRpg=;
 b=nYrIdn8LfP0d32NqzXTE1iRnDf39E9DzExul9qr5k45a8K3qUZWWkBr5+oi/DcXE85DS
 4jRaDifv/o2Q8LssD0KxZmGsp8LlRAUh+xluCHeTn0Y5eYDsrzx/XaCrgOjzn6rLEDnZ
 IrHjDa6xo1bakg7kB+y5sAPJeJGL8z+5ZcJXFPAgFs/YvQUtw/0r2IHVURWFztl8uvMt
 7U30V6/9vIm+eMVpcaLk0m/yYg3hqKTBHkAOU/AXzC8pwRqNMeogkaSdGvBooA+kGvOF
 rRdrSiKmaOrxbqG1ni5+QbaUq8jSECVBpojDjiZ2HA15n1pBHlw3C51BIWEO5Bi0jcz2 Kw== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u758n1kp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 08:55:32 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A78tWkN002845
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Nov 2023 08:55:32 GMT
Received: from [10.214.66.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 7 Nov
 2023 00:55:29 -0800
Message-ID: <0f76a5c1-14ce-cbfa-bbd9-b2826c4bbbdb@quicinc.com>
Date: Tue, 7 Nov 2023 14:25:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: cache: qcom,llcc: correct QDU1000 reg
 entries
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20231107080436.16747-1-krzysztof.kozlowski@linaro.org>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20231107080436.16747-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O22k0UAxUpYRtrJEGHIL5Jvs4oOExYku
X-Proofpoint-ORIG-GUID: O22k0UAxUpYRtrJEGHIL5Jvs4oOExYku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_15,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=643 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310240000 definitions=main-2311070073



On 11/7/2023 1:34 PM, Krzysztof Kozlowski wrote:
> Qualcomm QDU1000 DTSI comes with one LLCC0 base address as pointed by
> dtbs_check:
> 
>    qdu1000-idp.dtb: system-cache-controller@19200000: reg-names:2: 'llcc2_base' was expected
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Recent LLCC patches were not tested on QDU1000 thus the LLCC is there
> broken.  This patch at least tries to bring some sense according to
> DTSI, but I have no clue what is here correct: driver, DTS or bindings.
> ---
>   Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> index 580f9a97ddf7..d610b0be262c 100644
> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> @@ -64,6 +64,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,qdu1000-llcc
>                 - qcom,sc7180-llcc
>                 - qcom,sm6350-llcc

Thanks, again.

Acked-by: Mukesh Ojha <quic_mojha@quicinc.com>

-Mukesh


>       then:
> @@ -101,7 +102,6 @@ allOf:
>           compatible:
>             contains:
>               enum:
> -              - qcom,qdu1000-llcc
>                 - qcom,sc8180x-llcc
>                 - qcom,sc8280xp-llcc
>       then:

