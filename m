Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE6320D95A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2020 22:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388108AbgF2Tqr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 15:46:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388107AbgF2Tqq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 15:46:46 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8B8C061755;
        Mon, 29 Jun 2020 12:46:46 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q7so6368082ljm.1;
        Mon, 29 Jun 2020 12:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T/OMHqZ86SJeaGWyDotYaSZcb7px6lqir7gslCqzv1k=;
        b=MHuLcZlmgbGhNOvjrWRpYhkPgRqu6iGL2Jau3NRwzaJs10OcSwdmCK5iTjlu18FuBh
         g+6CnxvIgtGmA8q/PzYNk9Ym69l2MlbHnyE68J7+thTUsHbwpWhYuRQ/v2c30+SfiqsK
         HpET6QiJiy3YFmeJENKdjNM0u58prIbaFFvQadn3buGBanvMb0ilm5pTljsXpDciz7tW
         5GjyoVB6YZtnd6CUiISUehtBkHnGBA/JVJjXZKjU0ABd+mxylBSSZt3AzEFJad5vR1R+
         4ynpUyB7D7L8n/NmJseFZa0TqRHSka15i9CiW7eEsGEoAbv6xCZtkxkJAM29YsJTcvmL
         ILrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T/OMHqZ86SJeaGWyDotYaSZcb7px6lqir7gslCqzv1k=;
        b=irUpHwkdEU7JEwiKAB2CmuLUkb2xkiNP1waJgBv+ggLG1VLdeyyl5FVK3tTR1n8fLW
         ndvHoaqPSy3sK2I0X412WL7BnpGRIJjZVAmfNMmJPUMm3Kyuat2nN1n//QpsSPtYoBHG
         Hnm0YuDqiEA7NXli2ZONdVUrzBoSV1ySqKGJjNrgJAirmPnZfO9Y/+RprIPCzUVl13zD
         /g7tcQEQOngzH27skz+o0fWdhocaRuN2fKcv9VE4a9CUiDwNIlUpV20UK17yGa56f3AS
         3DmCCZUlw+/bBhpLHWponSph6N25cpBjiKMiF42aWzgId2G8YqG6IkluVJAooqq1MEIL
         bhtg==
X-Gm-Message-State: AOAM533q6FlmoMZn6kDmcONrDE/9/U9aER8gFVHr1o3pWsh34T2rkSAo
        wMU7RXjiMQWhzzOtTNdqCzo=
X-Google-Smtp-Source: ABdhPJxgMTgE3GGEeA7Ska/OrpjB2V841FbL8tvegAEb0wWPmqFFA/hVOVgY9jxseztXoVmba3vqjA==
X-Received: by 2002:a05:651c:106f:: with SMTP id y15mr9256317ljm.32.1593460005068;
        Mon, 29 Jun 2020 12:46:45 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-147.NA.cust.bahnhof.se. [98.128.228.147])
        by smtp.gmail.com with ESMTPSA id q128sm154750ljb.140.2020.06.29.12.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 12:46:44 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 1/2] regulator: qcom_rpm: Constify struct regulator_ops
Date:   Mon, 29 Jun 2020 21:46:31 +0200
Message-Id: <20200629194632.8147-2-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629194632.8147-1-rikard.falkeborn@gmail.com>
References: <20200629194632.8147-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These are never modified, so make them const to allow the compiler to
put them in read-only memory.

Before:
   text    data     bss     dec     hex filename
  17485     500       8   17993    4649 drivers/regulator/qcom_rpm-regulator.o

After:
   text    data     bss     dec     hex filename
  17881     104       8   17993    4649 drivers/regulator/qcom_rpm-regulator.o

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/regulator/qcom_rpm-regulator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/qcom_rpm-regulator.c b/drivers/regulator/qcom_rpm-regulator.c
index 0066f850f15d..7f9d66ac37ff 100644
--- a/drivers/regulator/qcom_rpm-regulator.c
+++ b/drivers/regulator/qcom_rpm-regulator.c
@@ -407,7 +407,7 @@ static int rpm_reg_set_load(struct regulator_dev *rdev, int load_uA)
 	return ret;
 }
 
-static struct regulator_ops uV_ops = {
+static const struct regulator_ops uV_ops = {
 	.list_voltage = regulator_list_voltage_linear_range,
 
 	.set_voltage_sel = rpm_reg_set_uV_sel,
@@ -420,7 +420,7 @@ static struct regulator_ops uV_ops = {
 	.set_load = rpm_reg_set_load,
 };
 
-static struct regulator_ops mV_ops = {
+static const struct regulator_ops mV_ops = {
 	.list_voltage = regulator_list_voltage_linear_range,
 
 	.set_voltage_sel = rpm_reg_set_mV_sel,
@@ -433,7 +433,7 @@ static struct regulator_ops mV_ops = {
 	.set_load = rpm_reg_set_load,
 };
 
-static struct regulator_ops switch_ops = {
+static const struct regulator_ops switch_ops = {
 	.enable = rpm_reg_switch_enable,
 	.disable = rpm_reg_switch_disable,
 	.is_enabled = rpm_reg_is_enabled,
-- 
2.27.0

