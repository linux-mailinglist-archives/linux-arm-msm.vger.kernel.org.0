Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 203E95188AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 17:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238320AbiECPjT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 11:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238617AbiECPip (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 11:38:45 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2603CC14
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 08:35:13 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id z26so19335609iot.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 08:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0FsDSj/gYms8H9/x7f/lo1swpziM40WrdI9xhy57C3M=;
        b=T+1w+41qi/SUDALtKFt5pALUPTwdTk3xL6e2vcdgxWaYXP8KJCATmyp6AB5/XG2R2n
         cxttGDxrpTrugEQTya0kvYSuTkOZB1gTsbf6SCSBFv8Ju68fEv9fI1LHVIa6ZhlOMkew
         aDkzgsQDFYdieq/KdrXWnc4F+7LcvhIMoJbC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0FsDSj/gYms8H9/x7f/lo1swpziM40WrdI9xhy57C3M=;
        b=DxWajf221UCjPSjQSpBP18tWCBFC6iS4zYp3UkR3mw5q6La8B/n2RIgFW7Oh4VKgPR
         JVDawrOewLvz12lGhLimwlCtYqwQiBowECwfTIAjkiJlH/bcpbvo10/uuiUDKCOmkEZu
         Kz+vA6R6CKGSqUw2ej8Ot02msf8l+gjHgk5MVubwfrGpT6D07/L50zRwGyBaFjXt+LKv
         80x8m2MVHDVSZJ+lt5yoySlSCo4PBbGZt7rgZukBUtlzTx3uutTBWs0GWogpEAZ5WAAr
         MYIbV5pRSeQGSyGa2I29GH3fu5+rtzPTQSg7SYHjg0sF7EjJG3F7Ivj21VU6pZPFuP41
         2dDQ==
X-Gm-Message-State: AOAM531nzI8lfFbNFc/dRvWE5vZ7aslfJSuOKdJQfcB8p7SGI1MsvjoY
        X/amwK4Vke0T59omwhXKMadOWYgoLmU0HlcL
X-Google-Smtp-Source: ABdhPJzhjm/lYaft7BEmJB63KD5Khy2vRVhq65gWWnBMiRmyPWdxYJW1KSH7DGW4hS29Sejx8qdZUA==
X-Received: by 2002:a05:6638:d56:b0:32b:62e4:39be with SMTP id d22-20020a0566380d5600b0032b62e439bemr4693540jak.308.1651592112444;
        Tue, 03 May 2022 08:35:12 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com. [209.85.166.171])
        by smtp.gmail.com with ESMTPSA id w63-20020a025d42000000b0032b3a781760sm3933109jaa.36.2022.05.03.08.35.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 08:35:11 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id d3so9958102ilr.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 08:35:11 -0700 (PDT)
X-Received: by 2002:a05:6e02:b23:b0:2cd:89db:f685 with SMTP id
 e3-20020a056e020b2300b002cd89dbf685mr7200200ilu.296.1651592110840; Tue, 03
 May 2022 08:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220430011402.1.If7c3471db53bea55213f7bcf17e9043084d3ac0c@changeid>
 <20220430011402.3.Ic20d0c002ac5406b880cbdf9824739f38740926c@changeid> <dbcb45d6-d495-1e5d-b7ad-963096e5fe9d@linaro.org>
In-Reply-To: <dbcb45d6-d495-1e5d-b7ad-963096e5fe9d@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 3 May 2022 08:34:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WhAqQnxwNaW4kfq9Wuwsz6YYzBgSn=KX9Se_5o2mkcsA@mail.gmail.com>
Message-ID: <CAD=FV=WhAqQnxwNaW4kfq9Wuwsz6YYzBgSn=KX9Se_5o2mkcsA@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sc7180: Add quackingstick dts files
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     "Joseph S. Barrera III" <joebar@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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

On Tue, May 3, 2022 at 8:31 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/04/2022 10:15, Joseph S. Barrera III wrote:
> > Quackingstick is a trogdor-based board. These dts files are copies from
> > the downstream Chrome OS 5.4 kernel, but with downstream bits removed.
> >
> > Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
>
> (...)
>
> > +/*
> > + * Google Quackingstick board device tree source
> > + *
> > + * Copyright 2021 Google LLC.
> > + *
> > + * SKU: 0x601 => 1537
> > + *  - bits 11..8: Panel ID: 0x6 (AUO)
> > + */
> > +
> > +#include "sc7180-trogdor-quackingstick.dtsi"
> > +
> > +/ {
> > +     model = "Google Quackingstick (rev0+)";
> > +     compatible = "google,quackingstick-sku1537", "qcom,sc7180";
>
> Here and in other patches you keep adding undocumented board compatibles.

Sure, but perhaps we could continue the conversation at:

https://lore.kernel.org/r/CAD=FV=W_SA-3PfDFi-Gkjk9pew5bchFNjQhXX8MkZyuy5UohEQ@mail.gmail.com/

...to avoid forking it and losing all the context.

-Doug
