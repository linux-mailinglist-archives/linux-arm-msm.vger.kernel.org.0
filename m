Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4AD6C539A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 19:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbjCVSVs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 14:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbjCVSVo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 14:21:44 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4366265C42
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:21:43 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id x1so23793348qtr.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679509300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQxrNvV0gZz9GBG9UF+uE91SUr0DwwB7YS1OCSsuFvs=;
        b=L2AXigwdYCJbgkmvykQkbySf8qLZKmvdtP751LuOnhYCHfP8Scbalpq3qGIdbJR0d+
         XUIN6Ixul1ucxl5NgArdC19vSvIVLdg085CJ0CTspzNH5fcL6en2DwrP5QYv46t5Guuf
         NxMczk7zvasK/gpsH66NbYuoMD9EmYlMfPqH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679509300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQxrNvV0gZz9GBG9UF+uE91SUr0DwwB7YS1OCSsuFvs=;
        b=oFjlUQXl6s3TBuSBG3hvAOUoyl8Cj7y7Jg25nUlaYZqsMh2GdnOr4EffOpTTI03aUM
         SkuiKELskmHKNaGbhB88ntgpyRLo/4m8qwzvVgrtjpFGu9MXTJCdYeLfVRjf3Gqu/tjX
         sXbE0ZfSle+rj3+0pdjM7vBpPXkC7vB9dmmScas6XzRRP1X7FfK4tNNBhMxOqFX1Jb8K
         H4IIRC5as4I+/3eYBwgyG3TEZaBcxGumvVKNflACEKGyfoi/zEeGabw8XfJ2aiR9igIw
         sg98tTSdCtR9NmjYutaKb30ZxNdqvNoDdcQGVd6ykDxqjJ/t3Fru21xhrvqO5pOYz9MK
         LH0Q==
X-Gm-Message-State: AO0yUKVk6PE2s/AhZeGB1vn5VocN907hM+Lkf/bktw92x8LAEdQhUTU3
        D2B4lZ104S9ykjwcgcBYQYIdmvj8hva0EQ8zEbU=
X-Google-Smtp-Source: AK7set+ofGW3Wq3gy+zd0XPjgMchG0iHYSCb8f9hnKd28bFVgcEHKND3rQaMke/w6rx3U/xfywFbAw==
X-Received: by 2002:a05:622a:24d:b0:3dc:d4ca:efd3 with SMTP id c13-20020a05622a024d00b003dcd4caefd3mr7651765qtx.5.1679509299765;
        Wed, 22 Mar 2023 11:21:39 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id x128-20020a376386000000b00746803d7e8dsm7184105qkb.113.2023.03.22.11.21.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 11:21:38 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id e65so22089897ybh.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:21:37 -0700 (PDT)
X-Received: by 2002:a05:6902:1081:b0:b21:a3b8:45cd with SMTP id
 v1-20020a056902108100b00b21a3b845cdmr549657ybu.0.1679509297542; Wed, 22 Mar
 2023 11:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230220095401.64196-1-krzysztof.kozlowski@linaro.org> <20230220095401.64196-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220095401.64196-2-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 22 Mar 2023 11:21:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XzU+TzHdsdruH_TaCVpwhsHBWPn9LMMTUORVPL08VyfA@mail.gmail.com>
Message-ID: <CAD=FV=XzU+TzHdsdruH_TaCVpwhsHBWPn9LMMTUORVPL08VyfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7280-qcard: drop incorrect
 dai-cells from WCD938x SDW
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>
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

On Mon, Feb 20, 2023 at 1:54=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The WCD938x audio codec Soundwire interface part is not a DAI and does
> not allow sound-dai-cells:
>
>   sc7280-herobrine-crd.dtb: codec@0,4: '#sound-dai-cells' does not match =
any of the regexes: 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 2 --
>  1 file changed, 2 deletions(-)

Like with patch #1, I'm pretty soundwire ignorant but this looks right to m=
e.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Seems like folks who were involved in landing the patch that
originally added those properties should be CCed on this, though.
Adding them.

-Doug
