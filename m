Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 457417D6A87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 13:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234926AbjJYL41 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 07:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232666AbjJYL40 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 07:56:26 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BDCD12A
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 04:56:24 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-507c8316abcso7451522e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698234982; x=1698839782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgafwTCUkzd/7BTG9BN3pSpU4yRcAwFDImAKova/XoA=;
        b=jcjJUlh5ZzvkM1V6/GDDWV2U3VGj/czgiX4G7LIW0YezENPjGEKC4oZD1e2jaYS6pc
         pTIrW4KvBunkGPEcYXlW1Na06H2YZX0JloBhfPtyk/mxyGyMFM14Tf3WSiewyhox736p
         3C6Feqwkqj8KeCelfy9ce3kgx8Gf5CDEYkUq04ldcndJMPHtjnirc29drtlVosAN1b6B
         PvELXPmBFJeAdibQPo3itf2Q26Mc5/qyV/GdNqF2/4l+idHD7Jvpj5B6ZbmpYzblP2pO
         Uszi1hhlYC5R3DHUzMMBWq24IwkjCkYVVyOew2wIO/H10PxGE02L8tC7CBw301HVskuF
         3zAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698234982; x=1698839782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgafwTCUkzd/7BTG9BN3pSpU4yRcAwFDImAKova/XoA=;
        b=hrzuTBXPTDvHMFkS+MuIxYYgFLmzodfdpBuisr4McV0NFQ78qmcnTfhzQfXFetMAlb
         +eSym7afnTIzB5nxqjd4/D6KJ2SVX+RpnFFADQUPrHjnMHOI8OUJjMYiTxy6739mOL+p
         Nv5UhbAH/ZB1il7+iyGOyfwiJ+Lh2bAj980PVBqptseefbkkL93n9SUXtNGWfZWhTkMj
         IAoUifoKMlt6PfUyYc5mf99RKlRds3YgmcoV/GfMiPCTRb1UXrHAqbT6/SYfzEEB86Kp
         oyuKoHzGLI5SzHKwCR7ffUero6CTAsh5VS7RQWvZ56Jc5GB7jU3v6oET8VSly4HmGRVZ
         pt7g==
X-Gm-Message-State: AOJu0Yx81KgQyM3AjDrY7noMWUb0WjdAmoC6f5ai1ua82VSxMSq5x1++
        ljH0NDej4FKISlNRGjuyg8Z7Gg==
X-Google-Smtp-Source: AGHT+IHEIBCnx7OnsCe5XYKl5N63Ra0I89CUF8iLcsMYFynDWvY4bHIMX8F4T9v8aDlCUP1hxBLdww==
X-Received: by 2002:a05:6512:3c8f:b0:507:cd39:a005 with SMTP id h15-20020a0565123c8f00b00507cd39a005mr13071713lfv.39.1698234982595;
        Wed, 25 Oct 2023 04:56:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 22-20020ac25f56000000b004fde41a2059sm2511751lfz.305.2023.10.25.04.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:56:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/2] usb: typec: ucsi: fix UCSI on buggy Qualcomm devices
Date:   Wed, 25 Oct 2023 14:49:29 +0300
Message-ID: <20231025115620.905538-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
References: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On sevral Qualcomm platforms (SC8180X, SM8350, SC8280XP) a call to
UCSI_GET_PDOS for non-PD partners will cause a firmware crash with no
easy way to recover from it. Since we have no easy way to determine
whether the partner really has PD support, shortcut UCSI_GET_PDOS on
such platforms. This allows us to enable UCSI support on such devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c       |  3 +++
 drivers/usb/typec/ucsi/ucsi.h       |  3 +++
 drivers/usb/typec/ucsi/ucsi_glink.c | 13 +++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 61b64558f96c..5392ec698959 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -578,6 +578,9 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
 	u64 command;
 	int ret;
 
+	if (ucsi->quirks & UCSI_NO_PARTNER_PDOS)
+		return 0;
+
 	command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);
 	command |= UCSI_GET_PDOS_PARTNER_PDO(is_partner);
 	command |= UCSI_GET_PDOS_PDO_OFFSET(offset);
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 474315a72c77..6478016d5cb8 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -317,6 +317,9 @@ struct ucsi {
 #define EVENT_PENDING	0
 #define COMMAND_PENDING	1
 #define ACK_PENDING	2
+
+	unsigned long quirks;
+#define UCSI_NO_PARTNER_PDOS	BIT(0)	/* Don't read partner's PDOs */
 };
 
 #define UCSI_MAX_SVID		5
diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index db6e248f8208..a94e2df6fd45 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -6,6 +6,7 @@
 #include <linux/auxiliary_bus.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of_device.h>
 #include <linux/property.h>
 #include <linux/soc/qcom/pdr.h>
 #include <linux/usb/typec_mux.h>
@@ -296,11 +297,19 @@ static void pmic_glink_ucsi_destroy(void *data)
 	mutex_unlock(&ucsi->lock);
 }
 
+static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
+	{ .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
+	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
+	{ .compatible = "qcom,sm8350-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
+	{}
+};
+
 static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 				 const struct auxiliary_device_id *id)
 {
 	struct pmic_glink_ucsi *ucsi;
 	struct device *dev = &adev->dev;
+	const struct of_device_id *match;
 	struct fwnode_handle *fwnode;
 	int ret;
 
@@ -327,6 +336,10 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 	if (ret)
 		return ret;
 
+	match = of_match_device(pmic_glink_ucsi_of_quirks, dev->parent);
+	if (match)
+		ucsi->ucsi->quirks = (unsigned long)match->data;
+
 	ucsi_set_drvdata(ucsi->ucsi, ucsi);
 
 	device_for_each_child_node(dev, fwnode) {
-- 
2.42.0

