Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7611055013A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 02:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237829AbiFRAQG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 20:16:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236246AbiFRAQG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 20:16:06 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A0017597
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 17:16:05 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id y79so6050941iof.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 17:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gkj3uMdCjmsHzflHOakxzyYQKVRj/sTnpglWgNUCgvI=;
        b=R6lsSQ5dAFDDxHfBx6/RJfG7mPr/fGPTiJLoHZFflQBajhfuDa6e4hxp3GVqeC8Xt6
         EQS4Y0R3LvNlgQbzsaeiCOeLETyIuZoldmmcUmXDS5hdcwic5aUOsgQ9J8V1FLTwtVQt
         0q56sLpON5p6nayE71wvi/wt3+o0MUr5MsHfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gkj3uMdCjmsHzflHOakxzyYQKVRj/sTnpglWgNUCgvI=;
        b=FC3dcZdmU1wrYx6yVAeVvGvV6IcVwLdLQhehimbrZjc063bkMhXHHptxonlQ1OnHa6
         g2mmwwR3YJYG2Tdg1TkqbBQKjG+oohBcYab6Zw+BVZxz860KKiKpDGruu6zB3DMEClwu
         hsjkbvZkGfYigqMN/r0nfrFSYOPoZEQiRPKoElExhdM6bw1slzhVhMB1cjAZUKoKhqks
         kwchH9xRXpfLVvLEqwJcpug4myuoN3TpswHlWWI3DQt4kE8nvtBd+Mz5QdFVDv5RwXhH
         9tPytpt+YP3IUJ0scmWyLE68VIBFMnwaxiufgpdJpuTBZ/FhEF60XC5JZLim0XPsDX4g
         W2oQ==
X-Gm-Message-State: AJIora93iyUWLocOTcuD8WfIXRVDEGc41UBdfOAItzRB0Y5K5BE941Q8
        RCXjkwUuOg1ksgnlI5X1RJJbET1iBkVMnxd8jXs=
X-Google-Smtp-Source: AGRyM1sViLUW4N1pwRIWdFGkZD3Ivg8LyYZAp3RqXkE9PxgyWYTz69mj+LaC28XR7aM/YET+i+Mehg==
X-Received: by 2002:a05:6638:14d0:b0:332:12c9:e359 with SMTP id l16-20020a05663814d000b0033212c9e359mr6669384jak.309.1655511364616;
        Fri, 17 Jun 2022 17:16:04 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id g2-20020a92dd82000000b002cde6e352ffsm2929451iln.73.2022.06.17.17.16.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 17:16:04 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id b138so6027918iof.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 17:16:03 -0700 (PDT)
X-Received: by 2002:a02:c012:0:b0:331:67b8:3d7e with SMTP id
 y18-20020a02c012000000b0033167b83d7emr6783017jai.244.1655511363436; Fri, 17
 Jun 2022 17:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220617164000.v8.1.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
 <20220617164000.v8.2.I0977b1a08830d0caa8bfb1bdedb4ecceac709a7f@changeid>
In-Reply-To: <20220617164000.v8.2.I0977b1a08830d0caa8bfb1bdedb4ecceac709a7f@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 17 Jun 2022 17:15:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V9RaRuvx+N1FXszA4vKJiUXhZfGcdEFXWPg+DGq=p9kw@mail.gmail.com>
Message-ID: <CAD=FV=V9RaRuvx+N1FXszA4vKJiUXhZfGcdEFXWPg+DGq=p9kw@mail.gmail.com>
Subject: Re: [PATCH v8 2/5] arm64: dts: qcom: sc7180: Add quackingstick dts files
To:     "Joseph S. Barrera III" <joebar@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
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

On Fri, Jun 17, 2022 at 4:40 PM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> Quackingstick is a trogdor-based board. These dts files are copies from
> the downstream Chrome OS 5.4 kernel, but with downstream bits removed.
>
> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

At this point enough things keep being broken that I'd rather you keep
my "Reviewed-by" tag off for now in the next version.


> ---
>
> (no changes since v7)
>
> Changes in v7:
>  - Incorporated changes from Stephen's "Simplify!" series.
>
> Changes in v5:
> - Removed extra newline
> - Added comment that compatible will be filled in per-board

Not a huge deal, but your version history is missing a mention about
incorporating the deletion of the usb_c1 node.

-Doug
