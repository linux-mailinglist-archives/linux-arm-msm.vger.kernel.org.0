Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E085476619
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 23:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbhLOWov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 17:44:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbhLOWov (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 17:44:51 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E4CC061574;
        Wed, 15 Dec 2021 14:44:51 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id u17so17793726plg.9;
        Wed, 15 Dec 2021 14:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q4UzIW8jjvFD9MXINw3scaTFcXx6xR/65YR9cdnFtJo=;
        b=GRvMIyxPRNtzcsDe+NtBBO75NgVay7h53HFPf4w2DZlAi3j7BLj0C70kazfWyuEnvc
         EoaCcARXjgg5shU0sINC0XHVzUYI0vb1o2Y2NLPhftGaVJ5CZ5wgMRBejV/weSMiWoSE
         t9wede+K3DTlqIk8wWGoxqRZx2Iuc10WuVivY8wUcHKnjQc5QDzlIu+Qb/Gr2T9ZRoV7
         jjaYxvovtV5ZRZueO2jqKLsPWxTfGc08s9241YCRRI+0VonkuzovIJV1dlwL8xJlxdSK
         OAlrbJeowkCY7Nn6N3TPkoicsxGnFTt3+khhBFSX0YVw3qfLIrX9oM4njvPI/wGMRZYq
         EDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q4UzIW8jjvFD9MXINw3scaTFcXx6xR/65YR9cdnFtJo=;
        b=RilOngv2RKE/yeMiHLK44WqYT/oe7kp8mSEjxBH0xmfVH8vtLzinMnsCxxXtsMNkeU
         c5HR+z/4G5RnK2r6a+rUezzxCjTxm9wDkKTwskJwss3hZEoOZVXQm8r5CLD2+icv8TLg
         qz0dtPkFfJuMoKHMdDI017FX4S0F068sKQ8HUfgAh49pAGMyP+HVDPv9PVqnFS05iXnv
         QafhsBFQruD0gCKvT0UCvay9mC59aNMjj0AX7E/FlBXF0JMaQAcCLYfjxAb28Xv69vLI
         yLi1i5OafMZzJpUTd+zavfpE3R9RrxTG5sXappl1ylzxLp2Q1jRC1bnG8qeMlfXnDnOo
         zl7A==
X-Gm-Message-State: AOAM531uXNdkXEYmYJg8O0yS2gJJsZ5bsdE/34lUXCQYaQdhpGgjT0QS
        IssMXFneJuh4vKn56/62fO0=
X-Google-Smtp-Source: ABdhPJyRVECjLwh6/a45lJzjdGytwuXKsisg0bwzAmdfjZcJlw9+DYfpVIVT8BpO3Rci6hyEqq1aSA==
X-Received: by 2002:a17:902:6b8c:b0:148:8a86:a01c with SMTP id p12-20020a1709026b8c00b001488a86a01cmr13270930plk.50.1639608290506;
        Wed, 15 Dec 2021 14:44:50 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id l2sm3797362pfc.42.2021.12.15.14.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 14:44:49 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: qcom: ipq6018: Fix gpio-ranges property
To:     Baruch Siach <baruch@tkos.co.il>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Sricharan R <sricharan@codeaurora.org>
References: <8a744cfd96aff5754bfdcf7298d208ddca5b319a.1638862030.git.baruch@tkos.co.il>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <281f0532-2f3b-362a-5df6-d9cbe302606a@gmail.com>
Date:   Wed, 15 Dec 2021 14:44:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8a744cfd96aff5754bfdcf7298d208ddca5b319a.1638862030.git.baruch@tkos.co.il>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/6/21 11:27 PM, Baruch Siach wrote:
> There must be three parameters in gpio-ranges property. Fixes this not
> very helpful error message:
> 
>   OF: /soc/pinctrl@1000000: (null) = 3 found 3
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

In the commit message you find what the error message was and then
became which tells you which property was used to determine the cell
size, and what count was obtained instead.

In your particular case here however, since the proper was with the
'gpio-ranges' property and there is no property that indicates the cell
size AFAICT, it might been more helpful to revert back to the old
message maybe? So maybe something like which is hopefully the best of
both worlds:

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 372a177f3b80..63bff37bf035 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1378,9 +1378,13 @@ int of_phandle_iterator_next(struct
of_phandle_iterator *it)
                 * property data length
                 */
                if (it->cur + count > it->list_end) {
-                       pr_err("%pOF: %s = %d found %d\n",
-                              it->parent, it->cells_name,
-                              count, it->cell_count);
+                       if (it->cells_name)
+                               pr_err("%pOF: %s = %d found %d\n",
+                                       it->parent, it->cells_name,
+                                       count, it->cell_count);
+                       else
+                               pr_err("%pOF: arguments longer than
property\n",
+                                      it->parent);
                        goto err;
                }
        }


> ---
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 6a22bb5f42f4..a717fc17523d 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -220,7 +220,7 @@ tlmm: pinctrl@1000000 {
>  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
>  			#gpio-cells = <2>;
> -			gpio-ranges = <&tlmm 0 80>;
> +			gpio-ranges = <&tlmm 0 0 80>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  
> 


-- 
Florian
