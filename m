Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 870276F307F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 13:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbjEALcF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 07:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbjEALcE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 07:32:04 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3821B1FC0
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 04:31:35 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50bcb229adaso303275a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 04:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682940691; x=1685532691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PZh8lzqW1PdGGcPTkuZzp7gEY8POVeHJUZ2joiQgqWA=;
        b=AcwkELcYOoa4rvxnuDvsaicxJ09Varu+SNqqGCp4tzd00CLAslQEGN/NGNc+sMJ1ID
         rPnGmHSTpxDoqCbH2LgwZQMH56S5RraSlYhCMh7ZuVzxcEJqg2Dj+SJFeJ9iLIY2dfFr
         UDoT7YC8gPvYKlI9oo2EKvrxiVRulO9p/oaohTGYdBnZgiocUGTyhnRifYn/4Gr0iSN1
         3OrZnFwleObcxIOVLJo8EYHSBSVa6h1r1HssTEJiA8FK+V3XuPEMdjiBNeqjq5wPAl8e
         S6QscgWHEE/cokCZCRxYM3p2wnVbK4xw3Q2LXzKfjB8jC7hzrcGZvNM9VxJgT9R+BaGB
         MZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682940691; x=1685532691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PZh8lzqW1PdGGcPTkuZzp7gEY8POVeHJUZ2joiQgqWA=;
        b=YReN+WsqB/F8YHAaXlcf5FHvodhKpQIOGGnBnoRriYqKEb1TvTFBFh2YDgHjm3zsnI
         xhjPad5JAugAkIhGq6x0fBf90moZXEznVJYjpmCu9PH3NN0zdYPG8mxJDiFO8tKkU1Cp
         SUNPs6zFti3KMKkBvStv0HtylcOn7Vwsa8vhyLVMPE7PvUXed3YcEab0KqH/O+7w6RPk
         kbThq8DerVfErs/6FYA8xTyHTrYhz07Xs1cR/rCqn19aLeuUy3LR1Vq1ZnMueB5GdORY
         owxTxore95fhkzCgEFCZ6lZBnkXX8iI6KrAaUr2ApBx5DHOJNpSIkelzZ2Dw4RLAUHCk
         jFjg==
X-Gm-Message-State: AC+VfDziAwugIfFrIodRw5EFU+hI6dLCJf465+4qPgg83aZRHfVR2jQS
        Am7E+ZnmuK0KE4W/KwehXPD3gQ0+jd6FL6LpdJO3MQ==
X-Google-Smtp-Source: ACHHUZ6s5P98jYSzNqxgZLypUD6u59WpsMPno9ijElhRnIgZJFfh3twKi5tJqz+YQaNimXMOQAHAng==
X-Received: by 2002:a17:906:9754:b0:956:f4cd:96dd with SMTP id o20-20020a170906975400b00956f4cd96ddmr12783974ejy.55.1682940690704;
        Mon, 01 May 2023 04:31:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:637a:fd0c:58fd:9f00? ([2a02:810d:15c0:828:637a:fd0c:58fd:9f00])
        by smtp.gmail.com with ESMTPSA id c5-20020a170906d18500b0094e96e46cc0sm14608662ejz.69.2023.05.01.04.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 04:31:30 -0700 (PDT)
Message-ID: <645b24de-b381-b1d1-48b3-be76840838a4@linaro.org>
Date:   Mon, 1 May 2023 13:31:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: qrb4210-rb2: Fix CD gpio for
 SDHC2
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20230501105832.1185477-1-bhupesh.sharma@linaro.org>
 <20230501105832.1185477-3-bhupesh.sharma@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230501105832.1185477-3-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 12:58, Bhupesh Sharma wrote:
> Card-Detect (CD) gpio for SDHC2 is an active GPIO line. Fix the same.
> This allows the uSD card to be properly detected on the board.
> 
> Fixes: 8d58a8c0d930 ("arm64: dts: qcom: Add base qrb4210-rb2 board dts")
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

