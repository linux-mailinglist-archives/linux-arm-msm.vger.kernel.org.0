Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA0592F0185
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 17:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbhAIQa7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 11:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbhAIQa7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 11:30:59 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1639C06179F
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Jan 2021 08:30:18 -0800 (PST)
Received: from localhost.localdomain (abaf53.neoplus.adsl.tpnet.pl [83.6.169.53])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 6EE9E3E7C1;
        Sat,  9 Jan 2021 17:30:16 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] MSM8998 DTS updates
Date:   Sat,  9 Jan 2021 17:29:54 +0100
Message-Id: <20210109163001.146867-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series brings some minor, but important fixes to the MSM8998
DTSI, including renaming I2C hosts to match the correct scheme, adding DMA
to them, merging the -pins.dtsi into the main one and adding capacity-dmips-mhz
to CPU cores. Some components were also disabled by default (with no functional
difference for already existing boards, they were re-enabled over there) to account
for less liberal firmware configurations present on some, if not most mobile phones.

Konrad Dybcio (5):
  arm64: dts: qcom: msm8998: Merge in msm8998-pins.dtsi to msm8998.dtsi
  arm64: dts: qcom: msm8998: Add DMA to I2C hosts
  arm64: dts: qcom: msm8998: Add I2C pinctrl and fix BLSP2_I2C naming
  arm64: dts: qcom: msm8998: Add capacity-dmips-mhz to CPU cores
  arm64: dts: qcom: msm8998: Disable some components by default

 .../boot/dts/qcom/msm8998-clamshell.dtsi      |  16 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     |  10 +
 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi    | 108 -----
 arch/arm64/boot/dts/qcom/msm8998.dtsi         | 373 +++++++++++++++++-
 4 files changed, 390 insertions(+), 117 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi

-- 
2.29.2

