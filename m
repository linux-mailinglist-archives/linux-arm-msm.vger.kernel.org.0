Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1925509FE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jun 2022 13:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235969AbiFSLHL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jun 2022 07:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235844AbiFSLHK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jun 2022 07:07:10 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CCFC11145
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 04:07:08 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id o7so16189212eja.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 04:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xX5Jl85d6fm6St1KgeedQuFWE7YII3rFg8ivajgwzyo=;
        b=REsGotrCyMXduVj3cv1WW//tvGE+ud6K6wWpcoc9gRkj1MBPQx4t4zWtC1WDEC5SbG
         z2w85ONgv7xWsAUNrU4gNQeb1bZe++XoCajfxIJQuWPmVbUYw0BtOeG1825xpWUab1Ns
         khW81YCKi8emcTojtt7XRH8NzbJvgG+fjXP+kU6HkvrBIs18assnCU3iNf97BSef3byh
         HqiLpxZU/y20K9i+YDQQu0Ju6PanaoaE0+zIgJkaLSxBQp/099e14ckhEeLOpaZtMY71
         KGtf4Ei6Flj0LCYDMW8R7DyOD5OuO14HiS8Tjed+XX3+PlhcPFh1kSfWMESLQbQpXCqM
         NPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xX5Jl85d6fm6St1KgeedQuFWE7YII3rFg8ivajgwzyo=;
        b=EIftFPkRRb+AX9ViNCFXnW9x4b+P9N9C6MMZ3NA9h4hoqE1E+x4SeLH+6CqOF9IuAF
         2to/dWzUy7wz81RlvQ6MF+m2EBGCZduvUUWlACWeYcKM3vIzIYjXI7XS9JH0FsOCkQnB
         QFykRvtJe6RJECA5phNNBZ+y6hoibBygVdTNTF+Q77IgYVec1JNhtKiLuh8LuYyvvC7E
         UTkXYyfj5mKV/1HC/wHMBoN8hEAsdLiWcNywOV2lxDum2n0nEJOiteP6z7WFI2sICDR4
         PQauHFhfJjFWsDfZkVaQVcxRYIzDFL7ZWbYS2k+0ivU301v2+AsUcJwv/RrqK1QTNMjT
         WP8A==
X-Gm-Message-State: AJIora+YqLj6bVhtKyTsuGpKN8+IPtcOHuyPJPujUK/CsPyBGYxNqIe/
        UKi39mvv2u7hEGz6z2YyX2x9yg==
X-Google-Smtp-Source: AGRyM1tgIbrxUBhP/G2hz/HDBzXgwLyOT0RpgmYL7Xw3f5Jw4IWh8N4JeIpMvRzXUGsSWbn0Q4O6RQ==
X-Received: by 2002:a17:906:6a09:b0:71c:3bc5:4d3 with SMTP id qw9-20020a1709066a0900b0071c3bc504d3mr13692832ejc.57.1655636826898;
        Sun, 19 Jun 2022 04:07:06 -0700 (PDT)
Received: from [192.168.0.206] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id fq36-20020a1709069da400b006fecef65fc4sm4501369ejc.179.2022.06.19.04.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 04:07:06 -0700 (PDT)
Message-ID: <9a79e689-4290-fd49-6e18-22b306d36bff@linaro.org>
Date:   Sun, 19 Jun 2022 13:07:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] arm64: dts: qcom: sagit: add initial device tree for
 sagit
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220617122007.2307726-1-dsankouski@gmail.com>
 <18956e06-8f9d-fcf0-0e2b-41702ea9b95b@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <18956e06-8f9d-fcf0-0e2b-41702ea9b95b@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/06/2022 01:49, Konrad Dybcio wrote:
>> +&ufshc {
>> +	status = "okay";
>> +
>> +	vcc-supply = <&vreg_l20a_2p95>;
>> +	vccq-supply = <&vreg_l26a_1p2>;
>> +	vccq2-supply = <&vreg_s4a_1p8>;
>> +	vcc-max-microamp = <750000>;
>> +	vccq-max-microamp = <560000>;
>> +	vccq2-max-microamp = <750000>;
>> +};
>> +
>> +&ufsphy {
>> +	status = "okay";
>> +
>> +	vdda-phy-supply = <&vreg_l1a_0p875>;
>> +	vdda-pll-supply = <&vreg_l2a_1p2>;
>> +	vddp-ref-clk-supply = <&vreg_l26a_1p2>;
>> +	vdda-phy-max-microamp = <51400>;
>> +	vdda-pll-max-microamp = <14600>;
>> +	vddp-ref-clk-max-microamp = <100>;
>> +	vddp-ref-clk-always-on;
> Please drop properties that are not supported on mainline.

Which brings the other point - please run `make dtbs_check` (you might
get a lot of output) and be sure there are no errors from your boards
comparing to other similar DTS.

The easiest is to:
1. make dtbs_check, go for coffee
2. touch your boards (from both of your commits) and few others
3. run again make dtbs_check and compare

Best regards,
Krzysztof
