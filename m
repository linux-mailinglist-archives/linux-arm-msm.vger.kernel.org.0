Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B31D1C20BF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 May 2020 00:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgEAWdL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 18:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgEAWdL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 18:33:11 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACDA7C061A0C;
        Fri,  1 May 2020 15:33:10 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id y24so1511090wma.4;
        Fri, 01 May 2020 15:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fBthR+wcgy5COJ5PuVoR09sM6kl0TIToFzQT9ikob/U=;
        b=tOd6B5X13HcktO7B7Ld4JWKAtzvF+dXMuh1WobqrolReNSF+HLsuDYZrQb3SpvrB0C
         5Y6MSs1UphSPajyxFO2yXAp05Y4CBarbpmQrwZWdkhRnQVuF7UcqRwQUseLOyf9IYlk9
         r67gY8FpInacPNQtT1a0td3P66/b3/whG++q3NP3xnWHAGH1QmRof8ShqaSGw2lDG3t+
         +yrUczsUu7kxOGEQYwsY2S//Z8iCLnqQQPEiiBE49z1/jTWfL4oS2RZbm9+qIbBrsIB9
         vIhBypzlUcku7I3/LyfFRYIEMkEuFfQWcy4Ewxd5zAIKPA+7itSWIyV95tw1NLhP4ZQc
         /+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fBthR+wcgy5COJ5PuVoR09sM6kl0TIToFzQT9ikob/U=;
        b=X7LeE3X/LDjqOf/SBOqb26Gs12pF6PbmZIivvE6aKUcWeVyrO9kdmW6531qlM73gfi
         y9isE/TA9UqPfqR3kzQV1szpxZmd1Q6fBLdMzTFpYKtwx5f8EKMMfYUzkJOvQ9Rl0MxV
         v291UGJBC9n95ovL7ovaYQ0Py//gN/WcB0Yww5q16GNqLR1b1oLO5tBS6bKEt5NL8EnT
         sIn00EReD7NxVzrExQ0dCwwSmEh1ZyrnsiluOkFHbT5R58l/S1GS6/jbQ8lTKDkmBeHw
         oEjoX80QWmXp0fNjJCDpqOXUusXv2pT2Wy22PZkGS5Dl9caxgBPLyk7rxLEJYPDUuGCH
         0yTg==
X-Gm-Message-State: AGi0PuYM2XLIAeNrjVVDoCgi2V2FmPk1LyMW1RATerhdTFsqg9gyQXrd
        1kAwDm0mcIJwjzxJP07J478=
X-Google-Smtp-Source: APiQypLT6iW7K5lInGD3jltH2jhsah0Dpdx0iyUzmqxecKPKybRGbX3wnZ1koKIChkYe2KJNx7oUCA==
X-Received: by 2002:a1c:9d84:: with SMTP id g126mr1500453wme.184.1588372389414;
        Fri, 01 May 2020 15:33:09 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl. [83.6.170.125])
        by smtp.googlemail.com with ESMTPSA id n9sm6237750wrx.61.2020.05.01.15.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 15:33:08 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] drivers: soc: Add MSM8936 SMD RPM compatible
Date:   Sat,  2 May 2020 00:32:31 +0200
Message-Id: <20200501223232.275800-4-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200501223232.275800-1-konradybcio@gmail.com>
References: <20200501223232.275800-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/soc/qcom/smd-rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index 005dd30c58faf..8f290c67cb473 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -231,6 +231,7 @@ static void qcom_smd_rpm_remove(struct rpmsg_device *rpdev)
 static const struct of_device_id qcom_smd_rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-apq8084" },
 	{ .compatible = "qcom,rpm-msm8916" },
+	{ .compatible = "qcom,rpm-msm8936" },
 	{ .compatible = "qcom,rpm-msm8974" },
 	{ .compatible = "qcom,rpm-msm8976" },
 	{ .compatible = "qcom,rpm-msm8996" },
-- 
2.26.1

