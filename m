Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D975A34B65C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 12:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhC0LDQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Mar 2021 07:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbhC0LDP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Mar 2021 07:03:15 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8381C0613B1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Mar 2021 04:03:14 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id q29so11456040lfb.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Mar 2021 04:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fsZHMjpcpMRNh50aSCQG6toWuDuQmBAyzcA/aBJD+oM=;
        b=C4ABTjf+1I+oVNozkaZuGs+wKMKgrnOVc+PKX/BfFGajdOSkWjvqPvBmhPv8Yy/E3P
         hWjfTA2BLyrci+Pnkp31bvXgNRqeHgOqKyg2mVyBH+pIma/GibqXa0w0JuXqwHlprh8V
         PRBtTbLFT6up/l5M+eFQOASguL0/ixCfVHTH6fTeX3Myl+4X1QWMDGNVHGy/KnXj3wmi
         rcvBoA922Kz0Um+aw7Gl+n3FqcJL3szQ5AQ7Z40fFkTmBd9Ay1Ep8mid6EwUKQFAeAZG
         bsod4m4tSzFVOIpiRkEfc/O049rw2eEhTvljAn6IBgmHyn7wD2AmvVgn//wFjGTyjpB5
         VZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fsZHMjpcpMRNh50aSCQG6toWuDuQmBAyzcA/aBJD+oM=;
        b=dYoKIefBmDnmN8SqHdtizE1GT5Z8PDa/L3+nUAD2GpajHSl1pdw91f4VXNdN72HjSy
         s/Ep5y4WOgkL4mfEw+oPbFLq7D9YjouMVHLFlcr68OGqVB9BtFajwWIba0jvYOVtjO0t
         YsD628HEcvqMcStQOjQdOeeUVEBHRUoBwZk4g0EZ46eupOhz40SYLpPBuVkv5A6thBaK
         5DH88K5xwk1p64K9ZKHfwaHWofvxAZLpsCv+uh4cZbKX7GuJ5wQi6kWWC0aqNDWwFKmx
         DfP5XwCyNSemYboIke4JNLWBuBW6X4QjbXIBCjdfZVKRFgAQOADlYg8chc4cZy9wPJuM
         U4yw==
X-Gm-Message-State: AOAM5315/6c+t//fI1GGmstYnf2+LXtOF46e4eNjOHjtuzG5st6q2EXp
        rV9tRIpjGwC7VTLBXYadkvnO6njkDtE0CA==
X-Google-Smtp-Source: ABdhPJwWbbznHAterTYKDXO9HEln7JYxzDLt5iKbWUyH78pxBQKVlPWB3d8mqM1sKP4I5tFTFC6Jxg==
X-Received: by 2002:ac2:4c85:: with SMTP id d5mr11456182lfl.503.1616842993422;
        Sat, 27 Mar 2021 04:03:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a8sm1513801ljn.96.2021.03.27.04.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 04:03:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v3 03/25] clk: divider: add devm_clk_hw_register_divider
Date:   Sat, 27 Mar 2021 14:02:43 +0300
Message-Id: <20210327110305.3289784-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devm_clk_hw_register_divider() - devres version of
clk_hw_register_divider().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
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
2.30.2

