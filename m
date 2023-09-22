Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F70D7AB444
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Sep 2023 16:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbjIVO7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Sep 2023 10:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbjIVO7Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Sep 2023 10:59:25 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DFF2C6
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Sep 2023 07:59:19 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38MDr72f031342;
        Fri, 22 Sep 2023 14:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=x/H3CW8HVWSJaykAt/i+Mq2kRQimCagjgFRVynuPtj4=;
 b=bEAjpIqV4QK/Ht9F6ItxHnPrKG326PVAy2WzXz/zjP7L4+iqGKLxFaC6BHHzRkNZcamg
 36mzooblPJ3GgC66J5zkulx3x9tutCz7+RO3Cyorp02C0Vu17P+2TumfhBU8rdhf/AaV
 4BmUkDG+npmLbIxR2FHIUGwfI7CcTmt9IUULwVzcY7+OJOSQf/fPpOSc8ZDpLWmXrx9B
 NaroPoLjMT7b7UVfecDRAtzEZPNGuEA7N558bIeMGifg+5WhUczFB6Fcy9dTrsFz+XbS
 0aDjaG9IsgEVQG8kdlhjAS1NTYEw5Tin1VdMvdeGe8LFu1UjXVD+qA58MTOpAuBcNBDF iQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t9a3e8ehf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Sep 2023 14:59:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38MEx7dI001327
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Sep 2023 14:59:07 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 07:59:06 -0700
Message-ID: <584cefef-ccdc-1a5f-5e2c-2638ee2bf45f@quicinc.com>
Date:   Fri, 22 Sep 2023 08:59:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 6/7] accel/qaic: Create a function to initialize BO
Content-Language: en-US
To:     Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
CC:     <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <ogabbay@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>
References: <20230901172247.11410-1-quic_jhugo@quicinc.com>
 <20230901172247.11410-7-quic_jhugo@quicinc.com>
 <20230917084829.GA441281@linux.intel.com>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230917084829.GA441281@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9kwnr098oQ_8CVfPNHgO8NAjO-dMhn3i
X-Proofpoint-GUID: 9kwnr098oQ_8CVfPNHgO8NAjO-dMhn3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_13,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220128
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/17/2023 2:48 AM, Stanislaw Gruszka wrote:
> On Fri, Sep 01, 2023 at 11:22:46AM -0600, Jeffrey Hugo wrote:
>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>
>> This makes sure that we have a single place to initialize and
>> re-initialize BO.
>>
>> Use this new API to cleanup release_dbc()
>>
>> We will need this for next patch to detach slicing to a BO.
>>
>> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> ---
>>   drivers/accel/qaic/qaic_data.c | 20 ++++++++++++++------
>>   1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
>> index 6e44e00937af..2acb9dbac88b 100644
>> --- a/drivers/accel/qaic/qaic_data.c
>> +++ b/drivers/accel/qaic/qaic_data.c
>> @@ -635,6 +635,18 @@ static const struct drm_gem_object_funcs qaic_gem_funcs = {
>>   	.vm_ops = &drm_vm_ops,
>>   };
>>   
>> +static void qaic_init_bo(struct qaic_bo *bo, bool reinit)
>> +{
>> +	if (reinit) {
>> +		bo->sliced = false;
>> +		reinit_completion(&bo->xfer_done);
>> +	} else {
>> +		init_completion(&bo->xfer_done);
>> +	}
>> +	complete_all(&bo->xfer_done);
> Why do you need complete_all() here ?

This is moved from qaic_alloc_init_bo().

This puts the BO in a state where the wait_exec ioctl will fall through 
and return if userspace immediately calls it after allocating the BO, 
prior to submitting the BO to hardware.  Otherwise we need a special, 
one off check to see that the BO was never submitted to the hardware and 
handle that edge case.

-Jeff
