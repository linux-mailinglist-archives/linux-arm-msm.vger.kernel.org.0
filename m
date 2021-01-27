Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD8E0305EEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 16:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234979AbhA0PAW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 10:00:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234894AbhA0O7S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 09:59:18 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5532FC0698C7
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 06:50:50 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id rv9so2982870ejb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 06:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fUGwtlmgXSNtLs4jeYoyMy0OUjwWufxEelxvIP0w1pA=;
        b=alEkX+Sx59Smnl7Z4vBHr+Z+mZQ5I8JZ4f8omrA6hSEADQTY8DfdJd5Y4mTSsNMVtH
         PxMCMfJ4Hy3KUJrg65l5N4ox2YtBCANRQ+iyXnWrnyXz3vvDv6Fk4qsVWJR6DcjQkeZm
         n5+5hR5V94cbHQLAw6qzGS4nYnfauqFiV+rfscoJUAOvM58NIZztvlDjfwy2Fxn7WLmu
         xq4ZTYp3dV7CjhmTXiGUaXwquJGRFwpAMVtMXB5Wr8E12eVcZSOpd63amAQ0pywxvYEc
         Wk8szUf7PXUH6Qq9XAJKVrQwYozVyjvty+lITAl/NmaDLe88ly6MBYNCkYGBFz8LbOvq
         g9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fUGwtlmgXSNtLs4jeYoyMy0OUjwWufxEelxvIP0w1pA=;
        b=bwvxD4/BlxX7NMaFtpslhi0vn5MZHrLRBYaRb5ZG65EviCCmXpq9Frms8pTnC/u5tU
         qhvVw18mAkYMSLpoZWMwWoDUPQN4XkCqJDmjwh5VNiaCzftggZpAe6aEUAHpeKoeSY+G
         ruL/gXHrGEuqn6pL8KjYjV0bLCoCM9XhXbAOsdCsA1sidLkcHWNBt2S/vHXUYTjv1gyZ
         PmQAELAy8o6pn+WgAGmwt9z7Du8elbFtUS/tywCvDVjNrUG+yD/H42wQKZFTnrFCVJQG
         NWAxHpksBcrWTH9RGraL6npE8wRML/BiBp+S5kQ7HLrt6LPjglS3FUBbHh7w+uBhVB+Y
         FWUg==
X-Gm-Message-State: AOAM5302LUPtTH/1mhpMCRqifuidp25HpkiaQGGW5Zp4fKb0FPw4dGj4
        7aQF7koSfqhvXRUAN/s51KmjuA==
X-Google-Smtp-Source: ABdhPJx2Fy/kcL4edsIwHR57CBimydaxfXDGjLlgfM0U6w+x5xx4Ir9RVagFSvoQbpboPiLDouSZVg==
X-Received: by 2002:a17:906:2a06:: with SMTP id j6mr6787171eje.164.1611759049120;
        Wed, 27 Jan 2021 06:50:49 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:62e7:589a:1625:7acc])
        by smtp.gmail.com with ESMTPSA id ah12sm947799ejc.70.2021.01.27.06.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 06:50:48 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v3 17/22] MAINTAINERS: Change CAMSS documentation to use dtschema bindings
Date:   Wed, 27 Jan 2021 15:49:25 +0100
Message-Id: <20210127144930.2158242-18-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210127144930.2158242-1-robert.foss@linaro.org>
References: <20210127144930.2158242-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Due to the complexity of describing multiple hardware generations
in one document, switch to using separate dt-bindings.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cdf1556c6007..7c5a494d9113 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14686,7 +14686,7 @@ M:	Todor Tomov <todor.too@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
-F:	Documentation/devicetree/bindings/media/qcom,camss.txt
+F:	Documentation/devicetree/bindings/media/*camss*
 F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
-- 
2.27.0

