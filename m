Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5228663516C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 08:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236326AbiKWHvb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 02:51:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236322AbiKWHuM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 02:50:12 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2EFFA731
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 23:49:58 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id 136so16151443pga.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 23:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxBfeAGPJSh5Y/5FKQg+M0y4cyLZHfyLwZKtosIJVD4=;
        b=hvohjQO8JYIIopMXFu3hU+uN5hELxDhjhQ7dxyj3c+Q/LQ4Fb4Flb51c62NHkSRJNR
         FO6JfqvdsTm/Ayc9GUj0DD4tkpVcvaF7XH3MFy3Zl7uWWme3K2G7lAhwT/gFjWgejGgV
         R/DXDHDhUtzAnReZu8ggSAJzA7yDv0X8sSp8abzoUZAdtJli6tU5aYK/P5L9ZE3T3qw8
         LcDcjGEBu4HiVgt+A9RioAgoVRtUULYluxAZxExY8ChKkpS7CccBR7iePfNBjbw/QXpi
         HfBMHw5SPmv4Hw5i8Di256ieI2eTIxYr2QHYim+S5I1Fmx1kHqBKMv5o2AM9QfAsMeQQ
         eW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxBfeAGPJSh5Y/5FKQg+M0y4cyLZHfyLwZKtosIJVD4=;
        b=HnSa+knnw26K6apfSLDJNkZci+Uj75YPEW2qxsZ2Ryc9NM+Gsb2wZEYaakTCPXx+l7
         t0h4elKZ9yaQKdgsEckt6gPTE8bzNNqddhzdwFtTHE1822w0eUmY2777PQgRfvW8PhXf
         ETiR4LKGcoL/IF70qWBIEUvgUobMJ9mjrsDHSKDOks4/qR7WvPCWSPCk8DkAptKR2S7S
         KNT5G/d07tXliTqIZVUSqqzm2uMvC08gAMJl94IKn4Rqdv5lw0xJIyS2lGi+NsTEcmgQ
         rT0q4QXyHF2qrUGaC7F0CG8mb6d6UMeq8b/icy9FBSoYuaYHZk4Am3FC/QuOnniGZAs2
         otWA==
X-Gm-Message-State: ANoB5pkc25fgq9XbnBuCx+0sTFklDDfPwc23sMJ3tq273m2iSfyr7K5x
        2ODL/vK29u54a3Pz7CgbC759
X-Google-Smtp-Source: AA0mqf6cWZTcqMQ6iaMD6TbVO8Lgo74SN6zYkHGzRMd58POs8i2QkQeWC7UZd6p4A6tyAaWB6HRKvg==
X-Received: by 2002:a63:4c4d:0:b0:46f:8c3a:8b2b with SMTP id m13-20020a634c4d000000b0046f8c3a8b2bmr7051732pgl.477.1669189798376;
        Tue, 22 Nov 2022 23:49:58 -0800 (PST)
Received: from localhost.localdomain ([117.202.191.0])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm13334059plq.34.2022.11.22.23.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 23:49:57 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org
Cc:     quic_cang@quicinc.com, quic_asutoshd@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        dmitry.baryshkov@linaro.org, ahalaney@redhat.com,
        abel.vesa@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 14/20] scsi: ufs: ufs-qcom: Fix the Qcom register name for offset 0xD0
Date:   Wed, 23 Nov 2022 13:18:20 +0530
Message-Id: <20221123074826.95369-15-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123074826.95369-1-manivannan.sadhasivam@linaro.org>
References: <20221123074826.95369-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On newer UFS revisions, the register at offset 0xD0 is called,
REG_UFS_PARAM0. Since the existing register, RETRY_TIMER_REG is not used
anywhere, it is safe to use the new name.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 9d96ac71b27f..7fe928b82753 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -33,7 +33,8 @@ enum {
 	REG_UFS_TX_SYMBOL_CLK_NS_US         = 0xC4,
 	REG_UFS_LOCAL_PORT_ID_REG           = 0xC8,
 	REG_UFS_PA_ERR_CODE                 = 0xCC,
-	REG_UFS_RETRY_TIMER_REG             = 0xD0,
+	/* On older UFS revisions, this register is called "RETRY_TIMER_REG" */
+	REG_UFS_PARAM0                      = 0xD0,
 	REG_UFS_PA_LINK_STARTUP_TIMER       = 0xD8,
 	REG_UFS_CFG1                        = 0xDC,
 	REG_UFS_CFG2                        = 0xE0,
-- 
2.25.1

