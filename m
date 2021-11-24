Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 127B145CB89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 18:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350005AbhKXSAg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 13:00:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349980AbhKXSAf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 13:00:35 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5C5C061746
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 09:57:25 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id o19-20020a1c7513000000b0033a93202467so2796611wmc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 09:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9LOd5vHs/ORxT5LhEKnfe+7vy+TLpsio9syefLLL+g4=;
        b=DWuZFwkJwygETxJbvJvMQwmnPCYo6SB1Pt14vmaRtZkFLaCf4TIGZihX6B1PdS8gSs
         onrSvJ50HgQSYgPFT3T7cpcwL9Fw5HGEUzJy1f48UwdrrmZb2axFM0NoJ5DZeY0pJ7OS
         ApPsQw64gxfjn10Ag02GvfURGQrtC7UROOztSHAR9MNU/wWnxNu15QHGiYfMFEgkHPqD
         JGBefx1nMGOHbNQc0/q4z/X1kA0vFCRn7sgrmgqw4qSWaTqBD3JwF22UUVABNdn3RWoT
         Xd9nqSlIWleLNQe6UDc5RjI5Ou5ljMfxU/9DI4+IhZmmsgvyYlHm3EZ7xsLmLmARYUwh
         AK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9LOd5vHs/ORxT5LhEKnfe+7vy+TLpsio9syefLLL+g4=;
        b=esT9rCWOQjCNhrOBQlK6lEtzpu6Ui1wL9RTVJIfPMR5tKhseeZ1SESyP2r/D9pBEOh
         lyO/N/8v6q0eWOxPreXaERFB59+pwGDn4bz5xQdITMcPRE8MyLSDbE+gFl4wG+paOGHM
         E1WSeAWGQqZbbWK8B+3b/DuEK31XTP+cM39w14a/d8HYCpPkEFX81CLEtXfSXkU0Fuyn
         KHZuqGVJByq9zWtm1WOaIpQQWbACG1ZHzX+OFzLxA6R8/WWWFbBBvopGtaN60yNLmzaY
         jkMVjVDCZuS3CLhrR3AsK+xQRWV9EBANVD+KFia6CrCkPfO2XRQ838qIG8l4BLTytyLt
         Y3Pg==
X-Gm-Message-State: AOAM532fSRVUW5VzTkUzKnBl61kN9h53zEiuueBkO3Grlxtu6Nb3r+Xe
        UcgCSOH1nSq0ugzyFa+rkpFjc7ofKlovVGH0
X-Google-Smtp-Source: ABdhPJzce4RexUXvytzXq9+8SsyMw+RSIGnurzc+FZCKIA6bvi394N7i1J98nIJSDdKw9xC5OVyQeg==
X-Received: by 2002:a1c:1b08:: with SMTP id b8mr16773376wmb.28.1637776644042;
        Wed, 24 Nov 2021 09:57:24 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s24sm380576wmj.26.2021.11.24.09.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:57:23 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 05/19] media: camss: csid-170: fix non-10bit formats
Date:   Wed, 24 Nov 2021 17:59:07 +0000
Message-Id: <20211124175921.1048375-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Use the decode_format/data_type from the "format" struct instead of a
hardcoded 10-bit format.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index ac22ff29d2a9..aa65043c3303 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -366,7 +366,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 			val |= input_format->width & 0x1fff << TPG_DT_n_CFG_0_FRAME_WIDTH;
 			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_0(0));
 
-			val = DATA_TYPE_RAW_10BIT << TPG_DT_n_CFG_1_DATA_TYPE;
+			val = format->data_type << TPG_DT_n_CFG_1_DATA_TYPE;
 			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_1(0));
 
 			val = tg->mode << TPG_DT_n_CFG_2_PAYLOAD_MODE;
@@ -382,8 +382,9 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		val = 1 << RDI_CFG0_BYTE_CNTR_EN;
 		val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
 		val |= 1 << RDI_CFG0_TIMESTAMP_EN;
+		/* note: for non-RDI path, this should be format->decode_format */
 		val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
-		val |= DATA_TYPE_RAW_10BIT << RDI_CFG0_DATA_TYPE;
+		val |= format->data_type << RDI_CFG0_DATA_TYPE;
 		val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
 		val |= dt_id << RDI_CFG0_DT_ID;
 		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
-- 
2.33.0

