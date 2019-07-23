Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 504EF7161B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 12:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387465AbfGWKbP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 06:31:15 -0400
Received: from ns.iliad.fr ([212.27.33.1]:45332 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730390AbfGWKbP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 06:31:15 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 3219E20532;
        Tue, 23 Jul 2019 12:31:13 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 14A61202A3;
        Tue, 23 Jul 2019 12:31:13 +0200 (CEST)
Subject: Re: [PATCH] phy: qcom-qmp: Correct READY_STATUS poll break condition
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
References: <20190604232443.3417-1-bjorn.andersson@linaro.org>
 <619d2559-6d88-e795-76e0-3078236933ef@free.fr>
 <20190612172501.GY4814@minitux>
 <3570d880-2b76-88ae-8721-e75cf5acec4c@free.fr>
 <5b252fe6-9435-2aad-d0db-f6170a07b5e9@free.fr>
Message-ID: <f52774d3-d1ad-9cc4-af23-feb10d9f4b9f@free.fr>
Date:   Tue, 23 Jul 2019 12:31:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5b252fe6-9435-2aad-d0db-f6170a07b5e9@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Tue Jul 23 12:31:13 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/07/2019 17:50, Marc Gonzalez wrote:

> On 13/06/2019 11:10, Marc Gonzalez wrote:
> 
>> Here are my observations for a 8998 board:
>>
>> 1) If I apply only the readl_poll_timeout() fix (not the mask_pcs_ready fixup)
>> qcom_pcie_probe() fails with a timeout in phy_init.
>> => this is in line with your regression analysis.
>>
>> 2) Your patch also fixes a long-standing bug in UFS init whereby sending
>> lots of information to the console during phy init would lead to an
>> incorrectly diagnosed time-out.
>>
>> Good stuff!
>>
>> Reviewed-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
>> Tested-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> 
> It looks like this patch fixed UFS, but broke PCIe and USB3 ^_^
> 
> qcom-qmp-phy 1c06000.phy: Registered Qcom-QMP phy
> qcom-qmp-phy c010000.phy: Registered Qcom-QMP phy
> qcom-qmp-phy 1da7000.phy: Registered Qcom-QMP phy
> 
> qcom-qmp-phy 1c06000.phy: BEFORE=000000a6 AFTER=000000a6
> qcom-qmp-phy 1c06000.phy: phy initialization timed-out
> phy phy-1c06000.phy.0: phy init failed --> -110
> qcom-pcie: probe of 1c00000.pci failed with error -110
> 
> qcom-qmp-phy 1da7000.phy: BEFORE=00000040 AFTER=0000000d
> 
> qcom-qmp-phy c010000.phy: BEFORE=69696969 AFTER=b7b7b7b7
> qcom-qmp-phy c010000.phy: phy initialization timed-out
> phy phy-c010000.phy.1: phy init failed --> -110
> dwc3 a800000.dwc3: failed to initialize core: -110
> dwc3: probe of a800000.dwc3 failed with error -110
> 
> 
> Downstream code for PCIe is:
> 
> static bool pcie_phy_is_ready(struct msm_pcie_dev_t *dev)
> {
> 	if (dev->phy_ver >= 0x20) {
> 		if (readl_relaxed(dev->phy + PCIE_N_PCS_STATUS(dev->rc_idx, dev->common_phy)) &	BIT(6))
> 			return false;
> 		else
> 			return true;
> 	}
> 
> 	if (!(readl_relaxed(dev->phy + PCIE_COM_PCS_READY_STATUS) & 0x1))
> 		return false;
> 	else
> 		return true;
> }
> 
> AFAICT:
> PCIe and USB3 QMP PHYs are ready when PHYSTATUS=BIT(6) goes to 0.
> But UFS is ready when PCS_READY=BIT(0) goes to 1.
> 
> 
> Can someone verify that USB3 is broken on 845 with 885bd765963b?

Suggested fix:

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 34ff6434da8f..11c1b02f0206 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1447,6 +1447,11 @@ static int qcom_qmp_phy_com_exit(struct qcom_qmp *qmp)
 	return 0;
 }
 
+static bool phy_is_ready(unsigned int val, unsigned int mask)
+{
+	return mask == PCS_READY ? val & mask : !(val & mask);
+}
+
 static int qcom_qmp_phy_enable(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
@@ -1548,7 +1553,7 @@ static int qcom_qmp_phy_enable(struct phy *phy)
 	status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
 	mask = cfg->mask_pcs_ready;
 
-	ret = readl_poll_timeout(status, val, val & mask, 10,
+	ret = readl_poll_timeout(status, val, phy_is_ready(val, mask), 10,
 				 PHY_INIT_COMPLETE_TIMEOUT);
 	if (ret) {
 		dev_err(qmp->dev, "phy initialization timed-out\n");
