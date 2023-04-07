Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B87D6DB07C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 18:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjDGQXs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 12:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjDGQXp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 12:23:45 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A558CBDCF
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 09:23:33 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-536af432ee5so804957557b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 09:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680884612; x=1683476612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJp208lv00D7h0nGYhObPES5W3aLK5inh/QuulhqHSo=;
        b=KXPuCrN3qLP37oQZUwnZxQOZPjSl+xxbylG99+fKTPfzq8gttzLYI5jQf22Mw2pOov
         msF+fYDPzT8t7wb0QWJ2ZouTYa12ObSBlCe3ZRYZ6okMySB28pU9Eyxk5utTnSxFKWKu
         18diuatyF99IRcFaSUxw7I32VSyCkgIXxfM6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680884612; x=1683476612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJp208lv00D7h0nGYhObPES5W3aLK5inh/QuulhqHSo=;
        b=3tk0m6QPggHtbldAWEeM1LLKaZc2LzHQUlCZvyCv7xuHJanXP1eHKsxaKa6darSn+4
         dxkXGG5uTmx/+9W4fUEII/ps1OlRWFj6DhTenxgq0eOnaJZs73UpgAwY5tthK7Vp5HRa
         L+g+fXYw+9mNRW5nAn8gtPo3Sr5Mn510vQrBy4xOo0h7JH2nH49UM5/RLC9HFhT96c7o
         kf+3aKP6MQrQnY2wTT33wV7X64gkoG873FGW2xeKo8QJpKDtS2OLaJSL10FB17UtHc7/
         r963AiTw/3FJ8JBTzK8OHRK0nqlxY9FOCzn9o97EWp7/BOIvhIwswNj9AnyeJ3MTXWGv
         LkmQ==
X-Gm-Message-State: AAQBX9c7mXW91xUbHiiSMR5Bohdyckz7CuwzWJ7wMB5Yxkrxz1+DH267
        OynbljF0bsfHC5wdejkz3CJNaNu7eLPQhYZIj5A=
X-Google-Smtp-Source: AKy350bb/GS5HLLOpzLW1Dbcd2KRD6g8K+UZJri3LDD58TA/pzbeCXnkO55oGw7Cf6w8ePzLNSvg/g==
X-Received: by 2002:a81:d542:0:b0:545:884:80a with SMTP id l2-20020a81d542000000b005450884080amr2245086ywj.3.1680884612367;
        Fri, 07 Apr 2023 09:23:32 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id cd7-20020a05690c088700b0054bfc94a10dsm1098168ywb.47.2023.04.07.09.23.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 09:23:31 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-54bfa5e698eso137731037b3.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 09:23:30 -0700 (PDT)
X-Received: by 2002:a05:690c:1:b0:544:bbd2:74be with SMTP id
 bc1-20020a05690c000100b00544bbd274bemr1783389ywb.4.1680884610543; Fri, 07 Apr
 2023 09:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230407151423.59993-1-nikita@trvn.ru> <20230407151423.59993-4-nikita@trvn.ru>
In-Reply-To: <20230407151423.59993-4-nikita@trvn.ru>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 7 Apr 2023 09:23:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VQKS1J42qx-Zk9JKwRUeX1evQjZzs_RMAMFby-gaNDXw@mail.gmail.com>
Message-ID: <CAD=FV=VQKS1J42qx-Zk9JKwRUeX1evQjZzs_RMAMFby-gaNDXw@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] dt-bindings: arm: qcom: Add Acer Aspire 1
To:     Nikita Travkin <nikita@trvn.ru>
Cc:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@linaro.org,
        quic_srivasam@quicinc.com, judyhsiao@chromium.org,
        mka@chromium.org, cros-qcom-dts-watchers@chromium.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Apr 7, 2023 at 8:14=E2=80=AFAM Nikita Travkin <nikita@trvn.ru> wrot=
e:
>
> Acer Aspire 1 is a laptop based on sc7180. Document it's compatible.
>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changes in v2:
>  - Merge with IDP (Krzysztof)
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index f8d29b65f28b..db97a61e8ccb 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -367,9 +367,9 @@ properties:
>                - qcom,qru1000-idp
>            - const: qcom,qru1000
>
> -      - description: Qualcomm Technologies, Inc. SC7180 IDP
> -        items:
> +      - items:
>            - enum:
> +              - acer,aspire1
>                - qcom,sc7180-idp
>            - const: qcom,sc7180

If Krzysztof is happy then I have no real objections here. That being
said, I personally would have updated the description to be more
generic and not say "IDP" anymore. Something like "Non-Chromebook
sc7180 boards".


-Doug
