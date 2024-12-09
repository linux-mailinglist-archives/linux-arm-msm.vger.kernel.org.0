Return-Path: <linux-arm-msm+bounces-41142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5989E9E42
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 19:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6A0E28230A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 18:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4258184542;
	Mon,  9 Dec 2024 18:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jgGrgKTS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6701C19885F
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 18:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733769809; cv=none; b=UjCpnXmhzunpkMW5F3baiSPumoeKQzxY/zUuzso1WGElZFUtf82EuYgyRi5J22dOb5U2lmT6KooxCSN4yY+1ezdX28+j9wMtek82MBlEnWN+JtbopBDNjC4C8fnerkok8RN0vzqOITBdHw1Eg7NKXHGZ9a8KvG21EH3+I6BOi/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733769809; c=relaxed/simple;
	bh=RfY+p3TfOybjJI0prlsJkXEsYZPtZpjB3MBHfhAs3Mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLDgAAzzj9NO+BGo0i2RbOwr6vcODTWDj4HUqEm+FBi0iWZJ/Kwh9xhpBi4Eg89V7DilcXLR64fB9DzUzOuoXidFdulJy33ALQi66YSt7X71ilCjYAXJypE88YaZzEFpGvEF8jvL/5oP0/Fmo2wmViYW01EZnP884kmOQ/c1aWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jgGrgKTS; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3eb4002eabcso920881b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 10:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733769804; x=1734374604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faMA4Y/T8ZYfBpq3Gg/h3je3G+4bZL5OHc3NDnHGvn0=;
        b=jgGrgKTStuMjjFxf/I8tUHDBKlvAwXmbNwg46VYaKgIqM4yMJHrTp9OZFrvdI68H4H
         qzc7at/Gz+LY4lO/Lwo4i3gfIbNz4c4uBMG0hOAFRDjsENMJExfiu7NWh7QVo26spHJI
         1by0vD+KkeKKm+VVuud2DAhpXINfOqaJ7OAYNbqYt42cbq9Ee5F6jfN5DR3d39hh6IQo
         6T0kgj8eyuBhThZBIWe23vJMbq/YTX5vjn/DgymaptH1zUCyraWUGYfCEvuqniq1YzDi
         xQmyE25GVxX8OMguZg2F4dcGKQmV4d+F70fE4E8SBvzD1hIvxceZj5biUgUhwOf58ggh
         46lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733769804; x=1734374604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faMA4Y/T8ZYfBpq3Gg/h3je3G+4bZL5OHc3NDnHGvn0=;
        b=B3JrBI6+yE51ChR3seb5LRmzc+FQ8QXZ51lhdoujMzs5jjt44f7EC7mPC7gB39GGmj
         j3xnNpMv7bpvvJEj4pJL5cdfq+i8E/5EOUJew2YYEht7S0wjuf9Wwx4132wd0QM3BFnd
         sP7KqRf0P4XOqwRrcFBmuHyT/mEhJoc5JkcQ+Legw4h+gHSaVcT2y6gXb6vWFE6L2JdI
         Sl7LCCWISV73oz6bPkzXgjGoRzclZ78h8QFBabnSvor435CKD9IUhUrM9jV5dZpHbdrN
         U1/w3s17k6VJcW6b32pvpzkpqybSGLDirk6ChBy4MYLAcVkZd3Zy1uLiqXqUWv6A6fg7
         tMpg==
X-Forwarded-Encrypted: i=1; AJvYcCWS12Ts5xOE1JQc1wzMy2n88GHqFOkitBHFkk6QLgKbcS5qgwiRmd/oL4ZsOCojYmn+xgn/u1Kf52lC6mWh@vger.kernel.org
X-Gm-Message-State: AOJu0YxLkqG754vXwfn+RYgJeL+kk/DbiBCWLqa8pqZfjYpUdvLwlsSk
	9gYBo//OpIHje52umKrQpo/uyUxdHBKMRmppOsFUD4Rga9XDZm2s/GXONWmReFkXhgvyjf00y4u
	czoNFFrzQUq6c4CH0UtCqE1+LRj8Ur0gF3DL9kg==
X-Gm-Gg: ASbGnctBfTwzn0PPC/iCzUBe6WVZGFuAi+yGQZ1dKak6uOKolM7i21cQ6NgrYmpPEzq
	B58QZn7aUVmpvMzW8FLQDxdVTWJEbYv2X
X-Google-Smtp-Source: AGHT+IGvzES73dhNzNSGASLbpGKBinNqF3zmJbCgeChr4kdhUX22QuILm9F7tjVt7nfEphRN+8AfR4yHx2JC/290qM0=
X-Received: by 2002:a05:6808:1525:b0:3eb:44a7:d3f8 with SMTP id
 5614622812f47-3eb44a7d928mr4186355b6e.39.1733769803606; Mon, 09 Dec 2024
 10:43:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
 <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-5-f502ef01e016@quicinc.com>
In-Reply-To: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-5-f502ef01e016@quicinc.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 9 Dec 2024 19:43:11 +0100
Message-ID: <CAHUa44H=xC3LkcefYmnfO4nLpFLqQ4gg=4NMgXTeuspOgs6UtQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] qcomtee: implement object invoke support
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Sumit Garg <sumit.garg@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Amirreza,

On Tue, Dec 3, 2024 at 5:20=E2=80=AFAM Amirreza Zarrabi
<quic_azarrabi@quicinc.com> wrote:
>
> Introduce qcom_tee_object, which represents an object in both QTEE and
> the kernel. QTEE clients can invoke an instance of qcom_tee_object to
> access QTEE services. If this invocation produces a new object in QTEE,
> an instance of qcom_tee_object will be returned.
>
> Similarly, QTEE can request services from the kernel by issuing a callbac=
k
> request, which invokes an instance of qcom_tee_object in the kernel.
> Any subsystem that exposes a service to QTEE should allocate and initiali=
ze
> an instance of qcom_tee_object with a dispatcher callback that is called
> when the object is invoked.
>
> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> ---
>  drivers/tee/Kconfig                    |   1 +
>  drivers/tee/Makefile                   |   1 +
>  drivers/tee/qcomtee/Kconfig            |  10 +
>  drivers/tee/qcomtee/Makefile           |   6 +
>  drivers/tee/qcomtee/async.c            | 153 ++++++
>  drivers/tee/qcomtee/core.c             | 928 +++++++++++++++++++++++++++=
++++++
>  drivers/tee/qcomtee/qcom_scm.c         |  36 ++
>  drivers/tee/qcomtee/qcomtee_msg.h      | 217 ++++++++
>  drivers/tee/qcomtee/qcomtee_private.h  |  47 ++
>  drivers/tee/qcomtee/release.c          |  66 +++
>  include/linux/firmware/qcom/qcom_tee.h | 284 ++++++++++
>  11 files changed, 1749 insertions(+)
>
> diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
> index 61b507c18780..3a995d7f0d74 100644
> --- a/drivers/tee/Kconfig
> +++ b/drivers/tee/Kconfig
> @@ -16,5 +16,6 @@ if TEE
>  source "drivers/tee/optee/Kconfig"
>  source "drivers/tee/amdtee/Kconfig"
>  source "drivers/tee/tstee/Kconfig"
> +source "drivers/tee/qcomtee/Kconfig"
>
>  endif
> diff --git a/drivers/tee/Makefile b/drivers/tee/Makefile
> index 5488cba30bd2..74e987f8f7ea 100644
> --- a/drivers/tee/Makefile
> +++ b/drivers/tee/Makefile
> @@ -6,3 +6,4 @@ tee-objs +=3D tee_shm_pool.o
>  obj-$(CONFIG_OPTEE) +=3D optee/
>  obj-$(CONFIG_AMDTEE) +=3D amdtee/
>  obj-$(CONFIG_ARM_TSTEE) +=3D tstee/
> +obj-$(CONFIG_QCOMTEE) +=3D qcomtee/
> diff --git a/drivers/tee/qcomtee/Kconfig b/drivers/tee/qcomtee/Kconfig
> new file mode 100644
> index 000000000000..d180a6d07d33
> --- /dev/null
> +++ b/drivers/tee/qcomtee/Kconfig
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Qualcomm Trusted Execution Environment Configuration
> +config QCOMTEE
> +       tristate "Qualcomm TEE Support"
> +       select QCOM_SCM
> +       help
> +         This option enables the Qualcomm Trusted Execution Environment =
(QTEE)
> +         driver. It provides an API to access services offered by QTEE a=
nd any
> +         loaded Trusted Applications (TAs), as well as exporting kernel
> +         services to QTEE.
> diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
> new file mode 100644
> index 000000000000..7dc5e6373042
> --- /dev/null
> +++ b/drivers/tee/qcomtee/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_QCOMTEE) +=3D qcomtee.o
> +qcomtee-objs +=3D async.o
> +qcomtee-objs +=3D core.o
> +qcomtee-objs +=3D qcom_scm.o
> +qcomtee-objs +=3D release.o
> diff --git a/drivers/tee/qcomtee/async.c b/drivers/tee/qcomtee/async.c
> new file mode 100644
> index 000000000000..218ec0209722
> --- /dev/null
> +++ b/drivers/tee/qcomtee/async.c
> @@ -0,0 +1,153 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +
> +#include "qcomtee_private.h"
> +#include "qcomtee_msg.h"
> +
> +#define QCOM_TEE_ASYNC_VERSION_1_0 0x00010000U /* Major: 0x0001, Minor: =
0x0000. */

Please keep the limit of 80 columns as described in the coding guidelines a=
t
https://docs.kernel.org/process/coding-style.html#breaking-long-lines-and-s=
trings
This comment applies to the entire patch set.

I think it's easier to interpret the  QCOM_TEE prefix as QCOMTEE. I
wouldn't mind QTEE as a prefix and the name of the driver if that's
more convenient.

