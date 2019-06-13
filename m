Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 669FD4381F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732499AbfFMPDj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:03:39 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42714 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732491AbfFMOWf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 10:22:35 -0400
Received: by mail-pg1-f196.google.com with SMTP id l19so8454838pgh.9;
        Thu, 13 Jun 2019 07:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BygsFeH7Nr66mPQvbX5gJcEmwzV3pSewGfseE3W/ZuQ=;
        b=gd0JYIfXIL1RfnCKpBfbXBfhfhaYXUpgDJgWzXPPJ78lgZXum7AA4tnx42ArjzsDem
         2DIOpRZcjaiY5QWf7P4VAYW5jIoQu2IYUF+EIfgHlNYVg0o5Q0KEroNi2TqL7uX+5UE5
         d873eFtfm/F1zBqDHhXnMFYJbu+riZyUMMEe3MGy60H2vVpJuUzXqKGLkpXkdv2Fq/G+
         eFVnJzhHWxKuu8P0O+bL9mTfYeNbgqy3YYu0A1NNkabWPskuVYOcAV9jqpNORL3EiUNs
         JseMZa6Zzr7xAp2T5fHM6cywX1agIFf8ZejSWcw1XBNMjFddoxaihuDr8yNMwVYfMDC8
         k1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BygsFeH7Nr66mPQvbX5gJcEmwzV3pSewGfseE3W/ZuQ=;
        b=KYAb9HtL3BMPZz25cTnbTs+IHii6zK9u5qZzi20bI+LkItSQ5z7cLiw5VHVmbWaTGC
         +9ek6N0GUoGxqDGQcCihn6uiDNhUsLi6i7XuEDqrmL8HXtD4lY4QoGFHLPEyybDI5UCC
         5pVzNXhPiaIgMP0h45erksxD24S8d3cSc25fL9GD3MCcyd3FlLyZTtDVLA1F1Yb6Pl6L
         FbJkTK0+RATe3zkNIxbCnnhKwhQnxmXcMzmrPiSMgzwwfgqT0H8tcotq4EfZWmDtzMZt
         fMeX+UPmoLrYqP5vdvh7SFGw7gwuxWZRsPOHXkEw+tMNd55zhC92jcPjf5Xu/BGJrQhW
         0iyg==
X-Gm-Message-State: APjAAAVZ0Q6NCap+MiY8/AAmDLMU29Lgk23ZJ9gJ4gwwPLVWxTMVqnsH
        1HurNJYplq4RCVMVGE4D6QQ=
X-Google-Smtp-Source: APXvYqwRqQM+4uXL0A8LxwKNYDDjg75B1Han4lvXfELR9x6t60qzXQmtOjRTAvE8kxy1xJuYpevXBw==
X-Received: by 2002:a17:90a:8c0c:: with SMTP id a12mr5912373pjo.67.1560435754375;
        Thu, 13 Jun 2019 07:22:34 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 133sm3415622pfa.92.2019.06.13.07.22.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 07:22:33 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     lgirdwood@gmail.com, broonie@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v3 1/7] drivers: regulator: qcom_spmi: enable linear range info
Date:   Thu, 13 Jun 2019 07:22:31 -0700
Message-Id: <20190613142231.8728-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/regulator/qcom_spmi-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 53a61fb65642..fd55438c25d6 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -1744,6 +1744,7 @@ MODULE_DEVICE_TABLE(of, qcom_spmi_regulator_match);
 static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 {
 	const struct spmi_regulator_data *reg;
+	const struct spmi_voltage_range *range;
 	const struct of_device_id *match;
 	struct regulator_config config = { };
 	struct regulator_dev *rdev;
@@ -1833,6 +1834,12 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 			}
 		}
 
+		if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_HFS430) {
+			/* since there is only one range */
+			range = spmi_regulator_find_range(vreg);
+			vreg->desc.uV_step = range->step_uV;
+		}
+
 		config.dev = dev;
 		config.driver_data = vreg;
 		config.regmap = regmap;
-- 
2.17.1

