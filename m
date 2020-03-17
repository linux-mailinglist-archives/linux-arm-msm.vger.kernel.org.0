Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A22F18889B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 16:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgCQPJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 11:09:25 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:26788 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726476AbgCQPJZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 11:09:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584457764; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=DQyTxctuBEZTN8fXLm5dooxaiNu334g2EQVY7vU8oHo=; b=B4SVDDZNc8EkSQPZMU3NFcj6lOvcla3ZD6ou4sUTFmozmtJDQnZmhpEpaLvud2G+yPsfDbMp
 8dz5R9bVyQztriyrXb3lHuTk5s8/f4SvS89rCjjDexxPdkMSa/JwzRsBM956V+4LN6lZEvOo
 iXRUFhSuMP5QKIPz75iObIgm2QU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e70e824.7f82fd773c38-smtp-out-n03;
 Tue, 17 Mar 2020 15:09:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 163EBC4478F; Tue, 17 Mar 2020 15:09:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A07AC433D2;
        Tue, 17 Mar 2020 15:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9A07AC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, joro@8bytes.org,
        robin.murphy@arm.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        agross@kernel.org, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 0/3] Request direct mapping for modem device
Date:   Tue, 17 Mar 2020 20:39:07 +0530
Message-Id: <20200317150910.26053-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Q6 modem sub-system has direct access to DDR through memnoc and
an indirect access routed through a SMMU which MSS CE (crypto engine
sub-component of MSS) uses during out of reset sequence. Request direct
mapping for the modem device since smmu is not expected to provide access
control/translation for these SIDs (sandboxing of the modem is achieved
through XPUs engaged using SMC calls). This is done on platforms which
don't have TrustZone (which programs the modem SIDs) to prevent the
following global faults seen on Cheza/Trogdor:

Cheza:
arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
arm-smmu 15000000.iommu: GFSR 0x80000002, GFSYNR0 0x00000000,
			 GFSYNR1 0x00000781, GFSYNR2 0x00000000

Trogdor:
arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
arm-smmu 15000000.iommu: GFSR 0x80000002, GFSYNR0 0x00000000,
			 GFSYNR1 0x00000461, GFSYNR2 0x00000000

V2:
 * Request direct mapping from SoC-specific corner of the SMMU
   driver [Robin]
 * Add iommu property to remoteproc modem node on Cheza

Depends on:
https://lore.kernel.org/patchwork/cover/1183528/

Sibi Sankar (3):
  dt-bindings: remoteproc: qcom: Add iommus property
  remoteproc: qcom_q6v5_mss: Request direct mapping for modem device
  arm64: dts: qcom: sdm845-cheza: Add iommus property

 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 3 +++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                 | 4 ++++
 drivers/iommu/arm-smmu-qcom.c                              | 6 ++++++
 3 files changed, 13 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
