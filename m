Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D91761142F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 16:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbiJ1OMw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 10:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbiJ1OMn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 10:12:43 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0E41CC3E6
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 07:12:39 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 63so6268314ybq.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 07:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6z80PFwyq5zF4sE798rB0h2XoymCmatv0a4gNGnqVA=;
        b=Wp/DSxUFZO65+GOpkFzMjak1zC2fi/t9MD6/d3fyiCZlWUxsnkCGWZsxJIbMIWfLJj
         b9Kl7Zki0zOAUjXd7DR5nRjJ8RBot7DuoQD2YpDgBQQ9nl+NIUEbqesT2OJh2a8B0DI7
         IOlKay0atm8kzc/RW2GgHga7waU9LxLN4UToG65UUrmwqRPk7hUTYkBxU+IeMd0nAYDD
         R1mFhGqnOCX7uXO2Y2HYnW9rp3Roa0OSX69EdMwHXuHzMJOhjMZEPZ6w0e09yvlAPhU9
         8mTKacyLeXbdo56I0rWI2a9YL+nvx5+5vp0q2eDGK0BKjFuA88+1vYDnbaJ78zyexlHO
         J3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q6z80PFwyq5zF4sE798rB0h2XoymCmatv0a4gNGnqVA=;
        b=VbZx66O2h+r+VHRrhokquyjeek492R4iN1GB6ZN2jl5AXANFujBT5iH8AhbxihFEyC
         ahsMgV0Ykf69ihCktA/WNME8ui5zdYU1veP30FRburgLqHyhHGEJFo1M6FDvqeoM/2Rs
         z3yS4RFATSXm5nzWr0BRIwKSx57iCNsZjrOR2+0coFqoH6cFCmQ0tLPkkcdNCLY/JTDc
         cL5wTlBkwwjfmLVN54EJXdQ/GBkdmRIbtBv355ngeT1lknbeSFOSoAGS4ZKYRPbH0BzO
         HIlYiIAwhAJDxd5rL+2kQec0PAI8wmHCcx4UQmkYHWiAcGB01lp6QNq7vlYY3YiEfEEI
         DO6A==
X-Gm-Message-State: ACrzQf1QkF+Ln59fIyXvYB39b5et15USNfyUA2wwTQ7PfJsU/LOf7YZA
        Aew7KSAIzLfzd7uxhg6I+L4xHJh6Fvz2KOBYowiufA==
X-Google-Smtp-Source: AMsMyM6OwOcDdtyjMOjpE0CUWcvsWyuJLrnqqc7RWsg5FE+k5sEhC+q8bkBat3SxJGLVKTTd6TjkANKUE5/8lfxZF18=
X-Received: by 2002:a25:dac3:0:b0:6ca:3133:8d58 with SMTP id
 n186-20020a25dac3000000b006ca31338d58mr41892617ybf.516.1666966358681; Fri, 28
 Oct 2022 07:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221028125148.264833-1-dmitry.baryshkov@linaro.org> <20221028134036.s3sunt7loa2gcq6s@baldur>
In-Reply-To: <20221028134036.s3sunt7loa2gcq6s@baldur>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 28 Oct 2022 17:12:27 +0300
Message-ID: <CAA8EJprxt3qKTDBi2t=yw-j-1rs_xOpS66C0r7FCEW3pRW5teQ@mail.gmail.com>
Subject: Re: [PATCH v5] phy: qcom-qmp-ufs: provide symbol clocks
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 28 Oct 2022 at 16:40, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Fri, Oct 28, 2022 at 03:51:48PM +0300, Dmitry Baryshkov wrote:
> > Register three UFS symbol clocks (ufs_rx_symbol_0_clk_src,
> > ufs_rx_symbol_1_clk_src ufs_tx_symbol_0_clk_src). Register OF clock
> > provider to let other devices link these clocks through the DT.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >
> > Changes since v4:
> > - Rebased, dropping merged clk patches
> > - Fix whitespace errors
> > - Add linebreaks to fit into 100 chars limit
> >
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 61 +++++++++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > index e28c45ab74ea..f60e29c68c26 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > @@ -1067,6 +1067,60 @@ static int qmp_ufs_clk_init(struct device *dev, const struct qmp_phy_cfg *cfg)
> >       return devm_clk_bulk_get(dev, num, qmp->clks);
> >  }
> >
> > +static void phy_clk_release_provider(void *res)
> > +{
> > +     of_clk_del_provider(res);
> > +}
> > +
> > +#define UFS_SYMBOL_CLOCKS 3
> > +
> > +static int phy_symbols_clk_register(struct qcom_qmp *qmp, struct device_node *np)
> > +{
> > +     struct clk_hw_onecell_data *clk_data;
> > +     struct clk_hw *hw;
> > +     char name[64];
> > +     int ret;
> > +
> > +     clk_data = devm_kzalloc(qmp->dev,
> > +                             struct_size(clk_data, hws, UFS_SYMBOL_CLOCKS),
> > +                             GFP_KERNEL);
> > +     if (!clk_data)
> > +             return -ENOMEM;
> > +
> > +     clk_data->num = UFS_SYMBOL_CLOCKS;
> > +
> > +     snprintf(name, sizeof(name), "%s::rx_symbol_0", dev_name(qmp->dev));
> > +     hw = devm_clk_hw_register_fixed_rate(qmp->dev, name, NULL, 0, 0);
>
> Wouldn't it be desirable to provide a non-zero frequency for these
> clocks?

Is there a stable frequency that we can provide here? If I remember
correctly from my tests, UFS symbol frequencies vary depending on the
workload (but I might be mistaken here).




-- 
With best wishes
Dmitry
