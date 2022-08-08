Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 947F358D084
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Aug 2022 01:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231698AbiHHXif (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Aug 2022 19:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbiHHXie (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Aug 2022 19:38:34 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD09186EF;
        Mon,  8 Aug 2022 16:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1660001913; x=1691537913;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MRQYQ5qm0My1GulFFcuKwexjA94B/X+aTj0mHtEL70s=;
  b=NUz6j95RxkZPls8lxz8vHyV5o7UPZ9lq+Apik1kYAMLALSRfZBSJS3Sb
   k1sw3XS2O1f3GU4nQZn7Vc65XojqUGDVwgASX4xxBaxCVn8t7Ex8KKRLn
   6dwWPYxs6b/7McNC5kc1acIHltJB7b7kadcVX7F0trzDJMGYXnVLwBaR5
   w=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Aug 2022 16:38:32 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2022 16:38:32 -0700
Received: from [10.134.65.5] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 8 Aug 2022
 16:38:31 -0700
Message-ID: <62073cb8-0211-3b49-11cb-aceea6df0845@quicinc.com>
Date:   Mon, 8 Aug 2022 16:38:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 00/11] Drivers for gunyah hypervisor
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
 <50230652-c1ae-4ce2-907c-9bdc6b827f8e@linaro.org>
From:   Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <50230652-c1ae-4ce2-907c-9bdc6b827f8e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/2/2022 2:24 AM, Dmitry Baryshkov wrote:
> On 02/08/2022 00:12, Elliot Berman wrote:
>> Gunyah is a Type-1 hypervisor independent of any
>> high-level OS kernel, and runs in a higher CPU privilege level. It does
>> not depend on any lower-privileged OS kernel/code for its core
>> functionality. This increases its security and can support a much smaller
>> trusted computing base than a Type-2 hypervisor.
>>
>> Gunyah is an open source hypervisor. The source repo is available at
>> https://github.com/quic/gunyah-hypervisor.
>>
>> The diagram below shows the architecture.
>>
>> ::
>>
>>          Primary VM           Secondary VMs
> 
> Is there any significant difference between Primary VM and other VMs?
> 

The primary VM is started by RM. Secondary VMs are not otherwise special 
except that they are (usually) launched by the primary VM.

>>       +-----+ +-----+  | +-----+ +-----+ +-----+
>>       |     | |     |  | |     | |     | |     |
>>   EL0 | APP | | APP |  | | APP | | APP | | APP |
>>       |     | |     |  | |     | |     | |     |
>>       +-----+ +-----+  | +-----+ +-----+ +-----+
>>   ---------------------|-------------------------
>>       +--------------+ | +----------------------+
>>       |              | | |                      |
>>   EL1 | Linux Kernel | | |Linux kernel/Other OS |   ...
>>       |              | | |                      |
>>       +--------------+ | +----------------------+
>>   --------hvc/smc------|------hvc/smc------------
>>       +----------------------------------------+
>>       |                                        |
>>   EL2 |            Gunyah Hypervisor           |
>>       |                                        |
>>       +----------------------------------------+
>>
>> Gunyah provides these following features.
>>
>> - Threads and Scheduling: The scheduler schedules virtual CPUs (VCPUs) on
>> physical CPUs and enables time-sharing of the CPUs.
> 
> Is the scheduling provided behind the back of the OS or does it require 
> cooperation?
> 

Gunyah supports both of these scheduling models. For instance, 
scheduling of resource manager and the primary VM are done by Gunyah 
itself. A VM that the primary VM launches could be scheduled by the 
primary VM itself (by making a hypercall requesting a vCPU be switched 
in), or by Gunyah itself. We've been calling the former "proxy 
scheduling" and this would be the default behavior of VMs.

>> - Memory Management: Gunyah tracks memory ownership and use of all memory
>> under its control. Memory partitioning between VMs is a fundamental
>> security feature.
>> - Interrupt Virtualization: All interrupts are handled in the hypervisor
>> and routed to the assigned VM.
>> - Inter-VM Communication: There are several different mechanisms provided
>> for communicating between VMs.
>> - Device Virtualization: Para-virtualization of devices is supported 
>> using
>> inter-VM communication. Low level system features and devices such as
>> interrupt controllers are supported with emulation where required.
> 
> After reviewing some of the patches from the series, I'd like to 
> understand, what does it provide (and can be provided) to the VMs.
> > I'd like to understand it first, before going deep into the API issues.
> 
> 1) The hypervisor provides message queues, doorbells and vCPUs
> 
> Each of resources has it's own capability ID.
> Why is it called capability? Is it just a misname for the resource ID, 
> or has it any other meaning behind? If it is a capability, who is 
> capable of what?
> 

