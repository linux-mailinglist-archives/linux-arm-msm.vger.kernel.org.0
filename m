Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD6D96C5365
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 19:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbjCVSPA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 14:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbjCVSO7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 14:14:59 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709DE62B71
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:14:58 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id m6so12758970qvq.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679508897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mv/fhOOQ5K5aUx1ATfnJVpvBsiQzQ1dAgrwhuKG15KE=;
        b=QSh+j0Jn/twZcguFHTjOg/DWNqPf83cQNnOOxXT2rQJ5IqXuHkaEBlus1QY7WlfaOW
         92+00hHxVy69NIJz/28pYL2IePEya4Qhb+QtP68kYW5qVtoe0BrwbUDuzNfNoM9aSWO6
         udoVtWS5j87+Beu4AxUP2PT9huX14ahiwUMtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679508897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mv/fhOOQ5K5aUx1ATfnJVpvBsiQzQ1dAgrwhuKG15KE=;
        b=oiftbNPHg4SBoaXvEJfwm1OZrT03I14wMgDr6WvmxMRejJrnwIG/Ihb5aExe4MyASF
         5+hQC2cyaImqhl2RjugyGw/PVMchbR+ZwF5HyvewHvMydWCQM7iSsTXz/CMKmbZUGpKz
         V4ArJOlzSWbHB52IvtBTfpTa3KJNKziC8K+z2J9TOj4EJSGZHAeiRm5hiro0xjIRYkPA
         yv/SR8VfGf//+zy6pAfSqnt+i1CrbChCr1UhdDqRC5YD6swfhSwtCjdyAe3kLaCPSPOP
         ALYuAoubXYsbMqANBEk5mj9qw35CNvhyRC7jc9XE5XiAll9gWvZKowezgI9+1CooBNCW
         3zNw==
X-Gm-Message-State: AO0yUKUcFEYrmNSnilzQi180Ds3G1DfeKdWUu7NBE0UqZ17PRcGNUv6u
        vE4uaja0iSbDHUtefGIRY29z0MkZ5EbmzVncevA=
X-Google-Smtp-Source: AK7set+mYkkScegxW/ThMt9J3CN20klWjiHgszZ6iCmEle3yizLkiXXCHZVTZE/y6X84oUe9vo03DA==
X-Received: by 2002:ad4:5aef:0:b0:5bd:14f9:650d with SMTP id c15-20020ad45aef000000b005bd14f9650dmr8263732qvh.36.1679508896974;
        Wed, 22 Mar 2023 11:14:56 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id y16-20020a376410000000b00746aa4465b4sm2121845qkb.43.2023.03.22.11.14.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 11:14:54 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id z83so22087103ybb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:14:52 -0700 (PDT)
X-Received: by 2002:a05:6902:1083:b0:b69:ca6f:452c with SMTP id
 v3-20020a056902108300b00b69ca6f452cmr531063ybu.0.1679508892480; Wed, 22 Mar
 2023 11:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230217155838.848403-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217155838.848403-1-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 22 Mar 2023 11:14:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTJsrnPszQ6GHMqYm0hUedA+N126jDSm2uVyVZ+L1e1Q@mail.gmail.com>
Message-ID: <CAD=FV=XTJsrnPszQ6GHMqYm0hUedA+N126jDSm2uVyVZ+L1e1Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sc7180-trogdor-pazquel360: drop
 incorrect RT5682S VBAT-supply
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
> It seems that the RT5682S codec does not use VBAT-supply:
>
>   sc7180-trogdor-pazquel360-lte.dtb: codec@1a: Unevaluated properties are=
 not allowed ('VBAT-supply' was unexpected)
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> I don't have access to datasheet. Driver still requests VBAT-supply but
> other boards simply remove this property for RT5682S.

I checked and I don't see the driver requesting VBAT. Specifically
note that this is the "s" variant which seems to share no code with
the old variants (the "i" variant and the SDW variant).

> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi | 1 +
>  1 file changed, 1 insertion(+)

This seems right to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
