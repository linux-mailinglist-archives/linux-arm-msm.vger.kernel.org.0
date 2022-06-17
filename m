Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDE354FEB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 23:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383567AbiFQUj2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 16:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383572AbiFQUjN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 16:39:13 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B31F066AE1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:35:57 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id u12so10741801eja.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZYo99Jl3LGzr9HFTUWTWp9Lg1npO6/JXpviJKHAL/ZI=;
        b=Bm8rJ/ViS0zAwjBWQ+cmcwjfW+NOujryCz5hKE/NOw/jntdQqKtcL5OpsEAbIuMKQI
         oNEDUZk1fuJZucdeF05VF8G54Ha/DJEfkAT+Cq3D/Yj722b4Ewoi9sZdCBRhzAKVWna2
         ZtHkZHaniYlY5uR7AXaDT7pHr7ojzFwUTGmsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZYo99Jl3LGzr9HFTUWTWp9Lg1npO6/JXpviJKHAL/ZI=;
        b=6WQxX2o9zrbyFzwQE20SMW1Wb6GSLKs/dd6rvXxd2E3TrXKz9KS3u4aKXq4nMYOKW0
         rqv3MFaTq6f8J6qxDduqdq0NF3X/L3Q6PUVC8V1rnwhtJvyOgU0QqZYMOS6jzHBgUjnl
         SAqzr+7C78zmJ6z18kEgrn+nw5P68FMZ0FUYYZnMSfnsIj7dl739nrLJ1TUwSlE4OmjM
         iSk41qKluqy+Hr5D2d0+hwtWqvgnKfbZPpnzdYieuyRQh5MGdhGxliDQekFzKThNwy9R
         yv+Wsp2xyh2R1Yhz/T/vwJeplCJCyziz8q5MYhfe1k2HH9XbTPuPPs7ZssqstZ9wUWkP
         72EA==
X-Gm-Message-State: AJIora/4ZFhn2meDy1N/EnAxa70thP5pSy1a53h8XUNk29SKpvMewAmz
        FigPgvUI/PBDdPoQQvrwWXOMFdSwQdppO5dNeAs=
X-Google-Smtp-Source: AGRyM1tPpYtbp36/7nLkudJ3O1IVply11tEeQC1UDBFPZlje6Ak/p4Av0dU0mqOhz+qHw8I7udgx7g==
X-Received: by 2002:a17:907:7d8a:b0:71d:59ca:e4bf with SMTP id oz10-20020a1709077d8a00b0071d59cae4bfmr4195455ejc.418.1655498155212;
        Fri, 17 Jun 2022 13:35:55 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id ky22-20020a170907779600b00705cd37fd5asm2564684ejc.72.2022.06.17.13.35.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 13:35:54 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id l126-20020a1c2584000000b0039c1a10507fso2904392wml.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:35:53 -0700 (PDT)
X-Received: by 2002:a05:600c:2054:b0:39c:3f73:3552 with SMTP id
 p20-20020a05600c205400b0039c3f733552mr12095980wmg.15.1655498153414; Fri, 17
 Jun 2022 13:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220617111021.v6.1.I9e299d3fa6fbf50df6fc7207050bf5c3a7bf4c61@changeid>
 <20220617111021.v6.3.I0977b1a08830d0caa8bfb1bdedb4ecceac709a7f@changeid>
In-Reply-To: <20220617111021.v6.3.I0977b1a08830d0caa8bfb1bdedb4ecceac709a7f@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 17 Jun 2022 13:35:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XyAbZEhny4_NdnEZD44VgatdODfY36ufx_omg7gApV4A@mail.gmail.com>
Message-ID: <CAD=FV=XyAbZEhny4_NdnEZD44VgatdODfY36ufx_omg7gApV4A@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] arm64: dts: qcom: sc7180: Add quackingstick dts files
To:     "Joseph S. Barrera III" <joebar@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jun 17, 2022 at 11:12 AM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
> new file mode 100644
> index 000000000000..d39f43757932
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
> @@ -0,0 +1,324 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Quackingstick board device tree source
> + *
> + * Copyright 2021 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180.dtsi"
> +
> +ap_ec_spi: &spi6 {};
> +ap_h1_spi: &spi0 {};
> +
> +#include "sc7180-trogdor.dtsi"

In my response to your v5, I explicitly pointed out that you should
take into account this patch that landed downstream since you posted
your v5.

https://crrev.com/c/3652958

...but you don't seem to have taken it into account.

-Doug