> +#define QCOM_TEE_ASYNC_VERSION_1_1 0x00010001U /* Major: 0x0001, Minor: =
0x0001. */
> +#define QCOM_TEE_ASYNC_VERSION_1_2 0x00010002U /* Major: 0x0001, Minor: =
0x0002. */
> +#define QCOM_TEE_ASYNC_VERSION QCOM_TEE_ASYNC_VERSION_1_2 /* Current Ver=
sion. */
> +
> +#define QCOM_TEE_ASYNC_VERSION_MAJOR(n) upper_16_bits(n)
> +#define QCOM_TEE_ASYNC_VERSION_MINOR(n) lower_16_bits(n)
> +
> +/**
> + * struct qcom_tee_async_msg_hdr - Asynchronous message header format.
> + * @version: current async protocol version of remote endpoint
> + * @op: async operation
> + *
> + * @version specifies the endpoints (QTEE or driver) supported async pro=
tocol, e.g.
> + * if QTEE set @version to %QCOM_TEE_ASYNC_VERSION_1_1, QTEE handles ope=
rations
> + * supported in %QCOM_TEE_ASYNC_VERSION_1_1 or %QCOM_TEE_ASYNC_VERSION_1=
_0.
> + * @op determins the message format.
> + */
> +struct qcom_tee_async_msg_hdr {
> +       u32 version;
> +       u32 op;
> +};
> +
> +/**
> + * struct qcom_tee_async_release_msg - Release asynchronous message.
> + * @hdr: message header as &struct qcom_tee_async_msg_hdr
> + * @counts: number of objects in @object_ids
> + * @object_ids: array of object ids should be released
> + *
> + * Available in Major =3D 0x0001, Minor >=3D 0x0000.
> + */
> +struct qcom_tee_async_release_msg {
> +       struct qcom_tee_async_msg_hdr hdr;
> +       u32 counts;
> +       u32 object_ids[] __counted_by(counts);
> +};
> +
> +/**
> + * qcom_tee_get_async_buffer() - Get start of the asynchronous message i=
n outbound buffer.
> + * @oic: context used for current invocation
> + * @async_buffer: return buffer to extract from or fill in async message=
s
> + *
> + * If @oic is used for direct object invocation, whole outbound buffer i=
s available for
> + * async message. If @oic is used for callback request, the tail of outb=
ound buffer (after
> + * the callback request message) is available for async message.
> + */
> +static void qcom_tee_get_async_buffer(struct qcom_tee_object_invoke_ctx =
*oic,
> +                                     struct qcom_tee_buffer *async_buffe=
r)
> +{
> +       struct qcom_tee_msg_callback *msg;
> +       unsigned int offset;
> +       int i;
> +
> +       if (!(oic->flags & QCOM_TEE_OIC_FLAG_BUSY)) {
> +               /* The outbound buffer is empty. Using the whole buffer. =
*/
> +               offset =3D 0;
> +       } else {
> +               msg =3D (struct qcom_tee_msg_callback *)oic->out_msg.addr=
;
> +
> +               /* Start offset in a message for buffer arguments. */
> +               offset =3D qcom_tee_msg_buffer_args(struct qcom_tee_msg_c=
allback,
> +                                                 qcom_tee_msg_args(msg))=
;
> +
> +               /* Add size of IB arguments. */
> +               qcom_tee_msg_for_each_input_buffer(i, msg)
> +                       offset +=3D qcom_tee_msg_offset_align(msg->args[i=
].b.size);
> +
> +               /* Add size of OB arguments. */
> +               qcom_tee_msg_for_each_output_buffer(i, msg)
> +                       offset +=3D qcom_tee_msg_offset_align(msg->args[i=
].b.size);
> +       }
> +
> +       async_buffer->addr =3D oic->out_msg.addr + offset;
> +       async_buffer->size =3D oic->out_msg.size - offset;
> +}
> +
> +/**
> + * qcom_tee_async_release_handler() - Process QTEE async requests for re=
leasing objects.
> + * @oic: context used for current invocation
> + * @msg: async message for object release
> + * @size: size of the async buffer available
> + *
> + * Return: Size of outbound buffer used when processing @msg.
> + */
> +static size_t qcom_tee_async_release_handler(struct qcom_tee_object_invo=
ke_ctx *oic,
> +                                            struct qcom_tee_async_msg_hd=
r *async_msg, size_t size)
> +{
> +       struct qcom_tee_async_release_msg *msg =3D (struct qcom_tee_async=
_release_msg *)async_msg;
> +       struct qcom_tee_object *object;
> +       int i;
> +
> +       for (i =3D 0; i < msg->counts; i++) {
> +               object =3D qcom_tee_idx_erase(msg->object_ids[i]);
> +               qcom_tee_object_put(object);
> +       }
> +
> +       return struct_size_t(struct qcom_tee_async_release_msg, object_id=
s, i);
> +}
> +
> +/**
> + * qcom_tee_fetch_async_reqs() - Fetch and process asynchronous messages=
.
> + * @oic: context used for current invocation
> + *
> + * It looks for handler to process the requested operations in the async=
 message.
> + * Currently, only support async release requests.
> + */
> +void qcom_tee_fetch_async_reqs(struct qcom_tee_object_invoke_ctx *oic)
> +{
> +       struct qcom_tee_async_msg_hdr *async_msg;
> +       struct qcom_tee_buffer async_buffer;
> +       size_t consumed, used =3D 0;
> +
> +       qcom_tee_get_async_buffer(oic, &async_buffer);
> +
> +       while (async_buffer.size - used > sizeof(struct qcom_tee_async_ms=
g_hdr)) {
> +               async_msg =3D (struct qcom_tee_async_msg_hdr *)(async_buf=
fer.addr + used);
> +
> +               if (QCOM_TEE_ASYNC_VERSION_MAJOR(async_msg->version) !=3D
> +                   QCOM_TEE_ASYNC_VERSION_MAJOR(QCOM_TEE_ASYNC_VERSION))
> +                       goto out;
> +
> +               switch (async_msg->op) {
> +               case QCOM_TEE_MSG_OBJECT_OP_RELEASE:
> +                       consumed =3D qcom_tee_async_release_handler(oic, =
async_msg,
> +                                                                 async_b=
uffer.size - used);
> +                       break;
> +               default:
> +                       /* Unsupported operations. */
> +                       goto out;
> +               }
> +
> +               /* Supported operation but unable to parse the message. *=
/
> +               if (!consumed)
> +                       goto out;
> +
> +               used +=3D qcom_tee_msg_offset_align(consumed);
> +       }
> +
> + out:
> +       /* Reset the async messages buffer so async requests do not loopb=
ack to QTEE. */
> +       memzero_explicit(async_buffer.addr, async_buffer.size);
> +}
> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> new file mode 100644
> index 000000000000..a949ef4cceee
> --- /dev/null
> +++ b/drivers/tee/qcomtee/core.c
> @@ -0,0 +1,928 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/firmware/qcom/qcom_tzmem.h>
> +#include <linux/init.h>
> +#include <linux/kobject.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/sysfs.h>
> +#include <linux/slab.h>
> +#include <linux/xarray.h>
> +
> +#include "qcomtee_msg.h"
> +#include "qcomtee_private.h"
> +
> +/* Static instance of object represents QTEE root object. */
> +struct qcom_tee_object qcom_tee_object_root =3D {
> +       .name =3D "root",
> +       .object_type =3D QCOM_TEE_OBJECT_TYPE_ROOT,
> +       .info.qtee_id =3D QCOM_TEE_MSG_OBJECT_ROOT,
> +};
> +EXPORT_SYMBOL_GPL(qcom_tee_object_root);
> +
> +/* Next argument of type @type after index @i. */
> +int qcom_tee_next_arg_type(struct qcom_tee_arg *u, int i, enum qcom_tee_=
arg_type type)
> +{
> +       while (u[i].type !=3D QCOM_TEE_ARG_TYPE_INV && u[i].type !=3D typ=
e)
> +               i++;
> +       return i;
> +}
> +
> +/* QTEE expects IDs with QCOM_TEE_MSG_OBJECT_NS_BIT set for object of
> + * QCOM_TEE_OBJECT_TYPE_CB_OBJECT type.
> + */
> +#define QCOM_TEE_OBJECT_ID_START       (QCOM_TEE_MSG_OBJECT_NS_BIT + 1)
> +#define QCOM_TEE_OBJECT_ID_END         (UINT_MAX)
> +
> +#define QCOM_TEE_OBJECT_SET(p, type, ...) __QCOM_TEE_OBJECT_SET(p, type,=
 ##__VA_ARGS__, 0UL)
> +#define __QCOM_TEE_OBJECT_SET(p, type, optr, ...) do { \
> +               (p)->object_type =3D (type); \
> +               (p)->info.qtee_id =3D (unsigned long)(optr); \
> +       } while (0)
> +
> +static struct qcom_tee_object *qcom_tee_object_alloc(void)
> +{
> +       struct qcom_tee_object *object;
> +
> +       object =3D kzalloc(sizeof(*object), GFP_KERNEL);
> +       if (object) {
> +               QCOM_TEE_OBJECT_SET(object, QCOM_TEE_OBJECT_TYPE_NULL);
> +               kref_init(&object->refcount);
> +       }
> +
> +       return object;
> +}
> +
> +void qcom_tee_object_free(struct qcom_tee_object *object)
> +{
> +       kfree(object->name);
> +       kfree(object);
> +}
> +
> +static void qcom_tee_object_release(struct kref *refcount)
> +{
> +       struct qcom_tee_object *object;
> +       struct module *owner;
> +       const char *name;
> +
> +       object =3D container_of(refcount, struct qcom_tee_object, refcoun=
t);
> +
> +       synchronize_rcu();
> +
> +       switch (typeof_qcom_tee_object(object)) {
> +       case QCOM_TEE_OBJECT_TYPE_TEE:
> +               qcom_tee_release_tee_object(object);
> +
> +               break;
> +       case QCOM_TEE_OBJECT_TYPE_CB_OBJECT:
> +               /* Copy, as after release we should not access object. */
> +               name =3D object->name;
> +               owner =3D object->owner;
> +
> +               if (object->ops->release)
> +                       object->ops->release(object);
> +
> +               module_put(owner);
> +               kfree_const(name);
> +
> +               break;
> +       case QCOM_TEE_OBJECT_TYPE_ROOT:
> +       case QCOM_TEE_OBJECT_TYPE_NULL:
> +       default:
> +               break;
> +       }
> +}
> +
> +/**
> + * qcom_tee_object_get() - Increase object's refcount.
> + * @object: object to increase the refcount
> + */
> +int qcom_tee_object_get(struct qcom_tee_object *object)
> +{
> +       if (object !=3D NULL_QCOM_TEE_OBJECT &&
> +           object !=3D ROOT_QCOM_TEE_OBJECT)
> +               return kref_get_unless_zero(&object->refcount);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(qcom_tee_object_get);
> +
> +/**
> + * qcom_tee_object_put() - Decrease object's refcount
> + * @object: object to decrease the refcount
> + */
> +void qcom_tee_object_put(struct qcom_tee_object *object)
> +{
> +       if (object !=3D NULL_QCOM_TEE_OBJECT &&
> +           object !=3D ROOT_QCOM_TEE_OBJECT)
> +               kref_put(&object->refcount, qcom_tee_object_release);
> +}
> +EXPORT_SYMBOL_GPL(qcom_tee_object_put);
> +
> +/* ''Local Object Table''. */
> +/* Object from kernel that are exported to QTEE are assigned an id and s=
tored in
> + * xa_qcom_local_objects (kernel object table). QTEE uses this id to ref=
erence the
> + * object using qcom_tee_local_object_get.
> + */
> +static DEFINE_XARRAY_ALLOC(xa_qcom_local_objects);

We would store this in struct optee in the OP-TEE backend driver. It's
not clear to me how this variable is freed when the driver is
unloaded. Would it make sense to introduce a struct qcomtee to hold
the driver state?

> +
> +static int qcom_tee_idx_alloc(u32 *idx, struct qcom_tee_object *object)
> +{
> +       static u32 xa_last_id =3D QCOM_TEE_OBJECT_ID_START;
> +
> +       /* Every id allocated here, has QCOM_TEE_MSG_OBJECT_NS_BIT set. *=
/
> +       return xa_alloc_cyclic(&xa_qcom_local_objects, idx, object,
> +               XA_LIMIT(QCOM_TEE_OBJECT_ID_START, QCOM_TEE_OBJECT_ID_END=
),
> +                       &xa_last_id, GFP_KERNEL);
> +}
> +
> +struct qcom_tee_object *qcom_tee_idx_erase(u32 idx)
> +{
> +       if (idx < QCOM_TEE_OBJECT_ID_START || idx > QCOM_TEE_OBJECT_ID_EN=
D)
> +               return NULL_QCOM_TEE_OBJECT;
> +
> +       return xa_erase(&xa_qcom_local_objects, idx);
> +}
> +
> +/**
> + * qcom_tee_object_id_get() - Get an id for an object to sent to QTEE.
> + * @object: object to get its id.
> + * @object_id: object id.
> + *
> + * For object hosted in REE, they are added to object table, and the idx=
 in the
> + * object table is used as id. For object hosted in QTEE, use the QTEE i=
d stored in
> + * @object. This is called on a path to QTEE to construct a message, see
> + * qcom_tee_prepare_msg() and qcom_tee_update_msg().
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +static int qcom_tee_object_id_get(struct qcom_tee_object *object, unsign=
ed int *object_id)
> +{
> +       u32 idx;
> +
> +       switch (typeof_qcom_tee_object(object)) {
> +       case QCOM_TEE_OBJECT_TYPE_CB_OBJECT:
> +               if (qcom_tee_idx_alloc(&idx, object) < 0)
> +                       return -ENOSPC;
> +
> +               *object_id =3D idx;
> +
> +               break;
> +       case QCOM_TEE_OBJECT_TYPE_ROOT:
> +       case QCOM_TEE_OBJECT_TYPE_TEE:
> +               *object_id =3D object->info.qtee_id;
> +
> +               break;
> +       case QCOM_TEE_OBJECT_TYPE_NULL:
> +               *object_id =3D QCOM_TEE_MSG_OBJECT_NULL;
> +
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +/* Release object id assigned in qcom_tee_object_id_get. */
> +static void qcom_tee_object_id_put(unsigned int object_id)
> +{
> +       qcom_tee_idx_erase(object_id);
> +}
> +
> +/**
> + * qcom_tee_local_object_get() - Get an object in REE referenced by the =
id.
> + * @object_id: object id.
> + *
> + * It is called on behalf of QTEE to obtain instance of object for an id=
. It is
> + * called on a path from QTEE to construct an argument of &struct qcom_t=
ee_arg,
> + * see qcom_tee_update_args() and qcom_tee_prepare_args().
> + *
> + * It increases the object's refcount on success.
> + *
> + * Return: On error returns %NULL_QCOM_TEE_OBJECT. On success, the objec=
t.
> + */
> +static struct qcom_tee_object *qcom_tee_local_object_get(unsigned int ob=
ject_id)
> +{
> +       struct qcom_tee_object *object;
> +
> +       /* We trust QTEE does not mess the refcounts.
> +        * It does not issue RELEASE request and qcom_tee_object_get(), s=
imultaneously.
> +        */

What does this comment mean? That QTEE shouldn't get and release an
object in one request or that QTEE is trusted to keep the get and
release in balance?

Please use the preferred style for multi-line comments
https://docs.kernel.org/process/coding-style.html#commenting
This comment applies to the entire patch set.

> +
> +       object =3D xa_load(&xa_qcom_local_objects, object_id);
> +
> +       qcom_tee_object_get(object);
> +
> +       return object;
> +}
> +
> +/**
> + * __qcom_tee_object_user_init() - Initialize an object for user.
> + * @object: object to initialize.
> + * @ot: type of object as &enum qcom_tee_object_type.
> + * @ops: instance of callbacks.
> + * @fmt: name assigned to the object.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int __qcom_tee_object_user_init(struct qcom_tee_object *object, enum qco=
m_tee_object_type ot,
> +                               struct qcom_tee_object_operations *ops, s=
truct module *owner,
> +                               const char *fmt, ...)
> +{
> +       va_list ap;
> +       int ret;
> +
> +       kref_init(&object->refcount);
> +       QCOM_TEE_OBJECT_SET(object, QCOM_TEE_OBJECT_TYPE_NULL);
> +
> +       va_start(ap, fmt);
> +       switch (ot) {
> +       case QCOM_TEE_OBJECT_TYPE_NULL:
> +               ret =3D 0;
> +
> +               break;
> +       case QCOM_TEE_OBJECT_TYPE_CB_OBJECT:
> +               object->ops =3D ops;
> +               if (!object->ops->dispatch)
> +                       return -EINVAL;
> +
> +               object->owner =3D owner;
> +               if (!try_module_get(object->owner))
> +                       return -EINVAL;
> +
> +               /* If failed, "no-name"; it is not really a reason to fai=
l here. */
> +               object->name =3D kvasprintf_const(GFP_KERNEL, fmt, ap);
> +               QCOM_TEE_OBJECT_SET(object, QCOM_TEE_OBJECT_TYPE_CB_OBJEC=
T);
> +
> +               ret =3D 0;
> +               break;
> +       case QCOM_TEE_OBJECT_TYPE_ROOT:
> +       case QCOM_TEE_OBJECT_TYPE_TEE:
> +       default:
> +               ret =3D -EINVAL;
> +       }
> +       va_end(ap);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(__qcom_tee_object_user_init);
> +
> +/**
> + * qcom_tee_object_type() - Returns type of object represented by an obj=
ect id.
> + * @object_id: object id for the object.
> + *
> + * This is similar to typeof_qcom_tee_object() but instead of receiving =
object
> + * as argument it receives object id. It is used internally on return pa=
th
> + * from QTEE.
> + *
> + * Return: Returns type of object referenced by @object_id.
> + */
> +static enum qcom_tee_object_type qcom_tee_object_type(unsigned int objec=
t_id)
> +{
> +       if (object_id =3D=3D QCOM_TEE_MSG_OBJECT_NULL)
> +               return QCOM_TEE_OBJECT_TYPE_NULL;
> +
> +       if (object_id & QCOM_TEE_MSG_OBJECT_NS_BIT)
> +               return QCOM_TEE_OBJECT_TYPE_CB_OBJECT;
> +
> +       return QCOM_TEE_OBJECT_TYPE_TEE;
> +}
> +
> +/**
> + * qcom_tee_object_init() - Initialize an object for QTEE.
> + * @object: return object
> + * @object_id: object id received form QTEE
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +static int qcom_tee_object_init(struct qcom_tee_object **object, unsigne=
d int object_id)
> +{
> +       struct qcom_tee_object *qto;
> +       int ret =3D 0;
> +
> +       switch (qcom_tee_object_type(object_id)) {
> +       case QCOM_TEE_OBJECT_TYPE_NULL:
> +               *object =3D NULL_QCOM_TEE_OBJECT;
> +
> +               break;
> +       case QCOM_TEE_OBJECT_TYPE_CB_OBJECT:
> +               qto =3D qcom_tee_local_object_get(object_id);
> +               if (qto !=3D NULL_QCOM_TEE_OBJECT)
> +                       *object =3D qto;
> +               else
> +                       ret =3D -EINVAL;
> +
> +               break;
> +       case QCOM_TEE_OBJECT_TYPE_TEE:
> +               qto =3D qcom_tee_object_alloc();
> +               if (qto) {
> +                       /* If failed, "no-name"; it is not really a reaso=
n to fail here. */
> +                       qto->name =3D kasprintf(GFP_KERNEL, "qcom_tee-%u"=
, object_id);
> +                       QCOM_TEE_OBJECT_SET(qto, QCOM_TEE_OBJECT_TYPE_TEE=
, object_id);
> +
> +                       *object =3D qto;
> +               } else {
> +                       ret =3D -ENOMEM;
> +               }
> +
> +               break;
> +       default:
> +
> +               break;
> +       }
> +
> +       if (ret)
> +               *object =3D NULL_QCOM_TEE_OBJECT;
> +
> +       return ret;
> +}
> +
> +/* Marshaling API. */
> +/* qcom_tee_prepare_msg  - Prepares inbound buffer for sending to QTEE
> + * qcom_tee_update_args  - Parses QTEE response in inbound buffer
> + * qcom_tee_prepare_args - Parses QTEE request from outbound buffer
> + * qcom_tee_update_msg   - Updates outbound buffer with response for QTE=
E request
> + */

