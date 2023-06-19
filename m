Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2B6735C53
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 18:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbjFSQoc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 12:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232330AbjFSQob (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 12:44:31 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7108CE68
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 09:44:28 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so4752230e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 09:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687193066; x=1689785066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXvgXObuLUXgh3jnIU3RKwPMBc4ZARc1+vOEfqXJtnQ=;
        b=IZ95yaZCLywYLVLR/TLE12lPpUizicviR2/vp4221PjzLPEaNoGz/MhkOu28kaL4Gr
         mC91aGTs3x24gw/5ERaUD7LW5QMRo1fi9WYHK6kFfBHaVQ6i13J84xOF+3ZbvHX31nux
         2G5jxTdkeOMLGP8ztIqw6srQJ5G7cYNQYSOhHdVwbz6qRe3r7B+l4CRH7iazeRYabX4e
         wzrhIxpKtYsXIrjHhKxHSd8Pv4wsuPpnUp2AD6zLPyGelbJ6+2/LCo4RaFJ+Vzmle8zv
         987WIImYtuns40Hv5e/7cVx8iVs1Gi5WXUYK7yIZgFJ+ufN11VqALyrCHprHAVC+H9hl
         dpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687193066; x=1689785066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXvgXObuLUXgh3jnIU3RKwPMBc4ZARc1+vOEfqXJtnQ=;
        b=T10I1p2W+ozK+3c+aSi0xJFrNKWGm+dbEqDHbhcqMQgMPqu/iDnrqN8a9vs2FlmFcc
         eszykyWVvUHcqZNJPK6lnzMKSFRajbmYuajRv/taAumgwo6vM0OqM6Ruu5XPJXCQm27U
         HDRfHQg3JF++y2mymPN1oXX0p5Ku4oKWXWLNNeXv3kjrkBA6YkhT0eWYqQViBoiND3s+
         iEDoqkL/cMHVpQxUri8MLMJk6Iq1mVw00bpr4TP1h7UsRbK9Pr802TyJ8KL63OVhzfsA
         1pXZ6cBAsuBlChH20XMB8720wftf88fdDCEFZ9M31jvcYUBdM7NbWqCFhT/Jy37mr/48
         MpXg==
X-Gm-Message-State: AC+VfDzx9pCV0tQ3Ol9Y/yTGb7AxIc9ac9O+jgROTF/L/554GLAb3Tzg
        DadFeHKyuP1XQD8f5kOueKS0WA==
X-Google-Smtp-Source: ACHHUZ6VBVIsEp99X3J5kbcY7YWOtxe2ikNj21kwhtR1+dfm8sR1zlcYHur4QOXDP0fF6/pt3PhbgA==
X-Received: by 2002:ac2:465b:0:b0:4f8:692c:74cd with SMTP id s27-20020ac2465b000000b004f8692c74cdmr2667856lfo.22.1687193066782;
        Mon, 19 Jun 2023 09:44:26 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id d9-20020ac24c89000000b004f849605be7sm1774293lfl.292.2023.06.19.09.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 09:44:26 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 19 Jun 2023 18:44:23 +0200
Subject: [PATCH v3 3/6] drm/msm/a6xx: Skip empty protection ranges entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v3-3-a3ce3725385b@linaro.org>
References: <20230517-topic-a7xx_prep-v3-0-a3ce3725385b@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v3-0-a3ce3725385b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687193061; l=1073;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=p7u0J4uljF3tZrz5h1ZuKJqCS/MqBnjZGFZOc1JmV0E=;
 b=NQKGopdA8vA2ah+7eJ7S+RCXRZTEZj6j9vXtT+BhcHdPpfCuUpxjOrOOv+NEU8MSEZS12wiBv
 omlcv8IvEudBeJXSOa3mNC646auqe2up6nzof87KXGcAGLu/HnjG4bR
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some specific SKUs leave certain protection range registers empty.
Allow for that behavior.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index cd0c9bccdc19..488c69cf08d3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -935,8 +935,11 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 		  A6XX_CP_PROTECT_CNTL_ACCESS_FAULT_ON_VIOL_EN |
 		  A6XX_CP_PROTECT_CNTL_LAST_SPAN_INF_RANGE);
 
-	for (i = 0; i < count - 1; i++)
-		gpu_write(gpu, REG_A6XX_CP_PROTECT(i), regs[i]);
+	for (i = 0; i < count - 1; i++) {
+		/* Intentionally skip writing to some registers */
+		if (regs[i])
+			gpu_write(gpu, REG_A6XX_CP_PROTECT(i), regs[i]);
+	}
 	/* last CP_PROTECT to have "infinite" length on the last entry */
 	gpu_write(gpu, REG_A6XX_CP_PROTECT(count_max - 1), regs[i]);
 }

-- 
2.41.0

