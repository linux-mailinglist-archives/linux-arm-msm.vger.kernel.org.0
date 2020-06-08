Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B681F20E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 22:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgFHUow (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 16:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726850AbgFHUoR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 16:44:17 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B85DC08C5C5
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 13:44:14 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id c185so18702714qke.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 13:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qvr9NfP23GG58EcPnVqv8kY5eMqO/csy7v+VjkFmFa8=;
        b=Sgn9TuqZIjfhLOZy23ytoH3J7BhvoT31XK9/G9VMHs6nkOQ+zTHub7Au0KgS7zmPMZ
         KLMLWIACvee3eD/5yN8gD3jWXkb1wAgfxvqQHKoU2vEBSwQBb2Vo6I3fS8fnze54tqJT
         LnyE61cHBJYjJctCX4HUGo87UUs2OUUn82Tp1p4q6Y/tj+dT/u6CgMP+0bXTn7MMlkBk
         agQwpuIBeEprg7HV3zR7/yUVp1py7fcH3zldZP0zCjThKkf2VM6nbhrK7Qy/J4BSvyJv
         sbqQ55cxprjY9h947Z5WmYn7lI/oQl73rmn9JGEJZAGqSFe1F1RSvVDOmw2hgMoKJqk/
         YwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qvr9NfP23GG58EcPnVqv8kY5eMqO/csy7v+VjkFmFa8=;
        b=Z5gO2GBsFlHlCN4sAVaEBqI6doaCeW+mA9PS4TIeS52E7E46d2/aYNTUM9NQHLb16N
         VAVBQqV+jF3KojHo/g4RyW+EcDOhh/j0SuIiAptaba4FM1Px+hXiPr+2IDxKwN7RhNMw
         PNIKgI1CQME8KVvtB+xp8wfXQfqWpo4pLM3t5ImgyYl7auGvCGdmAuvtopwsJjxQLLzW
         axj5cmIukKe8kJosnyXB0UyHyxYChPqgQW2X5Je0NmojLCP1QFUSDJKfamvIb+1pPxf+
         pu6bIl2jTHsRI032CHbNPgLrELOKYk5NRwi3Hc6ZAqLYcie9E7fFUy0NmE9c1ZNd7G5v
         HKjw==
X-Gm-Message-State: AOAM532YVM9R2gl+Wv7y83pZi//d6TgD3JmXgCXPz0V3iCIgfc2rquCZ
        WQPcA6rEUcMvCxFVtcq2rsqSPA==
X-Google-Smtp-Source: ABdhPJwRnBMq8uQ6SZnA5t3+W1dY5KfhW+rUvHoY0ZFqRAUpsRl3443LXWlNkfL4jbqrfnKEqxi2qw==
X-Received: by 2002:a37:be43:: with SMTP id o64mr23549112qkf.322.1591649052223;
        Mon, 08 Jun 2020 13:44:12 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id y16sm8895565qty.1.2020.06.08.13.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 13:44:11 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     alsa-devel@alsa-project.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/5] soundwire: qcom: fix abh/ahb typo
Date:   Mon,  8 Jun 2020 16:43:42 -0400
Message-Id: <20200608204347.19685-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200608204347.19685-1-jonathan@marek.ca>
References: <20200608204347.19685-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The function name qcom_swrm_abh_reg_read should say ahb, fix that.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/soundwire/qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index a1c2a44a3b4d..f38d1fd3679f 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -114,7 +114,7 @@ struct qcom_swrm_ctrl {
 
 #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
 
-static int qcom_swrm_abh_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
+static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
 				  u32 *val)
 {
 	struct regmap *wcd_regmap = ctrl->regmap;
@@ -754,7 +754,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (dev->parent->bus == &slimbus_bus) {
-		ctrl->reg_read = qcom_swrm_abh_reg_read;
+		ctrl->reg_read = qcom_swrm_ahb_reg_read;
 		ctrl->reg_write = qcom_swrm_ahb_reg_write;
 		ctrl->regmap = dev_get_regmap(dev->parent, NULL);
 		if (!ctrl->regmap)
-- 
2.26.1

