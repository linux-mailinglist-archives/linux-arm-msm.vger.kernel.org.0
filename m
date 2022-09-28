Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 206A95EE3D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 20:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234635AbiI1SFm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 14:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234567AbiI1SFl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 14:05:41 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B95FCA54
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 11:05:38 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id p5so15194111ljc.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 11:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=avQKUOu4lw23cs6/x3clKxPoK1YDt7piZdaJ0NJGp/k=;
        b=TjxUe8bDn3svsRCLEBMTTyN0VEWN1k0f2//DOPUg1nlcMcAYIXwpjPJfLHfHlz9ujG
         lDi/HeCLa4pTnYZO9GaFm9rOFkc456VSFy043LG8CGGriYFQtBpixfGul7Jxmpi2XXsT
         FMj9x6FCnIHaUCOioKf8i2Z4f78d/hwD0A40Fb3LuZrxegxNkfP0+OyY9gYzcEXAN08b
         cSrD6RQPIUy9w0QAJYbKGqk63l6iglupgrvJshHafR+yB9UT7pYqn7/1X6VtJnXv//Zn
         W2kFyjaLCSEGADdeKaZgNxOyTwaFyFLWO01S+MrKgFcjgaUH51UDY4VyMCNEULtUkezk
         sI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=avQKUOu4lw23cs6/x3clKxPoK1YDt7piZdaJ0NJGp/k=;
        b=bYZFypegPrIGXv+EAQI2di3p05DpjwfRmDZZBobqKd/A7goT91KGRtHL9BhNrR9B0R
         6qsBO1aZVOmfkw3H7F82jV860tLva2K9oYXSFDElT5qs5RdHeZdWej+IRJc1E6fwSPbc
         TiLMn/DA86YqfRaAEnFxkmY8KR4Cwnz/AiVfRnuz6NyoupOyLm16SUmbYjpx9VaXgyZ2
         ZxsOYvbibeM1YUCd2oD6ah+L7Cv1VfsYh0V3rhVv1FoMJ5KYmPWKTb+xIqxXqzz8suuc
         WysKym8WgA5dmsTnYxm+Dvaxu5WCJczpD+Vyd0/DxVyhpKWzOMes133ayScYrGkUR+74
         wmMQ==
X-Gm-Message-State: ACrzQf3SW/X84qly0+G97ad+M9sfbmR4H7rKz4yH1YeEz5nxHfo/MZ+6
        mttp96MOOnsGCaqNA70EZZaXzQ==
X-Google-Smtp-Source: AMsMyM4+buYUScbjJTuUsqd2b5ZcwP9zA8s+Us5xv5W/jZ8S/NjX7o/Sf546NPdx76G/1l5Dug51wA==
X-Received: by 2002:a2e:a887:0:b0:26a:ba85:8fbe with SMTP id m7-20020a2ea887000000b0026aba858fbemr11599034ljq.14.1664388337086;
        Wed, 28 Sep 2022 11:05:37 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a28-20020ac25e7c000000b0048a8c907fe9sm537098lfr.167.2022.09.28.11.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 11:05:36 -0700 (PDT)
Message-ID: <1d859da3-89c6-d08f-bc10-e5f39c1cd2d4@linaro.org>
Date:   Wed, 28 Sep 2022 20:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 7/7] arm: dts: qcom: mdm9615: remove useless amba
 subnode
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v1-0-b6e63a7df1e8@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v1-7-b6e63a7df1e8@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v1-7-b6e63a7df1e8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 11:14, Neil Armstrong wrote:
> Since amba node type has been deprecated, remove this subnode and

How device node can be deprecated? simple-bus is still supported, isn't it?


> move the mmc nodes in the main soc node.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

While reshuffling maybe move properties to match common style:
1. compatible
2. reg
3. ...
4. status (last)

> 
Best regards,
Krzysztof

