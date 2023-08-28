Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4770178B467
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 17:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbjH1PZL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 11:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232242AbjH1PY7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 11:24:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E45F125
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 08:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693236251;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XgaN+BG8AUFu2JQlp/lnBJIk6IikRZnClAJ7+Cn21e8=;
        b=DHUV5WJx1OT1mF/nqvySdV4wMXgd0VyOOO23MlF2Pnb2loYSHTndVZlheb1lPFF7Azmly9
        ayt4jlegmgRCDUPpZM0sOn4aVQtxKHJJwCvx+cdE80AEZEy3ZIUAw//Yf+JEsQmJI2XJxn
        iCRDsWIuSXYjhQJT9uf/XfrS6MG3PL0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-7Ud0N6TjPru6qxrZ8xDRyQ-1; Mon, 28 Aug 2023 11:24:09 -0400
X-MC-Unique: 7Ud0N6TjPru6qxrZ8xDRyQ-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-64bf507a8d4so42904836d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 08:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693236249; x=1693841049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgaN+BG8AUFu2JQlp/lnBJIk6IikRZnClAJ7+Cn21e8=;
        b=iBPjrLlaUs+9f7dBI/uH5Fr1nIO9jkdXHKmmJ4+9Sh52N6azXHAzaqIDZ7fEdijKX3
         YGga1SZ3+tbPSo7GSJ8NFkLPLQ/Vw4Two0z4oA1/dy7QmL/uggprtuG7DHFvFgV2RLsb
         8ohT8QVHmkqhbpKypPGTkBhAWFcoVZpnUPtH3+ZWdDYxhqXrq78VMFE8sBkM+Q8m71Bj
         3+K46kJna+iGlKSzNCD5+cMlq/VJPskR2Z5SmpXT0vvrDMxMaEEEppwgA6k8ipcY49Ye
         4OOP+z41oS7cCrA/EOOgHwRtWYU0fmesSOg+MKvhFqrDoEzM1ASED8bppIq0VD5lz4mq
         BjTg==
X-Gm-Message-State: AOJu0Yzj/aOBYee8JDH497GK2iDBG6ATgA/NyCqmc2TWt4ltqKkHwRh8
        pUqpx3Z5pp8IXK42aVLt1aMqEOd/aVgnlqR38IlLmt2Ehaddo2tklAH4CB21ju2AMZlHlsEjqwf
        TjZJc+f33OQ5ArY0mWPkIxtb+Pg==
X-Received: by 2002:a0c:b24e:0:b0:64f:7a11:b06c with SMTP id k14-20020a0cb24e000000b0064f7a11b06cmr9033467qve.43.1693236249539;
        Mon, 28 Aug 2023 08:24:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5N0ACrbO6gr/QzkKRUkb3dyF6Q8NXiLtE6V7eutxzNLjqvtNUAH39N2ZcM5lHQY7myuavYQ==
X-Received: by 2002:a0c:b24e:0:b0:64f:7a11:b06c with SMTP id k14-20020a0cb24e000000b0064f7a11b06cmr9033452qve.43.1693236249329;
        Mon, 28 Aug 2023 08:24:09 -0700 (PDT)
Received: from fedora.redhat.com ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id m9-20020a0cf189000000b0063fbfbde4adsm2632860qvl.129.2023.08.28.08.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 08:24:08 -0700 (PDT)
From:   Adrien Thierry <athierry@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Adrien Thierry <athierry@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 1/2] phy: qcom-qmp-usb: initialize PCS_USB registers
Date:   Mon, 28 Aug 2023 11:23:50 -0400
Message-ID: <20230828152353.16529-2-athierry@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828152353.16529-1-athierry@redhat.com>
References: <20230828152353.16529-1-athierry@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, PCS_USB registers that have their initialization data in a
pcs_usb_tbl table are never initialized. Fix that.

Fixes: fc64623637da ("phy: qcom-qmp-combo,usb: add support for separate PCS_USB region")
Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 466f0a56c82e..f9cb60f12575 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -2233,6 +2233,7 @@ static int qmp_usb_power_on(struct phy *phy)
 	void __iomem *tx = qmp->tx;
 	void __iomem *rx = qmp->rx;
 	void __iomem *pcs = qmp->pcs;
+	void __iomem *pcs_usb = qmp->pcs_usb;
 	void __iomem *status;
 	unsigned int val;
 	int ret;
@@ -2256,6 +2257,9 @@ static int qmp_usb_power_on(struct phy *phy)
 
 	qmp_usb_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
+	if (pcs_usb)
+		qmp_usb_configure(pcs_usb, cfg->pcs_usb_tbl, cfg->pcs_usb_tbl_num);
+
 	if (cfg->has_pwrdn_delay)
 		usleep_range(10, 20);
 
-- 
2.41.0

