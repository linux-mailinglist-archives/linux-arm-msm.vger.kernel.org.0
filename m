Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829BE3590EE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 02:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbhDIAeL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 20:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhDIAeK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 20:34:10 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54A0C061760
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 17:33:58 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id a1so4427324ljp.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 17:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GZsVvoVqEno9RF4WgOSVtDCPs4cSjvnH+qjloaqrTY8=;
        b=xlR/BS+INgsAV0f8DOZ1uza4DDufXPz9smG45zz/8LD9CLfv2YsnZPw/8XLJAQgZw4
         LPe+jFq5eeK65wGMg+jlE9B+kipg2AZ+1WnKbScaGxqwgCL64ThEDzmMcwUEmasT3qxG
         2bDx8qDEWmOkEwKHlQ02lpGSQbwaAMs8YiLXVD+TGwrkyFXUUnd8nxnQINpy3udz9Phy
         IqqyFDYIPKL09FPfqWtoWgUUfS0wlAh9io6marPtAVHH4D1217MGaFhj2lPOZO1m6jfm
         DYoIg8UnSQKroDvqjNnnSl383mWJpWhuRDcv/DmIFmo6NdhvLZ3ELP7R5mT19+4UTyE8
         EDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GZsVvoVqEno9RF4WgOSVtDCPs4cSjvnH+qjloaqrTY8=;
        b=nHuxSe3AHg0fhVHecez9XoZ9VLNmKTIN2NII9sf+K85vM1WgCDqSmGPFshTXLFCNb8
         gLLlu4LkyVI7oWKAhbYZxR6jZ6jihnWjSPWrb5c2ePEoTKBHXxuQ/cSjtwM+4gPNv/1l
         zBQk3/Xg7jzoEkEylbXucSvB+6pDx2v8LwotezUBHAeCTb3JI5Qfwkce1KeRfQlC7y6+
         2cuBtgI2xTn8GUJpCpNdTWJ4ckcl8OYKHJGGjddospVqJ0mt6388YA6qH+wkMm7XBUdD
         zPsINa8pXQk13NHnl4IQnksse9AltwDKLQrthqbRiBH8ofyfjVjWEDrImgfyr6utthE1
         j3/A==
X-Gm-Message-State: AOAM531PH0uRt7X2g24vcwxnU1JSsgFdkZlFz4iVomglTKjAul0knU8v
        1dVpj1JILKcamHJ7HTQNHG+iWA==
X-Google-Smtp-Source: ABdhPJzDVgWp9UixHC/Gx9UF5LMDFjTWiySCEpKgKdN2kVVP2AjHcy2rGvCMw3riRYVUip5TIpRKCg==
X-Received: by 2002:a2e:9a96:: with SMTP id p22mr7502365lji.167.1617928437205;
        Thu, 08 Apr 2021 17:33:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q14sm101741lfu.260.2021.04.08.17.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 17:33:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] media: venus: core: correct firmware name for sm8250
Date:   Fri,  9 Apr 2021 03:33:55 +0300
Message-Id: <20210409003355.1129672-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Firmware name for venus should be qcom/vpu-1.0/venus.mdt, not
qcom/sm8250/venus.mdt.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index bef582470fa2..b7362706ad8e 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -701,7 +701,7 @@ static const struct venus_resources sm8250_res = {
 	.vmem_size = 0,
 	.vmem_addr = 0,
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/sm8250/venus.mdt",
+	.fwname = "qcom/vpu-1.0/venus.mdt",
 };
 
 static const struct of_device_id venus_dt_match[] = {
-- 
2.30.2

