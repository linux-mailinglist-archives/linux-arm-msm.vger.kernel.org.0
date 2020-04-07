Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D084C1A0EB6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 15:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728768AbgDGN4w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 09:56:52 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:37187 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728482AbgDGN4w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 09:56:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586267811; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TE4hZov0rkOV4uqiyW/RcPjnKoFTB49aSNaOcciKWeo=;
 b=Izs1WQddaKwuChtSbq1VQ+Ray1RwpU5TOqjV73Vcrew6LaU2qcqH/oZw2CaDOPgd3gblPLKf
 T94L8z72zSNHcf0zmF8BpSeICsAn8RLaFF3pSnozfCWbJAyvX9Ee2QyRzh4nptlfyibcrD/w
 HDYPCI+np4SbO0VmKy2I1pfVckE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8c869f.7f7ba7233f48-smtp-out-n04;
 Tue, 07 Apr 2020 13:56:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0BCA2C4478C; Tue,  7 Apr 2020 13:56:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B6B7C433F2;
        Tue,  7 Apr 2020 13:56:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 07 Apr 2020 19:26:45 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
        swboyd@chromium.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [RFC PATCH] coresight: dynamic-replicator: Fix handling of
 multiple connections
In-Reply-To: <bb209f80-ac02-6321-dac4-ebf9ee6fa9a0@arm.com>
References: <20200405102819.28460-1-saiprakash.ranjan@codeaurora.org>
 <CAJ9a7VgQzK1XSCvLwuqODwkWfvo=6Wwps7Db+pL5xYDeCuktrg@mail.gmail.com>
 <6c0f45488f8a44bf860759e00fcabd09@codeaurora.org>
 <906d374d-a4d6-f2f2-6845-88b97a5ff7d9@arm.com>
 <39a2b3fff165a108fa59d72b630b5f14@codeaurora.org>
 <bb209f80-ac02-6321-dac4-ebf9ee6fa9a0@arm.com>
Message-ID: <bd05b31c2391edfff5044f22f2f83edf@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On 2020-04-07 18:38, Suzuki K Poulose wrote:
> On 04/07/2020 12:29 PM, Sai Prakash Ranjan wrote:
>> Hi Suzuki,
>> 
>> Thanks for looking into this issue.
>> 
>> On 2020-04-07 15:54, Suzuki K Poulose wrote:
>>> On 04/07/2020 10:46 AM, Sai Prakash Ranjan wrote:
>>> 
>>> There seems to be two replicators back to back here. What is 
>>> connected
>>> to the other output of both of them ? Are there any TPIUs ? What 
>>> happens
>>> if you choose a sink on the other end of "swao_replicator" (ETB ?)
>>> 
>> 
>> The other outport of swao replicator is connected to EUD which is a
>> QCOM specific HW which can be used as a sink like USB.
>> And the other outport of other replicator(replicator_out) is connected 
>> to
>> TPIU.
>> 
>>> After boot, what do the idfilter registers read for both the 
>>> replicators ?
>>> 
>> 
>> Added some prints in replicator_probe.
>> 
>>   replicator probe ret=-517 devname=6046000.replicator idfilter0=0x0 
>> idfilter1=0x0
>>   replicator probe ret=0 devname=6b06000.replicator idfilter0=0xff 
>> idfilter1=0xff
>>   replicator probe ret=0 devname=6046000.replicator idfilter0=0xff 
>> idfilter1=0xff
> 
> Curious to see how the idfilterX is set to 0:
> 	 if that is never used.
> 		Or
> 	 if the user doesn't reset it back to 0xff.
> 

For both replicators, the default value seems to be 0x0.

  replicator probe in res ret=0 devname=6046000.replicator idfilter0=0x0 
idfilter1=0x0
  replicator probe ret=-517 devname=6046000.replicator idfilter0=0x0 
idfilter1=0x0
  replicator probe in res ret=0 devname=6b06000.replicator idfilter0=0x0 
idfilter1=0x0
  replicator probe ret=0 devname=6b06000.replicator idfilter0=0xff 
idfilter1=0xff
  replicator probe in res ret=0 devname=6046000.replicator idfilter0=0x0 
idfilter1=0x0
  replicator probe ret=0 devname=6046000.replicator idfilter0=0xff 
idfilter1=0xff

> Does your test ever touch EUD (enable the port for EUD at
> swao-replicator) ? What are the values before you run your test ?
> 
> 

No, we do not use EUD, downstream it is used as dummy sink.
And I just try to select the ETR as the sink and enable ETM0 as the 
trace source.

echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source

Also I see the KASAN warning but that seems like some other issue.

