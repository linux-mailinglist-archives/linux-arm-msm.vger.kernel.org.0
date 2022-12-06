Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78A62643A81
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 02:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbiLFBGB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 20:06:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232054AbiLFBGA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 20:06:00 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFD69599;
        Mon,  5 Dec 2022 17:05:59 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B60u75Y020779;
        Tue, 6 Dec 2022 01:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nY7oQuPwCtY4zJVuT1uqGblZFok7xNZLW1dmjTg7UCw=;
 b=APBxEnU0OxybGxua5Fi/VNTrCrUqzOpE8Gw6tAxIK0SSgJh7kBoTw6vd5VzCfkNn+ZLm
 VTT04JVcDW7mojeqvI7lg1MjIMPCfv/Nwsp79cfrnShZjiaQWUeai50Dt9ZfNNZwVzf+
 uktJOzm9hIFuqJiiL9XNvE4s9DMA5k/RCWLe5+R6ILSv7PjFUM84GTEvn9dxMiO3o+Hs
 Y9YzXK9bvONVpnGF2WBZFSsnnFbxRGq9ouktR+U668UpqYsglbZqzpIaokRVAzqx5gB9
 adO+DaQnWcPxYUIEFJKwmGWZN7DxUfZuen7SA6Ot46l9p3+jq5PPjlBg53KNTo7KRNQi 4g== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7x265cmt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Dec 2022 01:05:53 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B615qUA018957
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 6 Dec 2022 01:05:52 GMT
Received: from [10.239.133.73] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 5 Dec 2022
 17:05:50 -0800
Message-ID: <6c5c6660-976d-c9f5-2b26-1d6dfe48a591@quicinc.com>
Date:   Tue, 6 Dec 2022 09:05:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 1/2] remoteproc: core: do pm relax when in
 RPROC_OFFLINE
To:     Bjorn Andersson <andersson@kernel.org>
CC:     <mathieu.poirier@linaro.org>, <arnaud.pouliquen@foss.st.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <quic_clew@quicinc.com>
References: <20221202094532.2925-1-quic_aiquny@quicinc.com>
 <20221202094532.2925-2-quic_aiquny@quicinc.com>
 <20221202180919.ffxzaflxlc4af6hu@builder.lan>
From:   "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
In-Reply-To: <20221202180919.ffxzaflxlc4af6hu@builder.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OY_KwcPHn6qBFnZBR--vvTTIX-ac1APv
X-Proofpoint-ORIG-GUID: OY_KwcPHn6qBFnZBR--vvTTIX-ac1APv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1011 impostorscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060003
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/3/2022 2:09 AM, Bjorn Andersson wrote:
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
> 
> It's not obvious to me that you're trying to say here is "make sure that
> pm_relax() happens even when the remoteproc is stopped before the crash
> handler work is scheduled".
> 
Will be addressed in new patchset. Thx.
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
>> +	if (rproc->state == RPROC_OFFLINE) {
>> +		/* no need to recover if remote processor is offline */
> 
> I don't think it's correct to say "no need", I think if the user stopped
> the remoteproc before the recovery was scheduled recovery would undo
> that stop...
> 
> So perhaps something like:
> 
> "Don't recover if the remote processor was stopped"
> 
Will be addressed in new patchset. Thx.
> Regards,
> Bjorn
> 
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
