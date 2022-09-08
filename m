Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBBE5B2045
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 16:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbiIHONT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 10:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbiIHONO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 10:13:14 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32664CD530
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 07:13:09 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f11so13937128lfa.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=2MNJZ8ao7kChz3JZ1P4cWdAjRMsNoUFerCDiyPhd8zY=;
        b=BbsYxPnygC+UUsy5x8kQmh5+frVuzw4jopebiAy+ogTbSDFhHYT2E47jAFJEbXAfxW
         cRTwiZdo+PH+kHAw15DZr4HFuXKw31ZP1VncQ1GIiumR7nbv43nG+jzjzYvQuiSD/bF+
         1PdgAKVY5AnpYtQZR7lUV15c4cfsdBG3RFEzDtZ4C0ijAq3ZpTH7hsnx6yLWtGh/wegV
         RO0o7q1krnqWQuKQu/+bp/fsa3Cjrw6gQ/uJ/zGQuVFITzg9LgKZfTiQwcoZK/ms5RT3
         wFlOvYpr6oVMzNOWRZ6+rQk1uFplrM5sa3MSR+GjgoU2Ru63uCla/ZCyJiIWE202cNei
         IW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2MNJZ8ao7kChz3JZ1P4cWdAjRMsNoUFerCDiyPhd8zY=;
        b=aW0y1jKz2WR4xGaEMtXi+ugMrHW1sHWbeTUU9DaX/AbMJNmAUTxiGkhwM8T00RttPA
         99Q73L5O+QLziZBxukHkKeMAYeaF5liSa4zot/PtxWDMkzwqLsO7/kuifU73D7Tmvtzo
         M+PJR9M+l6L4WgdD4wG/J0EfXl7suqueg36QGPW+fXrGfX8ZmBW0kVS0iTYwu2MFE4mT
         EcmR+z7IQiZLbhL1qHm91Kx1UkrbXLluePQobW6wEJs67JdgdI8i28J5YAqNiA8AkQiH
         KCRaoe91Ji8xGaGHVHqvY50pUs3HXB4npdvqUQUUyVRjWCYyPJUJPMJ2LIzzIG/g/M+m
         a68w==
X-Gm-Message-State: ACgBeo2d7kjYpUdYkSV2gWWnEKe8J8YdsdiXvZ7zTww0A782T3PBC7F3
        +/brup/4/KlfIk6ZVUrsXuMp2A==
X-Google-Smtp-Source: AA6agR57D0oly3dEICkaWtRKVBvCjuIaV3xt1kquRZ7MjoSCwPrV6h3MaQlAh2VlvluXhYv8zRSmFA==
X-Received: by 2002:a05:6512:3765:b0:492:d076:9f77 with SMTP id z5-20020a056512376500b00492d0769f77mr2597717lft.247.1662646388765;
        Thu, 08 Sep 2022 07:13:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u9-20020a056512094900b0048b143c09c2sm3047269lft.259.2022.09.08.07.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 07:13:08 -0700 (PDT)
Message-ID: <de5d97d6-2d0a-8fef-e254-16a533d071f8@linaro.org>
Date:   Thu, 8 Sep 2022 16:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 10/11] arm64: dts: qcom: sdm845: Drop redundant phy-names
 from DSI controller
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
 <20220907000105.786265-11-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907000105.786265-11-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 02:01, Bryan O'Donoghue wrote:
> phy-names has been marked deprecated. Remove it from the sdm845 DSI
> controller block.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
