Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0A5A73D1E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jun 2023 17:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjFYP5I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Jun 2023 11:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbjFYP5H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Jun 2023 11:57:07 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408E218B
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 08:57:05 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-98d34f1e54fso224357566b.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 08:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687708623; x=1690300623;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jk9fbLwshBtg/E+sEzUayapssg4ammGRuwqIP9brEQ0=;
        b=VN+M+c3rQZy30LPPT3g1IymOvFQRGdEOq75XNbGUaWDn1W+E0iLzbAraHQ4XqhDu61
         sjs6vJlTgZEkaVA3SuduebT3mw4+6LLcotIz/h+pylLSOvDRe6ZDY+Of70Jn6l0SouyM
         Dmm9FlAGB53ROX3x82bjgSuHUtOXBugyVw5M9agT5luPobTG8lHoxKs+c+9mfe1lFJ1M
         CqCXhXmY9Ic+2T2hh1nyYZjfYhj+/bOJeUKITb2ou5D9cAlyvioQF27fRlVj3m+4wurV
         ojsyfU7f3RjAJndN3QjS+lgxGr4NaYrxOVhuNTQ0dQ/eJE+7g3moL8daI6+jtk0r3+SF
         Qe8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687708623; x=1690300623;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jk9fbLwshBtg/E+sEzUayapssg4ammGRuwqIP9brEQ0=;
        b=i9SaMrb2i31BhlW6ZuzdMXSwKNMnfQJsZzc9zAgrwuPK3NQ8TpYsCKEGtoaNs+CSRB
         jvR1Arsw79cfQdb34gGZdzyfdDnXOYgisNJn58CqVM/LF3568Rm7UrGBiPpidjAGdNzN
         7O2IG6je2ti0s6RnthcdqKTSXFR1EdQy/QcPC4k4KvyKcrsku3Tcy85r+t+fa96+HZfa
         u78sqsOwr1dChdTe65zusy+VO8SzPq32SVyOu+3RnHKDqUzCwqN9S7ir7wcsx7Vg65DH
         A2K04I8BECoeXE1i7BIlW+QeqS4AVqBln3xN3qC8Oht+hRB62hYf4Tmkep88Dr+Ck941
         X8YA==
X-Gm-Message-State: AC+VfDwvxJTCusz07cvbi4uoS72poMZp/U/9d/0qya6jrkax1Xkzdqdt
        Q825ZVCKbGqL8VQx5Ow8PhFRQQ==
X-Google-Smtp-Source: ACHHUZ45HTe/R0DwBXjKwHzsWh7zum8mW5pgjJs/jMrjsfomfpWp97K6F9RHvgqvGe+DX0j/fpQi7A==
X-Received: by 2002:a17:907:847:b0:978:9666:2ea6 with SMTP id ww7-20020a170907084700b0097896662ea6mr18784255ejb.66.1687708623723;
        Sun, 25 Jun 2023 08:57:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id qq28-20020a17090720dc00b009891da61b1asm2194454ejb.44.2023.06.25.08.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 08:57:03 -0700 (PDT)
Message-ID: <e0ef26e6-7604-222f-09dd-bdb131e8e69b@linaro.org>
Date:   Sun, 25 Jun 2023 17:57:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 01/11] dt-bindings: phy: migrate QMP UFS PHY bindings
 to qcom,sc8280xp-qmp-ufs-phy.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20230523140622.265692-1-dmitry.baryshkov@linaro.org>
 <20230523140622.265692-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230523140622.265692-2-dmitry.baryshkov@linaro.org>
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

On 23/05/2023 16:06, Dmitry Baryshkov wrote:
> Migrate legacy bindings (described in qcom,msm8996-qmp-ufs-phy.yaml)
> to qcom,sc8280xp-qmp-ufs-phy.yaml. This removes a need to declare
> the child PHY node or split resource regions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

