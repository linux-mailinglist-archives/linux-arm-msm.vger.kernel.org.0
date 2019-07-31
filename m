Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D60D67B94E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 07:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbfGaF62 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 01:58:28 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50566 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbfGaF62 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 01:58:28 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C940260247; Wed, 31 Jul 2019 05:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564552706;
        bh=TglDuzt/i/hZbxIU8sD5b+3/zua3/V5s6jwjG6xUddo=;
        h=From:To:Cc:Subject:Date:From;
        b=PQL6ESuhrcTyHiDgjpe+G6yCRJGcf6ij1VY09cEbxo7yVtWDTzq3UhTcqM15LVqSM
         cyWN9CZ5eb1n8doS5soUB1GDuCo5mmGyNW8nI0ukdeqRI7ALS0x3Go7mQ5lHKWL82n
         nGC1S/FSpLO6GT7M9kkn8mxG9C4rMPxNzSGdCFQY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C37D060247;
        Wed, 31 Jul 2019 05:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564552705;
        bh=TglDuzt/i/hZbxIU8sD5b+3/zua3/V5s6jwjG6xUddo=;
        h=From:To:Cc:Subject:Date:From;
        b=oMr+No8DfKaeJzw1M7LsqG70HqVLUxQp/Hdab+BYLRmaAhx5C/CA6txptmHL7FJ+9
         joofJ1kfCUO6VGzukEIHI2m5+Z3QHm61h4km1wHW/BDGhE0Zm93hqamg8kzZ083YKg
         478NSiQATGI0ph0ZZJpp0bI87+VexXcJMJPtu/wk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C37D060247
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv9 0/3] Add coresight support for SDM845, MSM8998 and MSM8996
Date:   Wed, 31 Jul 2019 11:27:59 +0530
Message-Id: <cover.1564550873.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for coresight on SDM845, MSM8998, and MSM8996.

* Patch 1 adds device tree nodes for SDM845 coresight components.

* Patch 2 adds device tree nodes for MSM8998 coresight components.

* Patch 3 adds device tree nodes for MSM8996 coresight components.

All the previous dependencies are now merged.

This patch series has been tested on SDM845 MTP and MSM8996
based Dragonboard 820c and MSM8998 MTP.

Test results for SDM845 and MSM8996 with scatter gather are uploaded to below github link:
 - https://github.com/saiprakash-ranjan/coresight-test-results 

v9:
 * Add test results for SDM845 and MSM8996.
 * Add missing funnel node in MSM8996.
 
v8:
 * Change to clocks instead of power domain for SDM845.
 * Fix compilation with uci_id_debug struct changed to const.
 * Rebase on top of linux-next.

v7:
 * Change uci_id_debug struct to const.
 * Update the subject as suggested by Suzuki.

v6:
 * Update the UCI table with the new macro introduced by
   Mike.
 * Rebase on top of coresight-next and provide a tree with
   all the dependent patches applied.

v5:
 * Added coresight support for MSM8998.
 * Added ETM PIDs for SDM845 and MSM8996 as suggested
   by Suzuki.
 * Added UCI table for Coresight CPU debug module.

v4:
 * Mask out the minor version as suggested by Mathieu.
 * Added the dependent patch description in patch 1.

v3:
 * Added arm,scatter-gather property as suggested by Suzuki.

v2:
 * Added coresight support for msm8996 based on Vivek's patch.
   Cleaned up and added coresight cpu debug nodes for msm8996.
 * Merged coresight dtsi file into sdm845.dtsi as suggested by Bjorn
 * Addressed Mathieu's feedback about masking the minor version in
   etm4_arch_supported() and added a comment for reason to bypass
   the AMBA bus discovery method.

Sai Prakash Ranjan (2):
  arm64: dts: qcom: sdm845: Add Coresight support
  arm64: dts: qcom: msm8998: Add Coresight support

Vivek Gautam (1):
  arm64: dts: qcom: msm8996: Add Coresight support

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 468 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 435 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 451 +++++++++++++++++++++++++
 3 files changed, 1354 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

