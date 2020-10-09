Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6129328853F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 10:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732828AbgJII3R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 04:29:17 -0400
Received: from z5.mailgun.us ([104.130.96.5]:46382 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732803AbgJII3P (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 04:29:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602232155; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=uf4TnRUZvsyH9PBe5TksQ6NqIrwgHTUAWa5148sHftE=; b=ff2N/nwRs3UnfhyWTIi0v6NruH/aMuEgqQgC+AiCaWV9ykv+EVZor7T/ZeDPJJLil/kSHVZJ
 ouvaDX2g7Lrn/Rnk98cx6jYjwy+OhnMKqn4Xl90mohqstbY9Ifoyek0rRxUQ9VT89uB/s0kp
 h7lNyli5ytsoiFCotAydKghEabs=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f801f41aad2c3cd1c5820c9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Oct 2020 08:28:49
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 49108C433FF; Fri,  9 Oct 2020 08:28:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AEEABC433FF;
        Fri,  9 Oct 2020 08:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AEEABC433FF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        kishon@ti.com, balbi@kernel.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v2 0/4] Enable USB type C support on SM8150
Date:   Fri,  9 Oct 2020 01:28:39 -0700
Message-Id: <20201009082843.28503-1-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v2:
 - Added patch to fix a typo in dwc3_qcom_vbus_override_enable()
 - Modified dwc3_qcom_find_usb_connector_match() to search the child nodes for
   the connector device as well
 - Moved out the DRD switch remote endpoint from the connector node in the
   pm8150b_typec device

This series adds support for setting of the orientation multiplexor within the
QMP PHY based on the detection output from the PM8150B.  It will also introduce
a role switch in DWC3 QCOM, which is used so that the DWC3 QCOM glue can receive
role switch change events, and set the vbus override accordingly.  This event
will then be propagated down to the DWC3 core driver, by the DWC3 QCOM getting a
handle to the DWC3 core's role switch.

Wesley Cheng (4):
  arm64: boot: dts: qcom: sm8150: Add nodes for PMIC based typec
    detection
  phy: qcom-qmp: Register as a typec switch for orientation detection
  usb: dwc3: dwc3-qcom: Find USB connector and register role switch
  usb: dwc3: dwc3-qcom: Fix typo in the dwc3 vbus override API

 arch/arm64/boot/dts/qcom/sm8150-mtp.dts |  40 +++++++-
 drivers/phy/qualcomm/Kconfig            |  11 ++
 drivers/phy/qualcomm/phy-qcom-qmp.c     |  70 ++++++++++++-
 drivers/usb/dwc3/dwc3-qcom.c            | 128 ++++++++++++++++++++++--
 4 files changed, 239 insertions(+), 10 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

