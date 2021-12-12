Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D13471B6B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Dec 2021 16:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhLLPmb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Dec 2021 10:42:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhLLPma (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Dec 2021 10:42:30 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CC0C061714
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Dec 2021 07:42:30 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id u1so23031973wru.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Dec 2021 07:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Lujfg+VE7ePok80jVD7tcx9WEL0c+LbcmxkJot0elWs=;
        b=1JwTEOVZCNOU949xE9JHpGSvLn3XnhVJ3FLO7/3aha3x6t8oTxhK/TdjFNRJrEh5wi
         vwNMnjZ2um0kW5tNWt2h0FEi6T7SwJQMPrRnJoxdOji7rYpTh3LRwHibNJBJ5TxJqiRi
         BRzJqlO4DLWTWFQB+L4CC/ltaUhB5JPneJhlA5GmhbWGBL+kclO/1pBqsz/Z8KueGU6U
         M7vYgDoQ/XyvIi9nOjjwpTc/Jqwf8AruIwp8hx615htEUAYXFGKDuEtVqLPUhUZYPeyC
         YudycfqktT2sfpJgMsoPUNAQnz3xCKuqeepxpvtfzrmsfwo4so+zmZN2tKDxx0dBPXgu
         sMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Lujfg+VE7ePok80jVD7tcx9WEL0c+LbcmxkJot0elWs=;
        b=QEk5TLCjK+QBMg5FqjyCg5yYm56vEZjbnxmeD2l+Li/zKxjsTwgfV76fA1901q11ER
         WVfM8TyT5+6gI049T8LY+ivmmN2bz1qsZuukzOdYjUjDGZdeVnt+xA1DQgA1l4aRK0RX
         /t045WpeGlrfhB+bRhg1Pi/JuV6ZEw5QrmeSC8qWpJG9PSCUvG1CsaaGuWaLq/X4hBQv
         WSsMLS2FmsAgMoWICNxXh5DTcpQIpVYgBUfo+4nzI0GUjWiB1yKphMZbfnZP44G8IJ1J
         IExZcfK7RwEDXcuUqSVFyrxVFzB8au6WRAYwdgz4llrtdo0gcjJSWMS+79p7SkFwICgO
         HUrA==
X-Gm-Message-State: AOAM532Sa2/oGet2Z2izqsti0t6bYeuuKcgW7tKdXVgyf65wR3eDHhXE
        dFyX+BpLXTlRCWV9fl0JpiadOQ==
X-Google-Smtp-Source: ABdhPJxPgOn9Jf3ZC7b+JyQj+heW8Lu5oDkJAUYZE6ipH5Vvd/b3MpWg9938H1WFZBhlXsHICgmWJQ==
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr26431744wrs.207.1639323748729;
        Sun, 12 Dec 2021 07:42:28 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o9sm7918073wrs.4.2021.12.12.07.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 07:42:28 -0800 (PST)
Message-ID: <18f25dbf-3a8b-cda3-afad-abf7a7f42d8e@nexus-software.ie>
Date:   Sun, 12 Dec 2021 15:44:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] arm64: dts: qcom: ipq6018: Fix gpio-ranges property
Content-Language: en-US
To:     Baruch Siach <baruch@tkos.co.il>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Sricharan R <sricharan@codeaurora.org>
References: <8a744cfd96aff5754bfdcf7298d208ddca5b319a.1638862030.git.baruch@tkos.co.il>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <8a744cfd96aff5754bfdcf7298d208ddca5b319a.1638862030.git.baruch@tkos.co.il>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/12/2021 07:27, Baruch Siach wrote:
> There must be three parameters in gpio-ranges property. Fixes this not
> very helpful error message:
> 
>    OF: /soc/pinctrl@1000000: (null) = 3 found 3
> 
> Fixes: 1e8277854b49 ("arm64: dts: Add ipq6018 SoC and CP01 board support")
> Cc: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> 
> The error message was improved in commit af3be70a321 ("of: Improve
> of_phandle_iterator_next() error message"), but there is evidently some
> more room for improvement. As I don't really understand the code, I
> added the commit author and the DT list to Cc.
> ---
>   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 6a22bb5f42f4..a717fc17523d 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -220,7 +220,7 @@ tlmm: pinctrl@1000000 {
>   			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>   			gpio-controller;
>   			#gpio-cells = <2>;
> -			gpio-ranges = <&tlmm 0 80>;
> +			gpio-ranges = <&tlmm 0 0 80>;
>   			interrupt-controller;
>   			#interrupt-cells = <2>;
>   
> 
Works for me

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
