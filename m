Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECFD5F0F54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 17:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbiI3PyN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 11:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231795AbiI3PyI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 11:54:08 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E911BF0CD
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 08:53:52 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id e205so3597496iof.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 08:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=fMrHOKaeUaGX1WccJwBEi7t3ptQ4X5xQo8DEkKDJKx8=;
        b=WwNujd1/o4dE97ROR6xIw8z+9qRrcf0pRUVuKQaCCI2ubAhNxIB5p3OwpVyrxYBlm0
         CxfIRr0YrgJtwLNB3ZOe1kgTY+KSLKmcxuNR0OlwJxa/MakrDxT3OgE7p3RnUKJ0r8wU
         /yf6d3Gc0/zOLE+pOzdXSh62L2jvy2nJCtsfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=fMrHOKaeUaGX1WccJwBEi7t3ptQ4X5xQo8DEkKDJKx8=;
        b=USm+b79QmllfLZAn2uA/clvrip6ztx9ZQZR7pWH7CeQecQAiHg8Gx3s3ZyTOGapKUk
         2m+PXhAaXCh+4aBSyg8rTyhE3PHD42Igl07NVKSgj1Z+4juI9PwPwTr/jP/r5HC/HOFJ
         Db/hmSb51MxkGIxSAPcUh/BhiKrAuzYCfZRQ+BgONSKG884LOzRehZ77Cn50JHBpoSrX
         SYXO/DmvCcEQpbejDeUHLASAqISJIGwqVT2Qqbflxita7FtXRGNXMlO1Splo2THu9G92
         yQcqegVWN3oFmjYixtvFRsBDIIgDlHE3R9dk93VDPll81KNDoaLGJ7XvRlMzw4y1xx3n
         +whw==
X-Gm-Message-State: ACrzQf2i0X8e5ohxR6smtvzXvjXiaWbbXRc0GHptewIxvl6IamrkRDso
        zmCKSehnYtLG6aeN2bKQdAHjJTmX5Gl/1n4r
X-Google-Smtp-Source: AMsMyM6ZJp6Lc/QiW3zKCw8OzRx5odXGE6D83hoJXqvEKQ0PkEzMcbG9oDFm1bKz7mpOd9zGbemevQ==
X-Received: by 2002:a02:900a:0:b0:35a:84e4:39aa with SMTP id w10-20020a02900a000000b0035a84e439aamr5073053jaf.191.1664553231282;
        Fri, 30 Sep 2022 08:53:51 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id f59-20020a0284c1000000b0034a596484b0sm1059602jai.148.2022.09.30.08.53.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 08:53:50 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id p202so3591780iod.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 08:53:50 -0700 (PDT)
X-Received: by 2002:a05:6638:2046:b0:35a:ce4a:13a2 with SMTP id
 t6-20020a056638204600b0035ace4a13a2mr5059371jaj.164.1664553229811; Fri, 30
 Sep 2022 08:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220930073754.1391044-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20220930153538.v5.3.I50d04dcbe735dda69995cf1078824d671501869e@changeid>
In-Reply-To: <20220930153538.v5.3.I50d04dcbe735dda69995cf1078824d671501869e@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 30 Sep 2022 08:53:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WB5470LMC4w9sKzn+TxiD6keKKwJn3FqG_PS9T3ajreg@mail.gmail.com>
Message-ID: <CAD=FV=WB5470LMC4w9sKzn+TxiD6keKKwJn3FqG_PS9T3ajreg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: Add touchscreen and touchpad
 support for evoker
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Sep 30, 2022 at 12:38 AM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> Change touchpad and touchscreen node for evoker
> Touchpad: SA461D-1011
> Touchscreen: GT7986U
>
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
> ---
>
> (no changes since v1)

nit: for patman, add:

Series-changes: 5
- Touchscreen / trackpad patch new for v5.

...and then you won't get the confusing "no changes since v1" message.

>  .../boot/dts/qcom/sc7280-herobrine-evoker.dtsi  | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
> index e78072159d54b..c26f19371c8bc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
> @@ -23,16 +23,15 @@ ap_tp_i2c: &i2c0 {
>         status = "okay";
>         clock-frequency = <400000>;
>
> -       trackpad: trackpad@2c {
> -               compatible = "hid-over-i2c";
> -               reg = <0x2c>;
> +       trackpad: trackpad@15 {
> +               compatible = "elan,ekth3000";
> +               reg = <0x15>;
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&tp_int_odl>;
>
>                 interrupt-parent = <&tlmm>;
>                 interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
>
> -               hid-descr-addr = <0x20>;
>                 vcc-supply = <&pp3300_z1>;
>
>                 wakeup-source;
> @@ -43,18 +42,16 @@ ts_i2c: &i2c13 {
>         status = "okay";
>         clock-frequency = <400000>;
>
> -       ap_ts: touchscreen@10 {
> -               compatible = "elan,ekth6915";
> -               reg = <0x10>;
> -               pinctrl-names = "default";
> -               pinctrl-0 = <&ts_int_conn>, <&ts_rst_conn>;

Why did you remove the pinctrl? Those should have stayed.


> +       touchscreen: touchscreen@5d {

nit: it's nice to keep the touchscreen label the same as the other
herobrine boards, so I'd keep this as:

ap_ts: touchscreen@5d {


> +               compatible = "goodix,gt7375p";
> +               reg = <0x5d>;
>
>                 interrupt-parent = <&tlmm>;
>                 interrupts = <55 IRQ_TYPE_LEVEL_LOW>;
>
>                 reset-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
>
> -               vcc33-supply = <&ts_avdd>;
> +               vdd-supply = <&ts_avdd>;

What you have here is fine, but I've heard rumors that we might end up
needing to specify a different IO voltage rail. Right now the goodix
bindings / goodix driver don't handle that. ...anyway, no action items
for you right now but just a heads up.

-Doug
