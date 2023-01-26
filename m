Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04A9467D4DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 20:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbjAZTBS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 14:01:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbjAZTBP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 14:01:15 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 304DD47414
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:14 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id ud5so7711473ejc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haOnI3OyAVqXfwcS0HsyNm7Pe8+rJTYpA3/fsai6Diw=;
        b=aI7jAiKvQ2uiMRXBktX5P60QW7MNpnP9w/47NK1tihCPPjwtlG1F/bXRYEivNUABBg
         /2R6si2WqHTq5yzxL7f89W8KST4CNxXx5aCy+vinMVhXfJ723jMENXqWtjI7UIOCn//9
         34wxXW++4t5URbdJMTmG+teefrnZ/C3CmwTecM0quQPAW3+nQoA829WwYyFpYEQvBoEV
         uv6f89WRq6yzkNIhi5uQ4vtVwSUNy4aGyF0Cv8gxNUEk+NBOE5biCvRTY1HqaN4JUHsb
         1r/EG/VgdikfR8TDwKLn8AikTt1be+WeBYKJVRMyE1JEpiER/0qqovaVza6iMqEDkeF8
         K7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=haOnI3OyAVqXfwcS0HsyNm7Pe8+rJTYpA3/fsai6Diw=;
        b=f+w8htdP3Oia7q5PRUsomAY9Qv7Zufgr+ZJ9Uhk6/iI2rx45IgenEgg57hrf7mK50z
         CXPHxI0Psait5tYHA/HX5605jLXjkfE+hj0xVoHtu2uv/l8z8MhwKyEJKXeFephNaD1D
         1neEZL2M474VJ+zLWRSjpulsKF9zKvI9t9ck/wxFXKs4IoMBif7fYfB8RSm9ucGcVNN2
         AEoe4aE7oZQFMVu3p736YmTqnwjDbOwgEZD+PLzUtSS8YBbxCguG7szR31lVlaceGPff
         sPDv/PkWKicsL7tHwxSfiO8OjjAttOkP4/Hf4+w+k3TBJCg2egMg4hvmBTUUZcs8Ko8I
         Tpnw==
X-Gm-Message-State: AFqh2kqRuyyvU1JExzmM9G8XsJPRI+zUF+T3J2mH0U5TGKtKEE9CfkQ2
        RVINjVWlO0nJxi50FbVQ7034zw==
X-Google-Smtp-Source: AMrXdXu5CVFfASZu8ctXxRH6VwmF+e/MdAT3e6eNsfvzFgivlmcUSImZ1P51B+8TllRh8ESXOCNjkQ==
X-Received: by 2002:a17:907:6746:b0:871:b898:92fd with SMTP id qm6-20020a170907674600b00871b89892fdmr44030118ejc.6.1674759673839;
        Thu, 26 Jan 2023 11:01:13 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 11:01:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: fix sm8450 CTL configuration
Date:   Thu, 26 Jan 2023 21:00:57 +0200
Message-Id: <167475959091.3954305.14689973526637366778.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230123080818.3069266-1-dmitry.baryshkov@linaro.org>
References: <20230123080818.3069266-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 23 Jan 2023 10:08:18 +0200, Dmitry Baryshkov wrote:
> Correct the CTL size on sm8450 platform. This fixes the incorrect merge
> of sm8350 support, which unfortunately also touched the SM8450 setup.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: fix sm8450 CTL configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6c021d77e788

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
