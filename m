Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29A8F522504
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 May 2022 21:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231633AbiEJTtz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 May 2022 15:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiEJTtw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 May 2022 15:49:52 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3570268662
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 12:49:46 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id i27so35001606ejd.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 12:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZgwVFN5ZXlnWfmxKkcCyw+qVwt2BQmrdrtZrCkyPCa0=;
        b=BM+NJmlQLhHE0L9ymWoYJ4kB8ijA58RwwkGxB+c+rn/XAKZCVn1Cn+VfNX96/eHvGd
         f+OXHbiOVAtesaJYTI1pfk/MRNaHMtTzuX8G+q7Dn3SC37t18dcdhqBhfIoo6DJXm/7B
         hclx4e1LYUQOt7AuRQwhn2/i7BglcQhY6f19s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZgwVFN5ZXlnWfmxKkcCyw+qVwt2BQmrdrtZrCkyPCa0=;
        b=yaGQzSh4gAecyjsutTAbwZS30KCPs/27N0Jkgc8nN311f5q0HqcIuYDHlGg+/mM47Q
         QaXnNILTJP0w7zIx7qdTGLDpkChV5rLQSQzLPqV9cInuea3P8KyhqDt/vjhtIQi1BNfk
         T1CvKSpX2fdmyvLgD0gLJBwOMUgRljzpmqhcDKA/vIu+1Y3HFGcSvVXmyXSEI7SEtCJk
         vyuewq6FAescg2RUBiqxYQPUQBp+x4z/DwrPnxvJ9m7I/LUSLb7lN7Oeb9UyqAzDi9jP
         O7ehFe4Wmvg3Rd3TjYuFVZGHaHSscImt0IitWBZkcMWoxc/q8npylFoUf1OysOLdMjxd
         tiUA==
X-Gm-Message-State: AOAM531nvNJYfMFN2dwVq944Ju94NxntUwBd3A2sYSGKlBx3l2DeO6OA
        qWlAG5Ibwe59ouEog4UXYE5FvmsUsbZqeCyL
X-Google-Smtp-Source: ABdhPJwIu9GEr/nIAc3QY+jzd2pmCDOn1ZBzJlCdjXDUD+MH8/xz+BdaUZqs5M0eKEP9VLAig6uM8Q==
X-Received: by 2002:a17:906:3513:b0:6f3:a080:9f46 with SMTP id r19-20020a170906351300b006f3a0809f46mr20791645eja.466.1652212185108;
        Tue, 10 May 2022 12:49:45 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id i3-20020aa7c703000000b0042617ba638esm62162edq.24.2022.05.10.12.49.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 12:49:44 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id p189so10809107wmp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 12:49:44 -0700 (PDT)
X-Received: by 2002:a05:600c:3d8c:b0:394:6097:9994 with SMTP id
 bi12-20020a05600c3d8c00b0039460979994mr1474094wmb.29.1652212183882; Tue, 10
 May 2022 12:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220510104656.1.Id98b473e08c950f9a461826dde187ef7705a928c@changeid>
In-Reply-To: <20220510104656.1.Id98b473e08c950f9a461826dde187ef7705a928c@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 10 May 2022 12:49:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U33QSjnD7ERdVBb+hk4yooGU5=C0FtnhFsDME_MePR0w@mail.gmail.com>
Message-ID: <CAD=FV=U33QSjnD7ERdVBb+hk4yooGU5=C0FtnhFsDME_MePR0w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Set modem FW path for Chrome OS boards
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Joseph S . Barrera III" <joebar@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 10, 2022 at 10:47 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Specify the path of the modem FW for SC7280 Chrome OS boards in
> the 'remoteproc_mpss' node.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> index 9f4a9c263c35..995c5bd12549 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> @@ -89,6 +89,8 @@ &remoteproc_mpss {
>         compatible = "qcom,sc7280-mss-pil";
>         iommus = <&apps_smmu 0x124 0x0>, <&apps_smmu 0x488 0x7>;
>         memory-region = <&mba_mem>, <&mpss_mem>;
> +       firmware-name = "qcom/sc7280-herobrine/modem/mba.mbn",
> +                       "qcom/sc7280-herobrine/modem/qdsp6sw.mbn";

We don't necessarily need to change anything, but a few thoughts:

1. I guess technically we don't actually need the "modem" subdirectory
for herobrine, right? WiFi works differently on sc7280 so we won't
have a "no modem" modem firmware. ...but I guess it doesn't hurt to
have it and it's nice to keep it symmetric.

2. Whenever we're ready to support WiFi only SKUs then I guess it'll
still be OK to specify the firmware name. We'll just set the status of
"&mdss_dp" to "disabled".

3. It's slightly weird that we're using the name "herobrine" but
putting the change in the "chrome-common.dtsi" file. Should it be
"sc7280-chrome" instead?

-Doug
