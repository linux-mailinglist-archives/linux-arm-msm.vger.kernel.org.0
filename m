Return-Path: <linux-arm-msm+bounces-66129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE43B0E066
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 17:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEE7917FFAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 15:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2886B265292;
	Tue, 22 Jul 2025 15:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PhDiZO6x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6B3264626
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 15:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753197849; cv=none; b=kCDP7sH1SXHqVFid5WzeD/3L2Ql3Ip4vnVSZdFsZuuGtwMoUr9kMopSzXzcVjwxIj03S9BcGnSFm+rvGu92nUi3nMGHcoH7mEpV3RSHLwR1rwiu6QKXNDRzU/2p+FFnqDN4+xSej6ASBg4MKoTblnU7RANU880GIQbZ4bFG0npg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753197849; c=relaxed/simple;
	bh=8ZyqpTepzzNKXIy6eJb3IusCG0BqiGiHI1fH2NhI9tA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QR50PWvMGsdlc9WQJ2WJrJG6fftr0oy+Cb48+O/nsUGxocz5E0d+pGpV4D8WcKuvxdFsb65odYL+2YMAyAAQ54zhK1QAp7nFnECk60ZpWroLAPJHwIpNYNiksssYUhIawVJfwDPnKXbPv8U7m7xAEgen8KjVFDhNp3pQ8q8Gn/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PhDiZO6x; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-af0dc229478so293716966b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 08:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753197844; x=1753802644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fdmktz+HZTUTbn+B6pJ2JHvchHsp9zYIbXnQJvw6KvQ=;
        b=PhDiZO6xH72HtwhlROAoqlyxowVjyn5XWR4hfB/IeMOqVijiuGSJ+W8FipkL+FjCee
         d1xHnQSMqUK+vn7dxJlaYt7WE48kPeRDK+37/FBaDwgjLYptyJl15HC1/56UBrBP0xqb
         46gI9w9fuHp4Z2SRSlkTrubsjibgIBFZYXC3lWV1O7A9WJdSe7FZG0jR9/PgXUsl33v4
         jTVXEN7gUZf8Wkf2EjHlEjxyVDNNArArK4dGYTYaBvhK/2Y0VGoKPHDF59OyAECZtkwF
         F58/EOcJkxGgme4sVljX7Rq4qJvoYgAIpuS/o/9DYaxg0n7AO04+lo/iTNRDcws8jK0p
         c78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753197844; x=1753802644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdmktz+HZTUTbn+B6pJ2JHvchHsp9zYIbXnQJvw6KvQ=;
        b=k14pe2/wBYbXhNskfVm5rP8Hfuo1V0Il9SV3joEGYZlvbKWovFXmps7AsPN7cf54u8
         2l9l2oTnQopq7vmItoyrX/ewqdhL6ZGHROCdRk/MEXQ0qWqhezBxyT5vHPwMNHo4NbiS
         HebiiJ3Z38CJB+izGsSdxXi/XXravN7UgDDpDxkRR6FLuczzYLTjZq++nV6OQe0RyXDg
         RyiMQh8zQxvPNz4r5UZjZUm5PZlEicx/r3rQzFJQbzX4c6QjgoKDemIHTm4EokmevYwA
         G+AkSTQFOe3pvsRFACYpL10P7FGDiwOBbOQxlc04tlnEkTiEfj8aqmo6GXV744ccwWf+
         jc0g==
X-Forwarded-Encrypted: i=1; AJvYcCUHA980ocPxa34i4oME18PYSRBB1nIhYyCijxefVJL24jAyhbG/Kp07LWHt1pcyqw8/zfKxkDB3rW2ABRyl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9G0abFZq2WstV1LegltYPKNaQMFye+g3hmF+hnQfYEz9YhxG1
	9zBOhB/6HfiTbghxds3uIV9JDdqCPAc2SAItBW4YdurBWdlVgCj91l+q5PTLE8HyvQfA8pnjluy
	rG66l4TkFjqKfBG7Cu6o0U/BdhST4zOft+atK9SWFBg==