[  526.110401] 
==================================================================
[  526.117988] BUG: KASAN: slab-out-of-bounds in 
funnel_enable+0x54/0x1b0
[  526.124706] Read of size 4 at addr ffffff8135f9549c by task bash/1114
[  526.131324]
[  526.132886] CPU: 3 PID: 1114 Comm: bash Tainted: G S                
5.4.25 #232
[  526.140397] Hardware name: Qualcomm Technologies, Inc. SC7180 IDP 
(DT)
[  526.147113] Call trace:
[  526.149653]  dump_backtrace+0x0/0x188
[  526.153431]  show_stack+0x20/0x2c
[  526.156852]  dump_stack+0xdc/0x144
[  526.160370]  print_address_description+0x3c/0x494
[  526.165211]  __kasan_report+0x144/0x168
[  526.169170]  kasan_report+0x10/0x18
[  526.172769]  check_memory_region+0x1a4/0x1b4
[  526.177164]  __kasan_check_read+0x18/0x24
[  526.181292]  funnel_enable+0x54/0x1b0
[  526.185072]  coresight_enable_path+0x104/0x198
[  526.189649]  coresight_enable+0x118/0x26c
[  526.193778]  enable_source_store+0x64/0xa8
[  526.198007]  dev_attr_store+0x40/0x58
[  526.201788]  sysfs_kf_write+0x4c/0x64
[  526.205567]  kernfs_fop_write+0x16c/0x210
[  526.209700]  __vfs_write+0x54/0x1a8
[  526.213297]  vfs_write+0xe4/0x1a4
[  526.216714]  ksys_write+0x84/0xec
[  526.220131]  __arm64_sys_write+0x20/0x2c
[  526.224179]  el0_svc_common+0xa8/0x160
[  526.228040]  el0_svc_compat_handler+0x2c/0x38
[  526.232533]  el0_svc_compat+0x8/0x10
[  526.236225]
[  526.237782] Allocated by task 280:
[  526.241298]  __kasan_kmalloc+0xf0/0x1ac
[  526.245249]  kasan_kmalloc+0xc/0x14
[  526.248849]  __kmalloc+0x28c/0x3b4
[  526.252361]  coresight_register+0x88/0x250
[  526.256587]  funnel_probe+0x15c/0x228
[  526.260365]  dynamic_funnel_probe+0x20/0x2c
[  526.264679]  amba_probe+0xbc/0x158
[  526.268193]  really_probe+0x144/0x408
[  526.271970]  driver_probe_device+0x70/0x140
[  526.276282]  __device_attach_driver+0x9c/0x110
[  526.280861]  bus_for_each_drv+0x90/0xd8
[  526.284822]  __device_attach+0xb4/0x164
[  526.288772]  device_initial_probe+0x20/0x2c
[  526.293081]  bus_probe_device+0x34/0x94
[  526.297030]  deferred_probe_work_func+0xa4/0x100
[  526.301794]  process_one_work+0x33c/0x640
[  526.305922]  worker_thread+0x2a0/0x470
[  526.309786]  kthread+0x128/0x138
[  526.313119]  ret_from_fork+0x10/0x18
[  526.316810]
[  526.318364] Freed by task 0:
[  526.321344] (stack is not available)
[  526.325024]
[  526.326580] The buggy address belongs to the object at 
ffffff8135f95480
[  526.326580]  which belongs to the cache kmalloc-128 of size 128
[  526.339439] The buggy address is located 28 bytes inside of
[  526.339439]  128-byte region [ffffff8135f95480, ffffff8135f95500)
[  526.351399] The buggy address belongs to the page:
[  526.356342] page:ffffffff04b7e500 refcount:1 mapcount:0 
mapping:ffffff814b00c380 index:0x0 compound_mapcount: 0
[  526.366711] flags: 0x4000000000010200(slab|head)
[  526.371475] raw: 4000000000010200 ffffffff05034008 ffffffff0501eb08 
ffffff814b00c380
[  526.379435] raw: 0000000000000000 0000000000190019 00000001ffffffff 
0000000000000000
[  526.387393] page dumped because: kasan: bad access detected
[  526.393128]
[  526.394681] Memory state around the buggy address:
[  526.399619]  ffffff8135f95380: fc fc fc fc fc fc fc fc fc fc fc fc fc 
fc fc fc
[  526.407046]  ffffff8135f95400: fc fc fc fc fc fc fc fc fc fc fc fc fc 
fc fc fc
[  526.414473] >ffffff8135f95480: 04 fc fc fc fc fc fc fc fc fc fc fc fc 
fc fc fc
[  526.421900]                             ^
[  526.426029]  ffffff8135f95500: fc fc fc fc fc fc fc fc fc fc fc fc fc 
fc fc fc
[  526.433456]  ffffff8135f95580: fc fc fc fc fc fc fc fc fc fc fc fc fc 
fc fc fc
[  526.440883] 
==================================================================

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
