Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2B224F65CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 18:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237769AbiDFQll (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 12:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238025AbiDFQlG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 12:41:06 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E64119C83A
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 08:04:42 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id r10so3004694eda.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 08:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K83QqN2TxY26LIsNqPOFqQj4RdSJx9FOQNvgzvuZmLM=;
        b=S76zFo6lTopI23NWz49rYyKL0VY9HmiQIhm0j9JwBS+kwvGWrYzAqNGpqMRGM5+FqU
         IWTebSGm8alAtk80hu+VEVU+NQP60TesndetmIuOCNZSLjMZQ8x6Ta0oOEHl+dD+wViW
         kOXVv6AgQ0JLzjnYy+scqMkHC8RKbF2+IK3+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K83QqN2TxY26LIsNqPOFqQj4RdSJx9FOQNvgzvuZmLM=;
        b=TzEfnkjBNoq3QcbSIr6khadGhgv2SFN4D4U8NazwxP8HySm+gvOogovoHSyvynt/PP
         epuq0MFT2GlDiweyRaqAO56mrKiQbMoWpQfpi695/DaHXpWfsl8NvcloVKZfIskXJ017
         d7Au0yhHXjJinpYUVppRyIJsutlKwj9EDmaKOcHJH46HI/kY1Zxobc9NJrZAxFso0Rkd
         ocZfpGeqVij25zwwDXnInHK83SaIZGjer+KH9VhF6CfP6mhKjfxERSzVCbWxRJt622ZC
         QK+Yup6JwN+KZqQwtBCEpyYV7qdY3RjXMVRb2qNxPxVHOI94TmNHRqZaROaoG5K4mApQ
         qMJw==
X-Gm-Message-State: AOAM532vuFHkHMhHHqYe23wwBodoCTERDu35TPRYgMLsZGzs4OpL0Oyo
        Qf7rHZjJleh1umR/mYQXfnlVUaZRLgmaGnul4GE=
X-Google-Smtp-Source: ABdhPJyo4LmOZPcN2jan0vXLpbQvZ5KYYfFKiNkNj/BDICs45dFBClmOak9XAeDlY7JAW7eHGUu+cg==
X-Received: by 2002:aa7:cfcf:0:b0:41c:c203:a1c1 with SMTP id r15-20020aa7cfcf000000b0041cc203a1c1mr9175111edy.71.1649257480429;
        Wed, 06 Apr 2022 08:04:40 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id tc19-20020a1709078d1300b006e0649189b0sm6435714ejc.68.2022.04.06.08.04.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 08:04:39 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id u3so3687515wrg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 08:04:36 -0700 (PDT)
X-Received: by 2002:a5d:674d:0:b0:206:163c:f70c with SMTP id
 l13-20020a5d674d000000b00206163cf70cmr6914842wrw.679.1649257476052; Wed, 06
 Apr 2022 08:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <1649229362-31183-1-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1649229362-31183-1-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 6 Apr 2022 08:04:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XieM5MHMBBV9d7jrbiN+8RVdo6=_XSNf9L-yqEZUTO_Q@mail.gmail.com>
Message-ID: <CAD=FV=XieM5MHMBBV9d7jrbiN+8RVdo6=_XSNf9L-yqEZUTO_Q@mail.gmail.com>
Subject: Re: [V3 0/3] arch: arm64: dts: qcom: Configure cts sleep pinctrl to bias-bus-hold
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        quic_msavaliy@quicinc.com
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

On Wed, Apr 6, 2022 at 12:16 AM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> WLAN rail was leaking power during RBSC/sleep even after turning BT off.
> Change sleep pinctrl configuration to handle same.
>
> ---
> v3: apply same change to active state and other sc7280*.dts* as well
> v2: used bias-bus-hold as per review comments
> v1: intial patch used bias-disable for sleep pinctrl in sc7280-idp only
> ---
>
> Vijaya Krishna Nivarthi (3):
>   arch: arm64: dts: qcom: Configure cts sleep pinctrl to bias-bus-hold
>   arch: arm64: dts: qcom: Configure cts sleep pinctrl to bias-bus-hold
>   arch: arm64: dts: qcom: Configure cts sleep pinctrl to bias-bus-hold
>
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts | 12 ++++++------
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi                   | 12 ++++++------
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi                 | 13 ++++++++-----
>  3 files changed, 20 insertions(+), 17 deletions(-)

Probably the subject of all the patches should be modified to talk
about what each patch is applying to. Having 3 identically named
patches is not ideal.

I'll let Bjorn chime in on whether he'd rather adjust the subject
himself or whether he'd rather you re-send. In any case, with the
subject modified then for all 3 patches:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