Please combine the two comments into one.

> +
> +static int qcom_tee_prepare_msg(struct qcom_tee_object_invoke_ctx *oic,
> +                               struct qcom_tee_object *object, u32 op, s=
truct qcom_tee_arg *u)
> +{
> +       struct qcom_tee_msg_object_invoke *msg;
> +       unsigned int object_id;
> +       int ib, ob, io, oo;
> +       size_t off;
> +       int i;
> +
> +       /* Use input message buffer in 'oic'. */
> +       msg =3D (struct qcom_tee_msg_object_invoke *)oic->in_msg.addr;
> +
> +       /* Start offset in a message for buffer arguments. */
> +       off =3D qcom_tee_msg_buffer_args(struct qcom_tee_msg_object_invok=
e, qcom_tee_args_len(u));
> +
> +       /* Get id of object being invoked. */
> +       if (qcom_tee_object_id_get(object, &object_id))
> +               return -ENOSPC;
> +
> +       ib =3D 0;
> +       qcom_tee_arg_for_each_input_buffer(i, u) {
> +               void *ptr;
> +
> +               /* qcom_tee_msg_buffers_alloc() already checked overflow =
in message! */
> +               msg->args[ib].b.offset =3D off;
> +               msg->args[ib].b.size =3D u[i].b.size;
> +
> +               ptr =3D qcom_tee_msg_offset_to_ptr(msg, off);
> +               if (!(u[i].flags & QCOM_TEE_ARG_FLAGS_UADDR))
> +                       memcpy(ptr, u[i].b.addr, u[i].b.size);
> +               else if (copy_from_user(ptr, u[i].b.uaddr, u[i].b.size))
> +                       return -EINVAL;
> +
> +               off +=3D qcom_tee_msg_offset_align(u[i].b.size);
> +               ib++;
> +       }
> +
> +       ob =3D ib;
> +       qcom_tee_arg_for_each_output_buffer(i, u) {
> +               /* qcom_tee_msg_buffers_alloc() already checked overflow =
in message! */
> +               msg->args[ob].b.offset =3D off;
> +               msg->args[ob].b.size =3D u[i].b.size;
> +
> +               off +=3D qcom_tee_msg_offset_align(u[i].b.size);
> +               ob++;
> +       }
> +
> +       io =3D ob;
> +       qcom_tee_arg_for_each_input_object(i, u) {
> +               if (qcom_tee_object_id_get(u[i].o, &msg->args[io].o)) {
> +                       /* Unable to qcom_tee_object_id_get; put whatever=
 we got. */
> +                       qcom_tee_object_id_put(object_id);
> +                       for (--io; io >=3D ob; io--)

Please avoid the prefix increment or decrement operator and use the
postfix increment or decrement unless there's no other option (use
io-- instead of --io). This comment applies to the entire patch set.

> +                               qcom_tee_object_id_put(msg->args[io].o);
> +
> +                       return -ENOSPC;
> +               }
> +
> +               io++;
> +       }
> +
> +       oo =3D io;
> +       qcom_tee_arg_for_each_output_object(i, u)
> +               oo++;
> +
> +       /* Set object, operation, and argument counts. */
count

