Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 687587BE777
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 19:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377252AbjJIRLo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 13:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376797AbjJIRLo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 13:11:44 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE0894
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 10:11:42 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5041d6d8b10so6073295e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 10:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696871500; x=1697476300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ecd1PChzNNllioksjF5X+EC2tvJe0Y+6IeY9h8SeAA=;
        b=SQoDbQ/YA/ozg0tJpucQvvCz7Myr5reuvWksnrKFyzQgaiZmJ2XhpghIBOS5dUNTe1
         KbFadB00KMxWPF1C6xA7iqOOmwbn3MeQtQ5aDg3QbD8RL/GiWsl900ntnG7OOvELT+68
         zYe7GX7QTn+BaEIei2ztM/jR+ZitRVOiYP3Zkp5A4ojJEXKwm9HKOcBO2hHoXcX1b/ro
         TEAkJS7xuHzy9x20gAuQgmf/Kf/kvJKpBbxaLwwyrZiNt98f+VwBWN3cmQSBqHQZWcTD
         gN+l2nJSVL5hGrxzRtyts07B6mfyQ2YxylXI3q5liXnBCMVjaFUS1HQT7B7DdN+Z1QHS
         xUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696871500; x=1697476300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ecd1PChzNNllioksjF5X+EC2tvJe0Y+6IeY9h8SeAA=;
        b=hi/2C7YMnLh7zu6ycjSADYRxVXmZbbdVnw4uwimzzQQ6iX9vwu6GtsAp8+JAga/7hU
         yIkACCF7E++ooKvVPnkgRClO1NBNanErB/zV3d378/pYt7QGbVMj4sWndtCFRCf/kHO1
         lUwvjkeR2Bf5HYJA8fN6Nmm5rTa9vYQMzfmzmZ6ZEKB31j2lJexYB/UtX4qwcOAUduN2
         clTkzj6ZyssDNdd54IbeaY1QMyZRCvbyL3JIXsfvwvhh2ESKjIx1JjTUnQXr2wA+7mtW
         PTcFJzJRcC2/eVTwR+HHEbz9xAFzGnZFAdcj5s9tkZQSvWjiFldrzMZJflA4ioeOinFl
         vvqg==
X-Gm-Message-State: AOJu0YzXwp4gqrdz2bV+r4z2xPtpOTv8NGut7WL8xYiyc4xfIp6h5yiq
        1nb5ze2XgIR4/S9yG5bep9bsDw==
X-Google-Smtp-Source: AGHT+IEf//wBEmW4CzrPJydxJldnlCzJv8ir8rAarHGZky2u3mCkBKCaeshO1HnrkGHVAEXnN+ATjg==
X-Received: by 2002:a19:ee17:0:b0:503:2891:444d with SMTP id g23-20020a19ee17000000b005032891444dmr11904188lfb.64.1696871500325;
        Mon, 09 Oct 2023 10:11:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020ac24c81000000b005007e7211f7sm1517748lfl.21.2023.10.09.10.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:11:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: correct clk bit for WB2 block
Date:   Mon,  9 Oct 2023 20:11:39 +0300
Message-Id: <20231009171139.2691218-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On sc7280 there are two clk bits for WB2: control and status. While
programming the VBIF params of WB, the driver should be toggling the
former bit, while the sc7280_mdp struct lists the latter one.

Correct that to ensure proper programming sequence for WB2 on sc7280.

Fixes: 3ce166380567 ("drm/msm/dpu: add writeback support for sc7280")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 3b5061c4402a..9195cb996f44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7280_mdp = {
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
-		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 	},
 };
 
-- 
2.39.2

