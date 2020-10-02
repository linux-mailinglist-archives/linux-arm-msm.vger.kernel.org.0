Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 305DA281969
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 19:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388132AbgJBRi2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 13:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387957AbgJBRi2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 13:38:28 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20960C0613E2
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2020 10:38:28 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id a2so2123101otr.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2020 10:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RRHIpLL5JKXeqD/g2RyUOG+CiEIyOXTKb06G3qE0ufA=;
        b=GqQrZXE3KUB4ITD1icOKtph32YW1dZsWguYwMh8ync2TRdTLmEiVzNJr50m5wtziyk
         9jFg6Ss4SL+emdiDklGjkVba/ccAC2XQlUuXmSqFpp57fCk0ZQglPJsWYm3d92as0Wg/
         w3z4BXDNxVRd1zvicbX4/tiKlqwXRrk7JI8CGNjq63OBbPTCoRG0JS9RsvwLhx+IvEMN
         D5ox06IGUXw8+6egR7Uny6Fa7vuw37rO2bi6hwp/JhBsP4RjR0r1X0OqQU60VPKZubgK
         O5Vck7tF2AfSALKRAQOj2EjMnBNgLmOwUKfc1O0EKLTRMhYAIBRnCV3u+JJRt9cKlTV3
         IlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RRHIpLL5JKXeqD/g2RyUOG+CiEIyOXTKb06G3qE0ufA=;
        b=aKVpUU6cVa82VPSIm29l8feDRm1gr1vHpt+9ULdjzxOSsX6U8Jn2s5xNf44fGsWqIP
         27ANvWoUXD2zp05cYAyYbXS0DdLjb2jbpT0n8FvzXbJVQ33bF2MO9j/t9elseJZ2spUg
         lDqqQOaG3BgwYhATS/kho2THjn+BDXQ/k+0jrD/sZjuY0bnMiQyyygMhHPx852EYkBG+
         K7soAPZVqDbC4HLDHPtLiww5/PJIb81bbsKcJlVuAg0j516lk1gouPnmelgaYFKFgTNo
         n3mcm0FJ1vQ7S7vC6ThhxYoW2KWzYEhhRkK7BafLisPCZZqqSNEgz3/fqkryHDsKKvp5
         QeBg==
X-Gm-Message-State: AOAM530UJXwPTS4ua3epx0tI81jX/9feU2bnyMAWzPx/JQ9dacLzWPL/
        P3CI1kuA7fg9pcMPWz/uC0dz9Dwe5Xyv1WLBI7rYUg==
X-Google-Smtp-Source: ABdhPJyhmw1VzG2XqiqLSYOOhvDov7mXdPfbzgKvU6IngUw+WRhv0bD0qSqs6ZG3RCJazZBpF7/K8V4jk42uC4HlGRQ=
X-Received: by 2002:a05:6830:1d96:: with SMTP id y22mr2493422oti.243.1601660307469;
 Fri, 02 Oct 2020 10:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200907101937.10155-1-robert.marko@sartura.hr>
In-Reply-To: <20200907101937.10155-1-robert.marko@sartura.hr>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Fri, 2 Oct 2020 19:38:16 +0200
Message-ID: <CA+HBbNEf4pC+NUs4C-Q-boA11ARLKayZN497_M7MEAyq9+neLA@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: IPQ4019: add SDHCI VQMMC LDO node
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robh+dt@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 7, 2020 at 12:19 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> Since we now have driver for the SDHCI VQMMC LDO needed
> for I/0 voltage levels lets introduce the necessary node for it.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> ---
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index 6741a1972e55..7774dbd3cec7 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -211,6 +211,16 @@ tlmm: pinctrl@1000000 {
>                         interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               vqmmc: regulator@1948000 {
> +                       compatible = "qcom,vqmmc-ipq4019-regulator";
> +                       reg = <0x01948000 0x4>;
> +                       regulator-name = "vqmmc";
> +                       regulator-min-microvolt = <1500000>;
> +                       regulator-max-microvolt = <3000000>;
> +                       regulator-always-on;
> +                       status = "disabled";
> +               };
> +
>                 sdhci: sdhci@7824900 {
>                         compatible = "qcom,sdhci-msm-v4";
>                         reg = <0x7824900 0x11c>, <0x7824000 0x800>;
> --
> 2.26.2
>

Hi,
Is there an issue with the patch preventing the review?

Regards,
Robert
