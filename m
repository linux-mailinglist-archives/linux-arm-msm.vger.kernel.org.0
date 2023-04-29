Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 963336F2696
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Apr 2023 23:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbjD2VZQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Apr 2023 17:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbjD2VZP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Apr 2023 17:25:15 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6DDE196
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Apr 2023 14:25:14 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f00c33c3d6so1542712e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Apr 2023 14:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682803513; x=1685395513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YzZiLQ1RhTm38hAxrhMQzyPsWjTgF1J/NPZGUhERY3E=;
        b=N7FoHRYFf4K1l/3EoarHccuAcPRdzs9127z9uCcZVmMTtyZf8mhh6dvHIRbxVKkHUY
         ZiyMwkOzIWmSPyzzfgDx1EMRylzGT4g8dD+IA0TQRvor1DE0KYvM8Oo6AvzzyK1YAsU4
         KCPdyQfOP1TrBTPAJboRLVYBaJG5k4fzzPC5Jqt6WeThEI3vOnc87sNDwa4TkrVZbYfM
         zr7lSqTL0gPD03E/JL3L92e97gmTvwlUDf79XntaAYSuGFzxfXy/rV7rMXEl29fWmrO3
         cOIE1621/pu/C44LCTYv9V1yD9HhoNTAeFbr0zBIT7N0XxsjfHDpBxrc+ACZPrN6nDia
         N7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682803513; x=1685395513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzZiLQ1RhTm38hAxrhMQzyPsWjTgF1J/NPZGUhERY3E=;
        b=D4U/AzlsXiQoXaCnF6xbMNutIJYnxd0qwiDkl8Od17uV9AtnO6nJdP5yCXgh8Gj35y
         9mdcDHkAL1ZDy2vLdrvuWLbbL0guLyEUNna04yyyCuKUp+rv9LHUC7YzA84aKhpW8wz4
         p7oJkqZa6ewEz6Yvx+DVm55VBPMjshG54iUk/9LMtBObwK5pBD1KwdCxNYN6DCk+rEPm
         74REd9vmgLYRMOtqc5/xbEh0zSQ9KR4cwc257pPUTIip5VcBFmpCMgyReEGAa63WdQKQ
         K9l3TSluulTn0ERW14MQXQD6GJ4lHbOU9LGvAs7K17BmBJ5o6exw8xbwbpi6wIh/X3Qg
         eW2g==
X-Gm-Message-State: AC+VfDwHGyAP3YiJ0Uzt3ngc/ZRM3/KrEwqPX3eRQDnuPkuDCW2b97oh
        w9tcBFmn02aQFPtYcjV97Dag1dWxYAcYYeKvkZ3CEA==
X-Google-Smtp-Source: ACHHUZ6F33DBbHIwsessNyI4Vtu3/pIFgR7cmO5CUmi6h8UUWtP/uJ1DYP/Tcx8WzQP9aq9U758YHQ==
X-Received: by 2002:ac2:4904:0:b0:4f0:da5:773f with SMTP id n4-20020ac24904000000b004f00da5773fmr2594598lfi.25.1682803513079;
        Sat, 29 Apr 2023 14:25:13 -0700 (PDT)
Received: from eriador.lan (78-27-120-86.bb.dnainternet.fi. [78.27.120.86])
        by smtp.gmail.com with ESMTPSA id w14-20020ac25d4e000000b004eed8de597csm3929345lfd.32.2023.04.29.14.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 14:25:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3] drm/msm/dpu: drop unused SSPP sub-block information
Date:   Sun, 30 Apr 2023 00:25:12 +0300
Message-Id: <20230429212512.2947245-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver  doesn't support hsic/memcolor and pcc SSPP subblocks.
Drop corresponding definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v2:
- Fixed commit message to remove igc block mention.

Changes since v1:
 - Rebased on top of https://patchwork.freedesktop.org/patch/534725/?series=117130&rev=1

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 69d1f1e59db1..b2831b45ac64 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -380,9 +380,6 @@ struct dpu_caps {
  * @qseed_ver: qseed version
  * @scaler_blk:
  * @csc_blk:
- * @hsic:
- * @memcolor:
- * @pcc_blk:
  * @format_list: Pointer to list of supported formats
  * @num_formats: Number of supported formats
  * @virt_format_list: Pointer to list of supported formats for virtual planes
@@ -399,9 +396,6 @@ struct dpu_sspp_sub_blks {
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
 	struct dpu_pp_blk csc_blk;
-	struct dpu_pp_blk hsic_blk;
-	struct dpu_pp_blk memcolor_blk;
-	struct dpu_pp_blk pcc_blk;
 
 	const u32 *format_list;
 	u32 num_formats;
-- 
2.39.2

