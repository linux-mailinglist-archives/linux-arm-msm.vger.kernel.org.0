Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC4C71DA2E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 22:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgESUil (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 16:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgESUik (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 16:38:40 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3149EC08C5C0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 13:38:39 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id 62so463315vsi.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 13:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tW6EW4cSWh55qYp1WeU6PQVnxEHSMZHc8fHW3A+VMb8=;
        b=OWwWqJvjeWW5njlNWGf2uPt037V4dYIPW2MnkBt9ha+MFBeJ2Zh5pekuhMEvAdkK/d
         d9voue+0cyZCDGJ2CAFCUlJ2VxKdotHK1mYnwFQc4n0ITdCEcJ5NyFGYyDEUMs2eW0Oz
         6mWKRFm0oOYPh+S/Cmr+e2voxCarx5IHw3Vi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tW6EW4cSWh55qYp1WeU6PQVnxEHSMZHc8fHW3A+VMb8=;
        b=mi71Uw2xXMAyhJEVU+4hNvhf+teYKvIsgyShxiFhq4rS//b9cldtgYCOyBgaVFjOSN
         mjCkKqlmSI7ULj2pZ7Np9DPoz0Jgur9UNE44nBgdUrzxkqfP6MoaIRh0vl3xRa5iIm6w
         mxQo33LRfvuyePpKO5sw3XUsEw9q4UWSIQ57YHmV1d7Y+wiC8xM8Q43kCXMEsLWgDg13
         J2WqM4sRddoCI5VPr909OLxYgOkkl5qjn62Wzdn9DzKSS6DtNJ/tgQBDHppTeGHUMr4Y
         wpJgOnCI31aVj/UeBHHjj0jSRHZeEcRieio1eiol45LDk9HD7UBDCcA2b35Z6HHUQm2o
         9OKQ==
X-Gm-Message-State: AOAM532YWZ6vS7r2l0vGfbvS9lWKpYgm9WULgd40oMW5CSB5XEmlaxRs
        DGdq5XeaIfGYzBKW2/W/SBOdUIynf7M=
X-Google-Smtp-Source: ABdhPJyJS7gw8u4r5JsKQKKoBAcAqECjnYPjXnPKETn1qhUz4cS5n029Aq7AYy+lrs4uMkf1ww1jEw==
X-Received: by 2002:a67:7d4b:: with SMTP id y72mr972153vsc.59.1589920718223;
        Tue, 19 May 2020 13:38:38 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id m10sm89853vsd.10.2020.05.19.13.38.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 13:38:37 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id z12so447086uap.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 13:38:37 -0700 (PDT)
X-Received: by 2002:ab0:b13:: with SMTP id b19mr1046847uak.91.1589920717000;
 Tue, 19 May 2020 13:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <1589914405-6674-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1589914405-6674-1-git-send-email-pillair@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 19 May 2020 13:38:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VEDDm1cHQNLVitMLxMYvGA-pON+mdBj6SGn46yhw0jVQ@mail.gmail.com>
Message-ID: <CAD=FV=VEDDm1cHQNLVitMLxMYvGA-pON+mdBj6SGn46yhw0jVQ@mail.gmail.com>
Subject: Re: [PATCH v10] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 19, 2020 at 11:53 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> +               wifi: wifi@18800000 {
> +                       compatible = "qcom,wcn3990-wifi";
> +                       reg = <0 0x18800000 0 0x800000>;
> +                       reg-names = "membase";
> +                       iommus = <&apps_smmu 0xc0 0x1>;
> +                       interrupts =
> +                               <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH /* CE0 */ >,
> +                               <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH /* CE1 */ >,
> +                               <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH /* CE2 */ >,
> +                               <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH /* CE3 */ >,
> +                               <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH /* CE4 */ >,
> +                               <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH /* CE5 */ >,
> +                               <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH /* CE6 */ >,
> +                               <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH /* CE7 */ >,
> +                               <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH /* CE8 */ >,
> +                               <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH /* CE9 */ >,
> +                               <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH /* CE10 */>,
> +                               <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH /* CE11 */>;
> +                       memory-region = <&wlan_fw_mem>;
> +                       status = "disabled";
> +               };
> +
>                 config_noc: interconnect@1500000 {
>                         compatible = "qcom,sc7180-config-noc";
>                         reg = <0 0x01500000 0 0x28000>;

For completeness sake, I'll also point out that the WiFi node is also
sorted incorrectly.  0x18800000 comes after 0x01500000.


-Doug