X-Gm-Gg: ASbGnctS0kumFI21jhNNkiF2nqQaQwLIlB2wKYAqk5xrUzzW9YPjhbZAKSt4cdxJguV
	VWT7pRv4NyY9R8zEUGCCeWzjiUYV08rjKaVkAV669bt9ardbJwe7qcCmm+/Snv3fVudHYiX+G73
	4v+h5kvKkHIoxNYdyUavj/tAkHeyjrMyJorCnhiUfQ+kRd3E3E2w5Ar4pXR+rRuSfwt5k0O6c7Z
	DYj/ujv
X-Google-Smtp-Source: AGHT+IHGua0kPNIopFaYGDBz3tQw8dTP7VhKQwcyrRu8676ug+w++XCBKlPX4XF51IPoaGx/co/CzW3NoN+q+S+ejv0=
X-Received: by 2002:a17:907:7ba9:b0:ae3:b371:e7d3 with SMTP id
 a640c23a62f3a-ae9cddfe62dmr2319560466b.22.1753197843806; Tue, 22 Jul 2025
 08:24:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com> <20250714063109.591-5-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250714063109.591-5-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 22 Jul 2025 16:23:50 +0100
X-Gm-Features: Ac12FXz7H4K8Bs6oVFSm4-8uw1yqPeHQHTEi6Sh3SOUnyhf9oYsv9Lf9J47hSK4
Message-ID: <CAJ9a7VhEDMSz6TWvhFOwcdGYbtM-4LnRpPH-7eab8Cdq8r616g@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 04/10] coresight: ctcu: enable byte-cntr for TMC
 ETR devices
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
	Mao Jinlong <quic_jinlmao@quicinc.com>, Jie Gan <quic_jiegan@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

There are some parameters in the new structure that are unused in this patch.

please only introduce fields when they start to be used to make review easier.

Regards

Mike

