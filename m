Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8544E6B7E9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 18:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjCMRCW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 13:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjCMRCB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 13:02:01 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8B17E8AA
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 10:00:47 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id a32so13334037ljq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 10:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678726833;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NH6AyQN2sS2wNXLX+uiwQOiPnk+yeXJJyW2X9AM5crE=;
        b=LIsLJ6GMR61d1IQJs01dxLeQeHwivh26JGcRi65CZVJCyc6zUw6/9sSPcwOTG7dlHy
         OEObRiTGqqzJ/sahS0JEF6Eu8jYyEnjeISBYiKqX6HJUZ5OzrnGXU1S4C32FpMPgdcTH
         V7Mpde+DRfp7VgH9z2cD3xwT8xtbWhVrovY84dAghCfZMd8nz7LGH1Go1edJZ+Nfh1XL
         7p3UQkYs62CM4acVuRqcrNEYpKN+ZRdn6wVqrX0wp4cyelH0TRXEy2Ezp0EPfzvasj6H
         FCceX1KUVkCeBXq6lbIWHMUEHJrCLuNiQCHNzp66A8WVsN7J8U3GGIZxrK2Ht5t/zfJC
         jnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678726833;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NH6AyQN2sS2wNXLX+uiwQOiPnk+yeXJJyW2X9AM5crE=;
        b=498gZKCCE1HeFmxoHGJNtMG0/R4PBzpl8sjrn3L5EAneP8L8FaffEqj/z6bZ8/Flaj
         dQzpXAkX/5+YmLd+BVlDOf9U0yTWb0lnogM0npRLKJBmd3H9BLjAPO+ZgCYGd5bl3/uf
         7VJWMg2kPWn1uBlTgmxl8ms9rk4/ljn/w2GBagB7jNYsOHpNCwN2ha3JVnmM5k6FlHpi
         SJmTtVUKSWC3y8GXHe8UVny2DjkQsIcHURxaA+dfbise391jis2QcOB8JyB1clPRG397
         5fHUI/AU/PB2RmHsllhmmG99Fy1CCKTE7jbqrlYokw1i78zQ5rCRf7pJwdOfiORNG627
         7SZA==
X-Gm-Message-State: AO0yUKWGXvF3C/Kka2BKsfpiL4DmE1B066dBZA1b/JQoey1ORtjMI64x
        vclGzcshRBzCfBHk4iZ0gNFvDyWeBc+qx8nPLKU=
X-Google-Smtp-Source: AK7set/cSAk/pc8ngpNJpUXXt5IcHOO//GUuoJgxHP1SSZqC1OyX07JcN7Rxse/+e4uIZao9SUWtKQ==
X-Received: by 2002:a2e:b0d4:0:b0:28d:47b0:e97d with SMTP id g20-20020a2eb0d4000000b0028d47b0e97dmr10341767ljl.27.1678726832880;
        Mon, 13 Mar 2023 10:00:32 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id b24-20020a05651c033800b00298593e3a01sm66368ljp.70.2023.03.13.10.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 10:00:32 -0700 (PDT)
Message-ID: <9419b86c-c217-da36-2e6a-a3724cd6f8b0@linaro.org>
Date:   Mon, 13 Mar 2023 18:00:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: sdm845-tama: Add display nodes
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230313-topic-tama_disp-v2-0-37ececf43770@linaro.org>
 <20230313-topic-tama_disp-v2-1-37ececf43770@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230313-topic-tama_disp-v2-1-37ececf43770@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.03.2023 17:32, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Add required nodes to support display on XZ2/XZ2c. XZ3 has a
> different power rail setup and needs to be handled separately.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
[...]

> +		backlight = <&pmi8998_wled>;
> +		vddio-supply = <&vreg_l14a_1p8>;
> +		vsp-supply = <&lab>;
> +		vsn-supply = <&ibb>;
> +		panel-reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +		touch-reset-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-names = "default", "sleep";
> +		pinctrl-0 = <&sde_dsi_active &sde_te_active_sleep>;
> +		pinctrl-1 = <&sde_dsi_sleep &sde_te_active_sleep>;
pinctrl-n
pinctrl-names

> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
unnecessary

> +
> +		port {
Konrad
>  &uart6 {
> 
