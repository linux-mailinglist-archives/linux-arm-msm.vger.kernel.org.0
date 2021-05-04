Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF133729A6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 13:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhEDLt2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 07:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhEDLt2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 07:49:28 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E4D6C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 May 2021 04:48:33 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id gx5so12657593ejb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 May 2021 04:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vZKw17Y6Eu5a8sxvLIrFLfxkEizM6QV3DVVZZEdS/rU=;
        b=OnYC6S9iWXIxsdpdyW/QtLTRf8feHepvehG7VkmZuTC6eS1nil38GiXi3UczBI7+0M
         4lIxDqssnU71JyOcDpAY3eTLulPMVM0npYc50EkL3JLfp0oPsB8vk1U/XRW3uq9jw5XH
         8WGFkRUzSRH1GK0o1K2HKRTZjVpy7dqqZboGZE7f+6EIlYBauxxWWlK4KT259RNoUCtQ
         MTH7OM7BHJDeJTWhUixHGR228F+38wAN6pWz1u981wm/CMnuZLa299IoYBi89j6pOX0r
         cnEa+jQZ8wotpBBjUTDc/gVE9FZrBWMeT7jTsGk2Rb6ke7Y+fSq4VlrGX17eMbYRTvcs
         7A9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vZKw17Y6Eu5a8sxvLIrFLfxkEizM6QV3DVVZZEdS/rU=;
        b=ZvM52thc8JwVbNfnEBlkBkEZnGPIyWnt/oFWzXIEsf52r88zrXThx0gRRWhcKct2at
         IilBMuYwYPxzSYR3N9S8ElwB6ZThiZQ5Lf8Gsxw7UxIysAzVXlz8b1g+z7LsTyO3PTLL
         PkcDxrVXmEp8e2XCFb2txiVcTSxSpQQDD9IZAG6OnF+2V6xHa3XWumb7a8CiraehIeVX
         qc+d75ElgLzQOxB3i+suyzYu6dt5Hc9zu6TekpnEx1mK18b9t3hRCEMHJWtUw49xjihD
         z8703J2v1JdH/pNbiipmKR/7q0OVZfVpdBuTFM/cWjqvHcc8pNKui5TQHKUgVfbUVdrw
         sMBA==
X-Gm-Message-State: AOAM5320XTnD+wTVtIaznkOfw4gME8cKCNyCLSRUTLEQjDbqSO2O1x02
        oiOFbQn39XllJ7d1IADnof3479U/xxSMyvnd
X-Google-Smtp-Source: ABdhPJw5prlTKIg+b6kYNCxo5TticYdFBD5NzEUsHC2CbZNk36nyuhybvkttL6kuw7I2tbtcygq75A==
X-Received: by 2002:a17:906:f56:: with SMTP id h22mr21420087ejj.366.1620128912296;
        Tue, 04 May 2021 04:48:32 -0700 (PDT)
Received: from localhost.localdomain (dh207-98-12.xnet.hr. [88.207.98.12])
        by smtp.googlemail.com with ESMTPSA id t22sm14149944edw.29.2021.05.04.04.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 04:48:31 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH] soc: qcom: socinfo: Add remaining IPQ6018 family ID-s
Date:   Tue,  4 May 2021 13:48:26 +0200
Message-Id: <20210504114826.64376-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ID for IPQ6018 was previously added, but ID-s for rest of the
family are missing.
So, lets add those based on downstream driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/soc/qcom/socinfo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index f6cfb79338f0..28bbc7a9227e 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -255,6 +255,9 @@ static const struct soc_id soc_id[] = {
 	{ 351, "SDA450" },
 	{ 356, "SM8250" },
 	{ 402, "IPQ6018" },
+	{ 403, "IPQ6028" },
+	{ 421, "IPQ6000" },
+	{ 422, "IPQ6010" },
 	{ 425, "SC7180" },
 	{ 455, "QRB5165" },
 };
-- 
2.31.1

