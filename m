Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C89CE72DA29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 08:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239741AbjFMGu4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 02:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239627AbjFMGuz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 02:50:55 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E237710C2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 23:50:52 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9788faaca2dso864158966b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 23:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686639051; x=1689231051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drhtA/AGAcvwMxZVFjQYAdmDG7ePEnCLOgbt0/oNOdY=;
        b=TEBz+iZ2s8G54c8HHwJZkTgDJI3RZ7DozvdgUWvfhiUfwutxTKRQkZVedL1jpTAZfa
         64EH2Nf8Vhk1Ym3/SD7HraDStIGt4V5gA5TkrUUm93LI0BAC6SnoTjOvJZMTynrqaJ9i
         YMDJl45H1L1hsufbHT9H4Xl7f7yEhUu4cviByNBfIIOXIeCEJcfM9ATgrE2GEgKWdRrC
         iN3VXWj+Lo4+ywfbsuPzWfRNMLrofczkxh+QLjEmdP2AeabuiH8oUjF4GXZNlHhN5cBI
         nKFQeKjeWF9mhyholPm+CxYVhdPMi6VemXc/i3VuGaknkVq6uUqr6SCdt+hkHz4yL9VX
         /pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686639051; x=1689231051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=drhtA/AGAcvwMxZVFjQYAdmDG7ePEnCLOgbt0/oNOdY=;
        b=eDhhP3CSgd6girvyPX8qDCxaYUvjF9sHZLxkz1EObFvrIVGV3OsSQphwWHF+lLRx4U
         xWW8IShU1UXYGrrWg+e4tFFMoMjM1WBP4xHvdl8SQuVWBRsr+hdjOxtPUoBodGQl1kn4
         PKwhkLi6BZwiTuv5bQowZf2Z7IutK67qxtLv5TBkkI5h7LGPQ57TCeEKPuYaVhgiqVnA
         OXa7SJd5UmrlFRdw0ixPOaxzmCVYH+cR4M8PYLa1iAD8QDCQx1kahA6JKdPRyDyabvGn
         g1moBcBIi6pXRRp+Ke8VEr81kNAV69c0MjW2m1B1254mFtkTn4MbeU0vaNP/2kXOOpM1
         MUjA==
X-Gm-Message-State: AC+VfDz6rL9croMc8ihZ+NwBtBSNbB+9eKCAZHr/82uO51lQ5/hi4d43
        eHK+kvTfKgwmyeJ/AukSJGlJfg==
X-Google-Smtp-Source: ACHHUZ5lSqWMsB61h7O6+N3ZWQOmMk7RyGINbwtui6J6a/uSKzxVIYdHi35keMsaFrU1N49eWCtbyw==
X-Received: by 2002:a17:907:7fab:b0:978:9380:bc0b with SMTP id qk43-20020a1709077fab00b009789380bc0bmr14104575ejc.75.1686639051382;
        Mon, 12 Jun 2023 23:50:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l14-20020a170906a40e00b0097382ed45cbsm6140775ejz.108.2023.06.12.23.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 23:50:51 -0700 (PDT)
Message-ID: <b8a062a0-10e9-bf17-c109-f6986f9dd02c@linaro.org>
Date:   Tue, 13 Jun 2023 08:50:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,pmic-mpp: Fix schema for
 "qcom,paired"
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230418150606.1528107-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230418150606.1528107-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/04/2023 17:06, Rob Herring wrote:
> The "qcom,paired" schema is all wrong. First, it's a list rather than an
> object(dictionary). Second, it is missing a required type. The meta-schema
> normally catches this, but schemas under "$defs" was not getting checked.
> A fix for that is pending.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Linus,
Could you take it for current fixes? The code was wrong and dtschema is
warning now about this.

Fixes: f9a06b810951 ("dt-bindings: pinctrl: qcom,pmic-mpp: Convert qcom
pmic mpp bindings to YAML")


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

