Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD474C3CA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 04:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237182AbiBYDtm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 22:49:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237179AbiBYDtj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 22:49:39 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09ABA192E25
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 19:49:08 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id j2so6072988oie.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 19:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UDK1kz5Fr0UKhxFUazSV4lfvWljmN762R0UmyDLBbzw=;
        b=DiAwxygHlg2cunADRHhaLRH/oj/hg887zxesH6wxMvEbnn2WM1kTGcjd3b76js74Ex
         NFv2iIrjxYfyS6GoFxahnN6CvoXjD8vdR+QAkzRsIWFdREtCZdykdi9UwLaZ6t+UFtxu
         DVQ+C6oZtLJwgY3/gToIATa2kHQ2I3OrhIF+6PBaj8Cr01A6UFq0oBhFvGkTivzrGgpR
         fYuoo7Zico/l+lnF7zjeWhV7Xu7rHTbhAPCFEaIQdIhKE0VbGflbF76+lBQPsfeeQD+4
         e+fYH7ETmElVqP7IlRdOkGQN2b7ymK5JQJ5XfikwHU0jwdW9/a0Z1UHD0n+5zF2hEZiZ
         PiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UDK1kz5Fr0UKhxFUazSV4lfvWljmN762R0UmyDLBbzw=;
        b=lRiQOoYVoD9N0Z9H5CR0yZ+gJ147TQD4uLphi4EQ+hJ/SVkFdIJ/jsLzZYYl0fJ4/I
         eHmZXYD0dL0vNYYQ2F2f3n+dlepjy75rS9yhSSOfyhwHgiY4fPvVSERHR+0daJMwJcZ+
         Qb/VGr3Z2h/G1HMurAa+TKDK5O/Bhn5iXq4ZWPKOVVIukjkrRuJwDenj7S7jT3sk40Ti
         qNiLCXK5fpImFgiDqXc9ZQSLmmgNw0LMtV5qMRjaq7XINOCXgpQdtzhsSj1cU+veiTbA
         1szEjK+eJt/A7pmrUNjlYy7Llk0IKXHOS4RuBOkuH8BQzGGNnQuXndCq1/vOUzAuOfn3
         9VPA==
X-Gm-Message-State: AOAM5323XrQPM8L7tZs45dda+NYBNg3BBgrVLRYG8p+UaOwJk22VWsMO
        1ilagy9cqrfwwZ+EPEfWHhtZQg==
X-Google-Smtp-Source: ABdhPJxL6kvHspWE/hrl9ic6VRR2xRWso6pVw0L7xjQUzQBX5YVNv21tx0NumUdaPwA1VlEks9B5Hw==
X-Received: by 2002:a05:6808:1281:b0:2d4:6e64:1c6 with SMTP id a1-20020a056808128100b002d46e6401c6mr639967oiw.293.1645760948192;
        Thu, 24 Feb 2022 19:49:08 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id a10-20020a056808120a00b002d404a71444sm664088oil.35.2022.02.24.19.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 19:49:07 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] phy: qcom-qmp: add sc8280xp UFS PHY
Date:   Thu, 24 Feb 2022 19:51:05 -0800
Message-Id: <20220225035105.2294599-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220225035105.2294599-1-bjorn.andersson@linaro.org>
References: <20220225035105.2294599-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reuse the SM8350 UFS PHY initialization sequence to add support for the
same found in the Qualcomm SC8280XP platform.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 drivers/phy/qualcomm/phy-qcom-qmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 8ea87c69f463..b144ae1f729a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -5977,6 +5977,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sc8180x-qmp-ufs-phy",
 		.data = &sm8150_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sc8280xp-qmp-ufs-phy",
+		.data = &sm8350_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sc8180x-qmp-usb3-phy",
 		.data = &sm8150_usb3phy_cfg,
-- 
2.33.1

