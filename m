Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18A6D643ABB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 02:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbiLFB2q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 20:28:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiLFB2p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 20:28:45 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674441DDEC;
        Mon,  5 Dec 2022 17:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1670290121; x=1701826121;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qtxc0v1Wd2zIG28tqpue8NeB/pK1RLCX3WCJKXNy2zo=;
  b=rZ/HH1SJ1rAOHe6GZwNfgO6ZhFpyM2vXSqtkH8dU7jklpHmJb8CkzJrT
   Yb5GV7yoh6iPye1WAAid5/opc4NXAl9awAd1hyLp6Sk6BCrUxBbC0qK5C
   i9ap4T6XC/mJmD7LufhyLnrKJ44ghyqAtjqLoaPR9klNbY3/k2YlijCIH
   A=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 05 Dec 2022 17:28:41 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 17:28:27 -0800
Received: from [10.239.133.73] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 5 Dec 2022
 17:28:26 -0800
Message-ID: <780b40df-809a-67bf-0b0b-f56df70e6343@quicinc.com>
Date:   Tue, 6 Dec 2022 09:28:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 2/2] remoteproc: core: change to ordered workqueue for
 crash handler
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <arnaud.pouliquen@foss.st.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <quic_clew@quicinc.com>
References: <20221202094532.2925-1-quic_aiquny@quicinc.com>
 <20221202094532.2925-3-quic_aiquny@quicinc.com>
 <20221202173403.GD165812@p14s>
From:   "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
In-Reply-To: <20221202173403.GD165812@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/3/2022 1:34 AM, Mathieu Poirier wrote:
> On Fri, Dec 02, 2022 at 05:45:32PM +0800, Maria Yu wrote:
>> Only the first detected crash needed to be handled, so change
>> to ordered workqueue to avoid unnecessary multi active work at
>> the same time. This will reduce the pm_relax unnecessary concurrency.
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
> 
> There is an indentation issue with the second line and this patch doesn't
> compile:
> 
My Clang 14.0.7 didn't have such kind of compilation error.
what's your CC version pls? Maybe I can have a try to reproduce.

Anyway, I will double confirm if there is any difference with current 
patchset with my compile tested patchset as well.

>    CC      drivers/remoteproc/imx_dsp_rproc.o
>    AR      drivers/hwspinlock/built-in.a
> In file included from /home/mpoirier/work/remoteproc/kernel-review/include/linux/rhashtable-types.h:15,
>                   from /home/mpoirier/work/remoteproc/kernel-review/include/linux/ipc.h:7,
>                   from /home/mpoirier/work/remoteproc/kernel-review/include/uapi/linux/sem.h:5,
>                   from /home/mpoirier/work/remoteproc/kernel-review/include/linux/sem.h:5,
>                   from /home/mpoirier/work/remoteproc/kernel-review/include/linux/sched.h:15,
>                   from /home/mpoirier/work/remoteproc/kernel-review/include/linux/delay.h:23,
>                   from /home/mpoirier/work/remoteproc/kernel-review/drivers/remoteproc/remoteproc_core.c:19:
> /home/mpoirier/work/remoteproc/kernel-review/drivers/remoteproc/remoteproc_core.c: In function ‘remoteproc_init’:
> /home/mpoirier/work/remoteproc/kernel-review/drivers/remoteproc/remoteproc_core.c:2738:46: warning: too many arguments for format [-Wformat-extra-args]
>   2738 |  rproc_recovery_wq = alloc_ordered_workqueue("rproc_recovery_wq",
>        |                                              ^~~~~~~~~~~~~~~~~~~
> /home/mpoirier/work/remoteproc/kernel-review/include/linux/workqueue.h:419:18: note: in definition of macro ‘alloc_ordered_workqueue’
>    419 |  alloc_workqueue(fmt, WQ_UNBOUND | __WQ_ORDERED |  \
>        |                  ^~~
> 
> Last but not least, please use the get_maintainer.pl script to make sure the
> right people are CC'ed on your patchsets.get_maintainer.pl will be re-run for next patchset uploading.
Thank you for reminder!
> 
> Thanks,
> Mathieu
> 
>>   	if (!rproc_recovery_wq) {
>>   		pr_err("remoteproc: creation of rproc_recovery_wq failed\n");
>>   		return -ENOMEM;
>> -- 
>> 2.17.1
>>


-- 
Thx and BRs,
Aiqun(Maria) Yu
