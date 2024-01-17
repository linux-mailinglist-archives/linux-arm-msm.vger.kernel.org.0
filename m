Return-Path: <linux-arm-msm+bounces-7504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF26830D26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 20:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 389311C23E70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 19:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFC2249E0;
	Wed, 17 Jan 2024 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C6aNlgK2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98B624204
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 19:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705518603; cv=none; b=MYaXQpKrnteXIV/XePOiyLrRN8nKCcHl/0SjenAphbYF170jbGoZwh7X6hy+y1uMmml62uoJmLcPf0UOB5YlmcMFo3P28oLztZ3yWg+KJ6GOSPKSUkcCTnIiuV6lEi4zshZhot+F5qe/Tf3JCJCVYvM+MOL+SczMkr+xlF814wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705518603; c=relaxed/simple;
	bh=pOBH5kk4rTVzyMww58JwBtZRXinWstPMBFhlHEVIRHE=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=FIGRr8x0sN9yjhngsWgSG0rVhQClQXHW0rQrHD476bxA610EsTc62WE5kpZg/FvteQvYJahF+2eBu5R7Ol1cJ+Xrc9MLwAxfia+84Cyoc0Ao2JE1C9p8BWU0ZyR9A42zCDSBGJCXBEx6uMs8QrVlcLoQ1rHyUMe/XUcQYi05uTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C6aNlgK2; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e6ee8e911so13697641e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 11:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705518598; x=1706123398; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NAzAJO3N1I1OhZ284fvmMR+G059lfg2vntURweb1Fq0=;
        b=C6aNlgK2KCFeKX2M6Xtewg67xtun5EJRmPCerSQINq3ssRC9dfHbeBJ+FcmBvW33Pv
         kGVIkSHXcKsaWGN6ERTg6ThV/99bXMeGi5FME2hz7+AxBMInxt3NrjJNeYN1iCN9S5hP
         eC6BwnlV4Ry2n80A+9+rp1NugHYgg6Opdnrg2GM89V/PvkCZAHjBKPgkrBa3MTC1AF87
         jkmlYVd9E1/3mBpyRXmmQssWi/Rv8fpDZGDFv47P3UvrMPphnHlInJMxDbYuz8sZ3BYV
         kW/4Mz7siPZb0NBJUI8w9LeRkyiUsqHjxasuWy9XyewhGfpKSbweH6UJRVvUTN517qQa
         w6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705518598; x=1706123398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAzAJO3N1I1OhZ284fvmMR+G059lfg2vntURweb1Fq0=;
        b=pG84Argu9NN05UbqNr0gr/s2PHg6EQfhgrDCWr/G6i63bSSeQDH8CE2QLwDwbZTdIt
         BLzK4cC947rbCf5ZUH1+1o3UH7yg3sMXefR2FAtP1/ll3FvR4eeaSOrksHnEB5bLvtTc
         NNq8OZrCcSp7KHV+vHIhqS7AQnUxj5B8Kvc01dO4MUQwbeR1Tr0QUu3QjYUIVk53xMvC
         TKvSuneXN38Jntj/9/DL41G0sU53duiXcEKEGkLs0pofSgIdSuZdLw6IB7nQQ9dlo1Es
         wSvpvIyCEI1RwxXXq6N73iNq4I2jrd4/rt6T7GgDcZcFBtH1P5gkGcOuBDIYFXAF/C9j
         Zd/g==
X-Gm-Message-State: AOJu0YyxBNu5omJkrPzlcyxRxkkAoGcX1P6k6zeeH/ql0pmnUhAgJKIZ
	ikEQyjBRUTuSZ2uH+u3uzaX4uP3sSKOlLQC9grwPR+SgoCtJXw==
