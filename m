Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF48A625E31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 16:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbiKKPUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 10:20:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234160AbiKKPTo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 10:19:44 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BBF8E05
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 07:19:23 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id a29so8746370lfj.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 07:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z1mqXwvWmPhab1TlCcop37vPKl3pWguvjIJOUMn4sIY=;
        b=lRFSJ+iixZbdJTxYfczKSrJhBl2gDGcJWujaHoQ0IW/UjhTXhA8AHsZ4tfrNCHxxvp
         U5JqMIxcToRCENRVI61YoGvCs09aJHlCB8jmaK3DtrAfay5L/7T4z/et8f0NXlu5Er+E
         ZCRID4XUVYtiTfiABSenvlvb+tGe79Ulh3SNzxtUvEMztKtE+NjAk/ceVs9BfF6k8Pyw
         A8wvTh9yyr4y9TFFOnWyHLQzT7bQwYIaK7F3XE5+5Uuyqp6vPxxSsjs6APKc110S6xud
         Y10yCUy+tQ9OfsNsj98I+awvK/ky6JwsQ4xBXqnx+ZovZAVZhUTojtdFCkVj89Q1TTUq
         H7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z1mqXwvWmPhab1TlCcop37vPKl3pWguvjIJOUMn4sIY=;
        b=gTh2nth2EWglkNxpLAVjb1hc3LUdSpmHrxgISZ31WQTZBjqJLg9zCc5W4SA9j6k6xD
         VS0VnNKKiih4J3Wa7f9q/ljOqHWQZZwN0mFWf6dcXrRDQ9wLMtfHgDgwvJ065DYpXrhR
         RBJ7cMI3MCGGmw1cWLShvDudd3rvm2AAcc+WxxKBJhD1tM8tpyMeg0N83w4QBZGTsNc9
         RzFTFAiRqNUbPid+IM1OkrL3WZ9XUdQt5al4VBuwI42/c+GGHvRdI4zjj3pZuMoDVj58
         dGGRjD7CohczckxiI/7IERhsmid6kTBUQt8qFY//AI0p5DyoNcX5aemVONHXbH0WVh+n
         KhcA==
X-Gm-Message-State: ANoB5pmP/KW87ciYkOvZg8MeFMokdimAbmqs5WUzDsMwykctV9afPbuS
        CffJlAowCs6n1RlAK7g4RndXHttbLag/HA==
X-Google-Smtp-Source: AA0mqf4MLBY3EOROYH2BI548oGHzi0oPD+Q4xK3FHZtfNMFWB5iNosXtssjHoXmiFaInj3oNg8aGBg==
X-Received: by 2002:a05:6512:3c8e:b0:4a0:5393:3749 with SMTP id h14-20020a0565123c8e00b004a053933749mr889517lfv.494.1668179961701;
        Fri, 11 Nov 2022 07:19:21 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id s8-20020ac25fe8000000b00492b0d23d24sm367101lfg.247.2022.11.11.07.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 07:19:19 -0800 (PST)
Message-ID: <76e9ddb4-b33d-5e86-4ee8-c6b164236bf4@linaro.org>
Date:   Fri, 11 Nov 2022 16:19:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/14] phy: qcom-qmp-combo: restructure PHY creation
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221111092457.10546-1-johan+linaro@kernel.org>
 <20221111092457.10546-5-johan+linaro@kernel.org>
 <Y24Vyn8o1VkUecKY@hovoldconsulting.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y24Vyn8o1VkUecKY@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2022 10:28, Johan Hovold wrote:
> On Fri, Nov 11, 2022 at 10:24:47AM +0100, Johan Hovold wrote:
>> In preparation for supporting devicetree bindings which do not use child
>> nodes, move the PHY creation to probe() proper and parse the serdes,
>> dp_com and dp_serdes resources in a dedicated legacy devicetree helper.
>>
>> Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> Please drop this first stray SoB line when applying (or I'll remove it
> for v2).

You need to send a v2 anyway to have a clear check by Rob's bot, so drop
it then.

Best regards,
Krzysztof

