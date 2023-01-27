Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2153767ED12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 19:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233585AbjA0SMf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 13:12:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233108AbjA0SMe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 13:12:34 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6EC1ADDE
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 10:12:32 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id j17so9456141lfr.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 10:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8KKYur1D6vGHF9gs814CKbLsD8Ur+nkTM9SmNPJrR/g=;
        b=suTe1IFat9G7xPogzM5K+2rXvHh21IiPvcS3F5KcxUKM7YqDxvkZdad5J1uSl8Wquo
         TL31iF/tM6S3Nduqu7hZGeQuqUTkQwqiDf14pl0jsVwTxKfImB9fZpQVPyHfj65htIfm
         Egt+n1ESiUF8/JMnog0cQP1zdS5oGPWmMO8p+4jhj0AneAmyXyopwUL4+StFTRL0UUib
         2fD/fLo6tUPG/keiW6CmwevnpNvl+PqmyH4uXTnStjTbIJE5gquULxmYBy+7hvMxZBQL
         rP1J16ahTUEvu+oyfnrnCZeWtFLIBjWWtFXV9zeO1t+q0sJRajwh8HOiGs8GUckcuPsd
         /Ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8KKYur1D6vGHF9gs814CKbLsD8Ur+nkTM9SmNPJrR/g=;
        b=SM/IPQA5pjlQI4xhabbmfgsn1l9Q7ErBcReu14vLg7JPVhsa7w9xuu7gOPH+CO8Qmh
         AZFNmj6vbLECFVRqjN7qWpr2vcKQRUjWcmW7rjvDoERGykq6N2XHd+Im/C7biavq22Co
         3hzIOZzDQAO1pFRPrvnJPZraabBgsfAg2AlVmXqpdjC58XbF4bHvn0hjA6HJBvkR7oOi
         Dyeg2FQUrXCFQ8bJpjdFPNTIiAoPEnhMvrgSItm26lLqBxr2tiFSl6NTxb6zKHky0HSY
         eWHIEhp1sjFm0XuC2zAjF7i8mHhTDa9fq0ecck5kJrMwP+iMRZbyifyXNjSU5RXCewon
         Kxjw==
X-Gm-Message-State: AFqh2kodX3km3MLhNeUqevB3I2P4ipHpgDbSjGAYLI31TmnMPt1Iu5m6
        b5VYMgCAlAZvNbTKb1JTKpxEeg==
X-Google-Smtp-Source: AMrXdXsFsbQF7dn1lPmxAQ3UIH7dlHwM40RfW0Pju0Ppy38dFJDTJHq7QJsm2acc7HxdmVtJOopEoQ==
X-Received: by 2002:a05:6512:32d4:b0:4b5:7925:8707 with SMTP id f20-20020a05651232d400b004b579258707mr11111863lfg.26.1674843151257;
        Fri, 27 Jan 2023 10:12:31 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g11-20020a0565123b8b00b00498fc3d4cfdsm317192lfv.189.2023.01.27.10.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 10:12:30 -0800 (PST)
Message-ID: <cf1b0a29-a145-6f47-dd8e-6cb619f54bad@linaro.org>
Date:   Fri, 27 Jan 2023 20:12:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] arm64: defconfig: enable SM8450 DISPCC clock driver
Content-Language: en-GB
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230127-topic-sm8450-upstream-defconfig-v1-1-93cf603db08b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230127-topic-sm8450-upstream-defconfig-v1-1-93cf603db08b@linaro.org>
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

On 27/01/2023 18:34, Neil Armstrong wrote:
> Build the Qualcomm SM8450 Display Clock Controller driver as a module
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

