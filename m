Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5371021A894
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 22:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgGIUFz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 16:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgGIUFy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 16:05:54 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4822C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 13:05:54 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id m18so287900vkk.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 13:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AinvQ5PJ9tMDmXSnO6ck/b394CwO1KeWDAa17fxTsYg=;
        b=YRWjysvDqa2DekkVgn/4ZOp6k855hwYraXOphC7+nCx7SuZ5nn61o38XK5X/azo5P6
         drSB++in4V2a93h0pcnzC1YcaT7j+hXWsH8/6k6A5t7ABanFshrtH+gezzIZW7I8Hjxc
         FhYBkILnSTuLzBLAunNFHZckck10Glqgq4A5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AinvQ5PJ9tMDmXSnO6ck/b394CwO1KeWDAa17fxTsYg=;
        b=UKS6J+rR/OKtTk0J8JqFvdTFSh1MLhd2EuuGzoIfEQi831kL89uUPmdUMb/v7oq68K
         84Hs9mLN7BGLaTnugeAYPmcv+si5nnNjC8NK9otcXtccgdGMI8XFu9DiN3bTs+HLbMTu
         1W2OXwyGk81wBBf11LgVDtSr85b4URPvRBxhDq6Cwn8udxkCmMbUPIO1SE/Rmd/NFyiw
         xU1B/jj3KuvfMO3/cg21Tkq13NZzxl7fIysuekd1gnDuHfUaRUtGnmFdZcmLTA6Do5Pz
         QEdyxYyzqBzuhCwgcDpMgctjNxdFLB2CVXbi2P2rMOkEifglcojpvHHWA52IA+0+4fnp
         M+oQ==
X-Gm-Message-State: AOAM533u5BUCNAe77xZRM2QTaJOL28ucvr23NXMWTmJV8dESlEgpKk5d
        Q+EPKNiyNn0f/ZWuFf2DItMa2voh8U8=
X-Google-Smtp-Source: ABdhPJxfI55ZyFqQC67Rhfr3pTBDQ5avXTjVKi6u8hXwst+cPmymKQuFoksLvGUmH0uSOqJSYWLcMQ==
X-Received: by 2002:a1f:a883:: with SMTP id r125mr34943706vke.29.1594325153853;
        Thu, 09 Jul 2020 13:05:53 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id b21sm403956uap.15.2020.07.09.13.05.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 13:05:53 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id a17so1782948vsq.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 13:05:52 -0700 (PDT)
X-Received: by 2002:a05:6102:30b5:: with SMTP id y21mr26283797vsd.42.1594325151959;
 Thu, 09 Jul 2020 13:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <1594286253-32244-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1594286253-32244-1-git-send-email-pillair@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 9 Jul 2020 13:05:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQy17ZuKdJXPH20uGTrEtPrDacDXAg+rTA96HBm6hVVw@mail.gmail.com>
Message-ID: <CAD=FV=XQy17ZuKdJXPH20uGTrEtPrDacDXAg+rTA96HBm6hVVw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add missing properties for Wifi node
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Evan Green <evgreen@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 9, 2020 at 2:18 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> The wlan firmware memory is statically mapped in
> the Trusted Firmware, hence the wlan driver does
> not need to map/unmap this region dynamically.
>
> Hence add the property to indicate the wlan driver
> to not map/unamp the firmware memory region
> dynamically.
>
> Also add the chain1 voltage supply for wlan.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
> This patch is created on top of the change by
> Douglas Anderson.
> https://lkml.org/lkml/2020/6/25/817
>
> Also the dt-bindings for the chain1 voltage supply
> is added by the below patch series:
> https://patchwork.kernel.org/project/linux-wireless/list/?series=309137
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 472f7f4..4c64bc1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -391,10 +391,12 @@
>
>  &wifi {
>         status = "okay";
> +       qcom,msa-fixed-perm;

At one point in time I thought +Sibi said that this wouldn't be needed
once the firmware was fixed.  ...afterwards you said that it was
needed for SSR (subsystem reset).  Would be good to get confirmation
from Sibi that this matches his understanding.


>         vdd-0.8-cx-mx-supply = <&vreg_l9a_0p6>;
>         vdd-1.8-xo-supply = <&vreg_l1c_1p8>;
>         vdd-1.3-rfa-supply = <&vreg_l2c_1p3>;
>         vdd-3.3-ch0-supply = <&vreg_l10c_3p3>;
> +       vdd-3.3-ch1-supply = <&vreg_l11c_3p3>;
>         wifi-firmware {
>                 iommus = <&apps_smmu 0xc2 0x1>;
>         };

Other than the one question this looks good to me.

-Doug
