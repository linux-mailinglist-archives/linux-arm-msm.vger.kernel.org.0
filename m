Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3F91434C04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 15:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhJTN1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 09:27:47 -0400
Received: from mail-vk1-f169.google.com ([209.85.221.169]:41893 "EHLO
        mail-vk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbhJTN1q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 09:27:46 -0400
Received: by mail-vk1-f169.google.com with SMTP id l20so9263595vkm.8;
        Wed, 20 Oct 2021 06:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g3KuA/4GnS8bU61JtTZyTiH/9Yt2gqQecB6dIOt6LAs=;
        b=y4qOCkzV3O/uU49k8gHyYPOj6TT8nVfUKLkSZaD+Ceg7uZZBl2rFxDCj327dOtW+dr
         StPTgaEyF2TQYKPL2O+2ZTEl/R1Xjnw2qcvZWYtscGoeqge2KbOMGFwWgjBpwugQ1ABi
         Vm2hpDzCOqTaqbr69RvApOkOU91KFlFfJGCy28EpmLEtnRNZFMOyb4yCzB7T+xCNJgjv
         0BQkwasw91t2+7ZGun5zprwYw/gJYvguTBluJZoDN6AS7twYsdphzx0eOVkhoWtH5q5S
         bvxov4dq3A675wziLfBobXvDH3KUYGu4uGMA/cm66HdrnK5yoOwAdVZirrfLJD//SfbN
         KkhA==
X-Gm-Message-State: AOAM531y0F0T6u2UG671Im6JcYmO99NJzT+CeF7KLOKiqUCX0w+lOzAd
        1fkDClYpZB2Zm6buwqXpniqujyTQNdmxhQ==
X-Google-Smtp-Source: ABdhPJwiNYwEkqpPn7VOqbDYEdiFM4on86pfe4232/73yfpNYnEVShAfM6G9z4h9PUgywjJ79yOpQQ==
X-Received: by 2002:a1f:264a:: with SMTP id m71mr39143036vkm.5.1634736331355;
        Wed, 20 Oct 2021 06:25:31 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id g23sm1319443vkd.15.2021.10.20.06.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 06:25:30 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id f3so6558789uap.6;
        Wed, 20 Oct 2021 06:25:30 -0700 (PDT)
X-Received: by 2002:ab0:58c1:: with SMTP id r1mr6937533uac.89.1634736330467;
 Wed, 20 Oct 2021 06:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210922195208.1734936-1-festevam@gmail.com>
In-Reply-To: <20210922195208.1734936-1-festevam@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Oct 2021 15:25:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPe9X73jwHiMtrTxUcsiVjPtVXgqesiDU6FkSwfOdOKg@mail.gmail.com>
Message-ID: <CAMuHMdUPe9X73jwHiMtrTxUcsiVjPtVXgqesiDU6FkSwfOdOKg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sm6125: Remove leading zeroes
To:     Fabio Estevam <festevam@gmail.com>
Cc:     =?UTF-8?Q?Bj=C3=B6rn_Andersson?= <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        martin.botka@somainline.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 22, 2021 at 9:52 PM Fabio Estevam <festevam@gmail.com> wrote:
> dtc complains about the leading zeroes:
>
> arch/arm64/boot/dts/qcom/sm6125.dtsi:497.19-503.6: Warning (unit_address_format): /soc/timer@f120000/frame@0f121000: unit name should not have leading 0s
> arch/arm64/boot/dts/qcom/sm6125.dtsi:505.19-510.6: Warning (unit_address_format): /soc/timer@f120000/frame@0f123000: unit name should not have leading 0s
> arch/arm64/boot/dts/qcom/sm6125.dtsi:512.19-517.6: Warning (unit_address_format): /soc/timer@f120000/frame@0f124000: unit name should not have leading 0
>
> Remove them.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
