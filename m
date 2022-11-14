Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92F9C62767B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 08:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235955AbiKNHi3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 02:38:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235948AbiKNHiW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 02:38:22 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8110418B02
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Nov 2022 23:38:19 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id g7so17929279lfv.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Nov 2022 23:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ynFSxiJnjGqJ7rZL3EFsUj6XQR8YJiiuP8vs5lqtRho=;
        b=WdjHDL38LC/Li53xZO92ra0FtYQlpfAc3Y5kOBwd5fAt9FtmF27p53IlmgzlZaAP4m
         B2Aj6tMvkr3T2gSOovlZtZOkn3j5buFcBC4BnrnuedDPQ52BMxoYiqTC3jCQRkc7jmRn
         D+q3yHfSqRbjST/c/B0dtw2sPnRkK6fYeG8I/JGoaLz7U709SvqmfI6y78bIpQRD8ig9
         7yckc+F2pHDdpHUCEIr5tTD+bQKxSZaAFqXPD7ebZbZXOjA7zkzxjJ5CrKIIyPg8Z5Ah
         F8uACRgUnsvOP5B101OrZ4cNwBS3jNpk0njv3bu3+AFrpCsbJHkRlRJJCJoS6G8UV3UU
         HpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynFSxiJnjGqJ7rZL3EFsUj6XQR8YJiiuP8vs5lqtRho=;
        b=c/Yi0iOghI4zWl0REWmrJrPqRqE46b9sF+KtFMoULLsLeM66FB+wHKO841B5Fiqbvr
         KBK0ICARqwyfHu2l43TwjTPLOaCs4HRhA7SJEEDy4lsG5lk6W7HM5szLU5vT+tDJkMxM
         +tzgdO39yVkSGE7he0mPardL4A4AGU9B7GNLX3PVvOf3ji7CO0DCcetJAbJfnkELaJwf
         taDt/JOcfd/nIMSpijH0KNVVL3JaVJisFqM6HAJt/u5f/E+u4XcPytygrcRbLUbgu9Om
         Aq3kVOcIT3UJDFX1LERKFi+i3zzkXqhn2I0E9Anl4YTOu8416kx2YSPARkv/+xBTwguU
         MIoQ==
X-Gm-Message-State: ANoB5pnnOWzKgmT664AxfDahM9sMv/DJXDbLG2HgRFNg0BdRx5U0M77A
        akkOyfvXQzQ7YzyJ7I1GlBSPOcY2wlCN06jv
X-Google-Smtp-Source: AA0mqf40WZsaBjXPKJLW/aKC+AQS9c32GAyp37yNggevTH9rilspqXmsdXtNW+xu77WmIls7Q4TKrg==
X-Received: by 2002:a05:6512:687:b0:4a2:51a2:9326 with SMTP id t7-20020a056512068700b004a251a29326mr3596758lfe.594.1668411497888;
        Sun, 13 Nov 2022 23:38:17 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g13-20020a2eb5cd000000b0026dffa29989sm1888071ljn.23.2022.11.13.23.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Nov 2022 23:38:17 -0800 (PST)
Message-ID: <e3776784-ac9a-8de2-f6e6-393e5dc1041c@linaro.org>
Date:   Mon, 14 Nov 2022 08:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 1/3] dt-bindings: arm: qcom: document qcom,msm-id and
 qcom,board-id
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Kumar Gala <galak@codeaurora.org>,
        Rob Herring <robh@kernel.org>
References: <20220830065744.161163-1-krzysztof.kozlowski@linaro.org>
 <20220830065744.161163-2-krzysztof.kozlowski@linaro.org>
 <fe747000-a650-ed2f-8581-92b044f86f2f@linaro.org>
 <CAA8EJpruwhOVacH6_kN2TABmVR5Peu1pjFa1b4sag5p1zouqRA@mail.gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJpruwhOVacH6_kN2TABmVR5Peu1pjFa1b4sag5p1zouqRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/11/2022 14:50, Dmitry Baryshkov wrote:
>>> ---
>>>
>>> Changes since v6:
>>> 1. Update header with defines
>>> 2. Add Rb tag
>>
>> Hi Bjorn,
>>
>> Any further comments on this? Can it be applied?
> 
> A gracious ping from my side. I think it would be better to apply this
> patch rather than having the undocumented and controversial propreties
> in the device trees.

The patch was applied.


Best regards,
Krzysztof

