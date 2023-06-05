Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72CB8723066
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 21:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236014AbjFETvj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jun 2023 15:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235997AbjFETvP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jun 2023 15:51:15 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03661BB
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 12:50:47 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-33bbc91dcb7so26809055ab.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 12:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685994638; x=1688586638;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pb4vMkbecJkcpnH3qL4/u/xL5HM0085EHuZ3yWMZ+iQ=;
        b=f2WZG6b7YHzP+vDuYBWK9MS/jXojl9EOa1YCFle5qzCqQZhUKMyWU4nJ41fmdIIjnp
         P3O/LJLXI1Emr8NTjjqTAb73LB+cAR1KgLbNvIawexfoqP/fPOk57HzL+OsRvOwej/1N
         6VwQkp5Qv4oIuYtHiZGuG11xCsCTgOzZES8VIgtf1RI4giguQdLYaVmdhVtPKZCc6cVD
         W92d97f2+vJVOEcPHqLEQoDjdZv3QOOr4d/XDcwS4rrkLMk+lWIgPwQbtCXZxeOoKzLk
         PBviS/xPYB95BgppA7yyYdGOIkqLLoh14V3JUumrFPauERz+aAYRepiXFSf0dIgkknqq
         92Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685994638; x=1688586638;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pb4vMkbecJkcpnH3qL4/u/xL5HM0085EHuZ3yWMZ+iQ=;
        b=h/k8FnbAUMEb2u9iuds+XV0dJ6V6Vqj86RcAQHJskODq58QO9DFzUBKGZ/BpF06hw6
         +MELK7krItTHqwpbYeCYvkxknUSBBWdGAaRnIkJjU2O38CVC2iX14p+qM58t8PpwaAnw
         jHXOyA4r1dIwQozS+0QXA3kwadr2q+r/D2C4viYNg+jAwNmbYWBDUIG+WzBWYTXyTR4u
         rAUZlJv6NHEI3iztGjLL4pvZFQgrYk7UdTeq79gK8DAkXrPGhuKDrNlPvt9oKRd4pwjX
         iA0893+nRuyTCw3Swde/qbhnTnxx7aCI/t8I00B5Rae/V3ek847FwZvlNVSmTsNx96hv
         e3zA==
X-Gm-Message-State: AC+VfDyurYnhCl2xqxhZJbMMczfu2xaETBW0OxaNgi8XkeQgWr+Fa+l8
        D95Fnt4FDcoAE3RBPfwk8VQeRw==
X-Google-Smtp-Source: ACHHUZ6YbWWgt6lBIt7xQpVWFfVW8PF30RNHyQRnSeiZk2fUuzZUAS+fEv0zTWpEXWNv3LIP6kgzcA==
X-Received: by 2002:a5e:834d:0:b0:775:5f74:f4c7 with SMTP id y13-20020a5e834d000000b007755f74f4c7mr139992iom.17.1685994638017;
        Mon, 05 Jun 2023 12:50:38 -0700 (PDT)
Received: from [172.22.22.28] ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id u6-20020a5ec006000000b00760ad468988sm2704777iol.24.2023.06.05.12.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 12:50:37 -0700 (PDT)
Message-ID: <85e7c3ae-0991-0ca9-909c-f38773f63894@linaro.org>
Date:   Mon, 5 Jun 2023 14:50:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From:   Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v13 23/24] virt: gunyah: Add ioeventfd
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230509204801.2824351-1-quic_eberman@quicinc.com>
 <20230509204801.2824351-24-quic_eberman@quicinc.com>
Content-Language: en-US
In-Reply-To: <20230509204801.2824351-24-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/9/23 3:48 PM, Elliot Berman wrote:
> Allow userspace to attach an ioeventfd to an mmio address within the guest.
> 
> Co-developed-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
> Signed-off-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

