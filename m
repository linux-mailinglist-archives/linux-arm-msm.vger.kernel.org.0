Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B229647CA55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 01:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239660AbhLVAfy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 19:35:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239691AbhLVAfy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 19:35:54 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C75BAC06173F
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:35:53 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id s1so1367877wrg.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rZQhtajV5OCi1ZATJjQjcnZmgKjOceV3woNx9SlMmGg=;
        b=lM/Ahfzh1WB5V3IlL7aA7hLyDxOE28FqB87R8MEYm54CJF1cL08x9RFcjBm+RNPcyC
         CAhyFnJdrog8/HPjLn/2DmBTNTM+LrurWA9EUXcm3oyITkE2s5H3L/zseq5iyXo1nfM0
         KtbGQW8dFy9Fs9BHmITc7q+dx3cJ11LWDeIDi/INpbJORsgBVXM3hcqn5YW/8Pb6txJs
         K6idrvMQ3ZKqQUzIURbUy9ucJEcsI0bGf+MTDdNeRESEVR7QEFI2PUJ66K98s54/e8c2
         +UtsqXXuiQbgEXeBSaPvyfuoM7xq+ZEGYkwNLFEcLfZrSqFkZESDZcJJOM7YgXSpsELC
         N//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rZQhtajV5OCi1ZATJjQjcnZmgKjOceV3woNx9SlMmGg=;
        b=RuVN6kuL7nQafo35czZpoOwFPlADYII4svUQq0INm8slKrEyn+Xsf4nd0lwJzFsLRz
         qFKQu2I52PgfsqlAGIGq8b7M3/zwhK5/ZK/0OwErzmfmaSBJNSWvHo+J71v67TaO1PDu
         hpWgB9dIzZgPSC5DQ1PBvME4su0mUn6yhvF8aURJJOgQbfE2IsbPf6z1FQm4CoQ3uYkq
         kCtsdkx8roB9JO9F64KXqkdYnnG5hZfhT3S5D6DURUzOiohBkOvRdGtK+eJbfjxTSSLh
         C3MLwXjomQlqG5YAYbFtBrf+XWB+S9xIplZ/0nw3STiRB8gpRvuWTSy3c423WM+2HyUW
         MODA==
X-Gm-Message-State: AOAM530S2cmlJX6lm8w726p5T0xJKgteXOwYtQZK3/+L1Huv+l2Bb5e0
        j2vltuWCMzLMrEiOgAM1RZ9UJp67w8oqPQ==
X-Google-Smtp-Source: ABdhPJwMoWwmL1a44pwH0iCAjCpKEeO1Iq5wDCwQ4ZlIL9ALAfbYMrktW4kXwJnnijJ1FYz+vxlrQg==
X-Received: by 2002:a5d:4d42:: with SMTP id a2mr388013wru.311.1640133352145;
        Tue, 21 Dec 2021 16:35:52 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:35:51 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 06/19] media: camss: csid-170: don't enable unused irqs
Date:   Wed, 22 Dec 2021 00:37:38 +0000
Message-Id: <20211222003751.2461466-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

csid_isr() only checks for the reset irq, so enabling any other irqs
doesn't make sense. The "RDI irq" comment is also wrong, the register
should be CSID_CSI2_RDIN_IRQ_MASK. Without this fix there may be an
excessive amount of irqs.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index aa65043c33037..a006c8dbceb13 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -444,12 +444,6 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
 
-	/* error irqs start at BIT(11) */
-	writel_relaxed(~0u, csid->base + CSID_CSI2_RX_IRQ_MASK);
-
-	/* RDI irq */
-	writel_relaxed(~0u, csid->base + CSID_TOP_IRQ_MASK);
-
 	val = 1 << RDI_CTRL_HALT_CMD;
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
 }
-- 
2.33.0

