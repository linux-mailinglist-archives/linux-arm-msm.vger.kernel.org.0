Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4FD441F00
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Nov 2021 18:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhKARMb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 13:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbhKARMb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 13:12:31 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3ADC061714
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Nov 2021 10:09:57 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id x9so11574654ilu.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Nov 2021 10:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=06y9LPENRB0cLa2ThUDGeREBwekAGDiXTO1jiEpj+M4=;
        b=Ou+OTrGFXXKsJ9P9LaK1MrW6DAKCtk5CLB8nIgVQUE2E0dPzIuDrpuTBvz/C+UTFnE
         NhxiNgmXO2NePy77yjAzHbU/QZCl7AOkJhGVNV2TKL09T7uROpmiw4VA517zbrY6Wnvc
         JLuhkFSgtxjvlW9SrK+I0hOVg0I5k2Ggwtczk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=06y9LPENRB0cLa2ThUDGeREBwekAGDiXTO1jiEpj+M4=;
        b=H6wM0Hgo18TR9SywUWCqttLhvXlqettlbmuhLllG47vhHKrDmXyT4Z8Y0FEUuWSu4S
         WrCrwvC2nxjwO/GgticUy6Wf/fP8pkw9oV+iQ+wPJfHN3uwwclCXm9Yt745kbigQs3Lg
         mRve/N2CCdtdPS+a5ZTq0qM+OSNre65uX0jPLAw+pt4Ueg9wKYC8+UF3Pg9KJUxbstdb
         a+X1uwk8qF6M4tCjt2Tb1I4nBrUCvG4MzvDTcXorptVtoBD9H0QkuXZJdE6wQXP5ymxU
         8/EDPTYLLG9/tvSQHCEvbAn+U7bhDuBvnL8a4o/vhYRaiEN/q44DhTaxCcBI61qCrPa9
         p80g==
X-Gm-Message-State: AOAM531XQqRSp0AMaoeX3pNYNRBcYFsJ27L4MoUEaaPhoHvLQ611XPXy
        HAgPWk8+XrqI1BwwMJ7gdAe12UUj956MFA==
X-Google-Smtp-Source: ABdhPJw3LlEEt7CKdgqQUJqSXKHjgZve846eqx/Ua9M/Ej5seOBdrY+Z5oCQE92z7e3uOZLskFEZTQ==
X-Received: by 2002:a92:c54f:: with SMTP id a15mr21236779ilj.266.1635786596980;
        Mon, 01 Nov 2021 10:09:56 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id l6sm8673469ilt.31.2021.11.01.10.09.55
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 10:09:56 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id f10so14654404ilu.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Nov 2021 10:09:55 -0700 (PDT)
X-Received: by 2002:a05:6e02:15cb:: with SMTP id q11mr21224592ilu.180.1635786595591;
 Mon, 01 Nov 2021 10:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211029152647.v3.1.Ie17e51ad3eb91d72826ce651ca2786534a360210@changeid>
 <20211029152647.v3.3.Ie56f55924f5c7706fe3194e710bbef6fdb8b5bc6@changeid>
In-Reply-To: <20211029152647.v3.3.Ie56f55924f5c7706fe3194e710bbef6fdb8b5bc6@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 1 Nov 2021 10:09:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XCGAFd1-h9FbeToRPpJSbVRU8AuvWUw2yyOt6KMwy_uQ@mail.gmail.com>
Message-ID: <CAD=FV=XCGAFd1-h9FbeToRPpJSbVRU8AuvWUw2yyOt6KMwy_uQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: sc7180: Support Lazor/Limozeen rev9
To:     Philip Chen <philipchen@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Oct 29, 2021 at 3:27 PM Philip Chen <philipchen@chromium.org> wrote:
>
> Support Lazor/Limozeen rev9 board where Parade ps8640 is added as the
> second source edp bridge.
>
> To support different edp bridge chips in different board revisions,
> now we move the #incldue line of the edp bridge dts fragment (e.g.
> sc7180-trogdor-ti-sn65dsi86.dtsi) from "sc7180-trogdor-lazor.dtsi" to
> per-board-rev dts files.
>
> Since the edp bridge dts fragment overrides 'dsi0_out', which is
> defined in "sc7180.dtsi", move the #incldue line of "sc7180.dtsi" from
> "sc7180-trogdor-lazor.dtsi" to per-board-rev dts files too, before
> the #include line of the edp bridge dts fragment.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> Retroactively edit the v2 change log slightly
>
> (no changes since v2)
>
> Changes in v2:
> - Explain why "sc7180.dtsi" is moved out of "sc7180-trogdor-lazor.dtsi"
>   in the commit message.
> - In limozeen (nots) r5 dts, replace "google,rev5-sku5" with
>   "google,lazor-rev5-sku5" and sort it
> - In limozeen (nots) r9 dts, drop the support for "sku5".
> - In limozeen r4 dts, remove the redundant "google,lazor-rev6-sku4" and
>   add "google,lazor-rev7-sku4".
> - Do not add panel compatible in -r9 dts files.
> - Move the #include line of gpio.h from sc7180.dtsi to the bridge dts
>   fragments, and factor out this change to patch 1/3.
>
>  arch/arm64/boot/dts/qcom/Makefile             |  9 +++-
>  .../sc7180-trogdor-lazor-limozeen-nots-r4.dts |  2 +-
>  .../sc7180-trogdor-lazor-limozeen-nots-r5.dts | 31 +++++++++++++
>  ...sc7180-trogdor-lazor-limozeen-nots-r9.dts} |  8 ++--
>  .../qcom/sc7180-trogdor-lazor-limozeen-r4.dts | 46 +++++++++++++++++++
>  ...s => sc7180-trogdor-lazor-limozeen-r9.dts} |  6 ++-
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts |  2 +
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts |  2 +
>  .../dts/qcom/sc7180-trogdor-lazor-r3-kb.dts   |  9 +++-
>  .../dts/qcom/sc7180-trogdor-lazor-r3-lte.dts  |  9 +++-
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts |  8 +++-
>  .../dts/qcom/sc7180-trogdor-lazor-r9-kb.dts   | 22 +++++++++
>  .../dts/qcom/sc7180-trogdor-lazor-r9-lte.dts  | 30 ++++++++++++
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r9.dts | 18 ++++++++
>  .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  3 --
>  15 files changed, 188 insertions(+), 17 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts
>  rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-lazor-limozeen-nots.dts => sc7180-trogdor-lazor-limozeen-nots-r9.dts} (60%)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts
>  rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-lazor-limozeen.dts => sc7180-trogdor-lazor-limozeen-r9.dts} (82%)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dts

Reviewed-by: Douglas Anderson <dianders@chromium.org>
