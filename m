Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4A833C0B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 17:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhCOQAg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 12:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbhCOQAM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 12:00:12 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F129C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:00:12 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id y6so17911725eds.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OfcdS0huGYBFauDoZapDpV12oshuFzeyuB4yCyBnMLQ=;
        b=puNK4XaC5cNoGejioatHXKLhexlccxQNK8NM3HSYWfHBCkz9C7Qrt3M3F+BWNKERPw
         Y37r3sx3dlqBEnY1cffg6QFdtElj/lIBSS/loEE+H7SBt2DrHbWEi2KAt2kW/qdyKl+z
         vQcywX00sEsygu8Qxd9OoTHwYquxjY7SMcUNPKILKnZUvxkQ2NPZ5GRWaT4NGX3CyQLH
         53PzfjTiV3V2r7pmkZTOq3GiwgM2RS7oDJwmM1WIfRvIkt5WBywufP7UylVDsRvIK/cl
         P07CtrgeJUCbAM44OrAedLfN0Aa9V2hp84yJF8GFkrC/jASZd7J2ashQ+qqM8EAFCe/R
         qvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OfcdS0huGYBFauDoZapDpV12oshuFzeyuB4yCyBnMLQ=;
        b=K8HbN5RfUTSQOmZIyUh8gcNIvUYSKugeJ5SwSbTtJtUdPqfqNkE87zHiIsSzZTr3MG
         OIOqVsLRZjj0DLA+WlpgORLSO9cXHV5L3D+zwNPlvEN6L9XaDWoO6m3f+Hca1RtHodl+
         AG82ASL5kvprO04j+t4yHwQXa2CICUF3oh3IyvAsk7mXhmKDDxJD8FGCxy9QyZ4tAef8
         PZrDb/KUm7zSoIJS1F1I0Bzohe0oNZudL0Bcsbx9kyiLAm3cmuhmm98/2qCXeRoRKntZ
         7W37WiswIIBAk4z+/7roAk0dZ1Yo4D1gg1VsBv98Z/SXNdR2I4PVzCYjSnqZlq6oXvVW
         FJ2A==
X-Gm-Message-State: AOAM531BdSawv1/yiB2oOAH6kbZBOc2XiBZZ3+sJX1AUt069dPfRllid
        pfkiZUwble8qMFmMzdjBR70IeQ==
X-Google-Smtp-Source: ABdhPJx7LrtvkdpljiP68AprOO7WCv6OHfThNyQvhEOeambEUxpqCJd8FyMKT7z0BASwm0lVQJm/Rg==
X-Received: by 2002:a05:6402:1a3c:: with SMTP id be28mr30911925edb.125.1615824008680;
        Mon, 15 Mar 2021 09:00:08 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id r5sm8456445eds.49.2021.03.15.09.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:00:08 -0700 (PDT)
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
Subject: [PATCH v8 01/22] media: camss: Fix vfe_isr_comp_done() documentation
Date:   Mon, 15 Mar 2021 16:59:22 +0100
Message-Id: <20210315155942.640889-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315155942.640889-1-robert.foss@linaro.org>
References: <20210315155942.640889-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Function name in comment is wrong, and was changed to be
the same as the actual function name.

The comment was changed to kerneldoc format.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---

Changes since v1:
 - Bjorn: Fix function doc name & use kerneldoc format

Changes since v5:
 - Nicolas: Fixed typo in commit message
 - Andrey: Added r-b


 drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index b2c95b46ce66..f50e08c4fd11 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1076,8 +1076,8 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 }
 
-/*
- * vfe_isr_wm_done - Process composite image done interrupt
+/**
+ * vfe_isr_comp_done() - Process composite image done interrupt
  * @vfe: VFE Device
  * @comp: Composite image id
  */
-- 
2.27.0

