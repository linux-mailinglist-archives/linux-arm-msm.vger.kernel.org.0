Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 100FB2694B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 20:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbgINSVy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 14:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbgINSVO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 14:21:14 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24BD1C061788
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 11:21:14 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id z19so262161pfn.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 11:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bxVplJc+j25YZx49J1PHku+gqhyQgloCcvrgKIa9smQ=;
        b=ehB3c/w6zP/NpUxCCiuSzpbu4ddmh0c+zKwmHa8epMH9PFohzaiLQn5gJcfMIIHgpm
         PP12eR66FqNtJ37qJAHsLrXdvSPlWmlhtr3KMofZk/2S87HjYW0qSdOnYqYWYPSIYSp8
         BVuh2ZmJ1BYfXjgSmqxDr4T8FgLMkNNeLHoQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bxVplJc+j25YZx49J1PHku+gqhyQgloCcvrgKIa9smQ=;
        b=cAfnEbsYwb1XRnB3HGJLow/zo5EoDwtlZIvyHFQ3IRTZuiGWhbmKT4Ju6cnEOtSu13
         DRdf42LVobT6Q1pEhmlMY5cOY7feJ45I0HguJ+YF9vylul6PPENrKGCwe2VPYIbI93VS
         lwHDw0DVuKNaMUh9KQLJKWUXMixYLajObTIzReGlfBTcmtwpx5Jo4TGocb3UBk6lim0E
         i5yDvYdk0DS7uOmjvtePk4Wjw++FcGbEMAlszpCOsqzOCEnkPpjIN4gmMdzGW4iODhz2
         aNiyWroHvgHb6AwMZJLFOEU4wRfBDygkeCWlm94swMZcnphbiCnPS1ZX0sldylO0SuWG
         MZgg==
X-Gm-Message-State: AOAM530Xx3Y1bwOrGatOZyGT2CiyjE+FpN3AD8ShhznWjzd/Fq5zYPIh
        fWqFr6D04wHVT2zPX/2OgqnY7w==
X-Google-Smtp-Source: ABdhPJwatzAymoJIOo7xZCtD46dvJZ88g4TjvHB7N2jbl9SzH/gjYFAi95QGAqDj5IjmElPdixoxag==
X-Received: by 2002:a17:902:9a02:: with SMTP id v2mr15331929plp.151.1600107673438;
        Mon, 14 Sep 2020 11:21:13 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id m21sm10857065pfo.13.2020.09.14.11.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 11:21:12 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Evan Green <evgreen@chromium.org>
Subject: [PATCH] interconnect: qcom: osm-l3: Mark more structures const
Date:   Mon, 14 Sep 2020 11:21:12 -0700
Message-Id: <20200914182112.513981-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These structures aren't modified at runtime. Mark them const so they get
moved to read-only memory. We have to cast away const in one place when
we store into the data member of struct icc_node. This is paired with a
re-const of the data member when it is extracted in qcom_icc_set().

Cc: Sibi Sankar <sibis@codeaurora.org>
Cc: Evan Green <evgreen@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/interconnect/qcom/osm-l3.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/interconnect/qcom/osm-l3.c b/drivers/interconnect/qcom/osm-l3.c
index 96fb9ff5ff2e..ba2ee6683a82 100644
--- a/drivers/interconnect/qcom/osm-l3.c
+++ b/drivers/interconnect/qcom/osm-l3.c
@@ -57,12 +57,12 @@ struct qcom_icc_node {
 };
 
 struct qcom_icc_desc {
-	struct qcom_icc_node **nodes;
+	const struct qcom_icc_node **nodes;
 	size_t num_nodes;
 };
 
 #define DEFINE_QNODE(_name, _id, _buswidth, ...)			\
-		static struct qcom_icc_node _name = {			\
+	static const struct qcom_icc_node _name = {			\
 		.name = #_name,						\
 		.id = _id,						\
 		.buswidth = _buswidth,					\
@@ -73,7 +73,7 @@ struct qcom_icc_desc {
 DEFINE_QNODE(sdm845_osm_apps_l3, SDM845_MASTER_OSM_L3_APPS, 16, SDM845_SLAVE_OSM_L3);
 DEFINE_QNODE(sdm845_osm_l3, SDM845_SLAVE_OSM_L3, 16);
 
-static struct qcom_icc_node *sdm845_osm_l3_nodes[] = {
+static const struct qcom_icc_node *sdm845_osm_l3_nodes[] = {
 	[MASTER_OSM_L3_APPS] = &sdm845_osm_apps_l3,
 	[SLAVE_OSM_L3] = &sdm845_osm_l3,
 };
@@ -86,7 +86,7 @@ static const struct qcom_icc_desc sdm845_icc_osm_l3 = {
 DEFINE_QNODE(sc7180_osm_apps_l3, SC7180_MASTER_OSM_L3_APPS, 16, SC7180_SLAVE_OSM_L3);
 DEFINE_QNODE(sc7180_osm_l3, SC7180_SLAVE_OSM_L3, 16);
 
-static struct qcom_icc_node *sc7180_osm_l3_nodes[] = {
+static const struct qcom_icc_node *sc7180_osm_l3_nodes[] = {
 	[MASTER_OSM_L3_APPS] = &sc7180_osm_apps_l3,
 	[SLAVE_OSM_L3] = &sc7180_osm_l3,
 };
@@ -100,7 +100,7 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 {
 	struct qcom_osm_l3_icc_provider *qp;
 	struct icc_provider *provider;
-	struct qcom_icc_node *qn;
+	const struct qcom_icc_node *qn;
 	struct icc_node *n;
 	unsigned int index;
 	u32 agg_peak = 0;
@@ -145,7 +145,7 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
 	const struct qcom_icc_desc *desc;
 	struct icc_onecell_data *data;
 	struct icc_provider *provider;
-	struct qcom_icc_node **qnodes;
+	const struct qcom_icc_node **qnodes;
 	struct icc_node *node;
 	size_t num_nodes;
 	struct clk *clk;
@@ -235,7 +235,8 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
 		}
 
 		node->name = qnodes[i]->name;
-		node->data = qnodes[i];
+		/* Cast away const and add it back in qcom_icc_set() */
+		node->data = (void *)qnodes[i];
 		icc_node_add(node, provider);
 
 		for (j = 0; j < qnodes[i]->num_links; j++)
-- 
Sent by a computer, using git, on the internet

