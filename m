Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 019F630688A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 01:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbhA1AUQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 19:20:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbhA1AT4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 19:19:56 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB4ACC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 16:19:09 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id v19so2115993vsf.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 16:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u/NBHzGj6RokVMEH71m80tmfbt8SHqB96rb6JwsurCk=;
        b=T/WXzvosHH5zwOZyRYu2qakrrk+itFzF4Wls6TyBLH/P5QqLfYaiAfFyjfg3ZEqXff
         wC9Y5Okq5Jmd29IAWb/tflaOJ9fqF/4lbVUdn1qFLL7jJeTtHqA3PlDi21HgTuquz/yK
         QF646m1gMkWvYbLO1YB3IF7BDYN7PHx3T16wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u/NBHzGj6RokVMEH71m80tmfbt8SHqB96rb6JwsurCk=;
        b=hdxaaPiA8MhmG9TLoIzfcyzZUGqhfFOcmjs/O9zg5xR1M+nBhnPPUkcck5EOxhgfnQ
         4kFDI7DSbmAsFDLzmcYxKJ4KY4eXCuhqTwPjDn6qd3EiIFCeVvR+f4OlW9zJTCdxjBHs
         1or3RrWuOgMtxZH56AbtX8yMM+d1I+CPst+p9iEHhGNwicVNaFB2YSe9NsgZGQRFNbuE
         u+O6taWDuyJn+Apfq8GmInSEg9///jONAf3uC4d5rFuM/kdGcOoOln1gaUUZGK2gcqm6
         yXYQcwrTT7LPVt+vmyNWSLZFh7clNLzH4yFKnYvUf5wcuU88KauuYaTF8tbAN6XEaA6L
         4Aow==
X-Gm-Message-State: AOAM532H7F1mF6ObYlDSdis1yDpYyaQ87rGwNamYbruF+8OzrWXPcvKX
        uWlNuXQlPzC8a2Nrc/TB7Aei0er4lsGszoIIMte2FQ==
X-Google-Smtp-Source: ABdhPJy/H0ngURD41PlYIJ7XMA7FJ+OWK5Oxyz6Jo3NZy9LGRsOIOKdJvEB+XWo1PMjlj+fxLTli5mMGDmUwNPLC5co=
X-Received: by 2002:a05:6102:34f:: with SMTP id e15mr10058573vsa.21.1611793148398;
 Wed, 27 Jan 2021 16:19:08 -0800 (PST)
MIME-Version: 1.0
References: <20210127144930.2158242-1-robert.foss@linaro.org> <20210127144930.2158242-6-robert.foss@linaro.org>
In-Reply-To: <20210127144930.2158242-6-robert.foss@linaro.org>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Thu, 28 Jan 2021 08:18:57 +0800
Message-ID: <CANMq1KCUUg3rozY3=snz7YCNwPbbxZtJftCj-a=QPLp2XFSXwA@mail.gmail.com>
Subject: Re: [PATCH v3 05/22] media: camss: Refactor VFE HW version support
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, shawnguo@kernel.org,
        leoyang.li@nxp.com, Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>, Anson.Huang@nxp.com,
        michael@walle.cc, agx@sigxcpu.org, max.oss.09@gmail.com,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 27, 2021 at 10:56 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> In order to support Qualcomm ISP hardware architectures that diverge
> from older architectures, the VFE subdevice driver needs to be refactored
> to better abstract the different ISP architectures.
>
> Gen1 represents the CAMSS ISP architecture. The ISP architecture developed
> after CAMSS, Titan, will be referred to as Gen2.
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> [snip]
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
> new file mode 100644
> index 000000000000..153e0e20664e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
> [snip]
> +/*
> + * vfe_isr - VFE module interrupt handler
> + * @irq: Interrupt line
> + * @dev: VFE device
> + *
> + * Return IRQ_HANDLED on success
> + */
> +static irqreturn_t vfe_isr(int irq, void *dev)
> +{
> +       struct vfe_device *vfe = dev;
> +       u32 value0, value1;
> +       int i, j;
> +
> +       vfe->ops->isr_read(vfe, &value0, &value1);
> +
> +       trace_printk("VFE: status0 = 0x%08x, status1 = 0x%08x\n",
> +                    value0, value1);

Please do not use trace_printk in production code [1,2], it is only
meant for debug use. Consider using trace events, or dev_dbg.

[1] https://elixir.bootlin.com/linux/v5.8/source/kernel/trace/trace.c#L3158
[2] https://elixir.bootlin.com/linux/v5.8/source/include/linux/kernel.h#L766

> [snip]