> +       qcom_tee_msg_init(msg, object_id, op, ib, ob, io, oo);
> +
> +       return 0;
> +}
> +
> +static int qcom_tee_update_args(struct qcom_tee_arg *u, struct qcom_tee_=
object_invoke_ctx *oic)
> +{
> +       struct qcom_tee_msg_object_invoke *msg;
> +       int ib, ob, io, oo;
> +       int i, ret =3D 0;
> +
> +       /* Use input message buffer in 'oic'. */
> +       msg =3D (struct qcom_tee_msg_object_invoke *)oic->in_msg.addr;
> +
> +       ib =3D 0;
> +       qcom_tee_arg_for_each_input_buffer(i, u)
> +               ib++;
> +
> +       ob =3D ib;
> +       qcom_tee_arg_for_each_output_buffer(i, u) {
> +               void *ptr =3D qcom_tee_msg_offset_to_ptr(msg, msg->args[o=
b].b.offset);
> +
> +               if (!(u[i].flags & QCOM_TEE_ARG_FLAGS_UADDR)) {
> +                       memcpy(u[i].b.addr, ptr, msg->args[ob].b.size);
> +               } else if (copy_to_user(u[i].b.uaddr, ptr, msg->args[ob].=
b.size)) {
> +                       /* On ERROR, continue to process arguments to get=
 to output object. */
> +                       ret =3D -EINVAL;
> +               }
> +
> +               u[i].b.size =3D msg->args[ob].b.size;
> +               ob++;
> +       }
> +
> +       io =3D ob;
> +       qcom_tee_arg_for_each_input_object(i, u)
> +               io++;
> +
> +       oo =3D io;
> +       qcom_tee_arg_for_each_output_object(i, u) {
> +               int err;
> +
> +               /* On ERROR, continue to process arguments so that we can=
 issue the RELEASE. */
> +               err =3D qcom_tee_object_init(&u[i].o, msg->args[oo].o);
> +               if (err)
> +                       ret =3D err;
> +
> +               oo++;
> +       }
> +
> +       return ret;
> +}
> +
> +static int qcom_tee_prepare_args(struct qcom_tee_object_invoke_ctx *oic)
> +{
> +       int i, ret =3D 0;
> +
> +       /* Use output message buffer in 'oic'. */
> +       struct qcom_tee_msg_callback *msg =3D (struct qcom_tee_msg_callba=
ck *)oic->out_msg.addr;
> +
> +       qcom_tee_msg_for_each_input_buffer(i, msg) {
> +               oic->u[i].b.addr =3D qcom_tee_msg_offset_to_ptr(msg, msg-=
>args[i].b.offset);
> +               oic->u[i].b.size =3D msg->args[i].b.size;
> +               oic->u[i].type =3D QCOM_TEE_ARG_TYPE_IB;
> +       }
> +
> +       qcom_tee_msg_for_each_output_buffer(i, msg) {
> +               oic->u[i].b.addr =3D qcom_tee_msg_offset_to_ptr(msg, msg-=
>args[i].b.offset);
> +               oic->u[i].b.size =3D msg->args[i].b.size;
> +               oic->u[i].type =3D QCOM_TEE_ARG_TYPE_OB;
> +       }
> +
> +       qcom_tee_msg_for_each_input_object(i, msg) {
> +               int err;
> +
> +               /* On ERROR, continue to process arguments so that we can=
 issue the RELEASE. */
> +               err =3D qcom_tee_object_init(&oic->u[i].o, msg->args[i].o=
);
> +               if (err)
> +                       ret =3D err;
> +
> +               oic->u[i].type =3D QCOM_TEE_ARG_TYPE_IO;
> +       }
> +
> +       qcom_tee_msg_for_each_output_object(i, msg)
> +               oic->u[i].type =3D QCOM_TEE_ARG_TYPE_OO;
> +
> +       /* End of Arguments. */
> +       oic->u[i].type =3D QCOM_TEE_ARG_TYPE_INV;
> +
> +       return ret;
> +}
> +
> +static int qcom_tee_update_msg(struct qcom_tee_object_invoke_ctx *oic)
> +{
> +       int ib, ob, io, oo;
> +       int i;
> +
> +       /* Use output message buffer in 'oic'. */
> +       struct qcom_tee_msg_callback *msg =3D (struct qcom_tee_msg_callba=
ck *)oic->out_msg.addr;
> +
> +       ib =3D 0;
> +       qcom_tee_arg_for_each_input_buffer(i, oic->u)
> +               ib++;
> +
> +       ob =3D ib;
> +       qcom_tee_arg_for_each_output_buffer(i, oic->u) {
> +               /* Only reduce size; never increase it. */
> +               if (msg->args[ob].b.size < oic->u[i].b.size)
> +                       return -EINVAL;
> +
> +               msg->args[ob].b.size =3D oic->u[i].b.size;
> +               ob++;
> +       }
> +
> +       io =3D ob;
> +       qcom_tee_arg_for_each_input_object(i, oic->u)
> +               io++;
> +
> +       oo =3D io;
> +       qcom_tee_arg_for_each_output_object(i, oic->u) {
> +               if (qcom_tee_object_id_get(oic->u[i].o, &msg->args[oo].o)=
) {
> +                       /* Unable to qcom_tee_object_id_get; put whatever=
 we got. */
> +                       for (--oo; oo >=3D io; --oo)
> +                               qcom_tee_object_id_put(msg->args[oo].o);
> +
> +                       return -ENOSPC;
> +               }
> +
> +               oo++;
> +       }
> +
> +       return 0;
> +}
> +
> +/**
> + * define MAX_BUFFER_SIZE - Maximum size of inbound and outbound buffers=
.
> + *
> + * QTEE transport does not impose any restriction on these buffers. Howe=
ver, if size of
> + * buffers are larger then %MAX_BUFFER_SIZE, user should probably use so=
me other
> + * form of shared memory with QTEE.
> + */
> +#define MAX_BUFFER_SIZE SZ_8K
> +
> +/* Pool to allocate inbound and outbound buffers. */
> +static struct qcom_tzmem_pool */;
> +
> +static int qcom_tee_msg_buffers_alloc(struct qcom_tee_object_invoke_ctx =
*oic,
> +                                     struct qcom_tee_arg *u)
> +{
> +       size_t size;
> +       int i;
> +
> +       /* Start offset in a message for buffer arguments. */
> +       size =3D qcom_tee_msg_buffer_args(struct qcom_tee_msg_object_invo=
ke, qcom_tee_args_len(u));
> +       if (size > MAX_BUFFER_SIZE)
> +               return -EINVAL;
> +
> +       /* Add size of IB arguments. */
> +       qcom_tee_arg_for_each_input_buffer(i, u) {
> +               size =3D size_add(size, qcom_tee_msg_offset_align(u[i].b.=
size));
> +               if (size > MAX_BUFFER_SIZE)
> +                       return -EINVAL;
> +       }
> +
> +       /* Add size of OB arguments. */
> +       qcom_tee_arg_for_each_output_buffer(i, u) {
> +               size =3D size_add(size, qcom_tee_msg_offset_align(u[i].b.=
size));
> +               if (size > MAX_BUFFER_SIZE)
> +                       return -EINVAL;
> +       }
> +
> +       /* QTEE requires inbound buffer size to be page aligned. */
> +       size =3D PAGE_ALIGN(size);
> +
> +       /* Do allocations. */
> +       oic->in_msg.size =3D size;
> +       oic->in_msg.addr =3D qcom_tzmem_alloc(tzmem_msg_pool, size, GFP_K=
ERNEL);
> +       if (!oic->in_msg.addr)
> +               return -EINVAL;
> +
> +       oic->out_msg.size =3D MAX_BUFFER_SIZE;
> +       oic->out_msg.addr =3D qcom_tzmem_alloc(tzmem_msg_pool, MAX_BUFFER=
_SIZE, GFP_KERNEL);
> +       if (!oic->out_msg.addr) {
> +               qcom_tzmem_free(oic->in_msg.addr);
> +
> +               return -EINVAL;
> +       }
> +
> +       oic->in_msg_paddr =3D qcom_tzmem_to_phys(oic->in_msg.addr);
> +       oic->out_msg_paddr =3D qcom_tzmem_to_phys(oic->out_msg.addr);
> +
> +       /* QTEE assume unused buffers are zeroed; Do it now! */
> +       memzero_explicit(oic->in_msg.addr, oic->in_msg.size);
> +       memzero_explicit(oic->out_msg.addr, oic->out_msg.size);
> +
> +       return 0;
> +}
> +
> +static void qcom_tee_msg_buffers_free(struct qcom_tee_object_invoke_ctx =
*oic)
> +{
> +       qcom_tzmem_free(oic->in_msg.addr);
> +       qcom_tzmem_free(oic->out_msg.addr);
> +}
> +
> +static int qcom_tee_msg_buffers_init(void)
> +{
> +       struct qcom_tzmem_pool_config config =3D {
> +               .policy =3D QCOM_TZMEM_POLICY_ON_DEMAND,
> +               /* 4M seems enough, it is used for QTEE meg header and qc=
om_tee_msg_arg array. */
> +               .max_size =3D SZ_4M
> +       };
> +
> +       tzmem_msg_pool =3D qcom_tzmem_pool_new(&config);
> +       if (IS_ERR(tzmem_msg_pool))
> +               return PTR_ERR(tzmem_msg_pool);
> +
> +       return 0;
> +}
> +
> +static void qcom_tee_msg_buffers_destroy(void)
> +{
> +       qcom_tzmem_pool_free(tzmem_msg_pool);

Can tzmem_msg_pool become a dangling pointer if the driver is unbound?

> +}
> +
> +/* Invoke a REE object. */
> +static void qcom_tee_object_invoke(struct qcom_tee_object_invoke_ctx *oi=
c,
> +                                  struct qcom_tee_msg_callback *msg)
> +{
> +       int i, errno;
> +       u32 op;
> +
> +       /* Get object being invoked. */
> +       unsigned int object_id =3D msg->cxt;
> +       struct qcom_tee_object *object;
> +
> +       /* QTEE can not invoke NULL object or objects it hosts. */
> +       if (qcom_tee_object_type(object_id) =3D=3D QCOM_TEE_OBJECT_TYPE_N=
ULL ||
> +           qcom_tee_object_type(object_id) =3D=3D QCOM_TEE_OBJECT_TYPE_T=
EE) {
> +               errno =3D -EINVAL;
> +               goto out;
> +       }
> +
> +       object =3D qcom_tee_local_object_get(object_id);
> +       if (object =3D=3D NULL_QCOM_TEE_OBJECT) {
> +               errno =3D -EINVAL;
> +               goto out;
> +       }
> +
> +       oic->object =3D object;
> +
> +       /* Filter bits used by transport. */
> +       op =3D msg->op & QCOM_TEE_MSG_OBJECT_OP_MASK;
> +
> +       switch (op) {
> +       case QCOM_TEE_MSG_OBJECT_OP_RELEASE:
> +               qcom_tee_object_id_put(object_id);
> +               qcom_tee_object_put(object);
> +               errno =3D 0;
> +
> +               break;
> +       case QCOM_TEE_MSG_OBJECT_OP_RETAIN:
> +               qcom_tee_object_get(object);
> +               errno =3D 0;
> +
> +               break;
> +       default:
> +               errno =3D qcom_tee_prepare_args(oic);
> +               if (errno) {
> +                       /* Unable to parse the message. Release any objec=
t arrived as input. */
that arrived

> +                       qcom_tee_arg_for_each_input_buffer(i, oic->u)
> +                               qcom_tee_object_put(oic->u[i].o);
> +
> +                       break;
> +               }
> +
> +               errno =3D object->ops->dispatch(oic, object, op, oic->u);
> +               if (!errno) {
> +                       /* On SUCCESS, notify object at appropriate time.=
 */
> +                       oic->flags |=3D QCOM_TEE_OIC_FLAG_NOTIFY;
> +               }
> +       }
> +
> +out:
> +
> +       oic->errno =3D errno;
> +}
> +
> +/**
> + * __qcom_tee_object_do_invoke() - Submit an invocation for an object.
> + * @oic: context to use for current invocation.
> + * @object: object being invoked.
> + * @op: requested operation on object.
> + * @u: array of argument for the current invocation.
arguments

> + * @result: result returned from QTEE.
> + *
> + * The caller is responsible to keep track of the refcount for each obje=
ct,
> + * including @object. On return, the caller loses the ownership of all i=
nput
> + * object of type %QCOM_TEE_OBJECT_TYPE_CB_OBJECT.
> + *
> + * Return: On success return 0. On error returns -EINVAL and -ENOSPC if =
unable to initiate
> + * the invocation, -EAGAIN if invocation failed and user may retry the i=
nvocation.
> + * Otherwise, -ENODEV on fatal failure.
> + */
> +int __qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
> +                               struct qcom_tee_object *object, u32 op, s=
truct qcom_tee_arg *u,
> +                               int *result)
> +{
> +       struct qcom_tee_msg_callback *cb_msg;
> +       u64 response_type;
> +       int i, ret, errno;
> +
> +       ret =3D qcom_tee_msg_buffers_alloc(oic, u);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D qcom_tee_prepare_msg(oic, object, op, u);
> +       if (ret)
> +               goto out;
> +
> +       cb_msg =3D (struct qcom_tee_msg_callback *)oic->out_msg.addr;
> +
> +       while (1) {
> +               if (oic->flags & QCOM_TEE_OIC_FLAG_BUSY) {
> +                       errno =3D oic->errno;
> +                       /* Update output buffer only if result is SUCCESS=
. */
> +                       if (!errno)
> +                               errno =3D qcom_tee_update_msg(oic);
> +
> +                       qcom_tee_msg_translate_err(cb_msg, errno);
> +               }
> +
> +               /* Invoke remote object. */
> +               ret =3D qcom_tee_object_invoke_ctx_invoke(oic, result, &r=
esponse_type);
> +
> +               if (oic->flags & QCOM_TEE_OIC_FLAG_BUSY) {
> +                       struct qcom_tee_object *qto =3D oic->object;
> +
> +                       if (qto) {
> +                               if (oic->flags & QCOM_TEE_OIC_FLAG_NOTIFY=
) {
> +                                       if (qto->ops->notify)
> +                                               qto->ops->notify(oic, qto=
, errno || ret);
> +                               }
> +
> +                               /* Matching get is in qcom_tee_object_inv=
oke. */
> +                               qcom_tee_object_put(qto);
> +                       }
> +
> +                       oic->object =3D NULL_QCOM_TEE_OBJECT;
> +                       oic->flags &=3D ~(QCOM_TEE_OIC_FLAG_BUSY | QCOM_T=
EE_OIC_FLAG_NOTIFY);
> +               }
> +
> +               if (ret) {
> +                       if (!(oic->flags & QCOM_TEE_OIC_FLAG_SHARED)) {
> +                               /* Release QCOM_TEE_OBJECT_TYPE_CB_OBJECT=
 input objects. */
> +                               qcom_tee_arg_for_each_input_object(i, u)
> +                                       if (typeof_qcom_tee_object(u[i].o=
) =3D=3D
> +                                               QCOM_TEE_OBJECT_TYPE_CB_O=
BJECT)
> +                                               qcom_tee_object_put(u[i].=
o);
> +
> +                               ret =3D -EAGAIN;
> +                       } else {
> +                               /* On error, there is no clean way to exi=
t. */
> +                               /* For some reason we can not communicate=
 with QTEE, so we can not
> +                                * notify QTEE about the failure and do f=
urther cleanup.
> +                                */
> +                               ret =3D -ENODEV;
> +                       }
> +
> +                       goto out;
> +
> +               } else {
> +                       /* QTEE obtained the ownership of QCOM_TEE_OBJECT=
_TYPE_CB_OBJECT
> +                        * input objects in 'u'. On further failure, QTEE=
 is responsible
> +                        * to release them.
> +                        */
> +                       oic->flags |=3D QCOM_TEE_OIC_FLAG_SHARED;
> +               }
> +
> +               /* Is it a callback request? */
> +#define QCOM_TEE_RESULT_INBOUND_REQ_NEEDED 3
This must be part of the ABI to the secure world. How about keeping
all those defines in a central place?

> +               if (response_type !=3D QCOM_TEE_RESULT_INBOUND_REQ_NEEDED=
) {
> +                       if (!*result) {
> +                               ret =3D qcom_tee_update_args(u, oic);
> +                               if (ret) {
> +                                       qcom_tee_arg_for_each_output_obje=
ct(i, u)
> +                                               qcom_tee_object_put(u[i].=
o);
> +
> +                                       ret =3D -EAGAIN;
> +                               }
> +                       }
> +
> +                       break;
> +
> +               } else {
> +                       oic->flags |=3D QCOM_TEE_OIC_FLAG_BUSY;
> +                       /* Before dispatching the request, handle any pen=
ding async requests. */
> +                       qcom_tee_fetch_async_reqs(oic);
> +                       qcom_tee_object_invoke(oic, cb_msg);
This looks like a recursion. Is there a limit on how deep it can become?

> +               }
> +       }
> +
> +       qcom_tee_fetch_async_reqs(oic);
> +
> +out:
> +       qcom_tee_msg_buffers_free(oic);
> +
> +       return ret;
> +}
> +
> +int qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
> +                             struct qcom_tee_object *object, u32 op, str=
uct qcom_tee_arg *u,
> +                             int *result)
> +{
> +       /* User can not set bits used by transport. */
> +       if (op & ~QCOM_TEE_MSG_OBJECT_OP_MASK)
> +               return -EINVAL;
> +
> +       /* User can only invoke QTEE hosted objects. */
> +       if (typeof_qcom_tee_object(object) !=3D QCOM_TEE_OBJECT_TYPE_TEE =
&&
> +           typeof_qcom_tee_object(object) !=3D QCOM_TEE_OBJECT_TYPE_ROOT=
)
> +               return -EINVAL;
> +
> +       /* User can not issue reserved operations to QTEE. */
> +       if (op =3D=3D QCOM_TEE_MSG_OBJECT_OP_RELEASE || op =3D=3D QCOM_TE=
E_MSG_OBJECT_OP_RETAIN)
> +               return -EINVAL;
> +
> +       return  __qcom_tee_object_do_invoke(oic, object, op, u, result);
> +}
> +EXPORT_SYMBOL_GPL(qcom_tee_object_do_invoke);
> +
> +/* Dump object table. */
> +static ssize_t qcom_tee_object_table_show(struct kobject *kobj,
> +                                         struct kobj_attribute *attr, ch=
ar *buf)
> +{
> +       struct qcom_tee_object *object;
> +       unsigned long idx;
> +       size_t len =3D 0;
> +
> +       xa_for_each_start(&xa_qcom_local_objects, idx, object, QCOM_TEE_O=
BJECT_ID_START) {
> +               len +=3D sysfs_emit_at(buf, len, "%4lx %4d %s\n", idx,
> +                                    kref_read(&object->refcount),
> +                                    qcom_tee_object_name(object));
> +       }
> +
> +       return len;
> +}
> +
> +static struct kobj_attribute object_table =3D __ATTR_RO(qcom_tee_object_=
table);
> +static struct kobj_attribute release =3D __ATTR_RO(qcom_tee_release_wq);
> +static struct attribute *attrs[] =3D {
> +       &object_table.attr,
> +       &release.attr,
> +       NULL
> +};
> +
> +static struct attribute_group attr_group =3D {
> +       .attrs =3D attrs,
> +};
> +
> +static struct kobject *qcom_tee_object_invoke_kobj;
> +static int __init qcom_tee_object_invoke_init(void)
> +{
> +       int ret;
> +
> +       ret =3D qcom_tee_release_init();
> +       if (ret)
> +               return ret;
> +
> +       ret =3D qcom_tee_msg_buffers_init();
> +       if (ret)
> +               goto err_release_destroy;
> +
> +       /* Create '/sys/firmware/qcom_tee'. */
> +       qcom_tee_object_invoke_kobj =3D kobject_create_and_add("qcom_tee"=
, firmware_kobj);
I'd expect TEE drivers to keep their stuff under /sys/class/tee/tee*/

> +       if (!qcom_tee_object_invoke_kobj) {
> +               ret =3D -ENOMEM;
> +
> +               goto err_msg_buffers_destroy;
> +       }
> +
> +       /* Create 'qcom_tee_object_table' and 'qcom_tee_release_wq'. */
> +       ret =3D sysfs_create_group(qcom_tee_object_invoke_kobj, &attr_gro=
up);
> +       if (ret)
> +               goto err_kobject_put;
> +
> +       return 0;
> +
> +err_kobject_put:
> +       /* Remove '/sys/firmware/qcom_tee'. */
> +       kobject_put(qcom_tee_object_invoke_kobj);
> +err_msg_buffers_destroy:
> +       qcom_tee_msg_buffers_destroy();
> +err_release_destroy:
> +       qcom_tee_release_destroy();
> +
> +       return ret;
> +}
> +module_init(qcom_tee_object_invoke_init);

