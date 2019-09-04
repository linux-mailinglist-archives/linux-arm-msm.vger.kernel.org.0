Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92731A8122
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 13:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbfIDLgT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 07:36:19 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50]:34939 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfIDLgT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 07:36:19 -0400
Received: by mail-wm1-f50.google.com with SMTP id n10so3305401wmj.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 04:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=6n1x8bAGsyaVUn7RCRrZd6pcUeSbUTUlFO1sD7W+jdE=;
        b=h6B+fLtpSONhSBxg/IJPOu8ZrT+zjGIRlQ9PafT3Q+SZuugLTW6Ms+HeiIs199by73
         /y+NK2ynYGk5Q1wiraznmv2S5N8Lz0qJIog53PZqHuAG5OFvBaAac4XnhbVk0k+0NGWi
         IUHCcEYDqbyRKZZp2QJ8hxBdm7rxewdpV32Cn9jFMFQB3McBI0q5ZjtIQTG3kzNunl+J
         wd5cfQNbtsC+bA9G4OAwDPM+UzwfqTBSFiXdOXS2MFlj5hQCg4AYNsTJ3GCer+YjaTp7
         TYsyWv5RGnBfWrv689OK75VW6sakK4tDIkVN+13SPqxEk7zGNRbD7F3Sp3yWfKoTo0bU
         rcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6n1x8bAGsyaVUn7RCRrZd6pcUeSbUTUlFO1sD7W+jdE=;
        b=GE5kNZkMks7cYnFopicbNQTkIWaWUsaThxUo87m9Lfgn3N5WIb6o2cplOPskED58qG
         0f1EbOtn2zjUVIgGh4IsVnwESTd2wEErsnlXOI3RASTq64j4zHPd0MI8Ol0aHyLSgZbQ
         WC2pUXOjvrePq4zrzjuxLdWOaOAFgKHlHJsEvcvvqMRFQfQJwgE0rFayyaUB8a0kVO/D
         dv3NxxOYujinCBsOAn++REWbd984KQotG3rVCMVLOgLi4/N5wZh7nQV4sBRrE2KQF+Z8
         bbGQqo78TEvR7X8/OCjWfrkfNXsn53fpqtJh83jKNx+otLKuCJujXWpIgAonUOGciEY3
         G+MA==
X-Gm-Message-State: APjAAAU5zrn+C6I9ZuVM2usQqocsKR1oUqn5mot8LvZk3Zoec1jA+24O
        2xjzNgbqiCeiNkC3JeEJZLpvrw==
X-Google-Smtp-Source: APXvYqzrtOfOuNj6frgLWfYGsNvZUObicbYASkZ26jqaCnscUAcwcq1/Gwrc40q+OpB0xe98gVVB7A==
X-Received: by 2002:a1c:20cf:: with SMTP id g198mr4199256wmg.66.1567596977066;
        Wed, 04 Sep 2019 04:36:17 -0700 (PDT)
Received: from localhost.localdomain ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id d9sm10823933wrc.39.2019.09.04.04.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 04:36:16 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 1/2] i2c: qcom-geni: Provide an option to select FIFO processing
Date:   Wed,  4 Sep 2019 12:36:12 +0100
Message-Id: <20190904113613.14997-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a89bfce5388e..dfdbce067827 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -353,13 +353,16 @@ static void geni_i2c_tx_fsm_rst(struct geni_i2c_dev *gi2c)
 static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
+	struct device_node *np = gi2c->se.dev->of_node;
 	dma_addr_t rx_dma;
 	unsigned long time_left;
-	void *dma_buf;
+	void *dma_buf = NULL;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
 
-	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
+	if (!of_property_read_bool(np, "qcom,geni-se-fifo"))
+		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
+
 	if (dma_buf)
 		geni_se_select_mode(se, GENI_SE_DMA);
 	else
@@ -392,13 +395,16 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
+	struct device_node *np = gi2c->se.dev->of_node;
 	dma_addr_t tx_dma;
 	unsigned long time_left;
-	void *dma_buf;
+	void *dma_buf = NULL;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
 
-	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
+	if (!of_property_read_bool(np, "qcom,geni-se-fifo"))
+		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
+
 	if (dma_buf)
 		geni_se_select_mode(se, GENI_SE_DMA);
 	else
-- 
2.17.1

