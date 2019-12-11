Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF5EC11A37C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 05:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfLKEag (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 23:30:36 -0500
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:37066
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726631AbfLKEag (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 23:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576038635;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
        bh=RjAOg7rapJ44sjcYuno76zg6PCITgSDHfukD67loebc=;
        b=BytHj8td16eRu3Vr54ZwemstobWiRVypFIWHdgVe/Wr10AUiIl03an64bJ+7p1lZ
        86OBkvnlbQwMYyhMooZADLUxNNe+e4L8l9NHRyfw+BLCDdzeqfIt73i8dNNQwW5HZZx
        khTd3pArbRPZ4Z9bFNsMIfxXvj0eCj1paTuz0bK8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576038635;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=RjAOg7rapJ44sjcYuno76zg6PCITgSDHfukD67loebc=;
        b=N6FyEIkoMpAq5eFGUy9tLYltS/hQ0rqHHUEsFoFFOtygFVwbrvIn6Dg814Nkl8Af
        3KMi5t/rufJF2OdMy4rY5tCfBaWtWcgwVhZP+ODcbzGlKj3lRCDQuF4Pw+FVuq1Ijnf
        hN3i+VxihDPOWq9gLBkwaRHNmwA9pZa37IXyVxdI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DF588C4479F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 0/3] Add DT nodes for watchdog and llcc for SC7180 and SM8150 SoCs
Date:   Wed, 11 Dec 2019 04:30:35 +0000
Message-ID: <0101016ef33915bf-d49915ef-1758-46b9-bce7-72a3678b75e0-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.12.11-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds device tree node for watchdog on SC7180 and SM8150.
It also adds a node for LLCC (Last level cache controller) on SC7180.

Patch 3 depends on the dt binding change to LLCC node name:
 - https://patchwork.kernel.org/patch/11246055/

Sai Prakash Ranjan (3):
  arm64: dts: qcom: sc7180: Add APSS watchdog node
  arm64: dts: qcom: sm8150: Add APSS watchdog node
  arm64: dts: qcom: sc7180: Add Last level cache controller node

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi |  6 ++++++
 2 files changed, 19 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

