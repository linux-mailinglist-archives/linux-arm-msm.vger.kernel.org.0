Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1920770983D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 15:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbjESN31 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 09:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231740AbjESN3Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 09:29:25 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D7BC2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 06:29:23 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ac89e6a5a1so36264761fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 06:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684502962; x=1687094962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSc4FWFPOC7I3VWo73gY6L/30rahECGBPz2uIJ+lIl8=;
        b=WhLqizIUe0ihV8op6KYQ0ETVO1lZwrmjCRYqWNskYT4M3x6dwxEX/V+1VnG7Nb1DyG
         0GQfht9+nzzHag994JeqCPRSHTLir5EovjTPlbjcFfRY8iNgvHcdzuszw76BufcbftcR
         bbHC1HS2uRbBmdWLpaTJh2akWO8ABZe2e1xPTFJxzqErbQcAe6so5wu5yVOxrFY9WYS6
         ObVRDZz6qOQIQphahTtRDSndv3iDWoRg+kodvI38/oQsEr3dj64qmjjkNty9lBu6u61o
         cRBeb+WTDxkNMdRXl1dHwkthjorYO6mk46zBmfa93w2hQ1MTh/NKgJLNzcJJvD6okzig
         HtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684502962; x=1687094962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSc4FWFPOC7I3VWo73gY6L/30rahECGBPz2uIJ+lIl8=;
        b=QTDlYE9uQgPcfgU+6gx1PuknH4albC+qDBx3y2JlBTtFTAKXeYVjLt6BWZ326utwx2
         GP9aUryObsdX7FnFehnukFtg4UP2OQvkeYE78bLzdZ82mcCe3l+kkOXIUESCGvaA2AOC
         vugt3SviASNLuNQEcmKFSM0JduLO1ZHxY+xsrd5vL5bLfqYngW97BV/KNhc7xTKAdSjP
         uqMOyUJgUubZddbJeext8cpLEwDBJZfRXAS6zd52tcqLnkHYXEKFIRddPf7S5StEvgQh
         iGLC1sgKzlJjw11hPciMHkPcmperJcWpgSMSnYHPtXKRMsL/862MUuXMJLLpN9QurJBn
         gmEQ==
X-Gm-Message-State: AC+VfDzA36u8JoM5C93r3ZBMxVgQ6C6IUpTdlMcShesvyaK6UCFigAq0
        NKgz8tgfpcYOCD8Y5gTVm2vOew==
X-Google-Smtp-Source: ACHHUZ6oQv/6he5gGsXdMkQwEMtJlcbnBQCVhPWcr7LRJ1ol8If4CkHMG4T72Ez2SOllmCtresWkIA==
X-Received: by 2002:a2e:87c4:0:b0:2af:164c:fe2 with SMTP id v4-20020a2e87c4000000b002af164c0fe2mr912523ljj.5.1684502962058;
        Fri, 19 May 2023 06:29:22 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id q24-20020a2e9698000000b002ad92dff470sm821384lji.134.2023.05.19.06.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 06:29:21 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 19 May 2023 15:29:09 +0200
Subject: [PATCH v2 4/6] drm/msm/a6xx: Ensure clean GMU state in
 a6xx_gmu_fw_start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v2-4-5b9daa2b2cf0@linaro.org>
References: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684502955; l=1213;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=AafR4gmpdLdCW49giEqj+iQDIXWZqQQlcHizyhfpHRg=;
 b=pn8OzaI5Ri6hDvb1u3A6LhAH/dRqj6QnBpKwRfCAUssKQJEc/UFbcCZZluulJqAJ8z5pIPGJ3
 Tgrjt9hQs5UCewF2cCU5c8ZpISMVuhyKSrMMyazf8e/v79yi6BQEW+K
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While it's not very well understood, there is some sort of a fault
handler implemented in the GMU firmware which triggers when a certain
bit is set, resulting in the M3 core not booting up the way we expect
it to.

Write a magic value to a magic register to hopefully prevent that
from happening.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e16b4b3f8535..ea6d671e7c6c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -796,6 +796,12 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	gmu_write(gmu, REG_A6XX_GMU_AHB_FENCE_RANGE_0,
 		(1 << 31) | (0xa << 18) | (0xa0));
 
+	/*
+	 * Snapshots toggle the NMI bit which will result in a jump to the NMI
+	 * handler instead of __main. Set the M3 config value to avoid that.
+	 */
+	gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
+
 	chipid = adreno_gpu->rev.core << 24;
 	chipid |= adreno_gpu->rev.major << 16;
 	chipid |= adreno_gpu->rev.minor << 12;

-- 
2.40.1

