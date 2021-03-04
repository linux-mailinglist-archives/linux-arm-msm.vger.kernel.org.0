Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0B832D23D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 13:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239804AbhCDMFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 07:05:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239857AbhCDMF2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 07:05:28 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51567C061765
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 04:04:48 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id v13so18017947edw.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 04:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SYdUbmFLa4CqUodf6s7urBxIMdr2sW5wzcZAOYTVefM=;
        b=VB9bFJ82r2HxnR0kfnDjGv49wGbywPzI5rq76oxZC8ndoFOXpakVrg1XB5DRXV48G+
         EWTwutPaWMWkHl/yGoc61UcoujiiMGauVmekXynMbBvK/GluIYOSuKFDUqRaZC4R1alf
         VEC/Zfgobnz7pDhELaf7rltRMN0NXDTS88ARL2SUL2I7e9sX4/bTXTAh9S7psli06HhW
         1/qSsqaDTW0199U+bsZi56ila73XdDpDYcXv7seXBF2diKoiB46s1NfCdTtpfeTpAHe7
         To5HmdDlFMN+HpdAlzO0IdYsM8w7jOdKO/+KAeJBRc5z/HpLzYL3BHF7b7iZmETAog/X
         oQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SYdUbmFLa4CqUodf6s7urBxIMdr2sW5wzcZAOYTVefM=;
        b=X5AzBCG4sRqXbTL6MufWjDyBqq5EzROQ4Kd3jkOLfsTcIal3FlT61lOyG56fOXdHjG
         LEr6c9vluEB8UeuNuFSIvfli7dUPaLeJGC3wI5Z0XOEj7oLrLRTqLujld7Lr3zD8lJXo
         oo2Yk5EU9USm+0qEDG+ZoFKsuHqSoUDoW/wKYaTWNyFWeJkXU7bqGcP1ucs8sdF4Tw+d
         dWNE3sIMJtLbiA6Q+15vVlYsfbCMf9wrdKzzlbIbMdlgFcfLSwUWASeATW8luTZlzzhn
         30lQRPCYuYp9V2pRskQzkw+91DkxjyOeNYdivqvV5EdWUSTvHjUNsi8GoTT7EMBhi/1A
         0GRQ==
X-Gm-Message-State: AOAM533dMNRNlpafP9rurBQ/Nh4169zAMz98nQ+59Tcot6s2eciciXyA
        as7nkSfxlEg1UbGt5aRvpmV3og==
X-Google-Smtp-Source: ABdhPJx8f3tiTfhJSXMkH2Tm7DPbXz/vlhkzf6kS2/WU0312EmLDWcbzLShqdAFIZEHUXFLJXPmDVQ==
X-Received: by 2002:a50:ec81:: with SMTP id e1mr3879534edr.0.1614859487094;
        Thu, 04 Mar 2021 04:04:47 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:470a:340b:1b:29dd])
        by smtp.gmail.com with ESMTPSA id cf6sm20464447edb.92.2021.03.04.04.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 04:04:46 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v6 01/22] media: camss: Fix vfe_isr_comp_done() documentation
Date:   Thu,  4 Mar 2021 13:03:06 +0100
Message-Id: <20210304120326.153966-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210304120326.153966-1-robert.foss@linaro.org>
References: <20210304120326.153966-1-robert.foss@linaro.org>
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

Changes since v1
 - Bjorn: Fix function doc name & use kerneldoc format

Changes since v5:
 - Nicolas: Fixed typo in commit message
 - Andrey: Added r-b


 drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index fae2b513b2f9..94c9ca7d5cbb 100644
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

