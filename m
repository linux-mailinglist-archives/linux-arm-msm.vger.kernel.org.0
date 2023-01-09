Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A41E662EAB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 19:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235310AbjAISU1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 13:20:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237670AbjAISTw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 13:19:52 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA3D568A7
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 10:16:45 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id r2so9094642wrv.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 10:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0suPC5TVLcS8nNGO/uxkyjzB0A8aNEq3nFa8/ScbpjU=;
        b=lfafRM5yH69X40B9JehSTLUaUEOVvfYvekBP+PRdeEB6cSwFb6XsJLduJckiK4qi3j
         Hd+Ib6grHgYmcYpmU5WPry8+7bieIofFptuhlFMaEkmaPjnvgfZI0o5Sq7CHYw46Z8OF
         2B4+PeyzQMSEwl5ADeTVx0vgINlqYo1Z20UQ4v1MhzGuBJ+65U3x47yU8/qBViE5b/Da
         5q9JZNeZp2C2+7lZUc5KblUxCT4/DFOwyHinGP7BwXQtJbsa5lvdsyFvY2g/WAFvMPdd
         U4ERaS1CIXyOxjirbodTQhkvu5KOaiJsAuzH9V6Ax42e28WWkAK8ERRMZ6aFuXvt3ur3
         FL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0suPC5TVLcS8nNGO/uxkyjzB0A8aNEq3nFa8/ScbpjU=;
        b=BujZKz1LSvNgMR05dDXt6+CoZJQC4n2Wy3uc8jAY6NiaeOLgqfA62nI7fyEwXM4fav
         7BZX3OKrkUlf7S52ZHc6rZYDCeSrDqGzR1tP+cZDzPPR9ViO+6eBPqO/B5qlByUA/AZI
         ZllEkSKmYwwhmu8j69kd1iv/zRYFQrRkE3KoaNnzqPE3NPEcezQRkymG1zRQauvB/EiC
         htcmANhrFqJf+fxn+E3MyxQl6jWJ/DhmuvWa5kU4NZVM63B+7vdkMfw+7v3SSnXBB7bg
         jdSN1dQM38S3sEN4OmzWf9cX93iufLkNKVK5iCCFlaR9ySo4RUe74q4awgTFaFjXgGLa
         p2/A==
X-Gm-Message-State: AFqh2kpvur+bazj/bhC98frVMHKYpspWYzwacl9jloMDxNgRY3AKYPRt
        RZ8R/cZ/Ev/ZutsAm50+krxItA==
X-Google-Smtp-Source: AMrXdXvw49czkPeS8nF7GItRYhDkccRG8n6dXrFwd8g49mIBf/wNufVk2oW7rchwxmaWTY320P8rlQ==
X-Received: by 2002:a05:6000:10d2:b0:299:4e2f:fca6 with SMTP id b18-20020a05600010d200b002994e2ffca6mr17221430wrx.58.1673288203699;
        Mon, 09 Jan 2023 10:16:43 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a11-20020a5d508b000000b002779dab8d85sm9077169wrt.8.2023.01.09.10.16.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 10:16:43 -0800 (PST)
Message-ID: <10d1c870-5ddb-163b-11d5-c29d8ee14f62@linaro.org>
Date:   Mon, 9 Jan 2023 19:16:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 04/18] dt-bindings: clock: qcom-rpmhcc: document the clock
 for sa8775p
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230109174511.1740856-1-brgl@bgdev.pl>
 <20230109174511.1740856-5-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109174511.1740856-5-brgl@bgdev.pl>
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

On 09/01/2023 18:44, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a new compatible for SA8775P platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

