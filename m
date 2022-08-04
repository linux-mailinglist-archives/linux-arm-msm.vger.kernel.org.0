Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 651FC58A2DD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Aug 2022 23:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232163AbiHDVtB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Aug 2022 17:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiHDVtB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Aug 2022 17:49:01 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C0315FE0;
        Thu,  4 Aug 2022 14:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659649740; x=1691185740;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J/3brDRmssbtuPOPqEk5mTfaCo1M13+DdM0SNU2zs1s=;
  b=aUlbfWbwiynrC6KSlWQ9V+DJCpEIyxUBGzZIxKnayBMEk1TKS0d3GyxB
   /pxRNjaD8W2PMqEt3ggfbe89CMiIZL382ylxVoMJPNjmylsbCOZC+Z1Gv
   4DgvdL/abmsN7RlWWdPlJaoz5VS6/kpQ0RM/ZagUNghZ6L/ijHq7JuvgY
   M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 04 Aug 2022 14:49:00 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 14:48:59 -0700
Received: from [10.110.78.233] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 4 Aug 2022
 14:48:58 -0700
Message-ID: <3dd4b206-8771-972b-7f4d-4935c5fbea3e@quicinc.com>
Date:   Thu, 4 Aug 2022 14:48:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 00/11] Drivers for gunyah hypervisor
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Srivatsa Vaddagiri" <quic_svaddagi@quicinc.com>,
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
 <YuuC0NISKFVIhUD1@debian.me>
From:   Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <YuuC0NISKFVIhUD1@debian.me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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



On 8/4/2022 1:26 AM, Bagas Sanjaya wrote:
> On Mon, Aug 01, 2022 at 02:12:29PM -0700, Elliot Berman wrote:
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
>>          Primary VM           Secondary VMs
>>       +-----+ +-----+  | +-----+ +-----+ +-----+
>>       |     | |     |  | |     | |     | |     |
>>   EL0 | APP | | APP |  | | APP | | APP | | APP |
>>       |     | |     |  | |     | |     | |     |
>>       +-----+ +-----+  | +-----+ +-----+ +-----+
>>   ---------------------|-------------------------
>>       +--------------+ | +----------------------+
>>       |              | | |                      |
>>   EL1 | Linux Kernel | | |Linux kernel/Other OS |   ...
>>       |              | | |                      |
>>       +--------------+ | +----------------------+
>>   --------hvc/smc------|------hvc/smc------------
>>       +----------------------------------------+
>>       |                                        |
>>   EL2 |            Gunyah Hypervisor           |
>>       |                                        |
>>       +----------------------------------------+
>>
>> Gunyah provides these following features.
>>
>> - Threads and Scheduling: The scheduler schedules virtual CPUs (VCPUs) on
>> physical CPUs and enables time-sharing of the CPUs.
>> - Memory Management: Gunyah tracks memory ownership and use of all memory
>> under its control. Memory partitioning between VMs is a fundamental
>> security feature.
>> - Interrupt Virtualization: All interrupts are handled in the hypervisor
>> and routed to the assigned VM.
>> - Inter-VM Communication: There are several different mechanisms provided
>> for communicating between VMs.
>> - Device Virtualization: Para-virtualization of devices is supported using
>> inter-VM communication. Low level system features and devices such as
>> interrupt controllers are supported with emulation where required.
>>
> 
> Hi,
> 
> I can't apply this series on top of mainline or linux-next. On what tree
> (and what commit) this series is based on? I'd like to do htmldocs test.
> 

The series should apply cleanly on commit 4a57a8400075 ("vf/remap: 
return the amount of bytes actually deduplicated") from Linus's tree.

> Thanks.
> 
