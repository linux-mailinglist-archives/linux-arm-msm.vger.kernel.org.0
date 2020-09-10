Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D042A2651E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 23:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbgIJVEI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 17:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730716AbgIJOhg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 10:37:36 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81FAC0617BD
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 07:00:16 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id n25so8321573ljj.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 07:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wcVYXgQ5pttw1IKCDgQFlSKYdGXdwjbBjMlIEbUjqiQ=;
        b=WcGgdaRRvCVMPOMrzk8F0zJKKmXYDnx/T+2PstZPMVXOPjqh8utA+6+vILfHsug244
         UlvTF+Cv7GA993X7lv/AnHiWokjLhHCdY/o/MAk/lHwbyu0dMRyCZIjZlZo1x5Mj3v3e
         j5B78FNoLh0JLl6S4aIr4wYfyAwpqAqX1E9RVHyrZlTjH/NSufy6X1HFlExrh+i7NTMI
         4u16BTA6G+MhSDCVH/h07hI04tVXg4+T8S5BPo5F/PfZ8kYtuz3S5wWEK2/OFJWxvMHJ
         jjfiehwrYb1S+Pv9uTyiFpLE+BssJdGiBHGnGElC4KiOFrNr6tp6EXQIFi5enObhytNB
         lSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wcVYXgQ5pttw1IKCDgQFlSKYdGXdwjbBjMlIEbUjqiQ=;
        b=VKllACYmZodxn78c1Ehaluip6M7juD8uLtGZwls115k74B99zKDj2PC1FAZIKIRgue
         t6WIL/4V6OLFllp3aNfV+IzshxYphHcTEHMfCH92dz7uPBF8bLyZ6kvKm36awWz6xMGx
         FYnybUWyMrQyyUCJXVP1mgQU7gy61LFwwmXxfR/twkVZTqCZGh6nwuQSOrQuGpw2lYxY
         CGNEfmK58PXcEIqJvnt2IBjxRkV8DiVUNHRvZO+UyEsuX7GyUAGvNth6ooHDVVLVP6OL
         mBZo5BFxQ2XvqR4TOj7m5fD4BfgxTex/BG+/QRa2GSeoXqrxVSgfSLI8oR7sKiDT9A8u
         /cAA==
X-Gm-Message-State: AOAM532PAhOeYKa6FblTrqm4zJ8iFfpOT6BLmjPCURNykgtHPfzdNYaH
        KZLVmuGm0xJj7Wles233V+lmEA==
X-Google-Smtp-Source: ABdhPJxBUWMazHhh0NVRcv5in/kVk015eZcEEP/gzP/tFVbk7+tflyjNHMBiyncgOgFctGYV3Bn5zg==
X-Received: by 2002:a2e:8506:: with SMTP id j6mr4109652lji.176.1599746415305;
        Thu, 10 Sep 2020 07:00:15 -0700 (PDT)
Received: from eriador.lan ([188.162.64.156])
        by smtp.gmail.com with ESMTPSA id t82sm1367646lff.43.2020.09.10.07.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 07:00:14 -0700 (PDT)
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
        Craig Tatlor <ctatlor97@gmail.com>
Subject: [PATCH v4 03/10] fixp-arith: add a linear interpolation function
Date:   Thu, 10 Sep 2020 16:59:53 +0300
Message-Id: <20200910140000.324091-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910140000.324091-1-dmitry.baryshkov@linaro.org>
References: <20200910140000.324091-1-dmitry.baryshkov@linaro.org>
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

