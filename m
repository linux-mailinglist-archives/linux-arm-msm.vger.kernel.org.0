Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B97777EABC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Aug 2023 22:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346124AbjHPUcM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Aug 2023 16:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346196AbjHPUbx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Aug 2023 16:31:53 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB912708
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 13:31:51 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d62b9bd5b03so6565420276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 13:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692217911; x=1692822711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ESK9GO7mfDGeXFIUEzQzbG42Lacp21O8/Gw0HAGsBdg=;
        b=VoV3YZbJ7ItSImQ9pXkoIICPaoSt/NtxGqoRP7tZg5BcjHUOS8Tyu4GNPxpf50+nk4
         4re39STGcwHAduO6Sli7a5/kuJg/+eH7AkwyChhZMTEE5HAA0mYluaqDkMS4U3SxArw2
         0nqeL52kiBbp6xZyUWh+oj9+iH47sW+T8YmOIqqh0KjP1hHfgazv1DuuMKZlT0iK6wta
         RL4peN+pzUHztomypCQG0dx83XhnTH76XO7kfYvnG7vplylk5+I4x3nK34dHncVVrI/I
         mVAW3/1KlxVxbaSOyJKJCPdZYOQyKwOXh4kJjBNJakLC25VrciVePh/a1OL6IgNdjWH6
         qskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692217911; x=1692822711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESK9GO7mfDGeXFIUEzQzbG42Lacp21O8/Gw0HAGsBdg=;
        b=RPjB2+/el68d7Llf/XtsSmonvU+D6hsTTkE/yqNWtDFQelMZQ8vTm9Ifj7TjUEMDvd
         SixCz5/qrVXfZM4ZWui8ny3IgsiVzGO1RKKugKsSqJL6Y3lWnk6ucQYOJSBsUJv/tATE
         bv4Jk6KNC14vXTBjqN0hiOvt9On+aOGFiBj9G5rKnJ7ocFXzt1hVJZDEuSK6uHR4YB3E
         6X8VBZocsbbg1P8G9hLnRtZaJVDbQCIsX57apqp0T/qYgjpcBAojRNIMsUvgO+e4Defj
         GfuBgTjYRDfPtsZsEGtVg460j03JZPvRwc2Gd9K1cTlVR/WawleIgs3u2uumwSch7Bg9
         AoSw==
X-Gm-Message-State: AOJu0YximQcR9sPduQcJCM3Bf9JK1gKOe1SFg6xPoMhK8gQKix8UuQ2a
        9EXIZyZovAar9cTrP7a7ZMaayiBFTrRFxVbBIb2m5Q==
X-Google-Smtp-Source: AGHT+IGeMEblFueiAliICx+pZWdnIigWVze5mzQKg70Gob/XSxTKfd2Blz1Vvb5F00DOrKg4/8UUJ/9er3xfC1Xkfqo=
X-Received: by 2002:a25:7457:0:b0:d4a:f17:88 with SMTP id p84-20020a257457000000b00d4a0f170088mr2540265ybc.61.1692217911021;
 Wed, 16 Aug 2023 13:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230816154841.2183-1-quic_nitirawa@quicinc.com> <20230816154841.2183-2-quic_nitirawa@quicinc.com>
In-Reply-To: <20230816154841.2183-2-quic_nitirawa@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 16 Aug 2023 23:31:40 +0300
Message-ID: <CAA8EJpoMFCbHuZcEN3-cxFN94QTG6wfNb52vfwuw6qLOfmdFyg@mail.gmail.com>
Subject: Re: [PATCH V1 1/2] dt-bindings: phy: Add QMP UFS PHY comptible for SC7280
To:     Nitin Rawat <quic_nitirawa@quicinc.com>
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        agross@kernel.org, kishon@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 16 Aug 2023 at 18:50, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
>
> Document the QMP UFS PHY compatible for SC7280.
>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> index d981d77e82e4..ad78da9c2c1a 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> @@ -31,6 +31,7 @@ properties:
>        - qcom,sm8350-qmp-ufs-phy
>        - qcom,sm8450-qmp-ufs-phy
>        - qcom,sm8550-qmp-ufs-phy
> +      - qcom,sc7280-qmp-ufs-phy
>
>    reg:
>      maxItems: 1
> @@ -110,6 +111,7 @@ allOf:
>                - qcom,sm8250-qmp-ufs-phy
>                - qcom,sm8350-qmp-ufs-phy
>                - qcom,sm8550-qmp-ufs-phy
> +              - qcom,sc7280-qmp-ufs-phy

Please keep both lists sorted.

>      then:
>        properties:
>          clocks:
> --
> 2.17.1
>


-- 
With best wishes
Dmitry
