Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C741F49E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 01:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbgFIXAp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 19:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbgFIXAn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 19:00:43 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD83C05BD1E;
        Tue,  9 Jun 2020 16:00:39 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id n24so87904lji.10;
        Tue, 09 Jun 2020 16:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s8uiAmqlfKhbNS8zB94at4653DA3vsfFnLuxtD8Ft50=;
        b=uWX8PhxX5ck/fIgnf6AhjoNGa9v1kr5t35QzGp2u2JIVCjZ0+WiYHj4q9+GAG4lrp7
         BVyECS9oPaynGxiySyf0LfbYxB9FMTctWW/NS2cXpcN3mGFgjRLCQaYmRd6Y7QStPRQT
         dI3JV5gwgO8alapw4DfHWnl+jk1s2Wfolr8Ek+/bwobQXHRcjzLabkRyYWAU/tY2lPQ8
         I/M25+6IxYgMvCDSQIRLznO3jJ1QlJGAo07ltgjwKMJYFxsG2oQve6YoEfVWq9wCSRd1
         MuGl7isbbfFue0V2H6NUqHDsMhjZ/R8+ZM9pMy30iALOYfyar/kuf0V4ch6JD04gozaH
         dfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s8uiAmqlfKhbNS8zB94at4653DA3vsfFnLuxtD8Ft50=;
        b=G1lprtOvpO0boT/5IX/1GtRGyi+stQQTofaVkqL4ttevq21ZpWff/S1R+pioSIGJSq
         pBhBZXHlytJvP85SkBqB6WgI+4LCRiFS79Te7DbsJ2NC1Jv1ajGBJ4Qf/CvLDnwZDFWc
         wwpJjrPgbj/ScRypXp3AY6In4Wnaq/7W84CIDQljQytWD8N5K5PwPpbVL5sTzs0iSXNS
         UYLy43gl8JB0RVpFIErG3649r7OWmsCCp52/Cq9NEo+QlitQqAtBynaXlz1KsqUH3nvl
         ShhZSbQSXuHLwCZtWNIpGmphdtlfYFQg/8SHRAGDupJSBhoSudj+iFzPIn5njBQ+h/l2
         90Bw==
X-Gm-Message-State: AOAM532oQUZh2aevolwUTMBMe6MLMoTtwfc5CN20DvZwaANFcY9Tzd+c
        ST/fllRgO+HiNC9wpFnckho=
X-Google-Smtp-Source: ABdhPJwcuwJBEnfuj2h/lT/fcSUcFngGefHGqO+wURSYU5P9LQf6N3Rt2gy0UEdq2la9dxghMEP3gw==
X-Received: by 2002:a2e:95d9:: with SMTP id y25mr264828ljh.167.1591743637017;
        Tue, 09 Jun 2020 16:00:37 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-136.NA.cust.bahnhof.se. [82.196.111.136])
        by smtp.gmail.com with ESMTPSA id b15sm5306278lfa.74.2020.06.09.16.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 16:00:36 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, vkoul@kernel.org,
        sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] soundwire: qcom: Constify static structs
Date:   Wed, 10 Jun 2020 01:00:29 +0200
Message-Id: <20200609230029.69802-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom_swrm_port_ops and qcom_swrm_ops are not modified and can be made
const to allow the compiler to put them in read-only memory.

Before:
   text    data     bss     dec     hex filename
  18266    3056     256   21578    544a drivers/soundwire/qcom.o

After:
   text    data     bss     dec     hex filename
  18426    2896     256   21578    544a drivers/soundwire/qcom.o

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/soundwire/qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index a1c2a44a3b4d..915c2cf0c274 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -406,13 +406,13 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
 	return ctrl->reg_write(ctrl, reg, val);
 }
 
-static struct sdw_master_port_ops qcom_swrm_port_ops = {
+static const struct sdw_master_port_ops qcom_swrm_port_ops = {
 	.dpn_set_port_params = qcom_swrm_port_params,
 	.dpn_set_port_transport_params = qcom_swrm_transport_params,
 	.dpn_port_enable_ch = qcom_swrm_port_enable,
 };
 
-static struct sdw_master_ops qcom_swrm_ops = {
+static const struct sdw_master_ops qcom_swrm_ops = {
 	.xfer_msg = qcom_swrm_xfer_msg,
 	.pre_bank_switch = qcom_swrm_pre_bank_switch,
 };
-- 
2.27.0

