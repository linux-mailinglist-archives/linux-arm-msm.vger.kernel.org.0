Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DAE7AB288
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 08:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388744AbfIFGc0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 02:32:26 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58300 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732131AbfIFGc0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 02:32:26 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B11EC60863; Fri,  6 Sep 2019 06:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567751544;
        bh=5IXWL13z0uCkCyyzyvjNDyApKQDm84iOFMXdY5wj5TU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J1FNAPpwWiwIuRFAOOaK+pKm7+gBb9GpefDZM2EZwXh8pGpde5fNUyLZIuASW906r
         XbeIM2eOf+bAoFyIf7Mx5pkTQb5welcJXozRCdOqQ2qsnQVxJSR9Ud5D5N8o8b7SoM
         lLtfGp2w3oCB8a5DLLJQPDf6YFEElXtDEvHnL9+M=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BC907611FB;
        Fri,  6 Sep 2019 06:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567751543;
        bh=5IXWL13z0uCkCyyzyvjNDyApKQDm84iOFMXdY5wj5TU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TLthiHUilgoeHCIFJsQWdQt6JC0ONZ4qmdkREojmUvC0O35NrobYsN9Wap0KORN80
         kxeN7TuPEzX/6y0rygOsV01It8c02tbTF4rAJfCS6Hq/q7y3bJdZXHlq/2gkaeO4uH
         E50k2l8gARzUl7ajwNYZa+aiqdLMGu/Q4KWG5ptc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BC907611FB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f41.google.com with SMTP id v38so5266731edm.7;
        Thu, 05 Sep 2019 23:32:22 -0700 (PDT)
X-Gm-Message-State: APjAAAUa5OYORJKmSWKHaK6cIsX2Sd3oyHdL+6McUb/5VinCPZqVgRek
        lab3HjLVaHVvthj8NVPcP3Twz8LMJ/lmty6sXrs=
X-Google-Smtp-Source: APXvYqwU+hPH/XbLx216IUjOvcURat+MDJLla19fyLxpNuL7iBDeofqIDCk3Hji3Toa0pQw92b5brzKXTj7t9HHhEbY=
X-Received: by 2002:a50:ce53:: with SMTP id k19mr7907098edj.2.1567751541265;
 Thu, 05 Sep 2019 23:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190823063248.13295-1-vivek.gautam@codeaurora.org> <20190823063248.13295-4-vivek.gautam@codeaurora.org>
In-Reply-To: <20190823063248.13295-4-vivek.gautam@codeaurora.org>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Fri, 6 Sep 2019 12:02:10 +0530
X-Gmail-Original-Message-ID: <CAFp+6iE05p-UM=pJ-JwbmTb98sAN5B9c980Qv6ZBX89T8Jeofw@mail.gmail.com>
Message-ID: <CAFp+6iE05p-UM=pJ-JwbmTb98sAN5B9c980Qv6ZBX89T8Jeofw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] iommu: arm-smmu-impl: Add sdm845 implementation hook
To:     "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <joro@8bytes.org>,
        Andy Gross <agross@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 23, 2019 at 12:03 PM Vivek Gautam
