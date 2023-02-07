Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D13868D449
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 11:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbjBGKcy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 05:32:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbjBGKcw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 05:32:52 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B0E24CA8
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 02:32:20 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id hx15so41868064ejc.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 02:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8BZxDuCycAd1fCc9k9fhvujofozc+ta9issSCRUI9Nk=;
        b=R2VkFDKf+iPdD2a3k8s04obMG9YVHq4XpfTfoVL+MRo5+b+33XFGdLi5IKztv2eqg0
         I/kLxjmxwdFpt8Nnoum2CKtVvYNkGnkKrbdZW3nZB0c4pS5ECCVhzaZmSeRx9aCgqQ2V
         P4IVgkPiF3SX9eg4i3w74Tz62CYpOfxFWgzVt7+JmMbo2jWgs1AWW5gWFFafboSL8l3D
         CL51gQMiwKQZNL8FmjqIPQws09xuHoPWj6u4mS8yWWRinAtDLyPAl6XYMaifeSRQJGZs
         MzvysHbzoR4vNsD1gBHZF79MkZbIeI9pZndp1VyL53ycU5Sv/bWV5O4I13peCdrJU67R
         owig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8BZxDuCycAd1fCc9k9fhvujofozc+ta9issSCRUI9Nk=;
        b=zdzBgKLjqQyKxcEHtjpHTELJxCe7UemQVRAfp5vjaxIoEV2ZkT47mXKMAO3rgBTqBD
         qzCDboMx3UPK9cGpox7rmLPJsvFfoBUP/ph2NI97teRvNMhVYTMLN53C/waANMPaleCx
         6unoQfb9wlk3Dt5+7VEjtV0cJJBbF9CkUs2PXRwrdb4M78wdmq/zYZAlFE9mGdkcWLBv
         AOcDusCpOhM7JTpjI4Q37kOdEtbJQX7U0jco5ZPH7lfLCLve17U7SjwLTgljY83HpweH
         eJm8c75QRQVPdfK+xV+gi28e/96Fuaa/7yDMFQL5jwn2gDK2Ibm+oSjXqCUi4jgMkw6c
         14Qw==
X-Gm-Message-State: AO0yUKWg8mQe1gVMPqiJoOKKX3H9mf7axkaynF3WYekttniXgN5mzpRf
        XPOecMsHD0rYZD57jVmtg3JGKw==
X-Google-Smtp-Source: AK7set+zqELopfv5DfjJbwt7pGlepRUBW5GRyGFrz1XjTSvVxUt1b5ryX1CAAkT2EMi2kjV6BowxMw==
X-Received: by 2002:a17:906:228b:b0:888:a06f:104b with SMTP id p11-20020a170906228b00b00888a06f104bmr3127945eja.36.1675765930386;
        Tue, 07 Feb 2023 02:32:10 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v9-20020a1709064e8900b0088e7fe75736sm6687491eju.1.2023.02.07.02.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 02:32:10 -0800 (PST)
Message-ID: <a188a52e-6327-f0ea-a54e-a23b88bca82f@linaro.org>
Date:   Tue, 7 Feb 2023 12:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: dma: qcom,bam-dma: add optional memory
 interconnect properties
Content-Language: en-GB
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230207-topic-sm8550-upstream-bam-dma-bindings-fix-v1-1-57dba71e8727@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230207-topic-sm8550-upstream-bam-dma-bindings-fix-v1-1-57dba71e8727@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/02/2023 12:03, Neil Armstrong wrote:
> Recents SoCs like the SM8450 or SM8550 requires memory interconnect
> in order to have functional DMA.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 6 ++++++
>   1 file changed, 6 insertions(+)

I suspect this will not work without a change for a driver.

-- 
With best wishes
Dmitry

