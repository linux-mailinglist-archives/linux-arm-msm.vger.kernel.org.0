Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 752105B58B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 12:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiILKrT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 06:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiILKrR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 06:47:17 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA2931235
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 03:47:15 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id k10so14141271lfm.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 03:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=bS7LDsVs3qcnyEA5WCUeLMEdHfGdR6OQ6NC7pdWEKCo=;
        b=v9C7GeUH/ntRNwKKZ1I7TT6BQcjJBRkVZ1XpH6mXDdIGqsu2oqlY8NR6ikeS2VHyL8
         7XoeJToQeSx7WIMqvu9S5zhL+/zdPWkCJ/xRvKy5UYL5moSuGoTzW/rT+uXwRSG6Eiic
         vRv3Oy4PyY5Y4nPRruZEaZcvpvxM6lCfMQ0gzcT4tFsasIVkJa+3D6W6V8K+hfLskejA
         LNX5aQQbJSTAfgk7Upg8DIPsy+QVWFepdmlC4bDE/vck/eapbQzWJPan/jIBh9yCxMTn
         xdGGkKSLDDM4Cf8yXZKpajXEJTCiwphjC+CcMOkntC3mGhoodSx7fPj7QXXQPJ79Il6x
         BM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bS7LDsVs3qcnyEA5WCUeLMEdHfGdR6OQ6NC7pdWEKCo=;
        b=5KVsvsr7XUvMdAhWxnlPKzko8VxRrmy2p/Uy+GAhQBy73NPp5uWs1OO2+AoICTsgL4
         FQN8l83XusJw1RQxPTrnAGUZ4zPT0d0qy3WIqhIFlekw2b+UAiFFKcPBEdI4RSsd5s/G
         PqMYDuRuhhiHKzDGquPZPEvzF4DzIzIG9Et8dFKFPzfmYqkJ9E2EY9+epsXafRyJtlrS
         Kz19OZL/E2nTn/mFJZzg3Of/TjkMdiO/scQSfhfyjUo3wjcQkt0VsuMydi4BKHki2cLS
         DA3mwodMS4pgf3GckeikSqIJo8151tDRYaCAWBJEKsSTFpW0c9icLLS35XpH2EFxmBIW
         /xcg==
X-Gm-Message-State: ACgBeo0QEoBY18I0z2ryU4KuK+XsQeofOUS9glaYgUysAqklFM5Xjj6L
        B7Q2h4LfKMGPbByoGOjIgeXGsg==
X-Google-Smtp-Source: AA6agR5+jaTiqHAiQpzt1KGZYW6NOWDU4UIg3cF3n4GCh9g7ACcWMJRrb7wrqPm8IlRGzsNs5ZLcOA==
X-Received: by 2002:a05:6512:3f8c:b0:492:b392:bb84 with SMTP id x12-20020a0565123f8c00b00492b392bb84mr8267929lfa.368.1662979633605;
        Mon, 12 Sep 2022 03:47:13 -0700 (PDT)
Received: from [10.129.96.84] ([109.232.243.34])
        by smtp.gmail.com with ESMTPSA id p8-20020a2eb7c8000000b0026c111ac7bcsm188263ljo.86.2022.09.12.03.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 03:47:13 -0700 (PDT)
Message-ID: <79c11b6a-8f34-a5ee-373d-f88d5a980039@linaro.org>
Date:   Mon, 12 Sep 2022 12:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/4] dt-bindings: remoteproc: qcom: wcnss: Add
 qcom,pronto compatible
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220908184925.2714098-1-sireeshkodali1@gmail.com>
 <20220908184925.2714098-4-sireeshkodali1@gmail.com>
 <ad201ee7-d83c-9ebc-3619-64632f1f266e@linaro.org>
 <CMU3V4NK164X.1D3TDJPALGIDD@skynet-linux>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CMU3V4NK164X.1D3TDJPALGIDD@skynet-linux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/09/2022 05:33, Sireesh Kodali wrote:
> On Fri Sep 9, 2022 at 1:30 PM IST, Krzysztof Kozlowski wrote:
>> On 08/09/2022 20:49, Sireesh Kodali wrote:
>>> The qcom,pronto compatible is used in the wcn36xx driver to determine
>>> which register to access. However, this compatible was not documented.
>>> This patch documents the existing compatible as is, since it isn't
>>> immediately clear why the wcn36xx driver uses this extra compatible,
>>> rather than relying directly on the regular compatible string.
>>
>> The patch does much more - messes entirely all compatibles...
> 
> Is there another preferred way to handle this?

The one which does not introduces any other changes than what you wrote
here. You wrote here, that qcom,pronto is being added, so why some
things are changed to oneOf or to enums?

Best regards,
Krzysztof
