Return-Path: <linux-arm-msm+bounces-20167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CFA8CB514
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 23:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 948D31F22362
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 21:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA30E1494D2;
	Tue, 21 May 2024 21:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lFZGxUCM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ED450276;
	Tue, 21 May 2024 21:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716325758; cv=none; b=mgwFoqowbAtfuVQ9g8ff4QsF9f73xv10DctTZAq/SqvXAVCyo8meUKnYFbrgOxw28uIZzt7WbCJuMrmd/WU4dFfiWickl20L3+oMieVdtU/TrupREYjTZ297DIZAftJx5DgNwrbnBhSoF2NovCfEqOToCPKnq/rhMw20XtpL4n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716325758; c=relaxed/simple;
	bh=fWTZ0YL6B99AewY8dgQyLES5eEQR41BuHBhzfW1g0U0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s5YYbjCFOk1CQp85DeEZsSJuQCzfQzVXxjAXajqGtXJSjGODDkT4NOlOyqzISuy/MGz/yW4MHvdixBg1/XpNXn4xsXrL41Vgrz9il2pSSDruKorJdZ046xk6gHvI/UY2BLLAdpzm4VQwJNYSpXSy8FT1Yy07VokZ0Hd1SKM09ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lFZGxUCM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LFwKYA025366;
	Tue, 21 May 2024 21:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=w9/5guYkECepYKB8XK5sU9BE3zxUvknZ5WiVyjmhhLo=; b=lF
	ZGxUCMuslSRJn4N26BP4lDiJjjWzYFQ3uZqdMotRHrtDUNSphEy0DQOaGblGiZUw
	hLkDWByNnf8mEImGKHvT7cqOlAbnNXxlyRFa6r8MUDP8jxFWG13Wt6sMRDu57bnh
	42rzAuPuQ2IKE7XN0eUWTMMfovUHgMo4iTl9h9MRx5aQKOJgisnh4c93XYDjv1CT
	Z5B7fcdAxEcAyUwBMS56Xy1EQtoCUZLjmHeKSvjnfbL4+gq9zlkSBpHZbBMaOanU
	B4IR65szxn188sSklrtR6TBslZNK+lwsB3lMPQlhDMoaoAsCQNzBZ/ZbcGXff5xU
	Oa0Hi3ruTWc6Yl6onbZQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n45q33y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 21:09:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LL8xCg007503
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 21:08:59 GMT
Received: from [10.110.98.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 May
 2024 14:08:58 -0700
Message-ID: <93ae2776-a661-40fc-86da-cfb9a39d9fce@quicinc.com>
Date: Tue, 21 May 2024 14:08:58 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] remoteproc: qcom_q6v5_pas: Add hwspinlock bust on
 stop
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon
	<will@kernel.org>, Waiman Long <longman@redhat.com>,
        Boqun Feng
	<boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Richard Maina <quic_rmaina@quicinc.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
 <20240516-hwspinlock-bust-v1-6-47a90a859238@quicinc.com>
 <722c57dc-98cf-4ec8-93c5-aef55e6084c7@linaro.org>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <722c57dc-98cf-4ec8-93c5-aef55e6084c7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MWScqxPqfOfjDa96N-XmRutGCCzySS8-
X-Proofpoint-ORIG-GUID: MWScqxPqfOfjDa96N-XmRutGCCzySS8-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_12,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210159



On 5/21/2024 10:38 AM, Konrad Dybcio wrote:
> 
> 
> On 5/17/24 00:58, Chris Lew wrote:
>> From: Richard Maina <quic_rmaina@quicinc.com>
>>
>> When remoteproc goes down unexpectedly this results in a state where any
>> acquired hwspinlocks will remain locked possibly resulting in deadlock.
>> In order to ensure all locks are freed we include a call to
>> hwspin_lock_bust() during remoteproc shutdown.
>>
>> For qcom_q6v5_pas remoteprocs, each remoteproc has an assigned id that
>> is used to take the hwspinlock. Remoteproc should use this id to try and
>> bust the lock on remoteproc stop.
>>
>> This edge case only occurs with q6v5_pas watchdog crashes. The error
>> fatal case has handling to clear the hwspinlock before the error fatal
>> interrupt is triggered.
>>
>> Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
>> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
>> ---
> 
> 
>>   drivers/remoteproc/qcom_q6v5_pas.c | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c 
>> b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 54d8005d40a3..57178fcb9aa3 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/clk.h>
>>   #include <linux/delay.h>
>>   #include <linux/firmware.h>
>> +#include <linux/hwspinlock.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>> @@ -52,6 +53,7 @@ struct adsp_data {
>>       const char *ssr_name;
>>       const char *sysmon_name;
>>       int ssctl_id;
>> +    int hwlock_id;
>>       int region_assign_idx;
>>       int region_assign_count;
>> @@ -84,6 +86,9 @@ struct qcom_adsp {
>>       bool decrypt_shutdown;
>>       const char *info_name;
>> +    struct hwspinlock *hwlock;
>> +    int hwlock_id;
> 
> IIRC, this is the same one that is passed in the DT.
> 
> Can we get it dynamically from there?
> 

The argument passed in DT is the index of the hwlock in the TCSR mutex 
region. The index determines use of hwlock[0..n]

This id is supposed to be the identifier that is passed into 
hwspin_lock_bust(). The actual value that we would read from 
hwlock[0..n] to see if we need to bust the lock.

Maybe the naming of this variable is confusing. Do you have any 
suggestions to make it clearer? Could call it hwlock_bust_id.

We could also try increasing the #hwlock-cells to 2 and have something 
like <&phandle index bust_id>. To me this seemed odd for clients that 
weren't planning on using the bust_id.

> Konrad

