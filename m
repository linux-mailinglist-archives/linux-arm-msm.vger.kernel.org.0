Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E74DC6F68FD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 12:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbjEDKTw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 06:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbjEDKTr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 06:19:47 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD9AC4C12
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 03:19:44 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3063891d61aso222045f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 03:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683195583; x=1685787583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ccx/IjoVGQ386oMR1clAntwSvb5s3CzDjqqAgx6Wk4Q=;
        b=Ekxk5cdQibh4DwH1Ar94HYkRJ+48FgXAlaw3I5YgOoXXMR5v158LOxAT9cd/DM3eiK
         /pfJTFf48fjphLYGG02OzJXMptg45D4mjw6RyYIzsul7hYdj9gX0UiDzYVuG4vCaAuxY
         +njT3uddiieZpsLw2Izs93xwUu3vJv68xNChTgzAVbmQ7Q/Q+MTMC9NUaLjgusfrFsUO
         y6VEqnbZuvEJw1dTljC7Sw4fn8skTAktmIsgq/z94UoPAGIRa09OgnBPcM4rUjTkWO12
         w06ZXPwkd2fdYOjZcsfPGiEmPww//zV7Jt/n8cw4ngzs2uoBprNQfNkGasyjgjXHnn9H
         HTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683195583; x=1685787583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccx/IjoVGQ386oMR1clAntwSvb5s3CzDjqqAgx6Wk4Q=;
        b=aKcV0b+hUywUE4mUdvDh1hgXdF0fBlZo96U3QnTENMtOtxumEjhxllacXozm/LZ7xR
         NiF3T3C35JgkOOxR26bWgpKM5YySdz1GmyOOadoPcFz1GpVQ5PYsLlZnRIqLckiBDjdX
         VGTqjdMgYjU8o6RlSzzBIcabdSlhDFtkouf+9XsQEaZC5sePZ3jBl0taInC0yX21umv8
         IcOGGYjQVTsaPoBMkXFH4/KG/9gU+bxBKOTnKsCLvs8hK7GqKDwtcnKrH8hLH6vVk/0j
         BWUSGrVd1PzX25yLQ7mvnGtFQAW9ydrh4+Y6tkIXjCRqzegbEAHbnd2qBW1JYtDvSUUX
         3qdQ==
X-Gm-Message-State: AC+VfDyK2Z0jinBrGDXRwSyUsyspLsJRBd0F6gtSo8+wlkt2hgsdnpY9
        P52R4O9yWPNIVFCbJE8HNkvO8ips59L0bUzK7w00Sg==
X-Google-Smtp-Source: ACHHUZ5D7fwYJSN7htRMGzmYSGm3S1Wl/hSN0AfQFikNCxSpzNzDvXTJGoa0Ipttabod65yynja1KQUgDT6ZE3NjDVA=
X-Received: by 2002:a5d:4f01:0:b0:306:2927:b581 with SMTP id
 c1-20020a5d4f01000000b003062927b581mr2011172wru.46.1683195583121; Thu, 04 May
 2023 03:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230504082644.1461582-1-bhupesh.sharma@linaro.org>
 <20230504082644.1461582-6-bhupesh.sharma@linaro.org> <37603081-e41a-2977-7905-2063abed98cc@linaro.org>
In-Reply-To: <37603081-e41a-2977-7905-2063abed98cc@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Thu, 4 May 2023 15:49:31 +0530
Message-ID: <CAH=2Ntybq9nm2TX_tqCZQXAQmD7Mcuhex1QiVAbko5at7xBXPQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: qrb4210-rb2: Enable EUD debug peripheral
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, andersson@kernel.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 4 May 2023 at 15:38, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> On 4.05.2023 10:26, Bhupesh Sharma wrote:
> > Since the USB-C type port on the Qualcomm QRB4210-RB2 board
> > can be set primarily in a 'device' configuration (with the default
> > DIP switch settings), it makes sense to enable the EUD debug
> > peripheral on the board by default by setting the USB 'dr_mode' property
> > as 'otg'.
> >
> > Now, the EUD debug peripheral can be enabled by executing:
> >  $ echo 1 > /sys/bus/platform/drivers/qcom_eud/1610000.eud/enable
> >
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 27 +++++++++++++++++++++++-
> >  1 file changed, 26 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > index 1a0776a0cfd0..0ce72f1ebc10 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > @@ -30,6 +30,10 @@ vph_pwr: vph-pwr-regulator {
> >       };
> >  };
> >
> > +&eud {
> > +     status = "okay";
> > +};
> > +
> >  &qupv3_id_0 {
> >       status = "okay";
> >  };
> > @@ -253,7 +257,28 @@ &usb {
> >
> >  &usb_dwc3 {
> >       maximum-speed = "super-speed";
> > -     dr_mode = "peripheral";
> > +
> > +     /*
> > +      * There is only one USB DWC3 controller on QRB4210 board and it is connected
> > +      * via a DIP Switch:
> > +      * - to either an USB - C type connector or an USB - A type connector
> > +      *   (via a GL3590-S hub), and
> > +      * - to either an USB - A type connector (via a GL3590-S hub) or a connector
> > +      *   for further connection with a mezzanine board.
> > +      *
> > +      * All of the above hardware muxes would allow us to hook things up in
> > +      * different ways to some potential benefit for static configurations (for e.g.
> > +      * on one hand we can have two USB - A type connectors and a USB - Ethernet
> > +      * connection available and on the other we can use the USB - C type in
> > +      * peripheral mode).
> > +      *
> > +      * Note that since the USB - C type can be used only in peripehral mode,
> > +      * so hardcoding the mode to 'peripheral' here makes sense.
> > +      *
> > +      * However since we want to use the EUD debug device, we set the mode as
> > +      * 'otg' here.
> > +      */
> > +     dr_mode = "otg";
> So if I understand correctly, EUD works via the type-C connector and
> only when the switch is turned such that the type-C connector is in use?

That's right - which by the way is also the default selection (USB-c
type) as per the board schematics.
The whole point of adding the text here was to explain the possible
connections available on the board and why we selected the 'otg' mode.

Thanks,
Bhupesh
