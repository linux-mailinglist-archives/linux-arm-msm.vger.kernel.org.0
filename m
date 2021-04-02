Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00A3352C18
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 18:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234821AbhDBPCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 11:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235228AbhDBPCJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 11:02:09 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8142CC061794
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 08:02:07 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id t5so678217plg.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 08:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ww076wtEw/l52B1eQC1HZmnMQQ8Ebtr9JfK+3ViX3so=;
        b=ybrJ/XWa/mCxIE3noK0GCj+uKoLYgbMhcMQgqAAFk3B5fG/hCSYv/F1qtTUUcWn2Mu
         KxjVFEXJv/ORf4CfApwFggSqAln5Z3+I3OeriRpumvglfjwXC6h7dhcMnPmo07QJ/+ZG
         wwHjxZZb0wehKDxWPQ3AgMwikrdDxH05aNo11bZYQFDvjaEI1ie62PbcR0VTcNg5pz5n
         cAwjmX45Pn+yiGFbwQ3PqPvCRzA/Won4h4uiO+pCtAc2G9jgY63mG50TtcT9rQuodYpf
         XLU5cPfAZmlgju7jpwNLZsdsq3RtrSCd+icLLJESKQcSj5RD+fFev/lCAQ92Dm7dekXh
         GtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ww076wtEw/l52B1eQC1HZmnMQQ8Ebtr9JfK+3ViX3so=;
        b=L8fCewzGPLgdc5x7yV1692x+0X2LQmxYJKCAvNiiVbgQ+uTyvEw1vB0CesRQ9Cax3y
         tAEmpa3rxSr5mjFE/u1Z5cJIvtHZtY3eIzJdWnJJhlVKrDhJ2BJ/nmeWWZmen4FdrG9z
         kB6A2YnaAZ1r3C2QBE6/Cx5tav5uUJFWDqnVrKvTUMy30C84PIpdbRE7H5AeUb6bz3in
         i5iV3NyJvtMF4/plu0q7ioV8PAY3Mi8rUBw8vR23ND3klAuJ04QTMLo5tnvKtEBQBTiw
         O+ZxdpQ8aMZ4PxXazPeWbeFT7wc9KTtvJaft+cqZv64pkJSHiFCLgsTIY53JQVh0Jdyx
         NPQw==
X-Gm-Message-State: AOAM532gF8g1lKRMq0GEfmfng2vA5a0fVBP6WLHYd7M3VMliy0aSeYaT
        3isJ+tu+8lxMz1r5htYUZkN7
X-Google-Smtp-Source: ABdhPJxz13FLUMPQqOofA5mU/CiwuDuOWUytmngYWZcm28AENSnwG/TOkh7u7d7f6fDaW5lwBooosw==
X-Received: by 2002:a17:90a:c249:: with SMTP id d9mr14444710pjx.104.1617375725992;
        Fri, 02 Apr 2021 08:02:05 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.174])
        by smtp.gmail.com with ESMTPSA id x7sm8773647pff.12.2021.04.02.08.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 08:02:05 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v11 4/4] mtd: rawnand: qcom: Add missing nand_cleanup() in error path
Date:   Fri,  2 Apr 2021 20:31:28 +0530
Message-Id: <20210402150128.29128-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402150128.29128-1-manivannan.sadhasivam@linaro.org>
References: <20210402150128.29128-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing nand_cleanup() in the alloc_bam_transaction() error path
to cleanup the resources properly.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 87c23bb320bf..fe74cf3aece5 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2882,6 +2882,7 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 		if (!nandc->bam_txn) {
 			dev_err(nandc->dev,
 				"failed to allocate bam transaction\n");
+			nand_cleanup(chip);
 			return -ENOMEM;
 		}
 	}
-- 
2.25.1

