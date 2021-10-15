Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8BC42E9BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 09:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235898AbhJOHOK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 03:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235895AbhJOHOK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 03:14:10 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFD3C061753
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 00:12:04 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id g2so1645134wme.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 00:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IzYgq+z20hgwILm2p4l/2rgHn4rRXdLiFXw3mcnpODQ=;
        b=F7zeI77HxLebM0OPMBq6NZ97maLjYDrwOEVWHeB5kwwJeGsg/WsHAaCLv6D1gM+RyD
         WUTh2vhqAEes0G2CVpE/vrwy4TkCGlrHHfvgPj5VESEhFDg4NVATGrIam5cHybynvHaM
         YJU7PN6O6YbQk/Fu7D/sEeAQ2Pfgif+oO7qsFjt/9drJXIhL8IRyMbFXou0WO0lO/G5C
         Ae4fyeXX8RDWK4HRWakXyawWZFkyGABwRcuXoMco/C6UPkbDvbkDnjz60K1WiObv7q8b
         UL5QWgAeiNQm8KXlFbZ+YalsTUZ+LoGkuXpJ8RICK2zK1mYk1RD8hcNj6ao8sgmNGg3U
         Qlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IzYgq+z20hgwILm2p4l/2rgHn4rRXdLiFXw3mcnpODQ=;
        b=EO2x7+4qTwwDdbQK/bfByuEcEYh5KYmxUnBfetoctjFUVJuZ24mg7YWBdRJ/pKvJvI
         UmWd4ZGPeT+tkRYlw80sf7SxB/c/XEhNBybrK4yL2++n7a//WmXI9ZHpQkVaua3H3i0w
         XsyrlCnVXm0AIR+9cDdSe6BDZOHgmveez4opGY84uZd6uZ36JXT9HDLzBcRSCrL25jL1
         aCSRXysAlVVon9yOiX5mm190lpkglo5pkYBmRMEZYPff5QP8GZuKyEXvJpMBtl7M6K27
         dJ5HaWCUGQnb//hc3GLujMX3p/JueZaXUwJDCtAymud1e/XKq4P6agnKz7nOxcCpcmyj
         aXyw==
X-Gm-Message-State: AOAM530BhnOHUXmCDKLUDvsfJ4TAJz/Hm6TJ/qGqFJPP6lwyj6RytKCX
        ayALwJq/ekPk8BAE+s0yXfhNlw==
X-Google-Smtp-Source: ABdhPJxK3uo8JrIoKA/rDT0p9uBdZt4h8LAooLr15qDifh2ZkIN3d6fRJbbw3J7Nzz2zH2zqUufVUg==
X-Received: by 2002:a05:600c:22c6:: with SMTP id 6mr25145329wmg.106.1634281922460;
        Fri, 15 Oct 2021 00:12:02 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:c62a:318d:9792:450f? ([2a01:e34:ed2f:f020:c62a:318d:9792:450f])
        by smtp.googlemail.com with ESMTPSA id k17sm4049669wrc.93.2021.10.15.00.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 00:12:01 -0700 (PDT)
Subject: Re: [PATCH v3 0/4] arm64: dts: qcom: sdm845: Add thermal zones for
 PM8998 ADC
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amitk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211005032531.2251928-1-bjorn.andersson@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <cc0398ea-cd44-8580-c606-d0716ad9412c@linaro.org>
Date:   Fri, 15 Oct 2021 09:12:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005032531.2251928-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi,

I will pick patches 1 et 2

Thanks

  -- Daniel


On 05/10/2021 05:25, Bjorn Andersson wrote:
> Describe ADC channels, related thermal monitor channels and add thermal
> zones for these.
> 
> Bjorn Andersson (4):
>   dt-bindings: thermal: qcom: add HC variant of adc-thermal monitor
>     bindings
>   thermal/drivers/qcom/spmi-adc-tm5: Add support for HC variant
>   arm64: dts: qcom: pm8998: Add ADC Thermal Monitor node
>   arm64: dts: qcom: sdm845: mtp: Add vadc channels and thermal zones
> 
>  .../bindings/thermal/qcom-spmi-adc-tm-hc.yaml | 149 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pm8998.dtsi          |  10 ++
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts       | 140 ++++++++++++++++
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c      |  41 ++++-
>  4 files changed, 339 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
