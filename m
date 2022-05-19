Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26D4252D128
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 13:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237267AbiESLJM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 07:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237130AbiESLJL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 07:09:11 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B8EB0421
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 04:09:08 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id m6so5833020ljb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 04:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=d9tsDzycNDQtyXb+uzUhE/Vj3/eBul9/CRUr39TZ7YM=;
        b=tvEsLWk3oy5qYfUCcCnVNJNqpOEnBOhzyZDZUkaVXXsdEVlOTgYN59oUlIizbV3K4s
         D2WJt1YzT8vpjaaOpTnMvPkO5W91XTUbuGZzG+UnQT1p7FayUURJ6tcqy7Q/Og7EDHLn
         jBNgrJkmsBJNU65K4C9Cy0Gfz3iGhDie5JBv7jTcGmrrOubpi+5RK7KGaSubtivuYQQJ
         W7XcKPMkvAe/gpNSw8kAV+5SJu7fZichfL0qcWaAdvSl9Wl8LrlA9CUBjVs00fyyn0r3
         g7Id/6p6Bpm/iCSp4wndiSYLtoPGvY0FAxWUSy8OLYshQ3wKHXXOUrFNB6b6MUZVrElt
         wshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=d9tsDzycNDQtyXb+uzUhE/Vj3/eBul9/CRUr39TZ7YM=;
        b=tWTh8e5TbDfmczqMYOy8O/L3TFml2jOdqdcYrQ0AxYSyQ4BY9oDe3NNjUoVpJk46c+
         rhYb/uWmtlT0CDSLg2E86OYJInSdFPl8zbAjMwTzfGFEAVU8VJtu5an3uWeHyOvqPAfC
         pNrO5Zcon+ULC7b/CeT4szzsI2MWdCTM4lHmh0YpyUvuPqMGjcRrBaxTAfZxbVic2kht
         jJqChbG7gpqZLiScV9SxU/DicfDJx/2Gu/lSaGyevMt51Jzm5hfwtSWugm8soVf+VZqK
         qUUxohuJw9pb2K7Q7PkY717C0tUuXY5oGJNirrjYVtoXSL4WJlZncMoouWr7H25gpduA
         zZSQ==
X-Gm-Message-State: AOAM533gZ3GDa0ItnBwN4DnCRMa9e5TMBozBrVAxJffvhbSMlgqCRLQ7
        dq975rA7VS92qxe+cLZTcBO6yA==
X-Google-Smtp-Source: ABdhPJygQr09G7a7f1Eid+lKDW1Ht335u5ibdZu4/60chhKSqwbj8nDeaJfqLkos6Ah1zqEuywyxKQ==
X-Received: by 2002:a2e:9e41:0:b0:253:c37c:378b with SMTP id g1-20020a2e9e41000000b00253c37c378bmr2333147ljk.202.1652958546776;
        Thu, 19 May 2022 04:09:06 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m18-20020ac24292000000b00477a6c2d2e3sm251405lfh.229.2022.05.19.04.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 04:09:06 -0700 (PDT)
Message-ID: <7f9418b5-cc1f-bb9c-583e-97490fc69684@linaro.org>
Date:   Thu, 19 May 2022 13:09:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 1/6] dt-bindings: regulator: qcom,spmi-regulator:
 Convert to dtschema
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        konrad.dybcio@somainline.org
References: <20220518184825.1034976-1-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220518184825.1034976-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/2022 20:48, Robert Marko wrote:
> Convert the bindings of Qualcomm SPMI regulators to DT schema.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
