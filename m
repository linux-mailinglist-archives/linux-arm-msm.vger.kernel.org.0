Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1CA40F3F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 10:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237667AbhIQIWq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 04:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbhIQIWq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 04:22:46 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C075BC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Sep 2021 01:21:24 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id d11so5554805ilc.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Sep 2021 01:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0GkboYJBUnZ3DcDNAFuDrdJijux8O2p25uzuaaNFSXE=;
        b=TmTKeISeFaLJi2OibAuGysdr6Sxc+jGRCfmmq5r2f4xwB1LGcLa7K+EVTlflk9s131
         lfHWtbnvLltQBloHDy4KaVOFIaFTaCGFCL1adsYhZ8G0R1ff9fxfvGz0YFo10AYppVkc
         U6O/bl9F1/p1CPFeu5Qv/My2qYdAvzZiOLsXxI5PCmY00Ystu+tbvkHC1wvS+opdXsYe
         ZxoejN7f4T4+CIuqMm8hjzVxhoOTna6KNlkybZQ735foY4ezkzcwRyXjAvL5uf73VMhw
         yMSUsMBqWvoim4GKV57yaSCbLQ29d2wmZKNZTL/hCV+gLDyRMlI183F6RPKZxThweBW6
         SEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0GkboYJBUnZ3DcDNAFuDrdJijux8O2p25uzuaaNFSXE=;
        b=7Z57jb4UDyfR1iDqF5XFeNlZCyCKJWh/BJT7Oie2SYh+O9hfmcl4c4QQDbnhii3I45
         qgswQRJGvxCEIkCtds1qdk3hTZqiIkNS6pAzsZ8NbL8Hh3OX1mrYzVrz/W5vruFYIs4/
         gLB3i4xcCGugOXeT34UxHjqVK+FBy+d5cY0+CaFZ2B1M142KDl87VSCbyZ+EOOsO5U6L
         m/4L2E+1+Vko0B93Ptrwy3v9Hs5AO02wKl4ASZ3IHdHoFfjMiZfdiw/NZ+Ytbtjo7knv
         gVJzUNBx3k8CUwoD1MaQ18r15ZysVJxmAWqhrKjo3kOa8Ki8tiz1nAtq5D9YgG3Oed45
         skUw==
X-Gm-Message-State: AOAM533jVHi6Ig2vd2yTEnQkvhY7QnPKqLvXy17YPR78TJE2T74gXmBT
        1yaJt53VSXOnvvclOD+BB6UPTrttzzmVTmiCIeok6LtsNkrwyqGR
X-Google-Smtp-Source: ABdhPJzzglGVh7G8IuPTTmOjHGgubbDu/uyOF0zcv2AgMAiTalw6ta9pgClsU1X/RGPCiC9z05NCFlCRQislJTD3r+s=
X-Received: by 2002:a92:b703:: with SMTP id k3mr6995850ili.95.1631866884103;
 Fri, 17 Sep 2021 01:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210916151341.1797512-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210916151341.1797512-1-dmitry.baryshkov@linaro.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Fri, 17 Sep 2021 13:50:47 +0530
Message-ID: <CAMi1Hd3=pHcWzk-=ToAX8o0XiFaGQ74KvySZj9+7sNvjpXLpew@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: pm8150: use qcom,pm8998-pon binding
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Sept 2021 at 20:43, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Change pm8150 to use the qcom,pm8998-pon compatible string for the pon
> in order to pass reboot mode properly.
>
> Fixes: 5101f22a5c37 ("arm64: dts: qcom: pm8150: Add base dts file")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Smoke tested the series on RB5.
"adb reboot bootloader" and Power, Volume_Down keys work as expected.
So for the whole series:

Tested-by: Amit Pundir <amit.pundir@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/pm8150.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
> index c566a64b1373..00385b1fd358 100644
> --- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
> @@ -48,7 +48,7 @@ pm8150_0: pmic@0 {
>                 #size-cells = <0>;
>
>                 pon: power-on@800 {
> -                       compatible = "qcom,pm8916-pon";
> +                       compatible = "qcom,pm8998-pon";
>                         reg = <0x0800>;
>
>                         pon_pwrkey: pwrkey {
> --
> 2.33.0
>
