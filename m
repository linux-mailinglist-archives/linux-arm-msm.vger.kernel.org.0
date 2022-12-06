Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F4009643AE5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 02:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbiLFBmq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 20:42:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233105AbiLFBmp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 20:42:45 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F07964E2;
        Mon,  5 Dec 2022 17:42:44 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B60or5J021148;
        Tue, 6 Dec 2022 01:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=e+aRnOtjVvPtaQ72X0SvV7C2m1fYuMgZ0Obx45VQKl0=;
 b=gkYmo+402IXCOQg/zyCYpHixcxe8NC/JJYYhmmL2bLqIDWB/ldaJoPowgUnVqSX34MMR
 fLkete/7PI6FVGpPnhfUWhBFKzKuI07smLetAWZgdJdZvyGLyT5h0BkRmCJqQ9HKqcc4
 dLMZ78AkPD/U9I4A1WeeOemiEHDc0AMCFHzSoy4pJ4HZya4Mo/aCFoWCzW0mN7Pv9kCB
 7p//KE1WLfJSyAmo3nrvQzhHQi2vFET3Qs8s7xsBQgH3FZcqzEXzf1svoMl2kDQu5h7X
 PRCu3ztO5u/84Zqan4xpYv4KvmL4U3J8gqLU0G7CmU0MOsNRg6nWjsbKyJt7/Lur0vvy Hw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7wff5h7n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Dec 2022 01:42:34 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B61gXqa030370
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 6 Dec 2022 01:42:33 GMT
Received: from [10.239.133.73] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 5 Dec 2022
 17:42:31 -0800
Message-ID: <f8d002ee-c501-4e97-f599-ce1985da687e@quicinc.com>
Date:   Tue, 6 Dec 2022 09:42:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 2/2] remoteproc: core: change to ordered workqueue for
 crash handler
To:     Bjorn Andersson <andersson@kernel.org>
CC:     <mathieu.poirier@linaro.org>, <arnaud.pouliquen@foss.st.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <quic_clew@quicinc.com>
References: <20221202094532.2925-1-quic_aiquny@quicinc.com>
 <20221202094532.2925-3-quic_aiquny@quicinc.com>
 <20221202181602.sg2pbgl5br2hw2rh@builder.lan>
From:   "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
In-Reply-To: <20221202181602.sg2pbgl5br2hw2rh@builder.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qEokKoUVElNPI1mVo7nlyeYr-HetwUxm
X-Proofpoint-ORIG-GUID: qEokKoUVElNPI1mVo7nlyeYr-HetwUxm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060008
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/3/2022 2:16 AM, Bjorn Andersson wrote:
> On Fri, Dec 02, 2022 at 05:45:32PM +0800, Maria Yu wrote:
>> Only the first detected crash needed to be handled, so change
>> to ordered workqueue to avoid unnecessary multi active work at
>> the same time.
> 
> In cab8300b5621 ("remoteproc: Use unbounded workqueue for recovery
> work") Mukesh specifically said that it was required that multiple
> remoteproc instances should be allowed to recover concurrently.
> 
> Is this no longer the case? Or am I perhaps misunderstanding the
> nuances of the different work queue models?
> 
>> This will reduce the pm_relax unnecessary concurrency.
> 
> I'm not sure I understand this sentence, unless I remove the word
> "pm_relax", was it added by mistake?
> 
> 
> If so, is the support for concurrent recovery really unnecessary?
> 
> I know we have cases where we spend time in the recovery process just
> waiting for things to happen, so allowing recovery to run concurrent
> between instances sounds like a good idea.
> 
Agree with you.
Allowing recovery to run concurrent for different subsystem still seems 
a good idea currently. Let's drop this change.
> Regards,
> Bjorn
> 
>>
>> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index c2d0af048c69..4b973eea10bb 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -2728,8 +2728,8 @@ static void __exit rproc_exit_panic(void)
>>   
>>   static int __init remoteproc_init(void)
>>   {
>> -	rproc_recovery_wq = alloc_workqueue("rproc_recovery_wq",
>> -						WQ_UNBOUND | WQ_FREEZABLE, 0);
>> +	rproc_recovery_wq = alloc_ordered_workqueue("rproc_recovery_wq",
>> +						WQ_FREEZABLE, 0);
>>   	if (!rproc_recovery_wq) {
>>   		pr_err("remoteproc: creation of rproc_recovery_wq failed\n");
>>   		return -ENOMEM;
>> -- 
>> 2.17.1
>>


-- 
Thx and BRs,
Aiqun(Maria) Yu
