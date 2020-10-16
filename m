Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87860290DF2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Oct 2020 01:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392578AbgJPXAF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 19:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392676AbgJPXAE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 19:00:04 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9638C0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 16:00:04 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id d4so2302624vsk.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 16:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AjcM6pBNdKL5o3d8ve/lkVCACu/O1tgEtN+tYkGh2yw=;
        b=iF2R2/ssQkxddNhdSCY+SR/DdKPcWpybr1BBzv5dtATOOyzSE7UXidT0JbEl0kgLTN
         9HQvFn1ytlZv9w/aiPira8m5XEYEhtp5HOX3td36VJAxr9r7X1fnw3HovXXKPyuqUBOT
         D/tQqwRJSO/ekXyd05zmA3xql9+eG0tRcqHqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AjcM6pBNdKL5o3d8ve/lkVCACu/O1tgEtN+tYkGh2yw=;
        b=VOhuxU6rk/O9oVvxiV/Nfz4tCvjc98VlOVKOs7cDhrsIaWeCMK3dRHDgNQRH6G80yw
         toyVxAr/V5K0ayNrRWhyadl32LB9CpxuNPlNnLK3M3LUK4lAdSi8e/352bcuF9gFAb0M
         w4dzCjhTDtQpYwXDgujR+qkAHDrdVxcAO4GUP7t865yQEtWIFwmkhY9GDLcI8XJDv07J
         HC8UXE+6huU4JLaHHiex42yr907RIhjiyJWmJopNRUz3qcuPKMfGScX1pIzFUtzEubwo
         U8qz9R95a5In6F9x56//EceIN461S0+Wv4jgZsbkLQ3w2LH3nGfyc0Rsg5jU9pdnb8Q9
         OxlQ==
X-Gm-Message-State: AOAM533C3gNEpMSVr5uEogPMlJ4W/k4MBojR74JpfLwQREllLzlWu945
        ajqMwu/uPHmNk7V3d46amg7yFT3bN3294Q==
X-Google-Smtp-Source: ABdhPJzpO6rykEBWvN1UhbCWTF3hxR8wp3EmJDW9Mehtxv2Ngxm7/VOW9u1ScoSI/Z4p6p5bQcUlRQ==
X-Received: by 2002:a67:2c4c:: with SMTP id s73mr3902403vss.53.1602889203283;
        Fri, 16 Oct 2020 16:00:03 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id x16sm504968uao.1.2020.10.16.16.00.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2020 16:00:02 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id r78so1003209vke.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 16:00:02 -0700 (PDT)
X-Received: by 2002:a1f:eb02:: with SMTP id j2mr3877230vkh.21.1602889201868;
 Fri, 16 Oct 2020 16:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <1602783939-7177-1-git-send-email-sibis@codeaurora.org>
In-Reply-To: <1602783939-7177-1-git-send-email-sibis@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 16 Oct 2020 15:59:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFgS-d8L5Q3SEXYYtBszmjdMbBLRWRTHX7rQ5i6Hb=4g@mail.gmail.com>
Message-ID: <CAD=FV=XFgS-d8L5Q3SEXYYtBszmjdMbBLRWRTHX7rQ5i6Hb=4g@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180-lite: Tweak DDR/L3 scaling
 on SC7180-lite
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Oct 15, 2020 at 10:53 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Tweak the DDR/L3 bandwidth votes on the lite variant of the SC7180 SoC
> since the gold cores only support frequencies upto 2.1 GHz.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-lite.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-lite.dtsi
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-lite.dtsi b/arch/arm64/boot/dts/qcom/sc7180-lite.dtsi
> new file mode 100644
> index 000000000000..cff50275cfe1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-lite.dtsi
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * SC7180 lite device tree source
> + *
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +&cpu6_opp11 {
> +       opp-peak-kBps = <8532000 22425600>;
> +};
> +
> +&cpu6_opp12 {
> +       opp-peak-kBps = <8532000 23347200>;
> +};

I guess this is OK, but something about it smells just a little
strange...  I guess:

a) There's suddenly a big jump from opp10 to opp11.  You don't use
7216000 at all anymore.

b) The fact that we need to do this at all feels like a sign that
somehow this wasn't designed quite right.

Just brainstorming a bit: If the higher memory rate wasn't useful for
OPP11/12 on the non-lite version of the chip, why are they useful for
that OPP on the lite version?  I guess you're just trying to eek out
the last little bits of performance once the cpufreq is maxed out?  It
almost feels like a better way to do this (though it wouldn't be
monotonically increasing anymore so it wouldn't actually work) would
be to have a few "OPP" points at the top where the cpufreq stops
increasing and all you do is increase the memory frequency.

c) In theory we're supposed to be able to probe whether we're on the
normal, lite, or pro version, right?  Anyway we could tweak this in
code so we don't have to know to include the right dtsi file?


-Doug
