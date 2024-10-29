Return-Path: <linux-arm-msm+bounces-36244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C12B59B4049
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 03:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CA8728316E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 02:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0280B21348;
	Tue, 29 Oct 2024 02:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AdYbSrOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36D2B661;
	Tue, 29 Oct 2024 02:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730168252; cv=none; b=elvSs0Qk28FtXDvnuCsdvjb2D+i8kCtLFjL1fyoLi0+cb/tKctnk1qQcSdITOPTYUHsGM2ClW++0GS52vrLz3/ereFNSa3DxIc3ZdB6CZ9do8g1vuwLddqpYTlHhZb7PhQ417Pp7IM44QojvgKZVcDQlgNvtglpFxHAHKZavYug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730168252; c=relaxed/simple;
	bh=WOnSUIQBuKzoLwrYxUnZ9DsMMoO3e7npDC5vAp/163o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qtU50EY4X2t4JaTyWz7cstlcxQg2p3vWuUM4mt2lGgsWpQPzHCIhfXUZGe4rE+yvx4x9fKV6foF2hshPOLskGPK4xI7FMxjyXYObOL6ELOvXLsmaGfNDByV1XNSM9WYejbmiepzRfYlE80EhzIJHXaLOMdVwh8JB7w639a2+CCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AdYbSrOD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SIfaK7022936;
	Tue, 29 Oct 2024 02:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DlKmic9dACLOMQPRMfL+5WmhlfgUgYve9EN1vzHwzxQ=; b=AdYbSrODo7mPPIJm
	j7M7oC9uEVphz2GLWjswi1TD9qIkRkKCQMrs478DHo9nga8I1nO1eWQxiqQYu8uM
	RzN+P/pANTorjmk0NSH/S8of2+UZ9sdFwiMx6ECHO3GqoYT5liB5P2vgrFP94DQl
	XOoY+Bt7HzV3p1vamlAlsWAxHHFfItbitW8vYPWUYT2VR3z2XEl7KlIQWJxYFNr7
	eaO0QlkPhkZfxaYBmoKGBCZ0KtW/TweHuZWiqLl6NRE4zFMezeihVIJajfNUf9lQ
	H2OmsJvMB8XK907ApDFOCFKTEugVvbDiLfAQN52iLBUsaFK0alP7cfmFnqPL1myi
	v7a8+Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grn4xxh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 02:17:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49T2HId1021983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 02:17:18 GMT
Received: from [10.253.11.110] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 19:17:12 -0700
Message-ID: <3d717bdc-4b8a-4e85-9bcf-e25b75d9fecf@quicinc.com>
Date: Tue, 29 Oct 2024 10:17:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add ethernet dts schema for qcs615/qcs8300
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20241017-schema-v2-0-2320f68dc126@quicinc.com>
 <132a8e29-3be7-422a-bc83-d6be00fac3e8@kernel.org>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <132a8e29-3be7-422a-bc83-d6be00fac3e8@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cXPft-qHqazelOYVa8i5wIudbMRB9Q1I
X-Proofpoint-ORIG-GUID: cXPft-qHqazelOYVa8i5wIudbMRB9Q1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290016



On 2024-10-28 19:04, Krzysztof Kozlowski wrote:
> On 17/10/2024 11:52, Yijie Yang wrote:
>> Document the ethernet and SerDes compatible for qcs8300. This platform
>> shares the same EMAC and SerDes as sa8775p, so the compatible fallback to
>> it.
>> Document the ethernet compatible for qcs615. This platform shares the
>> same EMAC as sm8150, so the compatible fallback to it.
>> Document the compatible for revision 2 of the qcs8300-ride board.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>> This patch series depends on below patch series:
>> https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
>> https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/
> 
> So it cannot be merged...
> 
> Instead please decouple your works. I don't get why do you claim there
> is dependency in the first place, but anyway. Fix up your patchsets to
> fix that (if there is something to fix).
> 

Actually, the dependency is unnecessary here. I will remove it together 
with the merged patch in the upcoming version.

> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Yijie


