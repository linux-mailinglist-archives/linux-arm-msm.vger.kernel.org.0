Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40B8B533437
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 02:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbiEYAR3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 May 2022 20:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbiEYAR0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 May 2022 20:17:26 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30996D3BA
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 17:17:23 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id ck4so34229096ejb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 17:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1LTAegdLBV4hZX2uHYmjk/dla88XNgBTSaD0OB3B+8M=;
        b=kKPLSMN6xMS2w0FJsTSTn5fBnoTHeJt+9CeeTUzN+aQ9dQimk0L1Aafe33w0wWCux7
         74qHznQVKBOW7spBnui2O1O6Gso4TYWEKlsqH/WH0dTLemoEDscHt4LEYFMSq1bfqCKC
         KQPHqZL7iohxsDVP7GweVtzVtE0Klup1Gh8qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1LTAegdLBV4hZX2uHYmjk/dla88XNgBTSaD0OB3B+8M=;
        b=proOyfzeWN5yt15hczIJT0imk0vgLridWmRuUMW+3u0ryE0neDL5A4PiJho+OJy6F6
         W4hqwAr4Bcf0nsqU0uv8HkEDHaD+cORjfPdxW8epiNEmkEK4ejiCooo+IhDA8vnATXeU
         x7a1dGCG8u+JDbHWrW20+7ezcaisveiqng8Qi6J8+5P9xgGd3zR/FuBl/61vyosqFqp0
         0MJ/E/uqQwDMzPsOKp6z+X2kIsMqqgQ5DTUhI9PVmXvmaK2i34HxKN6PeVDUIDeQoIqC
         9FchraNRxnmarciofRvPmqa3J+xQm++gne/MYV+mH5uh4mS/5h8cnYn3LceXqsVEoSGC
         Ap9g==
X-Gm-Message-State: AOAM530eXgMIxPW9/7Ab9CGdsmhsyVuHT2DQ0h8ci2zcPAKzUb8h1w8j
        6CDTTtR0tZ1Zn+x4VrArKQqHM45POOGCbbZTFsM=
X-Google-Smtp-Source: ABdhPJw5b1UeGF6Gz/K1wZoijPWQNFqzTD6eKefCfsR7q8LccCPbxyPzX/jg/sy8t4/yvGS6yBGeNQ==
X-Received: by 2002:a17:907:7e9d:b0:6fe:ef3f:1edd with SMTP id qb29-20020a1709077e9d00b006feef3f1eddmr10010873ejc.130.1653437841228;
        Tue, 24 May 2022 17:17:21 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id n24-20020a056402515800b0042ad0358c8bsm10095061edd.38.2022.05.24.17.17.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 17:17:19 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id y24so3793624wmq.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 17:17:19 -0700 (PDT)
X-Received: by 2002:a05:600c:2e53:b0:397:4730:ee7a with SMTP id
 q19-20020a05600c2e5300b003974730ee7amr5788119wmf.118.1653437839019; Tue, 24
 May 2022 17:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <1653082028-10211-1-git-send-email-quic_khsieh@quicinc.com> <1653082028-10211-3-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1653082028-10211-3-git-send-email-quic_khsieh@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 24 May 2022 17:17:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTtXZ9onaAZCsog=ENFb7_rsNhy=wviROAFMd05ycJqg@mail.gmail.com>
Message-ID: <CAD=FV=XTtXZ9onaAZCsog=ENFb7_rsNhy=wviROAFMd05ycJqg@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] phy: qcom-qmp: add regulator_set_load to dp phy
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 20, 2022 at 2:27 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> This patch add regulator_set_load() before enable regulator at
> DP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index b144ae1..a93e153 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -3130,6 +3130,7 @@ struct qmp_phy_cfg {
>         int num_resets;
>         /* regulators to be requested */
>         const char * const *vreg_list;
> +       const unsigned int *vreg_enable_load;
>         int num_vregs;
>
>         /* array of registers with different offsets */
> @@ -3346,6 +3347,10 @@ static const char * const qmp_phy_vreg_l[] = {
>         "vdda-phy", "vdda-pll",
>  };
>
> +static const unsigned int qmp_phy_vreg_enable_load[] = {
> +       21800, 36000
> +};

I'm a little confused. Why make a new parallel structure? Don't you
want to set a load for everyone who's using "qmp_phy_vreg_l"? It seems
like it would be better to do something like this:

struct qmp_regulator_data {
  const char *name;
  unsigned int load;
};

struct qmp_regulator_data qmp_phy_vreg_l[] = {
  { .name = "vdda-phy", .load = 21800 },
  { .name = "vdda-pll", .load = 36000 },
};

Right now some random smattering of devices are setting the load but
not others...

>  static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
>         .type                   = PHY_TYPE_USB3,
>         .nlanes                 = 1,
> @@ -3711,6 +3716,7 @@ static const struct qmp_phy_cfg sc7180_usb3phy_cfg = {
>         .reset_list             = sc7180_usb3phy_reset_l,
>         .num_resets             = ARRAY_SIZE(sc7180_usb3phy_reset_l),
>         .vreg_list              = qmp_phy_vreg_l,
> +       .vreg_enable_load       = qmp_phy_vreg_enable_load,
>         .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),

One downside of the parallel structures is that there's nothing
enforcing that ARRAY_SIZE(qmp_phy_vreg_l) ==
ARRAY_SIZE(qmp_phy_vreg_enable_load), though the code below relies on
it.


> @@ -6175,6 +6186,18 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> +       if (cfg->vreg_enable_load) {
> +               for (i = 0; i < cfg->num_vregs; i++) {
> +                       ret = regulator_set_load(qmp->vregs[i].consumer,
> +                                               cfg->vreg_enable_load[i]);
> +                       if (ret) {
> +                               dev_err(dev, "failed to set load at %s\n",
> +                                               qmp->vregs[i].supply);

nit: indentation of the 2nd line seems a bit off?

> +                               return ret;
> +                       }
> +               }
> +       }

Feels like the above snippet belongs in qcom_qmp_phy_vreg_init() ?
