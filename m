Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A51BC25C2C3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 16:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729258AbgICOfC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 10:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728837AbgICO13 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 10:27:29 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E566C061231
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 06:21:22 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s205so3669991lja.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 06:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wcVYXgQ5pttw1IKCDgQFlSKYdGXdwjbBjMlIEbUjqiQ=;
        b=iZLw1CfUpf3zao1xXVpOnJTFOmznOoCWLAU15PeWwd16NwdTP2lGXLKN4iSi6eR0i6
         x+zv7dQuz4X0lGxw64dYnfTCDF3jXrFctSGJ1Qb+QeNWWJToXF/bayDRh0USlB20xWU2
         xcYHy9v+xKy8bizid6TCyu1VQ/i1vAn+ZYkZk2cstVoPua/zC/DG9cLE91kpZAc022QI
         inCfL8jDqhQIVS0+/YW/M0U5Dr2hs/eG2r2Kgrzagdw+hTG4alTmxvysUoOrDg9TsXa1
         hV4inadOBaQVDQGWmHe6zE2vy9Oz36Hyl8Nt+CDAvzGQefDphw08x4xz00sppiHbMINu
         t76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wcVYXgQ5pttw1IKCDgQFlSKYdGXdwjbBjMlIEbUjqiQ=;
        b=aPbV/z2PKM+vhBS3IXpFgJ0XH13P7KLkHJmFMvRGUu67AbY1bf+rWqewDsJr/EXeb8
         5SCYn4fF9JvedPwxA+9OWci5GwPDaqP72onu2X1k0K7Z3TizaqI6FvLHhojbcnpBjytD
         NhuQ1aifyTe+7TzbU8MwHILsPB16Kz6ZW68u73EqKsf1go3BDRopSzomljpe0AxNPWbX
         gNW3A5RIbieHCuQH/wDSQG7Rk03uapAG208/x8dbywj7Q/tATaM05asRj40Wlra7QHJa
         mcIjHpgwgef7n5uV3MwTtoQi4TM8n/jwMXU6BscEKqqKk4mcjSjV48/HlKgXapFUkiXf
         xgRg==
X-Gm-Message-State: AOAM531B+wCmKtb12su0LsNE88L3nysNj4zt1qnyhdJcN6Fskd3219gk
        jeE4YzCgcvJuZLjYnYl3sWIezQ==
X-Google-Smtp-Source: ABdhPJwoWGc8Hxt5nyEATXELirHjbXfeqr2xI0d9g+TZMjeBMrNFljP+NwuSNqU1v5CsQS8IgUQ2yg==
X-Received: by 2002:a2e:8215:: with SMTP id w21mr1246122ljg.43.1599139280959;
        Thu, 03 Sep 2020 06:21:20 -0700 (PDT)
Received: from eriador.lan ([188.162.64.138])
        by smtp.gmail.com with ESMTPSA id e23sm584220lfj.80.2020.09.03.06.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 06:21:20 -0700 (PDT)
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
        Craig Tatlor <ctatlor97@gmail.com>
Subject: [PATCH v2 2/9] fixp-arith: add a linear interpolation function
Date:   Thu,  3 Sep 2020 16:21:02 +0300
Message-Id: <20200903132109.1914011-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903132109.1914011-1-dmitry.baryshkov@linaro.org>
References: <20200903132109.1914011-1-dmitry.baryshkov@linaro.org>
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

