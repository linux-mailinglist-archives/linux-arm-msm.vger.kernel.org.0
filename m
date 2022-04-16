Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86DFC5037D0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Apr 2022 20:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232742AbiDPSNL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Apr 2022 14:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbiDPSNK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Apr 2022 14:13:10 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 494365E74A
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Apr 2022 11:10:38 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-2edbd522c21so108292917b3.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Apr 2022 11:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TQyXa5N+5U7AWUvtU85FavtGdfF9qIW7BLvXU5Z3KBE=;
        b=Vc0OiWKy7tLZQQEjqbdvpH5yJuYoNbTVn4rHHJX6BWbtkR5qJ2IxK8UY4IqUdmX1li
         K2CrzBj7y+L0HRRFaRekYP4oQdmuHvLXGvTFpIrLF+rIkTYnRVePa4pDPwSbuTblt7/Z
         n0RVgnNoKDU67iRf6gzyq9jVQfk1NlH7xBp/wHf2JoMqWu1fv3vZUiMESmBDaeq2yBFz
         V6bADInIXHmEBA/49EfFyl5hQ2zUv60d7RNIfZpnezBwykBLgjEIBqOWGTjmSI5cKjrj
         MVPw2EKPOjX4hjvAa9kneqMm+gIcR/JbO199SotXZ3pyJbrDkwtWFLx3WyR+Mbo+JDfa
         J+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TQyXa5N+5U7AWUvtU85FavtGdfF9qIW7BLvXU5Z3KBE=;
        b=pmYgfleOlObOFEZQKCpRLuLjY+LWhR62gDhNBe1Xq9xIqA4GwfQVGzCGbHWecp6KR/
         MJ/TlG0vElHrQT/1pgLfnSUzJ4y34Pdb2fma1dwDszsHAcVXbYnaA7l5dQTyOb7XFHlL
         IxS6j4w+c/uorB4Z4irK388bGzu1aqMEAQ9izpd6M4HPr8Gi6Qc2HbRV605bKWIIwDhr
         vLNjAQHBq5uSFrxU6eFAfTbKy3eB9B/OMtp2OUsQFi7jCn2FUU8rEC/5AAhCw7dTj+++
         5Nfwpq87+YASOBbUl8VHCM/fZmja97PNF/XBb8t3HFWOMu8dPBekNN8QPL2tdGhIF5Dh
         xdiQ==
X-Gm-Message-State: AOAM53001ces+CSkEDEeAbbtTwbC7kmSPnPZrCP76/oD5K24xUFZ2k5k
        /XkFe7XVoO77rVohKtMx1QSIuShIVam893jsLBR4ZQ==
X-Google-Smtp-Source: ABdhPJybbVGgDfVnqisaD6M45UdoMxT+mQttilTSKM57Uc1TnQMRMbmQhcdR5SYx5a4IYj/gzzmBTZMLmOrYhUXccF0=
X-Received: by 2002:a81:753:0:b0:2eb:ebe9:ff4f with SMTP id
 80-20020a810753000000b002ebebe9ff4fmr3644787ywh.255.1650132636893; Sat, 16
 Apr 2022 11:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220401231104.967193-1-dmitry.baryshkov@linaro.org> <20220416091229.pwek4wblroaabhio@SoMainline.org>
In-Reply-To: <20220416091229.pwek4wblroaabhio@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 16 Apr 2022 21:10:25 +0300
Message-ID: <CAA8EJppnMesPJrqv=FxEQzuvNM0Xyk_aSg-FUh-smfWcO=Tr2g@mail.gmail.com>
Subject: Re: drm/msm/dsi: fix error checks and return values for DSI xmit functions
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 16 Apr 2022 at 12:12, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Hi Dmitry,
>
> On 2022-04-02 02:11:04, Dmitry Baryshkov wrote:
> > As noticed by Dan ([1] an the followup thread) there are multiple issues
> > with the return values for MSM DSI command transmission callback. In
> > the error case it can easily return a positive value when it should
> > have returned a proper error code.
> >
> > This commits attempts to fix these issues both in TX and in RX paths.
> >
> > [1]: https://lore.kernel.org/linux-arm-msm/20211001123617.GH2283@kili/
> >
> > Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> Thank you for your patience waiting for the requested tests; this patch
> seems to have no adverse effect on our cmdmode panels.
>
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
>
> On the following devices:
> - Sony Xperia X (Loire Suzu, MSM8976), on Linux 5.17;
> - Sony Xperia 10 II (Seine PDX201, SM6125), on -next 20220318;
> - Sony Xperia XA2 Ultra (Nile Discovery, SDM630), on Linux 5.16.
>
> Apologies for the older kernel versions, that's what happens when having
> too many patches to dig through and too little hobby time to send them.
> Let me know if there's a patch dependency that you like to be included.

Thank you for the confirmation! No, no hidden dependencies.

>
> - Marijn
>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index d51e70fab93d..8925f60fd9ec 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -1341,10 +1341,10 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
> >                       dsi_get_bpp(msm_host->format) / 8;
> >
> >       len = dsi_cmd_dma_add(msm_host, msg);
> > -     if (!len) {
> > +     if (len < 0) {
> >               pr_err("%s: failed to add cmd type = 0x%x\n",
> >                       __func__,  msg->type);
> > -             return -EINVAL;
> > +             return len;
> >       }
> >
> >       /* for video mode, do not send cmds more than
> > @@ -1363,10 +1363,14 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
> >       }
> >
> >       ret = dsi_cmd_dma_tx(msm_host, len);
> > -     if (ret < len) {
> > -             pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, len=%d\n",
> > -                     __func__, msg->type, (*(u8 *)(msg->tx_buf)), len);
> > -             return -ECOMM;
> > +     if (ret < 0) {
> > +             pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, len=%d, ret=%d\n",
> > +                     __func__, msg->type, (*(u8 *)(msg->tx_buf)), len, ret);
> > +             return ret;
> > +     } else if (ret < len) {
> > +             pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, ret=%d len=%d\n",
> > +                     __func__, msg->type, (*(u8 *)(msg->tx_buf)), ret, len);
> > +             return -EIO;
> >       }
> >
> >       return len;
> > @@ -2092,9 +2096,12 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
> >               }
> >
> >               ret = dsi_cmds2buf_tx(msm_host, msg);
> > -             if (ret < msg->tx_len) {
> > +             if (ret < 0) {
> >                       pr_err("%s: Read cmd Tx failed, %d\n", __func__, ret);
> >                       return ret;
> > +             } else if (ret < msg->tx_len) {
> > +                     pr_err("%s: Read cmd Tx failed, too short: %d\n", __func__, ret);
> > +                     return -ECOMM;
> >               }
> >
> >               /*



-- 
With best wishes
Dmitry
