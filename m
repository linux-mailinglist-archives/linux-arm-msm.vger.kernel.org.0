Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9538A660089
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 13:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbjAFMul (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 07:50:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232518AbjAFMuk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 07:50:40 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767AD7459B
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 04:50:39 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id z8-20020a05600c220800b003d33b0bda11so3850634wml.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 04:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rePk4otgmJsoUZx3wQir/mu8uKDtUT/unn9iCMuDGXc=;
        b=MqIJJ92YjJFSQvhXLtVY8CkFHRQ13ALDrV/xKqsiSFrxW3Xqh3zr9vjSFz9dtQlu0O
         vargvSI325gDktqjgCCUqTQvoNQFTolCA9ixi1w+O9pzujBdaK4FZu2+X/wapQAiqc1J
         vDegVa3jmE3oWMQVaKLQgSYCBLj1KKpxUU65gCkG/C7oKimli2qjdn4vQMpiu2Q5yE5m
         RDifRiDL6Z+QRTUevhcXVn4vowqHiXGiI/Z8H+16FyUX0cpAYITZpffjxz214WSF0P0Y
         YzfnelvTityLktxfnTcKBSHFVV0ZJe3WGxJcDFpx1SYlgV/AXu4aSVTw5O7+0pdvqZJi
         co6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rePk4otgmJsoUZx3wQir/mu8uKDtUT/unn9iCMuDGXc=;
        b=up1otfUELb5bz+H+xBTl8oNs4BNoYN94IokHaKlERFqpUg50jj+q4Don7a34mUqz7e
         rCyaHx8sxRao2jesoiahKpAxoTkTdETygSUMiIAOY9MoFL4bxoMizGfRX6CLCm/OGAE6
         9nI3cZoM6H/2HcNG0hiToSrr2hA0LtZ8ZuoXSTWecrdtnymZDytakdS6fVNxf8WHlaHZ
         Ivm9u761/WfF1kpwxIRFls6Ka4JRHBnym4wxIx767KRPW5XeWKXfVbCQCsSEjiOWmMRf
         /F9f769UCKM12lP0x+ga6ShCC0uOJWdibJtp+nIwVt9B8Q46I4wJTsVw9vHY5bWf4OFW
         tdVg==
X-Gm-Message-State: AFqh2krQkXzQfGOahTDbETx6jpBA/9QvVBKf7L4ZS9dylkQZOznnQaVu
        WBviw10JpnURJ2pX0AzplNex1w==
X-Google-Smtp-Source: AMrXdXtyoYVLJQIjlfYxEMk1BpTcEtQndRolLJIQH+LL6HNl3W2EK7y2mrtxK6fpyK1Iu3cAyTteFA==
X-Received: by 2002:a05:600c:3495:b0:3c6:e62e:2e74 with SMTP id a21-20020a05600c349500b003c6e62e2e74mr39719299wmq.15.1673009438067;
        Fri, 06 Jan 2023 04:50:38 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c00d000b003cf4eac8e80sm1880432wmm.23.2023.01.06.04.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 04:50:37 -0800 (PST)
Message-ID: <ed1b6934-a836-65ef-86a4-18706345ec29@linaro.org>
Date:   Fri, 6 Jan 2023 13:50:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 03/12] dt-bindings: clock: qcom,mmcc: define
 clocks/clock-names for APQ8084
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
 <20230105134133.1550618-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230105134133.1550618-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/01/2023 14:41, Dmitry Baryshkov wrote:
> Define clock/clock-names properties of the MMCC device node to be used
> on APQ8084 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

