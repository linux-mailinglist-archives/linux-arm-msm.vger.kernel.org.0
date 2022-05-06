Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9899151DAA9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 16:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442260AbiEFOmP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 10:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442262AbiEFOmO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 10:42:14 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2183B6A424
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 07:38:31 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id g11-20020a9d648b000000b00605e4278793so5040000otl.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 07:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=iky+2DSYqv2Gw83+fUdec0P6CD5G2yXukPaUGpyxX6E=;
        b=SymezlUM2zDLS9ItKEh8Tw9JXBO690esOf0mPiAj5TSYPuxIqmFLN1TiHIAhNkzAT5
         0s+c6p4FLMwPCF/WZMwDnLc8TLFJeUjBkekH3kTQay1i2msU34YYwuLIzzhNERZ6Jnap
         eddyooibtoTQHvCZmfeDjLIUYfg83zCOY+bUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=iky+2DSYqv2Gw83+fUdec0P6CD5G2yXukPaUGpyxX6E=;
        b=Ubi9lSppnCbMcnkij0fJ45KXI/N8uZrwIswV2MA2sgDLyxPCgjTosvJq46DJHJ2kDo
         3fP1eLxxNOZTtqFcAY0K1FvMWGprHAYEp3yodh4QDp2XC3VYMNitAslhXgp9783nLSUu
         BCibLd1LLAmb4fLPb7JK1Mn+d5kcqhPzsI0AlIBr6VCURU5h1sktlCX9wY4dLxKzyC+F
         OjLJja3uBAqNMt1Rur/H8IVvN5pnSQZeW2VEs+GPQ7/BG1Cy/QQRePTN2jxqbrNYlnZo
         ioxEoatxq9NNDKjSi3k/FrVSTHTrHaCkj65ZZSmQrCBHB2eOHokHzIQ6rE2eELnufK6Z
         rcwQ==
X-Gm-Message-State: AOAM531Uli4LKZqclAzBaxdDghBUYqewXYg1J+I8RCcD+/dInZja/Hjg
        rgAcYF6/yY44PHoyNto3ZXnx6mkUKV7huuiAuNYgCw==
X-Google-Smtp-Source: ABdhPJyGXk5/9A2xbuYzjjU+Qgz+l2qZMYFFTHj6EvEgRIee763d/CoZ4dDksxQO6mI8HSUj8GSqFqiHSa80y7p4SOU=
X-Received: by 2002:a9d:20a1:0:b0:5e8:d2b6:f63f with SMTP id
 x30-20020a9d20a1000000b005e8d2b6f63fmr1078941ota.159.1651847910486; Fri, 06
 May 2022 07:38:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 May 2022 10:38:30 -0400
MIME-Version: 1.0
In-Reply-To: <1651742739-12338-6-git-send-email-quic_c_skakit@quicinc.com>
References: <1651742739-12338-1-git-send-email-quic_c_skakit@quicinc.com> <1651742739-12338-6-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 6 May 2022 10:38:30 -0400
Message-ID: <CAE-0n50Ysr_BTUCZ0Wd6mJVaDf9PXspzuzuoL79dij-iOc9nVA@mail.gmail.com>
Subject: Re: [PATCH V11 5/9] mfd: pm8008: Remove the regmap member from
 pm8008_data struct
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_jprakash@quicinc.com
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

Quoting Satya Priya (2022-05-05 02:25:35)
> Remove the regmap member from pm8008_data struct as it is
> not used outside of probe. Add a local variable for regmap
> and pass it to the pm8008_probe_irq_peripherals()
> API in pm8008_probe.
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
