Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97E8D572E08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 08:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbiGMGQr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jul 2022 02:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGMGQr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jul 2022 02:16:47 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB699C08FA
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 23:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657693004; x=1689229004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GpgJm2w11HDT9HLV7pwaUKNml2YdL/gwGxII+D3gRSU=;
  b=OUfPJ8iSUSc9HEQlKoKTi9hP8dOyfaBAO4Ku+sRy8nKm+400M4vFt9hh
   VVAF7qBen1YWOCdUIgxNeAOMoQeq86odi4Y9f6zSiRXhhUaI0Eav0vV9Y
   /gjNiRXZn2PEiXLee6vRmWodAql2uGZfQApZUPSfT4ZcR5x36Rzie/Mge
   U=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Jul 2022 23:16:44 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2022 23:16:44 -0700
Received: from hu-ddhamara-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 12 Jul 2022 23:16:41 -0700
From:   <quic_ddhamara@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <robclark@gmail.com>, <quic_akhilpo@quicinc.com>,
        ddhamara <ddhamara@quicinc.com>
Subject: [PATCH 1/1] drm/msm/a6xx: Fix null pointer access in a6xx_get_indexed_registers
Date:   Wed, 13 Jul 2022 11:45:28 +0530
Message-ID: <20220713061528.32256-2-quic_ddhamara@quicinc.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220713061528.32256-1-quic_ddhamara@quicinc.com>
References: <20220713061528.32256-1-quic_ddhamara@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Akhil P Oommen <quic_akhilpo@quicinc.com>

Fix a null pointer access when memory allocation fails in
a6xx_get_indexed_registers().

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: ddhamara <ddhamara@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 55f443328d8e..507074f6222c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -952,6 +952,12 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
 	a6xx_get_indexed_regs(gpu, a6xx_state, &a6xx_cp_mempool_indexed,
 		&a6xx_state->indexed_regs[i]);
 
+	if (!a6xx_state->indexed_regs[i].data) {
+		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, mempool_size);
+		a6xx_state->nr_indexed_regs = count - 1;
+		return;
+	}
+
 	/*
 	 * Offset 0x2000 in the mempool is the size - copy the saved size over
 	 * so the data is consistent
-- 
2.37.0

