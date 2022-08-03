Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB0E0589400
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Aug 2022 23:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238192AbiHCVTJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Aug 2022 17:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236622AbiHCVTI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Aug 2022 17:19:08 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0352020F44;
        Wed,  3 Aug 2022 14:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659561548; x=1691097548;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FYATxmG4+2tHBYdXXi8Z00HPGFZQScUMILv1Li5GzKg=;
  b=XUdGeHkK65KZtwvqeCpYqrRBbvlHDBDG3i0H8++/4yWc/B/XGdE+SI0Q
   PZcO+XeKiUD6WKnMHDT1Z4WVW+yzYCGb/lS3H/dz5L071m0Q/ldwqi0XO
   h1WdA3aHWi3b0KXj98UmbDWnUbDPYZfWUvFA3oflsGUq2spmXMhHTm840
   E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 03 Aug 2022 14:19:07 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 14:19:07 -0700
Received: from [10.134.65.5] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 3 Aug 2022
 14:19:07 -0700
Message-ID: <8fb71bca-4568-f452-807a-70676245143f@quicinc.com>
Date:   Wed, 3 Aug 2022 14:19:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 09/11] gunyah: rsc_mgr: Add auxiliary devices for
 console
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Marc Zyngier" <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <20220801211240.597859-10-quic_eberman@quicinc.com>
 <869e9d41-7a21-c01a-ccbd-53bfb236938c@linaro.org>
From:   Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <869e9d41-7a21-c01a-ccbd-53bfb236938c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/2/2022 1:38 AM, Dmitry Baryshkov wrote:
> On 02/08/2022 00:12, Elliot Berman wrote:
>> Gunyah resource manager exposes a concrete functionalities which
>> complicate a single resource manager driver. Use auxiliary bus
>> to help split high level functions for the resource manager and keep the
>> primary resource manager driver focused on the RPC with RM itself.
>> Delegate Resource Manager's console functionality to the auxiliary bus.
>>
>> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
>> ---
>>   drivers/virt/gunyah/rsc_mgr.c | 61 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 60 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/virt/gunyah/rsc_mgr.c 
>> b/drivers/virt/gunyah/rsc_mgr.c
>> index b8268ee02fab..44b22cef7d44 100644
>> --- a/drivers/virt/gunyah/rsc_mgr.c
>> +++ b/drivers/virt/gunyah/rsc_mgr.c
>> @@ -91,6 +91,11 @@ struct gh_rm_notif_complete {
>>       struct work_struct work;
>>   };
>> +struct gh_rsc_mgr_adev {
>> +    struct auxiliary_device adev;
>> +    struct list_head list;
>> +};
>> +
>>   struct gh_rsc_mgr {
>>       struct task_struct *recv_task;
>>       struct gunyah_device *msgq_tx, *msgq_rx;
>> @@ -99,6 +104,13 @@ struct gh_rsc_mgr {
>>       struct mutex call_idr_lock;
>>       struct mutex send_lock;
>> +
>> +    struct list_head adevs;
>> +};
>> +
>> +/* List of auxiliary devices which resource manager creates */
>> +static const char * const adev_names[] = {
>> +    "console",
>>   };
> 
> Which other auxilliary devices do you expect at this moment?
> 

Only foresee a VM loader auxiliary device.

>>   static struct gh_rsc_mgr *__rsc_mgr;
>> @@ -516,6 +528,14 @@ int gh_rm_unregister_notifier(struct 
>> notifier_block *nb)
>>   }
>>   EXPORT_SYMBOL_GPL(gh_rm_unregister_notifier);
>> +static void gh_rm_adev_release(struct device *dev)
>> +{
>> +    struct gh_rsc_mgr_adev *rm_adev = container_of(dev, struct 
>> gh_rsc_mgr_adev, adev.dev);
>> +
>> +    list_del(&rm_adev->list);
> 
> is there a race for the rsc_mgr->list? Can multiple release functions be 
> called in parallel?
> Rather than having a list, it would be easier to have an array of 
> devices. Less race conditions, simpler code.
> 
> Or just add gh_rsc_msg->console_adev and use it directly without any 
> additional bells and whistles.
> 

I like this approach, it is much simpler.

>> +    kfree(rm_adev);
>> +}
>> +
>>   static struct gunyah_device *gh_msgq_platform_probe_direction(struct 
>> platform_device *pdev,
>>                   u8 gh_type, int idx)
>>   {
