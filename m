Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB9122A320A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 18:50:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbgKBRuE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 12:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgKBRuD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 12:50:03 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CDBEC061A48
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2020 09:50:02 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id 141so18543710lfn.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2020 09:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u+ec5e/iUjJ8qDBtGE9xKBCADcm1RI8srVHT5OLXlvU=;
        b=pF6nXloPlqM6obPwi75GDJ4k5kNTxmZBNAdxptXASLgJmKW8WWkBtqq1Wp1Ce1erYq
         cUIYfWu8TfzFoMmt32WTIcuwBtthMZOLo4y9bj4/a4v75KrpU1FEumUwjy0jYvxoKlGH
         etmg4jGm6GDjteZt6JgXGbEdlmEgBfjRmJh7G49/TxpyfoBS4pTnNnVBsBIl2vLK6nBm
         GbDF7Q8X5Yqnc/qx6sDhiGjG9tGrIcG3aa/M8fWVnpJv7Afk9M5FK8BjkpnN6ZK/Yr0T
         6x5lBglGJ0VFL3uCu2+8tvYLDJMh9PY2/CszYvVXVOlxWltI3RXlnqB2TyxsLrF7xMgM
         IEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u+ec5e/iUjJ8qDBtGE9xKBCADcm1RI8srVHT5OLXlvU=;
        b=AxJHM7dN0QTJugXBWAlH9jRrxvoTdbzzwtdBdi576kgn452YVEnHb0mBmHbmbf4hPq
         ljRpMaiF5qOLi13RZJtDfs5F5HFrbE/mmvMM13qzkWxKxGOQ15dC4kKVrCt6n/pbp7Ta
         8cSdenWbG0HKJtah8hwIXAo2DKt/OzbODzdKZw/0mQOD4NQ3tK9klqtdNp17f+drcJVs
         IjaxU9n+jAgAnMjLvUKVqc51lEhDvz8kBj0hjSmpCtEEVDq9XsnyjDJiicE0iRpLSbrL
         s9mqzFiK5w02QhRiPD01tmzZJ91yIN2YRskF8YwdtE7JVheucoeCMvxaLHHSb+7k4bqf
         4LLA==
X-Gm-Message-State: AOAM532OS5z3Uw/yLtdu7CmgOyfuD8uOmduZL+Czpb20blKCLn0NdSCX
        mTgDNdvFBfE2MxCXTfKtf9N+Gg==
X-Google-Smtp-Source: ABdhPJwT4c3XpWr9RF86PfA6UGPomdWMztywNoqE5xFatshmIo3gmkhsLHkWkfoZqYB+xOSFBXGteA==
X-Received: by 2002:a19:407:: with SMTP id 7mr5928439lfe.291.1604339400716;
        Mon, 02 Nov 2020 09:50:00 -0800 (PST)
Received: from eriador.lan ([94.25.229.254])
        by smtp.gmail.com with ESMTPSA id r7sm2516163lfc.206.2020.11.02.09.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 09:50:00 -0800 (PST)
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
        Jishnu Prakash <jprakash@qti.qualcomm.com>,
        Craig Tatlor <ctatlor97@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v9 02/15] fixp-arith: add a linear interpolation function
Date:   Mon,  2 Nov 2020 20:49:37 +0300
Message-Id: <20201102174950.1148498-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102174950.1148498-1-dmitry.baryshkov@linaro.org>
References: <20201102174950.1148498-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

