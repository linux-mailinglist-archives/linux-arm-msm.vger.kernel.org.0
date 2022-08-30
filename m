Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACA05A6C36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 20:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiH3ScR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 14:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbiH3ScR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 14:32:17 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4806C770
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 11:32:16 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id n202so9982249iod.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 11:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=xcvN7vzmA4AKBJywp467PfjgCNS4VLeJNw5kUl0XNfw=;
        b=krT24tS8lLnrcRWkeuNhkLC4fKlI7C2qE1i7m3aESOPSK32X4BPXXdMe+kA4GDqX3a
         Z4DyTB8ZJ+RLji2Jrt6Uva5SxsIm2Sk5EO86xT4ud+eccwIEKjD5PTh98eY3Q7KA4RA8
         kVErahT9BhGCd3TuPriXRt/BinzSjY0qDdSKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=xcvN7vzmA4AKBJywp467PfjgCNS4VLeJNw5kUl0XNfw=;
        b=CyXtOI44XiMx+5JyyhrQbwhnq5t8gEEZrsA8Bk4ve3Pbf213nGGJRRvt95+YNsqX5Z
         3p9YhZtV/KnXRJoSvAk1xHnKq8sBnfxewN2bGZzvMNPUdc9FYNbEPogRwITIte1Gtw58
         z88WL1AVVNmMVqCXEk8VWNjPnRf3HsODL55SnkkRBA26M4HIJAc7+Gon3kozqw/I08Yb
         gW+304XqwaSFty+qD8gYFWSYaywhrPkhx/53EEUpB+fNU5Jn6Loltjx1OuyzrQSs723M
         KSW9eHvENiCfGLyiotS7I/1wXX8Tjh/ohkx2YMTSmZAXCTLycD1ziSnxiJYzAD2n5frt
         udEw==
X-Gm-Message-State: ACgBeo3xEh7JITLQMvYMR4c5VapyiUN5aUJPvH+W7CoMuVxKxf/irVOs
        wmyrX+5c7j9Ff33fHUNwMIVa1HBzE6v60xlE
X-Google-Smtp-Source: AA6agR6FF8I5E/i3lLuu+laDTv/opjK6flOAcfSB2br5ocoqgb/yoeKhfwJLgUAzJLL9J8O2Vktk5g==
X-Received: by 2002:a05:6638:358f:b0:349:ff25:3dc8 with SMTP id v15-20020a056638358f00b00349ff253dc8mr12745394jal.85.1661884335374;
        Tue, 30 Aug 2022 11:32:15 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id g3-20020a02b703000000b0034a56f2f120sm1509654jam.155.2022.08.30.11.32.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 11:32:11 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id y187so9999945iof.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 11:32:11 -0700 (PDT)
X-Received: by 2002:a6b:c8d3:0:b0:688:7041:50d2 with SMTP id
 y202-20020a6bc8d3000000b00688704150d2mr11573220iof.154.1661884330916; Tue, 30
 Aug 2022 11:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220829084732.1.I9ef7f8b909a7afbef9ff2251a98c67033f37b516@changeid>
 <ed582145-3694-b39c-bf54-815279fe93f4@linaro.org>
In-Reply-To: <ed582145-3694-b39c-bf54-815279fe93f4@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 30 Aug 2022 11:31:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UTK=2JGVKHFzC8LnjpvSpdDGVcD48F5bJ0mBVk4cKEfA@mail.gmail.com>
Message-ID: <CAD=FV=UTK=2JGVKHFzC8LnjpvSpdDGVcD48F5bJ0mBVk4cKEfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Adjust LTE SKUs for sc7280-villager
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jimmy Chen <jinghung.chen3@hotmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 30, 2022 at 2:44 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 29/08/2022 18:48, Douglas Anderson wrote:
> > There have been a few changes since the patch ("dt-bindings: arm:
> > qcom: document sc7280 and villager board").
> > * New firmware reports LTE boards as "SKU 512" now. Old firmware will
> >   still report "SKU 0", but that's all pre-production and everyone
> >   will update.
> > * It's been relaized that no "-rev0" boards were ever built that were
> >   WiFi-only. Thus we don't two entries for -rev0.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > This builds upon the patch ("dt-bindings: arm: qcom: document sc7280
> > and villager board") which hasn't landed yet. In theory this could be
> > squashed into that patch.
>
> Unless Bjorn already merged it, this should be squashed.

Sure. Squashed as v9 of Jimmy's patches.

https://lore.kernel.org/r/20220830182923.3720287-1-dianders@chromium.org

-Doug
