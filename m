Return-Path: <linux-arm-msm+bounces-34388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6522599DE20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 08:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27E672849DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 06:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E23189BB0;
	Tue, 15 Oct 2024 06:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jsXb/0aB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC56B189B85;
	Tue, 15 Oct 2024 06:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728973341; cv=none; b=si3J2L6TD4fFTNPcksKjMot/19X/9DjA1PcIDFxBOqxpQ6G36esQehTZFkQfeeNtAK+LhxiL5PfIBQQj6hWpCv5eLRhloOhlRS94Y6ecyEKIxPbHHsbMp0+t9BCV8PYmcHVbidJ/CKIhrdQi8QTovQuVIionO1YtolQbtpXYZug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728973341; c=relaxed/simple;
	bh=GzwAch/zlTRYOnBiTi/vJ6rawKsWFke2WDsqdkoAmcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gCePDa4l7xGJepfuT+EXkVVRMRIejv+IrtYrSlv+sZT8jwEw+S3VH//R4H87uSJt8iJ68Mc/CYRfmuWonaZq8ScMCFL4onM9bhPjop4OhSL2X0EYtNye+U1AisJmHrC1xpBKzWTCGEpD1jVgbj/GVsCKf++aNFrjsGRwN1RxN8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jsXb/0aB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F60ccs022241;
	Tue, 15 Oct 2024 06:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8emflX/OpMc2gjb7urs+l6mNv4BW0vVjUVUTl7rJLI=; b=jsXb/0aBv/Aesf0/
	tq39kVisjauBOVeQz4Uw7BBcETyXIxNMpWP50RicMzOEbxTMr2vVK/egypv6qVil
	+916QPutprqAzJTOgVKXvRitRJJRONQ+1WAd+o3D3SrUnfP8bfM0QAbJ3RQ3IuYw
	hI9mezoqqqe+53zdW7sc1KF7w7ym4Et5tbIMYzrUyZf7whoLmqTf87L4eBMRZg9k
	8xToJmaY7TfRuIyA0kWRUH+ueZvuvSwr6/aJjHNcGDVZa0pwmo2a49jQN89rRXf5
	dCHtbq/URLolg2hwlMpEX65CxinA/KKZVGNzZe8grKpgs2EOvlxY2048w/o5Yk1a
	d8kYUA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429jrf81m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 06:21:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49F6LrW4006749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 06:21:53 GMT
Received: from [10.64.70.122] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Oct
 2024 23:21:47 -0700
Message-ID: <b2f027d1-5b4a-4b73-aa26-a332df2a561b@quicinc.com>
Date: Tue, 15 Oct 2024 14:21:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: net: qcom,ethqos: add description for
 qcs8300
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh
 Sharma <bhupesh.sharma@linaro.org>,
        Kishon Vijay Abraham I
	<kishon@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>
References: <20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com>
 <20241010-schema-v1-3-98b2d0a2f7a2@quicinc.com>
 <da45vocnwnnnlo6nrxh6x4xwmnsgdp5axfvomzniw5vxlmerer@6ntl3ae4q2ci>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <da45vocnwnnnlo6nrxh6x4xwmnsgdp5axfvomzniw5vxlmerer@6ntl3ae4q2ci>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5LP9lC2ukrn9cy7hIl7Qu-Uv4jFT_NPG
X-Proofpoint-ORIG-GUID: 5LP9lC2ukrn9cy7hIl7Qu-Uv4jFT_NPG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0
 clxscore=1015 mlxlogscore=890 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150043



On 2024-10-10 14:15, Krzysztof Kozlowski wrote:
> On Thu, Oct 10, 2024 at 10:03:45AM +0800, Yijie Yang wrote:
>> Add compatible for the MAC controller on qcs8300 platforms.
>> Since qcs8300 shares the same EMAC as sa8775p, so it fallback to the
>> compatible.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> index 8cf29493b822..3ee5367bdde1 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> @@ -23,6 +23,10 @@ properties:
>>             - enum:
>>                 - qcom,qcs615-ethqos
>>             - const: qcom,sm8150-ethqos
>> +      - items:
>> +          - enum:
>> +              - qcom,qcs8300-ethqos
>> +          - const: qcom,sa8775p-ethqos
> 
> This block should go before earlier qcs615, to keep order by fallback.

Why this block should positioned before qcs615, given that it comes 
later in alphabetical order?

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 


