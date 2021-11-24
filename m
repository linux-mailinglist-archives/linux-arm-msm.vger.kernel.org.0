Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29CE945CB98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 18:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350057AbhKXSAn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 13:00:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350023AbhKXSAm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 13:00:42 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5012AC061748
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 09:57:32 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id p18so3231273wmq.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 09:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZPEeFTLtybf1F4P57Z5TStTc5I8rl09YXt8kiq9xgVs=;
        b=CMm+wxSdA2GvRdsGmJZwIuwYOoPNn157U7f+R6EWFxOBgWAspjO4Ijbo/oYsqK5YtR
         aFfEMtCOX1NVYqCXpzuObCAQI8xfVrKYXSfpMa5FbjvRxV+fSd0X6M840XxNb4TQz7vq
         SBAxjxP2zCLQyBxcs0g+/A5tdOMNVdlCcf8OeCG9kyq2NePpOHKf+m5I4Zs7M3K6YmDp
         iv70HEVhr/KOlwS3Wd9bmMBP1BY++Mk2N/Tvmvn56umbgLF+5XQM301j8BAoXHCRCq/P
         s4r+fKvVGB1rbSVOHXTuZ1rgkfZqrcXJQvMvEjmc9uVsUqZQVRQfcQqK062vrR9F1oFl
         VqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZPEeFTLtybf1F4P57Z5TStTc5I8rl09YXt8kiq9xgVs=;
        b=ot+W4nBTfVS7hVqZgMJtQRi3yUU+8qcWEpVsfQiGOoSbL4XQQSN80oOaZN9IlYqrEf
         bZxMJh28Hp7lwr3DVFppvM70QL99EYFqskFPTZC2Qm35exGhER0i7iIzqnxszpE1xFQl
         j9kwbeFiDMjjySl9KC3J/CpLwg7j5cUamaHEleHVnfnp/omb/OpNfXKj+g3QC0W6dM28
         JHmtOPYyOLkriH4vcCDk+zPvvD5YTsaPhawOwnV7g0GVhFSvWQ40agph/rtkefYHFj4n
         wDPCU40h3Jl/1n/zy1PouDQ3m1HjIXvE5kMLjuBvPzjzNoEagx0+ThVw7CY6tMzoIatC
         wqNA==
X-Gm-Message-State: AOAM531A/5b+XidIWVYptDhC95XYIoxpVIm2TbTl13EskgY1u0rmckri
        q9TBi6QQg1rqOZO44xHw7xqSbIqrgY9ZFll7
X-Google-Smtp-Source: ABdhPJxooVPq2J1MH0ffWvscQfPxObizYUU2jSKhT9STDey1nJRZ5m8YYo265ECI5febdci+vcX7rg==
X-Received: by 2002:a05:600c:3c85:: with SMTP id bg5mr17729395wmb.58.1637776650543;
        Wed, 24 Nov 2021 09:57:30 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s24sm380576wmj.26.2021.11.24.09.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:57:30 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 11/19] media: camss: remove vdda-csiN from sdm845 resources
Date:   Wed, 24 Nov 2021 17:59:13 +0000
Message-Id: <20211124175921.1048375-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
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
index be091c50a3c0..71c6109b0526 100644
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

