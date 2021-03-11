Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50AC4337BD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 19:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhCKSKb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 13:10:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbhCKSKC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 13:10:02 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66FBFC061761
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 10:10:02 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id p7so36794728eju.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 10:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XbvOKx8GeDAOKdfx+0ASmsBtNfyFi53VA6wkJZSVGyk=;
        b=NMhakzXexeRDYdyC5gsxU72ATzIKQRq0QwuGD4GIK0climHoiim4Wt/X1tLmKclRvc
         wWkNAWCYudj7oKE/VjF70BKNoUPQoJVMbauatL2VLlFMcLaJdi1vEEXjXNqtjzfK1xJ9
         ura74LKAWju/PX9nDVF7fcUXxUpPmfeGVPvIdJT4o/tigNzbAt8n3M2xHDC4P0LHU2Tp
         1rSOOAdqpTktxs4suf1Yk41EpOaqPXK2Iv+GsGuMovMWEtJo/SVCkIUt63Tjmjk1cgmO
         7bjQEBuAd54n7Ouw3HswqSr5lQPvc+trPZCksCYObfyLRFUKBELo9Ve8xdx/dlvTABJ6
         S9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XbvOKx8GeDAOKdfx+0ASmsBtNfyFi53VA6wkJZSVGyk=;
        b=sEzmjgdyqGOo/eJGnWA42NW33gu3YUme+KLNb8TrrFkbZJHM/fM/1VvGsEYVGyxYJ9
         OAgSusBkB2TgJ8X/1KB78/QbQWwyx7LqeHTwNXcLYqLc5/gzRaOQOS6alO/GdSdBJKbQ
         YShOXiiVKsElTQDSK56RMurk+36pvGPnMaUHG6zEOqp03eTspTse0lxZc0kekKjd3WKI
         vmQjgP5SumTWNU4fZk+1Lm/rSNAH+7BFA9NRsuGuy8emzz8KNbs21Fdbt2R5xxBju/Ob
         tV/gxplTkgwCToMM+JSyqoa9RGSwyw+fYtfREPIS4m3hO1iszAmIfKtpj0lsLC2x7+sD
         uVrA==
X-Gm-Message-State: AOAM533GSTLC1ol59+Hl+u5lXiEDS1DX+jeKDYH5PuyH8lCN5hDh4JxU
        oQPEKodawi9CInbIsbV8oZ7UQw==
X-Google-Smtp-Source: ABdhPJwoVF6+uGpyGAUhLvfNsKS2/8WOEAryOnAE9WLCuZnppq3ApWShCMklNXgV9WmcvOqf/xUhxw==
X-Received: by 2002:a17:907:2d9f:: with SMTP id gt31mr4257668ejc.233.1615486201194;
        Thu, 11 Mar 2021 10:10:01 -0800 (PST)
Received: from localhost.localdomain ([2a02:2454:3e3:5f00:8e01:34c:da50:eb7e])
        by smtp.gmail.com with ESMTPSA id a22sm1741290ejr.89.2021.03.11.10.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 10:10:00 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v7 02/22] media: camss: Fix vfe_isr comment typo
Date:   Thu, 11 Mar 2021 19:09:28 +0100
Message-Id: <20210311180948.268343-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311180948.268343-1-robert.foss@linaro.org>
References: <20210311180948.268343-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Comment refers to ISPIF, but this is incorrect. Only
the VFE interrupts are handled by this function.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---


Changes since v1:
 - Bjorn: Add r-b


 drivers/media/platform/qcom/camss/camss-vfe-4-1.c | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 174a36be6f5d..a1b56b89130d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -922,7 +922,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
 }
 
 /*
- * vfe_isr - ISPIF module interrupt handler
+ * vfe_isr - VFE module interrupt handler
  * @irq: Interrupt line
  * @dev: VFE device
  *
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index b5704a2f119b..84c33b8f9fe3 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -1055,7 +1055,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
 }
 
 /*
- * vfe_isr - ISPIF module interrupt handler
+ * vfe_isr - VFE module interrupt handler
  * @irq: Interrupt line
  * @dev: VFE device
  *
-- 
2.27.0

