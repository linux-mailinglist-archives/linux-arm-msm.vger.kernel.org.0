Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459F023B1CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 02:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgHDAqB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Aug 2020 20:46:01 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:26165 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728491AbgHDAqA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Aug 2020 20:46:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596501960; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=ugWW4SrG6TXCYnsKQHSW74f4XqUdJSZE/gMvulBquC4=; b=HauOnerJO+9Fb+w+ebVrDtg3LtcV3FKnk9dyfL3LzbvvXzKq7mbNMfF2+JLu+d6dY54jtMWO
 2L6SD8jZxVx7DpOsueU/wpFbAO0dhbUHZXqM0YEk92qk31HXsUR4IdcCnxFGJI+1iwapONnZ
 DDXkCdzUl47Y480RSVlcWB+T18Q=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f28afb2f89b692ba234fc4a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Aug 2020 00:45:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6F051C43395; Tue,  4 Aug 2020 00:45:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4241EC433C6;
        Tue,  4 Aug 2020 00:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4241EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     robh+dt@kernel.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, sboyd@kernel.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v7 0/4] Introduce PMIC based USB type C detection
Date:   Mon,  3 Aug 2020 17:45:19 -0700
Message-Id: <20200804004523.7964-1-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v7:
 - Fixups in qcom-pmic-typec.c to remove uncesscary includes, printk formatting,
   and revising some logic operations. 

Changes in v6:
 - Removed qcom_usb_vbus-regulator.c and qcom,usb-vbus-regulator.yaml from the
   series as they have been merged on regulator.git
 - Added separate references to the usb-connector.yaml in qcom,pmic-typec.yaml
   instead of referencing the entire schema.

Changes in v5:
 - Fix dt_binding_check warning/error in qcom,pmic-typec.yaml

Changes in v4:
 - Modified qcom,pmic-typec binding to include the SS mux and the DRD remote
   endpoint nodes underneath port@1, which is assigned to the SSUSB path
   according to usb-connector
 - Added usb-connector reference to the typec dt-binding
 - Added tags to the usb type c and vbus nodes
 - Removed "qcom" tags from type c and vbus nodes
 - Modified Kconfig module name, and removed module alias from the typec driver
 
Changes in v3:
 - Fix driver reference to match driver name in Kconfig for
   qcom_usb_vbus-regulator.c
 - Utilize regulator bitmap helpers for enable, disable and is enabled calls in
   qcom_usb_vbus-regulator.c
 - Use of_get_regulator_init_data() to initialize regulator init data, and to
   set constraints in qcom_usb_vbus-regulator.c
 - Remove the need for a local device structure in the vbus regulator driver
 
Changes in v2:
 - Use devm_kzalloc() in qcom_pmic_typec_probe()
 - Add checks to make sure return value of typec_find_port_power_role() is
   valid
 - Added a VBUS output regulator driver, which will be used by the PMIC USB
   type c driver to enable/disable the source
 - Added logic to control vbus source from the PMIC type c driver when
   UFP/DFP is detected
 - Added dt-binding for this new regulator driver
 - Fixed Kconfig typec notation to match others
 - Leave type C block disabled until enabled by a platform DTS

Add the required drivers for implementing type C orientation and role
detection using the Qualcomm PMIC.  Currently, PMICs such as the PM8150B
have an integrated type C block, which can be utilized for this.  This
series adds the dt-binding, PMIC type C driver, and DTS nodes.

The PMIC type C driver will register itself as a type C port w/ a
registered type C switch for orientation, and will fetch a USB role switch
handle for the role notifications.  It will also have the ability to enable
the VBUS output to any connected devices based on if the device is behaving
as a UFP or DFP.

Wesley Cheng (4):
  usb: typec: Add QCOM PMIC typec detection driver
  dt-bindings: usb: Add Qualcomm PMIC type C controller dt-binding
  arm64: boot: dts: qcom: pm8150b: Add node for USB type C block
  arm64: boot: dts: qcom: pm8150b: Add DTS node for PMIC VBUS booster

 .../bindings/usb/qcom,pmic-typec.yaml         | 131 +++++++++
 arch/arm64/boot/dts/qcom/pm8150b.dtsi         |  13 +
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts       |   4 +
 drivers/usb/typec/Kconfig                     |  12 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/qcom-pmic-typec.c           | 272 ++++++++++++++++++
 6 files changed, 433 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
 create mode 100644 drivers/usb/typec/qcom-pmic-typec.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

