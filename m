Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA5B9734557
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jun 2023 10:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjFRIHz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Jun 2023 04:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjFRIHy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Jun 2023 04:07:54 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29F7E70
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jun 2023 01:07:52 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-98377c5d53eso329535766b.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jun 2023 01:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687075671; x=1689667671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83Nn/kApjqMqR5Y+eBpYu2YO03PvXgyqsQgNeKs9ERs=;
        b=qXmtLTMeaNyTrIbn+548Mj5DoAdBX6VKfAhSux/803cNvj1mkf2XeClqWtQ4Jnj1b9
         f0Ivs4xK34vtrxttfs6gqB1TK0Q9BzmajrXk9XIGTnVHfswpvjq/9z4ZrYMYISdrIZVU
         FKhojUr415St4/7Q8AObHIjWKyHWn35gNvrvOYvp9KIQ1e4jYmMgDTyhfT/QP1wVaog3
         0AiI3GnRco+XeCijLZpRpV2R7hlGXhj07lN/LBiwItusdZwDRyYR7WTEoUukLsdaKWfI
         9VZIAoAEVLjDx5QvuTUe188FAYMJCb5C7hrebKrH/EWICkmwtVBbmScXC0Gv9cm/ZjO9
         VREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687075671; x=1689667671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83Nn/kApjqMqR5Y+eBpYu2YO03PvXgyqsQgNeKs9ERs=;
        b=f4ID2AUsJg4PuDEVlKlpKQeOG750x3tXSfVB5cxN3s0hlIG/mgvLEbT9vqE8TI+e7Q
         Sjjd0NPWM8vOhZEL8NDRBv8b5yYBr/CkXojpPw2WXdRrILGPehXDDNdKtgw538EfRyn7
         vARpOpMPHyAmFz3riwecvgbZ9Bq7oHAjYdgYeDxvAZaRXhhz5Q+zwlMkidV7UjB7fz4X
         gKCGLi7GNieqYstfM6eHuSWirSTDFK5QPp5Ms5SiIbIog8S+JLfpvHVISyQLCzapBZ8n
         Utxtij1ndTfMS3FHNxpYs1y4/5Uj0xywL+hTeQXq678rKLvlFrogF3A6yf+Ye6kZT39V
         jbNg==
X-Gm-Message-State: AC+VfDwMjEz1IILzXEj6///apOoJvkzFochNP1K83RlQ0tk/TqSZzse3
        aiAst8wPjmEwFd71VGgZ70xTJQ==
X-Google-Smtp-Source: ACHHUZ75qpVXAxr5KwOMXF12+H05NwigsHfr8/BY8mshNmgxXsOq3XP/2PF1B3jSenJ7CMeKukh3nQ==
X-Received: by 2002:a17:907:702:b0:982:be38:a5df with SMTP id xb2-20020a170907070200b00982be38a5dfmr5961054ejb.63.1687075671039;
        Sun, 18 Jun 2023 01:07:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id e27-20020a170906249b00b0098654d3c270sm2815779ejb.52.2023.06.18.01.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 01:07:50 -0700 (PDT)
Message-ID: <e89e574c-db6d-877b-462c-bb91cc9d9ff1@linaro.org>
Date:   Sun, 18 Jun 2023 10:07:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/4] dt-bindings: firmware: qcom,scm: Document that SCM
 can be dma-coherent
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>, andersson@kernel.org
Cc:     amit.pundir@linaro.org, Will Deacon <will@kernel.org>,
        sumit.semwal@linaro.org, linux-arm-msm@vger.kernel.org,
        konrad.dybcio@somainline.org, linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>,
        Stephen Boyd <swboyd@chromium.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230616081440.v2.1.Ie79b5f0ed45739695c9970df121e11d724909157@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230616081440.v2.1.Ie79b5f0ed45739695c9970df121e11d724909157@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/06/2023 17:14, Douglas Anderson wrote:
> Trogdor devices use firmware backed by TF-A instead of Qualcomm's
> normal TZ. On TF-A we end up mapping memory as cacheable. Specifically,
> you can see in Trogdor's TF-A code [1] in qti_sip_mem_assign() that we
> call qti_mmap_add_dynamic_region() with MT_RO_DATA. This translates
> down to MT_MEMORY instead of MT_NON_CACHEABLE or MT_DEVICE.
> 
> Let's allow devices like trogdor to be described properly by allowing
> "dma-coherent" in the SCM node.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org

2

Best regards,
Krzysztof

