Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B36895B91E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 02:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbiIOAqo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Sep 2022 20:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbiIOAqm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Sep 2022 20:46:42 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE71E4C613
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 17:46:41 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id 13so9557183ejn.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 17:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=WgZixTRxTWoDkCtULJb0cXzPEDep5TgMZR2wDcQQdOw=;
        b=Kg+1UZzlDU50pcnzV1o05HTamlrToevhWcGaP84OVJsseY3AhIhNhwicDxakzx5zQO
         W7HZ1yWfcO696l161SYZhn+PCzNXzc1jy5DgAJFhVBcg1Q2wVas/GrD/F87VOavB801q
         1SiQDMUdU6HpX4x5oSDoCEz5kxjQU8EyeCuyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=WgZixTRxTWoDkCtULJb0cXzPEDep5TgMZR2wDcQQdOw=;
        b=DU5/thzvRYWruNze+XNJRzJrjgCOKN9ABVxT2C9lslShSuyFuZWL9ox+0+t4EfNhRG
         FI2R8cf1Pm6GnbIqMiY3jhVdpeEKb3eKasf+rrthkwWxbRV3VvT61mOlT3uxkRQgbDH4
         ItQaUDRZhEsOiPF9K9YLo0d94uLNcv8blWAjRTZFqaWCuDPuVA8QOKr6XkmkrguOryAq
         jJ6zj9d3ouw5IbOJMpn34I4M3MDppf5DxEUaYp1Truj7AzKotrOsl6bClsY1qhBUib37
         1JXgGatTr3JFaQ1YMH8m0rqhwTkWtaS7FNyvW6i7Ab37/wMoTJdw7QWau75MVmdoqHlt
         BoiA==
X-Gm-Message-State: ACgBeo2a2dGVkejTbT0SrTuAGPfnjxCxatgQklJon0wQPFph6ULN+ouc
        VoI2ASihK6v11J7xo4tBgu/7ieXXHpSNFtEL2WrXFj6SzGSTwA==
X-Google-Smtp-Source: AA6agR54zdmn7Yw5OAkEnKI6FIl0BrR5R5qoYvJoVPX6e0a0Ba7VGgMA3ek/Ii7ijMcFUlJ3KBZn+g4zCLbdbONkGRU=
X-Received: by 2002:a17:906:401:b0:73d:af73:b78 with SMTP id
 d1-20020a170906040100b0073daf730b78mr27986527eja.122.1663202800297; Wed, 14
 Sep 2022 17:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220826065621.2255795-1-judyhsiao@chromium.org> <166308148206.625876.8801069802083923195.b4-ty@kernel.org>
In-Reply-To: <166308148206.625876.8801069802083923195.b4-ty@kernel.org>
From:   Judy Hsiao <judyhsiao@chromium.org>
Date:   Thu, 15 Sep 2022 08:46:29 +0800
Message-ID: <CAJXt+b90z32L3ZYh22Vnxo4=DbETJZjf+rx9X7ZuqqmaBDggfQ@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: sc7280: Fix Dmic no sound on villager-r1
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     quic_srivasam@quicinc.com, judyhsiao@google.com,
        cychiang@google.com, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rob Herring <robh+dt@kernel.org>,
        swboyd@chromium.org, dianders@chromium.org,
        devicetree@vger.kernel.org,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-kernel@lists.infradead.org
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

Please help to apply
Add dtsi for sc7280 herobrine boards that using rt5682 codec (v4)
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=661760
It's dependencies are landed.

Thanks & Regards

On Tue, Sep 13, 2022 at 11:04 PM Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Fri, 26 Aug 2022 06:56:21 +0000, Judy Hsiao wrote:
> > Fix the DMIC no sound issue of villager-r1 by using "PP1800_L2C" as the
> > DMIC power source to match the hardware schematic.
> >
> > This patch:
> >    1. set vdd-micb-supply to PP1800_L2C as the MIC Bias voltage regulator.
> >    2. In audio-routing, set VA DMIC01~VA DMIC03 to use the vdd-micb-supply
> >       setting.
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] arm64: dts: qcom: sc7280: Fix Dmic no sound on villager-r1
>       commit: 61a301ca83736afeeeb307b931c59f107067da3c
>
> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>
