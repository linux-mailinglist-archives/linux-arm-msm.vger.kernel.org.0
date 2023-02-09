Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9D3690A90
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 14:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjBINkc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 08:40:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbjBINkY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 08:40:24 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E50B47413
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 05:40:23 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id p26so6344994ejx.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 05:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/9XwFYeUJst3WJ5sHdQjwXF4qwQvevEf5WU7yUqIXY=;
        b=OMw/A+V2/U2vAN546ixC6VrsB9usPnMiYZ1EGlPxuAOxWOMjTiKzuwiUruCmZ+0HlE
         5Sp63S1ZpYZVQTOqaN6t6gUA9o3xy9nImsCREWI5h3iMStvajaS1JjKUqPM6JkYgBpDE
         3+mnH2e1S1uHxCl553jXTY8nl0pus4Iln/TAoKk9arW14IzuDP4UvjXFPbUF/Pzn89id
         I8d/W49sVknCcIiL9D3riigh6YM0A6B/IjMwxl0l5IIhVgen/+gv8HChuEeE6vZI6rOV
         TnZmKKE8Ubb9EQcOZ1R5lTkJprUk20Ju7BsDrM92K7bamJBLiPFipfOn9InyaQ2UjivK
         IK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/9XwFYeUJst3WJ5sHdQjwXF4qwQvevEf5WU7yUqIXY=;
        b=And9m4KmXv0vlpW2v2GyyeoKJ8SAFm8+zR/fKWg8nYjMy6hmrDPlbcdy4FscORjfeo
         LL9kGSaIu4XD+OYRWIbJhC676/R+bOHSbG46EKGoftEnW4hccxqQtvkP8OYd9uO8dNzK
         1jv15y1ITSZmuZgykXXhgnzi2hBKEIGb/wUwHOyIVJRcJqkoimrvZVGMvCIQO/rwa4os
         zH5MXutVOHMFrwGPWsdL5kRv7p7nZMvsayIAi98rJKR4buBy8z+5aOU5FN9k8sv+fNJS
         ZdXppVhdlzwEdcVC8pdy0+zjj1rOXjCdX4PVSS4c0EBLejHe+uk2qXD1P6ac0hbjDWuj
         ykiQ==
X-Gm-Message-State: AO0yUKVBq9jmoafIIhyyfkKFi77R/utsZejfHOGvV6yNZl1KWd4tPzIj
        dO35+lvbp9zO3Od5S4zTmDXKXA==
X-Google-Smtp-Source: AK7set/izK6rzb2b5i3ycv/Vv8MsWMV7WDdfIFo7kARlIFT3ylMk6KZs8PsO+wT3uFrG2bxHo8cvmw==
X-Received: by 2002:a17:906:4f99:b0:887:981:5f7c with SMTP id o25-20020a1709064f9900b0088709815f7cmr11967561eju.11.1675950021723;
        Thu, 09 Feb 2023 05:40:21 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b5-20020a170906d10500b008784bc1dd05sm877502ejz.76.2023.02.09.05.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 05:40:20 -0800 (PST)
Message-ID: <dea3c40e-bdd8-1276-409d-3ddb35b004bc@linaro.org>
Date:   Thu, 9 Feb 2023 15:40:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/8] arm64: dts: qcom: sm8350: reorder device nodes
Content-Language: en-GB
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
 <20230206145707.122937-5-dmitry.baryshkov@linaro.org>
 <20230209032841.ybqveepeyjqo63ql@ripper>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230209032841.ybqveepeyjqo63ql@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/02/2023 05:28, Bjorn Andersson wrote:
> On Mon, Feb 06, 2023 at 04:57:03PM +0200, Dmitry Baryshkov wrote:
>> Start ordering DT nodes according to agreed order. Move apps SMMU, GIC,
>> timer, apps RSC, cpufreq ADSP and cDSP nodes to the end to the proper
>> position at the end of /soc/.
>>
> 
> I think "according to agreed order" means "sorted by address", but it
> would be nice to have that expressed in the message. If nothing else for
> others to know what such agreed order might be.
> 
> 
> Unfortunately this doesn't apply to my tree, and it's not clear where it
> failed. Could you please rebase this?

Done

-- 
With best wishes
Dmitry

