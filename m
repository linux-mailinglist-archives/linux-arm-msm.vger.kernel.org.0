Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C963F507063
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 16:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238268AbiDSOao (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 10:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232482AbiDSOan (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 10:30:43 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C2D0E0CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 07:28:01 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id v15so21456151edb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 07:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nj2bwCdNC7HwvELjhLY4xYS1yLs5HxcxFqDH74I+UnY=;
        b=B3SiqcstytlQ82E04Waa6/M3nW29rmiBNUkLFmC9WM7jnffgpNy6IjRFV0crd0hF7R
         kcF8m9ktNN+w8ii5kTtxi7D8LCi3jl+5QjVAHw3yc5CQBdM3VTFLDGas2ytvluL/OURr
         GHEZ7O/R/ENukYVhf76eBTjEKHNirDS9hihnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nj2bwCdNC7HwvELjhLY4xYS1yLs5HxcxFqDH74I+UnY=;
        b=pXx+2ZKDSTTZiNBVV9xOh7lP/eoCO0L8ZuhQWpawUNpDsp6S0cymFhFjprIPDBOmfE
         AI8SwZK3lY1f3BoX7BF2qvoEXnkY28KWzHU0De1T9lH4LUNJqLsYEVaI6L8yBHDSKOUB
         aa5M3ACAwDl8r0KxSThGfVxzY449MyPwk/IwT8eHcyEu32teYL6REG6N1tFN+GlpMHey
         Jt36HjqMI4ka7Y/QNWMmldxKsvYIcNx4OfUF/zBdNT93vX3DXbuuUjjBsBYOQPzUzTr9
         iz4/kyjTWg45Woj6eT9SiJotRoEbBLJ5V1wf6H8/CYvMidOXUqTuViaePCzVGbm1yzPI
         hlVA==
X-Gm-Message-State: AOAM532NSR0KS3VYPA/xXb7RZqdb5RJUR72p+Trzr9RWUElxMKaRmhGy
        8EpYmL7/7dX5Cq3or6VxLAgZiJc1T4YOh1v5
X-Google-Smtp-Source: ABdhPJyeqv4FTLvElj3FvgJfWg/tlJgkgv2YEXPQZFUz+ek5paluX/tG25n+QGsfuPjRz+RsK1mSTw==
X-Received: by 2002:a05:6402:1a44:b0:41d:8969:e4c9 with SMTP id bf4-20020a0564021a4400b0041d8969e4c9mr17947307edb.299.1650378479518;
        Tue, 19 Apr 2022 07:27:59 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id nd31-20020a170907629f00b006dff863d41asm5734499ejc.156.2022.04.19.07.27.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 07:27:58 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id x18so14833079wrc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 07:27:58 -0700 (PDT)
X-Received: by 2002:a05:6000:1105:b0:20a:80b4:bcaf with SMTP id
 z5-20020a056000110500b0020a80b4bcafmr11868665wrw.679.1650378478239; Tue, 19
 Apr 2022 07:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <1650349697-13540-1-git-send-email-quic_vnivarth@quicinc.com> <1650349697-13540-3-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1650349697-13540-3-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 19 Apr 2022 07:27:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W6R9iPt1aCDpq4BRBfZ+KFUsOAUKCOhY2KQo_GpMhoiQ@mail.gmail.com>
Message-ID: <CAD=FV=W6R9iPt1aCDpq4BRBfZ+KFUsOAUKCOhY2KQo_GpMhoiQ@mail.gmail.com>
Subject: Re: [V4 2/2] arch: arm64: dts: qcom: sc7280-qcard: Configure cts
 pinctrl to bias-bus-hold
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
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Apr 18, 2022 at 11:28 PM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> WLAN rail was leaking power during RBSC/sleep even after turning BT off.
> Change sleep pinctrl configuration to handle same.
>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
> v4: modify subject of patch to indicate file it is applying to
> v3: apply same change to active state and other sc7280*.dts* as well
> v2: used bias-bus-hold as per review comments
> v1: intial patch used bias-disable for sleep pinctrl in sc7280-idp only
> ---
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

You should have carried my tag forward. In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
