Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8C2735AC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 17:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjFSPGO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 11:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbjFSPFT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 11:05:19 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB6910D0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 08:04:41 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5607a462bb7so401280eaf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 08:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687187080; x=1689779080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltCiTsDOD5ydUGLVe1beQMJS2WLXn803YOi09x8rHPs=;
        b=RxWkwsnVaP8PkS+Iu4kSHBZxSZwvPpQ+s508UcLy+kyDeCLsGxKmiLpVWFg2PF8BV8
         qHvx7HgeTREoO61gDGcC6iocs6OzDVNKR5mXRpAhSdTH+cjqgCj2/4AZuCTbFUp5BQ86
         vRP8zT38xgSQpJurbkYnPowLjIjy1oXWE3Y9+Sy3tdESLZSM/LT9GbHjKDU76pMjLcJR
         TpV6/1IhdBV6+qT5qPhXMeXm7WTVqixTfEnBF2jD9+prcCNOoPjXFWZ+PmMLL5FTHasj
         nv0W4B2sAd5KKZeKfkQ2at0ZkrNKaZ0zxoMuY1RJ77gG+5qIcj47SAoxTzEfu37ytEAC
         wgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687187080; x=1689779080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltCiTsDOD5ydUGLVe1beQMJS2WLXn803YOi09x8rHPs=;
        b=T059eiVkcBv18wEpdZWgO7F4ZvYJJc4ymtrs84F+SZ2kr8YVJcZMIGBkyqrDclFWrg
         sYXMnFSle+tEJErWw5NoZboB2askHXYFsIOEK52m8pYcCBrvNFGf/ePHzVX5XBRf/U3r
         2i+W3AKPV3wIA2ZGp3yUylQsmT33706gG68lKWZrA4PfcBZFYOBjBpLnUoAHSQ9jqEvE
         bj7iY6JxqfplQDi8kBuDFuZylmquBy1po+sYzYDYPKHY+TtbnSopqt6tTYBVoV1zbefK
         j5rb168Dyqw82ylT7BHNC5gNjcvdTskym/4vu+okJ7uhsSCABSHYGWiGTdwHWx1sIRb0
         b7sw==
X-Gm-Message-State: AC+VfDzvA7VX5LVdo14DYgY5PnkYs5Vp0IOeNtdT37HR4H7YMBrfQ6c1
        X8cFOntpqDSy0iC1Hz1lIMnq
X-Google-Smtp-Source: ACHHUZ7jUCBkk2GZ6mqGYAXM5FgcdG5o86hJ+mp4QPxJJVPhMwUe4RqjHcCfX7pPSzpKAYrptEqsBw==
X-Received: by 2002:aca:220d:0:b0:39c:4563:d23c with SMTP id b13-20020aca220d000000b0039c4563d23cmr1033259oic.46.1687187080530;
        Mon, 19 Jun 2023 08:04:40 -0700 (PDT)
Received: from localhost.localdomain ([117.217.183.37])
        by smtp.gmail.com with ESMTPSA id 10-20020a17090a19ca00b0025efaf7a0d3sm2765480pjj.14.2023.06.19.08.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:04:40 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com
Cc:     robh@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, steev@kali.org,
        quic_srichara@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 6/9] PCI: qcom: Do not advertise hotplug capability for IP v2.3.2
Date:   Mon, 19 Jun 2023 20:34:05 +0530
Message-Id: <20230619150408.8468-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230619150408.8468-1-manivannan.sadhasivam@linaro.org>
References: <20230619150408.8468-1-manivannan.sadhasivam@linaro.org>
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

SoCs making use of Qcom PCIe controller IP v2.3.2 do not support hotplug
functionality. But the hotplug capability bit is set by default in the
hardware. This causes the kernel PCI core to register hotplug service for
the controller and send hotplug commands to it. But those commands will
timeout generating messages as below during boot and suspend/resume.

[    5.782159] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x03c0 (issued 2020 msec ago)
[    5.810161] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x03c0 (issued 2048 msec ago)
[    7.838162] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x07c0 (issued 2020 msec ago)
[    7.870159] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x07c0 (issued 2052 msec ago)

This not only spams the console output but also induces a delay of a
couple of seconds. To fix this issue, let's clear the HPC bit in
PCI_EXP_SLTCAP register as a part of the post init sequence to not
advertise the hotplug capability for the controller.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 64b6a8c6a99d..9c8dfd224e6e 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -616,6 +616,8 @@ static int qcom_pcie_post_init_2_3_2(struct qcom_pcie *pcie)
 	val |= EN;
 	writel(val, pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
 
+	qcom_pcie_clear_hpc(pcie->pci);
+
 	return 0;
 }
 
-- 
2.25.1

