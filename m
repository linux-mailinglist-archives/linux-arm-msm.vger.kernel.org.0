Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8B414A88FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 17:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352402AbiBCQrI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 11:47:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbiBCQrH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 11:47:07 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D203EC06173B
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 08:47:06 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id t14so4734688ljh.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 08:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ueO5vydjulfg6IAl/bg9DbwgRIt1DtlTq0JPzG+//dg=;
        b=JlGjdMcZycKCy10A5TSFArTGlANFYneCRY06g30OP7ENeQnaPa+TuSH6boUJxEuIgj
         fMrFDyPfClkjSI8MlLwry38v7hXfHLs5MgsAzcKz2jN/sPAVK6eFeArg91V/vlX7CKFV
         zv5AF3JzuVDwVos67yGU5elyEWfem+YUP8cU4UyZHD4Hat/QPxJssiKoLabuveTNIEDd
         CLIn8+j8jdomyWwOD/jUScFKZhB3XRUVgRvcW++GgwBSJamRrpDjfFWp8X+budxhWj7v
         PN088UL5e1qZKANmAkOvquWCTOMh0Qa5Vx8EZtfbk+7xfp8FR6r+X4aUc3S1PbUxPnfB
         OIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ueO5vydjulfg6IAl/bg9DbwgRIt1DtlTq0JPzG+//dg=;
        b=dteAm24MBO4ZpoV2BBFxjjeaKlDysmXaNlkTqa4vOfYmUC9aR3oZDo1eqFMJdKqeJu
         fAnCPQZ5fbtdXuKuotf+7PqU+QEo69b2j17UfonmO1Vf8zaWMgwuv8b+6rdEuhsQjoFF
         LqvjBy3NZXgi5MMoMuQXYyWC/R59+Iy+A9BjF4sfeHGmLQpFZD64tJ2RraoXwZXM9+2S
         qsQckRy37idanm33C2JJRZ6tDZmuAj4w2v7TfrwkCv9u/57DXOPdaZE67oAi+ei7WXII
         Q8TSoK0OrjjlIskbxURfs9l54vrGc3D/VOSSi6z5zK076ei+TdCHseqVymQps9m0ztZp
         7ySA==
X-Gm-Message-State: AOAM531TUB2UbDKUHS2XoqMv04SkD2tIY2NbOO7HbwCfVKVSDL0HJurW
        vGF6Ug+XtW/gd3pzLhKDN8Zzyg==
X-Google-Smtp-Source: ABdhPJwgMZnwrzpipl0cAh0PoT+qCjiupZasfLufcUm5wqwMWpfR/cdDE8FzkB8mQBx7dOpFL97/1g==
X-Received: by 2002:a2e:a49c:: with SMTP id h28mr22411905lji.489.1643906825174;
        Thu, 03 Feb 2022 08:47:05 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id n21sm932769lfe.38.2022.02.03.08.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 08:47:04 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/9] i2c: qcom-cci: don't put a device tree node before i2c_add_adapter()
Date:   Thu,  3 Feb 2022 18:47:03 +0200
Message-Id: <20220203164703.1712006-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is a minor chance for a race, if a pointer to an i2c-bus subnode
is stored and then reused after releasing its reference, and it would
be sufficient to get one more reference under a loop over children
subnodes.

Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index fd4260d18577..cf54f1cb4c57 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -558,7 +558,7 @@ static int cci_probe(struct platform_device *pdev)
 		cci->master[idx].adap.quirks = &cci->data->quirks;
 		cci->master[idx].adap.algo = &cci_algo;
 		cci->master[idx].adap.dev.parent = dev;
-		cci->master[idx].adap.dev.of_node = child;
+		cci->master[idx].adap.dev.of_node = of_node_get(child);
 		cci->master[idx].master = idx;
 		cci->master[idx].cci = cci;
 
@@ -643,8 +643,10 @@ static int cci_probe(struct platform_device *pdev)
 			continue;
 
 		ret = i2c_add_adapter(&cci->master[i].adap);
-		if (ret < 0)
+		if (ret < 0) {
+			of_node_put(cci->master[i].adap.dev.of_node);
 			goto error_i2c;
+		}
 	}
 
 	pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
@@ -656,8 +658,10 @@ static int cci_probe(struct platform_device *pdev)
 
 error_i2c:
 	for (--i ; i >= 0; i--) {
-		if (cci->master[i].cci)
+		if (cci->master[i].cci) {
 			i2c_del_adapter(&cci->master[i].adap);
+			of_node_put(cci->master[i].adap.dev.of_node);
+		}
 	}
 error:
 	disable_irq(cci->irq);
@@ -673,8 +677,10 @@ static int cci_remove(struct platform_device *pdev)
 	int i;
 
 	for (i = 0; i < cci->data->num_masters; i++) {
-		if (cci->master[i].cci)
+		if (cci->master[i].cci) {
 			i2c_del_adapter(&cci->master[i].adap);
+			of_node_put(cci->master[i].adap.dev.of_node);
+		}
 		cci_halt(cci, i);
 	}
 
-- 
2.33.0

