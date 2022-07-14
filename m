Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2F99574946
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235604AbiGNJn6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbiGNJn5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:43:57 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB44DE086
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:43:56 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id w2so1508128ljj.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wbCsquwN1alwH8J3M5l4Cq/ivX95MU45M7AXoqrgl2Q=;
        b=VDTrfZBM8ClaRXetfV8CdxQ52IOBK9xRGfCl1ywFDqNZYyUfYrotPyc/Jyc9V237jq
         dQTXDJFu29YJ70kaqVKRgMLFp9d2FxNHQa7y0u4ey/KbcZqg/UltpGjY/uF2PvToXPJP
         7oazL/GFF7SdJ04NIjspWjFwsoo4iJ1NiQNi1aMTygLwiwChwtxyb9HD7mBWxhDnUZpj
         zpbqM0JIzN8Cbt5oQ80Czb8RobDEtf/x8WAT5LtaejgrCupwDwwpaSy/Dz5eAnrl+2Gp
         p1dwI/uae5d40inFHeYY1UFLyuct6WfsBXuGryhmhDNa7G8c6jP0NBY0tjlBMO5U9/d6
         BsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wbCsquwN1alwH8J3M5l4Cq/ivX95MU45M7AXoqrgl2Q=;
        b=hnIBNKQUGCThL+KaqFpDKvo6cC7sfPDF16GlbuOty5BVGSJlb8N1c1kANRcwobZvGe
         t698TuP/rzG/d/TmMODhKYoOjQDTRt9Hu+JzsK40HfM6RUb0d9yKTawQPs33yuU85HKo
         0k0j4Hpra63KyaRq9jWyC6/EURhcxFgh4gmKa059Ol3QSwQsEG2MNEaHbnblJj8XyipV
         tY7uIZsEOQ5u+FwVZFNOg6yCX1b347f+ojQTeI3ei5A7Y68tp+Bbmd3zwg/nV7znC5mZ
         0EMSoEuDtC4nVNnJPcxNrW9jSnHK+fu0fKU4BYXn9nm6sVzfAPJYFsplUQVW2ugGW/mp
         D6JQ==
X-Gm-Message-State: AJIora9v0zP1pq94gqrV5In/DLFjPC8XkD3VOHUc/m8bcyGP5A6GGies
        +vmiJVBHy6N36bepmJ4PR53R9A==
X-Google-Smtp-Source: AGRyM1u8QlejMdqMFEqmtkhj/2HQFasgTk3M/jud4cK/2ArinXKI5Fjk/WF8hOCTkbuUXx2INzsrHg==
X-Received: by 2002:a05:651c:243:b0:25d:9aa4:d7c9 with SMTP id x3-20020a05651c024300b0025d9aa4d7c9mr1424686ljn.35.1657791835374;
        Thu, 14 Jul 2022 02:43:55 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id w23-20020a2ea3d7000000b0025bf6099cdbsm191079lje.78.2022.07.14.02.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:43:54 -0700 (PDT)
Message-ID: <6e47e212-27a0-0adc-40c4-dea272fd2d72@linaro.org>
Date:   Thu, 14 Jul 2022 11:43:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 8/9] dt-bindings: msm/dp: add missing properties
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/07/2022 10:41, Dmitry Baryshkov wrote:
> Document missing definitions for opp-table (DP controller OPPs), aux-bus
> (DP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dp-controller.yaml          | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
