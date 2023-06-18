Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F242F734584
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jun 2023 10:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjFRIjJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Jun 2023 04:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjFRIjI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Jun 2023 04:39:08 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D0810E3
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jun 2023 01:39:06 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9829a5ae978so382529566b.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jun 2023 01:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687077545; x=1689669545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9UyA3hve3xqw+sdsT5ZWCGTlCEA9xRySCIjO+MMCiLQ=;
        b=gd6GWLW5N1St5Q4nYQfmRG9DQhWzeHHQldClzZTYzcuA4Cde5T0PZfHFRmhB+id7yQ
         9RL79p/I5SxHRGJqElqmEr0NuYPweTTopI7bU0ECo2Gn14e5lYJzUqdMrXK4BNarUwea
         3Mh3HlTogsKEIXhwIJJkEXiOzJP0WXCJc8uzyYZMCNtL47COxdHD1nbNTmvVfs7bxgQt
         +69vCKkeCTS7/2yaBn3QX5cYVfXPexWlTOilqc8Cmf8Tt3y9HqM7g9OYRLOwLBMBanAw
         OG7OFQEGwKos1m8HCp55hXkSu1PFzsSl2VeKL+qylKMsH48lcCRLiRZNCP5A0vY/zKRN
         AV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687077545; x=1689669545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9UyA3hve3xqw+sdsT5ZWCGTlCEA9xRySCIjO+MMCiLQ=;
        b=l+zcGjtBbTxacKX5+FmHSFdLQIn+aYp++Kl2AdH8lWb7D9EZOhiYwIXcb2hTQbRHqU
         VLOVgIGJ5T1A6wagNBCDRMt7YLtaENHuZkHCUnPEIiBqJhzmhbV9jkntEqZFb1iWMc8r
         kejTpW5pXejLmr67U8vfm44g/pYGF3SUPUxYwk9gWGQFFiPD4zwWdqa3YoJUf+8oHE7v
         kLXT4/fRaA5YYYhzyFF6LisESsLbS202d2xF8K6sM9MHmeHqDFnX7dzYhKv+7J+N1I+8
         pZ9exUHyfjYbm+C9BkHWChHj82dqumx26yQS+Uyp1ZN4KppC9d7DLyqJjabjQT6I9mdR
         xmOQ==
X-Gm-Message-State: AC+VfDwH8UeK8fW2C1+63hvEUunBVEQdKSQlx8wUgaVCZGad7SVxUd08
        7NgS8rvUjRHvgiIL2Az6Q1hR4Q==
X-Google-Smtp-Source: ACHHUZ6IBsZP/mUu94tjlGbEtnaYcAMXUk02/bHR4PWeAdpbSzxJIHffQyZbJ/q1chW8yOrQbwGChQ==
X-Received: by 2002:a17:907:7dab:b0:94e:8559:b5c5 with SMTP id oz43-20020a1709077dab00b0094e8559b5c5mr6878580ejc.64.1687077545201;
        Sun, 18 Jun 2023 01:39:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id s14-20020a170906354e00b009888b71c368sm293900eja.152.2023.06.18.01.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 01:39:04 -0700 (PDT)
Message-ID: <27b85110-9eb8-84dc-17a9-908e312e2e22@linaro.org>
Date:   Sun, 18 Jun 2023 10:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v8 02/11] dt-bindings: dma: Increase iommu maxItems for
 BAM DMA
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org, djakov@kernel.org,
        stephan@gerhold.net, Anders Roxell <anders.roxell@linaro.org>,
        Linux Kernel Functional Testing <lkft@linaro.org>
References: <20230526192210.3146896-1-bhupesh.sharma@linaro.org>
 <20230526192210.3146896-3-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230526192210.3146896-3-bhupesh.sharma@linaro.org>
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

On 26/05/2023 21:22, Bhupesh Sharma wrote:
> Since SM8450 BAM DMA engine supports five iommu entries,
> increase the maxItems in the iommu property section, without
> which 'dtbs_check' reports the following error:
> 
>   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb:
>     dma-controller@1dc4000: iommus: is too long

Also, please drop error message, because it is not true. The files do
not have such device node, so you cannot have such warning.

Please rewrite the commit msg to explain that certain devices, e.g.
sm8250, use more iommus.

Best regards,
Krzysztof

