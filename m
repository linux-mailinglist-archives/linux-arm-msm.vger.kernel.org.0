Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37BA11F3C88
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 15:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbgFINbV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 09:31:21 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:31991 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728694AbgFINbU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 09:31:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591709480; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=XYMKF86CVQR23J6gZ8goT411lJqXYpDzWo8S/WlnSa4=; b=Ws0j/a2Sd9O3xsTHSJcgCagKTu0ajxdlp1NUQVtw0Ndjlv1G7RIEnkC53YJaSBnslNsbwG+x
 z0k/MQaGEwBpkcf3x8F0o2w/yCUMB1dIXKwEbF8ms0Wrfd8x7P3ukiYRoD6mw8m9/x2LarI5
 w4ylhF7UMNt0O5d3VC8OCZpenzU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5edf8f05a3d8a44743cbe70a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 13:30:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E20B1C4339C; Tue,  9 Jun 2020 13:30:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D8A61C433C6;
        Tue,  9 Jun 2020 13:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D8A61C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        mike.leach@linaro.org, Jonathan Marek <jonathan@marek.ca>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 0/4] Add coresight support for SM8150 and few changes to SC7180 
Date:   Tue,  9 Jun 2020 19:00:27 +0530
Message-Id: <cover.1591708204.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds coresight support for SM8150 SoC and some coresight
DT changes to SC7180 SoC.

Patch 1 depends on coresight etm driver change:
 - https://git.linaro.org/kernel/coresight.git/commit/?h=next-v5.8-rc1&id=159e248e75b1b548276b6571d7740a35cab1f5be

Patch 3 depends on coresight replicator driver change:
 - https://git.linaro.org/kernel/coresight.git/commit/?h=next-v5.8-rc1&id=1b6cddfb7ebb5ed293124698f147e914b15315a1
 
Patch 4 depends on following coresight driver changes and SMMU DT node for SM8150
 - https://git.linaro.org/kernel/coresight.git/commit/?h=next-v5.8-rc1&id=159e248e75b1b548276b6571d7740a35cab1f5be
 - https://git.linaro.org/kernel/coresight.git/commit/?h=next-v5.8-rc1&id=1b6cddfb7ebb5ed293124698f147e914b15315a1
 - https://lore.kernel.org/lkml/20200524023815.21789-2-jonathan@marek.ca/

Tested this series on SM8150 and SC7180.

Sai Prakash Ranjan (4):
  arm64: dts: qcom: sc7180: Add support to skip powering up of ETM
  arm64: dts: qcom: sc7180: Add iommus property to ETR
  arm64: dts: qcom: sc7180: Add support for context losing replicator
  arm64: dts: qcom: sm8150: Add Coresight support

 arch/arm64/boot/dts/qcom/sc7180.dtsi |  10 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 591 +++++++++++++++++++++++++++
 2 files changed, 601 insertions(+)


base-commit: 98cfcf1a9c542d6bec7b29915d838caaf72da737
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

