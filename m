Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7B5471677F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 17:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbjE3PsG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 11:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232569AbjE3Pry (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 11:47:54 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBAB10C
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 08:47:39 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3078a3f3b5fso4560900f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 08:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685461658; x=1688053658;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LzcHJ5N47jbcQgg3gy8V4hezxG1EIwZMZwvr2QGN8DU=;
        b=CuqkGjN4WOnSTTNgcn2tWVuOskO6K/bFIbN+OJmXMKWcyoKXqPVgOlWPiiaK5RTokw
         0ra5zf17v8KgRkZhpatpeTILa/IIQcaGz5V1e4Fwbz0xskamzNq/VsiRvtvG52qV68o5
         sXSqGJMpAp2SgTJ5E9iRckLvkVO7A2AuvfFQmw2ssxTdkcFFNoQs22a9smnMfFB8glyD
         Cg+68n7t0TdUTKkuCXfCEbLJGtR3YEOu/RcKFeQ7KruK2mHGprGbl8yhsF5xUsRMEACt
         1aWQtZ4RXVLnA5OTDV8TE6IoH7ENQl8/aA2LjPkLAVMa3fmRdR4eNJ7+iREVJVyHlLaz
         7ONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685461658; x=1688053658;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LzcHJ5N47jbcQgg3gy8V4hezxG1EIwZMZwvr2QGN8DU=;
        b=Cx8VMVhGTewAWzzF+HpbWARBzYjD0XriY3bbN1w7+FQFj5ziSjCKPvrCjeXB88hxrP
         2ilPcMVhkxkT+HGu+hZAdE5KishkzTgj9QPKHj+IGiPmc8mdWrnBf7O1kKEqIsuGxZUz
         00bauCpb/z9W/FbtBY1Z7vYI8rszW7pee2BuHKVE41CQrHjipH9fOihEa62qLxNK2LJA
         31Wn/4xUUa/VUfe8ZqB53ESEE0WeE+vN/ESm10VGMZK+SPyVk3/oxI2SROdgBP+EKM+x
         s2bzroHgqSHDAtsKFwzqxqucoxB9omhcE4wT5B/h8Hrvp+d/7rRov4SYgKOHu3QbjTFK
         gITA==
X-Gm-Message-State: AC+VfDybZFd1ZGln1AWK4SNYRkiW0WC9CeKmzgEDSCcYFLfOL5imTbKM
        zy9btAz0i9oZvRPh67RdZZtHpg==
X-Google-Smtp-Source: ACHHUZ5XXan9zWhxjB7dwcSvxARIUlNNZb50kCE6Bse1z98A8kiiRGbsieUOavGAIglFzOkCjBIU1g==
X-Received: by 2002:a5d:534f:0:b0:309:4ad6:b3ec with SMTP id t15-20020a5d534f000000b003094ad6b3ecmr1718299wrv.0.1685461657956;
        Tue, 30 May 2023 08:47:37 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:dd1c:e75b:56ba:6bf? ([2a05:6e02:1041:c10:dd1c:e75b:56ba:6bf])
        by smtp.googlemail.com with ESMTPSA id k5-20020adff5c5000000b0030af1d87342sm3777230wrp.6.2023.05.30.08.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 08:47:37 -0700 (PDT)
Message-ID: <d29f6e23-9659-5897-fe78-368a937124a1@linaro.org>
Date:   Tue, 30 May 2023 17:47:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RESEND 0/2] Lost tsens compatibles
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230516-topic-lost_tsens_bindings-v1-0-99715746ddb1@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230516-topic-lost_tsens_bindings-v1-0-99715746ddb1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/05/2023 13:53, Konrad Dybcio wrote:
> Resending what's been lost in the following series:
> 
> https://lore.kernel.org/linux-arm-msm/f7f38099-f183-d7b6-f542-1bdac6652a77@linaro.org/
> https://lore.kernel.org/linux-arm-msm/20230314-topic-2290_compats-v1-0-47e26c3c0365@linaro.org/
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

