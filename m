Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D15035A24F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 11:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344088AbiHZJt4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 05:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344126AbiHZJto (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 05:49:44 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7928CD86FF
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:49:42 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id z20so1082579ljq.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=GsqQd6SAPDb0fT70p8X6mFpGFngwmS41ZDD9UsqFcxM=;
        b=d1nSLkhbrdejwMFn1KOzIxhMbISvE9dkw2GzI0Y7U9LKhmPsdU3SRgViqhhXOyeajl
         7MbraVMYy1297njGx4aE0/zxZdRtTjtM/ix23VUqFNWG1/QqkCzPDGHibRE/1koKNa8G
         COui3DNktwzEbduZe8148dNYMkHTph0MFQSTNax21JmV7gEBo5+VKofjV2biZqvWx+oS
         8Zkoda0Gp2ve/81BaS1KhTgVye5s0iS5rRUNj3JgdBtDuZqwFncsQeHVDWQmU89VNoay
         99f5IosEbRYSUU4BgrLEz7D13wuPF7LMD5oauszVP1QRGnXoYjHR/1KP2qmlwkNip4my
         Jz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=GsqQd6SAPDb0fT70p8X6mFpGFngwmS41ZDD9UsqFcxM=;
        b=kk7SC2ttGBGfufCddGr1RTEBWH7qDsOuvDEMuf77x8ujh56lIfeMHJ0ai37vviJYKA
         2RrOfC+XulTHoMui2VWoNmDwWCv2DPnGODVPNB7vuO+WJ2+lFXJf1PtUAiDcZZTSl4Ku
         uZOagCLe/9sFPGuCQWt0LoNyt8am0ZAdOW13dOrkJfpaTpDUzaHhn8UIYesCP9/6lxuu
         vD8QexPdIb4eDv64vkaSrSkSe593KwOSiCUI7ZRrcbj+b6s6eMDtxFdx4OupUqfgIYdz
         J3TMF4ga1/1DOsT5PHU7LK/HHC7N3nW13Mo7+USdccG/oX7tfynJaVVUP06egkFfyDr+
         o4Ew==
X-Gm-Message-State: ACgBeo2Q9VsXOteXWMe7cH5aDJfLlTvIiXpMUOYSf4NzrsHNMuPUAdnm
        8c9OaUbmhKEFMktIJe7OLC56nA==
X-Google-Smtp-Source: AA6agR40xBnaJlt4y96z7hQide+xi8Mu/NLv05DSdTOgVzbHuyvjhtAMDPEwIh7iOcbU1H66d7/K2w==
X-Received: by 2002:a05:651c:238c:b0:261:d468:d633 with SMTP id bk12-20020a05651c238c00b00261d468d633mr2085578ljb.479.1661507380275;
        Fri, 26 Aug 2022 02:49:40 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512314600b00492e0be5f4fsm335755lfi.34.2022.08.26.02.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 02:49:39 -0700 (PDT)
Message-ID: <15a6ca5c-75e4-c901-3813-dce0d1dd0d14@linaro.org>
Date:   Fri, 26 Aug 2022 12:49:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 5/5] dt-bindings: display/msm: dpu-sdm845: add missing
 DPU opp-table
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
 <20220817062059.18640-6-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220817062059.18640-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/08/2022 09:20, Krzysztof Kozlowski wrote:
> The 'display-controller' child (DPU) of Display SubSystem (MDSS) uses
> opp-table, so reference it which allows restricting DPU schema to fixed
> list of properties.
> 
> Fixes: 3d7a0dd8f39b ("dt-bindings: msm: disp: add yaml schemas for DPU bindings")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

