Return-Path: <linux-arm-msm+bounces-33447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD52D993711
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 21:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52475B20DB1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 19:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E30B1DD871;
	Mon,  7 Oct 2024 19:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gV6vMN3g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CF013B797;
	Mon,  7 Oct 2024 19:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728328645; cv=none; b=DOYWo75dd4zMEmtPIMYfenD/oMclWj4s0Vdeyha8jEea4P7BH2gcIWgXPPjEyj77PoIdFMujIPd9v53zY7n6kaHUllo2kiE73RwZUnu/2Gws+kqbPBa8UWoGUU0LxOX8Vz+1x0e6/fOGOVHi9Y7sWL23XRi7Hl3tQWk8CwoTGC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728328645; c=relaxed/simple;
	bh=07SR08Pw3mAC0nUwMsVPq5Lnr1AOVKeEnuuelVxUPHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WhMq9fNbUuGuPNRGRUn4RAKuBy2PqYJ7DFbgNkkJ84KnT3r0UbsFyZenenPinpHCrA7uAEDgINVmSOYsIc2cBjXw6Hr7S3cpDG9gexmMebLpVr5LwmUosSFb9J/mBmG3nCrl51hMqjq9kbS418eX2n5bKigWPqmY374mBDqvvaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gV6vMN3g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497En0mi017611;
	Mon, 7 Oct 2024 19:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iv62g1Uag84fT16ECiu5fwXcu4+s3g3bBVkiBCEbb/c=; b=gV6vMN3gkoedlvik
	rFh6WZutkkovpVDFdvuyVQcXpPJ2b36QpRb+g3+J4jLwdXZp6G6pk5yzBQKc3C5p
	3Tz9A7gqgO/1dc5mFuMkwwaup+izIlCV3y5V5RrPo0y9s3pMw8C3Bq27qs3PvqMG
	nGX2IOIK61MKjFHJpyLz1fecGM6TbM+xeAVMwgMq9xIgAMybvuUf7ZPoYlBSt1BL
	j8pTASbUHkuV64b3v+QWYCndkJ9AYra+I/5Yp0QPyBmYTDaoxbh9OBm3aEiDH75m
	2e+4uT+GWy/DrZBtIxDmdxbYnXO7ALqqy1nyRzGldRMzHxWjJR4AM992rZ47hKol
	C2gG3Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xs4d5ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 19:17:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497JH8oG006784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 19:17:08 GMT
Received: from [10.216.6.71] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 12:17:06 -0700
Message-ID: <2eb53ea6-848a-48bb-8c31-83a118bc5a73@quicinc.com>
Date: Tue, 8 Oct 2024 00:47:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: qcom: qcom_tzmem: Implement sanity checks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
 <20241005140150.4109700-3-quic_kuldsing@quicinc.com>
 <wzrj4vhrb4h3pe5dft7vqz2tl55txdyuciuxlysuck5isi7r4z@bs2ts3popy2t>
Content-Language: en-US
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
In-Reply-To: <wzrj4vhrb4h3pe5dft7vqz2tl55txdyuciuxlysuck5isi7r4z@bs2ts3popy2t>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YC39Kr-1BjUUKCLYKAljJ24RQMRdiy_N
X-Proofpoint-GUID: YC39Kr-1BjUUKCLYKAljJ24RQMRdiy_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410070132


On 10/7/2024 1:00 AM, Dmitry Baryshkov wrote:
> On Sat, Oct 05, 2024 at 07:31:50PM GMT, Kuldeep Singh wrote:
>> The qcom_tzmem driver currently has multiple exposed APIs that lack
>> validations on input parameters. This oversight can lead to unexpected
>> crashes due to null pointer dereference when incorrect inputs are
>> provided.
>>
>> To address this issue, add required sanity for all input parameters in
>> the exposed APIs.
> 
> Please don't be overprotective. Inserting guarding conditions is good,
> inserting useless guarding conditions is bad, it complicates the driver
> and makes it harder to follow. Please validate return data rather than
> adding extra checks to the functions.

Sure, I’ll remove the redundant checks.
Please see below for explanations.

