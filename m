Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF54696BA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 18:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbjBNRcY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 12:32:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232374AbjBNRcN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 12:32:13 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 561BD2BF15
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 09:32:10 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id a10so18463722edu.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 09:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OY08lSRJ0khJ3YSfU40JW9rAgs8VWCIlhnOm90/cUOg=;
        b=frfKn93kiQebkp11O4duo98V/VYbcCaSsG8zEDPRN7bXFw6RY8w5rF0knMGnhEFM5l
         /02KkVtTMObUBFykV6Q5lsPHyvYFJ18icSwP8QxYbEKJm0GziPhXz0K7e79e5kaYvj//
         MS6T5e9SIcAfpUlqhOEg1ndoWsCUUKWFg445luwHBacOWbuGwDsfbwR1KP3wMID1li1E
         5i+1tgcFdWF5aZQM85pLheVzpKKlkMtlWj55tgeH5yuU36lfSWefZCJ0q2Rw0Cy8pCFy
         6WOeJw7XAPSGjYLTQoBwmt5Yh46Y768uSz7iPY/rtkgyFu49b7B8JZJkKUPmyLkSwTAI
         WsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OY08lSRJ0khJ3YSfU40JW9rAgs8VWCIlhnOm90/cUOg=;
        b=VLNEGtw5FNCIlkx2jOnSr2ow/z7F9DgJ+GE+2w0sgLfUEJ+cceOpzHt4pk1/JahqbY
         C5DIf1ufw/0JZVZN7sKQb7u9/e5MQrf/MUqfXcGCt06qG8ED2ACGNMuYXZEhrztpxySZ
         +wlqv1TU8nP91GaPAihrdXrHWTG3JKZFDrl2BIkyKuziN1mdL2d/hyw1prFJ1ht0PSPA
         v11gaKKUpWDRft0tgotZh8T2DTyJVbsh6HaGp1bDYbATIce6XeLN8vgyO/TUuFlYJ2kT
         PuN16H5hV+D3pwKqEwafIMybl4uqk8RL3Gc6j/CAivJpCEDqe35+/8dEj98MR80XVVdr
         NDug==
X-Gm-Message-State: AO0yUKWSonpJmnCtcOLJui/EX4yfstRsqE6ovhjBanfyox2RqqQKzcsU
        WfVxVMFsTWEn+/wBRQmLtxbJYmEKgAREhCbV
X-Google-Smtp-Source: AK7set+p3q4YKuAdCoI2TlDfL0AaC/b3D1U8fkZW8bGwqj3d2sCOyEM/PtwXUq2iGExPskN1ATR+EQ==
X-Received: by 2002:a50:931e:0:b0:4a2:2e8a:14cc with SMTP id m30-20020a50931e000000b004a22e8a14ccmr4271090eda.1.1676395928744;
        Tue, 14 Feb 2023 09:32:08 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 09:32:08 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/14] drm/msm/adreno: Disable has_cached_coherent for A610/A619_holi
Date:   Tue, 14 Feb 2023 18:31:36 +0100
Message-Id: <20230214173145.2482651-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
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

These SKUs don't support the feature. Disable it to make the GPU stop
crashing after almost each and every submission - the received data on
the GPU end was simply incomplete in garbled, resulting in almost nothing
being executed properly.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 36f062c7582f..82757f005a1a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -540,7 +540,13 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
-	priv->has_cached_coherent = config.rev.core >= 6;
+
+	if (config.rev.core >= 6) {
+		/* Exclude A610 and A619_holi */
+		if (!(adreno_cmp_rev(ADRENO_REV(6, 1, 0, ANY_ID), config.rev) ||
+		      adreno_cmp_rev(ADRENO_REV(6, 1, 9, 1), config.rev)))
+			priv->has_cached_coherent = true;
+	}
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
-- 
2.39.1

