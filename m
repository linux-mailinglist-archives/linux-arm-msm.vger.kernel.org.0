Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E08FA647F51
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 09:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbiLIIfQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 03:35:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiLIIfP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 03:35:15 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A204624083
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 00:35:14 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id l8so4174771ljh.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 00:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ysnzACHXURIkIO+/AQjmEoci49zgr//vhpb8kPXwKcU=;
        b=Dz4L0SfClKX1bHZ81SYcCTOpqPl/TgBLy411jpBd64n3fzciV3rClVWbCDT5GZKmRV
         PP4eUU6/sz8gWqwRx4Rd0yI72rh+vELPXT2Vj4pq1Eiklx1jHNFD46pZnTX9BxP1cq91
         gHfxpu3JJ953kXLi5spr8CtCUdp5Zzc20A75r8x4yZWWNFxTdSjMs0H1I3pex/PSX0D7
         SIN0VvErlW0bTBtizX/T8Q1oKsAP+7wel/FagaS/1+bkt4lue8Aa+gaYf2SaaugUVVB4
         DrH+xVOGbM3EFQmO5KGIZsY2wk2V7cbA1Bl2BdHImwOkn0Sjl09w90hMyf3SKtPWUpq1
         m0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ysnzACHXURIkIO+/AQjmEoci49zgr//vhpb8kPXwKcU=;
        b=clZOTliPCaLnf2H4zT61/z1/Ickd86cj7xWNwJ4wxMojkIqfssUsZHsBqERq05sYQG
         L25VIQIpNHAzOXFteyX0Wt9+h+OrOBNmZr76aO/iXI0ZJ4Yi708+N+QsjP3u3cSUx2LB
         nhX+4Hq/cUNBOaBqBQqq/KKXOfYXAal7/R/XczH1E4lXqj8o+lpYeIZwipa62d79rF58
         ndMPKfeyu02lenPVRXzYFr6NNjrjyamX/VkJ816VCr88izw4ZmqyLO13qtTLdYWCHWoG
         ixddI0YU4ohc2b2SoEAE31s7jIJh+fzbwW9yk/qv3NBbwuyJ5cULtbohWSK5iiLKD7I2
         ZrMQ==
X-Gm-Message-State: ANoB5pmDLXgmuNjBXAFGPhCxk8gwIpuu/U5hB0Grg+VEkHGvadFUn2tC
        ut/IycYthxZ3AdFJwji9YE9B2w==
X-Google-Smtp-Source: AA0mqf4BnUchN5dAKoDAdQcRawUxcca7TShvvAE+vweS7atuhK1MMnvaPvUhFPB+lJePI5J9QSLU3w==
X-Received: by 2002:a05:651c:1187:b0:278:ea26:af88 with SMTP id w7-20020a05651c118700b00278ea26af88mr1713866ljo.42.1670574913010;
        Fri, 09 Dec 2022 00:35:13 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b11-20020a2e894b000000b0026bca725cd0sm131502ljk.39.2022.12.09.00.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 00:35:12 -0800 (PST)
Message-ID: <be4b57bc-2d1e-3bbe-b5f1-8a3946c2a9a7@linaro.org>
Date:   Fri, 9 Dec 2022 09:35:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/4] dt-bindings: display/msm: convert MDP5 schema to
 YAML format
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20221208005458.328196-1-dmitry.baryshkov@linaro.org>
 <20221208005458.328196-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208005458.328196-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/12/2022 01:54, Dmitry Baryshkov wrote:
> Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
>  - MSM8996 has additional "iommu" clock, define it separately
>  - Add new properties used on some of platforms:
>    - interconnects, interconnect-names
>    - iommus
>    - power-domains
>    - operating-points-v2, opp-table
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

