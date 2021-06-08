Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7710A3A0731
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 00:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235335AbhFHWlS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 18:41:18 -0400
Received: from mail-qk1-f172.google.com ([209.85.222.172]:46683 "EHLO
        mail-qk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234272AbhFHWlF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 18:41:05 -0400
Received: by mail-qk1-f172.google.com with SMTP id f70so6706344qke.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 15:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZIQt2jCiu8UQ3tm03+YZTLApMSATbTz4nD1zztWDgOQ=;
        b=qFD9+dYXxnHJRQggT3QcQ/+nrZgr/vhVcXpz1xKDiACbl+FQ3UtSQPQNWA99ebE4cG
         jvIG3k8cg1xNDk8Be7Gi010k7KRLfaj1RvY0D0R1UUI6K8t4nS6mzJp8oD6UlvGkGibi
         KB3PdjvRlVaZlRBm1X+tUMRUH55JdW1h/0prncQOe6/oLUyZaQz2YOxAQFJ9RUcb7+KQ
         AX68gwlxDBal0X9i1gu9NzMlRTYhJT+pbe5lgeAlVhUL/ZPd/MIJYiPnPBriFIMomMJU
         sPCBR/reUkUUFP8p+znm1LQbJzsRaOVvMPYmaRL8C3VWEplfCdBLlbF8taUXUrtus1OQ
         RXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZIQt2jCiu8UQ3tm03+YZTLApMSATbTz4nD1zztWDgOQ=;
        b=pqTWJzRODoI9d9VdH0GYHFRsM2PlFUI8+vcp6RxrfVbewD4z3SGzed0Zljzx63FQnc
         YCnFv+jJMnlbu3sDyOxUaKzSQb5RQw6SR1siYIg8d372vDQEjazTjCVmCbvQts7+sqx8
         wQNzOOcpeOxBNhqNN3B254n/+5q0OhdMTvmPVhb13aNZ7+OSt0/ujgwDZksKYFKlBAMg
         WcVAZ9vH2CTWdKu+vzbWPhvN6uIoA5cpLapSUguufPYyFcYJEuCqNnHkODovK9WRW6vS
         LYs71vrQ6cAs46JdlmJdlMrKrJfWijZGTKRyZp6sudgBgu4IIZP0QgNcI4W/bccRG+5B
         pvgw==
X-Gm-Message-State: AOAM5304v6zD8hAKaoDWMk3ycmfKSDEll6SlSYQUtZhFqlyAeL+XN2KF
        0pGlbjqFH6DDtSAtadBi0JZyKRToBKJJHY29D+eizg==
X-Google-Smtp-Source: ABdhPJzxpS1UIUw7jyGvjpk0uHBt5n9wjOEIm712XMpbWA+7rKbWITYsJFp9O5jKv2MzZpu+3XH2GA==
X-Received: by 2002:a37:8b47:: with SMTP id n68mr23337235qkd.209.1623191877747;
        Tue, 08 Jun 2021 15:37:57 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m3sm2324266qkh.135.2021.06.08.15.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 15:37:57 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 10/17] media: camss: remove vdda-csiN from sdm845 resources
Date:   Tue,  8 Jun 2021 18:34:59 -0400
Message-Id: <20210608223513.23193-11-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608223513.23193-1-jonathan@marek.ca>
References: <20210608223513.23193-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This isn't used and only works because devm_regulator_get() returns a dummy
regulator.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ef100d5f77636..c08d6d6f6f90d 100644
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
2.26.1

