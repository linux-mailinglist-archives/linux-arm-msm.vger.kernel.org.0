Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0256051888E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 17:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238389AbiECPdT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 11:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236374AbiECPdT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 11:33:19 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B95EE286FB
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 08:29:46 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id h85so8039363iof.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 08:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rPC8+21dGVPrqmLTCbG4CdID6aBZE3p2csZDn91eaqM=;
        b=D5jX00kZ19+ALU+47QbVZQSduLJxg5L8nwz4y/EPRt0zP2KgYTt9qsvaQ+Ph89HGm0
         EA0VmTJDTS7hsvjcxX7QMqtdaac7cNeHVZE0WUSPAcjyXzUrGEi5uOSjifoduBQhMFHU
         fNAXQ4kMt+Cl8L4gawpNUTDTyl5zzXwIk9Qgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rPC8+21dGVPrqmLTCbG4CdID6aBZE3p2csZDn91eaqM=;
        b=esP1AG7DSsQVUSlnh0k/ElQemrJqtDKuqmmZ7SMYQLPk5jxGjPrVXnGNHpEglsQE/6
         quC1diQGCnDRr0R7f6jrm1fe4XuSSBSqJIK4ZUj2WihD/n8Bx2IbjoM4Y7ICCO4uywMm
         cQzk772uaooyJgBCp5CvgjUt5Xf2G2EuHIbWAdmRW94dzQV1lhEmWkus3JAlWxB/hv50
         uotcy1TKBfBv1C1G00QvQ/yYFMROJCmPj1xEamY27hYAeG6cBd5YF1DQpd2K7KqyfxeA
         DRjZj+q3vgWfuo9mQ+u6Y92TllImP67HQz/2pAQ/LcT1v5JxoZg7mQcKdRxaNeDTGs3w
         myig==
X-Gm-Message-State: AOAM533xnYOTmOMTDiVv/XifiU+I7g8cdV7iDqJ5TwE5IeNxI6nNbwIB
        xPA8SD/0pTg+XcMmMDrDthkyqTGZMgAscYHK
X-Google-Smtp-Source: ABdhPJylwzs1y/RyLs7G4Z8ed+tJ57flVEKCTLkhu+pZM2We9GDJ+gxkHjaTCCTkz0qTEol9anIimA==
X-Received: by 2002:a6b:18f:0:b0:65a:42e7:497a with SMTP id 137-20020a6b018f000000b0065a42e7497amr6215705iob.218.1651591785457;
        Tue, 03 May 2022 08:29:45 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id r9-20020a6bd909000000b0065a47e16f65sm2956025ioc.55.2022.05.03.08.29.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 08:29:45 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id m6so15165551iob.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 08:29:44 -0700 (PDT)
X-Received: by 2002:a02:a98f:0:b0:315:19db:27a3 with SMTP id
 q15-20020a02a98f000000b0031519db27a3mr6898987jam.184.1651591783652; Tue, 03
 May 2022 08:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <1650556567-4995-1-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1650556567-4995-1-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 3 May 2022 08:29:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WbHJq_2gcpcuNHwBLFsi2UZR+JetWFfdZBvwD68RSnEg@mail.gmail.com>
Message-ID: <CAD=FV=WbHJq_2gcpcuNHwBLFsi2UZR+JetWFfdZBvwD68RSnEg@mail.gmail.com>
Subject: Re: [V6 0/2] arm64: dts: qcom: Configure CTS pin to bias-bus-hold for bluetooth
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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

Bjorn,

On Thu, Apr 21, 2022 at 8:56 AM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> WLAN rail was leaking power during RBSC/sleep even after turning BT off.
> Change pinctrl configuration to handle same.
>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
> v6: add code comments about how bias-bus-hold could save power
> v5: modify subject to include bluetooth
> v4: modify subject of each patch to indicate what it is applying to
> v3: apply same change to active state and other sc7280*.dts* as well
> v2: used bias-bus-hold as per review comments
> v1: intial patch used bias-disable for sleep pinctrl in sc7280-idp only
> ---
>
> Vijaya Krishna Nivarthi (2):
>   arm64: dts: qcom: sc7280-idp: Configure CTS pin to bias-bus-hold for
>     bluetooth
>   arm64: dts: qcom: sc7280-qcard: Configure CTS pin to bias-bus-hold for
>     bluetooth
>
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi   | 18 ++++++++++++------
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 19 ++++++++++++++-----
>  2 files changed, 26 insertions(+), 11 deletions(-)

If the tree hasn't closed yet, I think these two patches are waiting
to land and ready to go.

Thanks!

-Doug
