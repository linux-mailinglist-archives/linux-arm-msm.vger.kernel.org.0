Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06AE3315AF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 01:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233495AbhBJATJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 19:19:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233675AbhBIX7b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 18:59:31 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32B92C061756
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 15:58:06 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id o21so380838qtr.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 15:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s2BjX4ig8BMAtOP8qTH6uiEuUuV9m/QcvesSTTpu654=;
        b=PH2+uX2zHFgqRUfNy0a0hQCKj0y2wd1Jc5rnBxW17DW88Wdt09BDekz2VYBdW/Monf
         IyBAbUXzjv+Uvy95GktP7bqHr6t6OyxTM2Pr6Zu5unNjKHKbSf+mjRQUKTM7XvKVCllp
         987HH0qsv5h/NIehupehfikWRDuATWiCe3FLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s2BjX4ig8BMAtOP8qTH6uiEuUuV9m/QcvesSTTpu654=;
        b=EpH2NApADdqJEYCgtOuaNQUsktbWacLgDSe/uxY2QNsigswDRj2WwoOfyimalmfhMU
         hSRxySJYd1B+219ArZK/a6uDVChmHFn6Jr0mzBzddznnMVNqhu5REb+bxCo/4EOlGlcz
         z/uN9XaK0P1BLuGD1eCdZzIrnc9C6gXg2d9ZoxFbNkYGKe9eoDcb59QrAXopNhOy8/UC
         ig3YakhFUgHvjjJRTbWBnBRK4Ke6QV39A+oCP1/Fe+R8Kirk3Zx0x4bb+UtCY0Z8uLFE
         9IEMg0Nlh0qZvMoo2WuTomTyAZYpdCRH0e+8LT0AuaOb1dz6MhaNJ2IqX9tutR80R4hR
         4K/A==
X-Gm-Message-State: AOAM532vPpwQxKvrsQNQq+PCL1Irs3RNbgOdpGebttlFGomY2zjBXWvs
        RIQ0be2AkwTxpcgjltfHmoyGkVKCnk3uag==
X-Google-Smtp-Source: ABdhPJzW8yJ7sGy5ILnZWRB4NYuwBJxZN4AetiSBXNWkN05XGCOQL9CiIgP5WIC5smPt+uiOGGvcDg==
X-Received: by 2002:ac8:7511:: with SMTP id u17mr484812qtq.285.1612915085293;
        Tue, 09 Feb 2021 15:58:05 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id o194sm259626qke.101.2021.02.09.15.58.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Feb 2021 15:58:04 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id e132so208861ybh.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 15:58:04 -0800 (PST)
X-Received: by 2002:a5b:84f:: with SMTP id v15mr479438ybq.79.1612915083703;
 Tue, 09 Feb 2021 15:58:03 -0800 (PST)
MIME-Version: 1.0
References: <20210209202849.1148569-1-dmitry.baryshkov@linaro.org> <20210209202849.1148569-3-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210209202849.1148569-3-dmitry.baryshkov@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 9 Feb 2021 15:57:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VJddx3m2vjEe1ZB5LDgL4V78tYafq4_Efi+AjpQGZAnA@mail.gmail.com>
Message-ID: <CAD=FV=VJddx3m2vjEe1ZB5LDgL4V78tYafq4_Efi+AjpQGZAnA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: sm8250: further split of spi
 pinctrl config
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Feb 9, 2021 at 12:29 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> @@ -715,7 +710,6 @@ spi19: spi@894000 {
>                                 clock-names = "se";
>                                 clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
>                                 pinctrl-names = "default";
> -                               pinctrl-0 = <&qup_spi19_default>;
>                                 interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> @@ -755,8 +749,6 @@ spi0: spi@980000 {
>                                 reg = <0 0x00980000 0 0x4000>;
>                                 clock-names = "se";
>                                 clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> -                               pinctrl-names = "default";
> -                               pinctrl-0 = <&qup_spi0_default>;

Why only this one removes "pinctrl-names" but all the other ones don't?
