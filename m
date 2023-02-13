Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24B60694458
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 12:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbjBMLYR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 06:24:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbjBMLYQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 06:24:16 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1713483CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 03:24:15 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id z13so8462465wmp.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 03:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+rvGSkMi2Ng+V+zK96Pn4bjPDP4wSlwRKDICoOknY0=;
        b=EHAV7oVomODni8aKSUTkGu5X3fuYV/FzpgT5Vt1NZ5LC3vyUPHpceFrDugGwRcK/bV
         m+St/bvUqjsnxczh+x0oJ5XXLI8pryf1EtgO0vxTlfYnkrOW104tXb9Ulofnt2QrpQjG
         0fUHH8sMgP7wEd+s1H1p4HQumfP0uDH7r3KZ0HlOtWgoib5jswzy895IFpr5dbHxHeeG
         PnwB6Tn6LLTzXHEzfVoImPUoi+yaz3IMPrsciJ4AplUZdrQno3NXzORqtiX18OkzlWDk
         Z4d1kb60tfQNoAbWIKwgWf4xN4dOMXJR2yX+GUNud1BhHT/VFZGfcO0oPALWLYRqWIaI
         p6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+rvGSkMi2Ng+V+zK96Pn4bjPDP4wSlwRKDICoOknY0=;
        b=srzUC+OKetPxPnQYm294X1Ohzu7+a2bZkf8+h3YzAVcVo12mN2Qw61XZvB2fsc7LBP
         hblN5pq2lITjIK9opZZvhz7vPpW+TjYi0e+03YhoyOLAtA62pRncbFcdNgQm7fNl4llu
         jtjpllBdw0zz0Ta8HtnbtNc+eBFyJgux4YLIUPe8fHRtcxH8sY97AcMWn3dZKAhGedxo
         ilMhNLKtPQ6jbJoVJA32fzECuxEhks4maYpKHownP5triWdAb5ZR7kuu1oOY8nRskQlY
         0O9m2N+kLq1IinAlBj09tg8pDJO3maL4xZT3uvednb1ZregvnrXM5cOgm8YyONeZuRma
         hFaw==
X-Gm-Message-State: AO0yUKUU7f8ouTv905RsZ+uG2mWmw+w3LVUg6WUo6twP/BdUsshaHk+H
        Cn85sdGa5PMc0wlPqJSNwLJYmg==
X-Google-Smtp-Source: AK7set/+Q2Fq63xoPo4GT4dkWdY906MVgtXJgA6lf/hRlrTtv1waCbPwVDDra752x+ps5XyvQyd+Jw==
X-Received: by 2002:a1c:f016:0:b0:3df:e468:17dc with SMTP id a22-20020a1cf016000000b003dfe46817dcmr18941579wmb.40.1676287453680;
        Mon, 13 Feb 2023 03:24:13 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x2-20020a1c7c02000000b003df30c94850sm16623154wmc.25.2023.02.13.03.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 03:24:13 -0800 (PST)
Message-ID: <d4d7eb38-9b2a-fa41-0041-dc88d5b6f89b@linaro.org>
Date:   Mon, 13 Feb 2023 12:24:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550-qrd: add QRD8550
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230210163844.765074-1-krzysztof.kozlowski@linaro.org>
 <20230210163844.765074-2-krzysztof.kozlowski@linaro.org>
 <69bbabd1-2248-000d-f0ac-ba9bb4b14665@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <69bbabd1-2248-000d-f0ac-ba9bb4b14665@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/02/2023 12:14, Konrad Dybcio wrote:
> 
> 
> On 10.02.2023 17:38, Krzysztof Kozlowski wrote:
>> Add a minimal DTS for the new QRD8550 board - a mobile-like development
>> board with SM8550.  Serial, UFS and USB should be working.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
> [...]
>> +
>> +		vreg_l17b_2p5: ldo17 {
>> +			regulator-name = "vreg_l17b_2p5";
>> +			regulator-min-microvolt = <2504000>;
>> +			regulator-max-microvolt = <2504000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
> 
> [...]
> 
>> +		};
>> +
>> +		vreg_l1g_1p2: ldo1 {
>> +			regulator-name = "vreg_l1g_1p2";
>> +			regulator-min-microvolt = <1200000>;
>> +			regulator-max-microvolt = <1200000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l3g_1p2: ldo3 {
>> +			regulator-name = "vreg_l3g_1p2";
>> +			regulator-min-microvolt = <1200000>;
>> +			regulator-max-microvolt = <1200000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
> 
> [...]
> 
>> +
>> +&ufs_mem_hc {
>> +	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
>> +	vcc-supply = <&vreg_l17b_2p5>;
>> +	vcc-max-microamp = <1300000>;
>> +	vccq-supply = <&vreg_l1g_1p2>;
>> +	vccq-max-microamp = <1200000>;
>> +	vccq2-supply = <&vreg_l3g_1p2>;
> None of these regulators have allowed-modes + allow-set-load,
> I think you may want that.
> 
> With or without that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

It's something to fix also for SM8550 MTP.

Best regards,
Krzysztof

