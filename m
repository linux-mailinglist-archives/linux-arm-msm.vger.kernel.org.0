Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C110704F88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 15:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233692AbjEPNlM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 09:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233689AbjEPNlL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 09:41:11 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD03E49CC
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 06:41:03 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f50020e0f8so27588935e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684244462; x=1686836462;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi52h4BwbyrvN/UFSfSTrTKE7cXA4CH95lTEYcAxXFI=;
        b=giOtGLEEfJCagK7Rug5WXqi4WKzgSfeHJwKdHxs9AfpiffCA0F853lNyAIXbEkSNhC
         oS90RbBPSF5JztJHvPO2Fz7Nfj8TmS2tEMfiGm2uvvtvJWsm9ewZBE0T0sal73G6K4U2
         XdIFLhn11NzKWHU8L7OxgDsMTEx/fLra2AZchQc+NWFB8Dt3D/XSTooSf2DQ93Ux2gu6
         3J3V2KrByG+tjW/eJ3OsU3qsNAVtIM5W7T+wacHntBr/rSkeHW6a9MPMOQgiDcuQR6bx
         q/7yubfyReY+5FwCyvZ8+d06PPyaMFdT//BaWnzDdSwUVuBIW24AphARg06i81RhVCWr
         RozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684244462; x=1686836462;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pi52h4BwbyrvN/UFSfSTrTKE7cXA4CH95lTEYcAxXFI=;
        b=bVaQP3yrb5/3W9EKg1JJLV5cnSeYYYttYKbdgQhJkCBsc4NC1CvLFZ7//8Y5YtgDTB
         FciIRZoDkky6FFsqHYFKyMnXrxItqf5siCaUOIozWann8AVYJZoS1sabdlFsG6hDcLeu
         OE+EeOQPRJfgJW+iBWQvDRcTduUQHE2U2KyLM3/Y892c21vAJU/EGh3Niifp2LEhj4Gb
         iCE3sEjXl3vFn8o6BSCoURM+82+oLsNTQO/B0ZCC+zBzT1KSx8K7sJUFe89ei1G7ys9W
         AHJesgHOcE0SZ2Izi/OuFpMbthNjdHxQVPeZYsJ1SHscDi2eiPLIAITONQd/Yq3Lg7s5
         IbrA==
X-Gm-Message-State: AC+VfDzixQSfobBfOZ6bGcpsHSkvgAEPdDwOoGEHaVwu8HY518j0tSZL
        I91HkODbVjzIA58DQj2urFoFqQ==
X-Google-Smtp-Source: ACHHUZ4sAY7KhOuQSLuY70WCNRujQd68fSqdKJsRuMmYQ9ieu+JhsUY9pR3vwmATgb0JkCiF9y/icw==
X-Received: by 2002:a05:6000:114b:b0:307:8a39:555f with SMTP id d11-20020a056000114b00b003078a39555fmr24009097wrx.17.1684244462091;
        Tue, 16 May 2023 06:41:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86be:97a:a043:77a8? ([2a01:e0a:982:cbb0:86be:97a:a043:77a8])
        by smtp.gmail.com with ESMTPSA id u9-20020adfed49000000b0030647449730sm2672349wro.74.2023.05.16.06.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 06:41:01 -0700 (PDT)
Message-ID: <14b029a3-dffa-7d4f-688a-fdb9bad585b1@linaro.org>
Date:   Tue, 16 May 2023 15:41:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550-qrd: add USB OTG
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230516133011.108093-1-krzysztof.kozlowski@linaro.org>
 <20230516133011.108093-2-krzysztof.kozlowski@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230516133011.108093-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/05/2023 15:30, Krzysztof Kozlowski wrote:
> Add missing parts of USB stack to enable USB OTG mode.  The QRD8550
> comes with one USB Type-C port.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 52 ++++++++++++++++++++++++-
>   1 file changed, 51 insertions(+), 1 deletion(-)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
