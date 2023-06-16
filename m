Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D56CF732C72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 11:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbjFPJtf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 05:49:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbjFPJtf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 05:49:35 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA131119
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 02:49:33 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f6195d2b3fso588004e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 02:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686908972; x=1689500972;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZF9KFxIZfNMlNnN4a5urW2y13NYb+j9w9JbZAccnI0=;
        b=LfWXM+bRQRhDl55+u4QJwEWR5CJEukjUvCsWZAZFzHhp2yFtZl9WGm4OubFYJkZiXv
         3lhGyX2bLcQIZny1ciEPpo4t9xxxrI6LbCIGfruPUopKQQyrJv+BLTQgJiTyLdIIXzLj
         O0MZMtgBCvxbtU9Es+1ratCjaXLYRHzEzrunfJ+g3UoA1qhsWVPcO5GoxsVASmv9XwHb
         4tBbcihqgNfxTVE9N4YxRZeQ+8403ctzR6BB+ukLpkJk/27tXH2x0f4rWgs8kPQ0J6hC
         MXEu+XCEMuBM6czE1eGSW0gjMku5s/Jge2AmRAjHEQk236E8SOlwRWLOC0bL8Dv//K9s
         zcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686908972; x=1689500972;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZF9KFxIZfNMlNnN4a5urW2y13NYb+j9w9JbZAccnI0=;
        b=fV65yU1Wkn0NX7vkqYAYNqNVUL9cvEIERVjtkQp+8XdetcUCdwN4lqakDXyFHPHBPE
         6X0Mw4sVzi0A/nf/B/1McKHM0G5BN/HINutWDNoUalnvD3WTHnABDTl/gYPxEJVDx9PV
         CxpYFPfJ7lgZV6lOjz/jv+d+siUGwzYHOC11ofUtMvhOIEfOHi5vI06oHB8eRMiOTILN
         8/6jId2kNrDuD5SrReoH1j1qOoSAWnRQXSgYPZs5iucMX9RYV/odekctAPzCAQpWpt3m
         Evdth3WnXr/4mWuvT/t0WWhlEHu/BKV1G+btdgFnNYAcz4+tF4NtEcSvXl3CzDTWzjR8
         sL1g==
X-Gm-Message-State: AC+VfDzvd5CGinnH02bShJQ1W4JDfl/4f+Nh3NwF4nJ0S4Xp8bT9B3k0
        PkZ/3aYsqeXVa7AazfWT/JFatg==
X-Google-Smtp-Source: ACHHUZ6vKJ7mGdwajEVNIi/+OLER02kz5AF6qKLt13kQX+hdase2WXOCzr1xf/RqVopNxr3rMVXTKw==
X-Received: by 2002:a05:6512:54a:b0:4f4:cacb:4b4b with SMTP id h10-20020a056512054a00b004f4cacb4b4bmr940977lfl.18.1686908971946;
        Fri, 16 Jun 2023 02:49:31 -0700 (PDT)
Received: from [192.168.1.151] (85-76-68-127-nat.elisa-mobile.fi. [85.76.68.127])
        by smtp.gmail.com with ESMTPSA id d15-20020ac2544f000000b004f858848fefsm65878lfn.177.2023.06.16.02.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 02:49:31 -0700 (PDT)
Message-ID: <f954a89f-a0f9-c30d-385d-6149dc360c1f@linaro.org>
Date:   Fri, 16 Jun 2023 12:49:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 03/22] drm/msm/dpu: remove unused INTF_NONE interfaces
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
 <20230613001004.3426676-4-dmitry.baryshkov@linaro.org>
 <6akejrsahbmrueanyhx5hdt5kipkm2fb4dylh4jzprfgzdbczk@x75wfsoza5ah>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6akejrsahbmrueanyhx5hdt5kipkm2fb4dylh4jzprfgzdbczk@x75wfsoza5ah>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/06/2023 01:26, Marijn Suijten wrote:
> On 2023-06-13 03:09:42, Dmitry Baryshkov wrote:
>> sm6115 and qcm2290 do not have INTF_0. Drop corresponding interface
>> definitions.
> 
> As Abhinav said, add sm6375.
> 
> If it wasn't for sc8280xp using INTF_NONE for fake MST, we could have
> dropped INTF_NONE and the special-cases in dpu_hw_interrupts.c and
> dpu_hw_intf.c entirely!  Is that your plan?

I have not thought about it yet. Generally I think INTF_NONE might still 
be useful to document interfaces that we do not want to support for some 
reason (e.g. MST or 8974/8084 eDP interfaces).

> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 

-- 
With best wishes
Dmitry

