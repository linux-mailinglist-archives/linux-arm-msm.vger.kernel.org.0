Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E918B39BA58
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 15:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbhFDN5N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 09:57:13 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:40637 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbhFDN5N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 09:57:13 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 04 Jun 2021 06:55:27 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Jun 2021 06:55:25 -0700
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg02-blr.qualcomm.com with ESMTP; 04 Jun 2021 19:24:57 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id C8C1D3308; Fri,  4 Jun 2021 19:24:55 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH V3 0/3] Add QSPI and QUPv3 DT nodes for SC7280 SoC
Date:   Fri,  4 Jun 2021 19:24:36 +0530
Message-Id: <20210604135439.19119-1-rojay@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Broken the huge V2 patch into 3 smaller patches.

Roja Rani Yarubandi (3):
  arm64: dts: sc7280: Add QSPI node
  arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
  arm64: dts: sc7280: Add QUPv3 wrapper_1 nodes

This patch depends on interconnect change [1]
[1] https://lore.kernel.org/patchwork/patch/1392104/

 arch/arm64/boot/dts/qcom/sc7280-idp.dts |  130 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 2726 ++++++++++++++++++-----
 2 files changed, 2262 insertions(+), 594 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

