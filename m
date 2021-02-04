Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5361D30F89C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 17:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238201AbhBDQyR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 11:54:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:52280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238193AbhBDQxY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 11:53:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DCF660202;
        Thu,  4 Feb 2021 16:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612457564;
        bh=FzKfo2TmGyyfV4NYpyLI3+sqHILLXsk6ekUI9XU5YlE=;
        h=From:To:Cc:Subject:Date:From;
        b=QGz0OWQyajXk2MRCWIbcObehiEXJqfkWv9nq+ZW4lXSGeXB+oWUt2pbdN8b3q6M2m
         uaCrD+7sngzW+LCQhA3LiNPDcsrwU27GLBurC+oBwPEsDVgNafWOHPa56jzb1uhXnI
         0EtncDJnYiyFsw9FNrCC5TubHIyYQEQjddCH7vyOKD7MyAxmWB0sPaOkcpqjcxhIen
         obi/1MNcHTiRjwGh+3jr5fCCyiEmHYY71h0hgmk5mxwwRa7bfHqYxOpucbJxg1SR1Z
         VPXtqpUoRpkPmLcbz4ySHgixC8hHOzPBLvJ6ds1xZA4cDdCuZHFl0dWT8VmnTn/nPT
         eBymoGWbbz/nQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     "Martin K . Petersen" <martin.petersen@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] scsi: dt-bindings: ufs: Add sm8250, sm8350 compatible strings
Date:   Thu,  4 Feb 2021 22:22:34 +0530
Message-Id: <20210204165234.61939-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document "qcom,sm8250-ufshc" and "qcom,sm8350-ufshc" compatible string.
Use of "qcom,sm8250-ufshc" is already present upstream, so add misiing
documentation. "qcom,sm8350-ufshc" is for UFS HC found in SM8350 SoC.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 - add Bjorn's ack
 - split from phy series

 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
index 415ccdd7442d..d8fd4df81743 100644
--- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
+++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
@@ -14,6 +14,8 @@ Required properties:
 			    "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
 			    "qcom,sdm845-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
 			    "qcom,sm8150-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
+			    "qcom,sm8250-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
+			    "qcom,sm8350-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
 - interrupts        : <interrupt mapping for UFS host controller IRQ>
 - reg               : <registers mapping>
 
-- 
2.26.2

