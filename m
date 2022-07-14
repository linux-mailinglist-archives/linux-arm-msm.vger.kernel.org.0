Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF88E5747B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237549AbiGNJHa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237543AbiGNJH3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:07:29 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A926820F59
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:07:27 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id u14so1428792ljh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IFDdRvC9ZQ77e13XEaQ5abctlA6xZYx1dQc3x9ug9p0=;
        b=Z4qi8sR/JKAHbfgzIpvlLsBmokZm90HVdCB480lzZJKqZH847+f6bGs4IArLGPAL7N
         dqunROMcAAWtAXK9lo4mwI0NyeZ+JDW6P2GYea61r9+CHK83pv8LkDSzcyS5iDpNpXPC
         fFPnCjOtz9fy9wSTb+Jet0jOoXTSGpZIsYVbY33tHSMwiETZ95hZB901UfoXcqnN9kzt
         gqPLFVBN8jSiKd+7W/W6pzQb1fZ+Gn1JS9VAGymaqDr1CVR9lo2qmX3XjpCMb37TCa1f
         yuwXdIswQOlpEmhFtjpDTERFFJKgISh/E+xRFkQy08i6RPnbI18pANxdqws0P4/ATy7o
         3Obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IFDdRvC9ZQ77e13XEaQ5abctlA6xZYx1dQc3x9ug9p0=;
        b=g9phsdYwo9d2nLVKaNZVwLa/wrs6P0pZU3J9XAsTxnUipg1bpj/aX4BjbMTamLELyS
         Tznn/gr+3r/t0Wc/int3+skv0P405OtAdyGDJas83Q0PEcEMERs3L3L8H6RIDzpVIdFy
         dLC+dT0FqNT5QVTJxtJpOZ00QYBPwhUIXQrcQvuBr3jyVKHlDaWtRfjFcsynlcw7HpkU
         CxsdQ94MK5z8uM0/iTccNTTJxFdycdVK2GrRfSJYbfbPtqYkzTpCfYCJ3DMebmW9nis7
         HRl3zFEG8G5bC3JogAGBTqWeJLYAsCQVTZ+vvi6hDEwrU2Ggp+FOX1xVDpzyD0rgbr+P
         huXA==
X-Gm-Message-State: AJIora/7pj+46PDBXIM1Kqomq/UVamgjXVhjUeZkUtHUOApavc+5UpW7
        fzaNwHKpAVBDQVYPWLiEb3RAoQ==
X-Google-Smtp-Source: AGRyM1tzaFWQc48vaEzE2Yomk3B1qT9dVcVRjRU8KCSVyQXEIxRn20YoW0SyKHg5PQMsK8j6Ii7kmQ==
X-Received: by 2002:a2e:994d:0:b0:25d:8554:6c3f with SMTP id r13-20020a2e994d000000b0025d85546c3fmr4153887ljj.471.1657789645970;
        Thu, 14 Jul 2022 02:07:25 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id p18-20020a2e9a92000000b0025d7517edd2sm180506lji.11.2022.07.14.02.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:07:25 -0700 (PDT)
Message-ID: <26916d41-f398-8527-96f4-9a28f4f4e789@linaro.org>
Date:   Thu, 14 Jul 2022 11:07:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 03/30] dt-bindings: phy: qcom,qmp: drop redundant
 descriptions
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220707134725.3512-1-johan+linaro@kernel.org>
 <20220707134725.3512-4-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707134725.3512-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2022 15:46, Johan Hovold wrote:
> Drop the redundant supply and clock descriptions which did not add much
> information beyond what can be inferred from the corresponding resource
> names.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>


(...)

>              - const: ref
>              - const: refgen
>          resets:
> -          items:
> -            - description: reset of phy block.
> +          maxItems: 1
>          reset-names:
>            items:
>              - const: phy
> @@ -376,11 +334,7 @@ allOf:
>      then:
>        properties:
>          clocks:
> -          items:
> -            - description: Phy aux clock.
> -            - description: 19.2 MHz ref clk source.
> -            - description: 19.2 MHz ref clk.

Here and in other places - I think you loose information, because the
frequency is not mentioned in clock name.


Best regards,
Krzysztof
