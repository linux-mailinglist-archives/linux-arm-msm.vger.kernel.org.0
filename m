Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF095574A59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 12:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238310AbiGNKP6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 06:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237452AbiGNKPn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 06:15:43 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071335244A
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:15:33 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id n18so2034824lfq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kZy7eak2tgSmF/ML1yqzjltWCPwtqthXqM78zNDO+OI=;
        b=eMSSra1OPQfu7qXpz6L3saU1JxVj07p/HHh/qXvdSMrvPrpI9qzcyriFOtEcrm9xsq
         hetCcxkb3c2U8abIkPdW++76prqun/Vd24FxpWfWpCdXT3DP1bPcplIo2B3ULIAFXyN0
         RJBbYXxuWRYFJej6+xS6qXa9hkMoclJM97KGsgSY6KXBlG2c6tiB3t23uDbTCEfQeGJt
         2bj5bT6Xs4/8eGC5UjkA2K5J6iOIYjIA1PW/4r1LCIRP3fxMmFj1HOkDxOoyKib9R6ot
         tLm8NLit0aZHhCsBUusz9vadcvFZJBDpI6Fdc2ijF4xNhGgYBpjQ84xeYuUXehixkcx+
         IXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kZy7eak2tgSmF/ML1yqzjltWCPwtqthXqM78zNDO+OI=;
        b=OScEsA4k1xHr2x/SLtcOlbs6L1PdCFZKfeBZoNuzi0lY4RN9Cdu0OH90k49YPmmvYS
         ZDwXR/gn3bVS6D/F/61ly5AcJpES23MdZyU6CXbJKx/dHK9ysvCS43ornFLq5f23+Wti
         ll9k6CVMmR0gHmwGVT0oF2GMjALmOK6h2CjCeHVzNqp1P22j5vfIcpimqbDDzJtnbhlv
         9R3sqyEHP/acuWNsiVjoRZ9KuwarpSNBmkMndst0rm3DlRCnKQQbB3c+aXWTEEuy/BBH
         tyLwxhny27ws9Z2rytqsfRECRtxPRGY3efDJNbK2MzWDkI9huKUYJBMcY/PgmKj3F+Bd
         IeEQ==
X-Gm-Message-State: AJIora/WXRRLaSoby3VFDk6JTZRiphDXW2ZtZl+h+sreA4ZKk8BjUgm1
        HA9IVI4Z9DTNK6U8V+LEB82Ffw==
X-Google-Smtp-Source: AGRyM1v1V9ZiyZF7bonIiq2DwpF3Map16xUjhG7MRlmoFvEpyTCgjb4sm6OM4dfGd+xpxCSIJBPwUA==
X-Received: by 2002:a05:6512:1399:b0:486:2ae5:be71 with SMTP id p25-20020a056512139900b004862ae5be71mr4640937lfa.246.1657793731321;
        Thu, 14 Jul 2022 03:15:31 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i15-20020a2e808f000000b0025a968f4ffesm205854ljg.19.2022.07.14.03.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 03:15:30 -0700 (PDT)
Message-ID: <35cbf2d1-f851-fb6b-309a-8d7499b4abb3@linaro.org>
Date:   Thu, 14 Jul 2022 13:15:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 7/9] dt-bindings: msm/dp: mark vdda supplies as
 deprecated
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-8-dmitry.baryshkov@linaro.org>
 <bd84ef20-e6e1-74e5-5681-7aa273d5255c@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <bd84ef20-e6e1-74e5-5681-7aa273d5255c@linaro.org>
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

On 14/07/2022 12:38, Krzysztof Kozlowski wrote:
> On 10/07/2022 10:41, Dmitry Baryshkov wrote:
>> The commit fa384dd8b9b8 ("drm/msm/dp: delete vdda regulator related
>> functions from eDP/DP controller") removed support for VDDA supplies
> 
> No such commit exists in next. Do not reference unpublished commits. If
> this is your tree, be sure that it is in next.

Excuse me. It might have changed at some point. I will update the patch 
description in the next revision. The commit in question is 7516351bebc1 
("drm/msm/dp: delete vdda regulator related functions from eDP/DP 
controller")

> 
>> from the DP controller driver. These supplies are now handled by the eDP
>> or QMP PHYs. Mark these properties as deprecated and drop them from the
>> example.
> 
> Right now I cannot judge whether this is correct or not. I don't know
> what's in that commit, but in general driver implementation changes do
> not warrant changes in the binding.

The vdda supplies were initially made a part of DP controller binding, 
however lately they were moved to be a part of eDP/DP PHY binding (as 
this better reflects the hardware). DP driver dropped support for these 
supplies too. Thus I wanted to mark these supplies as deprecated to 
discourage using them in the DTS files.


-- 
With best wishes
Dmitry