<vivek.gautam@codeaurora.org> wrote:
>
> Add reset hook for sdm845 based platforms to turn off
> the wait-for-safe sequence.
>
> Understanding how wait-for-safe logic affects USB and UFS performance
> on MTP845 and DB845 boards:
>
> Qcom's implementation of arm,mmu-500 adds a WAIT-FOR-SAFE logic
> to address under-performance issues in real-time clients, such as
> Display, and Camera.
> On receiving an invalidation requests, the SMMU forwards SAFE request
> to these clients and waits for SAFE ack signal from real-time clients.
> The SAFE signal from such clients is used to qualify the start of
> invalidation.
> This logic is controlled by chicken bits, one for each - MDP (display),
> IFE0, and IFE1 (camera), that can be accessed only from secure software
> on sdm845.
>
> This configuration, however, degrades the performance of non-real time
> clients, such as USB, and UFS etc. This happens because, with wait-for-safe
> logic enabled the hardware tries to throttle non-real time clients while
> waiting for SAFE ack signals from real-time clients.
>
> On mtp845 and db845 devices, with wait-for-safe logic enabled by the
> bootloaders we see degraded performance of USB and UFS when kernel
> enables the smmu stage-1 translations for these clients.
> Turn off this wait-for-safe logic from the kernel gets us back the perf
> of USB and UFS devices until we re-visit this when we start seeing perf
> issues on display/camera on upstream supported SDM845 platforms.
> The bootloaders on these boards implement secure monitor callbacks to
> handle a specific command - QCOM_SCM_SVC_SMMU_PROGRAM with which the
> logic can be toggled.
>
> There are other boards such as cheza whose bootloaders don't enable this
> logic. Such boards don't implement callbacks to handle the specific SCM
> call so disabling this logic for such boards will be a no-op.
>
> This change is inspired by the downstream change from Patrick Daly
> to address performance issues with display and camera by handling
> this wait-for-safe within separte io-pagetable ops to do TLB
> maintenance. So a big thanks to him for the change and for all the
> offline discussions.
>
> Without this change the UFS reads are pretty slow:
> $ time dd if=/dev/sda of=/dev/zero bs=1048576 count=10 conv=sync
> 10+0 records in
> 10+0 records out
> 10485760 bytes (10.0MB) copied, 22.394903 seconds, 457.2KB/s
> real    0m 22.39s
> user    0m 0.00s
> sys     0m 0.01s
>
> With this change they are back to rock!
> $ time dd if=/dev/sda of=/dev/zero bs=1048576 count=300 conv=sync
> 300+0 records in
> 300+0 records out
> 314572800 bytes (300.0MB) copied, 1.030541 seconds, 291.1MB/s
> real    0m 1.03s
> user    0m 0.00s
> sys     0m 0.54s
>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> ---
>  drivers/iommu/arm-smmu-impl.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
> index 3f88cd078dd5..0aef87c41f9c 100644
> --- a/drivers/iommu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm-smmu-impl.c
> @@ -6,6 +6,7 @@
>
>  #include <linux/bitfield.h>
>  #include <linux/of.h>
> +#include <linux/qcom_scm.h>
>
>  #include "arm-smmu.h"
>
> @@ -102,7 +103,6 @@ static struct arm_smmu_device *cavium_smmu_impl_init(struct arm_smmu_device *smm
>         return &cs->smmu;
>  }
>
> -
>  #define ARM_MMU500_ACTLR_CPRE          (1 << 1)
>
>  #define ARM_MMU500_ACR_CACHE_LOCK      (1 << 26)
> @@ -147,6 +147,28 @@ static const struct arm_smmu_impl arm_mmu500_impl = {
>         .reset = arm_mmu500_reset,
>  };
>
> +static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
> +{
> +       int ret;
> +
> +       arm_mmu500_reset(smmu);
> +
> +       /*
> +        * To address performance degradation in non-real time clients,
> +        * such as USB and UFS, turn off wait-for-safe on sdm845 based boards,
> +        * such as MTP and db845, whose firmwares implement secure monitor
> +        * call handlers to turn on/off the wait-for-safe logic.
> +        */
> +       ret = qcom_scm_qsmmu500_wait_safe_toggle(0);
> +       if (ret)
> +               dev_warn(smmu->dev, "Failed to turn off SAFE logic\n");
> +
> +       return 0;
> +}
> +
> +const struct arm_smmu_impl qcom_sdm845_smmu500_impl = {
> +       .reset = qcom_sdm845_smmu500_reset,
> +};
>
>  struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>  {
> @@ -170,5 +192,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>                                   "calxeda,smmu-secure-config-access"))
>                 smmu->impl = &calxeda_impl;
>
> +       if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm845-smmu-500"))
> +               smmu->impl = &qcom_sdm845_smmu500_impl;
> +
>         return smmu;
>  }

Hi Robin,

How does this change look now? Let me know if there are any concerns.
I will be happy to incorporate them.

Thanks & Regards
Vivek
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
