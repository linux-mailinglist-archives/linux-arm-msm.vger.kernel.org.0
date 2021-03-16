Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1326E33DA52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 18:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238493AbhCPRKf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 13:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235784AbhCPRK3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 13:10:29 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF69C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Mar 2021 10:10:29 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id s7so35972951qkg.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Mar 2021 10:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p88jzDekSTGYLM6NKUCLc0y3fKPYlDntP6Vq2tG1VtY=;
        b=L6kcGQMOYDV0GoE1WeGYlx/XvEIji8dIrGM8oI7eCunXASKkCPa6HbYzqYafFka1b7
         lWDKqTWjJzL47mTKi5L92FRpl8AQd/LRlkIQP6+lO9HUr5Rugk89YufXtTM5x4Rkd8ZD
         o6TwhdEolHKZYtqhSLuKNYLp+Q51eN14jaVec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p88jzDekSTGYLM6NKUCLc0y3fKPYlDntP6Vq2tG1VtY=;
        b=dD4G9HogF+2PB8WWFJMZlFvwQW5MB3znzalwns3esFkbOcVe2l9bsboRuT+1zKA2Qx
         NPy5xbatF8kl/unnzqWOHirdi4Ibfd5EG/ckNJuYamvyb2QybvU9lr3QMpisIykeMmJf
         ccL9kPeoB4n9lWLTTdz1rN/4nTIX8mvTqz80VxDWzCCL8AcYhsgeDlXRPRuQxCvXO9Jq
         dIyKiOusas8xlAOwEZSelQChKeJW4qsJ8fHdDVa0BX1/SJh/H26UIisIoH2Sc9MUD11N
         383D5Nblnwua7zpOD/Gqs5M23mlIN3grDt5l5h8fy/FKZ0JiNrPl4cj9d25bYMCxcvhE
         A9PQ==
X-Gm-Message-State: AOAM533Y3/ikyIv+cDcWDR1K7fBS1YOEoT8TcTNBI7MapYxTBozr6S+o
        PFZ2T4GWNhjFYvYaYom2YW5o/gOfXyTsew==
X-Google-Smtp-Source: ABdhPJxhpJ8nV83s9ZCxVUwn7KHMDIsGAC5Smoed+QovSYnrErsJ8zkkA1+lGi2YRrgSPUwgCqbD0A==
X-Received: by 2002:a05:620a:1530:: with SMTP id n16mr42689qkk.288.1615914623764;
        Tue, 16 Mar 2021 10:10:23 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 8sm6226959qkc.32.2021.03.16.10.10.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 10:10:12 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 133so37608400ybd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Mar 2021 10:10:06 -0700 (PDT)
X-Received: by 2002:a25:cf88:: with SMTP id f130mr8233555ybg.476.1615914605769;
 Tue, 16 Mar 2021 10:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210316011516.1314686-1-mka@chromium.org> <20210315181509.v3.2.I4138c3edee23d1efa637eef51e841d9d2e266659@changeid>
In-Reply-To: <20210315181509.v3.2.I4138c3edee23d1efa637eef51e841d9d2e266659@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 16 Mar 2021 10:09:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VmC-y7GX5UTAyv2+MueKtcTkaQnWxLFQNQ+ahO3AiCJA@mail.gmail.com>
Message-ID: <CAD=FV=VmC-y7GX5UTAyv2+MueKtcTkaQnWxLFQNQ+ahO3AiCJA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sc7180: Add pompom rev3
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Mar 15, 2021 at 6:15 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> The only kernel visible change with respect to rev2 is that pompom
> rev3 changed the charger thermistor from a 47k to a 100k NTC to use
> a thermistor which is supported by the PM6150 ADC driver.
>
> Disable the charger thermal zone for pompom rev1 and rev2 to avoid
> the use of bogus temperature values from the unsupported thermistor.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v3:
> - don't add LOCK key
>
> Changes in v2:
> - moved keyboard definition to sc7180-trogdor-pompom.dtsi instead
>   of duplicating it, use cros-ec keyboard for rev1
> - squashed with 'arm64: dts: qcom: sc7180: pompom: Disable charger
>   thermal zone for rev1 and rev2'
>
>  arch/arm64/boot/dts/qcom/Makefile             |  2 +
>  .../dts/qcom/sc7180-trogdor-pompom-r1.dts     | 12 ++++++
>  .../dts/qcom/sc7180-trogdor-pompom-r2-lte.dts |  4 +-
>  .../dts/qcom/sc7180-trogdor-pompom-r2.dts     | 38 +++++--------------
>  .../dts/qcom/sc7180-trogdor-pompom-r3-lte.dts | 14 +++++++
>  .../dts/qcom/sc7180-trogdor-pompom-r3.dts     | 15 ++++++++
>  .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  | 29 ++++++++++++++
>  7 files changed, 83 insertions(+), 31 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
