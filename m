Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAA98781FF3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Aug 2023 22:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbjHTUjg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 16:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232009AbjHTUjR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 16:39:17 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2632A5266
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 13:35:46 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99df431d4bfso340052766b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 13:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692563742; x=1693168542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k5SY121PZsA6LLUqjl+m4aUPO7uMF/Lgar+C71AzQSA=;
        b=RXfGcD7VTR2Jy18ESeWDFxQaZi+uFVideZCJxWpig7AcAuZ0tmyOAXAZWAHv/6b2SV
         /1Ygp6CQyfzk5Ab4bP93JHmeyN/SYyhJr2W1TpD+F/4E2Smu6G20OxiP/7HSsFHkFrIK
         hOvadYS6+YOytNxGMPCZVGVgKq+ULq6xxm0oJJwrPlhSQWJAofKmYE8WhSjWSSKNMpSV
         nC7vmICM90W2Es4tkq7HWUjPQM7iGQWWQRK8BHOvY60xhuCTxGSHs6TSKxqAWgTTmSBF
         iqewmm6n3JHNC23GiiKggILr8rXk6Spl/KVyMtATb4HdvdynTwlmlfOFz+riEFXY0AoH
         tjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692563742; x=1693168542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k5SY121PZsA6LLUqjl+m4aUPO7uMF/Lgar+C71AzQSA=;
        b=aJ5UVnaC7kkgbzhqbZn/yaJt32zzPMl4Z5uXCvq0ACgAyTlQvtuzQMUNvSTQITV4O/
         K4tVPWu6nti4aTJRJSWA8lyWezi+LWU6s8OZoUb/GUV1TBTF7KalFge2dzK06B0VtNhL
         ++CA4tOyAo7IXvEBSl/Aj+PHg4dW7G5qAevDQRnYUZHJU2EPQ7mEnjoOMVqyOrhTu8/x
         7/QeRVNlXeZoMs4p5wIMX4oEi3HQrOC9r0Mg9iJKbo07AwVngizxw+ufsQeN6sDHj8qi
         INnDSWTRbywJEomE3LyLsLp9oDtvK894FD8eMGyJTZ0oUt5mWDbgd0aR9aXL7WHbc+XO
         4BRA==
X-Gm-Message-State: AOJu0YyuBAntlyQjWiM44jOITwepCeQtuvKOvFegDrc2Pjd/qk1OzpVF
        HuaZckNOsv4VCA/sZGglQBd7VQ==
X-Google-Smtp-Source: AGHT+IER4pOD7o4r4w1ZjFFpuMX2f2G7lRZwb52auVW4gkJL7iR0MMmTCG641xcE3pWrQuUjBmRKFg==
X-Received: by 2002:a17:906:10ca:b0:99b:6e54:bd5b with SMTP id v10-20020a17090610ca00b0099b6e54bd5bmr4311375ejv.50.1692563742595;
        Sun, 20 Aug 2023 13:35:42 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id d8-20020a1709067f0800b00992c92af6easm5186378ejr.161.2023.08.20.13.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Aug 2023 13:35:42 -0700 (PDT)
Message-ID: <3c6e9b42-4794-420b-f222-8de9a5383ad8@linaro.org>
Date:   Sun, 20 Aug 2023 22:35:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 01/18] dt-bindings: phy: migrate QMP PCIe PHY bindings
 to qcom,sc8280xp-qmp-pcie-phy.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
 <20230820142035.89903-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230820142035.89903-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/08/2023 16:20, Dmitry Baryshkov wrote:
> Migrate legacy bindings (described in qcom,ipq8074-qmp-pcie-phy.yaml)
> to qcom,sc8280xp-qmp-pcie-phy.yaml. This removes a need to declare
> the child PHY node or split resource regions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

