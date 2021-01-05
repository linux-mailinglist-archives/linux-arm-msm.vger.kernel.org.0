Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D96772EA7F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 10:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbhAEJsd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 04:48:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728668AbhAEJs1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 04:48:27 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41F2C061794
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 01:47:29 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id v1so1366490pjr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 01:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ruQYP7YBV6AdaomBjYYG5DyZKP86kJmaQHorAaM/MSs=;
        b=x/jLHpo7I/Ysg8YjeK7E6v/GbNw+CcGGLQrrPw/2LSTj5F/4dtyIK8b1TDflFycdfH
         yK1Z+QNAC+sloSf1Y4/lw0AazRnhbiRf5JvL9Aw5JOajce/ncNSsAy6XHKYhHAZwdUf4
         mnWj4TWdS5ai7KA8ZXlGdcwrlPXqe7AIOz/yr+XTbYEF8uhH/TZLIwwAiBSCXFZGzegg
         bVE+SmdmSm6Wen5gHxy6Xv/2cxhJ3qTqIYdblxAclodL79azEF9kCDDKWT09HRJB7Vth
         kcumE+1TCl7B5K+N7leTKG2k4WKLjVh4sKeXk/1Ox6i9kiLt/9Du2v3yaNIv/ZdypTYN
         paUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ruQYP7YBV6AdaomBjYYG5DyZKP86kJmaQHorAaM/MSs=;
        b=FlkMgFBQJIXQqu6aW4brfxPAq+q1Q2Q3DInEozCBAmlnxl1A0E7VX5OiLAF09qt9Yz
         apYKcVrFAc9aYvOht0YPqzu2UW0hpUTRZsAKprhT0XhZxOqoQfrd8PchkMkdScI9pxEh
         mI1gyxpHWABGfCA/NgmzAUJZl9Pb24VcoPr2BPTpFp9IWfUazOFHOjmi9pwRQtHrrCwe
         E2YrzNPS0FNbiEnh0+dAkKWjqwMXQeOvXrizuppwW4FmfM7W0MerJbgoa1JrVlqFZSuh
         hTnmKJ+R3hUU6qm1UJnFjFrwy7/h5HB6nKHbMBS8VhD2LXF8AFXPrQbhjJlKQSy6FXXk
         5tkw==
X-Gm-Message-State: AOAM533mCBLXZpvnM5ElnRsmMfTMZ2l0AYFNyuMqtUtvWC9b/SM2S7Q9
        bFeT+pxo8ce9ZlhEC0WWsy2C
X-Google-Smtp-Source: ABdhPJxhBV7pyXljGqmzUKQtYN93lz8kYAJMJWjRlTfQNMmG91uWDjfQRUn+F4q6yQZIDXMfUnrzZA==
X-Received: by 2002:a17:90b:14d3:: with SMTP id jz19mr3312396pjb.196.1609840049186;
        Tue, 05 Jan 2021 01:47:29 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id f64sm60073921pfb.146.2021.01.05.01.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 01:47:28 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 14/18] ARM: dts: qcom: sdx55-mtp: Add pm8150b pmic
Date:   Tue,  5 Jan 2021 15:16:32 +0530
Message-Id: <20210105094636.10301-15-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
References: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

SDX55-mtp features PM8150B pmic, so include the dts as well

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55-mtp.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
index b8d432a4324c..09aeeb14be37 100644
--- a/arch/arm/boot/dts/qcom-sdx55-mtp.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "qcom-sdx55.dtsi"
+#include <arm64/qcom/pm8150b.dtsi>
 
 / {
 	model = "Qualcomm Technologies, Inc. SDX55 MTP";
-- 
2.25.1

