Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70690500769
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 09:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238592AbiDNHqH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 03:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240829AbiDNHp7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 03:45:59 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6E55EBEC
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 00:41:41 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id bn33so4978467ljb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 00:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tTicuqi+crlbiDa0+dPNlHvr6bdpjS4CywgqkLHMy6Q=;
        b=nS8Fz/JYk9rXaQLofLGBu++Y5GXD58mwqI4IcrdNUdhICZ1a1Qk7LJ+HBhj0uy3GuY
         HzgPjG6Y7fxn3mFzYECHUoZxIRFH5XSBwI8eicml4zoAGDmkxw2GzRlCFpcCfDO8jkXE
         CZ5P6uO5S+AGFPEXAJufCK8uAEwBYHJ8lR9O/1L74Fg71X2ZebYNYSUgmdeBNykJKP61
         GeYGx4L+OvN0SMk1CCrgureq7wYfI+QI6QnumDj8DW1h88Mqokze1P9GBsuulHNFUDif
         OLePMutmqkfFJ2bh1RSWn9EGzWBcTXH4vEOluQXqUxIzYPPjaGOJo4WQNAXXsM8uwgEl
         2dYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tTicuqi+crlbiDa0+dPNlHvr6bdpjS4CywgqkLHMy6Q=;
        b=ekwv/rYBn46xLIbE1mqbaFrJwrocgs8pTQtOoZ/uKyqAiAH+YuxBTUnVzNF4Q7Yy/N
         UDxSI61g7cHPxVHDYpaRuQgji7+AJpp4wX9j7iNR+Fzgpdi6Zez3/AysTciLSiP/j8Af
         Z9h7giOgEHmqJ1+sua8dtyUzF/mCVmixLD2KrtNUMg207OehPocQGhSn2b5+Zf23I5MO
         RegGq7Xlut5aaKxFW+gGeQFqR2VA+RY7mfraDMpxhoMLk02EFxlVi8R9L8Jp6xSwMYP3
         9a6vPkRXZv2EOm3eyUKZJjWCnxKW9k9swsRUF0zuOZhcqxranPKmhCYlrXMOkSebxKeU
         D81Q==
X-Gm-Message-State: AOAM531y1lmUenQhv+uQYKP0GCcgVskTRYgAl5dGFoHF8mNn4jpKMZAV
        5Cp6Zz0zaJVsT2F59faK0EOFWw==
X-Google-Smtp-Source: ABdhPJygwGtzxX7j/r6knGkBXy29wY5o7YTjU8DbJDefKV4sIm7bYOgx0X0gfKSJv+Wv1atNeFxoXw==
X-Received: by 2002:a05:651c:994:b0:24a:fc47:d6ca with SMTP id b20-20020a05651c099400b0024afc47d6camr876809ljq.297.1649922099742;
        Thu, 14 Apr 2022 00:41:39 -0700 (PDT)
Received: from [192.168.1.102] (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25d27000000b00450abeb4267sm151889lfb.140.2022.04.14.00.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 00:41:39 -0700 (PDT)
Message-ID: <358215a0-6f00-7594-bd4e-8f4e8be93473@linaro.org>
Date:   Thu, 14 Apr 2022 10:41:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sm8250: Add camcc DT node
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, jonathan@marek.ca, hfink@snap.com,
        jgrahsl@snap.com
References: <20220413231736.991368-1-bryan.odonoghue@linaro.org>
 <20220413231736.991368-2-bryan.odonoghue@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220413231736.991368-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bryan,

On 4/14/22 02:17, Bryan O'Donoghue wrote:
> Add the camcc DT node for the Camera Clock Controller on sm8250.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index af8f22636436..906bc8ed25b7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -19,6 +19,7 @@
>   #include <dt-bindings/sound/qcom,q6afe.h>
>   #include <dt-bindings/thermal/thermal.h>
>   #include <dt-bindings/clock/qcom,videocc-sm8250.h>
> +#include <dt-bindings/clock/qcom,camcc-sm8250.h>

please swap the two last lines to get a bit better alphanumeric order, it
might be a good idea to sort out all the include directives.

>   / {
>   	interrupt-parent = <&intc>;
> @@ -3149,6 +3150,20 @@ videocc: clock-controller@abf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		camcc: clock-controller@ad00000 {
> +			compatible = "qcom,sm8250-camcc";
> +			reg = <0 0x0ad00000 0 0x10000>;
> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,

I believe it should be GCC_CAMERA_AHB_CLK.

> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>;
> +			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao";

I see that the driver references to "sleep_clk", which won't be found
automatically, since it's name is "sleep-clk", so, it might be reasonable
to add it to the list.

> +			power-domains = <&rpmhpd SM8250_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		mdss: mdss@ae00000 {
>   			compatible = "qcom,sm8250-mdss";
>   			reg = <0 0x0ae00000 0 0x1000>;

--
Best wishes,
Vladimir
