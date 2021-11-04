Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2BE444CB1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 01:43:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbhKDAqc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 20:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbhKDAqb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 20:46:31 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746F0C061714
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Nov 2021 17:43:54 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id t11so6721532ljh.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Nov 2021 17:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1eSkm1GpRtyX3va1o0mfl2NJ0JHmaWEpDja9I5uhN/U=;
        b=D9UflifN8D661FpjdtNhGUGaB6sgzlPjJI3VTq2EcutIfnO1kqmqYa6Cmpkd3HLGRC
         7L7Qf4uu8TM1EJ/NR7cf3tF3mn7lh2gLp2tSHcs48JsuDDNfN9aJhXql58ypfCMMm3lQ
         xUWdLiKHkCw9n6IkIqac7xosLVmmHZr9j8XmLv1o8NAexZJ1wt75zhDF1OTMsGCbppwu
         ocjsKHkuuXheFskd0oyaK83pkaDqM6+hLBLgcW8JeJ/4U7LCqT03GvEfuRE+fTrPe+Gh
         aVAucvnfD8VHK8exLZ29ayVV7bpV65Bgc4XNge+UBKlvB+mgNncDWgZrst4ubSNhYUhe
         YxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1eSkm1GpRtyX3va1o0mfl2NJ0JHmaWEpDja9I5uhN/U=;
        b=OU4NvhywYicshrKMWaJbyB63beVk3NGRgVAk0/yzEVS6hJTIE6bWrMqRRGAagFTKq3
         MscKqisSVn/UJcqCcyH2uY3CMlGmhSw/frtwr4Ixk0o9gPHiB7NucSMiaul/+0n3Cb8y
         vZQAt6oLDbiTnuHQLtT2msB/uokxXmob7JL0jQalu/LSWmj1Z/fZMOe9uhIcsng4zOqX
         j49x3xF0pAj7gB3jihJeySJOzHet2fkaS+OAMLxZP9soUqHQ5nH9euC+o4S5vjNhqZnU
         ufOv6tbFxskEyvBIJEvQ0yqwlOIjISr1fZDzQj5cz+eCVUc019Hc9sd8497Qb93Bl0tS
         TLsA==
X-Gm-Message-State: AOAM532groAgNLtg7eaIdze9NLAZppSK/PBLWtMi8/Mm/yeD3Ym+MvhL
        Bx4gL30wwBesrKMzkUhDUudt7g==
X-Google-Smtp-Source: ABdhPJxsOZl31izwRga4tPivLecWj5FqNk3eDeEBEhAvcZYzdQzS/VzZOhYf7RKt1ktSmFlP8j+oOQ==
X-Received: by 2002:a2e:a603:: with SMTP id v3mr46056763ljp.228.1635986632871;
        Wed, 03 Nov 2021 17:43:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v11sm334465ljh.56.2021.11.03.17.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 17:43:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: qcom_spmi: do no register unused regulators
Date:   Thu,  4 Nov 2021 03:43:51 +0300
Message-Id: <20211104004351.2206578-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Typically SPMI interface to PMIC regulators on Qualcomm platforms is
used to supplement RPM interface in cases where direct control is
required (e.g. for the APCC or GFX regulators). Registering all possible
regulators is thus not required and may be potentially harmfull if
somebody tries to setup those directly. Thus register only regulators
that are really used in the device tree and ignore all unused
regulators.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/regulator/qcom_spmi-regulator.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 41424a3366d0..5e68c3829e50 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -2147,20 +2147,29 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 			dev_err(dev, "ERROR reading SAW regmap\n");
 	}
 
-	for (reg = match->data; reg->name; reg++) {
-
+	for_each_child_of_node(node, reg_node) {
 		if (saw_regmap) {
-			reg_node = of_get_child_by_name(node, reg->name);
 			reg_prop = of_find_property(reg_node, "qcom,saw-slave",
 						    &lenp);
-			of_node_put(reg_node);
 			if (reg_prop)
 				continue;
 		}
 
+		for (reg = match->data; reg->name; reg++) {
+			if (of_node_name_eq(reg_node, reg->name))
+				break;
+		}
+
+		if (!reg->name) {
+			dev_err(dev, "No regulator matches device node %pOF\n", reg_node);
+			continue;
+		}
+
 		vreg = devm_kzalloc(dev, sizeof(*vreg), GFP_KERNEL);
-		if (!vreg)
+		if (!vreg) {
+			of_node_put(reg_node);
 			return -ENOMEM;
+		}
 
 		vreg->dev = dev;
 		vreg->base = reg->base;
@@ -2211,6 +2220,7 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 		rdev = devm_regulator_register(dev, &vreg->desc, &config);
 		if (IS_ERR(rdev)) {
 			dev_err(dev, "failed to register %s\n", name);
+			of_node_put(reg_node);
 			return PTR_ERR(rdev);
 		}
 
-- 
2.33.0

