Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF3F667C760
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 10:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236954AbjAZJch (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 04:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236943AbjAZJcg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 04:32:36 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA151714B
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 01:32:35 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id h16so1088785wrz.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 01:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A0TPmPJSYgwZI01KoizEMxU8uzNRTKZqt5rmxC0coh0=;
        b=n+kkbEZRPYim6WMOzFzEeV9VD2D5jFr29obprhnDJxN8T2pd065ZCKawU4RgKyg+uH
         klNpg1Hk85PmdjVtcBVU6xLlwQYjmJ6dccJpcWtSkKaFwWEwhbLdqOFagTtpFd93fiHo
         Hsz3oyAbRzvN8EwdR6ZoH/1wPDeAVLnhIVg3E3luSmdIuoQwDIpjGpX8uLyVPxWMMGWe
         DUkuxT+/wc2xQjQhOcOxChkCYH6D3AG038VmcAe0YNs5AE0tY6+gnCqR8MB2D6XXvuZo
         PYnDhrFPwiT3ZdOnunUqa2uNZdb9MEhdhe0uTHu6fatYj6J+qgnkF69Bexiy4QBRcqWP
         81JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A0TPmPJSYgwZI01KoizEMxU8uzNRTKZqt5rmxC0coh0=;
        b=HE2whCteaOjX/YwT/BU/m47Pp/r7wRL183gUxrR7qTphfQdjTrLN27pGOY8D15GXhS
         uvPqjIGV9An6VjDI/0sHtJtoUYxVjrxLPCWW3jHR1sGsX4NHPJwPwoJrydgOwWmXKpJB
         IxZResvwNeKvUom2silxDpRwRu3uZ5tE87Lepi33bxWNEpePo9LuBlwN+9kwtxtEkyMe
         zV43kpAjhib6WRcoKXyFx974iRXyFZH6bI4d9xJ8SkhVmgNu44fSg2c77kWM0SJMXyUE
         opzW2Bum+/Huq58Dv0FQEg7aFWXi3c1n8bbB3v3UtzR97bZ4P2EgNbelCX1alj6R8RJ6
         iuyg==
X-Gm-Message-State: AFqh2kpbiVGN2UOqFP0cC200euMDSjnY6ppwGMLOrdrmZO0Qd7ETuTZ+
        nwgvbGwwjzt82ymgRBR/XgYb7g==
X-Google-Smtp-Source: AMrXdXtAqvvKsmbMfweAIeym+HqMgvNwTpWE1mOru+abJSqyt8jlWiZDlC23RjK3bXbzGAJCQxej5A==
X-Received: by 2002:a5d:4eca:0:b0:2be:47d7:b56a with SMTP id s10-20020a5d4eca000000b002be47d7b56amr22690390wrv.11.1674725553524;
        Thu, 26 Jan 2023 01:32:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600010ce00b0029e1aa67fd2sm749332wrx.115.2023.01.26.01.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 01:32:33 -0800 (PST)
Message-ID: <e727d166-431f-fbe5-6d2d-7fe454ad560c@linaro.org>
Date:   Thu, 26 Jan 2023 10:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/3] clk: qcom: cpu-8996: add missing cputype include
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230123201812.1230039-1-krzysztof.kozlowski@linaro.org>
 <5e790f5b2d77a19f78e217c68b5bc0eb.sboyd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5e790f5b2d77a19f78e217c68b5bc0eb.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/01/2023 21:33, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2023-01-23 12:18:10)
>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>> index ee76ef958d31..40c4dabc20a7 100644
>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>> @@ -49,6 +49,7 @@
>>   * detect voltage droops.
>>   */
>>  
>> +#include <asm/cputype.h>
> 
> Please include asm headers after linux headers

Ack

Best regards,
Krzysztof

