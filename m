Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8465154FE13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 22:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237678AbiFQUF5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 16:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234703AbiFQUF4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 16:05:56 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C823A5B8AF
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:05:55 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id o7so10666807eja.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=84H7ZXb1eHOGnR6hMHCvky7gquFVieaFdlbDiS5ZCm0=;
        b=Q5DVApFrs0pH6BvUbcxI+mDXaiSweterCD+P4MWFO6Y93WD1AyRYi8Njqa/TN1jP7y
         vD6XKCNPJM/JbkAi3C4Ej1RsWL+5nBBxbtqydo/DEMYUQZkO4q7IzOTn57uPmZRbruVr
         1n5drP9oEQW34cnHA8A2UivmnHGlIdp3R05c4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=84H7ZXb1eHOGnR6hMHCvky7gquFVieaFdlbDiS5ZCm0=;
        b=0dpC+Ky3aArRCWw9o4cHiLvyzqATFu9uIl5+GeN4grS+j3E7Ho3b1OLG94fcd5J3Rc
         bD1SNnhAaVcD9QHJ1M7kOLjDmXuVWIDG4IKbk/1xLIHGDcLFCJUcxte3n47q02MP+Qcb
         aXD8VSFsn7W6t+nmUKyAWDsG4ro0jzLQ5Wn/Gi2wAucJW0YVvLkg9PhjUIcfbXNASqMo
         /KFQJPpua7bPDZG7ci0MLYvBuRSVsBxUzkhav9EdHrOVdohjNlh95ZDzuO0431m3Gp3b
         H169+QttGpBi5t3QZS3tczBh1RNcnVjAKs2wLBri3CYYALtHEGT4McwA6QXcgo59PZWJ
         4V6Q==
X-Gm-Message-State: AJIora/4Di2MO6sgoqinw8WvW9b1oiCIIB8hIBZPpSbfG5KvPw23rhbc
        8n+bOBq0eHHfzEwkmjN4TLjEvKMnuXkgQzjJ1TQ=
X-Google-Smtp-Source: AGRyM1u3WHOCxTXpp0NIPEEr97OSPnsWK8+1893u2q2E2FsQ0CyNJ/Z5rnp+FXQf9E08ENEwDA5zqw==
X-Received: by 2002:a17:907:c202:b0:710:8d1c:2501 with SMTP id ti2-20020a170907c20200b007108d1c2501mr10441635ejc.377.1655496354225;
        Fri, 17 Jun 2022 13:05:54 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090632c800b006feb8cebbbfsm2566153ejk.6.2022.06.17.13.05.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 13:05:52 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id c21so7024414wrb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:05:52 -0700 (PDT)
X-Received: by 2002:a5d:5c08:0:b0:219:e5de:72af with SMTP id
 cc8-20020a5d5c08000000b00219e5de72afmr10604185wrb.513.1655496351987; Fri, 17
 Jun 2022 13:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220617111021.v6.1.I9e299d3fa6fbf50df6fc7207050bf5c3a7bf4c61@changeid>
 <20220617111021.v6.6.I423a007e8c4451bd1d091fcb65d035e5dcfc9a9d@changeid>
In-Reply-To: <20220617111021.v6.6.I423a007e8c4451bd1d091fcb65d035e5dcfc9a9d@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 17 Jun 2022 13:05:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VEukZVJY=EXxhGsjQ-_mVzU-qLfNmALd_ZDh1qVjo7Jg@mail.gmail.com>
Message-ID: <CAD=FV=VEukZVJY=EXxhGsjQ-_mVzU-qLfNmALd_ZDh1qVjo7Jg@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] arm64: dts: qcom: Remove duplicate sc7180-trogdor
 include on lazor/homestar
To:     "Joseph S. Barrera III" <joebar@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
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
> From: Stephen Boyd <swboyd@chromium.org>
>
> The sc7180-trogdor-{lazor,homestar}-*.dtsi files all include
> sc7180-trogdor.dtsi and sc7180-trogdor-lazor.dtsi or
> sc7180-trogdor-homestar.dtsi, so including it here in the
> sc7180-trogdor-{lazor,homestar}.dtsi file means we have a duplicate
> include after commit 19794489fa24 ("arm64: dts: qcom: Only include
> sc7180.dtsi in sc7180-trogdor.dtsi"). We include the sc7180-trogdor.dtsi
> file in a board like sc7180-trogdor-lazor-r1.dts so that we can include
> the display bridge snippet (e.g. sc7180-trogdor-ti-sn65dsi86.dtsi)
> instead of making ever increasing variants like
> sc7180-trogdor-lazor-ti-sn65dsi86.dtsi.
>
> Unfortunately, having the double include like this means the display
> bridge's i2c bus is left disabled instead of enabled by the bridge
> snippet. Any boards that use the i2c bus for the display bridge will
> have the bus disabled when we include sc7180-trogdor.dtsi the second
> time, which picks up the i2c status="disabled" line from sc7180.dtsi.
> This leads to the display not turning on and black screens at boot on
> lazor and homestar devices.
>
> Fix this by dropping the include and making a note that the
> sc7180-trogdor-{lazor,homestar}.dtsi file must be included after
> sc7180-trogdor.dtsi
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Cc: "Joseph S. Barrera III" <joebar@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Fixes: 19794489fa24 ("arm64: dts: qcom: Only include sc7180.dtsi in sc7180-trogdor.dtsi")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>
> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> ---
>
> Changes in v6:
>  - First inclusion of this patch.
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi    | 8 ++++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)

Ah, now I see that you did have this patch, but you put it last, not
first. This is an important bugfix that we're hoping to land as soon
as possible. It should be the first patch in the series. ...or just
don't include it in your series and point to Stephen's patch.

-Doug
