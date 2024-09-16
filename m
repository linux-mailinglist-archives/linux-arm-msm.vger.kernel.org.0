Return-Path: <linux-arm-msm+bounces-31832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9A797A42E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 16:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 476211F27378
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 14:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9D615699D;
	Mon, 16 Sep 2024 14:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U+PaxkZg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA3F14EC47;
	Mon, 16 Sep 2024 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726497125; cv=none; b=k3PeX/YGhnFnmmaF49iABOGLFAAzeQ5ejh8jWpo12uZd58pcQwgBNQV2q6S8MrGEwhY5bVhSI+wTSVHrGJWyOcduZiO+ziHHpp73w79UhLYqSpiQ5wREJlkmu40KdzTIQDyhR1s2TKnUdSTKz/qJqdO3RtOQD+Mt+p/vbUs9x64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726497125; c=relaxed/simple;
	bh=FNKagr8fgT2UuOBtN5mFu5V6NQIr1s6QD15dfSvCMfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z/ocJvu00BnVdRfpKD9TlsfwbPjhnsP9FTYWk+wkcvgmc1K9a+quTAl29wdNVLhw321qV8fTFbTW4FPDLpAZkRw4D+MOMxwMiMJKy9O8NM5jBe1y4l30fKTsMtqNidAI2m6/lasPhAmTCc9YpnT3WirOc2myPetPJKpUHJqDmDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U+PaxkZg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GEBHSo019341;
	Mon, 16 Sep 2024 14:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rV+gZObA7zqyq+elv/MNQSpTmnsg0cKcpZcE22qis3M=; b=U+PaxkZgtX9amyue
	mx/R9de/bPEaBekjoV81PUltv/M00YrFdB0CIu5i8Gq/oqLgrW3F0UKSq8fWnLka
	Kb8jsxijdiOUtu40uT43Tr0gBXPZlQQqc7D3C4gFXJRmEbcnQMAv7xHchzL4CyIi
	2i38QPglu41sP6kCrCypQuyW8f5P3yc7aI8A97DdgzRZmnJgILubIdLGQcSadIcK
	GcyklR22ymlwviRaPlHUPzfmmWq8WLYGfBG8ZWew/rYFMY1SBj6DYRo/ebDKO1lu
	y9SEA3+JGsUVJiE+vxzecTB7J0eRxDNVZGqV4QlHMC8ALGn0SSQmM92JVjfLV6Go
	aoQWhg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hev6ga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 14:32:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48GEVwMh011918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 14:31:58 GMT
Received: from [10.110.0.24] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Sep
 2024 07:31:55 -0700
Message-ID: <849913f2-eb77-49ef-bab0-86f84d0a435e@quicinc.com>
Date: Mon, 16 Sep 2024 07:31:55 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: firmware: qcom,scm: document support for
 SA8255p
Content-Language: en-US
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20240905183016.3742735-1-quic_nkela@quicinc.com>
From: Nikunj Kela <quic_nkela@quicinc.com>
In-Reply-To: <20240905183016.3742735-1-quic_nkela@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YBhpvBgRFO2_IHCxUJwiZdRnwkImxnj9
X-Proofpoint-GUID: YBhpvBgRFO2_IHCxUJwiZdRnwkImxnj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409160093

Gentle ping...

On 9/5/2024 11:30 AM, Nikunj Kela wrote:
> Add a compatible for the SA8255p platform's Secure Channel Manager
> firmware interface.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> index 2cc83771d8e7..65057f5c8972 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -43,6 +43,7 @@ properties:
>            - qcom,scm-msm8998
>            - qcom,scm-qcm2290
>            - qcom,scm-qdu1000
> +          - qcom,scm-sa8255p
>            - qcom,scm-sa8775p
>            - qcom,scm-sc7180
>            - qcom,scm-sc7280
> @@ -204,6 +205,7 @@ allOf:
>            compatible:
>              contains:
>                enum:
> +                - qcom,scm-sa8255p
>                  - qcom,scm-sa8775p
>      then:
>        properties:

