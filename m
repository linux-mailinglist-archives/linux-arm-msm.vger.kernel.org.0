Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13B0B72A14D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 19:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbjFIReL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 13:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbjFIReK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 13:34:10 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83968E4E;
        Fri,  9 Jun 2023 10:34:07 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 359Dj1Td002667;
        Fri, 9 Jun 2023 17:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=y6PSJ/a4efM6fP1I3t21ItHgFrgYNVQ8HnAxTEOR8C0=;
 b=XhIa5+axDvH54JGeH6Mhj9+02iHlW09N6s2TA77PX35JSJP64Jbs1paOBOqvCsrXNzdm
 9d++yp7XcQEib52JZPMBK9HOY5VWUzL44VKXn2K1rDAsdSmH6u5IpW1AmufWrU1kot/k
 k/IH/DV1g/bOfSXpjGb2CGgAmxtLIsds/xqdhLQfjOjM1HGHBmC2bQ6n9abD0adgMniu
 5iWSrRc1TtpOiJpcKXxTh5bCBovLcyfBdnY4XMZUcmrPnmwvsrRCRDmJaVkV0o9TvRBp
 dE+DBcWO4Qn9tjpjpmYFk3rSIRPnUxWu9arKYe+c4iUdoIQtCP4ApYmwJYap3+MnVc3q pQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r3nwet4h9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Jun 2023 17:33:27 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 359HXQLk021351
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 9 Jun 2023 17:33:26 GMT
Received: from [10.134.65.165] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 9 Jun 2023
 10:33:25 -0700
Message-ID: <2f60fc9f-a8b2-fe8c-183a-5ee9b276b02d@quicinc.com>
Date:   Fri, 9 Jun 2023 10:33:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v13 23/24] virt: gunyah: Add ioeventfd
Content-Language: en-US
To:     Alex Elder <elder@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Jonathan Corbet <corbet@lwn.net>
CC:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20230509204801.2824351-1-quic_eberman@quicinc.com>
 <20230509204801.2824351-24-quic_eberman@quicinc.com>
 <85e7c3ae-0991-0ca9-909c-f38773f63894@linaro.org>
From:   Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <85e7c3ae-0991-0ca9-909c-f38773f63894@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ollpdWv-vbhs78Ds3TYrpqiVb4IgVe7L
X-Proofpoint-ORIG-GUID: ollpdWv-vbhs78Ds3TYrpqiVb4IgVe7L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_12,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306090145
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/5/2023 12:50 PM, Alex Elder wrote:
> On 5/9/23 3:48 PM, Elliot Berman wrote:
>> Allow userspace to attach an ioeventfd to an mmio address within the 
>> guest.
>>
>> Co-developed-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
>> Signed-off-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
>> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> 
> Looks good.  One question below.
> 
> Reviewed-by: Alex Elder <elder@linaro.org>
> 

Thanks!

