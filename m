Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B05555D17F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235526AbiF0OBy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 10:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235695AbiF0OBx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 10:01:53 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B623F585
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 07:01:52 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id u20so9636887iob.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 07:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pZi7T1rMGJzyRmq1ja7gusZkOZgM2KwX6pmorByJiSY=;
        b=HK9jmoaCsdp9LUmvvra3sABnqNfBfc4ptpUKYawAGeytzkad4B+Q8LK6FA6raQGPZA
         4BdMmL6YL8zR3+/EK3GYGPcanwN2ZtH6/9LesvyGaLjFZRduNc0DmQmTSLU4rfBMwFVH
         OiyQucs5PLIrPfTfn/ra4UwK7Rb2iuqye4J/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pZi7T1rMGJzyRmq1ja7gusZkOZgM2KwX6pmorByJiSY=;
        b=J9XOXcu2yRcSaA0sf6+WQPEGuH/bvW1B0cdQIHrr0eUNDM0uBgUxsOu621FmWxgxyw
         dJI7lfbYaMah1N5/XYDzA7gsfN1WxJuIhIC8ZQNwEdmREjnJ6JxZYdUYGvSN65X1s1I7
         oHrxgM1RB/3qTAzSK/5N5khb7+eRz+ES06m8LdQBJW7OOH7KJ89gjGFU2fHfvao5xjkQ
         uO+r3SOINijBhCIU2LHss9Nw9RoizkbaMNsdxShf+GpOz6W7pJDC6Nd8VzgKxBxYPsj0
         EiAQhh5WVkEOnQhl74hSx4GWPJPAEMJAkKSRnJGhLKQ+dqHqhP2o9DJhmE631HqxftXZ
         upOg==
X-Gm-Message-State: AJIora8EGyb9F0u5sLfvn+mX4sHkMUuGEpxc4FtPr2AUYtU1kvrmU/Rb
        qF+dIq2uq2YiBUN9pDBv6SxG4RV5xeFP7M+E
X-Google-Smtp-Source: AGRyM1tzkVUKagKh6lSYg/L86XYmHFSDAEaQ2BIFLqIanMmwLkGnQKrFFYudrDeEGM8GDXgDxCX4vQ==
X-Received: by 2002:a05:6638:2481:b0:331:df8f:95e0 with SMTP id x1-20020a056638248100b00331df8f95e0mr7601329jat.280.1656338511465;
        Mon, 27 Jun 2022 07:01:51 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id r25-20020a02aa19000000b0032e71f31487sm4812629jam.31.2022.06.27.07.01.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 07:01:50 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id a7so999137ilj.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 07:01:49 -0700 (PDT)
X-Received: by 2002:a92:c566:0:b0:2da:9935:3648 with SMTP id
 b6-20020a92c566000000b002da99353648mr2045111ilj.177.1656338509104; Mon, 27
 Jun 2022 07:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220626013906.885523-1-joebar@chromium.org> <20220625183538.v14.5.Ib62291487a664a65066d18a3e83c5428a6d2cc6c@changeid>
In-Reply-To: <20220625183538.v14.5.Ib62291487a664a65066d18a3e83c5428a6d2cc6c@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 27 Jun 2022 07:01:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UZ7HXrCKFrgjRnQVhd3Mt=ubufayL8gD8QFrRnf8PCXQ@mail.gmail.com>
Message-ID: <CAD=FV=UZ7HXrCKFrgjRnQVhd3Mt=ubufayL8gD8QFrRnf8PCXQ@mail.gmail.com>
Subject: Re: [PATCH v14 5/5] arm64: dts: qcom: sc7180: Add kingoftown dts files
To:     "Joseph S. Barrera III" <joebar@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Jun 25, 2022 at 6:40 PM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> Kingoftown is a trogdor-based board. These dts files are unchanged copies
> from the downstream Chrome OS 5.4 kernel.
>
> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> ---
>
> (no changes since v11)
>
> Changes in v11:
> - Add 'include sc7180-trogdor.dtsi' to sc7180-trogdor-kingoftown-* files.
>
> Changes in v10:
> - Remove 'include sc7180.dtsi' from *all* sc7180-trogdor-kingoftown* files.
>
> Changes in v9:
> - Simplify trackpad enabling (51d30402be75).
>
> Changes in v7:
> - Simplify spi0/spi6 labeling (d277cab7afc7).
> - Remove #include of <arm/cros-ec-keyboard.dtsi>.
>
> Changes in v6:
> - Add #include of <arm/cros-ec-keyboard.dtsi> from v5.4.
>
> Changes in v4:
> - Fix description (no downstream bits removed).
> - Add missing version history.
>
> Changes in v2:
> - First inclusion in series.
>
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  .../dts/qcom/sc7180-trogdor-kingoftown-r0.dts |  44 ++++
>  .../dts/qcom/sc7180-trogdor-kingoftown-r1.dts |  17 ++
>  .../dts/qcom/sc7180-trogdor-kingoftown.dtsi   | 225 ++++++++++++++++++
>  4 files changed, 288 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtsi

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I put this on a google,kingoftown-rev2-sku0 and confirmed that it at
least booted up and showed stuff on the screen.

Tested-by: Douglas Anderson <dianders@chromium.org>