The other TEE drivers do most of the initialization work in the probe
function and only the bare minimum for the probe function to be called
before. Wouldn't it make sense to try to use the same pattern in this
driver? It helps when trying to understand the driver, and perhaps a
few bugs can be avoided too when following an established pattern.

> +
> +static void __exit qcom_tee_object_invoke_deinit(void)
> +{
> +       /* Wait for RELEASE operations for QTEE objects. */
> +       qcom_tee_release_destroy();
> +       qcom_tee_msg_buffers_destroy();
> +       sysfs_remove_group(qcom_tee_object_invoke_kobj, &attr_group);
> +       kobject_put(qcom_tee_object_invoke_kobj);
> +}
> +module_exit(qcom_tee_object_invoke_deinit);
> +
> +MODULE_AUTHOR("Qualcomm");
> +MODULE_DESCRIPTION("QTEE driver");
> +MODULE_VERSION("1.0");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/tee/qcomtee/qcom_scm.c b/drivers/tee/qcomtee/qcom_sc=
m.c
> new file mode 100644
> index 000000000000..230faf249095
> --- /dev/null
> +++ b/drivers/tee/qcomtee/qcom_scm.c
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#include <linux/firmware/qcom/qcom_scm.h>
> +
> +#include "qcomtee_private.h"
> +
> +int qcom_tee_object_invoke_ctx_invoke(struct qcom_tee_object_invoke_ctx =
*oic,
> +                                     int *result, u64 *response_type)
> +{
> +       int ret;
> +       u64 res;
> +
> +       if (!(oic->flags & QCOM_TEE_OIC_FLAG_BUSY)) {
> +               /* Direct QTEE object invocation. */
> +               ret =3D qcom_scm_qtee_invoke_smc(oic->in_msg_paddr,
> +                                              oic->in_msg.size,
> +                                              oic->out_msg_paddr,
> +                                              oic->out_msg.size,
> +                                              &res, response_type, NULL)=
;
> +       } else {
> +               /* Submit callback response. */
> +               ret =3D qcom_scm_qtee_callback_response(oic->out_msg_padd=
r,
> +                                                     oic->out_msg.size,
> +                                                     &res, response_type=
, NULL);
> +       }
> +
> +       if (ret)
> +               pr_err("QTEE returned with %d.\n", ret);
> +       else
> +               *result =3D (int)res;
> +
> +       return ret;
> +}
> diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcom=
tee_msg.h
> new file mode 100644
> index 000000000000..7c968834ec9d
> --- /dev/null
> +++ b/drivers/tee/qcomtee/qcomtee_msg.h
> @@ -0,0 +1,217 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#ifndef QCOMTEE_MSG_H
> +#define QCOMTEE_MSG_H
> +
> +#include <linux/firmware/qcom/qcom_tee.h>
> +
> +/**
> + * DOC: ''Qualcomm TEE'' (QTEE) Transport Message
> + *
> + * There are two buffers shared with QTEE, inbound and outbound buffers.
> + * The inbound buffer is used for direct object invocation and the outbo=
und buffer is
> + * used to make a request from QTEE to kernel, i.e. callback request.
> + *
> + * The unused tail of the outbound buffer is also used for sending and r=
eceiving
> + * asynchronous messages. An asynchronous message is independent from th=
e current
> + * object invocation (i.e. contents of the inbound buffer) or callback r=
equest
> + * (i.e. the head of the outbound buffer), see qcom_tee_get_async_buffer=
(). It is
> + * used by endpoints (QTEE or kernel) as an optimization to reduce numbe=
r of context
> + * switches between secure and non-secure world.
> + *
> + * For instance, QTEE never sends an explicit callback request to releas=
e an object in
> + * kernel. Instead, it sends asynchronous release messages in outbound b=
uffer when QTEE
> + * returns from previous direct object invocation, or append asynchronou=
s release
> + * messages after the current callback request.
> + *
> + * QTEE supports two types of arguments in a message: buffer and object =
arguments.
> + * Depending on the direction of data flow, they could be input buffer (=
IO) to QTEE,
> + * output buffer (OB) from QTEE, input object (IO) to QTEE, or output ob=
ject (OO) from
> + * QTEE. Object arguments hold object ids. Buffer arguments hold (offset=
, size) pairs
> + * into the inbound or outbound buffers.
> + *
> + * QTEE holds an object table for objects, it hosts and exposes to kerne=
l. An object id
> + * is an index to the object table in QTEE.
> + *
> + * For direct object invocation message format in inbound buffer see
> + * &struct qcom_tee_msg_object_invoke. For callback request message form=
at in outbound
> + * buffer see &struct qcom_tee_msg_callback. For the message format for =
asynchronous message
> + * in outbound buffer see &struct qcom_tee_async_msg_hdr.
> + */
> +
> +/**
> + * define QCOM_TEE_MSG_OBJECT_NS_BIT - Non-secure bit
> + *
> + * Object id is a globally unique 32-bit number. Ids referencing objects=
 in kernel should
> + * have %QCOM_TEE_MSG_OBJECT_NS_BIT set.
> + */
> +#define QCOM_TEE_MSG_OBJECT_NS_BIT BIT(31)
> +
> +/* Static object ids recognized by QTEE. */
> +#define QCOM_TEE_MSG_OBJECT_NULL (0U)
> +#define QCOM_TEE_MSG_OBJECT_ROOT (1U)
> +
> +/* Definitions from QTEE as part of the transport protocol. */
> +
> +/* qcom_tee_msg_arg is argument as recognized by QTEE. */
> +union qcom_tee_msg_arg {
> +       struct {
> +               u32 offset;
> +               u32 size;
> +       } b;
> +       u32 o;
> +};
> +
> +/* BI and BO payloads in a QTEE messages should be at 64-bit boundaries.=
 */
