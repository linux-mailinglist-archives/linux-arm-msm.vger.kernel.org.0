Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7547643A7B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 01:58:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbiLFA6M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 19:58:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbiLFA6L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 19:58:11 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C9E1659F;
        Mon,  5 Dec 2022 16:58:10 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B60UPbb003507;
        Tue, 6 Dec 2022 00:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eP+qjCpVSwTpKL9I/QMjstOFGXExH6+QOeU2OjjmWk4=;
 b=fTfPTeU1nlGPzeY4GUUgURZeIW4RctAUIPtCwSmbfzoPFM/ExO1u4zIca23NLxrFk8Lo
 7gBqGTkp1bMXxWKmSTZFwciP+2Pljj9bFqgZLsE8+ypiFXpivxUcPquXax87u7o55ePq
 7keJZtVZm/XIJjbDKFsKONUJTA63dcsG4CI7sUTER2VuTzcZ9elkEuuNfqRaRL9c8CH/
 lLEMXc8XKJwCdSRpw3CalclDhd1icZIg3NvDJn5npsrrOpNrI0f7SYSydVDlsC3hqBbU
 n3nl2DHJbQ/zWJD+YDxgYowwy7ZQnZvni5hLY7xgPtzAumMsDkXKt7dw0CfDiMWQNifU NA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m9eev2200-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Dec 2022 00:58:05 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B60w54I002632
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 6 Dec 2022 00:58:05 GMT
Received: from [10.239.133.73] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 5 Dec 2022
 16:58:03 -0800
Message-ID: <fa62ad12-7b37-67b0-fbfa-4050b994371a@quicinc.com>
Date:   Tue, 6 Dec 2022 08:58:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 1/2] remoteproc: core: do pm relax when in
 RPROC_OFFLINE
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <arnaud.pouliquen@foss.st.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <quic_clew@quicinc.com>
References: <20221202094532.2925-1-quic_aiquny@quicinc.com>
 <20221202094532.2925-2-quic_aiquny@quicinc.com>
 <20221202173015.GC165812@p14s>
From:   "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
In-Reply-To: <20221202173015.GC165812@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6d4fHINzsKDwEK1BJp-FJmkEFaOjg0ei
X-Proofpoint-GUID: 6d4fHINzsKDwEK1BJp-FJmkEFaOjg0ei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212060003
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/3/2022 1:30 AM, Mathieu Poirier wrote:
> On Fri, Dec 02, 2022 at 05:45:31PM +0800, Maria Yu wrote:
>> RPROC_OFFLINE state indicate there is no recovery process
>> is in progress and no chance to do the pm_relax.
>> Because when recovering from crash, rproc->lock is held and
>> state is RPROC_CRASHED -> RPROC_OFFLINE -> RPROC_RUNNING,
>> and then unlock rproc->lock.
>> When the state is in RPROC_OFFLINE it means separate request
>> of rproc_stop was done and no need to hold the wakeup source
>> in crash handler to recover any more.
>>
>> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 8768cb64f560..c2d0af048c69 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1862,11 +1862,16 @@ static void rproc_crash_handler_work(struct work_struct *work)
>>   
>>   	mutex_lock(&rproc->lock);
>>   
>> -	if (rproc->state == RPROC_CRASHED || rproc->state == RPROC_OFFLINE) {
>> +	if (rproc->state == RPROC_CRASHED) {
>>   		/* handle only the first crash detected */
>>   		mutex_unlock(&rproc->lock);
>>   		return;
>>   	}
> 
> Please add a newline here.
> 
Will be addressed in new patchset. Thx.
>> +	if (rproc->state == RPROC_OFFLINE) {
>> +		/* no need to recover if remote processor is offline */
>> +		mutex_unlock(&rproc->lock);
>> +		goto out;
>> +	}
>>   
>>   	rproc->state = RPROC_CRASHED;
>>   	dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
>> @@ -1877,6 +1882,7 @@ static void rproc_crash_handler_work(struct work_struct *work)
>>   	if (!rproc->recovery_disabled)
>>   		rproc_trigger_recovery(rproc);
>>   
>> +out:
>>   	pm_relax(rproc->dev.parent);
>>   }
>>   
>> -- 
>> 2.17.1
>>


-- 
Thx and BRs,
Aiqun(Maria) Yu
