Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A88B4516E4C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 12:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384605AbiEBKqr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 06:46:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384662AbiEBKqe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 06:46:34 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A40FB1ADB1
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 03:42:52 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id p12so24577581lfs.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 03:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gJW2hpX0jDXzFSio868cnZYVwu80EHBYg4jMatUzfuo=;
        b=H0lDuGWxfOP2AzWshD1t3hIT54ArwKdHMwwIH0aEvePpuw1tyEgIVWneFG6ipMo3oR
         oOWmxaBqh40ckpKhnMUqBkWG9N1QNb5X6QysDvnKjWCsKAPhU102olPSxYREqaV2GVko
         ZAcaCokSB0sxgrWDAjLjUW5Ft1SEXmXGQQd06Pz6L5Dcpb8zHZaKZkt7PZpnKFuEtKG5
         iRVAGDYHaefsn1A8cNCWBrmsDtKl+wNkRMbOZObbUBJb4a5NT+mgTEdPhADD0o6BmH22
         2teumeELF2eeF+0V98AUikaTZFyPfvEzs1lUhIo2XJcl9w1coq7Lj2hmhJyJNGbhaepc
         vmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gJW2hpX0jDXzFSio868cnZYVwu80EHBYg4jMatUzfuo=;
        b=Fzc3evwlTkhn/7IIqoFKUsLxuU9wRjQPiF/uj9Q9o+7D4/aGu0IBAz+gLqYM2m1vJ2
         1LQF2i3x6Vyvaa/9x4vEPBmXcC4sKevs5xsLPt94YYfqkoAfA155MfLjk4AtWSaQSV0B
         zk20WhQkPGHCNLvVRWiWWk+zshKwjGBW4EdezLkI569j2pPuOmSmHTXISrx+v1IRurVk
         8K1irfFuQ9AoufaYzGInxuaEIBqc9TP8q0BFi93YGqneRiuKbwvd6TeFhlRLdvJmfRzD
         8xhqNWua9CC4WMZqUgH7EYQDuA+FTQsBSzC2GfRXwLgru9aAUSb4BLsg87avyOUTC9V2
         rwfA==
X-Gm-Message-State: AOAM5302YcrQwZ3KYI4GglaosHPJsb80dXiKC6rzZG+3EWcve/QqfHqq
        F/0k/LHXE5WRgJgUfaTIbrH12w==
X-Google-Smtp-Source: ABdhPJwhS9zpzLBSwfTZ54BY2m//olODt6cmW03GY4OQEa2073XfSdto2TGmuUAYeO8WFx8PeClbpg==
X-Received: by 2002:ac2:4250:0:b0:44a:ff88:3795 with SMTP id m16-20020ac24250000000b0044aff883795mr8649215lfl.384.1651488171034;
        Mon, 02 May 2022 03:42:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q12-20020ac25a0c000000b0047255d211dfsm670929lfn.270.2022.05.02.03.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 03:42:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
        bhelgaas@google.com
Cc:     linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: qcom-ep: use qcom_pcie_disable_resources() in qcom_pcie_ep_remove()
Date:   Mon,  2 May 2022 13:42:50 +0300
Message-Id: <20220502104250.73311-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502044625.25210-1-manivannan.sadhasivam@linaro.org>
References: <20220502044625.25210-1-manivannan.sadhasivam@linaro.org>
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

Remove code duplication between qcom_pcie_disable_resources() and
qcom_pcie_ep_remove().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Could you please squash the following patch and repost it?

---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 80a9acf683ba..11f40a6467ba 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -689,10 +689,7 @@ static int qcom_pcie_ep_remove(struct platform_device *pdev)
 	if (pcie_ep->link_status == QCOM_PCIE_EP_LINK_DISABLED)
 		return 0;
 
-	phy_power_off(pcie_ep->phy);
-	phy_exit(pcie_ep->phy);
-	clk_bulk_disable_unprepare(ARRAY_SIZE(qcom_pcie_ep_clks),
-				   qcom_pcie_ep_clks);
+	qcom_pcie_disable_resources(pcie_ep);
 
 	return 0;
 }
-- 
2.35.1

