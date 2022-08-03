Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4655893FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Aug 2022 23:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238465AbiHCVQE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Aug 2022 17:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236629AbiHCVQE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Aug 2022 17:16:04 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4422A6548;
        Wed,  3 Aug 2022 14:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659561363; x=1691097363;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QEg274CopOh4UZ8xEC8bWP521j4gO/3PAACQVXVq1nc=;
  b=zPq9ZWpeYNPaVhPGFNnnwVWW/O/rqNBm5k9esNUSk7Bynm0rMPc67mGH
   I61FUUfijtZKk0fw1CCCpZ/IERtC0+CZkM83gF4oCokYlHVOLRxQ9me6U
   F8NYdw2Bsy1aySXRkfj7VzOxrXUVmVVxQ/YqBdPrypx5N2zf+DW8wKn42
   I=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 03 Aug 2022 14:16:03 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 14:16:03 -0700
Received: from [10.134.65.5] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 3 Aug 2022
 14:16:02 -0700
Message-ID: <312bf49c-e039-3ad2-293b-ae8362e34830@quicinc.com>
Date:   Wed, 3 Aug 2022 14:16:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 04/11] gunyah: Common types and error codes for Gunyah
 hypercalls
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
 <20220801211240.597859-5-quic_eberman@quicinc.com>
 <c786ed2a-e22a-5ae4-5b5b-0c0c2815cc57@linaro.org>
From:   Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <c786ed2a-e22a-5ae4-5b5b-0c0c2815cc57@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/2/2022 12:51 AM, Dmitry Baryshkov wrote:
> On 02/08/2022 00:12, Elliot Berman wrote:
>> Add architecture-independent standard error codes, types, and macros for
>> Gunyah hypercalls.
>>
>> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
>> ---
>>   MAINTAINERS            |  1 +
>>   include/linux/gunyah.h | 75 ++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 76 insertions(+)
>>   create mode 100644 include/linux/gunyah.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 02f97ac90cdf..2e4f1d9ed47b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8744,6 +8744,7 @@ S:    Maintained
>>   F:    Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
>>   F:    Documentation/virt/gunyah/
>>   F:    arch/arm64/include/asm/gunyah.h
>> +F:    include/linux/gunyah.h
>>   HABANALABS PCI DRIVER
>>   M:    Oded Gabbay <ogabbay@kernel.org>
>> diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
>> new file mode 100644
>> index 000000000000..69931a0f5736
>> --- /dev/null
>> +++ b/include/linux/gunyah.h
>> @@ -0,0 +1,75 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +
>> +#ifndef _GUNYAH_H
>> +#define _GUNYAH_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/errno.h>
>> +#include <asm/gunyah.h>
>> +
>> +typedef u64 gh_capid_t;
> 
> I think there was a rule on typedefs? Maybe I'm mistaken, couldn't find 
> one. Why do you need it in the first place? Just use u64. Or 'enum 
> gh_capid'.
> 

The rules are in Documentation/process/coding-style.rst. gh_capid_it is 
totally opaque to Linux, but I will switch to use u64 throughout.

>> +
>> +/* Common Gunyah macros */
>> +#define GH_CAPID_INVAL    U64_MAX
>> +
> 
> 
> 
