Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 136C873E57C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 18:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbjFZQny (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 12:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjFZQnx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 12:43:53 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475EAE53
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 09:43:51 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f973035d60so4375166e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 09:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687797829; x=1690389829;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S4+6ENFQ8YL76Bgs3hZByPsBVdXOLkkUKyglIdwW3YU=;
        b=P4Ol8kh/84DztMI8MF3KdnZR6E8Nefk+Q1WKdU3ZUz0k+xFmN5fJ7T8HWjN2lYXgFn
         wgo85jPaN3Cf7f7SJpk5tbqhPNh6+57IQ1rgjgGDRZG3PKKpbOgBJEDzNjurwRlh2IVT
         I9dLvQPPhvKrca6+S6w/ANr/foZIqNKwNXaDbk+TWUcmDdxENZyuQt6Hkif6EmTNNyev
         k1Pl0rBfzwl5/gPnAzqINQb3POTqMfngp1nGeLBCzwjgxlwHSgUH7M7anqqscfIFXtsO
         00w0z5rPsSCzECVHu7eXSN+jh0e43RMWSDZT9BziDHOhogWE1aaU+632eMjzAJuzl33O
         gsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687797829; x=1690389829;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S4+6ENFQ8YL76Bgs3hZByPsBVdXOLkkUKyglIdwW3YU=;
        b=Z/ESRWhvoWNwMSOeZUK6vzZtxETM6TpWPuHWNak9n+hnTPj6toAVqmKPcZzbdNaUPg
         xG6xq143W3ELBywnlvSmAKtVlnhTePADHLAwhzCFs9NF3hGgNtI5U9hJGiOY5OcpMEv1
         3Oan1FB1kv79Rr1j0XPnNlTjzo3bS19wVV9vTK7ybTIXXlL6i86QNWHkapDWWiH+UF2j
         T+kqT71z5viEkGSbbx19KDZ5OmBXQGfJzG8iAdHnbd3gQmSgbj1c1Cp2lJjCgmPOg4f6
         FR+G+YTWbkoF19FWtsTeOFhvUtNdg96afzHweTDR4vfDUN3O01hfQ26KjtYIWlaj+svy
         vMKw==
X-Gm-Message-State: AC+VfDwBHulZ61zqqa/Lz+eZJW0YRz8GYl4DEa2qdDdS1tEx8lI05o7n
        rjSvMFKk/wIYDDckXPYKrB2D3A==
X-Google-Smtp-Source: ACHHUZ6Nhqo3EwNdTHTLVrrQ3l8y16/cfJmlaTRJeHMBeF/u+5iNaZDMrfJSXdJb6IZVF+m3w1TjmA==
X-Received: by 2002:a19:670f:0:b0:4f8:7513:8cac with SMTP id b15-20020a19670f000000b004f875138cacmr12525009lfc.48.1687797829523;
        Mon, 26 Jun 2023 09:43:49 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id 20-20020ac24854000000b004f86c76258esm1177832lfy.206.2023.06.26.09.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 09:43:49 -0700 (PDT)
Message-ID: <28343db8-a4fe-f967-ee43-6bd89c4c52de@linaro.org>
Date:   Mon, 26 Jun 2023 18:43:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 19/26] ARM: dts: qcom: apq8064: enable passive CPU
 cooling
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
 <20230625202547.174647-20-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230625202547.174647-20-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25.06.2023 22:25, Dmitry Baryshkov wrote:
> Wire up CPUs and thermal trip points to save the SoC from overheating by
> lowering the CPU frequency.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 29 ++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index b97d88517805..f38e3394b422 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/soc/qcom,krait-l2-cache.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/thermal/thermal.h>
>  / {
>  	#address-cells = <1>;
>  	#size-cells = <1>;
> @@ -701,6 +702,13 @@ cpu_crit0: trip1 {
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_alert0>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu1-thermal {
> @@ -722,6 +730,13 @@ cpu_crit1: trip1 {
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_alert1>;
> +					cooling-device = <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu2-thermal {
> @@ -743,6 +758,13 @@ cpu_crit2: trip1 {
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_alert2>;
> +					cooling-device = <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu3-thermal {
> @@ -764,6 +786,13 @@ cpu_crit3: trip1 {
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_alert3>;
> +					cooling-device = <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  	};
>  
