Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 932E5580327
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jul 2022 18:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235401AbiGYQy3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 12:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233730AbiGYQy2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 12:54:28 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93B31D311
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 09:54:27 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id c185so3589005iof.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 09:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HvrUZBm5LsKei4fIZMwkQ+fL7k8/v8AK47ayvjQgN40=;
        b=P15865NysUnTLmnqK1OoUgYSPe9uvPN4l4nqp/RKL2+Pt70R4p6l4ZWZOWYuePoxLu
         7cAI/BzETvBuXcxOvrr652runSRgF3hWaW314qAUVudbjBzVzncZV2KDsxEHi1Gv1nFK
         FCO93vsPX+rPZKcuGYmNELyOW5OYVEDScT6l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HvrUZBm5LsKei4fIZMwkQ+fL7k8/v8AK47ayvjQgN40=;
        b=uB2Ac2jN2oXZx/cnv4AUxdzGsk7kBm/E8TcyeVa2WGl4vbGDt0FD4ay0KkhB2ocM1d
         EH6oMlhuE8phFmDxf53TP+5Hmi9erdUKu+BGaBV2nmOVvmQtKXAx2sAJiy1ZCAHozzhY
         yQYjdQv50V9evfget1WUmJZfBKm9mmOiF6BHFZMFtqg1MRyuUKi0vwHzlPhKaWIJZaEJ
         dUeJVj5GawP+WGPg2H458BCOwEMNkENbbua5RQzJwDbxZT0t8aC/DX3HxKUUGusCE/H4
         9W0T6XNyuMgZ+P4ev22D9NEqyGukX9LU0dZgbFaRhTQxrIOKf79zh3gsOhQYjO3NNjo4
         6e5g==
X-Gm-Message-State: AJIora8RS2UurSuE88Ne4PeN9e5d9C9F5J3tW0LmYk/jNVAtgsv8xbiN
        StMIk3rzC6/MZwcVMKKrfnoOUdNmVJFTftH7
X-Google-Smtp-Source: AGRyM1vQnTJk911L7zVDRJavi9cbyfUJI6fCdgCea9qrS8TOtpESW4NV5dzyUQiV+9vrbbI+wB/JtQ==
X-Received: by 2002:a6b:f302:0:b0:67b:e1c3:7cb5 with SMTP id m2-20020a6bf302000000b0067be1c37cb5mr4560536ioh.206.1658768066717;
        Mon, 25 Jul 2022 09:54:26 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id ay2-20020a5d9d82000000b0067bce43163esm6103892iob.42.2022.07.25.09.54.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 09:54:26 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id x64so9273206iof.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 09:54:25 -0700 (PDT)
X-Received: by 2002:a6b:5f0d:0:b0:67b:da10:933e with SMTP id
 t13-20020a6b5f0d000000b0067bda10933emr4535654iob.56.1658768065455; Mon, 25
 Jul 2022 09:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
 <b1aafb00-f00a-2621-ad51-fb2f7491dace@linaro.org> <CAA8EJpp_tSCR3CLGSD_qq62MzjVQOYGspY345aNfNSu1tMM=Vw@mail.gmail.com>
 <CAD=FV=WGtDMmB08py8D6jc0cv3xGsn5Rfc0MObQbEV=CiisBYg@mail.gmail.com> <76defcb3-8566-286a-d953-54c4a2b04782@linaro.org>
In-Reply-To: <76defcb3-8566-286a-d953-54c4a2b04782@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 25 Jul 2022 09:54:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XhYD0U=FAaGV0aLJhZ4LrULXrLptDV7=D8A91Kx=Qkgg@mail.gmail.com>
Message-ID: <CAD=FV=XhYD0U=FAaGV0aLJhZ4LrULXrLptDV7=D8A91Kx=Qkgg@mail.gmail.com>
Subject: Re: [PATCH 0/3] dt-bindings: arm: qcom: define schema, not devices
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 25, 2022 at 9:41 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/07/2022 18:25, Doug Anderson wrote:
> > Let's look specifically at the device tree file for the LTE board. One
> > way to look at it is that the dts for the LTE board should have
> > compatibles:
> >   compatible = "lte", "wifi-only"
> >
> > The above matches the normal device tree mentality. It says: "hey, if
> > you've got a lte driver for this board then use it; otherwise use the
> > wifi-only driver".
> >
> > However, the above is actually broken for the bootloader use case. The
> > bootloader is trying to pick a device tree and, to the bootloader, the
> > above says "you can use this dts for either an lte board or a
> > wifi-only board". That's bad. If the bootloader picks this device tree
> > for a wifi-only board then the OS will try to initialize lte and
> > things will crash. To go further, if you think about it things
> > actually work fine if the wifi-only device tree says it's compatible
> > with the LTE board. This is why I say it's opposite... ;-)
>
> This is not specific to "bootloaders" but your specific implementation
> of entire chain. How you described it, you have dependent pieces -
> user-space must use the same DTB as bootloader chosen, but bootloader
> makes different choices than user-space. It's perfectly fine to make
> these choices different, but then user-space should not depend on
> something which was/was not initialized in bootloader.

I think there's a misunderstanding here.

Currently the ChromeOS bootloader doesn't use the device tree to
control its flow at all. ...but the ChromeOS bootloader is in charge
of picking the device tree to give to the kernel.

Specifically I'm not aware of any mechanism in the kernel where you
can give it a pile of device tree files and have it pick the right
one. I believe that the official ABI says that it's up to the
bootloader to provide the device tree to the kernel. This is right out
of `Documentation/arm64/booting.rst`

A FIT image is, as far as I'm aware, a standard way to bundle a kernel
together with many device trees. The idea here is that the bootloader
should grab the kernel out and whichever device tree it decides is the
right one. It should then boot the kernel and give it the correct
device tree.

-Doug
