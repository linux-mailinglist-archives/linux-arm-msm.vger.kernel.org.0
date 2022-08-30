Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40A275A6B46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 19:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiH3RwS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 13:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbiH3RwC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 13:52:02 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE8E411CF8A
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 10:48:25 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id k22so12160326ljg.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 10:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=PSuf5+uKyRCAUiI+NXml1CeEx283tkYLDjiJC0rmPIc=;
        b=Pa38oV3EVhdVuxDZfh0mLFLLZj0UBeyf9wUuaxsSKLBOQMSwP/+JXnyg/+1bYSvB6P
         clumNFaYdbLtvk3RCoO7z7tXkfk3qhapicwWk09WHdnxzWc6l/jfpXnmuEU6KnrEz6Kt
         VofAZ3ldyFZosiRqzUpeLIlIMVS5EmYCySQI7+EOvU+4cABLf/SL19ENqRy7bEdgXjgl
         v1/C7lRGBdGDQM+im6QASqFK3eALWIvAwXYcsU/o7jVMguTS3WO9LcyxT/iQR3MKPL/T
         5U0Lw0y9tdW7IwO+/VcodE8+Mip00rT3Vv6Vl3fb1N3QUAG1skvdmwM8K6uAuldeB38q
         PIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=PSuf5+uKyRCAUiI+NXml1CeEx283tkYLDjiJC0rmPIc=;
        b=AoNw4FFFgC+RTCwD3z9s/V0F5NCn7faHpTihOp7+ez+sh5W/5Wjpd+mKw9rna7EX/3
         5RTwJ9LDYw3IrYGpqTGk8RNODPI5fqnX4CvocUtT9GWyV5nY61MRQrgiG66uyRrZ3yX4
         YWgqYfb2oyh9uXzxg6GNfV9aKSLELieB5PLkqXSUDmoJ5AEqtgPDK0ydIGor4f+qDZMx
         DyLZ+YR47IT2zVMhbLyRZFQj4qkse2sv+JCDFGwdasHrkA+HO4Q9AfFudWgR8n6WXfXq
         6FbmnrY5q+y342ZqSqlSElo8uuZzqVTzEQOuknxuwW5GSI4OAoYpCsa/LwFqfrSJtACL
         CmvQ==
X-Gm-Message-State: ACgBeo11CBRyb7XIpSZXKN09qNfbyNzBRMANLrCMmHho3q7zQNGNGVJ3
        RsQU9a8GGqo4ttOs2mcQniJ68w==
X-Google-Smtp-Source: AA6agR7HZ6jJHiaVODBD57pgKGHlsu+AMUYygh3v4y+9xL4VMk3jrHV/vfKt6fcZwoaqiu0Yk7UBwg==
X-Received: by 2002:a05:651c:905:b0:261:d00c:e71 with SMTP id e5-20020a05651c090500b00261d00c0e71mr7370638ljq.407.1661881702529;
        Tue, 30 Aug 2022 10:48:22 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id n2-20020a05651203e200b0048a757d1303sm997253lfq.217.2022.08.30.10.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 10:48:22 -0700 (PDT)
Message-ID: <3c319873-72c9-632c-7c32-4ee909aa1e64@linaro.org>
Date:   Tue, 30 Aug 2022 20:48:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/3] slimbus: qcom-ngd: use correct error in message of
 pdr_add_lookup() failure
Content-Language: en-US
To:     Jeff Johnson <quic_jjohnson@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Cc:     stable@vger.kernel.org
References: <20220830121359.634344-1-krzysztof.kozlowski@linaro.org>
 <a437b91a-281d-56b3-41bf-15d9593ece74@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a437b91a-281d-56b3-41bf-15d9593ece74@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/08/2022 20:33, Jeff Johnson wrote:
> On 8/30/2022 5:13 AM, Krzysztof Kozlowski wrote:
>> Use cprrect error code, instead of previous 'ret' value, when printing
> 
> s/cprrect/correct/
> 

Thanks. I'll fix it.

Best regards,
Krzysztof
