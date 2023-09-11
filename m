Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7329479AF6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 01:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343682AbjIKVMQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244182AbjIKTdD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 15:33:03 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2752C12A
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 12:32:58 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2bcde83ce9fso81367661fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 12:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694460776; x=1695065576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmoYn1hZC3xQGtyelzNab1Xu6ODmKiyQRbBS/HxAMC4=;
        b=UotyASXNe8JaMvNQqj492rQLsq2hxrshnwenGUpD3NUMHSn+HT6x10/hFdJeDse7g5
         kEGHkcu+vsDxGPD9e5/Sl3bzciD25WZ4YWva1ZlXtiqwaChGSrTK/phZpekApygfaWKt
         Er4mssrD8c4a5Q1YbGjHoX9w8/v4HcSmzf538k33Zq15b2UDWwyNPt1x67XDjr4Q9/3G
         zlWOWePvaJplD7SX9b+aSOVf8JN8rjz5Fb8RpoQ1AFWmbP6/O+yRIKzq8vLbqZCOHxPv
         ooM6NNwzZ2T32RkamjRoqL2/abGutacfvcNqRAsKxrRpq4cOXNqpHZuF5G11Ke99KYKN
         F+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694460776; x=1695065576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmoYn1hZC3xQGtyelzNab1Xu6ODmKiyQRbBS/HxAMC4=;
        b=eKWYivBolJuI+eux2qY2JRcwb1juv4W3siHW6zOXTeDkke/iLu6mp48FBhxsaQKWBs
         nwUIsJmA3Y80uSCFsuhdQxNdoobStWaxaGkrQNNwTZ+rtRc2ay7/KVNNM2FNrrB+bTYK
         oxr8sHCT3QhWaB6GvMZuu2a64lQtYFFmbFUyNtjcfoNzrXr5hPfvauxSfhZ6syBsUJm3
         N3uY7HsMJqohBJjP/qEFE32RXS/5rsuzivf4bdpjDhYF0sSZ9dIdkwReKbmlh+n28BlI
         5F138B7A2CftYMfOVmEkVwioKYS+9AMLM2PXpLEVxv4IvEkO5kj33udNCqVLNwRs1w/p
         EIZg==
X-Gm-Message-State: AOJu0Yy7ks+/pz8MkQ78cohOhxFL/SQthBdSqGzIbge+JfSYQ2LSktrO
        8V5FyTARbIRnoMZx78VjLHnIXA==
X-Google-Smtp-Source: AGHT+IGVpfF1mPPSu5kGATO/g/0PYmS6AMm2ETruxKwXin501vgUXJVjft33cKKtyBHE1FmZOylGaA==
X-Received: by 2002:a2e:3a10:0:b0:2bc:b6ce:eab with SMTP id h16-20020a2e3a10000000b002bcb6ce0eabmr8601981lja.51.1694460776479;
        Mon, 11 Sep 2023 12:32:56 -0700 (PDT)
Received: from [10.167.154.1] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id j4-20020a170906410400b0099cc402d3ddsm5698607ejk.202.2023.09.11.12.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 12:32:56 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 11 Sep 2023 21:32:49 +0200
Subject: [PATCH v2 2/2] phy: qcom-qmp-combo: initialize PCS_USB registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230829-topic-8550_usbphy-v2-2-a72f43311d19@linaro.org>
References: <20230829-topic-8550_usbphy-v2-0-a72f43311d19@linaro.org>
In-Reply-To: <20230829-topic-8550_usbphy-v2-0-a72f43311d19@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Adrien Thierry <athierry@redhat.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694460770; l=1296;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=DV4nuVtUL74YZJK1G0aNcuFg9vdKLsrw5ToJmi5Mtx8=;
 b=7QsJOM+zXh00ZIJeXd4vj/+bQ02B5nc7LfNYHDIXk8dqEvIVOII2KvHp/HmaBQI2RgI0gJtJs
 7lKj3zZExUtByiiJ7vkNGAsC5j2WzscJL6a9Omhf20n3LffmXcbnglQ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, PCS_USB registers that have their initialization data in a
pcs_usb_tbl table are never initialized. Fix that.

Fixes: fc64623637da ("phy: qcom-qmp-combo,usb: add support for separate PCS_USB region")
Reported-by: Adrien Thierry <athierry@redhat.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 843099d314bf..1922b05403ac 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2555,6 +2555,7 @@ static int qmp_combo_usb_power_on(struct phy *phy)
 	void __iomem *tx2 = qmp->tx2;
 	void __iomem *rx2 = qmp->rx2;
 	void __iomem *pcs = qmp->pcs;
+	void __iomem *pcs_usb = qmp->pcs_usb;
 	void __iomem *status;
 	unsigned int val;
 	int ret;
@@ -2576,6 +2577,9 @@ static int qmp_combo_usb_power_on(struct phy *phy)
 
 	qmp_combo_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 
+	if (pcs_usb)
+		qmp_combo_configure(pcs_usb, cfg->pcs_usb_tbl, cfg->pcs_usb_tbl_num);
+
 	if (cfg->has_pwrdn_delay)
 		usleep_range(10, 20);
 

-- 
2.42.0

