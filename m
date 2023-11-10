Return-Path: <linux-arm-msm+bounces-390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E48077E758E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 01:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20E381C20B90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 00:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BE97F;
	Fri, 10 Nov 2023 00:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="gAqXKhej"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B09715A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 00:03:33 +0000 (UTC)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B778A4D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 16:03:32 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-66d17bdabe1so9523896d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 16:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1699574611; x=1700179411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X8kRvGVwwQROTbtBALdJ/O4XXBQy9n/2BNY8tadKsdI=;
        b=gAqXKhejlVb2AbVBPLcF/i8azE1Ccxh0uFs1xQSqztwamlMBAfOSxIYAlVF/pNt2Ou
         0L0KsZpttJEeeRU8Dq3nRzwZsgIVU5vDMGQ/QgGJhHR/sLzzPevtR3qyG+0PXzDqnif+
         cxo7FTCzXJNKRY0VplRn7ek08Uh1V35DTMtMRVLRJXTCP/w9TFJgrpKbAWPG9NleEq+k
         xVZOviLdPGbWcZWF7PXkL9n9O2vkpoZQL+Xu3YPgr4VqO4Bz7H/XmsvFw2Lj5/PG80aS
         MLwtcWSqOpl5UGVzSYpU2AtOAneVD1lQMWs3YtZgN7FEJLSxCpufP74ekV5JoKuDbdGP
         xXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699574611; x=1700179411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8kRvGVwwQROTbtBALdJ/O4XXBQy9n/2BNY8tadKsdI=;
        b=WzaqtpptLlHSLdsdIrog3nphGms3PzBzHO1NyUcGjD5j8E6UMd9KUOOZi8CNdV85PN
         TSnMxWjf/HmQwE3QY3vgUFneKOeYqbgJvo0pdM4mrdKdZSetMLsQLeJ35QXfBOCMDQgE
         xRZW0bT8J6JkV7EtoY9pyxayJb3p3z0x4cmLy3pI6YU+Oyn61gX66R39Tay1e9Oa1JBa
         +Ms3/r++PgfdLh3Cz5llFxhZcaBvV5AzIzEdIFreWB0qOGHIbFDDA2bJlmjo1NlFS0i+
         BstGemW34hpYeaEPe7HhUroV5rcMZ1uBMk0VegJWdJ6X53OkEvA6hfOSn5eNsqO+QUvB
         RYow==
X-Gm-Message-State: AOJu0YwiVybG2NUNsrpyxnMEScia+xtvZ4zqH/0ZDNwda0dtCQ8/lw10
	bAdw3179xBgFYBlJC4XYB+254A==
X-Google-Smtp-Source: AGHT+IGYCXADfCmllu0MdkQC6KJQ2Cnx9eUW550qzPyNlADCiAziRwgvnW3qjd1nZZKBRjkl2P01xQ==
X-Received: by 2002:a05:6214:411:b0:66d:1624:2203 with SMTP id z17-20020a056214041100b0066d16242203mr7062080qvx.20.1699574611676;
        Thu, 09 Nov 2023 16:03:31 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id x4-20020a0cfe04000000b0065b0554ae78sm2455969qvr.100.2023.11.09.16.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 16:03:31 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Vinod Koul <vkoul@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm/dsi: use the correct VREG_CTRL_1 value for 4nm cphy
Date: Thu,  9 Nov 2023 19:02:14 -0500
Message-Id: <20231110000216.29979-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the same value as the downstream driver. This change is needed for CPHY
mode to work correctly.

Fixes: 8b034e6771113 ("drm/msm/dsi: add support for DSI-PHY on SM8550")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
v2: fixed the Fixes: line

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 3b1ed02f644d..89a6344bc865 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -918,7 +918,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
 		if (phy->cphy_mode) {
 			vreg_ctrl_0 = 0x45;
-			vreg_ctrl_1 = 0x45;
+			vreg_ctrl_1 = 0x41;
 			glbl_rescode_top_ctrl = 0x00;
 			glbl_rescode_bot_ctrl = 0x00;
 		} else {
-- 
2.26.1


