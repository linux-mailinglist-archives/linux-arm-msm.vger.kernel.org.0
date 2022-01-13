Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E2148CFF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jan 2022 02:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbiAMBDy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jan 2022 20:03:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbiAMBDX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jan 2022 20:03:23 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9301EC06175C
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jan 2022 17:03:20 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id d3so4128743ilr.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jan 2022 17:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W66E1VjOzJKa24oipfmBic9o2VKvHDWH9N43cZ6K/Tc=;
        b=VqCpdG6tLgkuK0b8PPn69zb7bce0w/Shq/22NUaSMJ8QDm/Ros6RS3WonpzdDecoLR
         hQg5bYgcp1cBF9m/w2Fkv5nzP4ett9fcfI/v3WWyLh2dFhWSTua6oH0cf0zp+/fwvzPn
         r9oky9FC+6M+61sfhSAqZhDWQbX0/5SF5FncA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W66E1VjOzJKa24oipfmBic9o2VKvHDWH9N43cZ6K/Tc=;
        b=S/R6+kcFyKC7XaAdiWvgu8kZO4ghSAnrjCm+fywyKPqXS/JkGwTf8+0VDnqx7pWGKp
         SRiDOHSTjPP0ReftKSmVN6+aNx53cojg+2lF830SWIL9xS5FCukAn8FPu+FtcCXNn2h9
         2GnqIIDpJB8pyfPsTELj+rri+9fs6hvorr2jNHO9jyNblthz2xonO+6ogtbla0rpd0qX
         GgKUNeSy0KT+Otc4WYIr7Ed5Q2anph8zU/E+LJrZQaUIuBKGktp4sPvJo2GGJ2YbL9cQ
         kS1RcNG9tp1WIbn1BOu++2mklP0Kx5H/xhg0Oaiv/1gfRZpEswHO8ZZo9FbvH2lZE3Ri
         R8ag==
X-Gm-Message-State: AOAM5324cDbGxRM0Cl9sGxq8CZcxq2YoRGng6Dq2lRD5bwT5+Eh0DppM
        M/q644yMtP44s7Fm1J4VuVJf03/sbFrNwA==
X-Google-Smtp-Source: ABdhPJyzM4oweRLphm2gqghvGTm23fJy7S/dfqmKuRHCvEHg4xhRI6fyA+7Pt/Xh5aVmJtP3vZENXg==
X-Received: by 2002:a05:6e02:1a4e:: with SMTP id u14mr1186762ilv.178.1642035799602;
        Wed, 12 Jan 2022 17:03:19 -0800 (PST)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com. [209.85.166.169])
        by smtp.gmail.com with ESMTPSA id f1sm1055228iow.33.2022.01.12.17.03.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 17:03:19 -0800 (PST)
Received: by mail-il1-f169.google.com with SMTP id o20so4186060ill.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jan 2022 17:03:18 -0800 (PST)
X-Received: by 2002:a92:c202:: with SMTP id j2mr1133992ilo.165.1642035798593;
 Wed, 12 Jan 2022 17:03:18 -0800 (PST)
MIME-Version: 1.0
References: <20220112191048.837236-1-mka@chromium.org> <20220112111028.v19.5.Ie0d2c1214b767bb5551dd4cad38398bd40e4466f@changeid>
In-Reply-To: <20220112111028.v19.5.Ie0d2c1214b767bb5551dd4cad38398bd40e4466f@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 12 Jan 2022 17:03:07 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WwUJo2NKq2XboVYiCnRKDtyrZxbOJnVox-M0SCQrhSWQ@mail.gmail.com>
Message-ID: <CAD=FV=WwUJo2NKq2XboVYiCnRKDtyrZxbOJnVox-M0SCQrhSWQ@mail.gmail.com>
Subject: Re: [PATCH v19 5/5] arm64: dts: qcom: sc7180-trogdor: Add nodes for
 onboard USB hub
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Chen <peter.chen@kernel.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jan 12, 2022 at 11:11 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add nodes for the onboard USB hub on trogdor devices. Remove the
> 'always-on' property from the hub regulator, since the regulator
> is now managed by the onboard_usb_hub driver.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v19:
> - none
>
> Changes in v18:
> - also adjust config for pompom rev1
>
> Changes in v17:
> - none
>
> Changes in v16:
> - none
>
> Changes in v15:
> - none
>
> Changes in v14:
> - none
>
> Changes in v13:
> - none
>
> Changes in v12:
> - none
>
> Changes in v11:
> - rebased on qcom/arm64-for-5.14 (with the rest of the series)
>
> Changes in v10:
> - keep 'regulator-boot-on' property
> - updated commit message
>
> Changes in v9:
> - none
>
> Changes in v8:
> - none
>
> Changes in v7:
> - rebased on qcom/arm64-for-5.13 (with the rest of the series)
>
> Changes in v6:
> - added 'companion-hub' entry to both USB devices
> - added 'vdd-supply' also to hub@2
>
> Changes in v5:
> - patch added to the series
>
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 19 ++++++++-----------
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 12 +++++-------
>  .../dts/qcom/sc7180-trogdor-pompom-r1.dts     | 11 ++++-------
>  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts | 19 ++++++++-----------
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 19 ++++++++++++++++++-
>  5 files changed, 43 insertions(+), 37 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
