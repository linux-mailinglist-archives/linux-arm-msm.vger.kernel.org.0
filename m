Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D51263EDFD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 11:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbiLAKhl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 05:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiLAKhg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 05:37:36 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938EA335
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 02:37:32 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id l8so1356840ljh.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 02:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CIit3J5M4bcdITVWI6ie/I3FGXLXgR6m6GwfusmdrJE=;
        b=oRuEXXERKZYYDV9WimFhxi+n+W16yYt2dtOc7P5QG08IRUKnts1REggwWcSWA2K7GS
         CFWqZfYbNsg/vcgWQQ6gDHeVl1xTmW6BEWAWnS5pbY+gqcMzZsnq8L7hVPgEOrI+27Hw
         SPbvb6eW8+fT07BwkeFkFtubmtV5KF3Jvsky2iUBjMnzlpMQycRNe3Ezvx7xJEAcUhNG
         +Lgp1rl1ekNfciXbfK+C+cv2ofczu6yn0K8XW9aEDCNpWEGEK8awHimGAY5/lhZxjwwj
         5mTVf+6Jg1X0Nm1Krh54WT05EljJ43fEtjcKBJ7mDa00Sxbyc6tQuE766VVTCZjfEOXZ
         igYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CIit3J5M4bcdITVWI6ie/I3FGXLXgR6m6GwfusmdrJE=;
        b=wku5H/mo7qPRVTIh5AlvXJvNHuqJcoFFE8NL0ybVeTQrW60EJCkwRy8rgT+gi7PfLW
         K2DcVgc0pFQSNQqiiyNPrDmawn9oV6l8ay7vrmI7AEBNl02i8GblhlQ87sajJVa4F1dA
         0WCaVYTesn1sdXyZJDuuP3L2opKt2B1RvLgda7E76qtZ9Uocqq68uCRSAG2v9fx7nxhT
         ervbIjQtNXdTpAcUjgrlK3LS8EAo4NrJ7ov3Z2ZiLLbiUKyF8WvQGhZoashGWk5ZpT9k
         O4Ro9bi/xt0Vl55IYYEvY+Sv/e6vHMvwS1bA4FeV1S0XB1nZUIaPCkzFWpeBQbfdPpbI
         Z91g==
X-Gm-Message-State: ANoB5pnTiAAOUVHaDOiy3exRJJCRqxF2kvsCCHQw0twpsE+m98UZgtYB
        5J4MAlyY6hBTL2rv4tF6mvC4jg==
X-Google-Smtp-Source: AA0mqf7ynKkshYTZoTQ3GRH//Z1ZR04OWdvwe5TEjKbt7pYwLviofbMpiBkGttO94vlLg2DiroAsTg==
X-Received: by 2002:a2e:940f:0:b0:277:5df:9728 with SMTP id i15-20020a2e940f000000b0027705df9728mr14128145ljh.337.1669891050977;
        Thu, 01 Dec 2022 02:37:30 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s21-20020a056512203500b004ab98cd5644sm601503lfs.182.2022.12.01.02.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 02:37:30 -0800 (PST)
Message-ID: <dfd2d1b5-4d1b-2381-ad11-5ea9e6654a55@linaro.org>
Date:   Thu, 1 Dec 2022 11:37:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 01/12] dt-bindings: display: msm: Rename mdss node name
 in example
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20221130200950.144618-1-a39.skl@gmail.com>
 <20221130200950.144618-2-a39.skl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221130200950.144618-2-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/11/2022 21:09, Adam Skladowski wrote:
> Follow other YAMLs and replace mdss name into display-subystem.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

