Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30CE46FFC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 14:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729630AbfGVMfx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 08:35:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:35674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728062AbfGVMfx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 08:35:53 -0400
Received: from localhost.localdomain (unknown [223.226.98.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 538BF217D4;
        Mon, 22 Jul 2019 12:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563798952;
        bh=oSGvrhvOENtQr2vmF9xUHJFiLqNbNOh8MfytEV3Eyhg=;
        h=From:To:Cc:Subject:Date:From;
        b=WtjDF5W2xRraOLEwXIZ1rv9ZFWQ+0RT2/tCAhCmF6yi/hEcd/UWAu32vKfLe4nCI/
         7MqSo28r55rmQDe230BcLcCPuT627cpgbO0WwbSbF/WgdmyLvlwAIWLULhQa4NaXes
         uOOSSJEpxMfYLK2JE/CRmp8sSN1dqDgt2GV8rT80=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: qcom: sdm845: Fix DTS warnings
Date:   Mon, 22 Jul 2019 18:04:17 +0530
Message-Id: <20190722123422.4571-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

So this is an attempt to fix some warns on sdm845 dts. We still have bunch
of warnings to fix after this series (dupplicate adress and node names
having underscores etc).

lets get long hanging ones fixed, we can see the warns with W=1 or W=2

Vinod Koul (5):
  arm64: dts: qcom: sdm845: Add unit name to soc node
  arm64: dts: qcom: sdm845: remove unnecessary properties for dsi nodes
  arm64: dts: qcom: sdm845: remove unit name for thermal trip points
  arm64: dts: qcom: sdm845: remove macro from unit name
  arm64: dts: qcom: sdm845-cheza: remove macro from unit name

 arch/arm64/boot/dts/qcom/pm8998.dtsi       |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 10 ++--
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 66 ++++++++++------------
 3 files changed, 36 insertions(+), 42 deletions(-)

Thanks
-- 
2.20.1

