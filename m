Return-Path: <linux-arm-msm+bounces-36788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0E29B96F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 18:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09A551F22258
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 17:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0001CC17C;
	Fri,  1 Nov 2024 17:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="an/RQhSi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAD945016;
	Fri,  1 Nov 2024 17:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730483813; cv=none; b=YCd4W3DgITebYwQOEpPeTq+Ph5CzN9fMjKunZoxcpUsLSPoqVLMiy1etU0/peiImuWPeLh9YgqjKGLwIhJDQQ1//INur6aHmTQOVz0FsbFbMTKhM1ve9lNJs4swgd5xkQGyUhCs6aVxxMHteEavBSOUTcBvRifOEyJm2+s7Yw3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730483813; c=relaxed/simple;
	bh=NUJe7FPWye+RO9eA/Pgnrtmac6Ath/ZW0pBVWIQlPMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z0klJoclXSTwINx3r09435V+rxhZyxor7S8ExIqC5kEXYkT217nzgLjjPfc3nu5zhYHdXbNaRQ7MLVgzUFAxKiHdetAmXuYT+f/psQcI0m0zyxdX68azIfNuirT3uL6jDtVHSqJQgsEyf13Q7aTZc7pEystYBeDW5L0zKMb28HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=an/RQhSi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1BtARb005387;
	Fri, 1 Nov 2024 17:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mgSuPV69xF8TLmu/JMEHLnZgzGHjCYi+NRyZ4Danjbo=; b=an/RQhSiL84txMTy
	fby93GhvvLn2GDJiInKKOS9tRH+ZrVTUimCTGLnnbdL54+2hF/UA1THI9cGUkjJC
	bwsL6YG75FRXN/4WrXa3QvUXI4yXbLH53BKXpFOZZAEZKLFCpO1pPSyfkoF0R9Yp
	OnFkb8Oj7l0+rAbOp/plDPgpLO91bP8qybSnnUgV789xPa8+k/wBH3aMl3oMEtVh
	RdGRGaQbS1O8sjRQ10SMRzK1NhM82zZQM/Ru0/GonoyoL614F463RqtCQaviKc62
	tmniyAlRhcgIisd9YX70afRt+l2+iXaaKlC3VfhQFiajivKrW8ey5beo6VtbqJFG
	GuDgtA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42m1xce4f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 17:56:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1Hul9d016441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 17:56:47 GMT
Received: from [10.110.33.199] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 1 Nov 2024
 10:56:46 -0700
Message-ID: <bc6f7fb3-58d7-48fc-bf1d-55a242e66c45@quicinc.com>
Date: Fri, 1 Nov 2024 10:56:46 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add SM8750 ADSP
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>
References: <20241101170309.382782-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <20241101170309.382782-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6VDxS-eWnU8s02BGMnuvw7KwPmWJ16HS
X-Proofpoint-ORIG-GUID: 6VDxS-eWnU8s02BGMnuvw7KwPmWJ16HS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=843 clxscore=1011
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411010129



On 11/1/2024 10:03 AM, Krzysztof Kozlowski wrote:
> Document compatible for Qualcomm SM8750 SoC ADSP PAS which looks fully
> compatible with SM8550 variant.  The only difference from bindings point
> of view is one more interrupt ("shutdown-ack").  Marking devices as
> compatible, using SM8550 ADSP PAS fallback, requires changing some of
> the conditionals in "if:then:" to "contains".
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Cc: Melody Olvera <quic_molvera@quicinc.com>
> Cc: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 48 +++++++++++++------
>   1 file changed, 34 insertions(+), 14 deletions(-)
>
Reviewed-by: Melody Olvera <quic_molvera@quicinc.com>

