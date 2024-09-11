Return-Path: <linux-arm-msm+bounces-31527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6489D97576C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 17:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BA99286AAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 15:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3598B1ABEB8;
	Wed, 11 Sep 2024 15:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OqyltwHZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50E71779AE;
	Wed, 11 Sep 2024 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726069501; cv=none; b=HeczhE7vCfwK8m5PwsV5xcYAjsSR9YsY8Pmdz4HzpVcnBrp4yUKKZQNY4b0YDBgwOZobxjxED2KPwRMW2EjC/NicGtQZ+k8nt68QahCdrWxGV9x4NbmVqJ1XlP7tCd2Y2SaRp+/kGEF19cLy/s9OBG4Dev7dYR4Lq6LaVciz2c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726069501; c=relaxed/simple;
	bh=z7gdWOnnIaBdb5pN5l9/fYMFqpIEyMtePLS53Ejt4hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=R7RWfqC45gR9VUuK4CNLkxxPjoqXcFZvgZSOKSapU9Lw4+IkdRb8vX3UtIa9YNnnWk3QV+Ityz/AM+0PyPG7kQMH8bWMMx9xPcob/RdQiX5GUUnpAwK8a7xHFZgJ44bShpJeD79T7FcX1qLoLj3DV+T6xQQPZhCCOHnnHRzxZok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OqyltwHZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BEmiYc011927;
	Wed, 11 Sep 2024 15:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oJYh1r3IYXHSBmoqWsyfTxf514/ZwKXYpOzRhzGuJW0=; b=OqyltwHZpPBbIPIT
	kcaYP6FQbP71/pfaGiSPMb6dlytozzW5NFxc/3ly3xgdvHb7+3FIMe0Z5wtc/9RQ
	NGOCni3khY3zlUgQsIbdCOWGGOeFUjkTNNeJWi9VzUaGMep1g6iqmo41Y4ruvNUJ
	od4YCCbyaXQv7JcEfTSAbWRc8n/yCNxlMlUY8u4KVa2IACtbmrPNlGjnSsIaZrkH
	KBEOMHKp626YNwmHgOc0ylnJDgjufjAjCC3M+Ml4lh4XJfQ8FdDiKWLyzQxtyJnf
	eR+cOXOnwuwJZ+U+ylv86gh3MCIxZU2HrkNWWiisXI//FMwV6fcDPKwsYXMirf8u
	7fHVUg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy51a1r0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 15:44:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48BFisut015094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 15:44:54 GMT
Received: from [10.111.181.177] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Sep
 2024 08:44:53 -0700
Message-ID: <6a7b60c4-379c-4251-a158-5d9986f37797@quicinc.com>
Date: Wed, 11 Sep 2024 08:44:53 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Snapdragon Devkit for
 Windows
To: Sibi Sankar <quic_sibis@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <krzk+dt@kernel.org>, <robh+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <conor+dt@kernel.org>,
        <abel.vesa@linaro.org>, <srinivas.kandagatla@linaro.org>
References: <20240911073337.90577-1-quic_sibis@quicinc.com>
 <20240911073337.90577-2-quic_sibis@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240911073337.90577-2-quic_sibis@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QSfRdezNqAmv0dWTRDqbsfhg0VPqgaBW
X-Proofpoint-GUID: QSfRdezNqAmv0dWTRDqbsfhg0VPqgaBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1011 phishscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409110119

On 9/11/2024 12:33 AM, Sibi Sankar wrote:
> X1E001DE is the speed binned variant of X1E80100 that supports turbo
> boost up to 4.3 Ghz.

if you respin, s/Ghz/GHz/

> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 5cb54d69af0b..6a8fc031e51f 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1049,6 +1049,12 @@ properties:
>                - qcom,sm8650-qrd
>            - const: qcom,sm8650
>  
> +      - items:
> +          - enum:
> +              - qcom,x1e001de-devkit
> +          - const: qcom,x1e001de
> +          - const: qcom,x1e80100
> +
>        - items:
>            - enum:
>                - lenovo,thinkpad-t14s


