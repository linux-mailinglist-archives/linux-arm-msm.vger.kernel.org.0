Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB621DA23D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 22:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgESUHs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 16:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbgESUHs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 16:07:48 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D24DFC08C5C0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 13:07:46 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id v26so409667vsa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 13:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UXbwGQX7NBj93macBQks6TpgCaCAqI85y6U/Eho5NaA=;
        b=iMBY+L1k7S2P7A4yIvSJy4MuZVOr4X+yr4pt1EqaJLCp6UcTm+kmuYjI5XDEe9FOP2
         SumGBT1xC3NYhOGo+zSCsVuJcjHpynQ2q6oJ45AVzmudv6qxVEOkF4nnIgDJqe8LeQwJ
         yB5S7v/Ar4tfTj9fY0v9m2ouNF1hwJw9OzKyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UXbwGQX7NBj93macBQks6TpgCaCAqI85y6U/Eho5NaA=;
        b=PlkJJveS8WHsb7HGrAEhi6Ziux3jSi6we2spYUf8ZtR1EsegQ9v6qk7zV78615/shg
         81PE0XXiqid8ksHuB9fcmBwZVCjlQcz+YlaOo+zkKnVZglzNVeZh0ml8vVsIPzLu3qmo
         /l/x2LpWOBrJlJNHjIvxGkz/jxFWE+FOhax7DIOzpWX4sGj+4NbibgE0fjd4+8Ez15V8
         PkAZipCxYoygAJBiU27dGzTwjuFWu5V+T+WehfKK+24ePEWKCu8t+n0RJn+Da0tKCbrv
         wwFcVw610Ng5B+9K4sVpbcui3HuOzGnEWn0ZQETG67OzjcBZwGX7wFmZrZiwUQeT1M9j
         O/Yw==
X-Gm-Message-State: AOAM5313nwjC/rsqsTe3GT6uDHCZvW4ItW0X+UC78TgjsTzjYyDPYMKP
        1F/MRtJw1aXoXoa11dHwhsCidjlZxOU=
X-Google-Smtp-Source: ABdhPJwQqha3OEb+7ckLl4WDUfn0rQCYNdE1RDrORvNJhauLSXLQlF1kYvNiaj8/xbIRjLVJrEeSqw==
X-Received: by 2002:a67:e998:: with SMTP id b24mr817636vso.222.1589918865746;
        Tue, 19 May 2020 13:07:45 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id w195sm176536vkw.35.2020.05.19.13.07.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 13:07:45 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a11so394503uah.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 13:07:44 -0700 (PDT)
X-Received: by 2002:ab0:b13:: with SMTP id b19mr945772uak.91.1589918864128;
 Tue, 19 May 2020 13:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <1589914405-6674-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1589914405-6674-1-git-send-email-pillair@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 19 May 2020 13:07:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXRhh-1cWH5rMPq4W_Dh4yE=++sga_aJ8cwFkKkrAXbg@mail.gmail.com>
Message-ID: <CAD=FV=XXRhh-1cWH5rMPq4W_Dh4yE=++sga_aJ8cwFkKkrAXbg@mail.gmail.com>
Subject: Re: [PATCH v10] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 19, 2020 at 11:53 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> Add device node for the ath10k SNOC platform driver probe
> and add resources required for WCN3990 on sc7180 soc.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
> Changes from v9:
> - Place the wlan_fw_mem under reserved-memory node
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  7 +++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 27 +++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 4e9149d..38b102e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -389,6 +389,13 @@
>         };
>  };
>
> +&wifi {
> +       status = "okay";
> +       wifi-firmware {
> +               iommus = <&apps_smmu 0xc2 0x1>;
> +       };
> +};
> +
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>
>  &qspi_clk {
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index f1280e0..19bd7d0 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -106,6 +106,11 @@
>                         no-map;
>                 };
>
> +               wlan_fw_mem: memory@94100000 {
> +                       reg = <0 0x94100000 0 0x200000>;
> +                       no-map;
> +               };
> +
>                 rmtfs_mem: memory@84400000 {
>                         compatible = "qcom,rmtfs-mem";
>                         reg = <0x0 0x84400000 0x0 0x200000>;

This is less wrong than v9, but still a little wrong.  You should be
keeping these ordered by unit address.  94100000 comes after 84400000.

-Doug
