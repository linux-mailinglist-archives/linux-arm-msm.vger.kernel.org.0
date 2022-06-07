Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7786D54219F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 08:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237343AbiFHCDu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 22:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442570AbiFHCAn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 22:00:43 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEFC622C4BD
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 14:32:25 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id s13so20646251ljd.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 14:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eUFnr/e9HU+EYrYRX5aQDFNxgvmzpynRJnt25tx+IV4=;
        b=uHvRe3HXubQYucI9ZdHllk18XkLYa+OT6nD6WBhVAwyKV/E2tXximnifXlIYg67Nvy
         NTN5zOFOF1cjlpSHuuAiifJbBLN62gHlxe3l6wZiNudVEGpW0Luvyf5Ww8/JI4irhuxr
         fEhK+QcnGAkCC3qMkOsb1HmsB/p49NePXYwIP+GN8Svssb4ZXwe3j0AxtqxAuYWIQo2P
         hfB4o0lSLG7tH+QADksJmbXsCc1H3PIQhs/UUVhj/BLwtUJ4bGJf1Ud0RvLpe4StP8HR
         Lw8qBBgxfFRy50x9lydkOukUaHM0ZPLH5g1mz2bIMOuBzIpqeFcXQaVHiGPhchETk3nt
         w9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eUFnr/e9HU+EYrYRX5aQDFNxgvmzpynRJnt25tx+IV4=;
        b=fLX++TqXhWGK6oq+iaWCoBjU/WqyyU/GTiza4JXib1LH7jOL+hDksof1Kgf5dqdXOl
         qRjyqQqyDLt93dcrWYOUGnFNMdfYmTAo4ET1mDbH9cNwPO6BbdhEAQyG7KXP67/sXdBc
         RjHt5HUmVC3HIQr5e0vaQw+f1FXDXueRKIdMsXjrw070Jy4ZiZ7z4156hlXQhGyz9x/P
         nGmM1lUwWQugeVio90YFgODHHY4RL7F8FLcQ0kSIqvcc7OOQeUKAUyu72+Mcgwon0EwT
         LvU4jFfzo1Utu06AGXeIsWK8LSQwsTSqOR7dV8PLKFpEC2sRyevC46WiWt43nioT7sOs
         en5g==
X-Gm-Message-State: AOAM531v3JlsuNIN+a2I7UIsZC89qBhIhdEOxo1jeFpEdnkFAnphSlM/
        Yd8HQL+mZfmHLMKW+5AmnVyL4A==
X-Google-Smtp-Source: ABdhPJyFhIuZ9RTN2H1gLHw/S4avoOtjBs0EZ28MEQSbJV+MbF4aV8APA6APEjSKVmTwyUVRDxxkrA==
X-Received: by 2002:a2e:9345:0:b0:24b:451:7ce1 with SMTP id m5-20020a2e9345000000b0024b04517ce1mr55151425ljh.258.1654637543932;
        Tue, 07 Jun 2022 14:32:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g23-20020ac24d97000000b0047255d21153sm3411343lfe.130.2022.06.07.14.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:32:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 12/30] phy: qcom-qmp: switch to new split QMP PHY driver
Date:   Wed,  8 Jun 2022 00:31:45 +0300
Message-Id: <20220607213203.2819885-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607213203.2819885-1-dmitry.baryshkov@linaro.org>
References: <20220607213203.2819885-1-dmitry.baryshkov@linaro.org>
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

Use new split QMP PHY driver and remove all monolith phy-qcom-qmp
driver.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org> # UFS, PCIe and USB on SC8180X
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index e9e3b1a4dbb0..65f6c30a3e93 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -5,7 +5,13 @@ obj-$(CONFIG_PHY_QCOM_EDP)		+= phy-qcom-edp.o
 obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
-obj-$(CONFIG_PHY_QCOM_QMP)		+= phy-qcom-qmp.o
+obj-$(CONFIG_PHY_QCOM_QMP)		+= \
+	phy-qcom-qmp-combo.o \
+	phy-qcom-qmp-pcie.o \
+	phy-qcom-qmp-pcie-msm8996.o \
+	phy-qcom-qmp-ufs.o \
+	phy-qcom-qmp-usb.o
+
 obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
 obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
 obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
-- 
2.35.1

