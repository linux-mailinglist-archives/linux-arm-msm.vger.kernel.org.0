Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1B95F50FF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Oct 2022 10:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbiJEIiB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Oct 2022 04:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbiJEIh7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Oct 2022 04:37:59 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0162733F3
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Oct 2022 01:37:58 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id b4so17891232wrs.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Oct 2022 01:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=q9iQElDOirbdVJ/B2wLi7+yO3Wyao1noVf51AiDgJFo=;
        b=OlZtr53AiAqaCEsScp6R2DjaV8/Fb58pybt1lgbnH1EgriiP6LztWPIzooExFSAD76
         Z8j6s0Ka7MEt0NlNVNhmVGUxKgK386YUGGF8uTLnV4/TU6kklTCpZakSoMJ6xZGc7Jvl
         DiDAsgfgSZcKMovt4bsYV/+0fIPNy0UJjhFZ1kJFz+IhxB8mGC0iI97bCC7qZZ+Vodx8
         3+TCboQO0Cty3kxXJA4GkLspQVRi8+fw/Gw1xWf42w/W92nYWuTVvvJ50BPwKl/0dxXD
         BIr6W8R2U1z0BXDEllV+CUVSoBPXzBBcxb1VJfV1Zr9r9OYjEm9InX5qKdpNZId3ncRo
         GP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=q9iQElDOirbdVJ/B2wLi7+yO3Wyao1noVf51AiDgJFo=;
        b=5xB2hZtL3BSKeedIbSa3Fzm43x1vhXyK0+/IgsZFmcO9p9WYBLlDOOgoTrmpfeL/l2
         qRNvlnNkj3sunlM8rdwnkERNDwPFnWUBvdfTtK9R6K66As+8Tzk15ic59XY/27I8pTB1
         LJP66rOBJlJTKkrUmOGLzluNw4qGjEDMNq2mcMjfusGPW3w5IsBK72tSTHwhRbUccThS
         BSRJU+OT36Eh7HcTvwu8zFXMbAT/1OM2mBMFXI9UXh0DLglBH1mVGZJShcmpj1ctVbrt
         VZk/U69kr65k8zicoug8tfidqDB7YtYkpktfi8/c71demq7BIMzKkmFMpsbZkxfhnGQ/
         H8Xg==
X-Gm-Message-State: ACrzQf1yiRcDCG6kidCh4EahWMnaMIb+Cteysc1fCy2ig3mFLaVTaIVY
        Z/y9jhrV+lz183hZIHGfsi7F/A==
X-Google-Smtp-Source: AMsMyM67V0zhQ5v9XoNEOaJtjEfK70k66EnzjM1HriUB1ZeCiVO06hT9kkF9RIZKg2KyVjhY5zxbMw==
X-Received: by 2002:a05:6000:1acf:b0:22b:36ad:28e with SMTP id i15-20020a0560001acf00b0022b36ad028emr18582345wry.314.1664959077080;
        Wed, 05 Oct 2022 01:37:57 -0700 (PDT)
Received: from localhost.localdomain (hst-221-6.medicom.bg. [84.238.221.6])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c310600b003b47e75b401sm1318171wmo.37.2022.10.05.01.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 01:37:56 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/3] venus: firmware: Correct reset bit
Date:   Wed,  5 Oct 2022 11:37:28 +0300
Message-Id: <20221005083730.963322-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005083730.963322-1-stanimir.varbanov@linaro.org>
References: <20221005083730.963322-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The reset bit for A9SS reset register is BIT(4) and for XTSS_SW_RESET
it is BIT(0). Use the defines for those reset bits.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/firmware.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 14b6f1d05991..3851cedc3329 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -68,9 +68,11 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
 		venus_reset_cpu(core);
 	} else {
 		if (IS_V6(core))
-			writel(1, core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
+			writel(WRAPPER_XTSS_SW_RESET_BIT,
+			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
 		else
-			writel(1, core->wrapper_base + WRAPPER_A9SS_SW_RESET);
+			writel(WRAPPER_A9SS_SW_RESET_BIT,
+			       core->wrapper_base + WRAPPER_A9SS_SW_RESET);
 	}
 
 	return 0;
-- 
2.25.1

