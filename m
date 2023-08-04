Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB9D97704CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 17:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjHDPd2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 11:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjHDPd0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 11:33:26 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B0449CC
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Aug 2023 08:33:23 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe0e34f498so3876102e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 08:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691163202; x=1691768002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkJZcKj0fkFAOpA+ii9LBosfGNpWxtA1197WIIr/hic=;
        b=nR/+5J1icecG0BXV3DYt3GC7xVBsZqDhfRGA2zoYe6sxyaj5zBnJAeU/NOd2yOlUAQ
         zbxmbrN6xqJCLW3tWJb09OBvrHcRMcX/tSUealCPQVyT0qWTGWC4ABcQq7Woep6OEcUJ
         sib6kG2kaEBp/3rsdlXSxql1u/q2zx+RopJWYpmP+ZC+4yN36Nu2jxxNdV2ywjzULzR/
         7aWEjOhJ145JJT55vVjmft71Ey9AgNjBMRO04OFZvWQ36GHlqT/YL/XVUaW61JgvSOdD
         rmXFegDXal65g03lj3NBHP1MlbIhbj5P7B5ToGM4EgEQtl4SHONPDE5jPkEl0ssVUIbY
         juMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691163202; x=1691768002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkJZcKj0fkFAOpA+ii9LBosfGNpWxtA1197WIIr/hic=;
        b=KIX9IRYQT93nKXDVi0vtDs2h6Cg0C5CL4M1RQH6olJVBlJKeUCQgvr0p/IyhBrJbyQ
         sQpei+9Gch16kUwD0JvzkReULe0v+renSnSHh/UCb4y6p2P/Vyo71saKVPCGqjXyDftV
         ZXZr1uK9GGTp8dpVvOzSP0o3QUcjG4656m0d5ZWQKvlixTGAVQxX3le/dWjt6FH7ZZTX
         hqHckQO9V8TJFrWywMcn8Myxalx/2FDW2k+A/Z2Hmz+Pr2PBeAy1DB4EVF8ypS8rQ7Qv
         rJDXN1u4lF77oUSXegrSsqLYKOn+PrqMMgsqMIycvYeqf2tEMOALbvPj4sZt5JubEHFN
         eEtA==
X-Gm-Message-State: AOJu0YxhpMFffJssqSwxp2nzYcGcOeF/xpJoi9ACzSZ7I6P0zh1F+bTg
        t62Z6FyimhFjjpwE2BFTf7c39Q==
X-Google-Smtp-Source: AGHT+IHIS9jgN3PSebWEsZkCoXHSbvwTkZqxiiIqQKiYiCi1TFo0VAB2FTMJzF63PVft4JhcyCWMEw==
X-Received: by 2002:a05:6512:34d2:b0:4f8:7513:8cac with SMTP id w18-20020a05651234d200b004f875138cacmr1464741lfr.48.1691163201896;
        Fri, 04 Aug 2023 08:33:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w12-20020a05651204cc00b004f873ca4139sm411874lfq.71.2023.08.04.08.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 08:33:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: initialise clk_rate to 0 in _dpu_core_perf_get_core_clk_rate
Date:   Fri,  4 Aug 2023 18:33:16 +0300
Message-Id: <169116308154.148471.18222389077643257942.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230804094804.36053-1-dmitry.baryshkov@linaro.org>
References: <20230804094804.36053-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Fri, 04 Aug 2023 12:48:04 +0300, Dmitry Baryshkov wrote:
> When removing the core perf tune overrides, I also occasionaly removed the
> initialisation of the clk_rate variable. Initialise it to 0 to let max()
> correctly calculate the maximum of requested clock rates.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: initialise clk_rate to 0 in _dpu_core_perf_get_core_clk_rate
      https://gitlab.freedesktop.org/lumag/msm/-/commit/34202be95237

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
