Return-Path: <linux-arm-msm+bounces-3035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE179801EB6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 798CD1F2100F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 21:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA0D21A1F;
	Sat,  2 Dec 2023 21:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FrQlxx1/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C84F3
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 13:40:19 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50bef9b7a67so357824e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 13:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701553218; x=1702158018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PiCAbk6dndh08EfRyE7PVjUQK6TGLTbC0HzTfoaWIqo=;
        b=FrQlxx1/nQ9k092anuHwTS4y2yZyFWdgOst60X8e7L6otwvNK9l1WORMaTim1PVeki
         sH6nk6JP/1SItyoPNWGQNQ1RYpy0Bqw9hCd3MWANG6b4LcDQ7x08wVBMu8QMcGbA2f7B
         eMtz1FRf1prVu280wY0B56hX18gCJcWNlYtN5VMfctQEDkv9sIy5cnE+r1b6Tz7blOlu
         KfYvRMnSk2LFxf6zMfi45DjyWZT+bud30J3i+0Rpli64fOn2ISuo1Bl86TqnyfHBspRm
         kKTcpCafCt1XjdJjWnZCLiE7y24id/+aNm2UGoSZDsR30x/MQesVzV8Y65R9od7KOo/P
         9IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701553218; x=1702158018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PiCAbk6dndh08EfRyE7PVjUQK6TGLTbC0HzTfoaWIqo=;
        b=DjUSR/+ZuUEgI6oV896IhHz8oPC3LNQOt/JrKEngV/nZx2Ug/7FC9Woe3oGDI6wa4G
         EB2oHslH5no3927YX4D8iWzpMSuH51SkcRs8uZDGNE2IOrjI3bl962djQHCKbd3MvhaA
         nMUL/xX2fLM2zKOGQsYpQocubtFxJ8zaQ2Vwbs/P+H0F5a9XErWXCtRhLx3+hIFh5Sva
         U1xMsA4CjYtjMucaUabvlav/XWIyX/4L2ok3e202sWjQA7jnUxbYOXktmuuS5/qPFnN/
         QZWQvO3YrRttKMxx+blA3hLqJLZl9Fa1VmywNZkb2cMDX6zwfk50UzG2/n6WoSgVzWYg
         F7jQ==
X-Gm-Message-State: AOJu0YzhCxgFcCXgfROQRxpmL49DPjaaspeqzqLWv5VP2ATsJHZHsPp9
	4f7qucdm4EMadZCb+JrxfuTYTQ==
X-Google-Smtp-Source: AGHT+IGiPaedwuCuq0vO0ehGgLaLBwZlPgKeQUpXZ/lDG/74lbGNQyNaWWopxYhcYDnxQmH1AciGFg==
X-Received: by 2002:a05:6512:480a:b0:50b:eb83:3506 with SMTP id eo10-20020a056512480a00b0050beb833506mr316574lfb.93.1701553218163;
        Sat, 02 Dec 2023 13:40:18 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 13:40:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 01/12] drm/msm: fix BPC1 -> BPC4
Date: Sun,  3 Dec 2023 00:40:05 +0300
Message-Id: <20231202214016.1257621-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix enum mdp_bpc::BPC1 value to be BPC4 instead (as shown in the DPU
driver). This commit should be replaced with the registers sync with
Mesa instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp_common.xml.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_common.xml.h b/drivers/gpu/drm/msm/disp/mdp_common.xml.h
index 4dd8d7db2862..5220688727e4 100644
--- a/drivers/gpu/drm/msm/disp/mdp_common.xml.h
+++ b/drivers/gpu/drm/msm/disp/mdp_common.xml.h
@@ -94,7 +94,7 @@ enum mdp_component_type {
 };
 
 enum mdp_bpc {
-	BPC1 = 0,
+	BPC4 = 0,
 	BPC5 = 1,
 	BPC6 = 2,
 	BPC8 = 3,
-- 
2.39.2