Looks good.  One question below.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   Documentation/virt/gunyah/vm-manager.rst |   2 +-
>   drivers/virt/gunyah/Kconfig              |   9 ++
>   drivers/virt/gunyah/Makefile             |   1 +
>   drivers/virt/gunyah/gunyah_ioeventfd.c   | 130 +++++++++++++++++++++++
>   include/uapi/linux/gunyah.h              |  37 +++++++
>   5 files changed, 178 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/virt/gunyah/gunyah_ioeventfd.c
> 
> diff --git a/Documentation/virt/gunyah/vm-manager.rst b/Documentation/virt/gunyah/vm-manager.rst
> index c4960948c779..87838c5b5945 100644
> --- a/Documentation/virt/gunyah/vm-manager.rst
> +++ b/Documentation/virt/gunyah/vm-manager.rst
> @@ -115,7 +115,7 @@ the VM *before* the VM starts.
>   The argument types are documented below:
>   
>   .. kernel-doc:: include/uapi/linux/gunyah.h
> -   :identifiers: gh_fn_vcpu_arg gh_fn_irqfd_arg gh_irqfd_flags
> +   :identifiers: gh_fn_vcpu_arg gh_fn_irqfd_arg gh_irqfd_flags gh_fn_ioeventfd_arg gh_ioeventfd_flags
>   
>   Gunyah VCPU API Descriptions
>   ----------------------------
> diff --git a/drivers/virt/gunyah/Kconfig b/drivers/virt/gunyah/Kconfig
> index bc2c46d9df94..63bebc5b9f82 100644
> --- a/drivers/virt/gunyah/Kconfig
> +++ b/drivers/virt/gunyah/Kconfig
> @@ -48,3 +48,12 @@ config GUNYAH_IRQFD
>   	  on Gunyah virtual machine.
>   
>   	  Say Y/M here if unsure and you want to support Gunyah VMMs.
> +
> +config GUNYAH_IOEVENTFD
> +	tristate "Gunyah ioeventfd interface"
> +	depends on GUNYAH
> +	help
> +	  Enable kernel support for creating ioeventfds which can alert userspace
> +	  when a Gunyah virtual machine accesses a memory address.
> +
> +	  Say Y/M here if unsure and you want to support Gunyah VMMs.
> diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
> index ad212a1cf967..63ca11e74796 100644
> --- a/drivers/virt/gunyah/Makefile
> +++ b/drivers/virt/gunyah/Makefile
> @@ -8,3 +8,4 @@ obj-$(CONFIG_GUNYAH) += gunyah.o
>   
>   obj-$(CONFIG_GUNYAH_VCPU) += gunyah_vcpu.o
>   obj-$(CONFIG_GUNYAH_IRQFD) += gunyah_irqfd.o
> +obj-$(CONFIG_GUNYAH_IOEVENTFD) += gunyah_ioeventfd.o
> diff --git a/drivers/virt/gunyah/gunyah_ioeventfd.c b/drivers/virt/gunyah/gunyah_ioeventfd.c
> new file mode 100644
> index 000000000000..5b1b9fd9ac3a
> --- /dev/null
> +++ b/drivers/virt/gunyah/gunyah_ioeventfd.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/eventfd.h>
> +#include <linux/file.h>
> +#include <linux/fs.h>
> +#include <linux/gunyah.h>
> +#include <linux/gunyah_vm_mgr.h>
> +#include <linux/module.h>
> +#include <linux/printk.h>
> +
> +#include <uapi/linux/gunyah.h>
> +
> +struct gh_ioeventfd {
> +	struct gh_vm_function_instance *f;
> +	struct gh_vm_io_handler io_handler;
> +
> +	struct eventfd_ctx *ctx;
> +};
> +
> +static int gh_write_ioeventfd(struct gh_vm_io_handler *io_dev, u64 addr, u32 len, u64 data)
> +{
> +	struct gh_ioeventfd *iofd = container_of(io_dev, struct gh_ioeventfd, io_handler);

Does a write of 0 bytes still signal an event?

> +
> +	eventfd_signal(iofd->ctx, 1);
> +	return 0;
> +}
> +
> +static struct gh_vm_io_handler_ops io_ops = {
> +	.write = gh_write_ioeventfd,
> +};
> +
> +static long gh_ioeventfd_bind(struct gh_vm_function_instance *f)
> +{
> +	const struct gh_fn_ioeventfd_arg *args = f->argp;
> +	struct gh_ioeventfd *iofd;
> +	struct eventfd_ctx *ctx;
> +	int ret;
> +
> +	if (f->arg_size != sizeof(*args))
> +		return -EINVAL;
> +
> +	/* All other flag bits are reserved for future use */
> +	if (args->flags & ~GH_IOEVENTFD_FLAGS_DATAMATCH)
> +		return -EINVAL;
> +
> +	/* must be natural-word sized, or 0 to ignore length */
> +	switch (args->len) {
> +	case 0:
> +	case 1:
> +	case 2:
> +	case 4:
> +	case 8:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/* check for range overflow */
> +	if (overflows_type(args->addr + args->len, u64))
> +		return -EINVAL;
> +
> +	/* ioeventfd with no length can't be combined with DATAMATCH */
> +	if (!args->len && (args->flags & GH_IOEVENTFD_FLAGS_DATAMATCH))
> +		return -EINVAL;
> +
> +	ctx = eventfd_ctx_fdget(args->fd);
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
> +
> +	iofd = kzalloc(sizeof(*iofd), GFP_KERNEL);
> +	if (!iofd) {
> +		ret = -ENOMEM;
> +		goto err_eventfd;
> +	}
> +
> +	f->data = iofd;
> +	iofd->f = f;
> +
> +	iofd->ctx = ctx;
> +
> +	if (args->flags & GH_IOEVENTFD_FLAGS_DATAMATCH) {
> +		iofd->io_handler.datamatch = true;
> +		iofd->io_handler.len = args->len;
> +		iofd->io_handler.data = args->datamatch;
> +	}
> +	iofd->io_handler.addr = args->addr;
> +	iofd->io_handler.ops = &io_ops;
> +
> +	ret = gh_vm_add_io_handler(f->ghvm, &iofd->io_handler);
> +	if (ret)
> +		goto err_io_dev_add;
> +
> +	return 0;
> +
> +err_io_dev_add:
> +	kfree(iofd);
> +err_eventfd:
> +	eventfd_ctx_put(ctx);
> +	return ret;
> +}
> +
> +static void gh_ioevent_unbind(struct gh_vm_function_instance *f)
> +{
> +	struct gh_ioeventfd *iofd = f->data;
> +
> +	eventfd_ctx_put(iofd->ctx);
> +	gh_vm_remove_io_handler(iofd->f->ghvm, &iofd->io_handler);
> +	kfree(iofd);
> +}
> +
> +static bool gh_ioevent_compare(const struct gh_vm_function_instance *f,
> +				const void *arg, size_t size)
> +{
> +	const struct gh_fn_ioeventfd_arg *instance = f->argp,
> +					 *other = arg;
> +
> +	if (sizeof(*other) != size)
> +		return false;
> +
> +	return instance->addr == other->addr;
> +}
> +
> +DECLARE_GH_VM_FUNCTION_INIT(ioeventfd, GH_FN_IOEVENTFD, 3,
> +				gh_ioeventfd_bind, gh_ioevent_unbind,
> +				gh_ioevent_compare);
> +MODULE_DESCRIPTION("Gunyah ioeventfd VM Function");
> +MODULE_LICENSE("GPL");
> diff --git a/include/uapi/linux/gunyah.h b/include/uapi/linux/gunyah.h
> index 0c480c622686..fa1cae7419d2 100644
> --- a/include/uapi/linux/gunyah.h
> +++ b/include/uapi/linux/gunyah.h
> @@ -79,10 +79,13 @@ struct gh_vm_dtb_config {
>    *              Return: file descriptor to manipulate the vcpu.
>    * @GH_FN_IRQFD: register eventfd to assert a Gunyah doorbell
>    *               &struct gh_fn_desc.arg is a pointer to &struct gh_fn_irqfd_arg
> + * @GH_FN_IOEVENTFD: register ioeventfd to trigger when VM faults on parameter
> + *                   &struct gh_fn_desc.arg is a pointer to &struct gh_fn_ioeventfd_arg
>    */
>   enum gh_fn_type {
>   	GH_FN_VCPU = 1,
>   	GH_FN_IRQFD,
> +	GH_FN_IOEVENTFD,
>   };
>   
>   #define GH_FN_MAX_ARG_SIZE		256
> @@ -134,6 +137,40 @@ struct gh_fn_irqfd_arg {
>   	__u32 padding;
>   };
>   
> +/**
> + * enum gh_ioeventfd_flags - flags for use in gh_fn_ioeventfd_arg
> + * @GH_IOEVENTFD_FLAGS_DATAMATCH: the event will be signaled only if the
> + *                                written value to the registered address is
> + *                                equal to &struct gh_fn_ioeventfd_arg.datamatch
> + */
> +enum gh_ioeventfd_flags {
> +	GH_IOEVENTFD_FLAGS_DATAMATCH	= 1UL << 0,
> +};
> +
> +/**
> + * struct gh_fn_ioeventfd_arg - Arguments to create an ioeventfd function
> + * @datamatch: data used when GH_IOEVENTFD_DATAMATCH is set
> + * @addr: Address in guest memory
> + * @len: Length of access
> + * @fd: When ioeventfd is matched, this eventfd is written
> + * @flags: See &enum gh_ioeventfd_flags
> + * @padding: padding bytes
> + *
> + * Create this function with &GH_VM_ADD_FUNCTION using type &GH_FN_IOEVENTFD.
> + *
> + * Attaches an ioeventfd to a legal mmio address within the guest. A guest write
> + * in the registered address will signal the provided event instead of triggering
> + * an exit on the GH_VCPU_RUN ioctl.
> + */
> +struct gh_fn_ioeventfd_arg {
> +	__u64 datamatch;
> +	__u64 addr;        /* legal mmio address */
> +	__u32 len;         /* 1, 2, 4, or 8 bytes; or 0 to ignore length */
> +	__s32 fd;
> +	__u32 flags;
> +	__u32 padding;
> +};
> +
>   /**
>    * struct gh_fn_desc - Arguments to create a VM function
>    * @type: Type of the function. See &enum gh_fn_type.

