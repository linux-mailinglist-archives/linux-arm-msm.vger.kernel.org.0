Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97C47746BE3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 10:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbjGDIa3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 04:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbjGDIa2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 04:30:28 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B18FD7
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 01:30:27 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-992b27e1c55so610429066b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 01:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688459425; x=1691051425;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KFaFw3uJoDRm9laNgejEO9i+oEQ6almWqyPQQo3h6WE=;
        b=ZjbvfgYAzGqBD47D3/HU4Ni1J28WS1B5YSh1SFPyYXLkUmMDIN2E/pEoKqc/thhJnc
         EJCRBaAk8au/+WFGd77G2GE6y8PU7GEb3mRq5+f5d4AsjuTfTwRls+apoEeBWhb2H5VZ
         8AFgoOU45puo+4H7CU4UJ2MPQgcTcn8qAw6oRkDUgYsy284cQfmjn08AWh9izQD0rcdj
         vrBWlheExtcEdjf59szC4Qahl0pCKuKwe1ImyLp1SyyTaCd9WBKmD1dzfyhusWtOzyZk
         Mu7TrkQto5OAFRBhDsAraehkOhPhhiP6UqlqXlSTelHdbK3qfoZZFOsKQymgmDzpY7rh
         wzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688459425; x=1691051425;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KFaFw3uJoDRm9laNgejEO9i+oEQ6almWqyPQQo3h6WE=;
        b=Z5dHez0NjIvZdL/uEbCRafb/PGieGepkGQbkYWmJTCREHXVzVTLC4fi6Om09PduJgF
         CK7vaTPoq1XJw/nVn7tp+Jjc6SwzKmIpCiSVkhViEJ+bOTS2d1myOMylGwfTU3b0wLQR
         m9cpOzdfjzMKmcY/TQ1eOOZPAQS12XSZ21I9E+FfuZ1mM1ImSVFApwc/R3MhV2y6UUxw
         WHZq2QwA5qJAL3KOlA4FKW909FR/Re3rYWDpmzG3iQe3vbaGtG6a0+sSUyMoYck7gZ2d
         FTjL0t15bQSsh/XC3dN94iYLUO13bpcljEbJVNXyqYtOOb9xmPg5ZHK1JLj21/fALNEY
         aIAw==
X-Gm-Message-State: ABy/qLaocyNOwNSfEUq4606A2teBb8jRljc/Riotk1SKgfFYp1AedRx+
        Uv8eZGKr+KEPozcyMbgp7a4mog==
X-Google-Smtp-Source: APBJJlEe8seu86IJuy45hmgLX9aDLTpaeFtaYyGZDUMtQ9+B79h7OgG0fN5PxW+lwAOJaVYdiyE8pw==
X-Received: by 2002:a17:906:34c9:b0:982:9b01:a582 with SMTP id h9-20020a17090634c900b009829b01a582mr9389985ejb.1.1688459425722;
        Tue, 04 Jul 2023 01:30:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a16-20020a170906369000b009887c9b2812sm13234240ejc.8.2023.07.04.01.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 01:30:25 -0700 (PDT)
Message-ID: <c6dc324c-2946-3af5-8ddb-11d0a0e824cb@linaro.org>
Date:   Tue, 4 Jul 2023 10:30:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/14] dt-bindings: display/msm/gpu: Allow A7xx SKUs
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
 <20230628-topic-a7xx_drmmsm-v1-3-a7f4496e0c12@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-3-a7f4496e0c12@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/06/2023 22:35, Konrad Dybcio wrote:
> Allow A7xx SKUs, such as the A730 GPU found on SM8450 and friends.
> They use GMU for all things DVFS, just like most A6xx GPUs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

