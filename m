Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8206D6C6B70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 15:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbjCWOrb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 10:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjCWOra (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 10:47:30 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50472265BD
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 07:47:29 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id g17so28101233lfv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 07:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679582847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dkVzE0c1IRA8Gk0//5W10K4Vfb8zGz9NSISS6mug9tQ=;
        b=JxXoi2ksQza7GwzgtyPBSN6/cyfLoUIk/3czMiTIcV/TVr73dVJFmfAA1oSuyHh3q5
         x+0XQ+X0cuCKH46NKThXjHIU3/n1Hrn5rVGwMRnVDZdKhQDXPUt6tNIssh00gPQaXa+L
         8E637Kpz/JgUwSr1XYsKE9rCbHja4aRWPp/G+clqntpIo14P5VuM4ER6/U7BpxDcBw8x
         oF1aBtxKhiQ7G7KV1Neh30UoxPuUvMq6vU7Ev3Kwn06qXFJLQR16hVb2hzIzxYmxH5RH
         nHN+YNjGeJD+GQNGuZ/6j5+Xh9A8W9o68fGx2n4/FouTAiXX2aq0W7fpdkw+iUr4flCd
         Z/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679582847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkVzE0c1IRA8Gk0//5W10K4Vfb8zGz9NSISS6mug9tQ=;
        b=6lKYtqxNkv/IwibSlrK9ERTKz7keE/SK02CFCOBRBTq/m3giIxsMTGCw7PW1JFRCHb
         anoc3oF7auyYr0iHfzdQDcyefr06cuABHNHrvtEWsrj2tmajBgdC5vMy0T0BEpZbxXrQ
         molvzJP0peMG6kKGjwrFEnJocfm6A4Hi2WrKm4cRLzy/NTIzsYGg5qW6VnH+P7WOmFiE
         tXqOoL0QGXaxRLk7oBRxuZBETKJy74xhq/OmQpxdKlL+ljIXKTFFEoJqwajfIhKF/W0j
         EiEnMAGVWVhM0OOmO7YpWIO5CY4jmRZheQ2reapL+8gPjH0rvda5zj2RHWbvfK3yY2ON
         aqzQ==
X-Gm-Message-State: AO0yUKV65IhEck8sP2R5hRDbak2nQkNhSYVzi9vK9M/5+0XC4ER3k99Q
        YsS7KLmmMDsNK7C9FORRgEXDzz7eM0CqMCK3ve8=
X-Google-Smtp-Source: AK7set+Qn4rMzzUH7pQNtNX4kjI/1cPBc5aaBV58CJkUWNDEvtiDTDvCRLX54C3PTtTXvIgx4gB0mw==
X-Received: by 2002:a19:5210:0:b0:4ea:d6c7:c897 with SMTP id m16-20020a195210000000b004ead6c7c897mr3134613lfb.31.1679582847509;
        Thu, 23 Mar 2023 07:47:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z15-20020ac24f8f000000b004e83fc5f627sm2922033lfs.188.2023.03.23.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:47:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 1/2] phy: qcom-qmp-combo: fix v3 offsets table
Date:   Thu, 23 Mar 2023 17:47:25 +0300
Message-Id: <20230323144726.1614344-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8350 and SM8450 use qmp_combo_offsets_v3 table, which doesn't have
PCS_USB offset. Add the usb3_pcs_usb entry to program correct registers
while setting up sm8350 and sm8450 USB+DP combo PHYs.

Fixes: 05bd18348b88 ("phy: qcom-qmp-combo: Add config for SM6350")
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index c1483e157af4..3b488d12c933 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1396,6 +1396,7 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v3 = {
 	.usb3_serdes	= 0x1000,
 	.usb3_pcs_misc	= 0x1a00,
 	.usb3_pcs	= 0x1c00,
+	.usb3_pcs_usb	= 0x1f00,
 	.dp_serdes	= 0x2000,
 	.dp_txa		= 0x2200,
 	.dp_txb		= 0x2600,
-- 
2.30.2

