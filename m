Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFD56748E98
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jul 2023 22:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbjGEULM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jul 2023 16:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232704AbjGEULL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jul 2023 16:11:11 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E811727
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jul 2023 13:11:10 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fb9fd28025so10258827e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jul 2023 13:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688587868; x=1691179868;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGLJKpWgZBypqeVIuylMzwlHijLnJxgvbBCgFK/ra7c=;
        b=o+gRKWs/8XgZZ0cK4Xocevje4YZufQEk8+P8MF8mttaHZGq3iX8blzoHyvHNYac1Jp
         QWB0/4jS1BDnoK9Gqzzp5AyQT3bx7xBCyqU6oCx0E65ZBinW9FIOAKooYudWApUTGej4
         topIIEqTcPIDSlw+1+ijFOB8nhshkBR9ADwee/7uZ8fOi82na4gkf3FsNvE54lxA15fu
         9EDbjhVz6mOCzGtIN5/LQsf/i18G63Wj1VUcia3z5giJ/XNJqFCjALoAAM4klLqkm291
         CgzbzIw3vv1WHM9QHkWxvroIGZ1zdprtR3AmrKuooJZhCKA01Me7b7WwHIHYx4wNx2qr
         oxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688587868; x=1691179868;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGLJKpWgZBypqeVIuylMzwlHijLnJxgvbBCgFK/ra7c=;
        b=Zemm1mngGvpiSkOme3gduDsqsT8dECIDMHb9hT538lnse9Tbi/Txu7NylSISKdao/0
         003J/Vbat7H4JYYsoU5mMF7DNoLa8aya8dYQ6CzZNfs0C1OndJ4zKrzF2ApyWzc0qKzt
         Zh8VY8vUEBxgqh8of4ueaeodIt783Iirxxk/O7o1AZ3B0xZ6TPvnjBl4zpCZiqbps5Qe
         RVTnXSeuM7VXK+7fu0KAI+QEHQR4LGNwiiHWYiI49MZWAwbU2OAeDvUeoOqMyEZEe8Xk
         bdxxHzuOjStg7n7HmTQo1n8MetkEmpemwsWKtZerbtw/2c/vl8DxzhKhZ2BN79PK8WJQ
         PjLA==
X-Gm-Message-State: ABy/qLb+PqifQqbEB//T4tRHdBtVKDOILqUWjg9M4yv4bEBRWvYSKLfX
        KIybxK3tnbs7cCvKgG1n2hC4Bg==
X-Google-Smtp-Source: APBJJlHQ4Ke1hGqOFB8V7SnRmnz79Tc1Kd2Dj2AIoT7Rl4I6R7yNlKDZHH5Ivqw/Uw1R8lIUxcuavQ==
X-Received: by 2002:ac2:5b42:0:b0:4f8:6d54:72fb with SMTP id i2-20020ac25b42000000b004f86d5472fbmr18406lfp.62.1688587868189;
        Wed, 05 Jul 2023 13:11:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id r2-20020ac24d02000000b004fb745fd22fsm5086277lfi.32.2023.07.05.13.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 13:11:07 -0700 (PDT)
Message-ID: <d3c23e3f-276e-8148-38a7-7e68b2d99240@linaro.org>
Date:   Wed, 5 Jul 2023 23:11:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/5] drm/msm/dpu: Drop unused num argument from
 relevant macros
Content-Language: en-GB
To:     Ryan McCann <quic_rmccann@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_jesszhan@quicinc.com
References: <20230622-devcoredump_patch-v2-0-9e90a87d393f@quicinc.com>
 <20230622-devcoredump_patch-v2-2-9e90a87d393f@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230622-devcoredump_patch-v2-2-9e90a87d393f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2023 22:30, Ryan McCann wrote:
> Drop unused parameter "num" from VIG_SBLK_NOSCALE and DMA sub-block
> macros. Update calls to relevant macros to reflect change.
> 
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