On Mon, 14 Jul 2025 at 07:31, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> The byte-cntr function provided by the CTCU device is used to transfer data
> from the ETR buffer to the userspace. An interrupt is triggered if the data
> size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions and the read function
> will read the data from the ETR buffer.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../testing/sysfs-bus-coresight-devices-ctcu  |   5 +
>  drivers/hwtracing/coresight/Makefile          |   2 +-
>  .../coresight/coresight-ctcu-byte-cntr.c      | 102 ++++++++++++++++++
>  .../hwtracing/coresight/coresight-ctcu-core.c |  94 +++++++++++++++-
>  drivers/hwtracing/coresight/coresight-ctcu.h  |  49 ++++++++-
>  5 files changed, 246 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>  create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
> new file mode 100644
> index 000000000000..e21f5bcb8097
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
> @@ -0,0 +1,5 @@
> +What:           /sys/bus/coresight/devices/<ctcu-name>/irq_val
> +Date:           June 2025
> +KernelVersion:  6.16
> +Contact:        Tingwei Zhang (QUIC) <quic_tingweiz@quicinc.com>; Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>; Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:    (RW) Configure the IRQ value for byte-cntr register.
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 4e7cc3c5bf99..3568d9768567 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -54,5 +54,5 @@ coresight-cti-y := coresight-cti-core.o       coresight-cti-platform.o \
>  obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>  obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>  obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
> -coresight-ctcu-y := coresight-ctcu-core.o
> +coresight-ctcu-y := coresight-ctcu-core.o coresight-ctcu-byte-cntr.o
>  obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> new file mode 100644
> index 000000000000..d3b6eb7a89fb
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/coresight.h>
> +#include <linux/device.h>
> +#include <linux/fs.h>
> +#include <linux/interrupt.h>
> +#include <linux/of_irq.h>
> +#include <linux/uaccess.h>
> +
> +#include "coresight-ctcu.h"
> +#include "coresight-priv.h"
> +#include "coresight-tmc.h"
> +
> +static irqreturn_t byte_cntr_handler(int irq, void *data)
> +{
> +       struct ctcu_byte_cntr *byte_cntr_data = (struct ctcu_byte_cntr *)data;
> +
> +       atomic_inc(&byte_cntr_data->irq_cnt);
> +       wake_up(&byte_cntr_data->wq);
> +
> +       byte_cntr_data->irq_num++;
> +

These two - irq_num & irq_cnt appear to count the same thing. Do not
understand why one has to be atomic and the other does not.

> +       return IRQ_HANDLED;
> +}
> +
> +/* Start the byte-cntr function when the path is enabled. */
> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path)
> +{
> +       struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +       struct coresight_device *sink = coresight_get_sink(path);
> +       struct ctcu_byte_cntr *byte_cntr_data;
> +       int port_num;
> +
> +       if (!sink)
> +               return;
> +
> +       port_num = coresight_get_port_helper(sink, csdev);
> +       if (port_num < 0)
> +               return;
> +
> +       byte_cntr_data = &drvdata->byte_cntr_data[port_num];
> +       /* Don't start byte-cntr function when threshold is not set. */
> +       if (!byte_cntr_data->thresh_val || byte_cntr_data->enable)
> +               return;
> +
> +       guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
> +       byte_cntr_data->enable = true;
> +       byte_cntr_data->reading_buf = false;
> +}
> +
> +/* Stop the byte-cntr function when the path is disabled. */
> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
> +{
> +       struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +       struct coresight_device *sink = coresight_get_sink(path);
> +       struct ctcu_byte_cntr *byte_cntr_data;
> +       int port_num;
> +
> +       if (!sink || coresight_get_mode(sink) == CS_MODE_SYSFS)
> +               return;
> +
> +       port_num = coresight_get_port_helper(sink, csdev);
> +       if (port_num < 0)
> +               return;
> +
> +       byte_cntr_data = &drvdata->byte_cntr_data[port_num];
> +       guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
> +       byte_cntr_data->enable = false;
> +}
> +
> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int etr_num)
> +{
> +       struct ctcu_byte_cntr *byte_cntr_data;
> +       struct device_node *nd = dev->of_node;
> +       int byte_cntr_irq, ret, i;
> +
> +       for (i = 0; i < etr_num; i++) {
> +               byte_cntr_data = &drvdata->byte_cntr_data[i];
> +               byte_cntr_irq = of_irq_get_byname(nd, byte_cntr_data->irq_name);
> +               if (byte_cntr_irq < 0) {
> +                       dev_err(dev, "Failed to get IRQ from DT for %s\n",
> +                               byte_cntr_data->irq_name);
> +                       continue;
> +               }
> +
> +               ret = devm_request_irq(dev, byte_cntr_irq, byte_cntr_handler,
> +                                      IRQF_TRIGGER_RISING | IRQF_SHARED,
> +                                      dev_name(dev), byte_cntr_data);
> +               if (ret) {
> +                       dev_err(dev, "Failed to register IRQ for %s\n",
> +                               byte_cntr_data->irq_name);
> +                       continue;
> +               }
> +
> +               byte_cntr_data->byte_cntr_irq = byte_cntr_irq;
> +               disable_irq(byte_cntr_data->byte_cntr_irq);
> +               init_waitqueue_head(&byte_cntr_data->wq);
> +       }
> +}
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index 28ea4a216345..721836d42523 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -15,6 +15,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
> +#include <linux/sizes.h>
>
>  #include "coresight-ctcu.h"
>  #include "coresight-priv.h"
> @@ -45,17 +46,23 @@ DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
>
>  #define CTCU_ATID_REG_BIT(traceid)     (traceid % 32)
>  #define CTCU_ATID_REG_SIZE             0x10
> +#define CTCU_ETR0_IRQCTRL               0x6c
> +#define CTCU_ETR1_IRQCTRL               0x70
>  #define CTCU_ETR0_ATID0                        0xf8
>  #define CTCU_ETR1_ATID0                        0x108
>
>  static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
>         {
> -               .atid_offset    = CTCU_ETR0_ATID0,
> -               .port_num       = 0,
> +               .atid_offset            = CTCU_ETR0_ATID0,
> +               .irq_ctrl_offset        = CTCU_ETR0_IRQCTRL,
> +               .irq_name               = "etr0",
> +               .port_num               = 0,
>         },
>         {
> -               .atid_offset    = CTCU_ETR1_ATID0,
> -               .port_num       = 1,
> +               .atid_offset            = CTCU_ETR1_ATID0,
> +               .irq_ctrl_offset        = CTCU_ETR1_IRQCTRL,
> +               .irq_name               = "etr1",
> +               .port_num               = 1,
>         },
>  };
>
> @@ -64,6 +71,76 @@ static const struct ctcu_config sa8775p_cfgs = {
>         .num_etr_config = ARRAY_SIZE(sa8775p_etr_cfgs),
>  };
>
> +static void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset)
> +{
> +       CS_UNLOCK(drvdata->base);
> +       ctcu_writel(drvdata, val, offset);
> +       CS_LOCK(drvdata->base);
> +}
> +
> +static ssize_t irq_val_show(struct device *dev, struct device_attribute *attr,
> +                           char *buf)
> +{
> +       struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +       int i, len = 0;
> +
> +       for (i = 0; i < ETR_MAX_NUM; i++) {
> +               if (drvdata->byte_cntr_data[i].irq_ctrl_offset)
> +                       len += scnprintf(buf + len, PAGE_SIZE - len, "%u ",
> +                                        drvdata->byte_cntr_data[i].thresh_val);
> +       }
> +
> +       len += scnprintf(buf + len, PAGE_SIZE - len, "\n");
> +
> +       return len;
> +}
> +
> +/* Program a valid value into IRQCTRL register will enable byte-cntr interrupt */
> +static ssize_t irq_val_store(struct device *dev, struct device_attribute *attr,
> +                            const char *buf, size_t size)
> +{
> +       struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +       u32 thresh_vals[ETR_MAX_NUM] = { 0 };
> +       u32 irq_ctrl_offset;
> +       int num, i;
> +
> +       num = sscanf(buf, "%i %i", &thresh_vals[0], &thresh_vals[1]);
> +       if (num <= 0 || num > ETR_MAX_NUM)
> +               return -EINVAL;
> +
> +       /* Threshold 0 disables the interruption. */
> +       guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
> +       for (i = 0; i < num; i++) {
> +               /* A small threshold will result in a large number of interruptions */
> +               if (thresh_vals[i] && thresh_vals[i] < SZ_4K)
> +                       return -EINVAL;
> +
> +               if (drvdata->byte_cntr_data[i].irq_ctrl_offset) {
> +                       drvdata->byte_cntr_data[i].thresh_val = thresh_vals[i];
> +                       irq_ctrl_offset = drvdata->byte_cntr_data[i].irq_ctrl_offset;
> +                       /* A one value for IRQCTRL register represents 8 bytes */
> +                       ctcu_program_register(drvdata, thresh_vals[i] / 8, irq_ctrl_offset);
> +               }
> +       }
> +
> +       return size;
> +}
> +static DEVICE_ATTR_RW(irq_val);
> +

