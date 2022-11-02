Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76534616E44
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 21:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbiKBUHM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 16:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbiKBUHJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 16:07:09 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8FAD8A
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 13:07:08 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id fz10so26758qtb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 13:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fbq5wk+YnpgVUoRnBL4dHvxRhi/ztOzX0R7nT8jQOuY=;
        b=CnSuRn8uy5II05IgfRYmiBhSQjwdXvKKSHYIVMgF8Fd18KDyQJ396svHIJQWp6FFdm
         nhxjEGwijoi6Zw3fdgSN3RWs8jdRRVcU2GmoCFG3Z22tUFCFxOZavf+QMUOyhD9j8Wyj
         GglDb6aSJXHaATV2GCYAkvHIvyozn9GuP6djK878E7EAOOL9zHVJYplmQ2MX88AtfihC
         5++95nYv246NeEG1mJ1gnZhHidrxmeD8onYxQF2RchwEWda1rvtastPjOl8kxEwy+QWb
         7mR9tdw0xCJZAsn0XWj2MlpI+DVntOjRcLrj1OeE3p1QfXZ7xrSoa7es4kwfL3cUzBVo
         wwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fbq5wk+YnpgVUoRnBL4dHvxRhi/ztOzX0R7nT8jQOuY=;
        b=DvDvx1z1Qnt3HM0Us4t/pIhOIRl1YqEKRpD+06AfSwxxUqGoW7xhuLrR6wE3PDoiKw
         JUKUW7ljpVxKA/6IV8ZChi1PtH0EqLYvDSG7QvLIPYoKnyrLz+k5bLqL1ZUHqlju3xee
         DKBSX+Uh5qzsx1UgrQvF8nNcaQ3UlmB0dx9olysoHscNmqZkkM4FsSOVfqm5lFeu8EY6
         dgAJFboNLdstXeTlp+XxvU1Ea6m4zj1bSAEy0GUWr/v4ktrxLvcBvh4eQqU3WHXKW1G1
         33x0w50Heafn2VwpmMtTosuofMFDqVwsEGR5NpmvN3skg5BqBjmGEiPBLlnCZoOXULBZ
         /dAw==
X-Gm-Message-State: ACrzQf2B1P21irORv7u8WJtDIQd/j9GHvVEQ/3hXDztfPjaXYBoP/cum
        UO6w8SevILQV+lZDThhUJaX8Zg==
X-Google-Smtp-Source: AMsMyM5Kk/RZFdizMIz6HvnFAHCs4wChj8WG2oeMq3KPdRkT2jIPFcpEWmsZspWfStYa3jDdGZNn1A==
X-Received: by 2002:ac8:708d:0:b0:3a5:28e7:cb38 with SMTP id y13-20020ac8708d000000b003a528e7cb38mr12832931qto.120.1667419627407;
        Wed, 02 Nov 2022 13:07:07 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id x18-20020a05620a259200b006bc192d277csm9284763qko.10.2022.11.02.13.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 13:07:07 -0700 (PDT)
Message-ID: <396f9218-65fc-f640-f9b4-55f94e7e7b17@linaro.org>
Date:   Wed, 2 Nov 2022 16:07:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 05/12] arm64: dts: qcom: sc8280xp-pmics: Add PMK8280
 ADC7 block
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org
References: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
 <20221029051449.30678-6-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221029051449.30678-6-manivannan.sadhasivam@linaro.org>
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

On 29/10/2022 01:14, Manivannan Sadhasivam wrote:
> Add support for ADC7 block available in PMK8280 for reading the
> temperature via the AMUX pins.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 9 +++++++++

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

