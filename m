Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48FD032A0FA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Mar 2021 14:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242242AbhCBErp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 23:47:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238503AbhCAX1o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 18:27:44 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE45C0617AA
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 15:26:17 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id f1so28336919lfu.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 15:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FCdCz8+kn4V5QKXXXD/ARjJCsuFIBX7KqWzFuKY8PO0=;
        b=yo/3McSVkxn1OFMAlEq5GdxzZQPKgg6PCIIAuvxTu8psvsR0gckfE8oF9D3n8Jrg/S
         wyU9wURoOpvYQ++7Bs3S3EQHpa13z/BvHxbBYDK78BVd5/1jBaOJOTteGk0xwHa37Etk
         bs6rZMNKTKWiqRNXbAic7wUz9+gyA+JINWMfdijpKlUf4irTbEngTV9YTQB5Cf0g18hG
         4gYqWEdswJPxMEPyPw3GwaFO8QbHzR2Tjd8JVnjhxo12SssS1d3vbpBRJV507P/RvBhl
         L3HhFb0rYGOPNidpzE+KyL6IsE1xbrn8A1bfVmMsTpwOhYBjZv4AC47Msz5Ym/Ooaymz
         JLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FCdCz8+kn4V5QKXXXD/ARjJCsuFIBX7KqWzFuKY8PO0=;
        b=KkjZ6Lavny8jr2kwINccfw+Vo5nDDjOkOmlDdvGDD74+e3hHZLD3YtQcnoCzO8EXFS
         yQKmdX/tJqKIZC7uokmTR/xrHg8S1sHdJOBuTFPDjJIRvSsP/7kZBkAvOiF+uBah7zot
         veds8ouxbS+FbtD6eDShR0BNQ8wymuY6GJvWYeuVhOmi/GqHnAB2X4gn/pY4e4F2IDzd
         +4fr1zUxzR4V9aa9uBXwHJnhYGEEdFrVdadeyiXpXEscB9588Uzf8KXKmZNetcN/7O6H
         9U3pnGXWle6pBgUYaQuf4x4l2MLAtWXFJGyer9OuxZhtMfpei8EYBa+xQusfWX9Fhm/+
         fVVw==
X-Gm-Message-State: AOAM5310RRa/O4AqcrlF7/rEyJnXxK6a/qP5fqPGQb7+c1n3TNKt04VL
        GBBoXUZRs+98NyGomfOtmEpF4g==
X-Google-Smtp-Source: ABdhPJylO5AdzKF1vpb9qMP82/3Jhay0MgHR1Y/+gfLln3OGlr3Fxl/r+1JS/trnemXPOfW4gnicfQ==
X-Received: by 2002:ac2:57cf:: with SMTP id k15mr10308998lfo.609.1614641175829;
        Mon, 01 Mar 2021 15:26:15 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b20sm154749lfa.183.2021.03.01.15.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 15:26:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 10/24] clk: divider: add devm_clk_hw_register_divider
Date:   Tue,  2 Mar 2021 02:24:53 +0300
Message-Id: <20210301232506.3057401-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
References: <20210301232506.3057401-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devm_clk_hw_register_divider() - devres version of
clk_hw_register_divider().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/linux/clk-provider.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 3eb15e0262f5..162a2e5546a3 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -785,6 +785,23 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
 				  (parent_data), (flags), (reg), (shift),     \
 				  (width), (clk_divider_flags), (table),      \
 				  (lock))
+/**
+ * devm_clk_hw_register_divider - register a divider clock with the clock framework
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_divider(dev, name, parent_name, flags, reg, shift,    \
+				width, clk_divider_flags, lock)		      \
+	__devm_clk_hw_register_divider((dev), NULL, (name), (parent_name), NULL,   \
+				  NULL, (flags), (reg), (shift), (width),     \
+				  (clk_divider_flags), NULL, (lock))
 /**
  * devm_clk_hw_register_divider_table - register a table based divider clock
  * with the clock framework (devres variant)
-- 
2.30.0

