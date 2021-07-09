Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 441553C2A07
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 22:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbhGIUIM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 16:08:12 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:14207 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbhGIUIM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 16:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1625861129; x=1657397129;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6VbkGf73RHLTU7s7+HE1+iy91+VQ4e2qQFQ8XMbpZUI=;
  b=On37EXpZt/yN0OglkZm9MSFrz3p1b7DRAiWZCM+rcqOzj+cnfBYLnCdb
   RgI7LxLxDvgLVl5tQ3tkHlPHkbVvLy397aSrrc+l9r/fuCPhkV6wjX9ei
   O3nCF4ljlSn7riJJaTbvFCOaQd+ugnnOF1LMqnU1lj3GrCkfiv7Puu2uO
   I=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 09 Jul 2021 13:05:28 -0700
X-QCInternal: smtphost
Received: from nalasexr03e.na.qualcomm.com ([10.49.195.114])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Jul 2021 13:05:27 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nalasexr03e.na.qualcomm.com (10.49.195.114) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Fri, 9 Jul 2021 13:05:27 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <robh+dt@kernel.org>,
        <bjorn.andersson@linaro.org>, <linus.walleij@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>,
        "Vamsi Krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH 0/2] Add devicetree support for SDX65 Modem and MTP
Date:   Fri, 9 Jul 2021 13:05:04 -0700
Message-ID: <20210709200506.20046-1-quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03c.na.qualcomm.com (10.85.0.106) To
 nalasexr03e.na.qualcomm.com (10.49.195.114)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>

Hello,

This series adds devicetree support for Qualcomm SDX65 platform and MTP
board. This series functionally depends on Pdc, GCC and RPMh Clock support
series [1] which is under review.

With this current devicetree support, the MTP can boot into initramfs
shell.

Thanks,
Vamsi 

Vamsi krishna Lanka (2):
  dt-bindings: arm: qcom: Document SDX65 platform and boards
  ARM: dts: qcom: Add SDX65 platform and MTP board support

 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 arch/arm/boot/dts/Makefile                    |   3 +-
 arch/arm/boot/dts/qcom-sdx65-mtp.dts          |  25 ++
 arch/arm/boot/dts/qcom-sdx65.dtsi             | 215 ++++++++++++++++++
 4 files changed, 248 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/qcom-sdx65-mtp.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx65.dtsi

-- 
2.32.0

