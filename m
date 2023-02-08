Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3925868EAF2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 10:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbjBHJQw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 04:16:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231430AbjBHJQI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 04:16:08 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB67F36FCF
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 01:14:28 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id j25so12503682wrc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 01:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LyYzirLtdl5bQvkAtHWV4AUpLzLISEB7q8alQocWH0M=;
        b=Age1qi/MrnoOSTVBuTseOWxpqJ4SJ1AEIXVNba85paHhHXxng8wBAS+9c9Do9HIail
         JfZ3vBZxSt2Ta2by6pbHVJM1TcclWhvjVPRK2MmSn9OPc44PLExVTKEtZ/n05D2Ro5oA
         mGczTfMN06lyP2Xc8/h/Dh/Ktl9KXjuivUSKwZNnQq2FEpuihvKw2dFpLsJlslpyYf7j
         Ca6HmNu3oyMHKH+MLEhMWa2bZayMdDrJY0KfIVyTTAU3hAQHuH8yBoMk/j0uhXgH8vX6
         VEwVe6lf7OB9i8EX7UuVUIJNAzwkrKdLgwv+0IdsSb2FqbuSkbFW9pkqepwXKsjnrVBc
         bqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyYzirLtdl5bQvkAtHWV4AUpLzLISEB7q8alQocWH0M=;
        b=BwnP3uwTPC5FDB0AMtzlG2XLtqdJ9xcLA3Fd/q0ZnCqRrC8wG56Yep3DwTGnw1Nsgt
         f8wjpjXSLBCljCmVPhTOcMgxImtysvX9Bs9fiG03gZvpdx6AzZO2XUcalVC2jDOscF/m
         apLudsQf8br/v5V0ZSFyIce3wvoi/VR6/8f624KayXSKsz4igxYOMF8+S/uSAFbB0zp6
         PzjNzB3K5kfxWXnWOCWQKN61KzLxfX37b8JEt1YZ6cSBVb8vSXunJgSXnRi9fVVOg9Av
         PLoXOv3Jshm+P/CRozNX1TCDAO6O9InfyfOn/TpiFngvko4X/yPH/1oIYpf4aEMI4uZm
         dOcg==
X-Gm-Message-State: AO0yUKXx/Rdyp4WpR7cRGowY7FDR+WB/7Q8f0sDtguQdr2UrTSuY4rGV
        kC8Z31MueEPq3hb5zWNlWPzA4A==
X-Google-Smtp-Source: AK7set9X1dUmFONyLvjJaMqkHhahmv6ypd+loT6WfcjkNNvaYBE9AxbkLLkTHvrJifRelZnxVSnQvQ==
X-Received: by 2002:adf:fa10:0:b0:2bf:ad43:8f08 with SMTP id m16-20020adffa10000000b002bfad438f08mr6151651wrr.14.1675847666563;
        Wed, 08 Feb 2023 01:14:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d68c4000000b002c3e4f2ffdbsm8219442wrw.58.2023.02.08.01.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 01:14:26 -0800 (PST)
Message-ID: <70311755-d599-39aa-192e-5957e736eadd@linaro.org>
Date:   Wed, 8 Feb 2023 10:14:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] dt-bindings: arm-smmu: Add compatible for SM8550 SoC
Content-Language: en-US
To:     neil.armstrong@linaro.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>
References: <20230207-topic-sm8550-upstream-smmu-bindings-v3-1-cb15a7123cfe@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207-topic-sm8550-upstream-smmu-bindings-v3-1-cb15a7123cfe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/02/2023 10:13, neil.armstrong@linaro.org wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> Add the SoC specific compatible for SM8550 implementing
> arm,mmu-500.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

