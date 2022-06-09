Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92DF4544691
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 10:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242679AbiFIIwb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 04:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242668AbiFIIv5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 04:51:57 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4238F48E73
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jun 2022 01:51:30 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id q1so46122432ejz.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jun 2022 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=M8e5RnC6BDCalWH7A1w4Wai2umRpd61YtQBBpmHxCTg=;
        b=G94I6/e5+zMW3WjmA5mkIh/BZbIwi9fHMwAlv8zSiWQW5mYtBS9tiT+96zVrv6l8Gj
         bczYIYNi28cSQF6doso2XWgT5IRxnHPky1hBo5YI7rFRDNTdh33dPQJNNboe7HvTytWf
         wHCo7eYL4MXhFSivL2FYB5eV3VoamvJ6+4H0K4xPSAO2SeknD32ErVAKfbN1EdjeSdhO
         a/o5BrU4f37Mm8jBgggs8aedhv5lIEDeOXti8dpEu0Yu6QvgP279D2PRsGwmftOE5rVT
         wj2LFK6kD+2bjBX95997d2PGMlIH0/TUeWNmAnuewbmoPVcU2p+3HFqkgNaACSPGuyq1
         070Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=M8e5RnC6BDCalWH7A1w4Wai2umRpd61YtQBBpmHxCTg=;
        b=pDRZz2ZztOe5zZpuqJkOA8a+7Rc2EzXlnTsUFcXdvgbxMjQrw+uvO7SH+EdOL365aD
         Va4sJyxTqFOOl/VtcJsV4sZUxEsCSm/PY2E4t5VPFcUpno8c/tFRXfaqhS8T4gdYybtX
         qVjUp8nu8nfdiMryHjYfqI4yfozuEWa/lovp4ks3TqyZFrdDgN4KqFApsHBzkrPEgOOU
         RXlg6dLad/ca7+QW2ToybCLV97iKjJy9k0yYR7/cK06oHwhHro7h8HdH0FqVvOEShg/2
         s2TfdYq88+k2aKMd3MCqrHB30HMHFVzkXfGk+EA45VB0+4EJz6UsaMVy0ej5jWvsgjYD
         Jh8w==
X-Gm-Message-State: AOAM532+CxJCeWgEulx1RaoH616xwo7M+kufqyPlAbqW35CjqQggp52i
        Ew4e/Ix8PB2GXgOTdC6mSapYyA==
X-Google-Smtp-Source: ABdhPJxOe2ebPCCRukL/3pwCqqRVEGK7F4P3I838X2J4i641HLJD2ermkGhgGkY2/WjmEMN7KYWLNw==
X-Received: by 2002:a17:907:3e91:b0:711:ea5e:2d4 with SMTP id hs17-20020a1709073e9100b00711ea5e02d4mr9199454ejc.52.1654764688817;
        Thu, 09 Jun 2022 01:51:28 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e1-20020a1709062c0100b0070bdc059ab2sm8916366ejh.138.2022.06.09.01.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 01:51:27 -0700 (PDT)
Message-ID: <6ade0286-bdd4-c55c-ff02-8e8e7fe5bdce@linaro.org>
Date:   Thu, 9 Jun 2022 10:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/9] dt-bindings: arm: qcom: fix Alcatel OneTouch Idol 3
 compatibles
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
References: <20220520123252.365762-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520123252.365762-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/05/2022 14:32, Krzysztof Kozlowski wrote:
> The MSM8916 Alcatel OneTouch Idol 3 does not use MTP fallbacks in
> compatibles:
> 
>   msm8916-alcatel-idol347.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
>     ['alcatel,idol347', 'qcom,msm8916'] is too short
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Fixes: e9dd2f7204ed ("dt-bindings: arm: qcom: Document alcatel,idol347 board")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Bjorn,

Any comments on these?

Best regards,
Krzysztof
