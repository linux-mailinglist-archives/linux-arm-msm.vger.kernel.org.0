Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67F17F2317
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 01:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732057AbfKGAJY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 19:09:24 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35651 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbfKGAJY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 19:09:24 -0500
Received: by mail-pf1-f196.google.com with SMTP id d13so597862pfq.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 16:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I4KKU3lnlQMUNYRTg4PG0tZkLk5GCpHdCevi44aaMqI=;
        b=BSmq2BLgOR2hAg+twaNBN+Lj06RNuWYteaIO9NyMxnlT2bzZibvLzHW0s8ALhlnOmx
         +ca0rhqfcYfyqeQ4dJJ8PDsPW2BNwJ4EJECnai5F9h/zDdn0cNA0JzHZxWo9cR00oYUM
         T68KXHA5q8BGJXdrLyXd990555c3Ysgg48PLrEAEakcMzsK3ru07Vm8GvYGQnEP3edO/
         WQ2BiGbhZ+W/IUUH7PwIdxUE4+9CvGy9P8xipawoJRpbr5gTC8Wyo3GUibMG+XFQnSOD
         xiaPU+tTleHyfOi2hemCu4pLCvo15tM4b08Ld12kmfC/LUUBGVIOGBG9KtLguHNcRWMw
         91ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I4KKU3lnlQMUNYRTg4PG0tZkLk5GCpHdCevi44aaMqI=;
        b=PLLPwt1GQG9XxxzFOapGXGRTfYddFk5aIlT7i/hADL490MHviRDZDYUIWCMKLBoQpn
         by6rqg8dmQfT201GNh7hlzU4MlLZ9uEyRB6H3lWbYnpg2sQKJEKe2cqCJNJDVPy8A+Xd
         LP6ITAmcRYaLiVXRtf/Pd59kjH+SaKMGdBoSOQQFD3jgWEA1y4GCjHyDWLT/s4QDN2uc
         BlZMpDYBE28R21N0Y+FfnguVB3XEtHacJWCc7TKyXXVnbFRtKLC5JQD7L32UafWQHTNY
         EpqTY3kroqm/x5lFCCRjU1qoSvr14/iKPr1qlaza7Ve5tNwqWzG3BShuSqimGOBDQT4m
         RLZw==
X-Gm-Message-State: APjAAAVsfkVx5DFCQ0FTmQOCu5ae2oBlEtPGkwcaorAAOwlFvXRPZcxn
        /LFpo9LZzeIa87FqHfc6povTXu+y07o=
X-Google-Smtp-Source: APXvYqx4fX8Gn+t3Rh3bmDBrB/ZOu/6lTbIy0+fAFGSErMBTtjm4GnANtgUhaKocS8/SeNeX1xNL4g==
X-Received: by 2002:a63:a747:: with SMTP id w7mr772076pgo.310.1573085363153;
        Wed, 06 Nov 2019 16:09:23 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z23sm216549pgj.43.2019.11.06.16.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:09:22 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 2/5] phy: qcom-qmp: Increase PHY ready timeout
Date:   Wed,  6 Nov 2019 16:09:14 -0800
Message-Id: <20191107000917.1092409-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107000917.1092409-1-bjorn.andersson@linaro.org>
References: <20191107000917.1092409-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's typical for the QHP PHY to take slightly above 1ms to initialize,
so increase the timeout of the PHY ready check to 10ms - as already done
in the downstream PCIe driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 drivers/phy/qualcomm/phy-qcom-qmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 091e20303a14..66f91726b8b2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -66,7 +66,7 @@
 /* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
 #define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
 
-#define PHY_INIT_COMPLETE_TIMEOUT		1000
+#define PHY_INIT_COMPLETE_TIMEOUT		10000
 #define POWER_DOWN_DELAY_US_MIN			10
 #define POWER_DOWN_DELAY_US_MAX			11
 
-- 
2.23.0

