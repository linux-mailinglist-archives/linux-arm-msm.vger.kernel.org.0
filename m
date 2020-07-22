Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFE72296D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 13:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbgGVLBo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 07:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729849AbgGVLBn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 07:01:43 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91186C0619E0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 04:01:43 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f7so1486929wrw.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 04:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=niAmRUGsg4kxR596xiqQAVaMYD9d+SGcGWnDYDntXxM=;
        b=r94Bx+p3fcIDdAUsi8ATLuebYYefpEfjtAfalUhzc8pUWLe7DYZlGToUERmUT6175v
         ridcQ7TDaWP5Jou4y5JCHVow5LoJaJmJTCGsqXpB1OrI5UBftKfAYaVYfwzURR66u/H9
         iHci+7rpt+mdko5bdHcESZMNj4ARx6gtgIhfZZ/o0auMSlQPxuV4B2FlB+9MMh7yl9Iv
         nBI5Anaw9Q7+OmR8XNlS06NTmtjbZTzwh5i4lOJra4g19ge0YzKw0ZZOzzm/YUG6QVwU
         8Am9GunVPEw14N3o7HFV6CuCO0QWUc6s/ie+Uy5RY9m5EjGvqPB07L4KQv75NEShn5qI
         N7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=niAmRUGsg4kxR596xiqQAVaMYD9d+SGcGWnDYDntXxM=;
        b=V5uAJiC1vzpi++gg+6qqtVtZu3CyzNabpga3Dj3blRf1vOF341EZrlJdHWU9F6uEkf
         Z1k+MrnjLzORT65wBmT7HLGAr3Cr1g5/Yc0rfg3RtHcZfFLRUBbZbuuIJN6AyTct4xBe
         57M0QYivjSgBjG5Gz6SU1q3vW6S6A1/YV6aQi7rDMRZykYX6w8FWJQ1f3/zsGiAcLNmc
         VWsivsbaJW91JYHnhseRvHU9niD+agLaZM4419qPqj6IPc1x7KIrXWqIMQag/8Bcpwjn
         p+iCJlAR9TPZPiWr3/Yo6TdLEuMOrCTM+83W2hN+YE+IUKKySdl1DEd3pIoyjihBbuQo
         PFAg==
X-Gm-Message-State: AOAM5313SEk0XToLKE/Avjpy6rvG2XXdnkxjTHvqAJ8IfLH/vu5UgRe+
        QlR3DPfFoLnKiij8FA0QCS9SBg==
X-Google-Smtp-Source: ABdhPJxDV2Vmpdiz+h/u+9NMFx3xGKLE7lckZbCG8ZfyTR6oMuWNipVN11Zb3mzDpjoxhrGwzS6DbQ==
X-Received: by 2002:a5d:4a0d:: with SMTP id m13mr13001479wrq.12.1595415702339;
        Wed, 22 Jul 2020 04:01:42 -0700 (PDT)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id y6sm41256164wrr.74.2020.07.22.04.01.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jul 2020 04:01:41 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     linux-pm@vger.kernel.org
Cc:     saravanak@google.com, mdtipton@codeaurora.org,
        okukatla@codeaurora.org, bjorn.andersson@linaro.org,
        vincent.guittot@linaro.org, georgi.djakov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] interconnect: qcom: Use icc_sync_state in sdm845 and osm-3l drivers
Date:   Wed, 22 Jul 2020 14:01:39 +0300
Message-Id: <20200722110139.24778-3-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200722110139.24778-1-georgi.djakov@linaro.org>
References: <20200722110139.24778-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Lowering the bandwidth on the bus might have negative consequences if
it's done before all consumers had a chance to cast their vote. Let's
return the maximum amount of bandwidth as initial value. This bandwidth
level would be maintained until all consumers have probed.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/interconnect/qcom/osm-l3.c | 3 +++
 drivers/interconnect/qcom/sdm845.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/interconnect/qcom/osm-l3.c b/drivers/interconnect/qcom/osm-l3.c
index 96fb9ff5ff2e..54aff6273af1 100644
--- a/drivers/interconnect/qcom/osm-l3.c
+++ b/drivers/interconnect/qcom/osm-l3.c
@@ -236,6 +236,8 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
 
 		node->name = qnodes[i]->name;
 		node->data = qnodes[i];
+		node->init_avg = INT_MAX;
+		node->init_peak = INT_MAX;
 		icc_node_add(node, provider);
 
 		for (j = 0; j < qnodes[i]->num_links; j++)
@@ -268,6 +270,7 @@ static struct platform_driver osm_l3_driver = {
 	.driver = {
 		.name = "osm-l3",
 		.of_match_table = osm_l3_of_match,
+		.sync_state = icc_sync_state,
 	},
 };
 module_platform_driver(osm_l3_driver);
diff --git a/drivers/interconnect/qcom/sdm845.c b/drivers/interconnect/qcom/sdm845.c
index f6c7b969520d..c04775820f15 100644
--- a/drivers/interconnect/qcom/sdm845.c
+++ b/drivers/interconnect/qcom/sdm845.c
@@ -503,6 +503,8 @@ static int qnoc_probe(struct platform_device *pdev)
 
 		node->name = qnodes[i]->name;
 		node->data = qnodes[i];
+		node->init_avg = INT_MAX;
+		node->init_peak = INT_MAX;
 		icc_node_add(node, provider);
 
 		for (j = 0; j < qnodes[i]->num_links; j++)
@@ -559,6 +561,7 @@ static struct platform_driver qnoc_driver = {
 	.driver = {
 		.name = "qnoc-sdm845",
 		.of_match_table = qnoc_of_match,
+		.sync_state = icc_sync_state,
 	},
 };
 module_platform_driver(qnoc_driver);
