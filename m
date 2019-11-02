Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B333ECFD0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2019 17:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfKBQyj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Nov 2019 12:54:39 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33025 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfKBQyj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Nov 2019 12:54:39 -0400
Received: by mail-ed1-f68.google.com with SMTP id c4so9860328edl.0;
        Sat, 02 Nov 2019 09:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ghf/p8lPw2FMQrMnoCiCr2PRs7Q4z/vyAzI31fJ4SxI=;
        b=UFXtrwxgi/6OHKHU5n5I4051h89Jr99VNX4YwB9sQopoN0xVWxEe6LXn3AFXmuiZA0
         FecbWh1b5CQLXzgPwfEYzc0QPuCtRkF7P/s/YcEke4xP64zSoFZ2DltcWcuXPkuqMU5L
         XeAEJuQubo9rbMIMckDVkwmevFn+eiCG42hE3fZg1Sq3gU48+enRs11yf0N4Dfz43xlg
         hokPChWwXFKj6xareYg5l3psm9Qqip8ldDUtPD77XIDMaN6FubmXByFT3DrRjVjHc9mD
         7Nl4//shNVv1CRnnrw+4VKdIL/Igrn+hTHr7gOOebWEP2/aBGHF8bjkDrKGQCbEcmx1g
         891g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ghf/p8lPw2FMQrMnoCiCr2PRs7Q4z/vyAzI31fJ4SxI=;
        b=UCoaN+nI/QvltVhKLbf1+urebN9k0XLuCVmIupl8c2ElVuerr8KQhnt6FXF5WRiZKs
         rPiKJGztPSs9HkCdMEZ6gO8nITKpIz6DGKYL5W+71XV3eA4rlvnr3HaPeraNnDdAY/9h
         f9F4wazu9vPijWCp6BYHGbseaRAaxOU/XK/mZjsOyVgIgIr7Y6mADlEul/e9+WY9AG8w
         6GCUwU3BLU75VU+oXo0X+YaEMStH19+QHHDqeTS32Fj2Jtlsi56Yirmq2VdUbUXncA6E
         Az1C4ciyiupGW/TdW6TcKtUMY2i9Lm/GhzGhJWEVBgxLRcCTtAf7SejwmticMNJUO/64
         nqXA==
X-Gm-Message-State: APjAAAVEbZKsNKM00UPsvUFy0oiXYVtr5tupSveX1HPCjFvDN8+rbrM7
        STgrEZREFZeEGGXdhZtkET1v73VrhAypVM8tE8M=
X-Google-Smtp-Source: APXvYqwKzyDPWo4pbqmwhzNvzxZORWkf137KMt0HTWuLLvR5uIHmBfYFxzuC+NHnts84g39RnZsy6AiUHKhlKb9s5hs=
X-Received: by 2002:a50:fa83:: with SMTP id w3mr4146132edr.272.1572713676998;
 Sat, 02 Nov 2019 09:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191031104402.31813-1-kholk11@gmail.com> <20191031104402.31813-6-kholk11@gmail.com>
In-Reply-To: <20191031104402.31813-6-kholk11@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 2 Nov 2019 09:54:24 -0700
Message-ID: <CAF6AEGtXhOeV_7yZ8-px5EjQN9+Cmfgis8JdO3iCWZ2+g0=ukQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] dt-bindings: msm/dsi: Add 28nm PLL for family B compatible
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>, marijns95@gmail.com,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ devicetree list

On Thu, Oct 31, 2019 at 3:44 AM <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> On family B SoCs, the 28nm PLL has a different iospace address
> and that required a new compatible in the driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> index af95586c898f..d3ba9ee22f38 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> @@ -83,6 +83,7 @@ DSI PHY:
>  Required properties:
>  - compatible: Could be the following
>    * "qcom,dsi-phy-28nm-hpm"
> +  * "qcom,dsi-phy-28nm-hpm-fam-b"
>    * "qcom,dsi-phy-28nm-lp"
>    * "qcom,dsi-phy-20nm"
>    * "qcom,dsi-phy-28nm-8960"
> --
> 2.21.0
>
