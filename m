Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E862794623
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 00:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245021AbjIFWZh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 18:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238543AbjIFWZg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 18:25:36 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF3891724
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 15:25:32 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50078e52537so465626e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 15:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694039131; x=1694643931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDonlp5HbiwJ26g/F+Y1WXSGwKSC1oc1l4KT4dWvVHo=;
        b=hI54Qv7LrQ35ZmoqCzou/jB1NV7db8V8J/7Fvp/qMkGFc+I73XljYrfoCHIO18Uj9m
         2N3A4Xu0+5Pd4GgtMGywTwwpdXWrytV4HQqZaoFsUeXnfv8jr55dVzgof15rXTP7025O
         heMJxqgKWTNjRs12FGGqnroVZnPbFRAXzP3g8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694039131; x=1694643931;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDonlp5HbiwJ26g/F+Y1WXSGwKSC1oc1l4KT4dWvVHo=;
        b=L4TXJhUwkyCBtVpdJlluLwg1CnJMW5TziI/baBboChOWRmEWEBCWmghRxtB4wqePwU
         qcqthQO6QxiPXXsaZnYELCdirEYp9DBSEvUnG/ayifI1wxm0k8cToRC5+VR5/hlc2AQ3
         r3O3e9LU8Ep33bnDoy7ujJ9gT0qzFgK84CEcQ5vu2EGUFjvDHZBZD0JeoGVHsCYbulYR
         2kpcLyWVJg1hLzpYuoD7M06HgcchYSXBZbMKMpSQxZwrZKM2zP8Psop7n+xAHOmGUYpc
         lxxzijs/grh8pGStguNSU56l69Jp9jQJ6Un5KJFKThAE/gqV7U9fGRtfc9Bffq4jAIn5
         v2Jw==
X-Gm-Message-State: AOJu0Yx1Xtvw9lcWJr2FPiYhf5KjQqZBfP133/gMxIVXOtNexoND/dLQ
        5bzyfCmF3ZW00vQwb7w2R5rrs1EdtPQ8+I+MCRx5vA==
X-Google-Smtp-Source: AGHT+IGRyS1c97uF22edCstQnjHE3++8HtvAIKFyj1onPIBRInMD2saCMupJhLIk5aHumPexINlma5qaQAzBw+T/Zf4=
X-Received: by 2002:ac2:4ecc:0:b0:4f8:586a:8af6 with SMTP id
 p12-20020ac24ecc000000b004f8586a8af6mr3147978lfr.4.1694039131144; Wed, 06 Sep
 2023 15:25:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:25:30 -0500
MIME-Version: 1.0
In-Reply-To: <20230905174353.3118648-5-dmitry.baryshkov@linaro.org>
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org> <20230905174353.3118648-5-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Sep 2023 17:25:30 -0500
Message-ID: <CAE-0n508=RCxtWRd67TFGwMDdfNKWU9dJ+q7hVt1GWyTTz1w-w@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm: add a kernel param to select between MDP5
 and DPU drivers
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-09-05 10:43:51)
> For some of the platforms (e.g. SDM660, SDM630, MSM8996, etc.) it is
> possible to support this platform via the DPU driver (e.g. to provide
> support for DP, multirect, etc). Add a modparam to be able to switch
> between these two drivers.
>
> All platforms supported by both drivers are by default handled by the
> MDP5 driver. To let them be handled by the DPU driver pass the
> `msm.prefer_mdp5=false` kernel param.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
