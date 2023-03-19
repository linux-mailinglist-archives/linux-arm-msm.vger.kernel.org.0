Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C89206C016A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 13:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjCSMHj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 08:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbjCSMHc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 08:07:32 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7904B22A0D
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 05:07:12 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id cy23so36695620edb.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 05:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227630;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=TzAXlqE8TgfprcWtggNsM5B4SQJQtCXYoRCn8uqjU6Dppl3AIp4F/El+x+T+cy9/Hp
         oAdm77wfFODxSKeyHAiXXUxrdkhRop2rDx79qH1f2hq0fJQiR6YqC0/5p587b7PhB50N
         Az1pLOxhlA4adj+8SICk15XWO3UofGCHYaEdHmQfeW5uy/uSbfi0mu2/WOM2SoE5NwK9
         XKhHart75hNrLBOJU0s4puBzvV/H170DSekttmS/Ku+kn8xvWyBxg94fAif55VGfJ2lc
         s8ZrCs9dbcSnm0K6ktftWRN9UtNVNOy7IHzXjQI/cq3HVT1durOmcBipUAdQzSZ9tz+J
         7FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227630;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=d2qmXFc7oF73qHeOum7BFHwqS7DqVyVrqUsC4IhV1++WZzVoet3niQjA6nNOzAF16g
         64yOOQtLG5a2SgXSzznI73p4rYjQDa1X1DqAHj86wVHt2bJUL0P0a8Z9RQ0jQwDLs+hC
         xoA1SWE7CnUIlc/qf6n4UvN+yJxvveYDnSu1ugT3zt8sioJOLM+QmxQQI3crxmvTcefU
         0axxgLpGmuuqiPPcvWIn+F1cPcGjZPH5NLK2RbJfOs7Ap52+k5sTSHHn+6kAMTX1GhPK
         gpU6Ovc4QV25cZQtiksFbIHz74g76KvnkfApHp4K1I2HeIUWej/NO88Unxc9YF9zU5zP
         MKRQ==
X-Gm-Message-State: AO0yUKWXp5qFwNqgpIP/3x0vhBpKMFqYHdbentUsz0eiiIwhJrGk+AA6
        LISmDGnv1mruN6rEn/E1tW3aqg==
X-Google-Smtp-Source: AK7set8ojqGhOAjmBHwzN76QhQtwOWV8Psp9NGV0PffUGEU20N+02MFB5rvCOFkPKNTFQrrwRiSzoQ==
X-Received: by 2002:a17:906:40c2:b0:91f:32f9:82f0 with SMTP id a2-20020a17090640c200b0091f32f982f0mr5542602ejk.29.1679227630370;
        Sun, 19 Mar 2023 05:07:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id jj4-20020a170907984400b009323f08827dsm2744307ejc.13.2023.03.19.05.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:07:10 -0700 (PDT)
Message-ID: <68a5d8d8-b70a-e58e-e38e-5f185121e01a@linaro.org>
Date:   Sun, 19 Mar 2023 13:07:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: mtd: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20230317233631.3968509-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233631.3968509-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

