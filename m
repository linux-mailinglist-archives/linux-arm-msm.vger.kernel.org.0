Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADC535446B3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 10:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242697AbiFII5M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 04:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242904AbiFII4a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 04:56:30 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199371E810B
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jun 2022 01:56:12 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id fu3so44611971ejc.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jun 2022 01:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=23ND4rIp28maicnbuFOnjfrniSOk7N5VAPPY+gIY+W4=;
        b=rUKxy/Yy93wPG79xU9wyskibQe9IRoiZzJ2GgV7Rc+CT3nUoOk7M8yUvMIv1gGrLer
         /FfOvsdp+vLpnspqkhm6sLxbl0Ulatox3je4BBcVUO+0SIHldW3ckm9KSFRutkz5bqPu
         OgVhwwpirghDtgGAb9b5ks2MEM/mHCyZqys9tQNCs++Iq6Rrpx8WBoPMyeIzwKxI3U1G
         pw0gHt2ffA7CyDg55fNSVtYsi/G7HbsuxYPirs8qqhF8zf3+2Gg58RXIH1v3T+H9UsB8
         Y+GsCd22zC7QtvqDoBDwAJdWw9avWFaaXtI1Cv4CJ91rVTCviq5goUyebvXSaLosSzRa
         9U2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=23ND4rIp28maicnbuFOnjfrniSOk7N5VAPPY+gIY+W4=;
        b=ndUf9Oh1eKzHcqj4UVocyZtoDNzAve7fp1M6QR6dKzCcpzrqiPqE9WkoYfOdePVWvw
         Ujzmb7Aa9Tm8z751LT2aoFcY3SXNzbcHayNvJAUqdXcMHCg3jAVI0W0mB39ysYk2eWvz
         I2VKrX5fsQb/GpcEGLFd1TXjTH1nvEBAa50nUALOmZzV407SdVDcybPH2pLjucIprVIK
         P+Z0dEwKAQ14ytg90Pwo1kPHPlgwkSJGA8TJpr6DdSlDwpYOE9M3Ik/rZO8EkElmZKGp
         ZQPUqk2myRLfhE/sSuj1Q/8w1Gu3ePp/GXCv1IRDlt9dasdOpnqyEVeyTJC3TmOwosND
         FDlw==
X-Gm-Message-State: AOAM533vrLZFn0K7AtoXEuU06LpV7zwrcXjs5TUxQErlBPq0FR2ZVZD7
        yYi5yyYqE8B0BGvlGQJPn+xNuA==
X-Google-Smtp-Source: ABdhPJxT89yjhtXwg4++i7ECOHiVXc4PmOb6nuBXh9T0b6PTr4L1lJYk6J2tR702atACd/Yq//8x/w==
X-Received: by 2002:a17:907:1c8f:b0:6e8:f898:63bb with SMTP id nb15-20020a1709071c8f00b006e8f89863bbmr36423455ejc.721.1654764970676;
        Thu, 09 Jun 2022 01:56:10 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q6-20020a1709060f8600b00711edab7622sm2819210ejj.40.2022.06.09.01.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 01:56:09 -0700 (PDT)
Message-ID: <67079e6f-52f4-6e0d-bf53-f9feb63e28f6@linaro.org>
Date:   Thu, 9 Jun 2022 10:56:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 00/11] dt-bindings/pinctrl/arm: qcom: minor cleanups of
 QCOM PMIC pinctrl
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Luca Weiss <luca@z3ntu.xyz>, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
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

On 07/05/2022 21:49, Krzysztof Kozlowski wrote:
> Hi,
> 
> The patches are independent, so they can be picked up as is.
> 
> Not really tested on hardware (except SDM845).
> 

Hi Bjorn,
The pinctrl bindings part was applied. The DTS changes are waiting for
you here.

Best regards,
Krzysztof
