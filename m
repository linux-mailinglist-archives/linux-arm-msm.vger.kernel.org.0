Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3D1317904B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 13:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387910AbgCDMY1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 07:24:27 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:44453 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387776AbgCDMY1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 07:24:27 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Mar 2020 17:54:24 +0530
Received: from c-rkambl-linux1.qualcomm.com ([10.242.50.190])
  by ironmsg02-blr.qualcomm.com with ESMTP; 04 Mar 2020 17:54:06 +0530
Received: by c-rkambl-linux1.qualcomm.com (Postfix, from userid 2344811)
        id 5A18C3A8B; Wed,  4 Mar 2020 17:54:05 +0530 (IST)
From:   Rajeshwari <rkambl@codeaurora.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sanm@codeaurora.org,
        sivaa@codeaurora.org, Rajeshwari <rkambl@codeaurora.org>
Subject: [PATCH 0/1] Added critical trip point Thermal-zones node
Date:   Wed,  4 Mar 2020 17:53:54 +0530
Message-Id: <1583324635-8271-1-git-send-email-rkambl@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes:
* Added critical trip point to all non CPU sensors.

Rajeshwari (1):
  arm64: dts: qcom: sc7180: Added critical trip point Thermal-zones node

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 78 ++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

