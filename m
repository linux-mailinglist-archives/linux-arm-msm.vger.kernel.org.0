Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE941EC35A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 22:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbgFBUE3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 16:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgFBUE3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 16:04:29 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D49EC08C5C0;
        Tue,  2 Jun 2020 13:04:29 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id r9so4124823wmh.2;
        Tue, 02 Jun 2020 13:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fFrkZGbA6MKpDgVip+5WxkE5C44o6dddKdANoh/CvHM=;
        b=qgcFhYp45+G/WE7//BnFqthX06KgvrqMjiscgxv7rWUBSlCDMbW8St8blvXXSgOJtx
         G+y1dBZH5s4+ojGuba0v3YjK7faXyitZKvxTbDHZgg7/4w0GJ2FkUKahJIGwn8YhfzhV
         +90585NFL0x/C+UBfr+1VIVwWtDQD2HxCSM3SVX0LU5gS2r6jdmeShAkWR3d8Qv6Y6Ax
         VJmzdZMzR1el2AuegYHt5kfLu063zBysz/gsgeU6mDMnaCsOZoIh/1tvF157QkvlmtJG
         WRD7Yx/nqQO3fiU+SsmDQssVnikHXJYKf6gqe/pAkpUGR7P0HT6C/EIyCxFhk/B/jf9F
         Boyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fFrkZGbA6MKpDgVip+5WxkE5C44o6dddKdANoh/CvHM=;
        b=aTeVH/OgUTGUI0jkZLN7+KdVbZ4JJWbgotubM1m0Vu+ttiB7LW4ECv3Sc+uR175qwq
         KFBrQ2A6Oy+tjibelhvmSSP4Af9t5D2X9ily8EQkiDie0X25KBAHZVSu6IssgYxdDsaK
         vQpj025HJpklVc7wo0bCwdERimxo+oCD3CUcJ68jvXxUgF8q8TQe/btGaSjAyASQba77
         V7le62rdFc4OMu36tH2Xt4tGfYlKyqvz5Tt4bI1hEs6xDwQA9lhSdchkKfbGdDgFRuAI
         0f8ydSUPnnUWf+yihzyqRBzVqBkgkKYtAEvtL3kYym/4V3z+XlJbW8Vfq/ijkEuz6GIo
         JZwQ==
X-Gm-Message-State: AOAM533TxgD8mY193lXZm2Bw8XwKzRC055wclJiLiG6NjF0kvFM+DNjU
        iDhMKUKNFXeVCVfEiVWBwIg=
X-Google-Smtp-Source: ABdhPJyX8nC46je0w47ASRbkIn1n/QchF1gqe14i2MuX22455rQM89KCOQuktRwbnBMv73hDtLTBxQ==
X-Received: by 2002:a1c:188:: with SMTP id 130mr771701wmb.93.1591128267894;
        Tue, 02 Jun 2020 13:04:27 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id a1sm1241777wmd.28.2020.06.02.13.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 13:04:27 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] soc: qcom: smd-rpm: Add msm8994 compatible
Date:   Tue,  2 Jun 2020 22:04:07 +0200
Message-Id: <20200602200407.320908-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible for the RPM in msm8994.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt | 1 +
 drivers/soc/qcom/smd-rpm.c                                  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
index 616fddcd09fd..25541a475ead 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
@@ -23,6 +23,7 @@ resources.
 		    "qcom,rpm-msm8916"
 		    "qcom,rpm-msm8974"
 		    "qcom,rpm-msm8976"
+		    "qcom,rpm-msm8994"
 		    "qcom,rpm-msm8998"
 		    "qcom,rpm-sdm660"
 		    "qcom,rpm-qcs404"
diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index 005dd30c58fa..54eb5cbc05fd 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -233,6 +233,7 @@ static const struct of_device_id qcom_smd_rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-msm8916" },
 	{ .compatible = "qcom,rpm-msm8974" },
 	{ .compatible = "qcom,rpm-msm8976" },
+	{ .compatible = "qcom,rpm-msm8994" },
 	{ .compatible = "qcom,rpm-msm8996" },
 	{ .compatible = "qcom,rpm-msm8998" },
 	{ .compatible = "qcom,rpm-sdm660" },
-- 
2.26.2

