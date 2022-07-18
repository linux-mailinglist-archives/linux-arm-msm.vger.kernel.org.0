Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 497A9578574
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 16:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234889AbiGROaq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 10:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234781AbiGROaa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 10:30:30 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D081C920
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 07:30:29 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id t1so19612121lft.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 07:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yGzBcnIR8gnhNP8TbCXArntI6WydijgCYOQATQgi/hg=;
        b=a4y+HT/Qw6BSHRoP9vACpK1VlKGnPtYNOpiWlQ3SkNlxhupWBeDKQ6fjMiZYzzJItI
         sa6Gg0cCAC4k0bp5o5w2iVTRw//E5CkhKbu79i78oO4b72tfHwHwsJvxZ1V1v5AwGYnZ
         Ms/Xkh1Wd5AIIGOdKuiAwYrxrCV88X4EO2SG8HvrqoAmxpvS7x+N3OzT8wdHx/6iPzTd
         Nv8E11tUMU1TTIaA4JK8Ze3o+d569B2PmNOyvd5VusJ/M22EUHaL2Sl/RXLwHTWcuHyT
         4kALWpCgDQnZXLRgvbYvHwArr5zxmZFiHCcOXFG0VefL7i6JlI+V8ql+HhxIrBiDRWKn
         QlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yGzBcnIR8gnhNP8TbCXArntI6WydijgCYOQATQgi/hg=;
        b=mF4Ur4Me4+1r2q2jRTqr1JnYskPAQp/WLPJi6cXCMtSPsaZCYHIn+UDKAWfbFVD3jk
         Uiu2hrlKojoH24m1EDrW3kebnnq/HctAI8mqGeuaPX8B7Q1JgtOeqDAf6S+Fh5xs8peU
         IFfVqXXSZyeLeC1DAPJyCtIhUHhRW80o8F+uvQGM1+Q+iVdgqDkRyQ0W/omOX+qJX1md
         mMlpjv5B5pJXg7OK4vAM/ixUztWe9IBZksWw7UCjtVyza2bgGWZfBv9kf35E2sFsnQqG
         0vWBWo+CyQn178aGgEJ4l9nCo6N5uAstjmCAd7Nya1oE8QKg8aOrmr5Yjmw2mKTX3VNo
         5mww==
X-Gm-Message-State: AJIora/avL+p49k6i39y7bcbs7OBcXm60lZf7UU+jHwBaInAYCdgbJR5
        dCYcmDJ+4Y8CK8GysG3GfqtbAQ==
X-Google-Smtp-Source: AGRyM1uiEmPF8T4kOGGXhvsc8apPta0lzgE4syolmluzy1g2FHmEL0UNC5fW4nmtwQDT3G4NfB2auA==
X-Received: by 2002:a05:6512:3c86:b0:489:cef9:18bd with SMTP id h6-20020a0565123c8600b00489cef918bdmr14690203lfv.386.1658154628261;
        Mon, 18 Jul 2022 07:30:28 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id r10-20020a2e8e2a000000b0025d53cbba2bsm2137642ljk.45.2022.07.18.07.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 07:30:27 -0700 (PDT)
Message-ID: <e898be38-dd0d-04c4-7152-ab16cc027c7d@linaro.org>
Date:   Mon, 18 Jul 2022 16:30:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/6] dt-bindings: mailbox: qcom-ipcc: Add SM6375
 compatible
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220716193257.456023-1-konrad.dybcio@somainline.org>
 <20220716193257.456023-6-konrad.dybcio@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220716193257.456023-6-konrad.dybcio@somainline.org>
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

On 16/07/2022 21:32, Konrad Dybcio wrote:
> Add a compatible for SM6375.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
