Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFED830736C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 11:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbhA1KI3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 05:08:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbhA1KHs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 05:07:48 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7919C0613ED
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 02:07:07 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id q20so3679706pfu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 02:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FS3sXlWa1a9CJeGm7yuJDVISGCvP2szSJ0Qe9lOwid0=;
        b=sIVf3EmrBQVyo69/ikM3B14VNYgALXDSfENkZeCmczqXizbbIRBtHtEv2h3cU4kIsb
         zrtfI+WVyYpF/fuqGjVRDSD7zeWefsyQYS862TXrX0JGsTowQVfCO/jf3Hl10pTuTua2
         5fyQylydnjbaIVGtTewY+Q7soCRuuOCltdYyPHeC/hYyOQyukLW1woDzLySCVDQygL4i
         7ycFGeoM8PtmNXJCI9K+H0Ka2IajDL1H6WW+MQSzoG56f1FzZxaajYNWa4x5pFXHTAmr
         e4Q+iyZNe+VI+3QvkREjSeRXwamEbEdtqkQLBWvX3WPRX4QTFXUmiNbPOt2EqYUkooxJ
         NAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FS3sXlWa1a9CJeGm7yuJDVISGCvP2szSJ0Qe9lOwid0=;
        b=Awp4qHy9qAL4GguOV44dEX9HhFZEipY9EcV9s7YiZnOg+gMXiLNY0c0ulDFkiLe4/t
         FQZ6IC7D4ZWDo1HWVdoEkvT2EelKWs7ax24AxrgALNz++RWDLoY7EXn3VCfE09VPKLkF
         vNy09lecbkgksc0Dmz24z0IlfUhyTI6eJ+OFBdRKk3S3R5bEyE+zxR7gLnJuMbtGpkUo
         OG6dVh74myGjNksqN8CI0M+vS2qnSyEoT+gmalFYFYH950u5X7Rl9CV1tH8QFx89S5H4
         8YEdXODVh22oa2Vur2huAAX65cl+SaGuMJaGrYNMzItoRxp54KZ2g4du9PlR5LieOFm+
         DKWQ==
X-Gm-Message-State: AOAM533HH+nPKOaIrK3RC5q0krG5bPIyqPuNMgADegUTmNkojWNfOwTG
        ed59pqok0gLX2Y+z3VCn/OJJgCrJFtnxFfHABT7Ycg==
X-Google-Smtp-Source: ABdhPJxPbc4H2Su8ybjWXQk/Og3L8DQf6PlhyWKLU2HLctWQaqk8uS5XrfuSX3qH9kdI+DowIQXusQJeaAyMO6EXVcQ=
X-Received: by 2002:a63:5b4f:: with SMTP id l15mr5187293pgm.339.1611828427188;
 Thu, 28 Jan 2021 02:07:07 -0800 (PST)
MIME-Version: 1.0
References: <20210127144930.2158242-1-robert.foss@linaro.org>
 <20210127144930.2158242-6-robert.foss@linaro.org> <CANMq1KCUUg3rozY3=snz7YCNwPbbxZtJftCj-a=QPLp2XFSXwA@mail.gmail.com>
In-Reply-To: <CANMq1KCUUg3rozY3=snz7YCNwPbbxZtJftCj-a=QPLp2XFSXwA@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 28 Jan 2021 11:06:56 +0100
Message-ID: <CAG3jFyse7+s+FQ_R+dOkkAmMggLMYouuZ0oePLc-8nc00+CN8Q@mail.gmail.com>
Subject: Re: [PATCH v3 05/22] media: camss: Refactor VFE HW version support
To:     Nicolas Boichat <drinkcat@chromium.org>
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
        MSM <linux-arm-msm@vger.kernel.org>,
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

Hey Nicolas,

Thanks for the review!

On Thu, 28 Jan 2021 at 01:19, Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Wed, Jan 27, 2021 at 10:56 PM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > In order to support Qualcomm ISP hardware architectures that diverge
> > from older architectures, the VFE subdevice driver needs to be refactored
> > to better abstract the different ISP architectures.
> >
> > Gen1 represents the CAMSS ISP architecture. The ISP architecture developed
> > after CAMSS, Titan, will be referred to as Gen2.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> > [snip]
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
> > new file mode 100644
> > index 000000000000..153e0e20664e
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
> > [snip]
> > +/*
> > + * vfe_isr - VFE module interrupt handler
> > + * @irq: Interrupt line
> > + * @dev: VFE device
> > + *
> > + * Return IRQ_HANDLED on success
> > + */
> > +static irqreturn_t vfe_isr(int irq, void *dev)
> > +{
> > +       struct vfe_device *vfe = dev;
> > +       u32 value0, value1;
> > +       int i, j;
> > +
> > +       vfe->ops->isr_read(vfe, &value0, &value1);
> > +
> > +       trace_printk("VFE: status0 = 0x%08x, status1 = 0x%08x\n",
> > +                    value0, value1);
>
> Please do not use trace_printk in production code [1,2], it is only
> meant for debug use. Consider using trace events, or dev_dbg.

Ack, this is a copy paste error, I'll add a commit fixing all
occurrences of this in the driver

>
> [1] https://elixir.bootlin.com/linux/v5.8/source/kernel/trace/trace.c#L3158
> [2] https://elixir.bootlin.com/linux/v5.8/source/include/linux/kernel.h#L766
>
> > [snip]
