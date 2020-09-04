Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4991225D370
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 10:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729683AbgIDIWx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 04:22:53 -0400
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186]:59906
        "EHLO a27-186.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726575AbgIDIWx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 04:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599207772;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
        bh=cGxakaCL3jNr682m7wuEzqoRV1+pDVo5TxIlEQKNg5Q=;
        b=kn76Vy0wMMJl0dDuntDxrZCS99IE8JwFohSOkW8vXua5/BL0pQVrWrBu/mKu84IB
        Kog17myFhlYgEwyLAw/gHktDk1I/hkXjQd4aGNxwdkNcT3hMuJpL35emcQarceUw4qi
        oVxi3esY878No7Ft/ukZLrmqt4Cgww5nfFDXQsy4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599207772;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=cGxakaCL3jNr682m7wuEzqoRV1+pDVo5TxIlEQKNg5Q=;
        b=h8KbfenD1v8ukETWbYAPXV2ShUNc3dpgSRxiNYvo8ksn3ytugjik0nCBufdIWNNe
        TTjU4onvu91F6Q6LSgeZhNtkkMqTbFmMcK+YdnWvJ7FmfrcsPZRzUhbxhl1Bwk9GNTQ
        y70uL0MvQeM/8O3HdIYucPTmlc4iyrHuDTQO+kxw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=2.0 tests=ALL_TRUSTED,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7B1BAC4339C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     sboyd@kernel.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, sergei.shtylyov@gmail.com,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v9 0/4] Introduce PMIC based USB type C detection
Date:   Fri, 4 Sep 2020 08:22:52 +0000
Message-ID: <0101017458361191-9af95c83-8a0d-4f10-b9ee-c26458c9cc1c-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.09.04-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

Wesley Cheng (4):
  usb: typec: Add QCOM PMIC typec detection driver
  dt-bindings: usb: Add Qualcomm PMIC type C controller dt-binding
  arm64: boot: dts: qcom: pm8150b: Add node for USB type C block
  arm64: boot: dts: qcom: pm8150b: Add DTS node for PMIC VBUS booster

 .../bindings/usb/qcom,pmic-typec.yaml         | 108 ++++++++
 arch/arm64/boot/dts/qcom/pm8150b.dtsi         |  13 +
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts       |   4 +
 drivers/usb/typec/Kconfig                     |  12 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/qcom-pmic-typec.c           | 262 ++++++++++++++++++
 6 files changed, 400 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
 create mode 100644 drivers/usb/typec/qcom-pmic-typec.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

