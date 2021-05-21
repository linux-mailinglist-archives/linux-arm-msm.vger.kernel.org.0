Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1492338CFAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 23:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhEUVQ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 17:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbhEUVQ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 17:16:58 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8754EC0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 14:15:33 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id s12so7146731qta.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 14:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KU2Ua3SJWwvztXy/qLseNaC6FX7ltF8ZRFgrKedX7pE=;
        b=ZdLakRjz6xM5+M2e25BYKIX+s0E7OpHE4z63Xytk0sRCZ77TzzEhnoNmkSLiWGv9tK
         78O8Iky/dAmIrG24dLVrSSygb40xQveRW7qAHQaDaJU6Tv5RHAQ37qPI2IOJ4vkX7T0z
         k6FFZ/ZlC2HSwFhnHTfhzxGfqLOnq41C92UdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KU2Ua3SJWwvztXy/qLseNaC6FX7ltF8ZRFgrKedX7pE=;
        b=d3v9HeFXMlAW//dL2nsWnR7IwcgDULmRXdAjoAIgttd9DMopyI64kMGMoGWCMCVjaJ
         q2DDENP8C46xCIQgZiCW9It8jhS2MujAe8Os36bpmnaLldnvtQK3hUDyTQs3toGo912Q
         hXab5+KA4j58+ct2RDcjzajjggM08Z6ilBrAThrgjIu+oNfEWCuudNv7ZMJ9aYqCW6Wj
         Okhv4V9xPUcmCvIS9DCJFpu0kEYL7H/iKDT5Pz4Y4zQQB36by3oNNJKhwHsJlJjoZEFS
         s7oQQ/pjEGoW9DV1I9go3UiwXkV9liO4he6k5uI3sgjX+MbtSBZ8vDYcKdobiUusRbDX
         LnWQ==
X-Gm-Message-State: AOAM533l5TcXJ65PLyi6n5TZAcPJkUrCPr7+WvENofJKUfh/AIisxhSt
        T0jDPcNqLb4VoDNdHToq1BGhx/+26u96Gw==
X-Google-Smtp-Source: ABdhPJxUK8cWQVZdcAp9qGmbblLTbAUiIQTA5HvIdOMkz4ODZkwwBqI0kjG+x1w04Q4fswPsh7w54w==
X-Received: by 2002:ac8:58cc:: with SMTP id u12mr13680679qta.302.1621631732491;
        Fri, 21 May 2021 14:15:32 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id y12sm3871851qtv.59.2021.05.21.14.15.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 14:15:31 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id r8so29259494ybb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 14:15:31 -0700 (PDT)
X-Received: by 2002:a25:e007:: with SMTP id x7mr17331874ybg.343.1621631730850;
 Fri, 21 May 2021 14:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210521200529.1991729-1-sujitka@chromium.org> <20210521130511.v1.2.I52f30ddfe62041b7e6c3c362f0ad8f695ac28224@changeid>
In-Reply-To: <20210521130511.v1.2.I52f30ddfe62041b7e6c3c362f0ad8f695ac28224@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 21 May 2021 14:15:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvUs=WAE0LRN9zK9gXhrtCy9_1B6rVf7PjFLQ2s8vuhg@mail.gmail.com>
Message-ID: <CAD=FV=WvUs=WAE0LRN9zK9gXhrtCy9_1B6rVf7PjFLQ2s8vuhg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sc7180: trogdor: SD-card GPIO
 pin set bias-pull up
To:     Sujit Kautkar <sujitka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 21, 2021 at 1:06 PM Sujit Kautkar <sujitka@chromium.org> wrote:
>
> Trogdor board does not have external pull-up for cd-gpio. Set this pin
> to internal pull-up for sleep config to avoid frequent regulator toggle
> events.
>
> This change is aligned with Qualcomm's DT change posted at:
> https://patchwork.kernel.org/patch/11675347/
>
> Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index d128a0ed6ad3a..330deb4967ca2 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -1638,7 +1638,7 @@ pinconf-data {
>
>                 pinconf-sd-cd {
>                         pins = "gpio69";
> -                       bias-disable;
> +                       bias-pull-up;

This looks fine to me. Honestly, I would have done it for IDP too. It
really doesn't make any sense that the pull-up would be enabled for
the "on" state but disabled for the "off" state. Either you have an
external pull (in which case you never need the internal one) or you
don't have an external pull (in which case you always need the
internal one).

In any case, this change is correct and improves things. I'll add:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

If you do respin the patch to fix IDP too then you can feel free to
keep my Reviewed-by tag.


-Doug
