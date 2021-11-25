Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC0945DC2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 15:18:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355644AbhKYOVK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 09:21:10 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:57153 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355646AbhKYOTK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 09:19:10 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 25 Nov 2021 06:15:58 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 Nov 2021 06:15:57 -0800
X-QCInternal: smtphost
Received: from ekangupt-linux.qualcomm.com ([10.204.67.11])
  by ironmsg02-blr.qualcomm.com with ESMTP; 25 Nov 2021 19:45:51 +0530
Received: by ekangupt-linux.qualcomm.com (Postfix, from userid 2319895)
        id E84F244D8; Thu, 25 Nov 2021 19:45:50 +0530 (IST)
From:   Jeya R <jeyr@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org
Cc:     Jeya R <jeyr@codeaurora.org>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: [PATCH 0/5] Add secure domains support
Date:   Thu, 25 Nov 2021 19:45:39 +0530
Message-Id: <1637849744-24844-1-git-send-email-jeyr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds secure domains support. If the non-secure DT property
is not added to the domain fastrpc DT node, the domain is set as secure. If
any process is getting initialized using non-secure device and the dsp channel
is secure, then the session gets rejected.

Jeya R (5):
  dt-bindings: misc: convert fastrpc bindings to yaml and add property
  misc: fastrpc: Add secure device node support
  misc: fastrpc: Set channel as secure
  misc: fastrpc: reject non-secure node for secure domain
  arm64: dts: qcom: add non-secure domain property to fastrpc nodes

 .../devicetree/bindings/misc/qcom,fastrpc.txt      | 78 -----------------
 .../devicetree/bindings/misc/qcom,fastrpc.yaml     | 97 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  3 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  3 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  3 +
 drivers/misc/fastrpc.c                             | 51 +++++++++++-
 8 files changed, 158 insertions(+), 80 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
 create mode 100644 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml

-- 
2.7.4

