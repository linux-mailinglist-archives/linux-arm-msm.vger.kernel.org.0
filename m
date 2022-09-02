Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEC385AB238
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 15:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238455AbiIBNx0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 09:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238047AbiIBNxE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 09:53:04 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A68761BE93
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 06:27:19 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z6so3283696lfu.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 06:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Fd4lSn+qZVzeO4qkwAmVHFeGiK8e6ML8+dOEILHHB/4=;
        b=Y5fmg2CCmqTFkCJWckDRDOx1uahyv+g1TtzQ24yVBQvoNDz8BBceaGKn5TrsCXlPdm
         0R16R3/D9RGVwmB6R5ug35KmOUiGMEFGvrJj5dMUioFSSuhhFZZOLv1BqqF/Z6uj6up4
         JCnYyy5E3wbxtkwIxYTtDVz6EWnPYmXNWqf8kY1YBn4Q7qx9La8n00BnyLznQy6r4hRj
         3UDtKOSNAODdD0uowmneP3z7FZkz6fUfyYYRw9QRsFJMDaDifMI6/4AqXf+xb8DFKoEe
         iHqfbok1nAtAPsFz3Zuqi/Mm2DSEDzSxmvAYkOPslwgXR4p3s+m3EKgFZzOfwSxG5T/t
         UWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Fd4lSn+qZVzeO4qkwAmVHFeGiK8e6ML8+dOEILHHB/4=;
        b=uA5+WmfQeIv/xaVn6OlnQ5sFjoZYBMnhJpFn7pdmxSrWCwI2Kss8t66ejdC8tsuZct
         kjP0l4ylcbOGQo1Cm5ko7stxZHpUn+FGvGrENUqqM3U6Ou2kD3dH1qDRU7Jbe92Vp/9x
         ud/HQWO9Flnqp1tA/foRqEFjhl4+W+i6OOW6rtPdOd7ZJQ9bSGyX9dIwUv4FAgbAWS7Y
         TVijkFvrtDKWSIsvJHjb+dAH3pb9EoMIEvkAyiAg2aLPx65pRK0Ye0c8wJaFzP78gZy+
         jVHUhMS7toZicJ5KBKnP/553dAA34T2wUY36VZuapdiB0c1McCEkBHs7B1AeN00tQkPZ
         0EmA==
X-Gm-Message-State: ACgBeo2jT10VFiQcHtUGD4UIB5lDiwTvZ+Iv374cYHfLATCLhnNB7ZG+
        F7H+aSWH8gqzLkmMM7QIu8NDCOmdL2ba0sye
X-Google-Smtp-Source: AA6agR5hvVENxFSh2gnwP8eA5w9X+QtN5NSpi56rnmJnWFXn5xD87WZ1MnKXYCOvXJ2XQH43RdlQFA==
X-Received: by 2002:adf:fbc7:0:b0:220:6004:18ca with SMTP id d7-20020adffbc7000000b00220600418camr16867924wrs.632.1662124467681;
        Fri, 02 Sep 2022 06:14:27 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v14-20020a5d43ce000000b002253fd19a6asm1766253wrr.18.2022.09.02.06.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 06:14:27 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorande@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH 05/14] misc: fastrpc: Add reserved mem support
Date:   Fri,  2 Sep 2022 16:13:35 +0300
Message-Id: <20220902131344.3029826-6-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902131344.3029826-1-abel.vesa@linaro.org>
References: <20220902131344.3029826-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The reserved mem support is needed for CMA heap support, which will be
used by AUDIOPD.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/misc/fastrpc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 8d803ee33904..52271f51800d 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -19,6 +19,7 @@
 #include <linux/slab.h>
 #include <linux/qcom_scm.h>
 #include <uapi/misc/fastrpc.h>
+#include <linux/of_reserved_mem.h>
 
 #define ADSP_DOMAIN_ID (0)
 #define MDSP_DOMAIN_ID (1)
@@ -2064,6 +2065,9 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return -EINVAL;
 	}
 
+	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
+		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
+
 	vmcount = of_property_read_variable_u32_array(rdev->of_node,
 				"qcom,vmids", &vmids[0], 0, FASTRPC_MAX_VMIDS);
 	if (vmcount < 0)
-- 
2.34.1

