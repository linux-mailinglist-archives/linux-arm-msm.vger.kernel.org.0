Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED8A5FFA24
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Oct 2022 15:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiJONGR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Oct 2022 09:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiJONGQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Oct 2022 09:06:16 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D03840E2E
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 06:06:14 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id z8so5301033qtv.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 06:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TBNDWb/PUcfIBjVY7nryISHx24x9THNIcQMhnCQu8a0=;
        b=psYq027JfEzzbK4E60x4LX4q7Vhlj2I1XUKQAilBWc+ExEOX+Zwp5+IksHLho0owp3
         mb+leoQnlfmj+GZuwy6Ju444R43BH2cCaiwPHJJ7ddBvMxkCbSFEM4KMHuVygaVBVzGw
         FFPdK72zr8DgmsR0B99ka8AItcsp9GI7/Qlcjh0hRPgWDDkyWn9as7+SneS2ZdIrnCMZ
         SeLe1/k3r55lkFwSZNFjQrWhDZCGy2ptjn+AgfcGgmaCCSZ3ERNdVLvNEBt0HFSANG1u
         AwqZABH/VnA9Q4WBKXfsWqQTwwntiIQRZcOBVgcb6uT3zE59w5qNU+Rirg5xDdXpk8dW
         a3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBNDWb/PUcfIBjVY7nryISHx24x9THNIcQMhnCQu8a0=;
        b=LQmroql9OshwDivNk+n6zTI/1IrQyuEXUF20T/263XhO1M7aGI/t5IayXGumDwI0YL
         tMwTi7xekbryi2ghnmlyYTblUTvMuxV/kgJpJAT3Gkl+XAIfx4ParU2rmcvo6MQBvlCL
         lWRcodcdpUNxpwYc7w7n3FKTphn9kQorGulHoGyWpyYsS2lZZ/C28Zb7p/9sqoqlB4W/
         cvAyfVWRDoXz5Xfckwmw2A+89mSe8bZj3F0pJZz2wNaD5UiF3879kchYo7JKWr0miBvM
         Ipub9JIF8WrWAYJlMTW45a/XB01yo6PZPZpJZRA5HuVrb01K5jwpEpw28bazD/qS5qJW
         I2FA==
X-Gm-Message-State: ACrzQf0hVxHRry1jve9UGzaSidX+JeIz0tJMhU4ofrdaU0+HCTqXeNKp
        Y0k8+R4RPjVbpi5l+iimGvJIvw==
X-Google-Smtp-Source: AMsMyM68XCtlhc18qhR76sv5R8jMSEOf9gyOaszHbt0cP995dakcvcmIUwSNr07yseUpSAV9CGhYtQ==
X-Received: by 2002:ac8:4d4a:0:b0:39c:d99c:dbce with SMTP id x10-20020ac84d4a000000b0039cd99cdbcemr1774966qtv.511.1665839173409;
        Sat, 15 Oct 2022 06:06:13 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:161:5720:79e9:9739? ([2601:42:0:3450:161:5720:79e9:9739])
        by smtp.gmail.com with ESMTPSA id fe13-20020a05622a4d4d00b003994bbe91bdsm3897889qtb.60.2022.10.15.06.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 06:06:12 -0700 (PDT)
Message-ID: <c8f33e83-1329-e549-d739-24b33f8633ba@linaro.org>
Date:   Sat, 15 Oct 2022 09:06:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] dt-bindings: clock: Convert qcom,lcc to DT schema
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221015090946.448820-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221015090946.448820-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/10/2022 05:09, Luca Weiss wrote:
> Convert the text bindings for the lcc to yaml format. Doing this showed
> that clocks and clock-names were not documented, so fix that now.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  .../devicetree/bindings/clock/qcom,lcc.txt    | 22 -----
>  .../devicetree/bindings/clock/qcom,lcc.yaml   | 88 +++++++++++++++++++
>  2 files changed, 88 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,lcc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,lcc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,lcc.txt b/Documentation/devicetree/bindings/clock/qcom,lcc.txt
> deleted file mode 100644
> index a3c78aa88038..000000000000
> --- a/Documentation/devicetree/bindings/clock/qcom,lcc.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Qualcomm LPASS Clock & Reset Controller Binding
> -------------------------------------------------
> -
> -Required properties :
> -- compatible : shall contain only one of the following:
> -
> -			"qcom,lcc-msm8960"
> -			"qcom,lcc-apq8064"
> -			"qcom,lcc-ipq8064"
> -			"qcom,lcc-mdm9615"
> -
> -- reg : shall contain base register location and length
> -- #clock-cells : shall contain 1
> -- #reset-cells : shall contain 1
> -
> -Example:
> -	clock-controller@28000000 {
> -		compatible = "qcom,lcc-ipq8064";
> -		reg = <0x28000000 0x1000>;
> -		#clock-cells = <1>;
> -		#reset-cells = <1>;
> -	};
> diff --git a/Documentation/devicetree/bindings/clock/qcom,lcc.yaml b/Documentation/devicetree/bindings/clock/qcom,lcc.yaml
> new file mode 100644
> index 000000000000..03c99435d342
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,lcc.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,lcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm LPASS Clock & Reset Controller Binding

Drop "Binding"

> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,lcc-apq8064
> +      - qcom,lcc-ipq8064
> +      - qcom,lcc-mdm9615
> +      - qcom,lcc-msm8960
> +
> +  clocks:
> +    minItems: 8

Drop minItems

> +    maxItems: 8
> +
> +  clock-names:
> +    minItems: 8

Drop minItems

Best regards,
Krzysztof

