Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C99A772743
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 07:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbfGXFVd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 01:21:33 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:37294 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfGXFVd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 01:21:33 -0400
Received: by mail-ua1-f65.google.com with SMTP id z13so17979673uaa.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2019 22:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TUsGf36TR4zlfyZSONaQ2nNxLJ4zkif4e/MgEKViAz4=;
        b=aWLGjXXD+oLlguItxfZRUOIn8T8Nje8/gOnWCoXkXgvqeUP4ezau25tSjmqF9z6RA6
         Vf+yyb1u/mCLrIK7FeGMRbbuDdsgE0KvDf/ZfjnST3PBkVQMKyrfZ1SZ+psxll/JRzJY
         A9HT3f4EkKTesOQ42LqkD+n1eDIFP5tUwdYMX1P4IouWLiijs35a7ryGhRK8xU3n+sjC
         DgH+12qgrB5sx0T+pMsXq7hQHa9ztAPutpGqR/jpvBhm92oSTKUcBI951LFbPWTSF7de
         30SrT8OrluAFwjTpfCCyu28hLVoVZV6ctd6tcN+UuoZuGitE9SLXozoJtTvqIp/SIvMO
         c0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TUsGf36TR4zlfyZSONaQ2nNxLJ4zkif4e/MgEKViAz4=;
        b=NK7SPUIC5AQp/gf2pHUUkT5XPJlmkAk6mP4DA5CbaqAXJqiIsf3qkXT8+3YfFsXtxT
         9nL2qo3Gvw04RrYEs3EVgcqwX0/OO6Pk5wiz+zW0H+BUrPAPI/1ePwsBfjxKwTcMplb6
         ja+RGnJN/VOM1ug/Z37vvwEZVWeOfnlQZIzSYr09nFkokAc289uGLCHBwwWGUc/+zg95
         lrOJN5tkvfLDHMp6bSh+0UyQFQs8x/Q0cGKBxHlaWoRPyXRewz7297G9+Mi8Yyib3ddT
         7FYrmIdMhsL7a1smIuWFcuyNEj/2m1Bl15G0VhhQji5/6FvXnehoJgIhdbHBtRqfiVeD
         XXZw==
X-Gm-Message-State: APjAAAWYqzCSJDe+SDcyiAPBXDCODdOyilRR03/SDnuwlwAE9DGnRDJM
        Pqjhdk0cOXWkLVGHzp35W6uhDszqxddfYjbP+Kk=
X-Google-Smtp-Source: APXvYqx5YalSorpO7IZK3t1/IsRJ+b1kzXKZLmI/iwekFfex4mBt6J6nQ4dB9P+ncPdqjbX2ksCgGQxh8j1A5K8CMFY=
X-Received: by 2002:ab0:23ce:: with SMTP id c14mr24279200uan.77.1563945692171;
 Tue, 23 Jul 2019 22:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190724044906.12007-1-vkoul@kernel.org> <20190724044906.12007-5-vkoul@kernel.org>
In-Reply-To: <20190724044906.12007-5-vkoul@kernel.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Wed, 24 Jul 2019 10:51:21 +0530
Message-ID: <CAHLCerP-9dNG30enhb779=FGFLUZCR2EdjDQEXjt0jkQPvaJtA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sdm845: remove macro from unit name
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 24, 2019 at 10:20 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> Unit name is supposed to be a number, using a macro with hex value is
> not recommended, so add the value in unit name.
>
> arch/arm64/boot/dts/qcom/pm8998.dtsi:81.18-84.6: Warning (unit_address_format): /soc/spmi@c440000/pmic@0/adc@3100/adc-chan@0x06: unit name should not have leading "0x"
> arch/arm64/boot/dts/qcom/pm8998.dtsi:81.18-84.6: Warning (unit_address_format): /soc/spmi@c440000/pmic@0/adc@3100/adc-chan@0x06: unit name should not have leading 0s
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>


> ---
>  arch/arm64/boot/dts/qcom/pm8998.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> index 051a52df80f9..dc2ce23cde05 100644
> --- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> @@ -78,7 +78,7 @@
>                         #size-cells = <0>;
>                         #io-channel-cells = <1>;
>
> -                       adc-chan@ADC5_DIE_TEMP {
> +                       adc-chan@6 {
>                                 reg = <ADC5_DIE_TEMP>;
>                                 label = "die_temp";
>                         };
> --
> 2.20.1
>
