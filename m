Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F342D3D5A91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 15:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234307AbhGZNCT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 09:02:19 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:37756 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234201AbhGZNBl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 09:01:41 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 26 Jul 2021 06:42:08 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 26 Jul 2021 06:42:06 -0700
X-QCInternal: smtphost
Received: from rajpat-linux.qualcomm.com ([10.206.21.0])
  by ironmsg02-blr.qualcomm.com with ESMTP; 26 Jul 2021 19:11:29 +0530
Received: by rajpat-linux.qualcomm.com (Postfix, from userid 2344945)
        id A8D2221255; Mon, 26 Jul 2021 19:11:28 +0530 (IST)
From:   Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, Rajesh Patil <rajpat@codeaurora.org>
Subject: [PATCH V4 0/4] Add QSPI and QUPv3 DT nodes for SC7280 SoC
Date:   Mon, 26 Jul 2021 19:10:43 +0530
Message-Id: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Roja Rani Yarubandi (4):
  arm64: dts: sc7280: Add QSPI node
  arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
  arm64: dts: sc7280: Update QUPv3 Debug UART DT node
  arm64: dts: sc7280: Add QUPv3 wrapper_1 nodes

 arch/arm64/boot/dts/qcom/sc7280-idp.dts |  133 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 3169 +++++++++++++++++++++++--------
 2 files changed, 2482 insertions(+), 820 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

