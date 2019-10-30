Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F189FE96EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2019 07:59:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbfJ3G7y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Oct 2019 02:59:54 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:46093 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725855AbfJ3G7y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Oct 2019 02:59:54 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 Oct 2019 12:29:48 +0530
IronPort-SDR: B3QLUhbGcpchTBN3lrxQuGsYvGzXJ7osheU6RoEwXzlW1vPpJ7q+zEnus6YPJmBA6KbkWR+tNB
 O5998wn/7a1KT2/RXsr5/zY7tbHvw62/FJXlzWFcBfobjH7MGmdOypSaY/DVKP18LkIpjZVp6U
 hjQ76kUPclOnu68SEKm6y3qOzkf6pLWCUcldLvkjMhvd0RxCilhD/TIMwYdFfvjlyZ8MpwxWuz
 BlTHn0IsQ6/+JsqRrSTZaWaaLJA0uIVGO6I8I+XDR7FI+PFzq/IQEhLtKDiZ/2eATwnJYL4k35
 D3kVHeRNgYe4M9dVLI/QVQKF
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 30 Oct 2019 12:29:33 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 6779A19C1; Wed, 30 Oct 2019 12:29:32 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH 0/2] Add QMP V3 USB3 PHY support for SC7180
Date:   Wed, 30 Oct 2019 12:25:42 +0530
Message-Id: <1572418544-11593-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add QMP V3 USB3 PHY entries for SC7180 in phy driver and
device tree bindings

Sandeep Maheswaram (2):
  phy: qcom-qmp: Add QMP V3 USB3 PHY support for SC7180
  dt-bindings: phy-qcom-qmp: Add SC7180 QMP phy support

 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 11 +++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp.c                    |  5 ++++-
 2 files changed, 13 insertions(+), 3 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

