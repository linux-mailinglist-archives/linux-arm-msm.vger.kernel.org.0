Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0CAB1D05B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 05:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgEMD6A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 23:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727107AbgEMD6A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 23:58:00 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2BEC061A0C;
        Tue, 12 May 2020 20:57:58 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w10so5402418ljo.0;
        Tue, 12 May 2020 20:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6jF36zZV4YkOjjEEZcxlJOpsCDyfDyyD6Cte3hhe7uI=;
        b=Y9XbgXJjX+6b/Our6/e59lW7rMJCRfJO6yDzwJR1u5a+RhYXDVOjWj/MbixpXAlrui
         tpctqJeC0xlc287Dtv0RlCI9Uv3LvCKCDQXDdmqtodxedvelQUWwAUVoxR6kLxDRPBIw
         nnlXH487hTvFkMAeK0XmN2uMADfBTpXbEGCqUQGJTLs+JgJVU8YQdc+gqaczKCjXk/ww
         dLIJykfm8bjmnLHP0QANywpt1aM1jPQBkTI2QIZlSz01me1G9dgncXGPbNmvdgzbDn0n
         //rocSpNRMykFJEJry29KXF0+QRYEnhnH9lQeHG/nK33ixD2idsoyYRUOyXRCyNyY5bP
         eGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6jF36zZV4YkOjjEEZcxlJOpsCDyfDyyD6Cte3hhe7uI=;
        b=VCNKvjEATSZPebT/uMWXPV+aiuagMob3Tt1iB7EcG7jewtj56cnFMjN5bs1b9WjOxB
         ptl56bTA7Gvi39MNjBjV7Z0Qalv+GWqZq+mv/GHfD99gvlhG6D90Yo6akDRV4cOd95q8
         fUDcMV2pykWwBOwc0JZcCXphLySwNYeFRaohvewJiZHZaPuxWu+IbAQwQ9BPWpstV/jC
         +YXuHn2WnqnthCdP/hD4H3kbBNjTRR04Zt1zGxNW7WgLgrYJLW23yQ9h58I0D/uFFjUT
         weYBy2P9C/VyO+S5U5Vmm8opsF1tP86HWehZ90NVq831ZWprbmIT3YGapmLa5VAbEg3L
         TlEg==
X-Gm-Message-State: AOAM533uKDX8Xhqatz8+O2rNWsb9r7+25n2poKInd8Qp4rh6UO7d8/4W
        cKGloUYyLQldsBSmSsNEU8/4HvKkLmr4A/sFl0d8L/6m
X-Google-Smtp-Source: ABdhPJxfEIMDcND6bucfnbiaUf/kKcp6Jv+7+dq6HYchFLm1kBE0LRNTGoe8f4XeHYTkPvaQm5pT9GMkoE/Myrf+lFY=
X-Received: by 2002:a2e:9490:: with SMTP id c16mr15831301ljh.110.1589342276826;
 Tue, 12 May 2020 20:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200513005441.1102586-1-bjorn.andersson@linaro.org> <20200513005441.1102586-4-bjorn.andersson@linaro.org>
In-Reply-To: <20200513005441.1102586-4-bjorn.andersson@linaro.org>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Wed, 13 May 2020 11:57:42 +0800
Message-ID: <CADBw62oF=o4xxar8yO+xwhLa3h2oD_GD_tWhFo1DDTJGgFnEjg@mail.gmail.com>
Subject: Re: [PATCH 3/4] hwspinlock: qcom: Allow mmio usage in addition to syscon
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 13, 2020 at 8:55 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> In all modern Qualcomm platforms the mutex region of the TCSR is forked
> off into its own block, all with a offset of 0 and stride of 4096. So
> add support for directly memory mapping this register space, to avoid
> the need to represent this block using a syscon.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/hwspinlock/qcom_hwspinlock.c | 72 +++++++++++++++++++++-------
>  1 file changed, 56 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
> index f0da544b14d2..d8d4d729816c 100644
> --- a/drivers/hwspinlock/qcom_hwspinlock.c
> +++ b/drivers/hwspinlock/qcom_hwspinlock.c
> @@ -70,41 +70,81 @@ static const struct of_device_id qcom_hwspinlock_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, qcom_hwspinlock_of_match);
>
> -static int qcom_hwspinlock_probe(struct platform_device *pdev)
> +static struct regmap *qcom_hwspinlock_probe_syscon(struct platform_device *pdev,
> +                                                  u32 *base, u32 *stride)
>  {
> -       struct hwspinlock_device *bank;
>         struct device_node *syscon;
> -       struct reg_field field;
>         struct regmap *regmap;
> -       size_t array_size;
> -       u32 stride;
> -       u32 base;
>         int ret;
> -       int i;
>
>         syscon = of_parse_phandle(pdev->dev.of_node, "syscon", 0);
> -       if (!syscon) {
> -               dev_err(&pdev->dev, "no syscon property\n");
> -               return -ENODEV;
> -       }
> +       if (!syscon)
> +               return ERR_PTR(-ENODEV);
>
>         regmap = syscon_node_to_regmap(syscon);
>         of_node_put(syscon);
>         if (IS_ERR(regmap))
> -               return PTR_ERR(regmap);
> +               return regmap;
>
> -       ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 1, &base);
> +       ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 1, base);
>         if (ret < 0) {
>                 dev_err(&pdev->dev, "no offset in syscon\n");
> -               return -EINVAL;
> +               return ERR_PTR(-EINVAL);
>         }
>
> -       ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 2, &stride);
> +       ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 2, stride);
>         if (ret < 0) {
>                 dev_err(&pdev->dev, "no stride syscon\n");
> -               return -EINVAL;
> +               return ERR_PTR(-EINVAL);
>         }
>
> +       return regmap;
> +}
> +
> +static const struct regmap_config tcsr_mutex_config = {
> +       .reg_bits               = 32,
> +       .reg_stride             = 4,
> +       .val_bits               = 32,
> +       .max_register           = 0x40000,
> +       .fast_io                = true,
> +};
> +
> +static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
> +                                                u32 *offset, u32 *stride)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct resource *res;
> +       void __iomem *base;
> +
> +       /* All modern platform has offset 0 and stride of 4k */
> +       *offset = 0;
> +       *stride = 0x1000;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       base = devm_ioremap_resource(&pdev->dev, res);

I think you can use devm_platform_ioremap_resource(pdev, 0) to
simplify your code, otherwise looks good to me.
Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>

> +       if (IS_ERR(base))
> +               return ERR_CAST(base);
> +
> +       return devm_regmap_init_mmio(dev, base, &tcsr_mutex_config);
> +}
> +
> +static int qcom_hwspinlock_probe(struct platform_device *pdev)
> +{
> +       struct hwspinlock_device *bank;
> +       struct reg_field field;
> +       struct regmap *regmap;
> +       size_t array_size;
> +       u32 stride;
> +       u32 base;
> +       int i;
> +
> +       regmap = qcom_hwspinlock_probe_syscon(pdev, &base, &stride);
> +       if (IS_ERR(regmap) && PTR_ERR(regmap) == -ENODEV)
> +               regmap = qcom_hwspinlock_probe_mmio(pdev, &base, &stride);
> +
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
>         array_size = QCOM_MUTEX_NUM_LOCKS * sizeof(struct hwspinlock);
>         bank = devm_kzalloc(&pdev->dev, sizeof(*bank) + array_size, GFP_KERNEL);
>         if (!bank)
> --
> 2.26.2
>


-- 
Baolin Wang
