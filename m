Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 946214B9558
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 02:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbiBQBUB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 20:20:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbiBQBUB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 20:20:01 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F4B2A0D41
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 17:19:48 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id q8so4337151oiw.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 17:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HRx8T4zgpY2IuuhghOcb/JTF1D7VMe7Nw9viYbE3X18=;
        b=v2UobaC4GMeY+ccR+REFy6YKl7AYAKAaCuO8ahX4AxZXnRH3rvcAM4gwUtIXRWonpa
         8GKUVv0gBBq5EFnnNr9Dcd4yPeSKQqpXdrY9WmRfYZB1LTiqL4pnY3w6jT9o1usOqVHz
         5SPJ4AW7Sfc6rTjTJxn3BBdSeEzAvW3/YxmNqdCoGhXv1fJKaOlfAO9eWT+I2NHTC2p9
         DQxYmE3cQc/n56Xfe4bWbXK65XPOuCxTBzoEKbT8dtQIqU52EB/JEA5PJjtIq7UQld6X
         CPfeZylGmD4tDh5FU/IriqB/cGNDpkN9UztOEyZKDS3tQWXsWpLz7hYYYtJjFrTMqs/n
         Egfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HRx8T4zgpY2IuuhghOcb/JTF1D7VMe7Nw9viYbE3X18=;
        b=r8CyO5B2QJhSzyu8wClgMpbZUtkMP292aP6cMW3FY507CplLGY9Vj+nbrgOvZdPgQK
         zhAMqph9jHiAp3wMMyrOjIMPrmEQKcMdT0B0ORTUmBvaDJSTkpb9aTlMQapiwEneXE5J
         X3xW7DZsQu+M0fzdMzsvyWEtj3SXltwulajLhVNZrc4yx47V5bH3ihMt0PWO7HBhFFdO
         vtqgwKMwv790T0FbNsEvrddwwMSO/xa3N4/n7cj3LWe3ztXZOijXkasISWt4uURgpIAQ
         ovJHQY1X3hJ2gkCXfNs2SwDLBeJDmmU5Q80KhRLJ/hwCbPJa64sQ9ChnLZ0QqwcQYtSg
         g7bQ==
X-Gm-Message-State: AOAM530/4QTs2hF8PVLgsgcR0sYukpeCgJ9mQ4mc10e7LLqfsULARjbP
        pNsQV1x8JxiSik/3tmZir/XYqA==
X-Google-Smtp-Source: ABdhPJzFKV8F1Qszo2LP+Rfa4K3QqRtxV7RkYbAa3hv/J2IVrKtru8oTym09tqhA0ntDsTa9UOHl0g==
X-Received: by 2002:a54:438f:0:b0:2d4:4348:d58b with SMTP id u15-20020a54438f000000b002d44348d58bmr187510oiv.102.1645060787279;
        Wed, 16 Feb 2022 17:19:47 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id h27sm15665329ote.57.2022.02.16.17.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 17:19:46 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] drm/msm/dpu: Add INTF_5 interrupts
Date:   Wed, 16 Feb 2022 17:21:54 -0800
Message-Id: <20220217012155.1717511-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SC8180x has the eDP controller wired up to INTF_5, so add the interrupt
register block for this interface to the list.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index a77a5eaa78ad..dd2161e7bdb6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -23,6 +23,7 @@
 #define MDP_INTF_2_OFF			0x6B000
 #define MDP_INTF_3_OFF			0x6B800
 #define MDP_INTF_4_OFF			0x6C000
+#define MDP_INTF_5_OFF			0x6C800
 #define MDP_AD4_0_OFF			0x7C000
 #define MDP_AD4_1_OFF			0x7D000
 #define MDP_AD4_INTR_EN_OFF		0x41c
@@ -93,6 +94,11 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 		MDP_INTF_4_OFF+INTF_INTR_EN,
 		MDP_INTF_4_OFF+INTF_INTR_STATUS
 	},
+	{
+		MDP_INTF_5_OFF+INTF_INTR_CLEAR,
+		MDP_INTF_5_OFF+INTF_INTR_EN,
+		MDP_INTF_5_OFF+INTF_INTR_STATUS
+	},
 	{
 		MDP_AD4_0_OFF + MDP_AD4_INTR_CLEAR_OFF,
 		MDP_AD4_0_OFF + MDP_AD4_INTR_EN_OFF,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 1ab75cccd145..37379966d8ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -22,6 +22,7 @@ enum dpu_hw_intr_reg {
 	MDP_INTF2_INTR,
 	MDP_INTF3_INTR,
 	MDP_INTF4_INTR,
+	MDP_INTF5_INTR,
 	MDP_AD4_0_INTR,
 	MDP_AD4_1_INTR,
 	MDP_INTF0_7xxx_INTR,
-- 
2.33.1

