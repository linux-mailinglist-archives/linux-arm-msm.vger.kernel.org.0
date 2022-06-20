Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77B66552421
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 20:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244822AbiFTSjl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 14:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243154AbiFTSjj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 14:39:39 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008A01FA5D
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 11:39:38 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id z7so16275191edm.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 11:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=JKAeft40sUsRlcGTUha85jWJsp7+o1BS7FIbJEy7PQI=;
        b=P5mtsZEMN2euYMa+6ApYzHzOaPhyh3tvai5uTPtKUD9wFrBEpl5PMzMr5hiiEadPCN
         Ysqv2SwkNx7xFOIQ9MbDYvHOCU5hAWUw9pGqNlfVeC7QfMXyBjYRsuyjwh/bFhtMbozC
         O0vR/qegdNmTYGGDufw9ypL2LwVFC0gbaWQzO9YNSR8xXSmyk0WQum6DvzM8yhfJqKcd
         5oh6ddPO6cYBAvRHwcDI8rmbA1ez8P1A2papH8S3gU4S5bwXKtjtAvtR8vYUaC1E/vLw
         LqiLOyqAhgRj42wxlw+NviwbaLPCfVxFaN8Lazd/gTXbFdsp68Bxsx33Fnk7Ik0o9CuM
         sPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JKAeft40sUsRlcGTUha85jWJsp7+o1BS7FIbJEy7PQI=;
        b=WqaVaeYExVy7Xo9XeMVNOw1obbTwILZCMjdrzRDLQYRnDB16pW/QDCR0tUeYjft7uJ
         a/Kwkwz4abXPXWvtk+RZseRVgialtmoXkxr74P+Dugyp4BlNvZ0yG5r4gm7j40rNP4iR
         h54QuY+mMxxVrB6sqS+Xz/RJSpiRHnM0JS/Mj6Kd4R/4tO1bIxmQuGViCrLLFlKO3oza
         aea9FGPImryUJmJvwBbBuGJrzdwglGY9dIIl8xB7xM769asYLYQ0KEc4XI7shFPY9DOs
         zQlK9DugeK4Cin+qXwEmyuJLTsb39kDKjdzR+M0OqbwRYyMCuDQyDZFlYi2DS6jVESxD
         IsEg==
X-Gm-Message-State: AJIora+SnkKAqgNFUtxNFVcLsP3vgwA3HJvm9VVfueXaSmsz52FZ1zEg
        m8uqM4yd0GiSuRmAdyi/qXDqNA==
X-Google-Smtp-Source: AGRyM1uTuIA1DvHeZwc0w2tjIx1TlGLNM7V3JpiMYF4qo4jIq1KL0yMZ0x36lQwBorwWhyKThvrdBQ==
X-Received: by 2002:a05:6402:3220:b0:435:8b50:e995 with SMTP id g32-20020a056402322000b004358b50e995mr4480311eda.293.1655750377574;
        Mon, 20 Jun 2022 11:39:37 -0700 (PDT)
Received: from [192.168.0.211] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id en26-20020a056402529a00b004357f391015sm3922286edb.97.2022.06.20.11.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 11:39:36 -0700 (PDT)
Message-ID: <09e8c5cf-12fc-a10e-dacd-338b7e271202@linaro.org>
Date:   Mon, 20 Jun 2022 20:39:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] mailbox: imx: fix duplicated initializer
Content-Language: en-US
To:     Peng Fan <peng.fan@nxp.com>, Jassi Brar <jassisinghbrar@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <20220501103428.111286-1-krzysztof.kozlowski@linaro.org>
 <20220501103428.111286-2-krzysztof.kozlowski@linaro.org>
 <DU0PR04MB9417AFDAFE3F06B3F9274E1888C49@DU0PR04MB9417.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DU0PR04MB9417AFDAFE3F06B3F9274E1888C49@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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

On 07/05/2022 08:52, Peng Fan wrote:
>> Subject: [PATCH 2/2] mailbox: imx: fix duplicated initializer
>>
>> rxdb field is being initialized twice:
>>
>>   drivers/mailbox/imx-mailbox.c:889:19: error: initialized field overwritten [-
>> Werror=override-init]
>>     889 |         .rxdb   = imx_mu_generic_rxdb,
>>
>> Fixes: 315d2e562418 ("mailbox: imx: introduce rxdb callback")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Thanks for the review. This was a month ago... Anyone willing to pick it up?


Best regards,
Krzysztof
