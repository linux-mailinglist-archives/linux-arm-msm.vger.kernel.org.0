Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3182784B15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 22:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbjHVUGs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 16:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbjHVUGq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 16:06:46 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7392E65
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 13:06:40 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fefe898f76so4658565e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 13:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692734799; x=1693339599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOQ9tyjj8WPoyJd2gELXd60f8pMhiSuAdrU1RFxkiK0=;
        b=NRhWoYGl0vaT1VIpGGLxKM0Az3O6eyGSWin2QHJltHbcXtFLWNL/eIARNs4iquTENl
         OD1JEEfPCVQfZBSuUlj7Lv3Bq7eFpcus/babkN0CPfVFowgzekJj/FYoSFG3GoXsDG2q
         fF5wVyfCyWwb1Ktv7B7L+jotqvj+dIWc/WUgpOyqIRoRdl8IV0ASYVVHab4fQXqjbN7b
         S8lcBih0bImNUg2iab4eduB3tX95ASYRjamRXzYJHj7mpTNDTzYaPcQ8lut1NySM+88D
         KXxEgfeJIQEFpn24iStw0DX3S8nLZ5SAtkYmcwl3VT6YuxScgl6U1FxUcwWGxno3VMxK
         w4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692734799; x=1693339599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOQ9tyjj8WPoyJd2gELXd60f8pMhiSuAdrU1RFxkiK0=;
        b=J8YH6BVtwkO4sSPIx3MuRnSJqh77SBQ+Tfn0872dJdraDn4LuuBm9PH/nkQEYd/fHG
         l6SaoqAyuKRj5SyBy8tsR4ihs/ZWUL+FSf6U9FcfHvEoN3wkrvfTDqg2vW0l3qQOwZQk
         Hxa7Ibzl+I4Kgdc45Y3c2GUOv9aM7X+yqSoj0izxTlWFMo2KRGiSX4orVrJa37cc8wIi
         LxgJphIHayFOtIUgymgrBu05jamsCeGcZwxN7gkLa8ABC8xwdJKYplUqrWpmzEnawS0k
         HhUzYE9sGdTSyEho0FbeAi0vLJ/vQ+m+zlfzRkpAOfia8hi28KXVCMmY52GMIeM4oImY
         +HzQ==
X-Gm-Message-State: AOJu0YwtEnFlPxurIsEF1MKC+oOOGJVNkX2lalEKkCn41enYbrLqMa2O
        cHHNwqnDBsGpwn6k/+gjSeAavg==
X-Google-Smtp-Source: AGHT+IGLEjPVvjc3K5kuGPMXw6er1xUF0tDZxVmWr4odTXx7JDkfQBeB7q+0zyHxz79mdzhHnTEq7w==
X-Received: by 2002:adf:fcca:0:b0:319:85e2:6972 with SMTP id f10-20020adffcca000000b0031985e26972mr7500261wrs.42.1692734799351;
        Tue, 22 Aug 2023 13:06:39 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y12-20020adfee0c000000b0031aeca90e1fsm12873690wrn.70.2023.08.22.13.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 13:06:38 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v2 8/9] media: qcom: camss: Fix set CSI2_RX_CFG1_VC_MODE when VC is greater than 3
Date:   Tue, 22 Aug 2023 21:06:25 +0100
Message-ID: <20230822200626.1931129-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822200626.1931129-1-bryan.odonoghue@linaro.org>
References: <20230822200626.1931129-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VC_MODE = 0 implies a two bit VC address.
VC_MODE = 1 is required for VCs with a larger address than two bits.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 45c7986d4a8d0..140c584bfb8b1 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -449,6 +449,8 @@ static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 vc)
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
+	if (vc > 3)
+		val |= 1 << CSI2_RX_CFG1_VC_MODE;
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 
-- 
2.41.0

