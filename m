Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 037E4287F4E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 01:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729689AbgJHX7y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 19:59:54 -0400
Received: from z5.mailgun.us ([104.130.96.5]:57238 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729398AbgJHX7y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 19:59:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602201593; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=iMZsobu4errj1Xerzmr09tWrD5DMJzqIEKBDLcR17/I=; b=Lzn9gSVRemlpuCNHPXTtoxZAvspeRCKdKxJ716HRKOtA8VFps+vxtUPP44NuyxTCh2IHlqf6
 +71JoHkKMf462BVFEd9zOB+knJORSgXRZU8xlDBFYvdyZL+RoQY2sNMGed9IDrV2G+Kcxgxp
 TCrhpXL8HV840tFPSQcas27iFqw=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f7fa7edd6d00c7a9e28beb7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Oct 2020 23:59:40
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E421FC433B2; Thu,  8 Oct 2020 23:59:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4FE3CC433FE;
        Thu,  8 Oct 2020 23:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4FE3CC433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     sboyd@kernel.org, heikki.krogerus@linux.intel.com,
        agross@kernel.org, robh+dt@kernel.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, sergei.shtylyov@gmail.com,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v10 0/4] Introduce PMIC based USB type C detection
Date:   Thu,  8 Oct 2020 16:59:30 -0700
Message-Id: <20201008235934.8931-1-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v10:
 - Modified the type c dt-binding to remove the DRD switch node outside of the
   connector, as it is more of a SW entity, whereas the USB connector model
   focuses more on how the connector pins are connected in the HW design.  The
   binding now matches what is specified in the usb-connector binding.
 - Change the fwnode to search for the remote endpoint referencing the usb role
   switch device in qcom-pmic-typec
 - Rename typec node from "typec" to "usb-typec"

Changes in v9:
 - Fixed dt-binding to reference usb-connector from the 'connector' node,
   removed properties that didn't have further constraints (than specified in
   usb-connector.yaml), and make 'reg' a required property.
 - Moved vbus_reg get call into probe(), and will fail if the regulator is not
   available.
 - Removed some references from qcom_pmic_typec, as they were not needed after
   probe().
 - Moved interrupt registration until after all used variables were initialized.

Changes in v8:
 - Simplified some property definitions, and corrected the
   connector reference in the dt binding.

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

 .../bindings/usb/qcom,pmic-typec.yaml         | 115 ++++++++
 arch/arm64/boot/dts/qcom/pm8150b.dtsi         |  13 +
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts       |   4 +
 drivers/usb/typec/Kconfig                     |  12 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/qcom-pmic-typec.c           | 262 ++++++++++++++++++
 6 files changed, 407 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
 create mode 100644 drivers/usb/typec/qcom-pmic-typec.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

