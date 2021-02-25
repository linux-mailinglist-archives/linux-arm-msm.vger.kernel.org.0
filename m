Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB3A3259CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 23:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhBYWsG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 17:48:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbhBYWsG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 17:48:06 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51ADCC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:47:26 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id cw15so2918354qvb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i3sYXoLcesLS9Els77G1CR101OeDy0tTrMofvec1ABk=;
        b=obFjMpH0gN/9LZsXrZ/mDhUy6SbZodXzAQ0MImC48CTEv/WBF8ZhSS/5nYOlgdGNiu
         dry76yH2mQNJH4D/zyHfJoJylw47pjDS9kUfnx/aVwwbR8PUBiy+WRfw+XM7ejl97HA8
         RwULEa1hr4sU1lhvVd28oC0Uavl6+JF7QfbYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i3sYXoLcesLS9Els77G1CR101OeDy0tTrMofvec1ABk=;
        b=DvbtQ/8oPRD0JujRKvBe4XySHsXP+6261RZ+xkDpFgjAzzzkD/YOsg9jLLbGuJ8MNY
         gDVdodnRfLgA21UJD+ZM7Fw+gTtirX4KStiX2YjOkTwZzxUcXpQFOU9BASHdLMLkSXiW
         4hXXSM7ef8MBLjMeYXVz88BtWfUGWQEcYZot4nrjqZ0f8exFg0LvbrwO8NgD+1IUkOaH
         rkx3QOsG0fEe553YXD8I3QWGovCed2g3AmMlsu0S0NG4NTPcfD3MCQ3QtkFW0eecax/6
         2zVZsFw7DZeEPecYRHz+YJ+XqTWFBNo4HzjUx9pdU7wr8BnEbhdJX6vzWWEWK8qAVNgG
         tTuw==
X-Gm-Message-State: AOAM532P1YfnvB8SA4dWPtO48yFAvtw8YH7e7v1P1u7ECAqsOTJuRj/7
        JEawfsK2AUShuDStjV6ciJRSfXdKqDn10Q==
X-Google-Smtp-Source: ABdhPJyf+Kw9b8Ssj9ay+QQ8H3/H0+OSxfyoRFVI1ZaD8c2yhcNaZiCHuSZgDUH/7waokcux40oW6w==
X-Received: by 2002:a0c:eac9:: with SMTP id y9mr4109938qvp.58.1614293245347;
        Thu, 25 Feb 2021 14:47:25 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id e14sm4447581qte.18.2021.02.25.14.47.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 14:47:25 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id m188so7026472yba.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:47:24 -0800 (PST)
X-Received: by 2002:a25:d3c5:: with SMTP id e188mr181614ybf.345.1614293244387;
 Thu, 25 Feb 2021 14:47:24 -0800 (PST)
MIME-Version: 1.0
References: <20210225103330.v2.1.I6a426324db3d98d6cfae8adf2598831bb30bba74@changeid>
 <20210225103330.v2.3.Ife7768b6b4765026c9d233ad4982da0e365ddbca@changeid>
In-Reply-To: <20210225103330.v2.3.Ife7768b6b4765026c9d233ad4982da0e365ddbca@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 25 Feb 2021 14:47:12 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UYZuoiFRCZS+L8aWJXfXHr5H8xDnzAN9xH07yZaoVRew@mail.gmail.com>
Message-ID: <CAD=FV=UYZuoiFRCZS+L8aWJXfXHr5H8xDnzAN9xH07yZaoVRew@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sc7180: trogdor: Fix trip point
 config of charger thermal zone
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Antony Wang <antony_wang@compal.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Feb 25, 2021 at 10:33 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> The trip point configuration of the charger thermal zone for trogdor
> is missing a node for the critical trip point. Add the missing node.
>
> Fixes: bb06eb3607e9 ("arm64: qcom: sc7180: trogdor: Add ADC nodes and thermal zone for charger thermistor")
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v2:
> - patch added to the series
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index bda983da4eaf..ab4efaece5cb 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -22,9 +22,11 @@ charger_thermal: charger-thermal {
>                         thermal-sensors = <&pm6150_adc_tm 1>;
>
>                         trips {
> -                               temperature = <125000>;
> -                               hysteresis = <1000>;
> -                               type = "critical";
> +                               charger-crit {

If you happen to spin for some other reason, it might not hurt to add
a label to this node.  Best case it'll save a patch in the future when
some OEM decides that they need to adjust this temperature and worst
case it doesn't hurt.

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
