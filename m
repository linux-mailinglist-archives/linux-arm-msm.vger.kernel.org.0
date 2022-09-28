Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 479ED5EE9F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 01:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233805AbiI1XKh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 19:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232511AbiI1XK1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 19:10:27 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC6C447BA9
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:25 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a8so22520849lff.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=VAKC0xhD9A/vbD1jCZpQDa2lUX76J4j0ycJCoRe8Fdo=;
        b=Ik72d0BFtpAjooyK1kS9/n+yLxjD/AaHJzIAVWUu5L6oNj4NmSTeVxOlUQ7MLZmNhn
         Kv55WADv19CSbdzt7v8jvwq72F2OR8lfP40He2kKwiuCp8Hu3cedmqz/LDESBQ5qcZz1
         pz7ULYhDcqDrBj5e47tb8IQmj5x1RCPGlLjZBmli0YH0dyN1kgKvNS/7FjVvhukASPh4
         Enlc6OUw7BW+f7kQ8HeqeR3JgRLWiAqN8QQlhtQfHVUf+D8z1afAc3ZljMvhTm58ONTw
         FsWWvK4moQcRNy7CefeSr7I6+dAMlysJJkYrkbPDCxiiqhnkd17WJkXiOhofzMOw++0n
         mMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VAKC0xhD9A/vbD1jCZpQDa2lUX76J4j0ycJCoRe8Fdo=;
        b=boZ1UVXagq8F3VTslK5+FV1qAKYbMbYyiQIJFVYKukzkNzVaBZpbLXPe29QucI9PuC
         T2YJ2ZnYknFDxfUBcU/cb29QvdSe9UJtiIue09TAMvK3JsADtOM/+Lp7CAn8MiWMuV1c
         0vN+o8x8TZZT/DGAioQuaoizGgxobmhXAUivC/M/A30x0sZHdGT0xFJkL9BcJFCjJ/y+
         Dfwy97YtHPZskz61SofcHJJmG/umqltHDqMk9IBkZuepwahtaHbUavSL2WH+7LJbYLtp
         5hYfBYdF3yBANzkq+ISaG5FKNiSAby9ELk+yPXdzRRlGketNe3289KM476S9Uvts4RzM
         +vgA==
X-Gm-Message-State: ACrzQf2iKFT8RQqryM4UeS84LJvE+Jv/1TrbkNe9yG6y3lG2qWRbNZ+O
        35iqU1T/i8hOm4VyF4x31KrJOg==
X-Google-Smtp-Source: AMsMyM4sKWjTHuMt0ScOHq9OPO5gNi7CzTFn1lD+zq9sw8hERqK2ZhFDu49ENH1U8pChutdlgeOPYg==
X-Received: by 2002:a05:6512:308f:b0:49a:5a59:aa25 with SMTP id z15-20020a056512308f00b0049a5a59aa25mr118781lfd.44.1664406625151;
        Wed, 28 Sep 2022 16:10:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24950000000b0049d5733fb3fsm597587lfi.212.2022.09.28.16.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 16:10:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 12/18] phy: qcom-qmp-usb: remove QPHY_PCS_LFPS_RXTERM_IRQ_STATUS reg
Date:   Thu, 29 Sep 2022 02:10:08 +0300
Message-Id: <20220928231014.455201-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928231014.455201-1-dmitry.baryshkov@linaro.org>
References: <20220928231014.455201-1-dmitry.baryshkov@linaro.org>
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

The QPHY_PCS_LFPS_RXTERM_IRQ_STATUS register is not used, remove it from
register layout.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h | 1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c    | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
index 431e9148b8d0..c7e8e2a28e6e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
@@ -28,6 +28,7 @@
 #define QPHY_V2_PCS_FLL_CNT_VAL_L			0x0c8
 #define QPHY_V2_PCS_FLL_CNT_VAL_H_TOL			0x0cc
 #define QPHY_V2_PCS_FLL_MAN_CODE			0x0d0
+#define QPHY_V2_PCS_LFPS_RXTERM_IRQ_STATUS		0x178
 #define QPHY_V2_PCS_PLL_LOCK_CHK_DLY_TIME_AUXCLK_LSB	0x1a8
 #define QPHY_V2_PCS_OSC_DTCT_ACTIONS			0x1ac
 #define QPHY_V2_PCS_RX_SIGDET_LVL			0x1d8
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 866955a36315..43b7ad2c9479 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -56,9 +56,6 @@
 /* QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR register bits */
 #define IRQ_CLEAR				BIT(0)
 
-/* QPHY_PCS_LFPS_RXTERM_IRQ_STATUS register bits */
-#define RCVR_DETECT				BIT(0)
-
 /* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
 #define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
 
@@ -111,7 +108,6 @@ enum qphy_reg_layout {
 	QPHY_PCS_STATUS,
 	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
-	QPHY_PCS_LFPS_RXTERM_IRQ_STATUS,
 	QPHY_PCS_POWER_DOWN_CONTROL,
 	/* PCS_MISC registers */
 	QPHY_PCS_MISC_TYPEC_CTRL,
@@ -125,7 +121,6 @@ static const unsigned int usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_STATUS]		= 0x17c,
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x0d4,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x0d8,
-	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x178,
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
 };
 
@@ -135,7 +130,6 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_STATUS]		= 0x174,
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x0d8,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x0dc,
-	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x170,
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
 };
 
-- 
2.35.1

