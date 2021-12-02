Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27CDB46669F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 16:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359042AbhLBPjI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 10:39:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359038AbhLBPjH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 10:39:07 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4CF9C061758
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 07:35:44 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id c6-20020a05600c0ac600b0033c3aedd30aso44950wmr.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 07:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xIsh/cU40ccDZcwP6YbI9udJahz0E6Lgg6Vk1iR/MMI=;
        b=QvVwiENC7HYhao6oUNhSdM3Y6QzOgdLQO/1HUljXGvQq2Obr+NOXkO18jp41PPlxKU
         qj8Vqw8GFnRjfgGo/CUnx7OiPjLZr2yxb1XwlBR82sdPkAD0QGEJnns88PZ0iGaoFjgY
         1B5cwWZ6CCe6dXcQg88u0WcPFBEQgGurxReF/nINsJ7bnujOPhjYaTCtHGHEWsQIiyUn
         3sfzjBgu5o8LAAHRgwduC7px+3udxjfTjeiOXcMYn7JWMJonFCJgxEAGS9MyfuS/jcGP
         j7J8ZX8Oxfyyfo/uA4EXXrp63lyZxPsl39lEpIe9DlsKq/ZnnTkeVmnsJKt5eghdsiZ1
         wUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xIsh/cU40ccDZcwP6YbI9udJahz0E6Lgg6Vk1iR/MMI=;
        b=sswfdPexjxymAo3Uxt7U178unnRB4EO1PlTtBlZii1QfZqD9gjcjdZjR4jW1XSfxhb
         /QwWKqxzqUtBG/asp2W2uIcthNYgzMQIBEVrX3THZEU8jN/EjRVEi3mw9zOlEb9vJD98
         kpZnfE5Mi7FzIOdTzv8zmX0JxbrWji81SwyoJtsAmMcvehhN2xf49Z7+6RD3higBA+O3
         Kcegxcc9DPvILC7+iOcO5xHY6jNbABRU8wm5dWxfA7ve4qms1m1ypMT17t13sbAekIZC
         OeI00mj5sDmppRbcNeyg4lrV/OxlQ0uVjSm3Wak26L/Yt0A3n7Z5+3Q0roP1EL14Scz0
         MBqQ==
X-Gm-Message-State: AOAM533lU+oQZrzDy4EZBzsiVrzWm2J3KnY0sRykScctzwyKyocSC8Zy
        YvuqYmToJfcLYbayUEbC444N5f4N++5wN8HN
X-Google-Smtp-Source: ABdhPJw5os3NF3AH8osi5REnp0NbNQOObKy5GmQVech7OdfoVIbDk2yarrzX/eq5FF4hwuhmYg1C/g==
X-Received: by 2002:a05:600c:500b:: with SMTP id n11mr7220376wmr.38.1638459343015;
        Thu, 02 Dec 2021 07:35:43 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:35:42 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 02/19] media: camss: csiphy-3ph: don't print HW version as an error
Date:   Thu,  2 Dec 2021 15:37:12 +0000
Message-Id: <20211202153729.3362372-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Avoid unnecessary noise in normal usage (it prints every time CSIPHY is
powered on).

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index e318c822ab04..5948abdcd220 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -163,7 +163,7 @@ static void csiphy_hw_version_read(struct csiphy_device *csiphy,
 	hw_version |= readl_relaxed(csiphy->base +
 				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(15)) << 24;
 
-	dev_err(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
+	dev_dbg(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
 }
 
 /*
-- 
2.33.0

