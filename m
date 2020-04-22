Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01F1A1B4E4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 22:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgDVUXp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 16:23:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:35034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbgDVUXo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 16:23:44 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B6B020767;
        Wed, 22 Apr 2020 20:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587587024;
        bh=NfYIymhT5oWGyg/YrRLc65Jqe+ehrP52z6HvFPRKxrI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Nv7TrJZxEcje1jAyusOdSw0AT2sTjg87vAS8mIsO0/8496AEvjg9e9DU+yQX1f38n
         MnJjfcxMcL02nNt3bSXnk/AYGxUdZQw+axDhA3wcQ0sxIX662pBOV7wtU+sq/jHahe
         LftQDJ5iUCLpCTVmH7OVl5Hp99a+hmEtI0pDTnds=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585224008-15730-2-git-send-email-loic.poulain@linaro.org>
References: <1585224008-15730-1-git-send-email-loic.poulain@linaro.org> <1585224008-15730-2-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH 1/4] soc: qcom: Separate kryo l2 accessors from PMU driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>, bjorn.andersson@linaro.org,
        mturquette@baylibre.com
Date:   Wed, 22 Apr 2020 13:23:43 -0700
Message-ID: <158758702339.163502.6382911440089423525@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Loic Poulain (2020-03-26 05:00:05)
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 9fb35c8..1c76901 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -25,3 +25,4 @@ obj-$(CONFIG_QCOM_APR) +=3D apr.o
>  obj-$(CONFIG_QCOM_LLCC) +=3D llcc-qcom.o
>  obj-$(CONFIG_QCOM_RPMHPD) +=3D rpmhpd.o
>  obj-$(CONFIG_QCOM_RPMPD) +=3D rpmpd.o
> +obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=3D        kryo-l2-accessors.o

Put this after QCOM_LLCC to keep it sorted by Kconfig name?

> diff --git a/drivers/soc/qcom/kryo-l2-accessors.c b/drivers/soc/qcom/kryo=
-l2-accessors.c
> new file mode 100644
> index 0000000..75fd07a
> --- /dev/null
> +++ b/drivers/soc/qcom/kryo-l2-accessors.c
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/spinlock.h>
> +#include <asm/sysreg.h>
> +#include <soc/qcom/kryo-l2-accessors.h>
> +
> +#define L2CPUSRSELR_EL1         sys_reg(3, 3, 15, 0, 6)
> +#define L2CPUSRDR_EL1           sys_reg(3, 3, 15, 0, 7)
> +
> +static DEFINE_RAW_SPINLOCK(l2_access_lock);
> +
> +/**
> + * kryo_l2_set_indirect_reg() - write value to an L2 register
> + * @reg: Address of L2 register.
> + * @value: Value to be written to register.
> + *
> + * Use architecturally required barriers for ordering between system reg=
ister
> + * accesses, and system registers with respect to device memory
> + */
> +void kryo_l2_set_indirect_reg(u64 reg, u64 val)
> +{
> +       unsigned long flags;
> +
> +       raw_spin_lock_irqsave(&l2_access_lock, flags);
> +       write_sysreg_s(reg, L2CPUSRSELR_EL1);
> +       isb();

Any include for barrier.h? Or it comes from spinlock.h?

> +       write_sysreg_s(val, L2CPUSRDR_EL1);
> +       isb();
> +       raw_spin_unlock_irqrestore(&l2_access_lock, flags);
> +}
> +EXPORT_SYMBOL(kryo_l2_set_indirect_reg);
