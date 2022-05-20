Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB4C852F43E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 22:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiETUIS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 16:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235883AbiETUIN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 16:08:13 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064FD19CEE9
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:08:09 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id ck4so13254475ejb.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hqeP5rdlyT9Ojb1o/Y+c7yG6gWz0o8Ya2ALrWN0i/h4=;
        b=A6tATn1zlH3Ye7b1NXpayU3ySugX53PcyxEpLXWt24vF/to1SKuRlxfJtdLplXWXfq
         A0noXbVj2uPtYxryi/uvbqcqTk9arKbWsQfNmCzY6HfD5gaBDDeHd01OvZk9xwBmCj94
         IDsrT/ihzL2ZJm9QRmpcunQ9T/lHggMYZ7qko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hqeP5rdlyT9Ojb1o/Y+c7yG6gWz0o8Ya2ALrWN0i/h4=;
        b=qHJ/8weHzVAChCcdHOBVWbIc8FWgfLvlKRcZX7A8BIppcZaw2BFi0I18anVei4s9/X
         2P8gbJ0RK7kRNseQKtre110KZARBRTS3YvYIw4CaMXsTXgUK6E3FPa2K/hVvjZBlSLbc
         ox9HxkWv8xFky+X2bUsrBI1wP2phS9clvCll7xqAx33A6lpqOAnfZMg/vDkWbBCMOoTU
         j3UeMKZu0K+0F84prFtLQ7ytN7dS/Oxb47xaaXOg5wNvnJWZGyw5x0b0m5RNN6YDoEaH
         MLLlyDbNw8AFexTuCU6IO5XIgU7x+o3dMUEDRujd5yHL5a8xAqfsMzklLslgqucSPcdQ
         2tgg==
X-Gm-Message-State: AOAM531Bh86j74vPPOTxCf8iKNnJtnt/KpM5Bv9RliH+9iML1FkKafLs
        whkKORcQRvjeHdbmdEN7NYRM0/6XQMnliX5P7lA=
X-Google-Smtp-Source: ABdhPJy3DdYRdySJZsyl6VHeqLvXNKiMKZ7Dr5368wkyo5cVF0q3r4EIocrDwgpKotkMoqUH+Eo4Gg==
X-Received: by 2002:a17:907:1c0b:b0:6f5:64f4:91df with SMTP id nc11-20020a1709071c0b00b006f564f491dfmr10402205ejc.750.1653077287161;
        Fri, 20 May 2022 13:08:07 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id l14-20020a056402028e00b0042617ba63d0sm4658030edv.90.2022.05.20.13.08.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 13:08:06 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id i82-20020a1c3b55000000b00397391910d5so1452393wma.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:08:06 -0700 (PDT)
X-Received: by 2002:a05:600c:3c99:b0:392:b49c:7b79 with SMTP id
 bg25-20020a05600c3c9900b00392b49c7b79mr9500680wmb.199.1653077285694; Fri, 20
 May 2022 13:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220518155252.1.I176d4254c79cfaafa38cbe36f066f02f819df9b6@changeid>
In-Reply-To: <20220518155252.1.I176d4254c79cfaafa38cbe36f066f02f819df9b6@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 20 May 2022 13:07:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+4JhN8EScFDZAiduo6zy7c0pbr6EOJpSo25ctOW-zRA@mail.gmail.com>
Message-ID: <CAD=FV=X+4JhN8EScFDZAiduo6zy7c0pbr6EOJpSo25ctOW-zRA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Enable wifi for Chrome OS boards
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Kevin Lund <kglund@google.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, May 18, 2022 at 3:53 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Enable the 'wifi' and 'remoteproc_wpss' nodes for all sc7280
> based Chrome OS boards. Delete the corresponding entries from
> sc7280-idp.dtsi since this file includes sc7280-chrome-common.dtsi.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 13 +++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 11 -----------
>  2 files changed, 13 insertions(+), 11 deletions(-)

Looks right to me. You're also adding the firmware-name, but:

* That's in the bindings.

* The name you have there matches what's in the linux-firmware
repository in commit 0d5e9f7e0aa1 ("ath11k: WCN6750 hw1.0: add to
WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1")

Hmmm, I guess one question is whether this same firmware would also be
used for other, non-Chrome sc7280 devices. If so then the
firmware-name probably belongs straight in sc7280.dtsi? I suppose that
could always happen in a future change if/when we have other sc7280
devices and it's clear that they're sharing firmware. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug
