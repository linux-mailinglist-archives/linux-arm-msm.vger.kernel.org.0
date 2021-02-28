Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBAB32725E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Feb 2021 14:10:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbhB1NJo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Feb 2021 08:09:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230411AbhB1NJk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Feb 2021 08:09:40 -0500
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61FA9C061756
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Feb 2021 05:08:45 -0800 (PST)
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id A070C1F55E;
        Sun, 28 Feb 2021 14:08:42 +0100 (CET)
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
Subject: [PATCH 03/11] arm64: dts: qcom: msm8996: Enlarge tcsr_mutex_regs size
Date:   Sun, 28 Feb 2021 14:08:21 +0100
Message-Id: <20210228130831.203765-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210228130831.203765-1-konrad.dybcio@somainline.org>
References: <20210228130831.203765-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Set the tcsr_mutex_regs size to 0x40000 to allow for accessing
all required registers that will be needed to support modem.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 029daa2ed53e..17a7e2a0c730 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -472,7 +472,7 @@ tsens1: thermal-sensor@4ad000 {
 
 		tcsr_mutex_regs: syscon@740000 {
 			compatible = "syscon";
-			reg = <0x00740000 0x20000>;
+			reg = <0x00740000 0x40000>;
 		};
 
 		tcsr: syscon@7a0000 {
-- 
2.30.1

