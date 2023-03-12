Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0E826B6553
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Mar 2023 12:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjCLLSK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Mar 2023 07:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjCLLSI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Mar 2023 07:18:08 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF4DCDEB
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Mar 2023 04:18:06 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id cn21so7727120edb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Mar 2023 04:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678619884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G853ILuu+sQv9a+0BB1tR04csQhtS3EQP3WsfLsCtaM=;
        b=r6+3H18NaXCoJwmD1kOtzMr1pR5aWEHs8IGXEWpspHhQONeRwM2EbmME0NynGLzXWV
         k5bOVKy64/Id15Ff1jOwjS4BfWxTip4OOoZ6sQ9FS+ahXLuBWDMRtHbeMN8CgHxbcelN
         sD0IecGS+/Og3LLSXKbch/wsDwrxWXxNiq+FUDQG9+YuvRI2O/RWpkPcghK/sfNdrXrj
         8wlOC/Ofscfjyi91VtMo4z/5Dc6f7B+f4Kp+ChqtVqisx0uij7/8D9u/JOySBQoyueW9
         9SV0PXX1WgTr/XHwKhFc3+l7memXUrV8p5nVoORoWFDQL23If0uoN11xDxSdUwVq+jEZ
         YtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678619884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G853ILuu+sQv9a+0BB1tR04csQhtS3EQP3WsfLsCtaM=;
        b=bd24ngRoK3HQhH2fPVnyeEj7lkgGUTL/A2LiDSEI5XokPdn23hF1hmscbmKPr+wM5a
         wUFWKWskm0UXZ8gg/Ttl208h8SDZOJgyFdxfKUn3+esuWsjxIJ+KQC2sBgHPLIgk3V0o
         HY9fZNQIlbyNyTbfuxYtCD93RdhsQCwYJK1665RSmBRHgHkYxxEVLMWlQmFU+y13jRy4
         6b+EKTJlCvXWAhIG7fgjUU6wjgsDy9umgNXOMx4RPwB70XMx/5+AguUw+31+hqItJ/XC
         aa5nRzUD+oc2LD/iSCSAQNNZw3qxQ7JwOROsnpSB3E4X420Yeq0AF8bXd5yKS8/cRaj6
         7kpA==
X-Gm-Message-State: AO0yUKUKKNM8ZV7pyqFueY9vm5lnwRQKsnjG5b4mWlIv40Tz1UlHzzsL
        PREthYRZ5MS06iQlTL+MA/WwcA==
X-Google-Smtp-Source: AK7set8V5euDVs9uhpdcYEjJ1CaThkXS/gSQkFc3mYuSUaaEMAByufxtLmQWsUvS2DZz/7M4EwaPHw==
X-Received: by 2002:a17:907:2beb:b0:921:5cce:6599 with SMTP id gv43-20020a1709072beb00b009215cce6599mr3483259ejc.41.1678619884602;
        Sun, 12 Mar 2023 04:18:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id g2-20020a1709062da200b008cf377e8795sm2106315eji.199.2023.03.12.04.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 04:18:04 -0700 (PDT)
Message-ID: <85921a58-59f1-ab35-d3bf-3a6174e6121a@linaro.org>
Date:   Sun, 12 Mar 2023 12:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: Add QMP UFS PHY comptible for
 SM7150
Content-Language: en-US
To:     Danila Tikhonov <danila@jiaxyga.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, davidwronek@gmail.com
References: <20230311231733.141806-1-danila@jiaxyga.com>
 <20230311231733.141806-2-danila@jiaxyga.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311231733.141806-2-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/03/2023 00:17, Danila Tikhonov wrote:
> From: David Wronek <davidwronek@gmail.com>
> 
> Document the QMP UFS PHY compatible for SM7150.
> 
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

