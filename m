Return-Path: <linux-arm-msm+bounces-35332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A43F9A98CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F7881C21E24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 05:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9B412BF25;
	Tue, 22 Oct 2024 05:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dDKsibgb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223E51E4BE;
	Tue, 22 Oct 2024 05:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729575812; cv=none; b=NMqGKAvbVSvbwYqbyi514g+SAzmDn9zFKq/LjcL4+kQn23sQ5fAt0/xp8DP24x2YPkWJcVlvniV6x6JaSMklfbYlE3g5Ho4W0Fdkb2o9NJdezsTecHBCQHwIBs0dIm8nlM09hmome9dfie6aL1jkHyWTyWlD3NV9n01ySQ4NyxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729575812; c=relaxed/simple;
	bh=+tgEFzOiGB/X1K/inNjx4X+zCiG9JwpQTBPGx2P1THg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=k58YSCXEFB8XtR9y1vmv+ixV0EI0Gs5Z+lgm0x4RZFVc7mYazo0Q/I1N1b5OakuUBnSAdt/s1tQzPysxdVPWHUqSP0ln6AN5OM4gKpazkZrHbuYEhSwiYpdKdTiq2wLkOzqOxcZ+UAWyzGg3a62kK7PzhY8EITyAZGL/jupcY5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dDKsibgb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LJtmPi016339;
	Tue, 22 Oct 2024 05:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kq+QHhxooHdq8lD5/mJnkE7tP6DLk6t6/J7Was3bh6w=; b=dDKsibgbslCdXzrv
	cWnHi8I4YafuR2s1k5oXKF/WtCFMo/XBB/I63DA3PDnKUcVGSZFNEixiL8ZHJ5/9
	MSLkbNC+ztNN6osWl4Ah1IaeR71Rq4B44grAjCdY4DdoWfxKZAYtjQ/Ow4upCaFZ
	TKO4lkaUHOUzd1FfrB17dkSwnUhXe/u7DuJd9rB84M/4zfaGVTEjkLd5/qsk1BFb
	Cm1VWp7v3/OYUrdmXL3cZSaeHNqrEwbswJIfMKaXFt42ZOsVQTyC7qYrdfyXjA8t
	nIJyyImf4IUICJzin0vVVUHU/vdjU5tkONQjNPpXhrIzGZRIV8nKCcAbf3aeY1Ny
	flWsOg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6rj709r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 05:43:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M5hOtC012986
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 05:43:24 GMT
Received: from [10.218.44.178] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 22:43:21 -0700
Message-ID: <21630547-552b-43e0-906f-840610327876@quicinc.com>
Date: Tue, 22 Oct 2024 11:13:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] firmware: qcom: qcom_tzmem: Implement sanity
 checks
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241014111527.2272428-1-quic_kuldsing@quicinc.com>
 <20241014111527.2272428-3-quic_kuldsing@quicinc.com>
 <CAMRc=MfR8rK3EnZx3_9rxkwgv6f8jA4X0u0cGBkpJ89d5i1MKw@mail.gmail.com>
 <f46a9180-ca71-458e-9693-ed9badc85e72@quicinc.com>
Content-Language: en-US
In-Reply-To: <f46a9180-ca71-458e-9693-ed9badc85e72@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d7MX-jmdXmSX8xMu7If1g32ahpQaQe6F
X-Proofpoint-ORIG-GUID: d7MX-jmdXmSX8xMu7If1g32ahpQaQe6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410220036



On 10/16/2024 2:31 PM, Kuldeep Singh wrote:
> 
> On 10/14/2024 6:38 PM, Bartosz Golaszewski wrote:
>> On Mon, Oct 14, 2024 at 1:19 PM Kuldeep Singh <quic_kuldsing@quicinc.com> wrote:
>>>
>>> The qcom_tzmem driver currently has exposed APIs that lack validations
>>> on required input parameters. This oversight can lead to unexpected null
>>> pointer dereference crashes.
>>>
>>
>> The commit message is not true. None of the things you changed below
>> can lead to a NULL-pointer dereference.>
>>> To address this issue, add sanity for required input parameters.
>>>
>>> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
>>> ---
>>>  drivers/firmware/qcom/qcom_tzmem.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
>>> index 92b365178235..977e48fec32f 100644
>>> --- a/drivers/firmware/qcom/qcom_tzmem.c
>>> +++ b/drivers/firmware/qcom/qcom_tzmem.c
>>> @@ -203,6 +203,9 @@ qcom_tzmem_pool_new(const struct qcom_tzmem_pool_config *config)
>>>
>>>         might_sleep();
>>>
>>> +       if (!config->policy)
>>> +               return ERR_PTR(-EINVAL);
>>
>> This is already handled by the default case of the switch.
> 
> Ack. Need to drop.
> https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom/qcom_tzmem.c#L218
> 
> While examining qcom_tzmem_pool_free under the same principle, it
> appears the following check is unnecessary.
> https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom/qcom_tzmem.c#L268
> 

Bartosz,
I am thinking to remove below check in next rev like mentioned above.
https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom/qcom_tzmem.c#L268

Do you have any other opinion here?
Please let me know.

-- 
Regards
Kuldeep

