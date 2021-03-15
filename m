Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7291733C0BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 17:01:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbhCOQAh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 12:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbhCOQAS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 12:00:18 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E40C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:00:18 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id dm8so17963390edb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XbvOKx8GeDAOKdfx+0ASmsBtNfyFi53VA6wkJZSVGyk=;
        b=WzB/lvDPnsXEq/T423lJN3oeWiNGQ6UygU7TbQtUSF07Hqq+CN86wv1iEVhnJ+1QU5
         w+qwtxblTGmdwixhlkfiBIZOOkjP5GC+ge8Mtj1Ihr/SlpEhxHwMPY0Do9t9eC2VNUqs
         /s22tKOUVFjtKtIjvXLCvi1bsDnZHwrZv7Frj9ym98Co8Y1V8TJFFFPy7nohx1Gg1b3O
         uskfG+xBTVW7abEx/mR6bS3nu89FZdYv6/FWCU5oJqKCrvCnSqGoCe4uyo3iYcFn6Jik
         V87L42mQLb+7qCng3J2xIdjHpZoF9Diwg70W5vYwXcSlageBPQbcrw5ZjmkGKyQsu4cG
         ttNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XbvOKx8GeDAOKdfx+0ASmsBtNfyFi53VA6wkJZSVGyk=;
        b=uNMYxOaXJKE68gvvM/WtByaxyex2zAYOdDZ8NzqRg+fVKvBhz3/mRWq8lSGIOLGclH
         B1nkg+eX9jFiD/bgqFWPuvUVWj3TNuKyWoWwo5WIxrM6DixQ8wH+A5l3ML0/yEEx2wRf
         iJV1i49lGJxS3P6tEEzBQlUBXB7NRj/3NuDMqtJ4SF5wmWBN/Kbajd6VplTetZ2wnL27
         IlbpqLM+qK0sr+q+GePpju6jRuYgYScl+IBOUCeETA+NJotk3uAFVwGjQwjF1NUua6h9
         55PI0/N1LcnwMhBOluAcjudandB9QnBR+fAeJoOM+d37U5tPdSl5SRSK1hUiiOmWXXPT
         lz8g==
X-Gm-Message-State: AOAM531qB1Jc9/3YZ88XumvzXiV5f32+7iL4KwdqKIEmJblp1d5kXoxn
        reX+I9sRhMPZgflBMJ4+UPnQmQ==
X-Google-Smtp-Source: ABdhPJwIec0CgwctePEx4Oo04mQGSjXidpUdqlFEkytQqpwF9IACjJRRAOC0b50dzxOB7vv6i98Zaw==
X-Received: by 2002:aa7:cd6a:: with SMTP id ca10mr31046706edb.7.1615824011445;
        Mon, 15 Mar 2021 09:00:11 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id r5sm8456445eds.49.2021.03.15.09.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:00:11 -0700 (PDT)
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
Subject: [PATCH v8 02/22] media: camss: Fix vfe_isr comment typo
Date:   Mon, 15 Mar 2021 16:59:23 +0100
Message-Id: <20210315155942.640889-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315155942.640889-1-robert.foss@linaro.org>
References: <20210315155942.640889-1-robert.foss@linaro.org>
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

