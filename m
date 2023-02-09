Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CEAB690379
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 10:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbjBIJXn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 04:23:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbjBIJX0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 04:23:26 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA0A212B
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 01:22:57 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso3381587wms.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 01:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hRDPjJEtovAtsDTPJmweqDqnJ8pm4J/3sVR0PjooZq4=;
        b=qrbhNEzrVciHWSGB0FCNAVdNRzDPYVWHpSu5B2I8GrO6DPFPRGEHbxJxc8mcJgnHjH
         nevjeTXWAQ2u0pJ58DIYzVwBIePSQEW8ThUsSi8n98xbWCHNOFyCwZLS58Z5d5MPW5jf
         vNDShFscJY53hIWja2/BtDf8tWRBIKcBiqNHqxeb2+DIp6r6fsdA3qo93+oCXf1tiToz
         uzHepLymIAt6a+NFHM3cYcuMXGLgcDfwjfCu5lKxWj/U85HaGeuS+HCTOxVy3fhAwU4r
         fXRuEtyB1gazZoE5BCtBYHVfsXxVwUKtIIkfRSHZLZL0WcZRrGXWMMcXfMEMZ7cqhSEq
         zJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hRDPjJEtovAtsDTPJmweqDqnJ8pm4J/3sVR0PjooZq4=;
        b=XhL1mvXc9coLzPrONm24+Ww6xvy+2gL1f+6nbgvR9gVKYcLa+bZAcipNR9lBIjj67E
         Yn0nGaVZs15g3CpBM5P7CotOU//n1JuMC0xTPjX54ZHSr2w9lMnv+HtvBFgU4MQNwHK5
         CFEpfPT+diwD3IbvxVGRIw8UteYqeBGEhLYRI6xU04BR2SvOUed3v6Gzj2q5nLHA77xF
         9vsrmp1X8Cut+5KVH0H2kz5z12CcOTq82zVXUel96k1Yo35EvpyDm0fY7VkjynFJG3oJ
         GabPl7hQmNcCXOP5UIzcsryFuUr14203ac4PkjY61p/5pJrmCa63EBjlg7sIN77Sqymh
         663A==
X-Gm-Message-State: AO0yUKX2CpfYapNZOe+57ZzMKjoaizFzPrLzio7Iax+qbOiO/8sijHNs
        xRzJzLKKYXrJ2ldjk4n4MsrZfQ==
X-Google-Smtp-Source: AK7set/4ypNQZDAdHbpOxgdeCGzHEi/WqfLubfCVd81zqqc4wYTRVOVy48OKcSqNAVd9hfuy2tDorg==
X-Received: by 2002:a05:600c:4a9c:b0:3dd:1b6f:4f30 with SMTP id b28-20020a05600c4a9c00b003dd1b6f4f30mr12700280wmp.3.1675934575318;
        Thu, 09 Feb 2023 01:22:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x7-20020a05600c188700b003cffd3c3d6csm1256451wmp.12.2023.02.09.01.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 01:22:54 -0800 (PST)
Message-ID: <331c47d4-18a6-82ca-c0ff-47929ec506dd@linaro.org>
Date:   Thu, 9 Feb 2023 10:22:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v9 07/14] arm: dts: qcom: ipq4019: update a compatible for
 QCE IP on IPQ4019 SoC
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20230208183755.2907771-1-vladimir.zapolskiy@linaro.org>
 <20230208183755.2907771-8-vladimir.zapolskiy@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208183755.2907771-8-vladimir.zapolskiy@linaro.org>
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

On 08/02/2023 19:37, Vladimir Zapolskiy wrote:
> Change the old deprecated compatible name to a new one, which is specific
> to IPQ4019 SoC.
> 

Your changeset is not bisectable, but that's expected. What is expected
is to explicitly say in commit msg, that DTS patches must be taken in
next cycle. This patch must wait as it breaks all in-tree and
out-of-tree users.

Also location of this patch in the patchset is not correct - cannot be
taken before the drivers.

Best regards,
Krzysztof

