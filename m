Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A913EA1CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 11:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235930AbhHLJSZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 05:18:25 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:20876 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235345AbhHLJSZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 05:18:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628759880; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=wvbmxHKDPqEGjRWLYlxLgyJabN51zMcKvsaUtZ2ab5s=; b=Eo6LLvJWPtoFwcJVg3C71p5r17DxWZ4fPAZSKtGUozd8M41cFRdk3f/P1ZB/Bg4spbP9F9dK
 YfWKCdzjKUKglmn5SefTv4t/Y0rbc+GUAQqAqojC06tyzNvtWCiTtzUXUv/85WXWn4rylVLH
 X5K9C42tJcCvi4Fqo8n4yzQ7Pu8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6114e74366ff10790465255b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 12 Aug 2021 09:17:55
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1AFF5C4338A; Thu, 12 Aug 2021 09:17:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 44FCAC433D3;
        Thu, 12 Aug 2021 09:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 44FCAC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 0/3] soc: qcom: Add download mode support for QTI platforms
Date:   Thu, 12 Aug 2021 14:47:39 +0530
Message-Id: <cover.1628757036.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Collecting ramdumps on QTI platforms mainly require two things,
SDI (System Debug Image) enabled firmware and kernel support to
configure download mode cookies and SDI settings. Ramdumps can
be collected once the system enters the download mode. To enter
download mode, magic values or cookies need to be set in IMEM
which is used by firmware to decide to enter download mode or not.
Download mode cookies remain the same across targets and SDI disable
register needs to be set or SDI needs to be disabled in case of normal
reboot since ramdumps are supposed to be for crash debugging and
not for every reboot. This series adds the kernel support required
to enter download mode.

Currently this series doesn't add support for android targets where
a couple of SCM calls are required to set/unset the download mode
cookies and SDI configuration but can be easily added gradually to
the same driver, so as of now only chrome platforms are supported
and tested.

Sai Prakash Ranjan (3):
  soc: qcom: Add download mode support
  dt-bindings: msm: Add QTI download mode support binding
  arm64: dts: qcom: sc7180: Add IMEM, pil info and download mode region

 .../bindings/arm/msm/qcom,dload-mode.yaml     |  53 ++++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  21 +++
 drivers/soc/qcom/Kconfig                      |  10 ++
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/download_mode.c              | 152 ++++++++++++++++++
 6 files changed, 244 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,dload-mode.yaml
 create mode 100644 drivers/soc/qcom/download_mode.c

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