We are following Gunyah's naming convention here. For each virtual 
machine, Gunyah maintains a table of resources which can be accessed by 
that VM. An entry in this table is called a "capability" and VMs can 
only access resources via this capability table. Hence, they get called 
"capability IDs" and not "resource IDs". A VM can have multiple 
capability IDs mapping to the same resource. If 2 VMs have access to the 
same resource, they may not be using the same capability ID to access 
that resource since the tables are independent per VM.

> At this moment you create allocate two message queues with fixed IDs for 
> communication with resource manager. Then you use these message queues 
> to organize a console and a pack of tty devices.
> 
> What other kinds of services does RM provide to the guest OS?
> Do you expect any other drivers to be calling into the RM?
> 

I want to establish the framework to build a VM loader for Gunyah. 
Internally, we are working with a prototype of a "generic VM loader" 
which works with crosvm [1]. In this generic VM loader, memory sharing, 
memory lending, cooperative scheduling, and raising virtual interrupts 
are all supported. Emulating virtio devices in userspace is supported in 
a way which feels very similar to KVM. Our internal VM loader uses an 
IOCTL interface which is similar to KVM's.

> What is the usecase for the doorbells? Who provides doorbells? >

The basic use case I'll start with is for userspace to create an IRQFD. 
Userspace can use the IRQFD to raise a doorbell (interrupt) on the other VM.

> You mentioned that the RM generates DT overlays. What kind of 
> information goes to the overlay?
> 

The info is described in 
Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml.

> My current impression of this series is that you have misused the 
> concept of devices. Rather than exporting MSGQs and BELLs as 
> gunyah_devices and then using them from other drivers, I'd suggest 
> turning them into resources provided by the gunyah driver core. I 
> mentioned using the mailbox API for this. Another subsystem that might 
> ring the bell for you is the remoteproc, especially the rproc_subdev. >

I had an offline discussion with Bjorn and he agreed with this approach 
here. He suggested avoiding using the device bus model and will go with 
smaller approach in v3.

> I might be completely wrong about this, but if my in-mind picture of 
> Gunyah is correct, I'd have implemented the gunyah core subsytem as 
> mailbox provider, RM as a separate platform driver consuming these 
> mailboxes and in turn being a remoteproc driver, and consoles as 
> remoteproc subdevices. >

The mailbox framework can only fit with message queues and not doorbells 
or vCPUs. The mailbox framework also relies on the mailbox being defined 
in the devicetree. RM is an exceptional case in that it is described in 
the devicetree. Message queues for other VMs would be dynamically 
created at runtime as/when that VM is created. Thus, the client of the 
message queue would need to "own" both the controller and client ends of 
the mailbox.

RM is not loaded or managed by Linux, so I don't think remoteproc 
framework provides us any code re-use except for the subdevices code. 
Remoteproc is much larger framework than just the subdevices code, so I 
don't think it fits well overall.

> I can assume that at some point you would like to use Gunyah to boot 
> secondary VMs from the primary VM by calling into RM, etc.
> Most probably at this moment a VM would be allocated other bells, 
> message queues, etc. If this assumption is correct, them the VM can 
> become a separate device (remoteproc?) in the Linux device tree.
> 
> I might be wrong in any of the assumptions above. Please feel free to 
> correct me. We can then think about a better API for your usecase.
> 

We don't want to limit VM configuration to the devicetree as this limits 
the number and kinds of VMs that can be launched to build time. I'm not 
sure if you might have seen an early presentation of Gunyah at Linaro? 
In the early days of Gunyah, we had static configuration of VMs and many 
properties of the VMs were described in the devicetree. We are moving 
away from static configuration of VMs as much as possible.

[1]: https://chromium.googlesource.com/chromiumos/platform/crosvm

