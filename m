Return-Path: <linux-arm-msm+bounces-27236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ACE93F31B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C92051C21B12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CC81422C4;
	Mon, 29 Jul 2024 10:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T30bWih4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F076C28399;
	Mon, 29 Jul 2024 10:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722250146; cv=none; b=dTMjjuxWE4CIClY1AzR6dkVmKSpGvbexcF9HvdbbAhR0LC0VgNt/oxj8zwt3cyr7AmgUysnFxbSy7ukhAtqN/MV55ChjrouNiQHNvTHulhlxMPxQZVkNS7KR5LbbHmMm217JJr8WXQfk99uKDh/gTXrxDwfV7Zvu3MYhhgscKts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722250146; c=relaxed/simple;
	bh=iLObMJcPpAv1PmLfMjcnb4awXSesMGgiYmxAenv/EVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=shnF43pAYaqDFfnZb1lO7vMpSu5g00xOdSViGny0ZCpmWp/VkUeGNDLD7ysXzlRwV+hKNrjPKoLeu562VD/ENLUk2zqKSpGytRlsupeRKqqfR4HKoCdNZK1+3d8HwARA2in3FDh0RXtvktGn0tV1rCk2Q+nUByW9iUcuGByQ/c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T30bWih4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TAN1kV026715;
	Mon, 29 Jul 2024 10:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0e3BFw5kPzxWMlrNAMjsdgQe7xXiJVJKUJTTC5HyRus=; b=T30bWih4F4YIN4nT
	N1fnDuuvWE8rOGlcA/Ja++KNQhWbDhMA21VAskeXqPtxiSA8uyQXlculwEMeF9g2
	zWo9GpXgVncRzmtpcaW7Ieew1CEM12IS0KyCaptuRp4ay1KCsoFcpojlnEveu5AI
	oXs+vG7GHGcWMlrY423L0os4hiC/9ZvWodbdlmH3/NmH1w4BSac34v944mqT9GiA
	6dOVxTgNq+0TvvzYach+U+PGdNlFxTJ2XkEPT53ijuhQpJWBbF/GdJACi78x8QHp
	5cVuMlUOjo5WZjuVu+pQIU/KvE3gwjhpBg1U0e7Jks4UZzAqhDhpSrLURp5AeKqh
	8n5dyQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mpkev4js-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:48:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TAmvvC031966
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:48:57 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 03:48:53 -0700
Message-ID: <1f5c5be4-f864-489c-941d-aad4a914508e@quicinc.com>
Date: Mon, 29 Jul 2024 18:48:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mfd: qcom,tcsr: Add compatible for
 sa8775p
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Mukesh Ojha
	<quic_mojha@quicinc.com>, <lee@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tingwei <quic_tingweiz@quicinc.com>,
        "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
References: <20240705153252.1571814-1-quic_mojha@quicinc.com>
 <3b16214b-4693-4754-b62a-fea2e070269c@kernel.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <3b16214b-4693-4754-b62a-fea2e070269c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 92WqJAmdmNqETMym4RWt-0xvpGYsNlj1
X-Proofpoint-GUID: 92WqJAmdmNqETMym4RWt-0xvpGYsNlj1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_09,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxlogscore=799 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290073



On 7/7/2024 8:46 PM, Krzysztof Kozlowski wrote:
> On 05/07/2024 17:32, Mukesh Ojha wrote:
>> Document the compatible for sa8775p SoC.
>>
>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> 
> Eh? SA8775p is going to be removed/changed... why adding this?
> 
> Best regards,
> Krzysztof
> 

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Therefore, this patch is still needed, please continue to review this
patch.
Thank you for your input.

-- 
Thx and BRs,
Tengfei Fan

