Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E0A45CB83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 18:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349873AbhKXSAe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 13:00:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349930AbhKXSAd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 13:00:33 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F95C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 09:57:22 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id s13so5734410wrb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 09:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xIsh/cU40ccDZcwP6YbI9udJahz0E6Lgg6Vk1iR/MMI=;
        b=hoIwiomiumHA8TmSf7CZ0EdLDq/xEdboVgNmQH73oie4C98LqFsyZ1tnE9Z+vNSr1u
         cDuxAfZ9Vy/JO0BdWVdgyTGWN8ZSQOC4/qNPybIJwhpKWPqcFLR6HSS7TsOyXa7EOCvb
         W58PX0JWs3TgXjUYiy1TYcLLFMM2gerneLqhXt5mKsGXIgFS27lSRXUwJInVNPzuCJpb
         c8IQgFTJ1wVVfJMkGypJ3opNz8L8NgqiFlF2SOxepsq5SpOdeQ/snkPbURxuAPx7WWgU
         eFypH28Dxj36ru/oW6OESdFgdVHZqF3NyrOVLEZMT1HK6Y/ZIElVSzEAi8u8mSSzyu0P
         a0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xIsh/cU40ccDZcwP6YbI9udJahz0E6Lgg6Vk1iR/MMI=;
        b=DA+MCmJKDYFVH5uHO8EkJcIfc9R200ov+fQYileZDY6j1EXfRMI21n7jBVoY4kcZjY
         zwOYdFqZZfT4tI/DX+rcO0ujWkUc6Ry8AjAojl5f3SiWN1zLNBU5Vhyw+NGydEJpwDJw
         XLHx3ZM7Hntx8T8yZXh+gGjdqGd2/ph9Rye4Um9jXPUgj/g4oyXdqay4wUATLVJcnX/9
         UXRhWbPay3ODreCBK7ynDVE8LCmDSaomRBZNmE9vt0DT2CpAoQD9pP0EXilUYkchiYds
         kgudPjcKMxVy5mSKfvEfvut3OxqUKPm9bwOmPUm8hsrdvto3UJOSpvOvwvS8lCTgRHA7
         nsdA==
X-Gm-Message-State: AOAM531px33W0cuHtM8AYT98BhgMe0QmH95mUtWdA6OfmEYnojAh4tFy
        6r7ADNCnI6AFlZ0v1qOkcmnwD8byeiWwSvdM
X-Google-Smtp-Source: ABdhPJzkYK4VaI7FgqL68JyPQ5wwc668CUKMV/nroRt3pR/XNQiCLcZqpThXW1StltiWhUMvGx9dQw==
X-Received: by 2002:adf:e0d0:: with SMTP id m16mr21168997wri.74.1637776641210;
        Wed, 24 Nov 2021 09:57:21 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s24sm380576wmj.26.2021.11.24.09.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:57:20 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 02/19] media: camss: csiphy-3ph: don't print HW version as an error
Date:   Wed, 24 Nov 2021 17:59:04 +0000
Message-Id: <20211124175921.1048375-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
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

