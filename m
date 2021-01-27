Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EFB3305EB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 15:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234325AbhA0OxJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 09:53:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232634AbhA0Ovj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 09:51:39 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B32C06178B
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 06:50:11 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id gx5so3022233ejb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 06:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oxEhFanRiIwaURE1Asj018eMvsFp7g2C+jPywv6JQCM=;
        b=NeglsrrixY9rZEEIxHEyT/suHbI1Gfos+GErBk/xQmZkr6Gv28ZysCDosyRnCSKZwf
         /p8Rp6ibysS4eoSIbEwiq8K8YdMHUFS+wDpVI/Csp7xHhEmrldo0Tv2ZzLY4TmJsxJi5
         b4Qn1A1WGFRk+gR2Ka8wYtVs07gY4+FER1LI84dywp+7grOt/VeAt+s0NeUW6wJPqWWS
         YuUVoOnq6kP4fBk+DVVsvszn1UitOMIkpQgPv71TIWNzGqkfiN4e5WPL0ncM9hhV8Z16
         abEvo5028UNiVYORG1kY55tS08RWBtPl7MDLza/ZEQpE5Mb62KmWCjrUzYr6Wr7KNq8b
         ugKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oxEhFanRiIwaURE1Asj018eMvsFp7g2C+jPywv6JQCM=;
        b=XEVp/y3ZeVALCAV2/T79VKdsV4e2gdw5bmk769Pi2Qnoo7z4JGRl8B4Yfv0j5Z1dDL
         VtFWWlvqXKtAevaNOGTGR33ejofA11pCumVJfFChAftYTfIr1wN4DOkccuGDycxM0Q2f
         7kij9RFHaA7zMf0P4crZbEhU29XHu6095Ta3pzSXK6JdMf9HquX4IHKJOcSUawUkNvZ3
         4fPMH6Ik2Css8TKjp72iDzPm44q+haPToPCbEkvwGxgUNxcN6tF9QeZgJ8JtkY9A2b7r
         lEMip1Zqvo29gNISoni1BzpmB4eJ+MrpBKiVSCqmNSi2nygaqcjTy8MYWIanSGoeO8En
         zCxw==
X-Gm-Message-State: AOAM530EGNRt2X1ogh/Z9CapExd4WlxgxZQXwFLcT254wS6+H1Wz+BG6
        oDgK7rq6O1mlv0NFFRk8fcY7aQ==
X-Google-Smtp-Source: ABdhPJzZ5y4B62ekX5qoKUdz96g02k/wijLaOyht7V5SlAXjVlvpG48MiaSso54Xo7Zsx1yLvpV9oQ==
X-Received: by 2002:a17:906:3c41:: with SMTP id i1mr7248047ejg.443.1611759010240;
        Wed, 27 Jan 2021 06:50:10 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:62e7:589a:1625:7acc])
        by smtp.gmail.com with ESMTPSA id ah12sm947799ejc.70.2021.01.27.06.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 06:50:09 -0800 (PST)
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
Subject: [PATCH v3 02/22] media: camss: Fix vfe_isr comment typo
Date:   Wed, 27 Jan 2021 15:49:10 +0100
Message-Id: <20210127144930.2158242-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210127144930.2158242-1-robert.foss@linaro.org>
References: <20210127144930.2158242-1-robert.foss@linaro.org>
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

Changes since v1
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

