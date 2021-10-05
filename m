Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386414227CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 15:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234801AbhJENam (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 09:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234103AbhJENal (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 09:30:41 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D868C06174E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 06:28:51 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id z11-20020a4ad1ab000000b0029f085f5f64so6399035oor.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 06:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/c/eEsD9A8CxATtvLzMZQW23g57As6UAdQJI9w6Phqg=;
        b=bg5XmOUO242fmOQv8vEUB0Cjo6mWlkROXJONC02dINX3+OI8ALc60dv0KtIbK2+c7p
         IHmpGY/1PO3CPlIsxo04yhI3jQj+N0QDEowHxbVtBnBqDkBXt7cFH8RYIw4XaFeSH+d9
         tK0bNVb2W9f1bvU8MyOogwyuOkkg0eVLc02r/dMNPE5ydZkWETleFwvfBb4y1QtfvmgK
         VF3WTyceJJmEaHQh9JC7D2mt4a6yFJMJQNPwEiBWCChxia9pgQCzKyDtvZpxKtpHzoeO
         pwWwl2b4silmLI8jp9Jz7Ny4w1GIKKO67tjMLexLI7O2XFc8ito9YIv6FGm6ZPpaTQ/p
         4MKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/c/eEsD9A8CxATtvLzMZQW23g57As6UAdQJI9w6Phqg=;
        b=rMiDCM0pCccjAHglyHUCuuOWRNvPqMkRwJSKw5nLSoTyNeLFXT8KlP/Nx+lErKLYL1
         mp/zaEd6mnbRQeZtscG+xN380RbQ5EZMC3eoVtgbfyFRuprokr/jwX6RxblnMQ0aODyZ
         rTlaiuUh+i4wpBtboF8M2yZZ37VO++k2CG6+ccAYvYFkYJqc3GbU2rx5t/UVZ2wngc4u
         AjQmyWB9sRUte6vtYb7Qz0ZIPu811cb3VKYd7KyUUHTrdQo16FNxg7o+4wZ8mRO6qmsG
         pnNnk+9lR+w0usbkPbeG4K93CBjwM59DHRBUcvA/naCuVr24DcMOrEM4xZjpJ+mxoxMN
         pMaw==
X-Gm-Message-State: AOAM531nBjUXoJaTJjwL/FEu6O0IOW5ut66nVDJTtMZhcLVemDLih+K1
        243hBBHlE0Dn2ipFjLfIr0gb2Q==
X-Google-Smtp-Source: ABdhPJz3CfmfGZl6xSv0Z4HSYsSEnz8bqO7Nzcc52AAmW4xAyZEI7fUz3MewVmDxzFH7LxRJa1xCYQ==
X-Received: by 2002:a4a:ac47:: with SMTP id q7mr13415845oon.90.1633440530656;
        Tue, 05 Oct 2021 06:28:50 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id c12sm3498484oos.16.2021.10.05.06.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Oct 2021 06:28:50 -0700 (PDT)
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sdm845: Disable Adreno, modem and
 Venus by default
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211002001358.45920-1-konrad.dybcio@somainline.org>
 <20211002001358.45920-3-konrad.dybcio@somainline.org>
 <67e12e31-2eb3-fea6-822e-56836aabc0d2@kali.org>
 <255059cf-b91c-1d29-0474-6b4b8fcef141@somainline.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <afcde09c-c930-ca6c-9ccc-7888d86a150a@kali.org>
Date:   Tue, 5 Oct 2021 08:28:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <255059cf-b91c-1d29-0474-6b4b8fcef141@somainline.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/2/21 5:51 PM, Konrad Dybcio wrote:
> On 03.10.2021 00:25, Steev Klimaszewski wrote:
>> This missed the Lenovo Yoga C630 inherits from sdm845 and breaks it.
> Welp, qcom decided to give laptops +5 sdm points and that made me overlook it :P
>
>
> If the rest of the patch looks good, could you add this diff Bjorn to fix that?:
>
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index a3b61cb3cfad..b96ecf537ff1 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -343,7 +343,12 @@ &gcc {
>                            <GCC_LPASS_SWAY_CLK>;
>  };
>  
> +&gmu {
> +       status = "okay";
> +};
> +
>  &gpu {
> +       status = "okay";
>         zap-shader {
>                 memory-region = <&gpu_mem>;
>                 firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn";
> @@ -461,6 +466,7 @@ &mdss {
>  };
>  
>  &mss_pil {
> +       status = "okay";
>         firmware-name = "qcom/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/LENOVO/81JL/qcdsp2850.mbn";
>  };
>  
> @@ -722,6 +728,10 @@ &usb_2_qmpphy {
>         vdda-pll-supply = <&vdda_usb2_ss_core>;
>  };
>  
> +&venus {
> +       status = "okay";
> +};
> +
>  &wcd9340{
>         pinctrl-0 = <&wcd_intr_default>;
>         pinctrl-names = "default";
>
>
> Konrad
>
With the above applied, all is well on the Lenovo Yoga C630.

Tested-By: Steev Klimaszewski <steev@kali.org>

