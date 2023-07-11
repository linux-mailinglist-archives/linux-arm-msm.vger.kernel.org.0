Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5566474F1F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 16:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233532AbjGKOWk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 10:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbjGKOWZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 10:22:25 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8988B1BCE
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:22:02 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b6a084a34cso88281621fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689085318; x=1691677318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3W+xlIL+92+mtc++eFiUk2X+gdyaS8tS745CS5vqzOs=;
        b=pSWajOYHz+yJb3wDqA1JfnJsu5NUfy2QnvR0mrgsbuDq4vNQVKZ8GG9nkVwb/1Vyb3
         G55ePchLyqxCoW/5qgX9PFOqT8CZDZOY4MxGBkjT9ZbMQqejNdUDOMmNuSzjIxBC6E9n
         e6Ws4FAukID5i+oQ9TuVm2mCbXrvfWQjKfqPZ5UAnkv2RrF22zL0VMt6nwEPMyj+gF7F
         yOtOLxWt27Ch5W1OWIznR3G4NVj8KZuPEdpxwzBUXit2zI3fomzLulGy82QLOQBv8ztB
         cmoJ/6UB6Y+7F5nvklhM4MJEsjRejIywSc3WvbEDQDX6sP/LZNc/mbm782Z15DQ78q2M
         46rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689085318; x=1691677318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3W+xlIL+92+mtc++eFiUk2X+gdyaS8tS745CS5vqzOs=;
        b=UaH3pYNxamoEilIAXWytFc7HJp2trxlcY7nGxhTpeZZAIt1LS7lOMwvdRPeLO1xqed
         2wMLER1onZOT+H04Rx+M0BtDnCu+NZnE++a+EzhtjQpsadWLeDj+qIPds7O2Vv4f8KSc
         WbULCf4eKZxm1aJ4xJ6cZ474DAmGGgeD9+LdQ4f8yxyMiWF+v5WNLvpi5K70cvqBjvCA
         gla+GHaM3oXRfjMe7ehtJCfmTjuAK33PsIfOmgyc2ooUngtG5f/l9kvUErePsFO7AFyE
         i7XhL6mjmMUypjz/8sf7L40OgCRnzxjUbaI5Em+TP0RzdlbQtcAr25YqFgTnjb/Htwem
         DCbQ==
X-Gm-Message-State: ABy/qLZQDRobhvVRwG5E8NryacIZJ2ZTHwwjryINwSkZkoE/1lYlSs/p
        2ldIk3i2zhd4sB8jB2WRvpu0bQ==
X-Google-Smtp-Source: APBJJlG3UheJ5PjWmq8p+u1ZohyLsO6cGtjSYMuPOe2sR7renrjFhF1N9uvXWi64yWQa6e+5+vztGg==
X-Received: by 2002:a2e:9b15:0:b0:2b1:a89a:5f2b with SMTP id u21-20020a2e9b15000000b002b1a89a5f2bmr13320689lji.2.1689085318180;
        Tue, 11 Jul 2023 07:21:58 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:21:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] DPU1 GC1.8 wiring-up
Date:   Tue, 11 Jul 2023 17:21:47 +0300
Message-Id: <168908465046.1869384.9699263240973946904.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Thu, 20 Apr 2023 03:14:53 +0200, Konrad Dybcio wrote:
> Almost all SoCs from SDM845 to SM8550 inclusive feature a GC1.8
> dspp sub-block in addition to PCCv4. The other block differ a bit
> more, but none of them are supported upstream.
> 
> This series adds configures the GCv1.8 on all the relevant SoCs.
> 
> 
> [...]

Applied, thanks!

[1/2] drm/msm/dpu1: Rename sm8150_dspp_blk to sdm845_dspp_blk
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9891b3df2b43

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
