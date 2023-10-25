Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4387D6769
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 11:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234922AbjJYJrl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 05:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234929AbjJYJr3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 05:47:29 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A2FDD
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:47:11 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c509d5ab43so83126691fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698227229; x=1698832029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BpOpmDLtAqArpJSPKcIM3DaKWUTQYNNNS011ZdujvEw=;
        b=Iq/KdhrEHmJcP7/6L/768BdMyhM2Ljs/CVNOepkN+pmWpdZ0DIgqK4sLeRP4yYgd3i
         MCydtCv7tTd4+Hw75Ozu6rn1tKarhz9c+EwLP/6+Vkg6M/pw34cTr2KCH4/pS6D5feE5
         QFcMA3AFNGnj6MmSYNB1tUnlvDyM6LgV+XIs/wCblXdXiVti6lDpG0DcdYvyd3oDiVEy
         +1qTZc58ECZgRv1RoOlFqxUhLTLPdK7RobMXb0QXmGgUQ37H5wGqRaShSKOCFqgQTohR
         5TazsDpt1toQbFt2+Kyi8BETlHQ9Aew2blmVBxcjkzoupl0SAx7HZhS0JvBNHztV1m+k
         irFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698227229; x=1698832029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BpOpmDLtAqArpJSPKcIM3DaKWUTQYNNNS011ZdujvEw=;
        b=M55XVV2fFISL66ZDkqrxnFF6e4TVjitXiF3XVNZBJ+R43gJhBkrlRvBaUzR2itwPsS
         Zc7p4Oh/m8DkFAbqF2133igV/pWWemvZcp1pJ0vA9Q9lFa7h79VZzBBZhGDwmoy7i2cX
         eQHP2cmXyG9TafXYHMm1oSH2U5yhK0QniKHmL2ALQMKpAEMwN6SJ0KPUUiA4yiB6XI8I
         GistnPzrbNp7UeknUdyGLBkgcUwjpZKfL9GisPWkS+19MOzvjR88PjqkYZASaYl7eUkD
         MXvB3FtY/yBICpSL06MQv4KuD44La57d9iVroQqysOc/hcMYWqtOinnov8pLZzyO9NRm
         5BkA==
X-Gm-Message-State: AOJu0Yx0WNaemi+acZdGkAOJShjiyOC9TyNfYFqC+Oo0Pnn4NtVs9Hqq
        3lwwYI6AEwV/r5Vh/yDmWAOhLQ==
X-Google-Smtp-Source: AGHT+IFfoE5O1nQZ7hXWildQtNSnhIVdJ5jytEwleTyUMk9tayjcCN7BpnQ4sQx8gdWyCztiGvDZsA==
X-Received: by 2002:a05:651c:155:b0:2c5:2423:e225 with SMTP id c21-20020a05651c015500b002c52423e225mr10223859ljd.6.1698227229257;
        Wed, 25 Oct 2023 02:47:09 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d18-20020a2e3612000000b002c503c2dc97sm2287970lja.64.2023.10.25.02.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 02:47:08 -0700 (PDT)
Message-ID: <2142be46-53e7-4e8d-956d-c82d1abb21a2@linaro.org>
Date:   Wed, 25 Oct 2023 12:47:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: remove unnecessary NULL check
Content-Language: en-GB
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Su Hui <suhui@nfschina.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <ZSj+6/J6YsoSpLak@kadam>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ZSj+6/J6YsoSpLak@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/10/2023 11:25, Dan Carpenter wrote:
> This NULL check was required when it was added, but we shuffled the code
> around and now it's not.  The inconsistent NULL checking triggers a
> Smatch warning:
> 
>      drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
>      variable dereferenced before check 'mdp5_kms' (see line 782)
> 
> Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the _probe function"
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: Added a Fixes tag.  It's not really a bug fix and so adding the
> fixes tag is slightly unfair but it should prevent this patch from
> accidentally getting backported before the refactoring and causing an
> issue.
> 
> Btw, fixes tags are often unfair like this.  People look at fixes tags
> and think, "the fix introduced a bug" but actually it's really common
> that the fix was just not complete.  But from a backporting perspective
> it makes sense to tie them together.
> 
> Plus everyone introduces bugs.  If you're not introducing bugs, then
> you're probably not writing a lot of code.
> 
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

