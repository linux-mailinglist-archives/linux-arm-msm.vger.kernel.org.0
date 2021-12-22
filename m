Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD4747CA5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 01:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239736AbhLVAgA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 19:36:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239830AbhLVAgA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 19:36:00 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7B6C06173F
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:35:59 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id g7-20020a7bc4c7000000b00345c4bb365aso80024wmk.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZcMjdQkiVJ7cNLB1yHDfiaYLmc+S+ohuC3EPTWpGpPI=;
        b=uGLYwEHUGWL3hJKDRTmqALg8GjuUFchbwJOaaZpqZV1WTCi85OUq9A6iONJqqKv9Bf
         HVninYUseLQRjSBACXt82+okddgEi71NVJ5mhYKcV7NANy1SVxhcHfeMGFtjtJnr0Rxe
         GDv7oGYO+qKY3LLr+dWYzu/1sWj9gozfSuOgpg0rsMtlkQyCg0Sp+P/egiPRP7MD6DzY
         JHh9WeclZOXJ0op/hz1D3LcJtl2zwHz6Db94D5GEpkZ4jdAwgD04an+sXH8DUTdnqEh0
         ad2y7kqW8bPHp2m2IaXnAC1E5MB9lH9yYMCOUWZ7cgbDJt+qyj2nsg92Wungq11XNu/W
         v1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZcMjdQkiVJ7cNLB1yHDfiaYLmc+S+ohuC3EPTWpGpPI=;
        b=wTs0VrkVrlBj85TkaPCD+NRI1ZgWmtMnDnPTnep4aOROnwCfx6RcOQAiqf+7QsVKIJ
         FBX+NS9itlLelB6L+j8kBgGDF3gngK3PspptT7ODZDbKBBqFtAfw1OAXN60TbzuEh1ZR
         v31jjJLIOTB45EnftrPoNjtIEIiElz+JOHcGnl5yOY4kBuzfNt4QmdyS+Wi+zWOeLY9A
         orNnZ2TxUHQDHEoEVQya+y+Zn+l/Kf6vf/A94yLjUy31Yae55C7IjcpYJZzpiW00McGx
         DsZqppwTG8LXmUL7iXf6tZ8NzPOWWho9bL/Mhne0vibJSfEF0b/WLHD6tIUUL+Xe7bCF
         Fg4w==
X-Gm-Message-State: AOAM533HR4hVdeMYGm9whaZQAsV0ZYRzJG4Cn6a9Fns8qMZwUs9D1D6s
        GUj9/2jcSGtncGDkW///rFDwJHhCB0T1wQ==
X-Google-Smtp-Source: ABdhPJwbaGQpNGFvenUhVv+jd8ZLoY1uREh2zVL6M1OQGYss/jpOf/1GnCYYVSSUt8b8jx4j/hb8Ow==
X-Received: by 2002:a7b:c101:: with SMTP id w1mr412682wmi.149.1640133357926;
        Tue, 21 Dec 2021 16:35:57 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:35:57 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 11/19] media: camss: remove vdda-csiN from sdm845 resources
Date:   Wed, 22 Dec 2021 00:37:43 +0000
Message-Id: <20211222003751.2461466-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

This isn't used and only works because devm_regulator_get() returns a dummy
regulator.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be091c50a3c0c..71c6109b05260 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -542,7 +542,7 @@ static const struct resources csiphy_res_845[] = {
 static const struct resources csid_res_845[] = {
 	/* CSID0 */
 	{
-		.regulator = { "vdda-csi0" },
+		.regulator = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe0", "vfe0_src",
 				"vfe0_cphy_rx", "csi0",
@@ -562,7 +562,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID1 */
 	{
-		.regulator = { "vdda-csi1" },
+		.regulator = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe1", "vfe1_src",
 				"vfe1_cphy_rx", "csi1",
@@ -582,7 +582,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID2 */
 	{
-		.regulator = { "vdda-csi2" },
+		.regulator = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe_lite", "vfe_lite_src",
 				"vfe_lite_cphy_rx", "csi2",
-- 
2.33.0

