Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2832574AC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 12:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237435AbiGNKhY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 06:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbiGNKhX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 06:37:23 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121254BD25
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:37:22 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id n18so2117805lfq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uaEFO5hsaLFOuZUt6jv+BOAU4jn79YFWKdkb/288PyQ=;
        b=R2ZI+qVyNbDDND0je3vBpsX+whHW04w068WNIxvhb21zT9Yl6mNklU1yX6mnEzRuQe
         D9rZ0fWwMQut75SIEgZK31MGeW1Gnn5WW71LRvZd1a6sJXpOIEMvX3j8T9u4ZZGcJ0rD
         XP5QV366XN1eMvJwp1NdjgUmeE6l0tizHxphnC6ZkaHzcolt19mdkvqoNL70EF3zXIxR
         kgUWNfgzv4A+AjVhScdW7KjxCvDeu/bg/V0DTTCQlY1dx7kd8EAvxT2BrqQGoB9TUzvO
         4oyWa2EpxzY93k/um3j6qRzPCCnRTBctTNBmFj3wOHKV+8w+ziaPxRxJ+TkPvHIZ2EMT
         cUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uaEFO5hsaLFOuZUt6jv+BOAU4jn79YFWKdkb/288PyQ=;
        b=QXJLJnvMecxC2DCnD1WOREVP8oj+rFvEGyKuScdIcDKUeEw5cDq48H/H4DQUgCeSs2
         uMCvc5JqP+LbmWdQp8YVvHZiaOT+4W79L/l1W533haVs1rQEGgbaCUxzR1t9YpxveqO5
         IzBk/eF3K2BsoQ29QNVS3B/prL++7KUIAXjp3Fm2CvTIusGmW3FOV7OoNb5UuJDHZ3Wp
         0CsVgmNn6pC+5sAO/ka/CDqANfuJArPjDKL9EbGXRmHL+I3o7JkpScYleZWJn0vBL0sw
         D/ESKz+FA4LzVJY/NY3LiS7b+1RpOkmv/WxNZK1gxOvI+VBoKQlSAu5gPwCWW920dHJu
         Mhog==
X-Gm-Message-State: AJIora91M6BAlxJXrcNa4g5+g1aJ5GECqD1RJCCTcPeyFnFRwklj3Ytm
        vwCdeQlJ1ZPFV5yLFPJ+z4Vy5g==
X-Google-Smtp-Source: AGRyM1utxf3jocJYTmp4lOuPbooaWLQuu8+R22i2G4eb4lV2hNEFPxG8ZtPUZxVm2Iolc9dcifvbbw==
X-Received: by 2002:a05:6512:3503:b0:481:4470:4134 with SMTP id h3-20020a056512350300b0048144704134mr4704424lfs.42.1657795040467;
        Thu, 14 Jul 2022 03:37:20 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id be6-20020a056512250600b00478f174c598sm288201lfb.95.2022.07.14.03.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 03:37:20 -0700 (PDT)
Message-ID: <8d31e36d-5cdb-fd5b-b807-a31e65e57d8f@linaro.org>
Date:   Thu, 14 Jul 2022 12:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 7/9] dt-bindings: msm/dp: mark vdda supplies as
 deprecated
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
 <20220710084133.30976-8-dmitry.baryshkov@linaro.org>
 <bd84ef20-e6e1-74e5-5681-7aa273d5255c@linaro.org>
 <35cbf2d1-f851-fb6b-309a-8d7499b4abb3@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <35cbf2d1-f851-fb6b-309a-8d7499b4abb3@linaro.org>
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

On 14/07/2022 12:15, Dmitry Baryshkov wrote:
> On 14/07/2022 12:38, Krzysztof Kozlowski wrote:
>> On 10/07/2022 10:41, Dmitry Baryshkov wrote:
>>> The commit fa384dd8b9b8 ("drm/msm/dp: delete vdda regulator related
>>> functions from eDP/DP controller") removed support for VDDA supplies
>>
>> No such commit exists in next. Do not reference unpublished commits. If
>> this is your tree, be sure that it is in next.
> 
> Excuse me. It might have changed at some point. I will update the patch 
> description in the next revision. The commit in question is 7516351bebc1 
> ("drm/msm/dp: delete vdda regulator related functions from eDP/DP 
> controller")
> 
>>
>>> from the DP controller driver. These supplies are now handled by the eDP
>>> or QMP PHYs. Mark these properties as deprecated and drop them from the
>>> example.
>>
>> Right now I cannot judge whether this is correct or not. I don't know
>> what's in that commit, but in general driver implementation changes do
>> not warrant changes in the binding.
> 
> The vdda supplies were initially made a part of DP controller binding, 
> however lately they were moved to be a part of eDP/DP PHY binding (as 
> this better reflects the hardware). DP driver dropped support for these 
> supplies too. Thus I wanted to mark these supplies as deprecated to 
> discourage using them in the DTS files.

OK. Just better to reference the commit which adds them to PHY binding.

Best regards,
Krzysztof
