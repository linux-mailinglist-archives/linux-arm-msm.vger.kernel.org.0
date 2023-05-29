Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3F57145B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 09:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbjE2HnE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 03:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231527AbjE2Hm4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 03:42:56 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608D4D2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 00:42:50 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2af290cf9b7so29386601fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 00:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685346168; x=1687938168;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QDMhUPXhYCylyY6xJMm9yCulz+xNDYcz18nWz3lpr+Q=;
        b=shBzne0T2fRTAdOs6SctvRbYARi3RSwjNSSVQQRQ1RkSXJ3nbAqkJNsrJfhFqkavgz
         9WJFRSTMWd4QgfijhfGlKl0L6b0lBvySnoGYp3UIhCTn9NdBUY7xpgkIKykkYmA9BUdO
         /QRIE87ys6CftMVaIkpfB8IuJUY3oSiZ3z01/29hTo2nBYBuhHEUHwDv9GSBBFq+t4ts
         1ivADZ3fVFazVlXyx+G6zsckb/EMqscSa8nMdeuIT/Ivj0YfOIu2l8q7CTH4ao8symrb
         g5rW2cFMC6lfEzFZlJAmV4iNkDcRdnncmadPAQgSU2GFPzCGDqO1vLtAXD+aC5h9aoGE
         6Lhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685346168; x=1687938168;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QDMhUPXhYCylyY6xJMm9yCulz+xNDYcz18nWz3lpr+Q=;
        b=Al235qS7dC9diiCOfSnFpHngggLvk+DbmUsHFoGFVYTeb/cbtild/EUfyygYhXPDgd
         e7GE/R2mY3Wa3KrWFfLEvtREc4TlfGdF6yOEpbPXlQgDHz6tJpL+KyBc1XniiayG2SEe
         rh+3KhMgCkfe9iX5Szvo6gXW9/czKd6Mam0eSayKbEz3MyM/qfTR73YJhe77cU/HMV3l
         bJEdWD57RJ2oOvQwKHb5NijL6oMPq8sMvgtohnchTeKYKX7375SNMDq32JvqzL6vv+Nx
         ELuk58hYuL1s4MdzCogUg7zzxbF6bssnH8paAnvng5DuZ604Rz/U8zQCFnpUkVHB5auE
         44+Q==
X-Gm-Message-State: AC+VfDz9sLXoTe4eKAg5MrzjW8JNtiZVvAoY7rrpPVR5zOaicNaiYgSj
        NBY8QU/zaYY5YrVkCNWjWM9Lcg==
X-Google-Smtp-Source: ACHHUZ5P7HjDdkJcWMpclQCMEGd7rt8hr2ymy6fbYhZQYqN/ZhjoDTx+fGlZIXhUCITG1kF+f3wh/Q==
X-Received: by 2002:a2e:a317:0:b0:2ad:dd7e:6651 with SMTP id l23-20020a2ea317000000b002addd7e6651mr4240593lje.43.1685346168627;
        Mon, 29 May 2023 00:42:48 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id e20-20020a2e8ed4000000b002a9ee18e9c7sm2230101ljl.69.2023.05.29.00.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 00:42:48 -0700 (PDT)
Message-ID: <74a817ff-5850-330d-8cac-f551be6fa35c@linaro.org>
Date:   Mon, 29 May 2023 09:42:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 0/5] MDSS reg bus interconnect
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
 <CAA8EJpo8X7KrrXoButyW0d1Lz=a5Stw2inFGt2R7KJ+2NTX6wA@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpo8X7KrrXoButyW0d1Lz=a5Stw2inFGt2R7KJ+2NTX6wA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29.05.2023 04:42, Dmitry Baryshkov wrote:
> On Mon, 17 Apr 2023 at 18:30, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
>> another path that needs to be handled to ensure MDSS functions properly,
>> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
>>
>> Gating that path may have a variety of effects.. from none to otherwise
>> inexplicable DSI timeouts..
>>
>> This series tries to address the lack of that.
>>
>> Example path:
>>
>> interconnects = <&bimc MASTER_AMPSS_M0 0 &config_noc SLAVE_DISPLAY_CFG 0>;
> 
> If we are going to touch the MDSS interconnects, could you please also
> add the rotator interconnect to the bindings?
> We do not need to touch it at this time, but let's not have to change
> bindings later again.
> 
Ack

Konrad
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>> Konrad Dybcio (5):
>>       dt-bindings: display/msm: Add reg bus interconnect
>>       drm/msm/dpu1: Rename path references to mdp_path
>>       drm/msm/mdss: Rename path references to mdp_path
>>       drm/msm/mdss: Handle the reg bus ICC path
>>       drm/msm/dpu1: Handle the reg bus ICC path
>>
>>  .../bindings/display/msm/mdss-common.yaml          |  1 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      | 10 +++----
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 34 ++++++++++++++++-----
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  5 ++--
>>  drivers/gpu/drm/msm/msm_mdss.c                     | 35 ++++++++++++++--------
>>  5 files changed, 57 insertions(+), 28 deletions(-)
>> ---
>> base-commit: d3f2cd24819158bb70701c3549e586f9df9cee67
>> change-id: 20230417-topic-dpu_regbus-abc94a770952
>>
>> Best regards,
>> --
>> Konrad Dybcio <konrad.dybcio@linaro.org>
>>
> 
> 
