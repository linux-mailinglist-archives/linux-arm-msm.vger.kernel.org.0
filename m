Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FBDACC969
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 12:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbfJEKlx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Oct 2019 06:41:53 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36868 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbfJEKlx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Oct 2019 06:41:53 -0400
Received: by mail-wr1-f66.google.com with SMTP id p14so9010761wro.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Oct 2019 03:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3/PXG2bkbg7x3ohBOF3GXLjn8xoQKFLCILOx5cPdBhg=;
        b=s4Y8/h+v34BXkR18MHBaEc78C+YEAbKa6Bit3VVsxiqe2NwI1/Wdhlmzfw6GnTL8nZ
         +Lwj4Y7sg4ilBhwJUUYuTd0kOVPuPKheQfb+/sqdzBeOaGB7aU+anN0S5xVMHbBPkeXa
         1ZwRIT+Ier2sZWXXpzywa7Szx/xUvZV7rWWBIxqCRnYU4xG5xQNCtiw9OyHBF+15vUn6
         wf8l2pjrndgwx8R6WlabCf121ePSV8/41FWVNA90YhadzAodN9r/a9hzth2nlQRWFe8V
         qR2L7CGxTOWY7u/jwtFEj/iUBxTZf4jD5ZvkiGR6XIybiF7JLNZENiq2Y8GMk4B94jgO
         FtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3/PXG2bkbg7x3ohBOF3GXLjn8xoQKFLCILOx5cPdBhg=;
        b=MpBq+cUojISQoSM7TI1f0GfdNT9Ny9cJn+j5sVXB46w9wLPQb/BFsKMuRM9N5/nvGk
         IdaRucymvIXpb8HtcH0tzjmNWY4NxIXuZGwTst/Oas9xkj2QeWmMdU6UlVNla2BR6m98
         LOgFOqe+9ZYSdgH6GCT9A42A1VzLSSH1wGjMieF+XCyjnzDe4KVU3D5LirYFN9oFXFbO
         /nndI4vtjYxzsisWVhe+XInCSMDywhnvORCkZ2sB59XLjX2GtUyjzpxAblm60uQN8Q1y
         GtgpO1z4x/PkE5a8OySrhL0uLA7PHkvw3KKrlTw9OhXgqZDyjQWzk/UAGsReLQVEcb/t
         zpkw==
X-Gm-Message-State: APjAAAVDeiC1vM9QYc2Iinwo6IWc6XKGi1ZryaXNQ72Hjxxgv0aQVJsh
        CSlKMtq6wfLgu0WGp9fTxuGEsf99pVDbBw==
X-Google-Smtp-Source: APXvYqzNO+osc1lR2iTyKLFwGRE+3t32pfYIWGrq/FaJaScmnE0RAVuOmr5AYys29RgUhHqbw/Gepg==
X-Received: by 2002:adf:ed04:: with SMTP id a4mr15240394wro.77.1570272111357;
        Sat, 05 Oct 2019 03:41:51 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id u4sm16471674wmg.41.2019.10.05.03.41.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Oct 2019 03:41:50 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        daniel.lezcano@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, amit.kucheria@linaro.org
Subject: [PATCH v3 3/3] thermal: qcom: tsens-v1: Free memory in calibrate_v1 where required
Date:   Sat,  5 Oct 2019 12:41:33 +0200
Message-Id: <20191005104133.30297-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191005104133.30297-1-kholk11@gmail.com>
References: <20191005104133.30297-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The calibrate_v1 function allocates the qfprom_cdata variable
during qfprom_read, but it never gets freed: properly kfree it.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/thermal/qcom/tsens-v1.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
index 3c85a698123a..017501f37a41 100644
--- a/drivers/thermal/qcom/tsens-v1.c
+++ b/drivers/thermal/qcom/tsens-v1.c
@@ -173,8 +173,10 @@ static int calibrate_v1(struct tsens_priv *priv)
 	int i;
 
 	qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
-	if (IS_ERR(qfprom_cdata))
+	if (IS_ERR(qfprom_cdata)) {
+		kfree(qfprom_cdata);
 		return PTR_ERR(qfprom_cdata);
+	}
 
 	mode = (qfprom_cdata[4] & CAL_SEL_MASK) >> CAL_SEL_SHIFT;
 	dev_dbg(priv->dev, "calibration mode is %d\n", mode);
@@ -225,6 +227,7 @@ static int calibrate_v1(struct tsens_priv *priv)
 	}
 
 	compute_intercept_slope(priv, p1, p2, mode);
+	kfree(qfprom_cdata);
 
 	return 0;
 }
-- 
2.21.0

