Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3D040A2E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 03:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbhINBzW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 21:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235056AbhINBzV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 21:55:21 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6209C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 18:54:04 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id v123so10633307pfb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 18:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FFh8IdunLG//5DDYuqmMORnNhMToSqUrMV0dgzC94Ew=;
        b=wFZbbmdG7M7RKdvMHX5z7ppoUF4nB5PN/E8KCaRBvyNPk7b4bWbpK6ZFqtdyTof6xi
         Dl8YB23VR0YKXfmLNWP2QUuNEYNLbIvKnS/l/fweMQ2e6H/ExTMV9bU5n5+bgEV1y0Wt
         x+OoPyCuGATLCBJtvL6ZIBh2eteVc6X9rmn8sHsTuB3X62XayeYeE2RatB9O3dg9zw0E
         k5dEwNBVVmvCmIHifpOyDks6K0dD110rRDrtx+7AoqThZNZQJZ1uZxqEMY02riJldqDW
         QPOmywa6Zan9UhPofkqRnI/V9pPthBAz7R0ef0DZogncdmQPLvXjVrQ+lCxARU4Q0AW+
         y4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FFh8IdunLG//5DDYuqmMORnNhMToSqUrMV0dgzC94Ew=;
        b=No53gW8udPZFHqrYYn6yvARDNhGA8oevp71MqUS5NxSUMSPl340fL7Bh/5mEGQiWbI
         F47ZXLVOmnFecQf5kLNE0M8BR8jYuK27DHQdy9jDU++QzYt3BVLIgBweFjH+wqMICq0Q
         26pAUEI+1gq7JX0L33I0ShM6aiMLF/+4LyhwhBkDUz9XMx9Uk+3sEp6zwbyx19a+jZzo
         Y7WiGxvrDPQsL80h4pN1V7rHWmQQXnROTOBrh4mmlhyybVmgeoHotthN0EI6ETFLGsJo
         OCUxMCfcY6BoqdFoN9rOtMuiZmrdRuPNiZYRnYuaemtR+7i0c1PBXiG95g4bVwyejnBh
         JqFg==
X-Gm-Message-State: AOAM531YZYNpOR7VflAbgAWfW4ImWcV1HQwfNzZrrypekjs43/S85Hek
        K3dZxDFOTjVUT4rrdaPFdzHnnxI/xP5bAQ==
X-Google-Smtp-Source: ABdhPJx/hME72qzQHWN4AaPpXERrQ055xtzAXpNXhZOZb7pjOgAzGJMZCCbwPaHvLB3TOAqWsTGQBg==
X-Received: by 2002:a63:20f:: with SMTP id 15mr13302037pgc.319.1631584444293;
        Mon, 13 Sep 2021 18:54:04 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id fh3sm8089088pjb.8.2021.09.13.18.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 18:54:03 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/2] soc: qcom: smd-rpm: Add QCM2290 compatible
Date:   Tue, 14 Sep 2021 09:53:49 +0800
Message-Id: <20210914015349.29295-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914015349.29295-1-shawn.guo@linaro.org>
References: <20210914015349.29295-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for QCM2290 SoC support.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/soc/qcom/smd-rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index dfdd4f20f5fd..e3aea5c6788e 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -244,6 +244,7 @@ static const struct of_device_id qcom_smd_rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-sdm660" },
 	{ .compatible = "qcom,rpm-sm6115" },
 	{ .compatible = "qcom,rpm-sm6125" },
+	{ .compatible = "qcom,rpm-qcm2290" },
 	{ .compatible = "qcom,rpm-qcs404" },
 	{}
 };
-- 
2.17.1

