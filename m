Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2B586E836
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2019 17:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728402AbfGSPuR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jul 2019 11:50:17 -0400
Received: from ns.iliad.fr ([212.27.33.1]:43326 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728331AbfGSPuR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jul 2019 11:50:17 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id B9CA020AC3;
        Fri, 19 Jul 2019 17:50:14 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 9A4F720A7E;
        Fri, 19 Jul 2019 17:50:14 +0200 (CEST)
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
Message-ID: <5b252fe6-9435-2aad-d0db-f6170a07b5e9@free.fr>
Date:   Fri, 19 Jul 2019 17:50:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3570d880-2b76-88ae-8721-e75cf5acec4c@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Fri Jul 19 17:50:14 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/06/2019 11:10, Marc Gonzalez wrote:

> Here are my observations for a 8998 board:
> 
> 1) If I apply only the readl_poll_timeout() fix (not the mask_pcs_ready fixup)
> qcom_pcie_probe() fails with a timeout in phy_init.
> => this is in line with your regression analysis.
> 
> 2) Your patch also fixes a long-standing bug in UFS init whereby sending
> lots of information to the console during phy init would lead to an
> incorrectly diagnosed time-out.
> 
> Good stuff!
> 
> Reviewed-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Tested-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

It looks like this patch fixed UFS, but broke PCIe and USB3 ^_^

qcom-qmp-phy 1c06000.phy: Registered Qcom-QMP phy
qcom-qmp-phy c010000.phy: Registered Qcom-QMP phy
qcom-qmp-phy 1da7000.phy: Registered Qcom-QMP phy

qcom-qmp-phy 1c06000.phy: BEFORE=000000a6 AFTER=000000a6
qcom-qmp-phy 1c06000.phy: phy initialization timed-out
phy phy-1c06000.phy.0: phy init failed --> -110
qcom-pcie: probe of 1c00000.pci failed with error -110

qcom-qmp-phy 1da7000.phy: BEFORE=00000040 AFTER=0000000d

qcom-qmp-phy c010000.phy: BEFORE=69696969 AFTER=b7b7b7b7
qcom-qmp-phy c010000.phy: phy initialization timed-out
phy phy-c010000.phy.1: phy init failed --> -110
dwc3 a800000.dwc3: failed to initialize core: -110
dwc3: probe of a800000.dwc3 failed with error -110


Downstream code for PCIe is:

static bool pcie_phy_is_ready(struct msm_pcie_dev_t *dev)
{
	if (dev->phy_ver >= 0x20) {
		if (readl_relaxed(dev->phy + PCIE_N_PCS_STATUS(dev->rc_idx, dev->common_phy)) &	BIT(6))
			return false;
		else
			return true;
	}

	if (!(readl_relaxed(dev->phy + PCIE_COM_PCS_READY_STATUS) & 0x1))
		return false;
	else
		return true;
}

AFAICT:
PCIe and USB3 QMP PHYs are ready when PHYSTATUS=BIT(6) goes to 0.
But UFS is ready when PCS_READY=BIT(0) goes to 1.


Can someone verify that USB3 is broken on 845 with 885bd765963b?

Regards.
