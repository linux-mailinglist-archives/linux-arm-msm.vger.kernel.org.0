Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E984518981
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 18:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239297AbiECQT7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 12:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239291AbiECQT6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 12:19:58 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD5B2AC55
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 09:16:25 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id dk23so34402757ejb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 09:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oU0gNOmApxV0Y7ahlTC+ZO77cG/p3zhJM/T1yrF7v5Y=;
        b=F+dNGWv77Wmd0QgNj4t9OR2FM1cNz0M7TsCPrF2ZsdtitJNLVc0o+I5AhkCej72eCp
         y4vtCZo0/bovmckK91ixaQnV1mx59K61ZEtPpFcwTIFDz3Lo1x+SNyqDV04OqV6GqMW0
         H5u5uQEap5RRUXl17YeaccpRrcnXKRBDWLLY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oU0gNOmApxV0Y7ahlTC+ZO77cG/p3zhJM/T1yrF7v5Y=;
        b=3IzMMZXSUrRhTTfEF9VDiNnteqqv2LKvM1g8XtmQ6K5geVwpowWPJ4n/sXEAWIDtj3
         She+VHf4+3MNqKeeXjp9cDTu/J0EnBbbZzjzjx9IJD7ZSxxxyHMeh5RxDZF+vH4SjLnl
         G5LnDIJyj522MluF0+L6x/1p3xy6MkEPiofK/xFIkcRqFId1Bef9Lt12lpmI6KQI/DOV
         +98U0fhd+XgKZs1XQA7ABl5bhzUxKahGmYt/LX/4PkS0ISFzplhCEEQTR1yo4SohpUb0
         8nYHDsahXGQahQKw4aU6HBnm3IJQIU9XiD6zquD93JY58uBAMaO/A0AcigrSSO+tRXKg
         wIig==
X-Gm-Message-State: AOAM530teo6pr1slmw/TGgreHx9VY11EGjezi7nxiIVy6PFPJbeN2+X8
        lCJR5gqaZ5sNe22UFirOLxTGnbBjHhRxP/wX
X-Google-Smtp-Source: ABdhPJy3EpSO01ZduFs0thT1FwRKkHSf3nKeeX5ZvyfTjNz6VzlOpJ2YqwXK2FMTTAozYDI81e6Reg==
X-Received: by 2002:a17:906:5d09:b0:6f4:4407:a422 with SMTP id g9-20020a1709065d0900b006f44407a422mr10400571ejt.576.1651594583844;
        Tue, 03 May 2022 09:16:23 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id de46-20020a1709069bee00b006f3ef214e5asm4815312ejc.192.2022.05.03.09.16.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 09:16:22 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id b19so24025906wrh.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 09:16:22 -0700 (PDT)
X-Received: by 2002:a05:6000:2c1:b0:20c:5e37:3ed1 with SMTP id
 o1-20020a05600002c100b0020c5e373ed1mr9011909wry.342.1651594581793; Tue, 03
 May 2022 09:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220430011402.1.If7c3471db53bea55213f7bcf17e9043084d3ac0c@changeid>
 <20220430011402.3.Ic20d0c002ac5406b880cbdf9824739f38740926c@changeid>
 <dbcb45d6-d495-1e5d-b7ad-963096e5fe9d@linaro.org> <CAD=FV=WhAqQnxwNaW4kfq9Wuwsz6YYzBgSn=KX9Se_5o2mkcsA@mail.gmail.com>
 <e321d8c2-950c-a194-04a3-1fe2659749e9@linaro.org>
In-Reply-To: <e321d8c2-950c-a194-04a3-1fe2659749e9@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 3 May 2022 09:16:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Usp=uMj+aupFsiBEqPp1M5cgJOOPLxeSujrbm3V0obQg@mail.gmail.com>
Message-ID: <CAD=FV=Usp=uMj+aupFsiBEqPp1M5cgJOOPLxeSujrbm3V0obQg@mail.gmail.com>
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

On Tue, May 3, 2022 at 8:55 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/05/2022 17:34, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, May 3, 2022 at 8:31 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 30/04/2022 10:15, Joseph S. Barrera III wrote:
> >>> Quackingstick is a trogdor-based board. These dts files are copies from
> >>> the downstream Chrome OS 5.4 kernel, but with downstream bits removed.
> >>>
> >>> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> >>
> >> (...)
> >>
> >>> +/*
> >>> + * Google Quackingstick board device tree source
> >>> + *
> >>> + * Copyright 2021 Google LLC.
> >>> + *
> >>> + * SKU: 0x601 => 1537
> >>> + *  - bits 11..8: Panel ID: 0x6 (AUO)
> >>> + */
> >>> +
> >>> +#include "sc7180-trogdor-quackingstick.dtsi"
> >>> +
> >>> +/ {
> >>> +     model = "Google Quackingstick (rev0+)";
> >>> +     compatible = "google,quackingstick-sku1537", "qcom,sc7180";
> >>
> >> Here and in other patches you keep adding undocumented board compatibles.
> >
> > Sure, but perhaps we could continue the conversation at:
> >
> > https://lore.kernel.org/r/CAD=FV=W_SA-3PfDFi-Gkjk9pew5bchFNjQhXX8MkZyuy5UohEQ@mail.gmail.com/
> >
> > ...to avoid forking it and losing all the context.
>
> It's not that close to that discussion because none of compatibles here
> are documented and we discussed about documenting specific revisions.

It is strongly related, though, since we later might need to add
revision info to these boards. These are still Chrome OS devices and
they still have a bootloader looking at revision strappings. In this
case, though, all the changes between revisions (so far) have been
invisible to software.

-Doug
