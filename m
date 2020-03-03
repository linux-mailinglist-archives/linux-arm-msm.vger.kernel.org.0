Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6DA717722C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 10:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgCCJRC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 04:17:02 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:55025 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727604AbgCCJRB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 04:17:01 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Mar 2020 14:46:58 +0530
Received: from c-rkambl-linux1.qualcomm.com ([10.242.50.190])
  by ironmsg01-blr.qualcomm.com with ESMTP; 03 Mar 2020 14:46:46 +0530
Received: by c-rkambl-linux1.qualcomm.com (Postfix, from userid 2344811)
        id B466F3683; Tue,  3 Mar 2020 14:46:45 +0530 (IST)
From:   Rajeshwari <rkambl@codeaurora.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sanm@codeaurora.org,
        sivaa@codeaurora.org, Rajeshwari <rkambl@codeaurora.org>
Subject: [PATCH 0/1] Changed all sensor values Thermal-zones node
Date:   Tue,  3 Mar 2020 14:46:35 +0530
Message-Id: <1583226996-24747-1-git-send-email-rkambl@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes:
* changed threshold values to 110C
* changed trip point to critical

Rajeshwari (1):
  arm64: dts: qcom: sc7180: Changed all sensor values Thermal-zones node

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 52 ++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