My intention here is to handle erroneous conditions gracefully to avoid system crashes, as crashes can be detrimental.

>>
>> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
>> ---
>>  drivers/firmware/qcom/qcom_tzmem.c | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
>> index 92b365178235..2f2e1f2fa9fc 100644
>> --- a/drivers/firmware/qcom/qcom_tzmem.c
>> +++ b/drivers/firmware/qcom/qcom_tzmem.c
>> @@ -203,6 +203,9 @@ qcom_tzmem_pool_new(const struct qcom_tzmem_pool_config *config)
>>  
>>  	might_sleep();
>>  
>> +	if (!config || !config->policy)
> 
> config can not be NULL
> Ack for config->policy check.

Considering a scenario where user doesn't fill config struct details and call devm_qcom_tzmem_pool_new.
config will be null in that case.

> 
>> +		return ERR_PTR(-EINVAL);
>> +
>>  	switch (config->policy) {
>>  	case QCOM_TZMEM_POLICY_STATIC:
>>  		if (!config->initial_size)
>> @@ -316,6 +319,9 @@ devm_qcom_tzmem_pool_new(struct device *dev,
>>  	struct qcom_tzmem_pool *pool;
>>  	int ret;
>>  
>> +	if (!dev || !config)
>> +		return ERR_PTR(-EINVAL);
> 
> dev can not be NULL
> config can not be NULL

dev may not be always __scm->dev.
For ex: qcom_qseecom_uefisecapp.c pass it's own dev.
If new calling driver pass dev as null, will lead to NPD.

> 
>> +
>>  	pool = qcom_tzmem_pool_new(config);
>>  	if (IS_ERR(pool))
>>  		return pool;
>> @@ -366,7 +372,7 @@ void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp)
>>  	unsigned long vaddr;
>>  	int ret;
>>  
>> -	if (!size)
>> +	if (!pool || !size)
> 
> Is it really possible to pass NULL as pool? Which code path leads to
> this event?

qcom_tzmem_alloc/free need to be used once pool is already created with devm_qcom_tzmem_pool_new API.
If pool isn't created, then calling qcom_tzmem_alloc/free will be erroneus.

> 
>>  		return NULL;
>>  
>>  	size = PAGE_ALIGN(size);
>> @@ -412,6 +418,9 @@ void qcom_tzmem_free(void *vaddr)
>>  {
>>  	struct qcom_tzmem_chunk *chunk;
>>  
>> +	if (!vaddr)
>> +		return;
> 
> Ack, simplifies error handling and matches existing kfree-like functions.
> 
>> +
>>  	scoped_guard(spinlock_irqsave, &qcom_tzmem_chunks_lock)
>>  		chunk = radix_tree_delete_item(&qcom_tzmem_chunks,
>>  					       (unsigned long)vaddr, NULL);
>> @@ -446,6 +455,9 @@ phys_addr_t qcom_tzmem_to_phys(void *vaddr)
>>  	void __rcu **slot;
>>  	phys_addr_t ret;
>>  
>> +	if (!vaddr)
> 
> Is it possible?

Yes, A scenario where qcom_tzmem_alloc fails resulting vaddr as 0 followed by no null check.
Now, immediately passing vaddr to qcom_tzmem_to_phys will again cause NPD.

> 
>> +		return 0;
>> +
>>  	guard(spinlock_irqsave)(&qcom_tzmem_chunks_lock);
>>  
>>  	radix_tree_for_each_slot(slot, &qcom_tzmem_chunks, &iter, 0) {
>> @@ -466,6 +478,9 @@ EXPORT_SYMBOL_GPL(qcom_tzmem_to_phys);
>>  
>>  int qcom_tzmem_enable(struct device *dev)
>>  {
>> +	if (!dev)
>> +		return -EINVAL;
> 
> Definitely not possible.

Ack, by this time __scm->dev will be initialised in qcom_scm driver and cannot be null.
If some other caller even try and qcom_tzmem_dev is already set hence, return -EBUSY.
Will drop the check.

-- 
Regards
Kuldeep

