Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 328216C5367
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 19:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbjCVSPO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 14:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCVSPM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 14:15:12 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F7964A94
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:15:10 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id w25so1199438qtc.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679508908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSvNmSJ9+TgKBQqU49EzQTMckYiccw3IcZ2Wfcswm7w=;
        b=Tj3Zq8aA4hVsSNG0y8sehgJek9ZCi1tIPG3jTqdPCblsK47dD2BwG/r4Ajm1XTYYHE
         0lnwBeNInGORLfFml1bSgO9gbc9NxoQFkqacbhqKJNqBbxzfk6gKQgWNFij0Z8lRC0lf
         BtLuujtrjvT6TohyhCC7AZH/demMWj7FJZla4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679508908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSvNmSJ9+TgKBQqU49EzQTMckYiccw3IcZ2Wfcswm7w=;
        b=Hf5XOH2HcY05gfsutXr2omOYTKAC4JZyIMwn9WJPb8R4XILNAAGjeEe/nlVBCo2P9k
         tyaC6dp+kowZDHfHxCHVe+a7dhkmOShsAVsZ1OyuMTT3MJQ1j7Blg4bwmse8OGpahkD0
         bh7jclwtz8Nj/deuvPDXn2/qtcBaIclo4hsKJOYKRZyqiuoX9SiLeYtM2rDXwQkmYOQL
         2CUpkJxnhediFXaOIrX6Wo3ncCY1H3oGWtjhp0QPwu1bVrpRdGLLWgZVjHFknaftUmX2
         6ov+6bP+9TlTiGwVJQueX4HVtJsLFBrCOHenTL89n2w8VUngQa4Ce9F6IgNooM1YF/Fn
         fyAQ==
X-Gm-Message-State: AO0yUKVpzM1i4tS15dYZI0R9Q2MoGz5vce/Ki46U2KdsOOFLWgoWrJu3
        maMHxm0OeVn52ga1Y4X/9FEZo7jks0sjaiYqhGs=
X-Google-Smtp-Source: AK7set9MywFYcEyCcAZHWmDg+hLNiUsYz8NAjQxklZQoFPSgPO27HdchvF8QOz3XVa38SWgrdBr0/w==
X-Received: by 2002:a05:622a:180f:b0:3b9:bc8c:c1f6 with SMTP id t15-20020a05622a180f00b003b9bc8cc1f6mr5184038qtc.1.1679508907813;
        Wed, 22 Mar 2023 11:15:07 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id x22-20020ac84a16000000b003e1d8c193c1sm5680605qtq.48.2023.03.22.11.15.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 11:15:07 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id k17so11326906ybm.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:15:06 -0700 (PDT)
X-Received: by 2002:a05:6902:1083:b0:b69:ca6f:452c with SMTP id
 v3-20020a056902108300b00b69ca6f452cmr531528ybu.0.1679508906594; Wed, 22 Mar
 2023 11:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230217155838.848403-1-krzysztof.kozlowski@linaro.org> <20230217155838.848403-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217155838.848403-2-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 22 Mar 2023 11:14:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V6gJ3if8CueyQ=jJnVR_fJL2Xm3t2Oo_scq=CxGZETGQ@mail.gmail.com>
Message-ID: <CAD=FV=V6gJ3if8CueyQ=jJnVR_fJL2Xm3t2Oo_scq=CxGZETGQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sc7280-herobrine-audio-rt5682: add
 missing supplies
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Feb 17, 2023 at 7:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Bindings expect DBVDD-supply and LDO1-IN-supply:
>
>   sc7280-herobrine-evoker-lte.dtb: codec@1a: 'DBVDD-supply' is a required=
 property
>   sc7280-herobrine-evoker-lte.dtb: codec@1a: 'LDO1-IN-supply' is a requir=
ed property
>
> In sc7180-trogdor.dtsi they come from the same regulator, so let's
> assume intention was the same here.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi | 2 ++
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi     | 2 ++
>  2 files changed, 4 insertions(+)

Confirmed on schematics.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
