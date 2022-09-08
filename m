Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42E035B1F83
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 15:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbiIHNpO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 09:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbiIHNpM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 09:45:12 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4057E40E0C
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 06:45:11 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x14so12438675lfu.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 06:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=K1xmDVRthzjWOyGdohyh7MTbGHYJ56y8iv2a+1Z9WWA=;
        b=glmTnUvQVW1uqDE+SIQR6OQTqacwnemf/++69ByqHqFoPKpvfWKjnVXG693OpsVwCz
         evrZ9cHAUSR15MD3Qhxlxm6aKc6BS2rwbcD1L0n/peFMwzKOY2Wn6j7cyYf5RWoYkNfw
         kZy5tNDdvljlF1lqn0shBkeFtWThGify00/LQQM+V7fJzy1zBzAk4Qxfmxx29pKhXK2X
         RP0GzqcFPAYABc2ClmW8KcNTI7xs8ZwBPTcKGtCX/4IOSjQabQnSxKzd87MYyAO6GE3w
         4LLqOdTT6uSf5f2cktCrzaZ8O8mMVixqHenirGCoHiLFupS1cYx+15sq4Pz7O1dQ+5s5
         YIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=K1xmDVRthzjWOyGdohyh7MTbGHYJ56y8iv2a+1Z9WWA=;
        b=Lc0XIpvxJUUulWv0lmc3eW8m7DkM256Dv4zr5weinD6chJMl1/06DNPBBrbmyRiHDy
         4EmZA10YLNgn5T3ROHoChL5i0WM7ww0AMgqJTsHA8kWkiEVM8ENXh2KUS0l2R8HLa6yj
         WmGWltDxAxTFjJpxdLuJS01mFs4APaKJnO2QGyU2fTNptVAMMtl6rcgR1dZaBUzb3+TA
         1wO3Aq0lDTaCvmDjByvEvxXZdpHZdfo+ZwXMbwLig2os08ZJsv1KpopM+gkQbDN06gFm
         0werkGGEH2fAHbylGwq4EAF6K1gEvH0LuTRKydGWtzZKOXXJZllSF4h1weVQZBmNaO8q
         eZDA==
X-Gm-Message-State: ACgBeo1VMhJzr+yAzeo/XGtNjsa4xPkCzDKU2B+mQ2zLLha7Shb/j6nV
        r0VyHqVBPHfHmkLr5GwdHRbzhA==
X-Google-Smtp-Source: AA6agR5CtptxXfFJSh01xzHCz5Gl5OhOa7Mv2/Z7XGiY7IevgY0ma0fyIsjVbbpb86bTnvY5hu89xA==
X-Received: by 2002:a19:d611:0:b0:492:8e15:ba18 with SMTP id n17-20020a19d611000000b004928e15ba18mr2710698lfg.524.1662644709634;
        Thu, 08 Sep 2022 06:45:09 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m3-20020a194343000000b00497817b8ebbsm1672669lfj.134.2022.09.08.06.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 06:45:09 -0700 (PDT)
Message-ID: <d8f173e6-3c0f-f7d7-573d-db91d9cfdb75@linaro.org>
Date:   Thu, 8 Sep 2022 15:45:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 06/12] dt-bindings: display/msm: split dpu-sc7180 into
 DPU and MDSS parts
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Loic Poulain <loic.poulain@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-7-dmitry.baryshkov@linaro.org>
 <92e18257-9a95-9366-ffff-416d27039c3b@linaro.org>
In-Reply-To: <92e18257-9a95-9366-ffff-416d27039c3b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2022 15:44, Krzysztof Kozlowski wrote:
>> +  interconnects:
>> +    maxItems: 1
>> +
>> +  interconnect-names:
>> +    maxItems: 1
>> +
>> +patternProperties:
>> +  "^display-controller@[0-9a-f]+$":
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        const: qcom,sc7180-dpu
> 
> You have now schema for qcom,sc7180-dpu so just reference it here instead.

OTOH, I think it fits your other uses, so it's ok.

Best regards,
Krzysztof
