Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C209A566743
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 12:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbiGEKCU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 06:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbiGEKCT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 06:02:19 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F3113E96
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 03:02:18 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id t24so19703439lfr.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 03:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YsVdI7fHl1VxO3Wl5w8gk6OXuhIP/NlmiGI+6KYr6zs=;
        b=LUQmv684ojJXX0kS8+ZVOyZfAKtuh0TUojYHooSk1/kbN5fo1AEWOBL8BXQpL7IUhu
         +/YjUK4GHkOSfagzACV816hgVCTDsUAaMZ65YkokqADDGa8qsD+cY1t+bAm4/h7jBLzo
         TGUhCJyo/J0u4i85m2lnnFxDSPSyUBwMUIl6oFYQL4PIhUuRzdcagjqitKsei8pmEmGM
         59biwf1TYTsnphy9c+SJVl3tjOa+y1Yvm/MTVLTyiNnXB2V50MMz+2ySCWXxfhlvbDJ7
         RCFUnzHf2WhV44SxIh6j1ipaFqyo5Dd6SD5vWF1jNcvZ02j3dDk1iuJGCvU8m3imdelG
         U1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YsVdI7fHl1VxO3Wl5w8gk6OXuhIP/NlmiGI+6KYr6zs=;
        b=JuX5gPvaagqQ07s36eUenv5SfKS696qXuia2vcQkC3mT5uH3gO2DGnvV6oWrpdETEn
         S9iIf2cU53ahto9WU1Rt2Nv2dkO4M2N8Dsehvr/15dV8kP/O8f58VmlH+AFxNitKx3N2
         pe2DlrCL23nPnCwVXP5JEH5X09LAJMJTaOCQ7d+7zo3cwUCWKunOzHIu1zyPfFYp59Ye
         9JuLSNpvFuGJ8oFGS0uXHdupe9p8esIhliN33JcngriZkTQzCkb75XaWx5Dcr0QdQZwL
         koAAP45WF1QLvPHS539pJjbkw4WQnqJH7qQ9HhrguRv1YdHsgioRKsEaafZVJbBP1acP
         Xa4A==
X-Gm-Message-State: AJIora+PYaPkayLmKnf4Ox11f1gbPPtCCJQbBEgZsKOIbLzar5p/tY7I
        WWiIzmBLH/vzWMJwib+Mum2ITQ==
X-Google-Smtp-Source: AGRyM1v7t1GhNIVSZTg1X939xuA0e3pQLj4BvtxRMtuqaEdgbiTxylVDRXSRMYzbO69WGBTLo0ob/A==
X-Received: by 2002:a05:6512:3b9d:b0:47f:7712:3ece with SMTP id g29-20020a0565123b9d00b0047f77123ecemr20980076lfv.127.1657015336913;
        Tue, 05 Jul 2022 03:02:16 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id o4-20020a05651205c400b0047f8990e8c2sm5635777lfo.140.2022.07.05.03.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 03:02:16 -0700 (PDT)
Message-ID: <b4058e50-8042-fe60-9a78-04bca7a09f3f@linaro.org>
Date:   Tue, 5 Jul 2022 12:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/43] dt-bindings: phy: qcom,qmp: sort compatible strings
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220705094239.17174-1-johan+linaro@kernel.org>
 <20220705094239.17174-3-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705094239.17174-3-johan+linaro@kernel.org>
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

On 05/07/2022 11:41, Johan Hovold wrote:
> Sort the compatible strings alphabetically to make it easier to look up
> entries and add new ones.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
