Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19FE12690DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 17:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbgINP6L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 11:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgINPsY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 11:48:24 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3DAC061356
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 08:48:24 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u21so93622ljl.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u+ec5e/iUjJ8qDBtGE9xKBCADcm1RI8srVHT5OLXlvU=;
        b=Ah7wZk7H4a1YXb3siR+1ZjnwbjtSkXQdarNonG4apXmKK1RU7RgA3q5ffNCULhdZvv
         szBF+ywo3gSiAmVakhVSgrzGXibgJEBf0zLpay43DWkEfJks/Sxn9RKntWuRWYaevQev
         lg3aSW2BNqdhGyZe/JNz3NltDhgf8++D85FQcp14KLyjLf7D4vi1YLxZTZvklHXZ9T8Y
         Un2iIgaxXMW8MTzeluqSCr7BmwGpo0sk+04aycaYPhknOLHiqpydFmz5ZYsXOE0v/Gbs
         S1YPClKB3VqmlDYAnn14//BI+/N1syiPKkvqMZDzc7xAJueJPfZwiiaWpHxrUtoA2par
         bnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u+ec5e/iUjJ8qDBtGE9xKBCADcm1RI8srVHT5OLXlvU=;
        b=DmOSd5fG2DbJVyUqbZe/RNdgocH+uZw8prnYiSeU/m8zH1Os7Qhhhi+yNHMA3iLwoo
         2IJVUkFgcGDHjUYYGm+sO0IRI8/YT6XrpbzBom2vMVSdWEr+AgSV5mLpE+AtBkYbcU+y
         Vol0d1jxdFGsjS3TtO9/ofZy5XlZAIxqFbHkvZWQtcgIzs/FasXCgYcF6jd0zahft0uH
         Ge4C1F9u/qigrsbdDuA97/5XDNXzv40ud8zEss/9rTrNeQPGNUtZucRQzb3MxT0MVG/Z
         2yKuTmnD4a5eafvn3Z3KOlE07vUMXEybmFjQkyO4dptAoQtKtHxQQVciDoRRkXoC2vXF
         lX4A==
X-Gm-Message-State: AOAM532Vi4Rrj2wpaZX0hmdAF1y1fumKd68MoKAFI9yrESe/+Ba1krqB
        o7let1GweSheF16rnNOhNbNpdw==
X-Google-Smtp-Source: ABdhPJzURBwsNbRnRIeAcecDmShpK8ebYE54NKbCVaKVQd6J/us5aq97BPTZiiIzM3WGoHHWH2cIzQ==
X-Received: by 2002:a2e:780d:: with SMTP id t13mr5681189ljc.324.1600098502656;
        Mon, 14 Sep 2020 08:48:22 -0700 (PDT)
Received: from eriador.lan ([188.162.64.187])
        by smtp.gmail.com with ESMTPSA id f19sm3834650lfs.85.2020.09.14.08.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:48:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Craig Tatlor <ctatlor97@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v5 2/9] fixp-arith: add a linear interpolation function
Date:   Mon, 14 Sep 2020 18:48:02 +0300
Message-Id: <20200914154809.192174-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914154809.192174-1-dmitry.baryshkov@linaro.org>
References: <20200914154809.192174-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Craig Tatlor <ctatlor97@gmail.com>

Adds a function to interpolate against two points,
this is carried arount as a helper function by tons of drivers.

Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 include/linux/fixp-arith.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/fixp-arith.h b/include/linux/fixp-arith.h
index 8396013785ef..281cb4f83dbe 100644
--- a/include/linux/fixp-arith.h
+++ b/include/linux/fixp-arith.h
@@ -141,4 +141,23 @@ static inline s32 fixp_sin32_rad(u32 radians, u32 twopi)
 #define fixp_cos32_rad(rad, twopi)	\
 	fixp_sin32_rad(rad + twopi / 4, twopi)
 
+/**
+ * fixp_linear_interpolate() - interpolates a value from two known points
+ *
+ * @x0: x value of point 0
+ * @y0: y value of point 0
+ * @x1: x value of point 1
+ * @y1: y value of point 1
+ * @x: the linear interpolant
+ */
+static inline int fixp_linear_interpolate(int x0, int y0, int x1, int y1, int x)
+{
+	if (y0 == y1 || x == x0)
+		return y0;
+	if (x1 == x0 || x == x1)
+		return y1;
+
+	return y0 + ((y1 - y0) * (x - x0) / (x1 - x0));
+}
+
 #endif
-- 
2.28.0