> +#define qcom_tee_msg_offset_align(o) ALIGN((o), sizeof(u64))
> +
> +/* Operation for objects is 32-bit. Transport uses upper 16-bits interna=
lly. */
> +#define QCOM_TEE_MSG_OBJECT_OP_MASK 0x0000FFFFU
GENMASK()?

Cheers,
Jens

> +
> +/* Reserved Operation IDs sent to QTEE: */
> +/* QCOM_TEE_MSG_OBJECT_OP_RELEASE - Reduces the refcount and releases th=
e object.
> + * QCOM_TEE_MSG_OBJECT_OP_RETAIN  - Increases the refcount.
> + *
> + * These operation id are valid for all objects. They are not available =
outside of this
> + * driver. Developers should use qcom_tee_object_get() and qcom_tee_obje=
ct_put(), to
> + * achieve the same.
> + */
> +
> +#define QCOM_TEE_MSG_OBJECT_OP_RELEASE (QCOM_TEE_MSG_OBJECT_OP_MASK - 0)
> +#define QCOM_TEE_MSG_OBJECT_OP_RETAIN  (QCOM_TEE_MSG_OBJECT_OP_MASK - 1)
> +
> +/**
> + * struct qcom_tee_msg_object_invoke - Direct object invocation message
> + * @ctx: object id hosted in QTEE
> + * @op: operation for the object
> + * @counts: number of different type of arguments in @args
> + * @args: array of arguments
> + *
> + * @counts consists of 4 * 4-bits felids. Bits 0 - 3, is number of input=
 buffers,
> + * bits 4 - 7, is number of output buffers, bits 8 - 11, is number of in=
put objects,
> + * and bits 12 - 15, is number of output objects. Remaining bits should =
be zero.
> + *
> + * Maximum number of arguments of each type is defined by %QCOM_TEE_ARGS=
_PER_TYPE.
> + */
> +struct qcom_tee_msg_object_invoke {
> +       u32 cxt;
> +       u32 op;
> +       u32 counts;
> +       union qcom_tee_msg_arg args[];
> +};
> +
> +/**
> + * struct qcom_tee_msg_callback - Callback request message
> + * @result: result of operation @op on object referenced by @cxt
> + * @cxt: object id hosted in kernel
> + * @op: operation for the object
> + * @counts: number of different type of arguments in @args
> + * @args: array of arguments
> + *
> + * For details of @counts, see &qcom_tee_msg_object_invoke.counts.
> + */
> +struct qcom_tee_msg_callback {
> +       u32 result;
> +       u32 cxt;
> +       u32 op;
> +       u32 counts;
> +       union qcom_tee_msg_arg args[];
> +};
> +
> +/* Offset in the message for the beginning of buffer argument's contents=
. */
> +#define qcom_tee_msg_buffer_args(t, n) \
> +       qcom_tee_msg_offset_align(struct_size_t(t, args, n))
> +/* Pointer to the beginning of a buffer argument's content at an offset =
in a message. */
> +#define qcom_tee_msg_offset_to_ptr(m, off) ((void *)&((char *)(m))[(off)=
])
> +
> +/* Some helpers to manage msg.counts. */
> +
> +#define QCOM_TEE_MSG_NUM_IB(x) ((x) & 0xfU)
> +#define QCOM_TEE_MSG_NUM_OB(x) (((x) >> 4) & 0xfU)
> +#define QCOM_TEE_MSG_NUM_IO(x) (((x) >> 8) & 0xfU)
> +#define QCOM_TEE_MSG_NUM_OO(x) (((x) >> 12) & 0xfU)
> +
> +#define QCOM_TEE_MSG_IDX_IB(x) (0U)
> +#define QCOM_TEE_MSG_IDX_OB(x) (QCOM_TEE_MSG_IDX_IB(x) + QCOM_TEE_MSG_NU=
M_IB(x))
> +#define QCOM_TEE_MSG_IDX_IO(x) (QCOM_TEE_MSG_IDX_OB(x) + QCOM_TEE_MSG_NU=
M_OB(x))
> +#define QCOM_TEE_MSG_IDX_OO(x) (QCOM_TEE_MSG_IDX_IO(x) + QCOM_TEE_MSG_NU=
M_IO(x))
> +
> +#define qcom_tee_msg_for_each(i, c, type)      \
> +       for (i =3D QCOM_TEE_MSG_IDX_##type(c);    \
> +            i < (QCOM_TEE_MSG_IDX_##type(c) + QCOM_TEE_MSG_NUM_##type(c)=
); \
> +            i++)
> +
> +#define qcom_tee_msg_for_each_input_buffer(i, m)  qcom_tee_msg_for_each(=
i, (m)->counts, IB)
> +#define qcom_tee_msg_for_each_output_buffer(i, m) qcom_tee_msg_for_each(=
i, (m)->counts, OB)
> +#define qcom_tee_msg_for_each_input_object(i, m)  qcom_tee_msg_for_each(=
i, (m)->counts, IO)
> +#define qcom_tee_msg_for_each_output_object(i, m) qcom_tee_msg_for_each(=
i, (m)->counts, OO)
> +
> +/* Sum of arguments in a message. */
> +#define qcom_tee_msg_args(m) (QCOM_TEE_MSG_IDX_OO((m)->counts) + QCOM_TE=
E_MSG_NUM_OO((m)->counts))
> +
> +static inline void qcom_tee_msg_init(struct qcom_tee_msg_object_invoke *=
msg, u32 cxt, u32 op,
> +                                    int in_buffer, int out_buffer, int i=
n_object, int out_object)
> +{
> +       msg->counts |=3D (in_buffer & 0xfU);
> +       msg->counts |=3D ((out_buffer - in_buffer) & 0xfU) << 4;
> +       msg->counts |=3D ((in_object - out_buffer) & 0xfU) << 8;
> +       msg->counts |=3D ((out_object - in_object) & 0xfU) << 12;
> +       msg->cxt =3D cxt;
> +       msg->op =3D op;
> +}
> +
> +/* Generic error codes. */
> +#define QCOM_TEE_MSG_OK                        0       /* non-specific s=
uccess code. */
> +#define QCOM_TEE_MSG_ERROR             1       /* non-specific error. */
> +#define QCOM_TEE_MSG_ERROR_INVALID     2       /* unsupported/unrecogniz=
ed request. */
> +#define QCOM_TEE_MSG_ERROR_SIZE_IN     3       /* supplied buffer/string=
 too large. */
