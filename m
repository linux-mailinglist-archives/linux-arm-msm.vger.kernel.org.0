Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561BE1DD17C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 17:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730269AbgEUPYF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 11:24:05 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:63067 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730231AbgEUPYC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 11:24:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590074641; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=naABoZqtWXQ2lg37iYvV0+bqGuL4VsftQdvTElt++Oc=; b=p+y4Gq5BkBbeat6K767rXqTuszo4DibgV1wr+24a9+70PWnQ4iQXFjghyzlyzRz8dWDIY0kq
 AAovPfvOhq+H+na4kvxQ7caGfEesAx49XKgDMBqfPOzQgtr2lVmynDeokspnlqC8kcUesjDm
 Hq+Rnma7pYG++KQtJmf7kMsB6uY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ec69d088cd231c4035c06ab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 May 2020 15:23:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EB65EC433AD; Thu, 21 May 2020 15:23:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4863AC433CA;
        Thu, 21 May 2020 15:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4863AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: [PATCH V2 0/3] Internal voltage control for qcom SDHC 
Date:   Thu, 21 May 2020 20:53:32 +0530
Message-Id: <1590074615-10787-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On qcom SD host controllers voltage switching be done after the HW
is ready for it. The HW informs its readiness through power irq.
The voltage switching should happen only then.

So added support to register voltage regulators from the msm driver
and use them.

This patchset was posted long back but not actively pursued
https://lore.kernel.org/linux-arm-msm/1539004739-32060-1-git-send-email-vbadigan@codeaurora.org/
So posting it as fresh patchset.  

Changes since V1:
	- Removed setting load for Vmmc regulator while turning it on/off.
	  Instead setting the active load once during probe.
	- Simplified handlng of supplies for BUS_ON/OFF cases in shci_msm_handle_pwr_irq().
	- Moved common code out of switch case in sdhci_msm_start_signal_voltage_switch().
	- Updated variable name to sdhci_core_to_disable_vqmmc.
	- Updated pr_err logs to dev_err logs.

Veerabhadrarao Badiganti (1):
  dt-bindings: mmc: Supply max load for mmc supplies
  mmc: sdhci-msm: Use internal voltage control

Vijay Viswanath (1):
  mmc: sdhci: Allow platform controlled voltage switching

 .../devicetree/bindings/mmc/mmc-controller.yaml    |  16 ++
 drivers/mmc/host/sdhci-msm.c                       | 207 ++++++++++++++++++++-
 drivers/mmc/host/sdhci.c                           |  32 ++--
 drivers/mmc/host/sdhci.h                           |   1 +
 4 files changed, 234 insertions(+), 22 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project

