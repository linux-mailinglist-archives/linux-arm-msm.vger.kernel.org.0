Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23A11F95FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2020 14:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbgFOMDq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jun 2020 08:03:46 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:45588 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729699AbgFOMDe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jun 2020 08:03:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592222614; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=+C7idz3qJGL4+zckIDQIBEQ9RI5vreVYRy9NHagRJSk=; b=OU55gRvOgLtGXpQRokadZtbaF3a0BEAL9D99OXxxKNVEQ5gyzvT1jXIVg5tVEoYyoAtPbG44
 cCgxce35sZ41n0u+Ce5yLLKatm3gv4Rr2RAzTFJlMe0059Uilp8P3cOHKGSaN2KMGOSZ2RI5
 6bpfTcSOVKYdyJulcZ/EmdApfcY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5ee7637ca3d8a447433269a6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Jun 2020 12:03:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9CDC5C433CA; Mon, 15 Jun 2020 12:03:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C7FAC433C8;
        Mon, 15 Jun 2020 12:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0C7FAC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, robdclark@gmail.com,
        robdclark@chromium.org, stanimir.varbanov@linaro.org
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v6 0/6] DVFS for IO devices on sdm845 and sc7180
Date:   Mon, 15 Jun 2020 17:32:38 +0530
Message-Id: <1592222564-13556-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v6:
1. rebased on 5.8-rc1, no functional change. 

Changes in v5:
1. Opp cleanup path fixed up across drivers

Changes in v4:
1. Fixed all review feedback on v3
2. Dropped the dts patches, will post as a seperate series once
driver changes are reviewed and merged.
The driver changes without DT updates to include OPP tables will
have zero functional change.
3. Dropped the mmc/sdhc patch, which is a standalone patch. will
repost if needed seperately.

Changes in v3:
1. Added better error handling for dev_pm_opp_of_add_table()
2. Some minor changes and fixes in 'PATCH 12/17' as compared to v2
3. Dropped the mmc patch picked up by Ulf [2]

Changes in v2:
1. Added error handling for dev_pm_opp_set_clkname()
and dev_pm_opp_of_add_table()
2. Used dev_pm_opp_put_clkname() in the cleanup path
3. Dropped the OPP patch pulled in by Viresh [1]
4. Dropped the UFS patches since they had some major rework
needed because of changes that were merged in the merge window
and I don't have a UFS device currently to validate the changes.

We have had support added in the OPP core for a while now to support
DVFS for IO devices, and this series uses that infrastructure to
add DVFS support for various IO devices in sdm845 and sc7180 SoCs.

[1] https://lkml.org/lkml/2020/4/14/98
[2] https://lore.kernel.org/patchwork/patch/1226381/

Rajendra Nayak (6):
  tty: serial: qcom_geni_serial: Use OPP API to set clk/perf state
  spi: spi-geni-qcom: Use OPP API to set clk/perf state
  drm/msm/dpu: Use OPP API to set clk/perf state
  drm/msm: dsi: Use OPP API to set clk/perf state
  media: venus: core: Add support for opp tables/perf voting
  spi: spi-qcom-qspi: Use OPP API to set clk/perf state

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c  |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 26 +++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |  4 ++
 drivers/gpu/drm/msm/dsi/dsi.h                  |  2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c              |  4 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c             | 58 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.c       | 43 ++++++++++++++++---
 drivers/media/platform/qcom/venus/core.h       |  5 +++
 drivers/media/platform/qcom/venus/pm_helpers.c | 54 ++++++++++++++++++++++--
 drivers/spi/spi-geni-qcom.c                    | 26 ++++++++++--
 drivers/spi/spi-qcom-qspi.c                    | 28 ++++++++++++-
 drivers/tty/serial/qcom_geni_serial.c          | 34 ++++++++++++---
 include/linux/qcom-geni-se.h                   |  4 ++
 13 files changed, 268 insertions(+), 23 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