>> ---
>>   Documentation/virt/gunyah/vm-manager.rst |   2 +-
>>   drivers/virt/gunyah/Kconfig              |   9 ++
>>   drivers/virt/gunyah/Makefile             |   1 +
>>   drivers/virt/gunyah/gunyah_ioeventfd.c   | 130 +++++++++++++++++++++++
>>   include/uapi/linux/gunyah.h              |  37 +++++++
>>   5 files changed, 178 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/virt/gunyah/gunyah_ioeventfd.c
>>
>> diff --git a/Documentation/virt/gunyah/vm-manager.rst 
>> b/Documentation/virt/gunyah/vm-manager.rst
>> index c4960948c779..87838c5b5945 100644
>> --- a/Documentation/virt/gunyah/vm-manager.rst
>> +++ b/Documentation/virt/gunyah/vm-manager.rst
>> @@ -115,7 +115,7 @@ the VM *before* the VM starts.
>>   The argument types are documented below:
>>   .. kernel-doc:: include/uapi/linux/gunyah.h
>> -   :identifiers: gh_fn_vcpu_arg gh_fn_irqfd_arg gh_irqfd_flags
>> +   :identifiers: gh_fn_vcpu_arg gh_fn_irqfd_arg gh_irqfd_flags 
>> gh_fn_ioeventfd_arg gh_ioeventfd_flags
>>   Gunyah VCPU API Descriptions
>>   ----------------------------
>> diff --git a/drivers/virt/gunyah/Kconfig b/drivers/virt/gunyah/Kconfig
>> index bc2c46d9df94..63bebc5b9f82 100644
>> --- a/drivers/virt/gunyah/Kconfig
>> +++ b/drivers/virt/gunyah/Kconfig
>> @@ -48,3 +48,12 @@ config GUNYAH_IRQFD
>>         on Gunyah virtual machine.
>>         Say Y/M here if unsure and you want to support Gunyah VMMs.
>> +
>> +config GUNYAH_IOEVENTFD
>> +    tristate "Gunyah ioeventfd interface"
>> +    depends on GUNYAH
>> +    help
>> +      Enable kernel support for creating ioeventfds which can alert 
>> userspace
>> +      when a Gunyah virtual machine accesses a memory address.
>> +
>> +      Say Y/M here if unsure and you want to support Gunyah VMMs.
>> diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
>> index ad212a1cf967..63ca11e74796 100644
>> --- a/drivers/virt/gunyah/Makefile
>> +++ b/drivers/virt/gunyah/Makefile
>> @@ -8,3 +8,4 @@ obj-$(CONFIG_GUNYAH) += gunyah.o
>>   obj-$(CONFIG_GUNYAH_VCPU) += gunyah_vcpu.o
>>   obj-$(CONFIG_GUNYAH_IRQFD) += gunyah_irqfd.o
>> +obj-$(CONFIG_GUNYAH_IOEVENTFD) += gunyah_ioeventfd.o
>> diff --git a/drivers/virt/gunyah/gunyah_ioeventfd.c 
>> b/drivers/virt/gunyah/gunyah_ioeventfd.c
>> new file mode 100644
>> index 000000000000..5b1b9fd9ac3a
>> --- /dev/null
>> +++ b/drivers/virt/gunyah/gunyah_ioeventfd.c
>> @@ -0,0 +1,130 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>> + */
>> +
>> +#include <linux/eventfd.h>
>> +#include <linux/file.h>
>> +#include <linux/fs.h>
>> +#include <linux/gunyah.h>
>> +#include <linux/gunyah_vm_mgr.h>
>> +#include <linux/module.h>
>> +#include <linux/printk.h>
>> +
>> +#include <uapi/linux/gunyah.h>
>> +
>> +struct gh_ioeventfd {
>> +    struct gh_vm_function_instance *f;
>> +    struct gh_vm_io_handler io_handler;
>> +
>> +    struct eventfd_ctx *ctx;
>> +};
>> +
>> +static int gh_write_ioeventfd(struct gh_vm_io_handler *io_dev, u64 
>> addr, u32 len, u64 data)
>> +{
>> +    struct gh_ioeventfd *iofd = container_of(io_dev, struct 
>> gh_ioeventfd, io_handler);
> 
> Does a write of 0 bytes still signal an event?
> 

 From gunyah_ioeventfd perspective, yes. I don't think a write of 0 
bytes is possible, but maybe you are thinking of scenario I'm not?

>> +
>> +    eventfd_signal(iofd->ctx, 1);
>> +    return 0;
>> +}
>> +
>> +static struct gh_vm_io_handler_ops io_ops = {
>> +    .write = gh_write_ioeventfd,
>> +};
>> +
>> +static long gh_ioeventfd_bind(struct gh_vm_function_instance *f)
>> +{
>> +    const struct gh_fn_ioeventfd_arg *args = f->argp;
>> +    struct gh_ioeventfd *iofd;
>> +    struct eventfd_ctx *ctx;
>> +    int ret;
>> +
>> +    if (f->arg_size != sizeof(*args))
>> +        return -EINVAL;
>> +
>> +    /* All other flag bits are reserved for future use */
>> +    if (args->flags & ~GH_IOEVENTFD_FLAGS_DATAMATCH)
>> +        return -EINVAL;
>> +
>> +    /* must be natural-word sized, or 0 to ignore length */
>> +    switch (args->len) {
>> +    case 0:
>> +    case 1:
>> +    case 2:
>> +    case 4:
>> +    case 8:
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    /* check for range overflow */
>> +    if (overflows_type(args->addr + args->len, u64))
>> +        return -EINVAL;
>> +
>> +    /* ioeventfd with no length can't be combined with DATAMATCH */
>> +    if (!args->len && (args->flags & GH_IOEVENTFD_FLAGS_DATAMATCH))
>> +        return -EINVAL;
>> +
>> +    ctx = eventfd_ctx_fdget(args->fd);
>> +    if (IS_ERR(ctx))
>> +        return PTR_ERR(ctx);
>> +
>> +    iofd = kzalloc(sizeof(*iofd), GFP_KERNEL);
>> +    if (!iofd) {
>> +        ret = -ENOMEM;
>> +        goto err_eventfd;
>> +    }
>> +
>> +    f->data = iofd;
>> +    iofd->f = f;
>> +
>> +    iofd->ctx = ctx;
>> +
>> +    if (args->flags & GH_IOEVENTFD_FLAGS_DATAMATCH) {
>> +        iofd->io_handler.datamatch = true;
>> +        iofd->io_handler.len = args->len;
>> +        iofd->io_handler.data = args->datamatch;
>> +    }
>> +    iofd->io_handler.addr = args->addr;
>> +    iofd->io_handler.ops = &io_ops;
>> +
>> +    ret = gh_vm_add_io_handler(f->ghvm, &iofd->io_handler);
>> +    if (ret)
>> +        goto err_io_dev_add;
>> +
>> +    return 0;
>> +
>> +err_io_dev_add:
>> +    kfree(iofd);
>> +err_eventfd:
>> +    eventfd_ctx_put(ctx);
>> +    return ret;
>> +}
>> +
>> +static void gh_ioevent_unbind(struct gh_vm_function_instance *f)
>> +{
>> +    struct gh_ioeventfd *iofd = f->data;
>> +
>> +    eventfd_ctx_put(iofd->ctx);
>> +    gh_vm_remove_io_handler(iofd->f->ghvm, &iofd->io_handler);
>> +    kfree(iofd);
>> +}
>> +
>> +static bool gh_ioevent_compare(const struct gh_vm_function_instance *f,
>> +                const void *arg, size_t size)
>> +{
>> +    const struct gh_fn_ioeventfd_arg *instance = f->argp,
>> +                     *other = arg;
>> +
>> +    if (sizeof(*other) != size)
>> +        return false;
>> +
>> +    return instance->addr == other->addr;
>> +}
>> +
>> +DECLARE_GH_VM_FUNCTION_INIT(ioeventfd, GH_FN_IOEVENTFD, 3,
>> +                gh_ioeventfd_bind, gh_ioevent_unbind,
>> +                gh_ioevent_compare);
>> +MODULE_DESCRIPTION("Gunyah ioeventfd VM Function");
>> +MODULE_LICENSE("GPL");
>> diff --git a/include/uapi/linux/gunyah.h b/include/uapi/linux/gunyah.h
>> index 0c480c622686..fa1cae7419d2 100644
>> --- a/include/uapi/linux/gunyah.h
>> +++ b/include/uapi/linux/gunyah.h
>> @@ -79,10 +79,13 @@ struct gh_vm_dtb_config {
>>    *              Return: file descriptor to manipulate the vcpu.
>>    * @GH_FN_IRQFD: register eventfd to assert a Gunyah doorbell
>>    *               &struct gh_fn_desc.arg is a pointer to &struct 
>> gh_fn_irqfd_arg
>> + * @GH_FN_IOEVENTFD: register ioeventfd to trigger when VM faults on 
>> parameter
>> + *                   &struct gh_fn_desc.arg is a pointer to &struct 
>> gh_fn_ioeventfd_arg
>>    */
>>   enum gh_fn_type {
>>       GH_FN_VCPU = 1,
>>       GH_FN_IRQFD,
>> +    GH_FN_IOEVENTFD,
>>   };
>>   #define GH_FN_MAX_ARG_SIZE        256
>> @@ -134,6 +137,40 @@ struct gh_fn_irqfd_arg {
>>       __u32 padding;
>>   };
>> +/**
>> + * enum gh_ioeventfd_flags - flags for use in gh_fn_ioeventfd_arg
>> + * @GH_IOEVENTFD_FLAGS_DATAMATCH: the event will be signaled only if the
>> + *                                written value to the registered 
>> address is
>> + *                                equal to &struct 
>> gh_fn_ioeventfd_arg.datamatch
>> + */
>> +enum gh_ioeventfd_flags {
>> +    GH_IOEVENTFD_FLAGS_DATAMATCH    = 1UL << 0,
>> +};
>> +
>> +/**
>> + * struct gh_fn_ioeventfd_arg - Arguments to create an ioeventfd 
>> function
>> + * @datamatch: data used when GH_IOEVENTFD_DATAMATCH is set
>> + * @addr: Address in guest memory
>> + * @len: Length of access
>> + * @fd: When ioeventfd is matched, this eventfd is written
>> + * @flags: See &enum gh_ioeventfd_flags
>> + * @padding: padding bytes
>> + *
>> + * Create this function with &GH_VM_ADD_FUNCTION using type 
>> &GH_FN_IOEVENTFD.
>> + *
>> + * Attaches an ioeventfd to a legal mmio address within the guest. A 
>> guest write
>> + * in the registered address will signal the provided event instead 
>> of triggering
>> + * an exit on the GH_VCPU_RUN ioctl.
>> + */
>> +struct gh_fn_ioeventfd_arg {
>> +    __u64 datamatch;
>> +    __u64 addr;        /* legal mmio address */
>> +    __u32 len;         /* 1, 2, 4, or 8 bytes; or 0 to ignore length */
>> +    __s32 fd;
>> +    __u32 flags;
>> +    __u32 padding;
>> +};
>> +
>>   /**
>>    * struct gh_fn_desc - Arguments to create a VM function
>>    * @type: Type of the function. See &enum gh_fn_type.
> 
