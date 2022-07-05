Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78352566F8E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 15:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbiGENmO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 09:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232954AbiGENlo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 09:41:44 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2A627FD6
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 06:04:20 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id bx13so14438530ljb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 06:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pLKQ8GRADjxAI8oyFTdcTS6ksjBlovaTleIdKjPa2L0=;
        b=CDvHxolUJhnGv1nReWrDBlNelL0JE3nC8pIjwfI60hZ9vUuHBg8Ttcno/KshGT1Gvc
         K+vfwfwpW9iqnQWAfUX5uMygFz5CSuyguDxNsf/s8vATbYPuCZ8zhSFG+V5WX6rvXgZg
         Z6PqJwE8kuWOr6/budcwG0F56km4m48XsvVsZAmWv8VfOtaZ+/a7kzMzihZQcX4wIEDm
         LJJdX8NaNwt4RcVJoDJrCZDAp5G5RJqpTec4ISxKfcL6vL2AnChOvrhVOoWa3GhOUOPu
         DyOfWk7ntDMWSP1ysoYA7xNHLeeKjgCsN4C0pQD7N9iJ1P7PQazJ+7ujYlE9MJ6FiHVJ
         vgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pLKQ8GRADjxAI8oyFTdcTS6ksjBlovaTleIdKjPa2L0=;
        b=Y/45e5ebIakbr86LzawYwa4bvgowfTi0hO+tpkkF64KuCY1Gk7LYRYaFl8B47fQmzp
         JC5AnsZJv36Ka/XUazHOfXU6+TsMINc8rTNgwWorXl4Nk6JBK29Zs0Kqz0kf+wTtvBaE
         4+RNkCNsCfJbCAZD1TMqxY/V5IWefW1ObGNsMmki2UhZ4YbjNkBzKIgaMIj5tz3reQ1e
         ePaY6reG38CDZd/FvT8YMpPRfbgFu6ZfN7y7Q1d6bydG6Kgdfxg3OQm/KeySLM7qvObn
         aBleFP4oFa9/keTdgK8KoqNuwnwlb49omMEUtwH+nhcoTBYDcRW191yAiPhPPVX+WSqS
         hGPw==
X-Gm-Message-State: AJIora+bEZCAdpsjN/qeQ5R09a4HIC2FeuxoDzN99Us0MPBS2541MZ4C
        9lfTZMTvyGo9zWwSHC5KjdKIXA==
X-Google-Smtp-Source: AGRyM1tJ0znxa5Z5ViNToI5FRSKjqSzP58Wp2xGvtXxggdCNcB9vjsKpgX/k90698Gqby3I/m5qMaA==
X-Received: by 2002:a2e:2243:0:b0:25a:9dc3:fd81 with SMTP id i64-20020a2e2243000000b0025a9dc3fd81mr19071472lji.387.1657026259326;
        Tue, 05 Jul 2022 06:04:19 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o10-20020ac24e8a000000b0047255d21171sm5693697lfr.160.2022.07.05.06.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 06:04:18 -0700 (PDT)
Message-ID: <e08c849f-510e-3c97-6e0f-ba9a1f6db330@linaro.org>
Date:   Tue, 5 Jul 2022 16:04:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 07/14] arm64: dts: qcom: sm8350: drop USB PHY clock index
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220705114032.22787-1-johan+linaro@kernel.org>
 <20220705114032.22787-8-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220705114032.22787-8-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 14:40, Johan Hovold wrote:
> The QMP USB PHY provides a single clock so drop the redundant clock
> index.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
