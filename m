Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E78D1EC383
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 22:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbgFBUMh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 16:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgFBUMg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 16:12:36 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546A7C08C5C0;
        Tue,  2 Jun 2020 13:12:36 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d128so4435813wmc.1;
        Tue, 02 Jun 2020 13:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YvO7LalvDBKdEIQhWBLkEPXbP+HlcCB2geTzQhd9c2g=;
        b=FmnQ2xtIXPTSynL3P2/yB1nEvunTdRY+wGUmG4RtqmxfFDWg+t5R22oMD15K8bpkEI
         lBqjWAlfPSk/VYQJgDzhqNRjQRd4vEbpECr2pmXd4IvEWiY8J1i8mUYIpH47JzSbe+my
         AcnKivd1apEwTJR294YmOiklAgXPXpLQDYm5DENQ0nmdXrrtI/AG46arhODJpNEB03uE
         fQ6Uqf+fncZWeRbTalgGrvbpUxy83MPDrBL6RaF9PBbHOp1Vppck/nTNanzQnXdNCPJg
         qEFqQzfhQhnnBtC8JI+wNs2LYxx6dIWbyFbINoyOJsqlr8kfAixRdOn4ObquSNQu0EDN
         0lKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YvO7LalvDBKdEIQhWBLkEPXbP+HlcCB2geTzQhd9c2g=;
        b=JrOpxynL57QMLl3pB1HR/ZFF8GC+osqoYyz9gshivJ4rGtQi42jHTSsKcLc5aZWddT
         8QTUIUcpbQ1rAsoZaNEbGdPDQkx1+Tfbt0UxPnBrFdqFI8GHQYMGPZSc5d3o2sKCaqLt
         kh5rtiBU1/QTZi/b2xSfgntnzZNam+B6KrD4rO19E+3T4bAQCG/69OLdlyosN6rx9yYN
         oeI8cNfbgDFFS3RRG/UJF4NJPQLeeeWu9MK8ByCq3li0F6+JJpf5TxO3oxC5RFEoZ1gl
         xj9juPd0IzvEf4YsuO9uYaOiscLok6Vd3n+sNAvmH9gmJscBB6F+ywj9a2jDARoCZOoN
         ObXg==
X-Gm-Message-State: AOAM531ZPqzYYlk5+FICSKvfA8pyL8e7aToDcermvhD6EaBfmCRsCXwi
        dr8pKhGrCBsv3Wf9Fr4uQ1k=
X-Google-Smtp-Source: ABdhPJxsRYNpJL8KzrBdYigguSB9eH6qYay/3TrVc3x55kqpk7OQKMbwzj8t9r6I6H9VNyK++jKA6A==
X-Received: by 2002:a7b:c764:: with SMTP id x4mr5426008wmk.94.1591128755064;
        Tue, 02 Jun 2020 13:12:35 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id 5sm175112wrr.5.2020.06.02.13.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 13:12:34 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] soc: qcom: socinfo: Add msm8992/4 and apq8094 SoC IDs
Date:   Tue,  2 Jun 2020 22:12:29 +0200
Message-Id: <20200602201229.322578-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index ebb49aee179b..137f62982223 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -177,6 +177,7 @@ static const struct soc_id soc_id[] = {
 	{ 186, "MSM8674" },
 	{ 194, "MSM8974PRO" },
 	{ 206, "MSM8916" },
+	{ 207, "MSM8994" },
 	{ 208, "APQ8074-AA" },
 	{ 209, "APQ8074-AB" },
 	{ 210, "APQ8074PRO" },
@@ -193,6 +194,8 @@ static const struct soc_id soc_id[] = {
 	{ 248, "MSM8216" },
 	{ 249, "MSM8116" },
 	{ 250, "MSM8616" },
+	{ 251, "MSM8992" },
+	{ 253, "APQ8094" },
 	{ 291, "APQ8096" },
 	{ 305, "MSM8996SG" },
 	{ 310, "MSM8996AU" },
-- 
2.26.2

