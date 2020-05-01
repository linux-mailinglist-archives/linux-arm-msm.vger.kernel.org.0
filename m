Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E0E1C1F2C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 23:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgEAU6D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 16:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgEAU6C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 16:58:02 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80098C061A0C;
        Fri,  1 May 2020 13:58:02 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id h4so1032304wmb.4;
        Fri, 01 May 2020 13:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l1iUiHlCX8vszl1pLIMm9oBcP0m3wLHIgAhR3pi1/gc=;
        b=R1dtSs59fsjFRzPHIwWb4yTRE+E31KHdnKdsneQGBe3PMI7wjfX/XnBNLubf0Cau7I
         11Pt525kwopAdHxhdpZLEWDe0qShC0nOI9H4Da/HZLql43PySYSNgrZT7fd+iD9D5U6B
         oqre17gV5IZIEXQ2JaV6+ZJ7LGO9G7mHVv/DD5P5NyW/WNCA+7JwSsJLrsJyx9OKRiZZ
         7vYjc0ZeI5LHltRx5a3j50azGNFIjp99gd5GlR395WdeacJ+UzAXO4n2Jh1FFmys10uD
         mR+aqaOmKtmP5mSNkTzYOJT4UyzZuZLJ9yto+8caeEkBK2n63sSi3ZXpFNEVc2AuATXV
         EpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l1iUiHlCX8vszl1pLIMm9oBcP0m3wLHIgAhR3pi1/gc=;
        b=QKW7MImAyRhUIZ2iCjNfa4pa7iQQP9uM2919S6+6gmGpqw6ZTYp5dunHOIdo8HwS+B
         6/Tq365xm8IPEVjLnu3JV9qd52ke6TY8mUR3dQTxkNJCB79E0A/FfFG4KciRJmJcnliN
         9HYmGA9T3+Agpr/I7py8o0BN7A5pRtL3+32vSnVS1qwW/Og0HgPwCbFQuuLvYg87ptpL
         4KxIXqPhw2rbc22m6Ibx3/Q4bmYn66yMST49eSWhWDCkDSqrNs81nFiwkpaVpHugtDRY
         OXqwa4kNkHWqwIwRyX7sXoz/6Gonq9Al5HElqJBOiK6wvn36m4AQXbd9WvD6/5Ec2qDX
         LL0Q==
X-Gm-Message-State: AGi0PuYeMuaskcOeKvII5TDlzNRuF5IkPHYkuv73Dml/RYMwXaNEsRsI
        UNYf7K+ctFMzCUwdhUAPcPQ=
X-Google-Smtp-Source: APiQypKmMgxPx4x1odH3xpcFPlhTeEUfH/zoPMEBSYJLJcNOIh0g0pVsNllKp8TxSaZmSQkwXNW8tw==
X-Received: by 2002:a7b:c944:: with SMTP id i4mr1423202wml.144.1588366681245;
        Fri, 01 May 2020 13:58:01 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl. [83.6.170.125])
        by smtp.googlemail.com with ESMTPSA id k14sm5970446wrp.53.2020.05.01.13.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 13:58:00 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Vincent Knecht <vincent.knecht@mailoo.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: soc: qcom: Document MSM8936 SMD RPM compatible
Date:   Fri,  1 May 2020 22:57:28 +0200
Message-Id: <20200501205728.152048-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200501205728.152048-1-konradybcio@gmail.com>
References: <20200501205728.152048-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vincent Knecht <vincent.knecht@mailoo.org>

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
index 616fddcd09fd8..55f8abd845a7e 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
@@ -21,6 +21,7 @@ resources.
 	Definition: must be one of:
 		    "qcom,rpm-apq8084"
 		    "qcom,rpm-msm8916"
+		    "qcom,rpm-msm8936"
 		    "qcom,rpm-msm8974"
 		    "qcom,rpm-msm8976"
 		    "qcom,rpm-msm8998"
-- 
2.26.1

