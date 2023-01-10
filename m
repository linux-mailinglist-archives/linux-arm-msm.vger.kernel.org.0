Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6BC6644BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 16:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239045AbjAJP2I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 10:28:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238905AbjAJP1m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 10:27:42 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC1C8D5D7
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 07:27:13 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bu8so18996520lfb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 07:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7fm/7TBEONwaLt0+6NWOXJ7HGQ1C1VCAgpTOJNxCddE=;
        b=Cue9dLEImrK8mCH+XxidAn/Xdmw7Ed3SXFTVSPovbn3EWZ8CZjdogdY84igNOJ4RxZ
         XImVAPGxZMLmzywML4Zx/ehqWg86Z8v2CzHENMVVR+jzxLhv0sFJokIn8vyh5Z98BEMb
         gnUQfDb6AFbp0r3WJw1UAsN4+tsF9bnOTmMZttMeWjSmDFfupl+EepL1LC5M0glMq4fB
         r+aAtX7SpEoj0aP/UY31szsDHboAODFugaEqz687b4LPhbRFc78P6zsJIYp/6IHqp2aJ
         Zhy1hPCgoKaLi5aMDh79WyuaJbkKFVI142MsBMAc4Rtw8/3lCLvXaO0lnzyT7b1izRIh
         cOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fm/7TBEONwaLt0+6NWOXJ7HGQ1C1VCAgpTOJNxCddE=;
        b=h9yF0uANLDcj7YDIaUPwPgEjxZzuVoMjX9k24UjXhobcL1AnNQpgKXGXXnwLkM1iq7
         /DrNqmKOwAH4x/dLR11xlkjfRj6hW2tTbnATPoOLxDdCe9n82GvNVamdQQgE54WUUevD
         I7yHEmUPT1Qp/Aw3e5+67BpVA48R3fYm43StmdcUcGgnM+HS11eU/XDc9vmYT1lXHOlF
         iUprefHOIwjyo5dn7I4AUTGCCZSNI7TacljMQCNDb/54oB29RuFMXGCAUNmnQ8jHhLMb
         0Ho0qkjifHdqdjT0H5vbx9TXBJiy3j3rQ0s9kCWev5Qqj2wmDj7xgmerxdEBTh+ct3ip
         uCxA==
X-Gm-Message-State: AFqh2kpSe+94Yme+z4a+16ojVXB2aCDbdd0kSOH3zk/qqfjmyoRfLpfn
        LK4CmDH/yRLatcNulncdwr3ZCg==
X-Google-Smtp-Source: AMrXdXu5wpEorg8l9w2GezeK3B67RvYK1ZumMkVKh+swYddzRn51yduvEqAs7zW15P1hdVtcxAnS4Q==
X-Received: by 2002:a05:6512:3da2:b0:4b9:f5e5:8fb4 with SMTP id k34-20020a0565123da200b004b9f5e58fb4mr1895849lfv.3.1673364432115;
        Tue, 10 Jan 2023 07:27:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o5-20020ac24e85000000b004917a30c82bsm2230654lfr.153.2023.01.10.07.27.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 07:27:11 -0800 (PST)
Message-ID: <84b7f7d6-3739-d9f0-d5e6-73c45be7fb20@linaro.org>
Date:   Tue, 10 Jan 2023 17:27:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 3/7] dt-bindings: display/msm: document MDSS on SM8550
Content-Language: en-GB
To:     Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        David Airlie <airlied@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v3-3-660c3bcb127f@linaro.org>
 <167327376817.61320.5444570222214850129.robh@kernel.org>
 <CAL_JsqLEOREcgDcDvT2CSJuAMro_ayJxVt46+ZBritAOGSTQ6A@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAL_JsqLEOREcgDcDvT2CSJuAMro_ayJxVt46+ZBritAOGSTQ6A@mail.gmail.com>
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

On 10/01/2023 15:54, Rob Herring wrote:
> On Mon, Jan 9, 2023 at 8:30 AM Rob Herring <robh@kernel.org> wrote:
>>
>>
>> On Mon, 09 Jan 2023 11:15:19 +0100, Neil Armstrong wrote:
>>> Document the MDSS hardware found on the Qualcomm SM8550 platform.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   .../bindings/display/msm/qcom,sm8550-mdss.yaml     | 331 +++++++++++++++++++++
>>>   1 file changed, 331 insertions(+)
>>>
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dts:21:18: fatal error: dt-bindings/clock/qcom,sm8550-dispcc.h: No such file or directory
>>     21 |         #include <dt-bindings/clock/qcom,sm8550-dispcc.h>
>>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> compilation terminated.
>> make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dtb] Error 1
>> make[1]: *** Waiting for unfinished jobs....
>> make: *** [Makefile:1508: dt_binding_check] Error 2
> 
> Now failing in linux-next... Why was this applied before the dependency?

I failed to notice the dependency while applying. It was taken out, but 
probably too late to propagate into today's linux-next. It will be fixed 
tomorrow. Please excuse me for the troubles.

-- 
With best wishes
Dmitry

