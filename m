Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98EB557CC0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 15:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbiGUNgW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 09:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiGUNgV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 09:36:21 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC59C27CC6
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 06:36:20 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id t3so2238936edd.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 06:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kZ+EaaTNcvyNclKTamsWDViD0TCzODM1RnJ73E0WdAY=;
        b=M5Lm6hdN0IaCIgqk+NnU2YYFc7XuxPONmUSZ259X+eoeZaBm2Nq3a2rHfQ7zMkWNj3
         zPEVdUeryYmsbaLGwuKw3VS4qZZuufbCeuSmSCmmT/Px6JFLyfOSGPdQ8QKujwXsalgY
         QjQDkue1sfu0li+R3yg1x6xPSir5QDi6/I7V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kZ+EaaTNcvyNclKTamsWDViD0TCzODM1RnJ73E0WdAY=;
        b=SabX2wwKShPsT+M1pL7DnlrW6nO/hXCnV1eQe/4EuJH7NtmHNXCMVK9pvpjIqF97N4
         r3a4HC2KhSEFAjhupDJdKEuZ3a2q6GAwiKEz95s+M6WE7d8TKoYibhrqEnlCfGXMAZPy
         MZ1U5tTOIrdceuVmq7II+slcSTU42xR2rpMU+EEmoNdZm/rmaJ5htpOABK+PinBjgyJz
         AiBuzt4BuIMn9xWrOfpE29jjDUKvKJcVZQ06UxiSWS8zZQ8WjZqg8HzzJXPGfl9ECMia
         sWWIXePEkRJQnMEzZSsIdzNiFddHVNA4xz46kMvHcd9LYRaWu/9zMXOb8+JcTTpxIH1H
         +o4Q==
X-Gm-Message-State: AJIora+8Lf1G1ZQDC4pE0ADPVbN89dYVxkA235lMrD/E8juta5Yu0feZ
        QaHbLbgocHU83KPSYCV1ocrf8mslX7CGw8Z1
X-Google-Smtp-Source: AGRyM1v8Eeiowmb246q8le9A6KauOZMec6btAa6WokRJh5XhgykXRITXlrDvv7Lwa4KZeImaC6gHIw==
X-Received: by 2002:a05:6402:350a:b0:43a:a486:102e with SMTP id b10-20020a056402350a00b0043aa486102emr57217442edd.372.1658410579173;
        Thu, 21 Jul 2022 06:36:19 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id ez20-20020a056402451400b0043bc61348casm926344edb.65.2022.07.21.06.36.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 06:36:17 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id k11so1859190wrx.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 06:36:16 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr35138943wrr.617.1658410575960; Thu, 21
 Jul 2022 06:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220721033918.v3.1.I10519ca1bf88233702a90e296088808d18cdc7b1@changeid>
In-Reply-To: <20220721033918.v3.1.I10519ca1bf88233702a90e296088808d18cdc7b1@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 21 Jul 2022 06:36:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uuv0rGg1+8_b=R7SM-g87U_4TipwbNgVTXDd6T=X3qEQ@mail.gmail.com>
Message-ID: <CAD=FV=Uuv0rGg1+8_b=R7SM-g87U_4TipwbNgVTXDd6T=X3qEQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: Add SKU6 for sc7180-trogdor-pazquel-lte-parade
To:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 20, 2022 at 8:59 PM Yunlong Jia
<yunlong.jia@ecs.corp-partner.google.com> wrote:
>
> SKU6 is LTE(w/o eSIM)+WIFI+Parade
>
> Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
> ---
>
> Changes in v3:
> - Bindings and dts in the same series.
>
> Changes in v2:
> - Put sku6 before sku4.
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
