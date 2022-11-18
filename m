Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1E9062F609
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 14:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241597AbiKRNaN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 08:30:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241810AbiKRN36 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 08:29:58 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E32A2627C
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 05:29:56 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso4023530wms.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 05:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HN8LVu2tBOU+OG4LnFinIFanAXLqtN8dB9g7K9KkfjU=;
        b=OG2Ckv2ZO0fmf4LFpZ1ezKwfBJtCEtj08HMol4o7P/Y/9Ta89WhfUr3KKSF/viNvCS
         Y2ZI5LjDOEBbGfVDg1BNP7WAozSBVCRJSPz0ubyYaaAeOrSEqRPWIv4HqA6hIhXRbyCs
         z3Q6LA5CQYLLyPVszidp2Cv0N6FhlbL9Am8OjFiludhX67cUsXWwjDY01oFyhvbFj9CT
         8qZGqZOOphmvobWLK2G61e5D/yCVnvjcEJKLmXM0HYkY3LOX2g0cjeFwC9R6BUgKV6Qf
         1v9OwBYOVyWeKLa1Mquh74I6yx3SLyhX9aN0PzZsw8wSUrtQxzhVIoWyoh86XMxaYAMu
         Gzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HN8LVu2tBOU+OG4LnFinIFanAXLqtN8dB9g7K9KkfjU=;
        b=eRaCUMcKGgP442oTrlUEtQzJ6tfBJbdj7krmjLuk2USxVUXv74rQXKHdd7brKDtj5x
         Rf6DKWToeiAEuqp5X2Bqdq5oaXSE7i2sr4qEUAY2vOrSlaGOg27MgdDs0CDqC2VP//ob
         Q2m2jIh7Kk4gIbUJWe+RvDgnupPyqWl7NOK7524MpGSD9TeADrGxuBgY9dTLs//8L1jR
         5LFxvPdhtIKVAeRSQNGyefiWiHqCs7FRL9lolSC9mzwWimcRLRLCmc+qmmi9FAM+qmE+
         FTiJDF5MKCuGyvMjU8be5QkpYROqKVJpFApynka6yRZGyUB6hewV+I0qfR5PywMk6BNW
         M0Mg==
X-Gm-Message-State: ANoB5pklcmSqNtF0G4uesAavpSbT4zZcQ1BuMZRxgHx78mZ7LNFbB9Mq
        HNPTpBmJf/5vyQEOQ+ssSrzo1g==
X-Google-Smtp-Source: AA0mqf7i8dywQOhFfIFUfTreejp7KFR0nIu101KikdsXbMRrFt1RKBxdvI3qgRZVHoWm4mbMT54yiQ==
X-Received: by 2002:a05:600c:ac1:b0:3c6:d18b:304b with SMTP id c1-20020a05600c0ac100b003c6d18b304bmr8044158wmr.142.1668778195318;
        Fri, 18 Nov 2022 05:29:55 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r13-20020a056000014d00b0024165454262sm3607708wrx.11.2022.11.18.05.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 05:29:54 -0800 (PST)
Message-ID: <0993d2bd-c0f2-8139-8f02-84abe6b8ad8b@linaro.org>
Date:   Fri, 18 Nov 2022 13:29:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 07/18] dt-bindings: msm: dsi-controller-main: Add
 compatible strings for every current SoC
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        robdclark@gmail.com, quic_abhinavk@quicinc.com,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-8-bryan.odonoghue@linaro.org>
 <aeb59d3c-34d0-f00a-bfc3-524cd03acb71@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aeb59d3c-34d0-f00a-bfc3-524cd03acb71@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 08/11/2022 12:46, Dmitry Baryshkov wrote:
> On 08/11/2022 02:56, Bryan O'Donoghue wrote:
>> Currently we do not differentiate between the various users of the
>> qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
>> compatible string but, the hardware does have some significant 
>> differences
>> in the number of clocks.
>>
>> To facilitate documenting the clocks add the following compatible strings
>>
>> - qcom,mdss-dsi-ctrl-apq8064
> 
> Generic comment: I think we'd better follow the arm/qcom-soc.yaml and 
> use qcom,soc-something as compat string. This would leave us with 
> qcom,apq8064-dsi-ctrl
> 
> I'm not sure if we want to follow the qcm2290 approach and encode the 
> DSI ctrl revision here (6g vs v2).

For qcm2290 I'm thinking qcm2290-dsi-ctrl - without the 6g piece.

a) Nobody is using the compat at the moment
b) I'm not sure what - if any real information the silicon version
    number conveys here.

+ Loic, Shawn

---
bod

