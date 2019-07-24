Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2106172718
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 07:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbfGXFBI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 01:01:08 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:45976 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbfGXFBI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 01:01:08 -0400
Received: by mail-vs1-f66.google.com with SMTP id h28so30504379vsl.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2019 22:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MwZbVvyxm3PI+MouNfOXYHnz5VFLnB1AMhPNSWYl2+c=;
        b=ct6X0qA08bQF6QWHQzeKtcjUKYrb7O7huAAWPkMX0eTJkPb6b7frcH1oeg0W7R09DB
         w3F5THxqJlS+MU0uE0j6aaVKMWGWB4bJc1gBKZJlA1G4t90eUrVgseu8YQRsevSNNieF
         lTUHbs/2Q/5i/J4Ip5lJgT467azUxXiYYUSiaxUFW+8oF2PSUe1pFktoNiQ7MbBq0M7u
         b+cmxOWvxA/ZgG8Efyd8Xcd/UXF7dJAx/CL5IA8tFTyNkZt4nZnOqTqxs2GyCz7mT2xS
         FMZBJ8t4WufNl47qbxbdbA9TMA51Bs5PYk0GmuHlJ3Ujht7UbGc7MA3Ylqz3uT9mAa4g
         mSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MwZbVvyxm3PI+MouNfOXYHnz5VFLnB1AMhPNSWYl2+c=;
        b=SDCRUix+II/MnmbbGVFQK615f5/FJwSUw0Ywh9ua+Ok5mgFUQyGdkPI8Hg7ZsWQlOA
         RvOQuBkRIZru8VM0nY1j9ZxiNwXrzThI/KL4cWteQSe/msOEM4AacBS+OXpS5MtPfMjm
         rGmeceEgvzKcafyjqyHsoF8/K1mht25HcVHFlQ6EmSiIWCm1FpbFOT16VRqdJOJKVoiT
         FxCIQvSp2DJT6dChM59Ice1ZsQtmJfyJakYLwb7KibBxBlzb3TqXcZFp6BE8/TFgnK4M
         9e5m7ihoIeb+z88/NGXhTG52k3oFj5YxIEdGes7XJdmJTfKcI3JfhbOehG5lO/18hAPl
         A/Fg==
X-Gm-Message-State: APjAAAUVPOggdPn44PUfaVPCUyKWH5Ts2zkcMZgItUMmccpS5Isj9YbT
        M4cv3vWMMJaiA/rERkc5/P+SiWrccP+jkfpaFck=
X-Google-Smtp-Source: APXvYqzDfgoeYz/99kNuC9UX09QAW/OkLD2aDZBnfw+xJRRF04yHjb4iM3P/YyScPY9DnWqV3/sPpIpefel/c99irMc=
X-Received: by 2002:a67:f5c5:: with SMTP id t5mr21338731vso.27.1563944467386;
 Tue, 23 Jul 2019 22:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190724044906.12007-1-vkoul@kernel.org> <20190724044906.12007-2-vkoul@kernel.org>
In-Reply-To: <20190724044906.12007-2-vkoul@kernel.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Wed, 24 Jul 2019 10:30:56 +0530
Message-ID: <CAHLCerOkm+QM+=PDYwWwzYNT_inMHtnnmcZRGdJy_p6ozvkgTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: sdm845: Add unit name to soc node
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 24, 2019 at 10:20 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> We get a warning about missing unit name for soc node, so add it.
>
> arch/arm64/boot/dts/qcom/sdm845.dtsi:623.11-2814.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>


Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 601cfb078bd5..e81f4a6d08ce 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -620,7 +620,7 @@
>                 method = "smc";
>         };
>
> -       soc: soc {
> +       soc: soc@0 {
>                 #address-cells = <2>;
>                 #size-cells = <2>;
>                 ranges = <0 0 0 0 0x10 0>;
> --
> 2.20.1
>
