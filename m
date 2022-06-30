Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8B3A562371
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 21:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235686AbiF3TtQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 15:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234038AbiF3TtH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 15:49:07 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472541D32D
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 12:49:06 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id cl1so104516wrb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 12:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6tnKa6j0KUTAns+9a5hu7e9HMdmQnDavnOA9sl0AIJw=;
        b=njyHn6aTwltxlDIvONhFpvjWImdwFbcxV+4iHtUnmq17Z2D2qLtMXnUyw7I1zpOZX5
         DJxgodxX1pg57tqiCqKtVwDfitRIWbUeosHao0kCyMemcdLbpQ3gGXS60ftMr+swK8JJ
         XMbvAsyvlDTGVU90VTN5GrC6vkMNEYQ/q4mggitoR4nitzTuHo/T3rZP1vssev6UBIIU
         BKAyX9cpWILuv8wkR2dFcpXCgNnprozdL9dJlDrMYfu8fNOp0HKQa5Uxng1lC5nvpGn3
         cVRnQUfVNadjAkNMpjM/UY7fmJp9eqo+8jJ4lmupI90NHghoS7YhHqbbYZ5zWQbA/B/s
         LLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6tnKa6j0KUTAns+9a5hu7e9HMdmQnDavnOA9sl0AIJw=;
        b=wG/X0S6G+ykgBOw+IjhKcPCKPfT0DWDclKav54uUb1fpjriGKhfeVn8LYAkGbCfY7q
         FK8247h0aNhhNxExjBpEi6FKf4PRlEvD7NpX7/viIYXJZshD8xCqh6UB8/A3R7itrq13
         IsSNAqFmJxSWJRzDDGqC7XJG0FyXiT96Dcwla9sw4omZw7jRdzPVa8rhE3ovI7AIeWXS
         a0ykYh6RE6DjTgHfxDnd806fvxeKJu4apLJuoMT2rdCTo55W0FKWa5A7y18C0ZjaK9B4
         9GrTiZSRCEPr+mEuaQTBoRL0aGX5l8pv/0EfnDtFRiyGUcF7C6fotuNvzkcoFWBHiyrc
         ZPSw==
X-Gm-Message-State: AJIora+0b/dWFvgFZJrvHdri9KlSe3cbp3em1J5p1a+KOXpLNgynOpCS
        y5Xtvwd3wJC7EKNEz1OGlsdnyA==
X-Google-Smtp-Source: AGRyM1sZHMnJrHelAuAUGs13a3YkMH9sihf7xkfePW0UaKfmk8KPRg67Ro+MceNbycq1UCObq1QnZQ==
X-Received: by 2002:adf:e252:0:b0:21b:827e:4c63 with SMTP id bl18-20020adfe252000000b0021b827e4c63mr9834152wrb.307.1656618544868;
        Thu, 30 Jun 2022 12:49:04 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g20-20020a7bc4d4000000b0039c798b2dc5sm3634442wmk.8.2022.06.30.12.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 12:49:04 -0700 (PDT)
Message-ID: <054043a5-3643-aa5b-4204-8cacb7b3ae9a@linaro.org>
Date:   Thu, 30 Jun 2022 20:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/7] dt-bindings: msm: dsi: Fix power-domains constraint
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-4-bryan.odonoghue@linaro.org>
 <225e70ec-553d-4d44-fc61-543128b2ad67@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <225e70ec-553d-4d44-fc61-543128b2ad67@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2022 20:01, Krzysztof Kozlowski wrote:
> On 30/06/2022 14:08, Bryan O'Donoghue wrote:
>> The existing msm8916.dtsi does not depend on nor require power-domains.
>> Drop from the list of required.
> 
> That's not good reason. The bindings are about hardware so the question
> is whether being a part of power domain or toggling power domain on/off
> is considered required for the DSI.

AFAIK no but, I will check this again and if it is definitely not 
required, I'll churn the commit log to describe it better.