I think it may make more sense to call this something with "threshold"
- as it is thresholds that are being set.

> +static struct attribute *ctcu_attrs[] = {
> +       &dev_attr_irq_val.attr,
> +       NULL,
> +};
> +
> +static struct attribute_group ctcu_attr_grp = {
> +       .attrs = ctcu_attrs,
> +};
> +
> +static const struct attribute_group *ctcu_attr_grps[] = {
> +       &ctcu_attr_grp,
> +       NULL,
> +};
> +
>  static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, u32 reg_offset,
>                                        u8 bit, bool enable)
>  {
> @@ -143,6 +220,8 @@ static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode, void *
>  {
>         struct coresight_path *path = (struct coresight_path *)data;
>
> +       ctcu_byte_cntr_start(csdev, path);
> +
>         return ctcu_set_etr_traceid(csdev, path, true);
>  }
>
> @@ -150,6 +229,8 @@ static int ctcu_disable(struct coresight_device *csdev, void *data)
>  {
>         struct coresight_path *path = (struct coresight_path *)data;
>
> +       ctcu_byte_cntr_stop(csdev, path);
> +
>         return ctcu_set_etr_traceid(csdev, path, false);
>  }
>
> @@ -200,7 +281,11 @@ static int ctcu_probe(struct platform_device *pdev)
>                         for (i = 0; i < cfgs->num_etr_config; i++) {
>                                 etr_cfg = &cfgs->etr_cfgs[i];
>                                 drvdata->atid_offset[i] = etr_cfg->atid_offset;
> +                               drvdata->byte_cntr_data[i].irq_name = etr_cfg->irq_name;
> +                               drvdata->byte_cntr_data[i].irq_ctrl_offset =
> +                                       etr_cfg->irq_ctrl_offset;
>                         }
> +                       ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
>                 }
>         }
>
> @@ -212,6 +297,7 @@ static int ctcu_probe(struct platform_device *pdev)
>         desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU;
>         desc.pdata = pdata;
>         desc.dev = dev;
> +       desc.groups = ctcu_attr_grps;
>         desc.ops = &ctcu_ops;
>         desc.access = CSDEV_ACCESS_IOMEM(base);
>
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
> index e9594c38dd91..71266371591b 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu.h
> +++ b/drivers/hwtracing/coresight/coresight-ctcu.h
> @@ -5,19 +5,27 @@
>
>  #ifndef _CORESIGHT_CTCU_H
>  #define _CORESIGHT_CTCU_H
> +
> +#include <linux/time.h>
>  #include "coresight-trace-id.h"
>
>  /* Maximum number of supported ETR devices for a single CTCU. */
>  #define ETR_MAX_NUM    2
>
> +#define BYTE_CNTR_TIMEOUT      (5 * HZ)
> +
>  /**
>   * struct ctcu_etr_config
>   * @atid_offset:       offset to the ATID0 Register.
> - * @port_num:          in-port number of CTCU device that connected to ETR.
> + * @port_num:          in-port number of the CTCU device that connected to ETR.
> + * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
> + * @irq_name:           IRQ name in dt node.
>   */
>  struct ctcu_etr_config {
>         const u32 atid_offset;
>         const u32 port_num;
> +       const u32 irq_ctrl_offset;
> +       const char *irq_name;
>  };
>
>  struct ctcu_config {
> @@ -25,15 +33,54 @@ struct ctcu_config {
>         int num_etr_config;
>  };
>
> +/**
> + * struct ctcu_byte_cntr
> + * @enable:            indicates that byte_cntr function is enabled or not.
> + * @reading:           indicates that its byte-cntr reading.
> + * @reading_buf:       indicates that byte-cntr is reading buffer.
> + * @thresh_val:                threshold to trigger a interruption.
> + * @total_size:                total size of transferred data.
> + * @byte_cntr_irq:     IRQ number.
> + * @irq_cnt:           IRQ count.
> + * @irq_num:           number of the byte_cntr IRQ for one session.

the difference between byte_cntr_irg and irq_cnt is not clear.

> + * @wq:                        workqueue of reading ETR data.
> + * @read_work:         work of reading ETR data.
> + * @spin_lock:         spinlock of byte cntr data.
> + *                     the byte cntr is stopped.
> + * @irq_ctrl_offset:   offset to the BYTECNTVAL Register.
> + * @irq_name:          IRQ name in DT.
> + */
> +struct ctcu_byte_cntr {
> +       bool                    enable;
> +       bool                    reading;

This parameter is unused in this patch

> +       bool                    reading_buf;
> +       u32                     thresh_val;
> +       u64                     total_size;

parameter unused in this patch

> +       int                     byte_cntr_irq;
> +       atomic_t                irq_cnt;
> +       int                     irq_num;
> +       wait_queue_head_t       wq;
> +       struct work_struct      read_work;
> +       raw_spinlock_t          spin_lock;
> +       u32                     irq_ctrl_offset;
> +       const char              *irq_name;
> +};
> +
>  struct ctcu_drvdata {
>         void __iomem            *base;
>         struct clk              *apb_clk;
>         struct device           *dev;
>         struct coresight_device *csdev;
> +       struct ctcu_byte_cntr   byte_cntr_data[ETR_MAX_NUM];
>         raw_spinlock_t          spin_lock;
>         u32                     atid_offset[ETR_MAX_NUM];
>         /* refcnt for each traceid of each sink */
>         u8                      traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
>  };
>
> +/* Byte-cntr functions */
> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path);
> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path);
> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int port_num);
> +
>  #endif
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

