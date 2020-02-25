Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3DC16EAAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 17:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729189AbgBYQA1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 11:00:27 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:14417 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730275AbgBYQA1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 11:00:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582646426; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=zeDEzoojLU88NbBHozItxRJyl9qy5f1LSm9zWMnLSUk=; b=MkdU0778HeLja99eyuT/rxX/lSK3pZ3sS8xR8TSJI8P96tyz57ZEFk02H+3CZv4loANPFVWn
 WVrpHLDy0vS71Z/rZgdV2q/s4eJfo2LSZBN0faguYvLgTMpqzQWSi1ADYyVMsAObituoi+23
 Wa6uCvQRaquh9XuQNALKXbfOg54=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e55447e.7fc04c639b20-smtp-out-n01;
 Tue, 25 Feb 2020 15:59:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 87F86C447A3; Tue, 25 Feb 2020 15:59:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from okukatla1-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: okukatla)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0029FC43383;
        Tue, 25 Feb 2020 15:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0029FC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=okukatla@codeaurora.org
From:   Odelu Kukatla <okukatla@codeaurora.org>
To:     georgi.djakov@linaro.org, daidavid1@codeaurora.org,
        bjorn.andersson@linaro.org, evgreen@google.com
Cc:     sboyd@kernel.org, ilina@codeaurora.org, seansw@qti.qualcomm.com,
        elder@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org,
        Odelu Kukatla <okukatla@codeaurora.org>
Subject: [V4, 0/3] Add SC7180 interconnect provider driver
Date:   Tue, 25 Feb 2020 21:29:41 +0530
Message-Id: <1582646384-1458-1-git-send-email-okukatla@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add driver to support scaling of the on-chip interconnects on
the SC7180-based platforms.

Depends-on: Split SDM845 interconnect nodes and consolidate RPMh support
Depends-on: Add device tree support for sc7180

Odelu Kukatla (3):
  dt-bindings: interconnect: Add Qualcomm SC7180 DT bindings
  interconnect: qcom: Add SC7180 interconnect provider driver
  arm64: dts: sc7180: Add interconnect provider DT nodes

 .../bindings/interconnect/qcom,sc7180.yaml         |  85 +++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  95 +++
 drivers/interconnect/qcom/Kconfig                  |   9 +
 drivers/interconnect/qcom/Makefile                 |   2 +
 drivers/interconnect/qcom/sc7180.c                 | 641 +++++++++++++++++++++
 drivers/interconnect/qcom/sc7180.h                 | 149 +++++
 include/dt-bindings/interconnect/qcom,sc7180.h     | 161 ++++++
 7 files changed, 1142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sc7180.yaml
 create mode 100644 drivers/interconnect/qcom/sc7180.c
 create mode 100644 drivers/interconnect/qcom/sc7180.h
 create mode 100644 include/dt-bindings/interconnect/qcom,sc7180.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