X-Google-Smtp-Source: AGHT+IGlDOdd3qY094t3cuOIq0BxFxAUEV6oA7vLrb7WTMrXhkU9b2CulrxydgXjlkSNoz4gun1ky/i7gRaQohSADr4=
X-Received: by 2002:a19:770f:0:b0:50e:ac2a:6b6d with SMTP id
 s15-20020a19770f000000b0050eac2a6b6dmr4104291lfc.119.1705518597942; Wed, 17
 Jan 2024 11:09:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240117173458.2312669-1-quic_sibis@quicinc.com> <20240117173458.2312669-4-quic_sibis@quicinc.com>
In-Reply-To: <20240117173458.2312669-4-quic_sibis@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jan 2024 21:09:46 +0200
Message-ID: <CAA8EJpqUgqHfMOZip58yGpt6S3XSBz+9BeXZSL_JmWar_JbO4g@mail.gmail.com>
Subject: Re: [RFC 3/7] firmware: arm_scmi: Add QCOM vendor protocol
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, jassisinghbrar@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org, 
	Amir Vajid <avajid@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jan 2024 at 19:36, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>
> SCMI QCOM vendor protocol provides interface to communicate with SCMI
> controller and enable vendor specific features like bus scaling capable
> of running on it.
>
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Co-developed-by: Amir Vajid <avajid@quicinc.com>
> Signed-off-by: Amir Vajid <avajid@quicinc.com>
> Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  drivers/firmware/arm_scmi/Kconfig            |  11 ++
>  drivers/firmware/arm_scmi/Makefile           |   1 +
>  drivers/firmware/arm_scmi/qcom_scmi_vendor.c | 160 +++++++++++++++++++
>  include/linux/qcom_scmi_vendor.h             |  36 +++++
>  4 files changed, 208 insertions(+)
>  create mode 100644 drivers/firmware/arm_scmi/qcom_scmi_vendor.c
>  create mode 100644 include/linux/qcom_scmi_vendor.h
>
> diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
> index aa5842be19b2..86b5d6c18ec4 100644
> --- a/drivers/firmware/arm_scmi/Kconfig
> +++ b/drivers/firmware/arm_scmi/Kconfig
> @@ -180,4 +180,15 @@ config ARM_SCMI_POWER_CONTROL
>           called scmi_power_control. Note this may needed early in boot to catch
>           early shutdown/reboot SCMI requests.
>
> +config QCOM_SCMI_VENDOR_PROTOCOL
> +       tristate "Qualcomm Technologies, Inc. Qcom SCMI vendor Protocol"
> +       depends on ARM || ARM64 || COMPILE_TEST
> +       depends on ARM_SCMI_PROTOCOL
> +       help
> +         The SCMI QCOM vendor protocol provides interface to communicate with SCMI
> +         controller and enable vendor specific features like bus scaling.
> +
> +         This driver defines the commands or message ID's used for this
> +         communication and also exposes the ops used by the clients.
> +
>  endmenu
> diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
> index a7bc4796519c..eaeb788b93c6 100644
> --- a/drivers/firmware/arm_scmi/Makefile
> +++ b/drivers/firmware/arm_scmi/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-core.o
>  obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-module.o
>
>  obj-$(CONFIG_ARM_SCMI_POWER_CONTROL) += scmi_power_control.o
> +obj-$(CONFIG_QCOM_SCMI_VENDOR_PROTOCOL) += qcom_scmi_vendor.o
>
>  ifeq ($(CONFIG_THUMB2_KERNEL)$(CONFIG_CC_IS_CLANG),yy)
>  # The use of R7 in the SMCCC conflicts with the compiler's use of R7 as a frame
> diff --git a/drivers/firmware/arm_scmi/qcom_scmi_vendor.c b/drivers/firmware/arm_scmi/qcom_scmi_vendor.c
> new file mode 100644
> index 000000000000..878b99f0d1ef
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/qcom_scmi_vendor.c
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/qcom_scmi_vendor.h>
> +
> +#include "common.h"
> +
> +#define        EXTENDED_MSG_ID                 0
> +#define        SCMI_MAX_TX_RX_SIZE             128
> +#define        PROTOCOL_PAYLOAD_SIZE           16
> +#define        SET_PARAM                       0x10
> +#define        GET_PARAM                       0x11
> +#define        START_ACTIVITY                  0x12
> +#define        STOP_ACTIVITY                   0x13
> +
> +static int qcom_scmi_set_param(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
> +                              u32 param_id, size_t size)
> +{
> +       int ret = -EINVAL;
> +       struct scmi_xfer *t;
> +       u32 *msg;
> +
> +       if (!ph || !ph->xops)
> +               return ret;

Drop init of ret, return -EINVAL directly here.

> +
> +       ret = ph->xops->xfer_get_init(ph, SET_PARAM, size + PROTOCOL_PAYLOAD_SIZE,
> +                                     SCMI_MAX_TX_RX_SIZE, &t);
> +       if (ret)
> +               return ret;
> +
> +       msg = t->tx.buf;
> +       *msg++ = cpu_to_le32(EXTENDED_MSG_ID);
> +       *msg++ = cpu_to_le32(algo_str & GENMASK(31, 0));
> +       *msg++ = cpu_to_le32((algo_str & GENMASK(63, 32)) >> 32);
> +       *msg++ = cpu_to_le32(param_id);

First, this header ops looks like a generic code which can be extracted.

Second, using GENMASK here in the ops doesn't make any sense. The
values will be limited to u32 anyway.

> +       memcpy(msg, buf, size);
> +       ret = ph->xops->do_xfer(ph, t);
> +       ph->xops->xfer_put(ph, t);
> +
> +       return ret;
> +}
> +
> +static int qcom_scmi_get_param(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
> +                              u32 param_id, size_t tx_size, size_t rx_size)
> +{
> +       int ret = -EINVAL;
> +       struct scmi_xfer *t;
> +       u32 *msg;
> +
> +       if (!ph || !ph->xops || !buf)
> +               return ret;

Drop init of ret, return -EINVAL directly here.

> +
> +       ret = ph->xops->xfer_get_init(ph, GET_PARAM, tx_size + PROTOCOL_PAYLOAD_SIZE,
> +                                     SCMI_MAX_TX_RX_SIZE, &t);
> +       if (ret)
> +               return ret;
> +
> +       msg = t->tx.buf;
> +       *msg++ = cpu_to_le32(EXTENDED_MSG_ID);
> +       *msg++ = cpu_to_le32(algo_str & GENMASK(31, 0));
> +       *msg++ = cpu_to_le32((algo_str & GENMASK(63, 32)) >> 32);
> +       *msg++ = cpu_to_le32(param_id);
> +       memcpy(msg, buf, tx_size);
> +       ret = ph->xops->do_xfer(ph, t);
> +       if (t->rx.len > rx_size) {
> +               pr_err("SCMI received buffer size %zu is more than expected size %zu\n",
> +                      t->rx.len, rx_size);
> +               return -EMSGSIZE;
> +       }
> +       memcpy(buf, t->rx.buf, t->rx.len);
> +       ph->xops->xfer_put(ph, t);
> +
> +       return ret;
> +}
> +
> +static int qcom_scmi_start_activity(const struct scmi_protocol_handle *ph,
> +                                   void *buf, u64 algo_str, u32 param_id, size_t size)
> +{
> +       int ret = -EINVAL;
> +       struct scmi_xfer *t;
> +       u32 *msg;
> +
> +       if (!ph || !ph->xops)
> +               return ret;

You can guess the comment here.

> +
> +       ret = ph->xops->xfer_get_init(ph, START_ACTIVITY, size + PROTOCOL_PAYLOAD_SIZE,
> +                                     SCMI_MAX_TX_RX_SIZE, &t);
> +       if (ret)
> +               return ret;
> +
> +       msg = t->tx.buf;
> +       *msg++ = cpu_to_le32(EXTENDED_MSG_ID);
> +       *msg++ = cpu_to_le32(algo_str & GENMASK(31, 0));
> +       *msg++ = cpu_to_le32((algo_str & GENMASK(63, 32)) >> 32);
> +       *msg++ = cpu_to_le32(param_id);
> +       memcpy(msg, buf, size);
> +       ret = ph->xops->do_xfer(ph, t);
> +       ph->xops->xfer_put(ph, t);
> +
> +       return ret;
> +}
> +
> +static int qcom_scmi_stop_activity(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
> +                                  u32 param_id, size_t size)
> +{
> +       int ret = -EINVAL;
> +       struct scmi_xfer *t;
> +       u32 *msg;
> +
> +       if (!ph || !ph->xops)
> +               return ret;
> +
> +       ret = ph->xops->xfer_get_init(ph, STOP_ACTIVITY, size + PROTOCOL_PAYLOAD_SIZE,
> +                                     SCMI_MAX_TX_RX_SIZE, &t);
> +       if (ret)
> +               return ret;
> +
> +       msg = t->tx.buf;
> +       *msg++ = cpu_to_le32(EXTENDED_MSG_ID);
> +       *msg++ = cpu_to_le32(algo_str & GENMASK(31, 0));
> +       *msg++ = cpu_to_le32((algo_str & GENMASK(63, 32)) >> 32);
> +       *msg++ = cpu_to_le32(param_id);
> +       memcpy(msg, buf, size);
> +       ret = ph->xops->do_xfer(ph, t);
> +       ph->xops->xfer_put(ph, t);
> +
> +       return ret;
> +}
> +
> +static struct qcom_scmi_vendor_ops qcom_proto_ops = {
> +       .set_param = qcom_scmi_set_param,
> +       .get_param = qcom_scmi_get_param,
> +       .start_activity = qcom_scmi_start_activity,
> +       .stop_activity = qcom_scmi_stop_activity,
> +};
> +
> +static int qcom_scmi_vendor_protocol_init(const struct scmi_protocol_handle *ph)
> +{
> +       u32 version;
> +
> +       ph->xops->version_get(ph, &version);
> +
> +       dev_info(ph->dev, "qcom scmi version %d.%d\n",
> +                PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
> +
> +       return 0;
> +}
> +
> +static const struct scmi_protocol qcom_scmi_vendor = {
> +       .id = QCOM_SCMI_VENDOR_PROTOCOL,
> +       .owner = THIS_MODULE,
> +       .instance_init = &qcom_scmi_vendor_protocol_init,
> +       .ops = &qcom_proto_ops,
> +};
> +module_scmi_protocol(qcom_scmi_vendor);
> +
> +MODULE_DESCRIPTION("QTI SCMI vendor protocol");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/qcom_scmi_vendor.h b/include/linux/qcom_scmi_vendor.h
> new file mode 100644
> index 000000000000..bde57bb18367
> --- /dev/null
> +++ b/include/linux/qcom_scmi_vendor.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * QTI SCMI vendor protocol's header
> + *
> + * Copyright (c) 2024, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _QCOM_SCMI_VENDOR_H
> +#define _QCOM_SCMI_VENDOR_H
> +
> +#include <linux/bitfield.h>
> +#include <linux/device.h>
> +#include <linux/types.h>
> +
> +#define QCOM_SCMI_VENDOR_PROTOCOL    0x80
> +
> +struct scmi_protocol_handle;
> +extern struct scmi_device *get_qcom_scmi_device(void);
> +
> +/**
> + * struct qcom_scmi_vendor_ops - represents the various operations provided
> + *                              by qcom scmi vendor protocol
> + */
> +struct qcom_scmi_vendor_ops {
> +       int (*set_param)(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
> +                        u32 param_id, size_t size);
> +       int (*get_param)(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
> +                        u32 param_id, size_t tx_size, size_t rx_size);
> +       int (*start_activity)(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
> +                             u32 param_id, size_t size);
> +       int (*stop_activity)(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
> +                            u32 param_id, size_t size);
> +};
> +
> +#endif /* _QCOM_SCMI_VENDOR_H */
> +
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

