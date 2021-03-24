Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E65B3475B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 11:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbhCXKTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 06:19:42 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:18694 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232218AbhCXKTP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 06:19:15 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 24 Mar 2021 03:19:14 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Mar 2021 03:19:13 -0700
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg01-blr.qualcomm.com with ESMTP; 24 Mar 2021 15:48:39 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 1F932315E; Wed, 24 Mar 2021 15:48:38 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        gregkh@linuxfoundation.org, mka@chromium.org, robh+dt@kernel.org
Cc:     linux-serial@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [RESEND PATCH V3 0/2] Separate out earlycon
Date:   Wed, 24 Mar 2021 15:48:34 +0530
Message-Id: <20210324101836.25272-1-rojay@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Resending V3 with adding Fixes and cc tag.

This patch depends on both the below patches:
interconnect: qcom: Ensure that the floor bandwidth value is enforced
interconnect: qcom: Use icc_sync_state 

Roja Rani Yarubandi (2):
  soc: qcom-geni-se: Cleanup the code to remove proxy votes
  arm64: dts: qcom: sc7180: Remove QUP-CORE ICC path

 arch/arm64/boot/dts/qcom/sc7180.dtsi  |  4 --
 drivers/soc/qcom/qcom-geni-se.c       | 74 ---------------------------
 drivers/tty/serial/qcom_geni_serial.c |  7 ---
 include/linux/qcom-geni-se.h          |  2 -
 4 files changed, 87 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

