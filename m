Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C094F5A258C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 12:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245283AbiHZKLE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 06:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237428AbiHZKLC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 06:11:02 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70472AC250
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 03:10:57 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id l8so1356348lfc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 03:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=zBsaAPXHP/WINN92NN7t+ecJR0ITtEiUOYhWSRxDrOo=;
        b=ZUeoL8+bFhmGyi/2xXx0UdI4XZSmxqCoQ/yHxfiLH/DU9QQGvq9wEZGUVjYwgMXwKi
         26HcnUPfHIWYzIKhYqQoZx90f3H0nrZfVGP/eqKhMhYGWJD04pqDRjmwvRzRM6h1tcaE
         LRVVaFFo/wx3mmsFyOheVWHkOmEb2o1C4IziuaZBI94AH62n4M11qRSK7FOIrfQIzNf5
         vThpod+1K9nDrs5ER0gKpQtabrijnomOc8918irJfKNNhsd2DNxbrg/VkjLVjWgoWFMf
         kj7VPv/e9UqGXTgGWpvzn4orocfJ1/AjcFV9M5WeSnycQn0CMeGRZYnXfyhfkU9f+5aT
         EtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=zBsaAPXHP/WINN92NN7t+ecJR0ITtEiUOYhWSRxDrOo=;
        b=5jlIK8dRe2bmWqimdPjWGSBrFXX8GJNs6YkfUdbyfmgh+wGU1UP8HxmBpnXRFPg91P
         J2ovvV8pi+4DKIyU6DzrGoI44mKFB1CbNz+mLYOi0bRzCu6TkIcqSPFO9eqimD0GP5fX
         wz8MmpKuFloDWnIBU3qY3ccOj/+nuPLky5zvGkF2pX/1OzrHjOCGV+Ht5TRiaocDOfod
         /J/EAHzCUI5SYwF20OsiCkBEFMFq9iy9YxqYuKi0dqaUSqCabFJoyaqxu9oiplLRvAJP
         5+tdSj8Siz9LJ/ynKlkPlySTUVoq1cCSWgWFLaeaxZjaC4ra7joYYHGYfvD+uBxWsiip
         j5ng==
X-Gm-Message-State: ACgBeo1k/UWiTYTDinQVdtYrw57TY7EZk06JP5CJLKgeI0R9J0e4sYH6
        apPYJmy5WRbvhO5A67Zm92NRvA==
X-Google-Smtp-Source: AA6agR5Ibvjx4/X46gslkNdnrORZcJxR+lxt0sY3ESbw+/23dXGNcAwyX3sJKgTU+5hglvPmE7IBFg==
X-Received: by 2002:a05:6512:2248:b0:48a:f8f9:3745 with SMTP id i8-20020a056512224800b0048af8f93745mr2137147lfu.256.1661508655644;
        Fri, 26 Aug 2022 03:10:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s15-20020a056512314f00b0047f7419de4asm330732lfi.180.2022.08.26.03.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 03:10:55 -0700 (PDT)
Message-ID: <47e1460f-e775-d1cb-f622-ccac3044ff86@linaro.org>
Date:   Fri, 26 Aug 2022 13:10:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] dt-bindings: display: Add missing
 (unevaluated|additional)Properties on child nodes
Content-Language: en-GB
To:     Rob Herring <robh@kernel.org>,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20220823145649.3118479-11-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220823145649.3118479-11-robh@kernel.org>
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

On 23/08/2022 17:56, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/display/arm,komeda.yaml        | 1 +
>   Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>   Documentation/devicetree/bindings/display/msm/gpu.yaml           | 1 +

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm

>   .../bindings/display/samsung/samsung,exynos7-decon.yaml          | 1 +
>   .../devicetree/bindings/display/samsung/samsung,fimd.yaml        | 1 +
>   5 files changed, 5 insertions(+)


-- 
With best wishes
Dmitry

