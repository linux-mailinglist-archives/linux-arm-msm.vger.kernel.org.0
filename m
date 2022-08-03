Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8E805893FD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Aug 2022 23:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236629AbiHCVQJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Aug 2022 17:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238684AbiHCVQI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Aug 2022 17:16:08 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DACE205F0;
        Wed,  3 Aug 2022 14:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659561367; x=1691097367;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=L/w39cfmWhGsov1KGqnJepfBKH9f2u+IHPg9Lhj37Ts=;
  b=CrvTX1IRj0U17hpeOUXE+lWvKwWXk7LZtnfmgx8IBa+2t6HK7LEQ3co+
   ntnddIDCDrgJ+wOUte9NlTW+deWanN0dL2/fnS8hPyBi12tY7BG+x2X1N
   y2XNwDfFi5w+XwlbAdDHjlM3SB0PxNx8HqDkbIB1n0liD0OH2N/wFoViH
   g=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Aug 2022 14:16:07 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 14:16:07 -0700
Received: from [10.134.65.5] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 3 Aug 2022
 14:16:06 -0700
Message-ID: <848c50eb-92f1-2731-79bf-10a531803f8e@quicinc.com>
Date:   Wed, 3 Aug 2022 14:16:06 -0700
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
 <24a2d70e-0ed1-5f7d-9c9c-261afac73989@linaro.org>
From:   Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <24a2d70e-0ed1-5f7d-9c9c-261afac73989@linaro.org>
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



On 8/2/2022 12:33 AM, Dmitry Baryshkov wrote:
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
>> +
>> +/* Common Gunyah macros */
>> +#define GH_CAPID_INVAL    U64_MAX
>> +
>> +#define GH_ERROR_OK            0
> 
> Is there any semantic difference between GH_ERROR_foo < 0 and 
> GH_ERROR_bar > 0 ?
> 

GH_ERROR_foo < 0 comes from Gunyah's plumbing for handling hypercalls. 
GH_ERROR_bar > 0 comes from the hypercall itself.

>> +#define GH_ERROR_UNIMPLEMENTED        -1
>> +#define GH_ERROR_RETRY            -2
>> +
>> +#define GH_ERROR_ARG_INVAL        1
>> +#define GH_ERROR_ARG_SIZE        2
>> +#define GH_ERROR_ARG_ALIGN        3
>> +
>> +#define GH_ERROR_NOMEM            10
>> +
>> +#define GH_ERROR_ADDR_OVFL        20
>> +#define GH_ERROR_ADDR_UNFL        21
>> +#define GH_ERROR_ADDR_INVAL        22
>> +
>> +#define GH_ERROR_DENIED            30
>> +#define GH_ERROR_BUSY            31
>> +#define GH_ERROR_IDLE            32
>> +
>> +#define GH_ERROR_IRQ_BOUND        40
>> +#define GH_ERROR_IRQ_UNBOUND        41
>> +
>> +#define GH_ERROR_CSPACE_CAP_NULL    50
>> +#define GH_ERROR_CSPACE_CAP_REVOKED    51
>> +#define GH_ERROR_CSPACE_WRONG_OBJ_TYPE    52
>> +#define GH_ERROR_CSPACE_INSUF_RIGHTS    53
>> +#define GH_ERROR_CSPACE_FULL        54
>> +
>> +#define GH_ERROR_MSGQUEUE_EMPTY        60
>> +#define GH_ERROR_MSGQUEUE_FULL        61
>> +
>> +static inline int gh_remap_error(int gh_error)
>> +{
>> +    switch (gh_error) {
>> +    case GH_ERROR_OK:
>> +        return 0;
>> +    case GH_ERROR_NOMEM:
>> +        return -ENOMEM;
>> +    case GH_ERROR_DENIED:
>> +    case GH_ERROR_CSPACE_CAP_NULL:
>> +    case GH_ERROR_CSPACE_CAP_REVOKED:
>> +    case GH_ERROR_CSPACE_WRONG_OBJ_TYPE:
>> +    case GH_ERROR_CSPACE_INSUF_RIGHTS:
>> +    case GH_ERROR_CSPACE_FULL:
>> +        return -EACCES;
>> +    case GH_ERROR_BUSY:
>> +    case GH_ERROR_IDLE:
>> +        return -EBUSY;
>> +    case GH_ERROR_IRQ_BOUND:
>> +    case GH_ERROR_IRQ_UNBOUND:
>> +    case GH_ERROR_MSGQUEUE_FULL:
>> +    case GH_ERROR_MSGQUEUE_EMPTY:
>> +        return -EPERM;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +}
>> +
>> +#endif
> 
> 
