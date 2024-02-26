Return-Path: <linux-arm-msm+bounces-12535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B358186719A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 11:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6F561C2508D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 10:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAC620DE5;
	Mon, 26 Feb 2024 10:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mJvurQKT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC19E3C473;
	Mon, 26 Feb 2024 10:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708943565; cv=none; b=cuOpaWSc8qix9hfamCgMrqYVNz2Fbg/lNyb9PuZy0RvdbLb7YgpA6MamPNU4Sle7UVX6eWw7jfMZtGU8iXNQQyB+A0uQjZLESjUa5bq39P6hwGcJU8manp80/17e2qPpzDgFHxWx214LS0G033T9FG/bT/i8k1AP4i/Lf4sFtCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708943565; c=relaxed/simple;
	bh=F3u55OhGV8InGLOYAPhg8yuB0UVyGy0x9fN5zJSV8wE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ORiLn60HRX4ltb32q+qHo5rhRnCaJbyH0O/x99YrOPAAV/63KszulsUd5w+i1tYN7Z6T+DSy7wzmy2/fZABrjmM3jAFsOQ9/ZQPZjwwYdkUY2fBkzI+4hE5zPD4RdhDuCemrtG3OpsHU0f7dzDt9Bx4VjaooLlWgsUAG9u3NkyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mJvurQKT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41Q5eY7H016300;
	Mon, 26 Feb 2024 10:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Oh0I/8EOZ6xCmzAUVJLEl67sfABnr7ehv+/eYw3Po3k=; b=mJ
	vurQKTxWEqeqvKvgrf9s/KWMl38bjh+TCHJZ80a7WXUVtg+SoVvmMYJsNcMi2/Ro
	D1bJBrHQRM7WkDXAP2qmaKWZcrF6Sg4v+v/S9zDn1VCpyjWgMnczE3dzjNjV15dP
	iA9+VnmEFdKS5Yrn3bAXJjJsA6owDALJGHHlUVQYzmJsAJtY0+CIbS6nFIQjV8lE
	TmVKJfbhzd4f9srLs7n7qibDMdbd9ncWonyVADhn7SiI7+Ab30ZGvJvX66bGc2Bc
	LGZw6BLxULOyzoE5FbR/MsFS9Gy/H7poJRmq2Q70tq590YLak2V8QDpaNoD3+nWN
	kGaPWNPGj25fm7KVI9Ag==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxn0m7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 10:32:39 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41QAWd35008758
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 10:32:39 GMT
Received: from [10.214.66.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 02:32:36 -0800
Message-ID: <d617c991-b7a7-eb8f-0747-303c33cbf9a7@quicinc.com>
Date: Mon, 26 Feb 2024 16:02:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] soc: qcom: llcc: Add llcc device availability check
Content-Language: en-US
To: Sahil Chandna <quic_chandna@quicinc.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240220122805.9084-1-quic_mojha@quicinc.com>
 <c60638be-e12e-4148-8c20-1dbba9c817da@quicinc.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <c60638be-e12e-4148-8c20-1dbba9c817da@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iiFrOk5F21ZQD7YkY-qWH2GQK1LBOq-_
X-Proofpoint-GUID: iiFrOk5F21ZQD7YkY-qWH2GQK1LBOq-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_07,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402260080



On 2/22/2024 11:37 PM, Sahil Chandna wrote:
> On 2/20/2024 5:58 PM, Mukesh Ojha wrote:
>> When llcc driver is enabled  and llcc device is not
>> physically there on the SoC, client can get
>> -EPROBE_DEFER on calling llcc_slice_getd() and it
>> is possible they defer forever.
>>
>> Let's add a check device availabilty and set the
>> appropriate applicable error in drv_data.
>>
>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
>> ---
>>   drivers/soc/qcom/llcc-qcom.c | 23 ++++++++++++++++++++++-
>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
>> index 4ca88eaebf06..cb336b183bba 100644
>> --- a/drivers/soc/qcom/llcc-qcom.c
>> +++ b/drivers/soc/qcom/llcc-qcom.c
>> @@ -769,6 +769,27 @@ static const struct qcom_sct_config x1e80100_cfgs 
>> = {
>>   };
>>   static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
>> +static DEFINE_MUTEX(dev_avail);
> what is the requirement for mutex lock here? Since we are only trying to 
> find if node present or not

I was trying to avoid two parallel call from llcc_slice_getd() calling
parallel call to of_find_node_by_name() as it should be one time search 
for device presence to find a node and check if device is present or
not.

-Mukesh

>> +
>> +static bool is_llcc_device_available(void)
>> +{
>> +    static struct llcc_drv_data *ptr;
>> +
>> +    mutex_lock(&dev_avail);
>> +    if (!ptr) {
>> +        struct device_node *node;
>> +
>> +        node = of_find_node_by_name(NULL, "system-cache-controller");
>> +        if (!of_device_is_available(node)) {
>> +            pr_warn("llcc-qcom: system-cache-controller node not 
>> found\n");
>> +            drv_data = ERR_PTR(-ENODEV);
>> +        }
>> +        of_node_put(node);
>> +        ptr = drv_data;
>> +    }
>> +    mutex_unlock(&dev_avail);
>> +    return (PTR_ERR(ptr) != -ENODEV) ? true : false;
>> +}
>>   /**
>>    * llcc_slice_getd - get llcc slice descriptor
>> @@ -783,7 +804,7 @@ struct llcc_slice_desc *llcc_slice_getd(u32 uid)
>>       struct llcc_slice_desc *desc;
>>       u32 sz, count;
>> -    if (IS_ERR(drv_data))
>> +    if (!is_llcc_device_available() || IS_ERR(drv_data))
>>           return ERR_CAST(drv_data);
>>       cfg = drv_data->cfg;
> 

