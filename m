Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8C865B4F0D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 15:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbiIKNbC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 09:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbiIKNbB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 09:31:01 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC3522BF7
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:30:59 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id by6so7589207ljb.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ZjdYZup4hi3M7uU6008ZlQ2fxrTrRXAq7VJNcgGePcM=;
        b=sbJ7wXb5kTSc8AAFdwvRQdd+PVXXYYQOnf/uBCOShZwedclF4AwzdIFIog8PtnkmlH
         cnmdNrRjTGPeo+/vPq4V9tM7FVdq3NpnHOEd6fWimIGo4hnVrhERhZL3Gzu/Rx2/gNAo
         vz+EP9657hFzpw//HTZMTpFPtqPLVMvD9250KCt87T/kQaHGzoZgfZ0GqZJuYbye6rRV
         pp7AORI020E2kyjPQIGd+862yBbsPzRx3yBg1waPVLxnvPMRdSxeJoX35U2iJtjz+RMS
         59Yzdmy9joveJyylXQkKfMveGjxW9hsQ/ExZN+Lx/ffHUXY1+Aoh8InWLkR0Vy0lVhXT
         lY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ZjdYZup4hi3M7uU6008ZlQ2fxrTrRXAq7VJNcgGePcM=;
        b=J63ItczSyvoYJPR4+p9dZ9+snDuj6HIP9NIx/+7l0yPV8K1+oQRpKgrZto35BbMgsS
         jyiAT1eO10GC9qIYR1WbCDoD+b2OuIENSCvro5rIQtYVYOTO/rPImyUrZxX1HgZTmz9h
         1KGCpnKcaUo5T6h7r/+PPOVdmyJYij7JoEEBJLo8/o0ZJVT6OmsYVBUiKO96YwT5fTYA
         PYljvIAReV6sZZG5z3tvLVQGG/r0h0aq24xQc923gtth2CVGcIefSJ85ZpMqXl0YVeZL
         MhCeEEPET1Y26hOd8lVo7qwZ7YsFASkJ+nISBoml7LY6SVS7kck2C2ApBJ4Xjfw/wg4z
         8foQ==
X-Gm-Message-State: ACgBeo3GVgL6GwPg8vFqGMXv6loGZJIFbDDprmkk6DIZ5E/ZCPtnJ5xh
        pbAIH8NQ5bWd260NWGB3ihbOQg==
X-Google-Smtp-Source: AA6agR407SxA2qhyTMLTWVfeK2LQFV3uqfjQbJ8mN8zjxZfMzZjW5772CX7prkwwVBFrUiWkXnsfkg==
X-Received: by 2002:a2e:808f:0:b0:26a:b498:2c87 with SMTP id i15-20020a2e808f000000b0026ab4982c87mr6723966ljg.279.1662903058171;
        Sun, 11 Sep 2022 06:30:58 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w18-20020a05651234d200b0049a3f2b1193sm233621lfr.154.2022.09.11.06.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 06:30:57 -0700 (PDT)
Message-ID: <5b8e8da6-0bd6-cf26-5c2b-887cd1d4475e@linaro.org>
Date:   Sun, 11 Sep 2022 15:30:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 6/9] dt-bindings: phy: qcom,qmp-ufs: Fix SM6115 clocks,
 regs
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220910143213.477261-1-iskren.chernev@gmail.com>
 <20220910143213.477261-7-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220910143213.477261-7-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/09/2022 16:32, Iskren Chernev wrote:
> The Sm6115 UFS PHY has 2 clocks and 3 regs.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