> +#define QCOM_TEE_MSG_ERROR_SIZE_OUT    4       /* supplied output buffer=
 too small. */
> +#define QCOM_TEE_MSG_ERROR_USERBASE    10      /* start of user-defined =
error range. */
> +
> +/* Transport layer error codes. */
> +#define QCOM_TEE_MSG_ERROR_DEFUNCT     -90     /* object no longer exist=
s. */
> +#define QCOM_TEE_MSG_ERROR_ABORT       -91     /* calling thread must ex=
it. */
> +#define QCOM_TEE_MSG_ERROR_BADOBJ      -92     /* invalid object context=
. */
> +#define QCOM_TEE_MSG_ERROR_NOSLOTS     -93     /* caller's object table =
full. */
> +#define QCOM_TEE_MSG_ERROR_MAXARGS     -94     /* too many args. */
> +#define QCOM_TEE_MSG_ERROR_MAXDATA     -95     /* buffers too large. */
> +#define QCOM_TEE_MSG_ERROR_UNAVAIL     -96     /* the request could not =
be processed. */
> +#define QCOM_TEE_MSG_ERROR_KMEM                -97     /* kernel out of =
memory. */
> +#define QCOM_TEE_MSG_ERROR_REMOTE      -98     /* local method sent to r=
emote object. */
> +#define QCOM_TEE_MSG_ERROR_BUSY                -99     /* Object is busy=
. */
> +#define QCOM_TEE_MSG_ERROR_TIMEOUT     -103    /* Call Back Object invoc=
ation timed out. */
> +
> +static inline void qcom_tee_msg_translate_err(struct qcom_tee_msg_callba=
ck *cb_msg, int err)
> +{
> +       if (!err) {
> +               cb_msg->result =3D QCOM_TEE_MSG_OK;
> +       } else if (err < 0) {
> +               /* If err < 0, then it is a transport error. */
> +               switch (err) {
> +               case -ENOMEM:
> +                       cb_msg->result =3D QCOM_TEE_MSG_ERROR_KMEM;
> +                       break;
> +               case -ENODEV:
> +                       cb_msg->result =3D QCOM_TEE_MSG_ERROR_DEFUNCT;
> +                       break;
> +               case -ENOSPC:
> +               case -EBUSY:
> +                       cb_msg->result =3D QCOM_TEE_MSG_ERROR_BUSY;
> +                       break;
> +               case -EBADF:
> +               case -EINVAL:
> +                       cb_msg->result =3D QCOM_TEE_MSG_ERROR_UNAVAIL;
> +                       break;
> +               default:
> +                       cb_msg->result =3D  QCOM_TEE_MSG_ERROR;
> +               }
> +       } else {
> +               /* If err > 0, then it is user defined error, pass it as =
is. */
> +               cb_msg->result =3D err;
> +       }
> +}
> +
> +#endif /* QCOMTEE_MSG_H */
> diff --git a/drivers/tee/qcomtee/qcomtee_private.h b/drivers/tee/qcomtee/=
qcomtee_private.h
> new file mode 100644
> index 000000000000..e3e4ef51c0b2
> --- /dev/null
> +++ b/drivers/tee/qcomtee/qcomtee_private.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#ifndef QCOM_TEE_PRIVATE_H
> +#define QCOM_TEE_PRIVATE_H
> +
> +#include <linux/firmware/qcom/qcom_tee.h>
> +#include <linux/kobject.h>
> +#include <linux/tee_core.h>
> +
> +struct qcom_tee_object *qcom_tee_idx_erase(u32 idx);
> +void qcom_tee_object_free(struct qcom_tee_object *object);
> +
> +/* Process async messages form QTEE. */
> +void qcom_tee_fetch_async_reqs(struct qcom_tee_object_invoke_ctx *oic);
> +
> +int qcom_tee_release_init(void);
> +void qcom_tee_release_destroy(void);
> +void qcom_tee_release_tee_object(struct qcom_tee_object *object);
> +ssize_t qcom_tee_release_wq_show(struct kobject *kobj, struct kobj_attri=
bute *attr, char *buf);
> +
> +/* SCM call. */
> +int qcom_tee_object_invoke_ctx_invoke(struct qcom_tee_object_invoke_ctx =
*oic,
> +                                     int *result, u64 *response_type);
> +
> +/**
> + * __qcom_tee_object_do_invoke() - Submit an invocation for an object.
> + * @oic: context to use for current invocation.
> + * @object: object being invoked.
> + * @op: requested operation on object.
> + * @u: array of argument for the current invocation.
> + * @result: result returned from QTEE.
> + *
> + * Same as qcom_tee_object_do_invoke() without @object and @op is 32-bit=
,
> + * upper 16-bits are for internal use.
> + *
> + * Return: On success return 0. On error returns -EINVAL and -ENOSPC if =
unable to initiate
> + * the invocation, -EAGAIN if invocation failed and user can retry the i=
nvocation.
> + * Otherwise, -ENODEV on fatal failure.
> + */
> +int __qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
> +                               struct qcom_tee_object *object, u32 op, s=
truct qcom_tee_arg *u,
> +                               int *result);
> +
> +#endif /* QCOM_TEE_PRIVATE_H */
> diff --git a/drivers/tee/qcomtee/release.c b/drivers/tee/qcomtee/release.=
c
> new file mode 100644
> index 000000000000..f2e048418e23
> --- /dev/null
> +++ b/drivers/tee/qcomtee/release.c
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#include "qcomtee_private.h"
> +#include "qcomtee_msg.h"
> +
> +static struct workqueue_struct *qcom_tee_release_wq;
> +
> +/* Number of all release requests pending for processing. */
> +static atomic_t qcom_tee_pending_releases =3D ATOMIC_INIT(0);
> +
> +/* qcom_tee_object_do_release makes direct object invocation to release =
an object. */
> +static void qcom_tee_destroy_user_object(struct work_struct *work)
> +{
> +       static struct qcom_tee_object_invoke_ctx oic;
> +       static struct qcom_tee_arg args[1] =3D { 0 };
> +       struct qcom_tee_object *object;
> +       int ret, result;
> +
> +       object =3D container_of(work, struct qcom_tee_object, work);
> +
> +       ret =3D __qcom_tee_object_do_invoke(&oic, object, QCOM_TEE_MSG_OB=
JECT_OP_RELEASE, args,
> +                                         &result);
> +
> +       /* Is it safe to retry the release? */
> +       if (ret =3D=3D -EAGAIN) {
> +               queue_work(qcom_tee_release_wq, &object->work);
> +       } else {
> +               if (ret || result)
> +                       pr_err("%s: %s release failed, ret =3D %d (%x).\n=
",
> +                              __func__, qcom_tee_object_name(object), re=
t, result);
> +
> +               atomic_dec(&qcom_tee_pending_releases);
> +               qcom_tee_object_free(object);
> +       }
> +}
> +
> +/* qcom_tee_release_tee_object puts object in release work queue. */
> +void qcom_tee_release_tee_object(struct qcom_tee_object *object)
> +{
> +       INIT_WORK(&object->work, qcom_tee_destroy_user_object);
> +       atomic_inc(&qcom_tee_pending_releases);
> +       queue_work(qcom_tee_release_wq, &object->work);
> +}
> +
> +ssize_t qcom_tee_release_wq_show(struct kobject *kobj, struct kobj_attri=
bute *attr, char *buf)
> +{
> +       return sysfs_emit(buf, "%d\n", atomic_read(&qcom_tee_pending_rele=
ases));
> +}
> +
> +int qcom_tee_release_init(void)
> +{
> +       qcom_tee_release_wq =3D alloc_ordered_workqueue("qcom_tee_release=
_wq", 0);
> +       if (!qcom_tee_release_wq)
> +               return -ENOMEM;
> +
> +       return 0;
> +}
> +
> +void qcom_tee_release_destroy(void)
> +{
> +       /* It drains the wq. */
> +       destroy_workqueue(qcom_tee_release_wq);
> +}
> diff --git a/include/linux/firmware/qcom/qcom_tee.h b/include/linux/firmw=
are/qcom/qcom_tee.h
> new file mode 100644
> index 000000000000..90e5e10a0e62
> --- /dev/null
> +++ b/include/linux/firmware/qcom/qcom_tee.h
> @@ -0,0 +1,284 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#ifndef __QCOM_TEE_H
> +#define __QCOM_TEE_H
> +
> +#include <linux/kref.h>
> +#include <linux/completion.h>
> +#include <linux/workqueue.h>
> +
> +struct qcom_tee_object;
> +
> +/**
> + * DOC: Overview
> + *
> + * qcom_tee_object provides object ref-counting, id allocation for objec=
ts hosted in
> + * REE, and necessary message marshaling for Qualcomm TEE (QTEE).
> + *
> + * To invoke an object in QTEE, user calls qcom_tee_object_do_invoke() w=
hile passing
> + * an instance of &struct qcom_tee_object and the requested operation + =
arguments.
> + *
> + * After the boot, QTEE provides a static object %ROOT_QCOM_TEE_OBJECT (=
type of
> + * %QCOM_TEE_OBJECT_TYPE_ROOT). The root object is invoked to pass user'=
s credentials and
> + * obtain other instances of &struct qcom_tee_object (type of %QCOM_TEE_=
OBJECT_TYPE_TEE)
> + * that represents services and TAs in QTEE, see &enum qcom_tee_object_t=
ype.
> + *
> + * The object received from QTEE are refcounted. So the owner of these o=
bjects can
> + * issue qcom_tee_object_get(), to increase the refcount, and pass objec=
ts to other
> + * clients, or issue qcom_tee_object_put() to decrease the refcount, and=
 releasing
> + * the resources in QTEE.
> + *
> + * REE can host services accessible to QTEE. A driver should embed an in=
stance of
> + * &struct qcom_tee_object in the struct it wants to export to QTEE (it =
is called
> + * callback object). It issues qcom_tee_object_user_init() to set the di=
spatch()
> + * operation for the callback object and set its type to %QCOM_TEE_OBJEC=
T_TYPE_CB_OBJECT.
> + *
> + * core.c holds an object table for callback objects. An object id is as=
signed
> + * to each callback object which is an index to the object table. QTEE u=
ses these ids
> + * to reference or invoke callback objects.
> + *
> + * If QTEE invoke a callback object in REE, the dispatch() operation is =
called in the
> + * context of thread that called qcom_tee_object_do_invoke(), originally=
.
> + */
> +
> +/**
> + * enum qcom_tee_object_typ - Object types.
> + * @QCOM_TEE_OBJECT_TYPE_TEE: object hosted on QTEE.
> + * @QCOM_TEE_OBJECT_TYPE_CB_OBJECT: object hosted on REE.
> + * @QCOM_TEE_OBJECT_TYPE_ROOT: 'primordial' object.
> + * @QCOM_TEE_OBJECT_TYPE_NULL: NULL object.
> + *
> + * Primordial object is used for bootstrapping the IPC connection betwee=
n a REE
> + * and QTEE. It is invoked by REE when it wants to get a 'client env'.
> + */
> +enum qcom_tee_object_type {
> +       QCOM_TEE_OBJECT_TYPE_TEE,
> +       QCOM_TEE_OBJECT_TYPE_CB_OBJECT,
> +       QCOM_TEE_OBJECT_TYPE_ROOT,
> +       QCOM_TEE_OBJECT_TYPE_NULL,
> +};
> +
> +/**
> + * enum qcom_tee_arg_type - Type of QTEE argument.
> + * @QCOM_TEE_ARG_TYPE_INV: invalid type.
> + * @QCOM_TEE_ARG_TYPE_IB: input buffer (IO).
> + * @QCOM_TEE_ARG_TYPE_OO: output object (OO).
> + * @QCOM_TEE_ARG_TYPE_OB: output buffer (OB).
> + * @QCOM_TEE_ARG_TYPE_IO: input object (IO).
> + *
> + * Use invalid type to specify end of argument array.
> + */
> +enum qcom_tee_arg_type {
> +       QCOM_TEE_ARG_TYPE_INV =3D 0,
> +       QCOM_TEE_ARG_TYPE_OB,
> +       QCOM_TEE_ARG_TYPE_OO,
> +       QCOM_TEE_ARG_TYPE_IB,
> +       QCOM_TEE_ARG_TYPE_IO,
> +       QCOM_TEE_ARG_TYPE_NR,
> +};
> +
> +/**
> + * define QCOM_TEE_ARGS_PER_TYPE - Maximum arguments of specific type.
> + *
> + * QTEE transport protocol limits maximum number of argument of specific=
 type
> + * (i.e. IB, OB, IO, and OO).
> + */
> +#define QCOM_TEE_ARGS_PER_TYPE 16
> +
> +/* Maximum arguments that can fit in a QTEE message, ignoring the type. =
*/
> +#define QCOM_TEE_ARGS_MAX (QCOM_TEE_ARGS_PER_TYPE * (QCOM_TEE_ARG_TYPE_N=
R - 1))
> +
> +struct qcom_tee_buffer {
> +       union {
> +               void *addr;
> +               void __user *uaddr;
> +       };
> +       size_t size;
> +};
> +
> +/**
> + * struct qcom_tee_arg - Argument for QTEE object invocation.
> + * @type: type of argument as &enum qcom_tee_arg_type.
> + * @flags: extra flags.
> + * @b: address and size if type of argument is buffer.
> + * @o: object instance if type of argument is object.
> + *
> + * &qcom_tee_arg.flags only accept %QCOM_TEE_ARG_FLAGS_UADDR for now whi=
ch states
> + * that &qcom_tee_arg.b contains userspace address in uaddr.
> + */
> +struct qcom_tee_arg {
> +       enum qcom_tee_arg_type type;
> +/* 'b.uaddr' holds a __user address. */
> +#define QCOM_TEE_ARG_FLAGS_UADDR 1
> +       unsigned int flags;
> +       union {
> +               struct qcom_tee_buffer b;
> +               struct qcom_tee_object *o;
> +       };
> +};
> +
> +static inline int qcom_tee_args_len(struct qcom_tee_arg *args)
> +{
> +       int i =3D 0;
> +
> +       while (args[i].type !=3D QCOM_TEE_ARG_TYPE_INV)
> +               i++;
> +       return i;
> +}
> +
> +#define QCOM_TEE_OIC_FLAG_BUSY         BIT(1)  /* Context is busy (callb=
ack is in progress). */
> +#define QCOM_TEE_OIC_FLAG_NOTIFY       BIT(2)  /* Context needs to notif=
y the current object. */
> +#define QCOM_TEE_OIC_FLAG_SHARED       BIT(3)  /* Context has shared sta=
te with QTEE. */
> +
> +struct qcom_tee_object_invoke_ctx {
> +       unsigned long flags;
> +       int errno;
> +
> +       /* Current object invoked in this callback context. */
> +       struct qcom_tee_object *object;
> +
> +       /* Arguments passed to dispatch callback (+1 for ending QCOM_TEE_=
ARG_TYPE_INV). */
> +       struct qcom_tee_arg u[QCOM_TEE_ARGS_MAX + 1];
> +
> +       /* Inbound and Outbound buffers shared with QTEE. */
> +       struct qcom_tee_buffer in_msg;          /* Inbound Buffer.  */
> +       phys_addr_t in_msg_paddr;               /* Physical address of in=
bound buffer. */
> +       struct qcom_tee_buffer out_msg;         /* Outbound Buffer. */
> +       phys_addr_t out_msg_paddr;              /* Physical address of ou=
tbound buffer. */
> +
> +       /* Extra data attached to this context. */
> +       void *data;
> +};
> +
> +/**
> + * qcom_tee_object_do_invoke() - Submit an invocation for an object.
> + * @oic: context to use for current invocation.
> + * @object: object being invoked.
> + * @op: requested operation on object.
> + * @u: array of argument for the current invocation.
> + * @result: result returned from QTEE.
> + *
> + * The caller is responsible to keep track of the refcount for each obje=
ct,
> + * including @object. On return, the caller loses the ownership of all i=
nput object of
> + * type %QCOM_TEE_OBJECT_TYPE_CB_OBJECT.
> + *
> + * @object can be of %QCOM_TEE_OBJECT_TYPE_ROOT or %QCOM_TEE_OBJECT_TYPE=
_TEE types.
> + *
> + * Return: On success return 0. On error returns -EINVAL and -ENOSPC if =
unable to initiate
> + * the invocation, -EAGAIN if invocation failed and user may retry the i=
nvocation.
> + * Otherwise, -ENODEV on fatal failure.
> + */
> +int qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
> +                             struct qcom_tee_object *object, u32 op, str=
uct qcom_tee_arg *u,
> +                             int *result);
> +
> +/**
> + * struct qcom_tee_object_operations - Callback object operations.
> + * @release: release object if QTEE is not using it.
> + * @dispatch: dispatch the operation requested by QTEE.
> + * @notify: report status of any pending response submitted by @dispatch=
.
> + *
> + * Transport may fail (e.g. object table is full) even after @dispatch s=
uccessfully submitted
> + * the response. @notify is called to do the necessary cleanup.
> + */
> +struct qcom_tee_object_operations {
> +       void (*release)(struct qcom_tee_object *object);
> +       int  (*dispatch)(struct qcom_tee_object_invoke_ctx *oic,
> +                        struct qcom_tee_object *object, u32 op, struct q=
com_tee_arg *args);
> +       void (*notify)(struct qcom_tee_object_invoke_ctx *oic,
> +                      struct qcom_tee_object *object, int err);
> +};
> +
> +/**
> + * struct qcom_tee_object - QTEE or REE object.
> + * @name: object name.
> + * @refcount: reference counter.
> + * @object_type: object type as &enum qcom_tee_object_type.
> + * @info: extra information for object.
> + * @owner: owning module/driver.
> + * @ops: callback operations for object of type %QCOM_TEE_OBJECT_TYPE_CB=
_OBJECT.
> + * @work: work for async operation on object.
> + *
> + * @work is currently only used for release object of %QCOM_TEE_OBJECT_T=
YPE_TEE type.
> + */
> +struct qcom_tee_object {
> +       const char *name;
> +       struct kref refcount;
> +
> +       enum qcom_tee_object_type object_type;
> +       union object_info {
> +               /* QTEE object id if object_type is %QCOM_TEE_OBJECT_TYPE=
_TEE. */
> +               unsigned long qtee_id;
> +       } info;
> +
> +       struct module *owner;
> +       struct qcom_tee_object_operations *ops;
> +       struct work_struct work;
> +};
> +
> +/* Static instances of qcom_tee_object objects. */
> +#define NULL_QCOM_TEE_OBJECT ((struct qcom_tee_object *)(0))
> +extern struct qcom_tee_object qcom_tee_object_root;
> +#define ROOT_QCOM_TEE_OBJECT (&qcom_tee_object_root)
> +
> +static inline enum qcom_tee_object_type typeof_qcom_tee_object(struct qc=
om_tee_object *object)
> +{
> +       if (object =3D=3D NULL_QCOM_TEE_OBJECT)
> +               return QCOM_TEE_OBJECT_TYPE_NULL;
> +       return object->object_type;
> +}
> +
> +static inline const char *qcom_tee_object_name(struct qcom_tee_object *o=
bject)
> +{
> +       if (object =3D=3D NULL_QCOM_TEE_OBJECT)
> +               return "null";
> +
> +       if (!object->name)
> +               return "no-name";
> +       return object->name;
> +}
> +
> +/**
> + * __qcom_tee_object_user_init() - Initialize an object for user.
> + * @object: object to initialize.
> + * @object_type: type of object as &enum qcom_tee_object_type.
> + * @ops: instance of callbacks.
> + * @owner: owning module/driver.
> + * @fmt: name assigned to the object.
> + *
> + * Return: On success return 0 or <0 on failure.
> + */
> +int __qcom_tee_object_user_init(struct qcom_tee_object *object, enum qco=
m_tee_object_type ot,
> +                               struct qcom_tee_object_operations *ops, s=
truct module *owner,
> +                               const char *fmt, ...);
> +#define qcom_tee_object_user_init(obj, ot, ops, fmt, ...) \
> +       __qcom_tee_object_user_init((obj), (ot), (ops), THIS_MODULE, (fmt=
), __VA_ARGS__)
> +
> +/* Object release is RCU protected. */
> +int qcom_tee_object_get(struct qcom_tee_object *object);
> +void qcom_tee_object_put(struct qcom_tee_object *object);
> +
> +#define qcom_tee_arg_for_each(i, args) \
> +       for (i =3D 0; args[i].type !=3D QCOM_TEE_ARG_TYPE_INV; i++)
> +
> +/* Next argument of type @type after index @i. */
> +int qcom_tee_next_arg_type(struct qcom_tee_arg *u, int i, enum qcom_tee_=
arg_type type);
> +
> +/* Iterate over argument of given type. */
> +#define qcom_tee_arg_for_each_type(i, args, at)                        \
> +       for (i =3D 0, i =3D qcom_tee_next_arg_type(args, i, at);    \
> +               args[i].type !=3D QCOM_TEE_ARG_TYPE_INV;          \
> +               i++, i =3D qcom_tee_next_arg_type(args, i, at))
> +
> +#define qcom_tee_arg_for_each_input_buffer(i, args)  \
> +       qcom_tee_arg_for_each_type(i, args, QCOM_TEE_ARG_TYPE_IB)
> +#define qcom_tee_arg_for_each_output_buffer(i, args) \
> +       qcom_tee_arg_for_each_type(i, args, QCOM_TEE_ARG_TYPE_OB)
> +#define qcom_tee_arg_for_each_input_object(i, args)  \
> +       qcom_tee_arg_for_each_type(i, args, QCOM_TEE_ARG_TYPE_IO)
> +#define qcom_tee_arg_for_each_output_object(i, args) \
> +       qcom_tee_arg_for_each_type(i, args, QCOM_TEE_ARG_TYPE_OO)
> +
> +#endif /* __QCOM_TEE_H */
>
> --
> 2.34.1
>

