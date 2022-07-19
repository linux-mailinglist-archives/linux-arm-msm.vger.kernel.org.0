Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3FBE57A7FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 22:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239875AbiGSUGe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 16:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239754AbiGSUGd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 16:06:33 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48CE725E9C
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 13:06:32 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id w2so18684155ljj.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 13:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=khppLGtmeCurydu0up1OheYjo4gNvX+fB6BrZyQEiVc=;
        b=f3ci2Ph/Jhy9qrO9K8itSvsLR/mRbIogP7DXOHWqE0DCiUlKt4CkJPJCoEx/SmmQD1
         vPv0aqsdddYZXLoFwY08wnexr+v06LqtraxIDCIixFfd+s7rzRlUShQbwQp8l0ipKqbj
         7zBEbPezv1vQuO4gMWx99HLWWdo5FAijE/5mKrOqB14TrBIhZSN5TkjCGvU8Vk04wdDw
         /YoRxYHVkWGjXITtr8etj7S9yqhI7R/XJs9EuIyxTNG+UqYVphIDAIyChoZEU27g7qgy
         Y0yXCF13Z2NBeFWj2wBCy2bhxyplCQIBQijE+pNblT/0zb5bu4zC2j1wJM3Q8+zpWSwR
         w+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=khppLGtmeCurydu0up1OheYjo4gNvX+fB6BrZyQEiVc=;
        b=E/ydbicsZljEawhDIxdYLNByLlBuYaWApp/cl4455/MbGktS+v8fHfdVAO05cU93lR
         TglVIHdHpCsZyefQ7wprjpRl69rNisUJHd5n6y/Djk9e3FZ+hjU0uWhOkqP+xRT1iqQk
         gmrZlAEUzCszozwUoX3/oYv0pPpDl7SHtuJRfwkNdmK/QWd50MxFbIiSK5rHUyJHi3FS
         10X+4hTqnfINUYwt9whtlSvrGDyNePjqAp5q3fPvGUTZTg+AQ2YWSnekxT7h9GR2kT0+
         V47/NKit1IIHYWNR7G/uU9ISjjgXyeB/W3i73QoHL4vAkfcTZbhFRoUSLWs38YWxrjGP
         4YEw==
X-Gm-Message-State: AJIora/30OTH0j8CL142NH25ZiJESfyKO2kAzmtzVrk0jTCKoYt6cfij
        aovVnMqqr0uols6w089E8UTnCg==
X-Google-Smtp-Source: AGRyM1sZ/OwrlRnWMejUVmyxZIIcInNZ6784Ms3BmHblS8+EmUXg+kcGc9fnwFkJSJEW4BTjYxt4wA==
X-Received: by 2002:a2e:888e:0:b0:25d:8112:dfc7 with SMTP id k14-20020a2e888e000000b0025d8112dfc7mr16170633lji.270.1658261190609;
        Tue, 19 Jul 2022 13:06:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w16-20020a05651234d000b00485caa0f5dfsm3402324lfr.44.2022.07.19.13.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 13:06:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH 3/4] PCI: qcom: call phy_set_mode_ext()
Date:   Tue, 19 Jul 2022 23:06:25 +0300
Message-Id: <20220719200626.976084-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220719200626.976084-1-dmitry.baryshkov@linaro.org>
References: <20220719200626.976084-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Call phy_set_mode_ext() to notify the PHY driver that the PHY is being
used in the RC mode.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 5ed164c2afa3..50bf3fefef7a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1486,6 +1486,10 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		return ret;
 
+	ret = phy_set_mode_ext(pcie->phy, PHY_MODE_PCIE, 0);
+	if (ret)
+		return ret;
+
 	ret = phy_power_on(pcie->phy);
 	if (ret)
 		goto err_deinit;
-- 
2.35.1

