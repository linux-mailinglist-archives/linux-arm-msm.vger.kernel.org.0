Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 945C976093F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 07:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbjGYFaY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 01:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbjGYFaW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 01:30:22 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5BBE63
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 22:30:21 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5222b917e0cso2725805a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 22:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690263019; x=1690867819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1i2zWfm36M7TT6mJHnydMf+conT/uzk+/rcD1c9IUY=;
        b=pwsvAN1AB0Jd1oPsxQZpEB5jiOew6CGd0NU+EOgnwNNcrNRFxL+UccY35Lf3X01rOm
         RiY52C+tPcuL65mB7f/Klo6vMXAPzkqepZOjBgP5ETQw7bijpiBUR8+zLT6gCwhJUWL0
         xxUa9poW95nDTz/PUVq15kSjJv/JEjkq5tZmqBjAKCRiY7wJ6u+23AE5756oV25+9cpR
         Zvbs4N9zj21udYPQVQwg4UoqwHpn+V5rVGhfLWYEvtIQhb2sKPvI/X+MDi4NVXfdbZhO
         pZnwL1k1OsBU0iEei+EhNHwRi4fD2DCuYpHgfk+mXfVd1rSpPo9F1a9NAQhcsLQKFReP
         IU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690263019; x=1690867819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1i2zWfm36M7TT6mJHnydMf+conT/uzk+/rcD1c9IUY=;
        b=kgaYnM/vcEwKsoBhX6UgTzGCus4bWzMZ0w1vA2z44AHmSkq+AFODR2haWP/+LbAlyK
         iLbfmb4xbIE5Dv+xvXRU6QyvUZ9VGeVBtQlkRjz4ltqHLXJXUG8RjfOGRh/DyRkG7gXc
         KPVumUI84PLjbkE1S1hPJ/wSQ1mMDOQs+atnbuZI5/6kJKxjBfjSfEiu/Hyo8ckeBWsD
         nQMdyKtMGKnwu07hKK8znLoy+j/eOhJd2UDSDgI+zvGRprJWKeERUZHG1rHpYm93eRg+
         qnHUO8ymsO+hOu2qxrVr3+mFVHa3smLMtLjWUZVPiTQOMFV5K5Ahjirk6tiH2V8UoeST
         4QeQ==
X-Gm-Message-State: ABy/qLa+mKl6qkg4GYDj0ziNNma/Owp8JdEkOvJB9IGJ/uyL1f48yslr
        VNCFJETC5MWUKX7KNpl1+Z2FEFKmveS5cQ7ki7I=
X-Google-Smtp-Source: APBJJlFjWBLnaPFbc30deacgydoAvShI5DbXQb3l0xEAThTRsdL4GGjBO3FocuEFhU1FvuGDUxy1cQ==
X-Received: by 2002:a17:906:197:b0:99b:627b:e96d with SMTP id 23-20020a170906019700b0099b627be96dmr10602014ejb.44.1690263019701;
        Mon, 24 Jul 2023 22:30:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id bn5-20020a170906c0c500b0098f33157e7dsm7670850ejb.82.2023.07.24.22.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 22:30:13 -0700 (PDT)
Message-ID: <40e3d1d7-468a-c822-6f2c-6c46f4a02f5d@linaro.org>
Date:   Tue, 25 Jul 2023 07:30:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8150: Fix the I2C7 interrupt
To:     qaz6750 lzy <qaz6750@outlook.com>, konrad.dybcio@linaro.org,
        agross@kernel.org, andersson@kernel.org
Cc:     conor+dt@kernel.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org
References: <SY7P282MB37872A5CB962A92934C83125B203A@SY7P282MB3787.AUSP282.PROD.OUTLOOK.COM>
 <SY7P282MB378789DB6E1F86190DA3068CB203A@SY7P282MB3787.AUSP282.PROD.OUTLOOK.COM>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SY7P282MB378789DB6E1F86190DA3068CB203A@SY7P282MB3787.AUSP282.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/07/2023 04:33, qaz6750 lzy wrote:
> I2C6 and I2C7 use the same interrupts, which is incorrect.
> In the downstream kernel, I2C7 has interrupts of 608 instead of 607.
> 
> Signed-off-by: qaz6750 lzy <qaz6750@outlook.com>

Neither From field nor Signed-off-by have the full name you mentioned
before.

Also: Do not attach (thread) your patchsets to some other threads
(unrelated or older versions). This buries them deep in the mailbox and
might interfere with applying entire sets.

Best regards,
Krzysztof

