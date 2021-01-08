Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA332EF1C5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 13:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbhAHMFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 07:05:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbhAHMFd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 07:05:33 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F1CC0612F9
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 04:04:52 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id p22so10874157edu.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 04:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BQWuey667ZZgdSLB64Knsh9ia2lw0H43y5dWY3vhsQM=;
        b=ABTZMAR1VScMXDngO3qAU0NAIhoDL768NdXmVfddzJXLu8xCd8DR6UfLmJCU2vIhWS
         249O2V0e2FjPxb5wuvOWaetklIt7JzVDryrDrAj9wx792eubDEYSqJ4w+zYZ+1ZEI0Kz
         IT5AG3ZekQ3r4ILyLpRKFjb7AJXOOKjBa3wjj5JSJ01QHuOYvaqFg+sG1jAr5K2fMvc/
         WIoILibfpMzOSooUIW+TO5IfEpJQ3OEpXSVuuZ2C1a6ZAySFkX95RaYDJrAJW8r23Pye
         eUZ1j4FqJK8sBfpqxIYXr/M0TJRT/pwoe/XD+7vR6O/arMH1m3tYZbVaag++zYF99ptB
         Z2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BQWuey667ZZgdSLB64Knsh9ia2lw0H43y5dWY3vhsQM=;
        b=CjJonpeBXCqdHL9VKEJi/vQ3+emyXL3Y8FhTxa0dm67Zd3+Qm20Veg66RwkMSGiNw1
         95vUS59xAh+rDwclO/7jsrbe/BQ9kQfXSsQNVm3f+xJUkFZMLqPYPuCXql0W3Cd71lA1
         CDubs5oPeu6XeDYnXkTmdVLgNffPymGukxfILy+xfwpHeInQR7bTv/DiQcyXxQ2LMLl1
         EPa9I9NJ9YF+tfrTM1eH/uU0qPqyRthrmJDfsM+Vozq07pbs71I8NavDgXJs3EKYLrov
         tzzBZ8nobzEwqstr/IBAuxtB/sdZTql98fM0nHKYlm+1sGCbS5VmOAlCpx/+gDeci7Qq
         lqgA==
X-Gm-Message-State: AOAM531OMJ7Q+OK2xdOlqY6F+0z6l8/0P+fiR9gicCo91PKAqiq8xgH+
        U8eUX0e1Ms6zHln/cvvf/u8qXw==
X-Google-Smtp-Source: ABdhPJxLTEyV4cul9MoJMPUStCY3bjo321jIPcdjxFfkxngfjunO1TdNbFqIrZgzooedOpRNgUBLLQ==
X-Received: by 2002:a05:6402:1102:: with SMTP id u2mr5106799edv.18.1610107491335;
        Fri, 08 Jan 2021 04:04:51 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:bb2e:8b50:322a:1b9a])
        by smtp.gmail.com with ESMTPSA id i18sm3674498edt.68.2021.01.08.04.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 04:04:50 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 01/17] media: camss: Fix comment using wrong function name
Date:   Fri,  8 Jan 2021 13:04:13 +0100
Message-Id: <20210108120429.895046-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210108120429.895046-1-robert.foss@linaro.org>
References: <20210108120429.895046-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Function name is comment is wrong, and was changed to be
the same as the actual function name.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index fae2b513b2f9..478be4f0cab5 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1077,7 +1077,7 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 }
 
 /*
- * vfe_isr_wm_done - Process composite image done interrupt
+ * vfe_isr_comp_done - Process composite image done interrupt
  * @vfe: VFE Device
  * @comp: Composite image id
  */
-- 
2.27.0

