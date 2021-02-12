Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 712C8319DB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 12:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbhBLL44 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 06:56:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:47812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230393AbhBLL4b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 06:56:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F0F864E85;
        Fri, 12 Feb 2021 11:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613130947;
        bh=KxTKgsrMvYQ0Phr6A2o33KDZz4oR9NMMnjDgVXyBQ6g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gMfPzeOEG5DgdCZICywyQqq5ISG3YINWFTk9v4pQWulVwTFYNSpfiLx8iTiZ38z+r
         2fNIXOMaCT386GrAIlu1Rm/0OvujM996vByj0gFpx1zWrSIPegLvwVkC/xgRCJp5YR
         S+CQX2xPiqq0jGXVNjbNPzVpTlTgY9yj9W/q75HbB1byK2VPrd+TaKCycir72L/Xur
         jy/54Ep7sZDROCwfOr5kDblQiGd+htLSL9hVoxjFyG6/WvEbzUAs4nfhNpGjpGdbfD
         VGZFkNh1WWNOywdqExLkzVRmG8bED3ioHmWOdaYxeyBfkr7Znx6U7KzrG/BX6EUclB
         cJAWrFz+7tJ3g==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] arm64: dts: qcom: sm8350: Add rmtfs node
Date:   Fri, 12 Feb 2021 17:25:28 +0530
Message-Id: <20210212115532.1339942-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210212115532.1339942-1-vkoul@kernel.org>
References: <20210212115532.1339942-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the rmtfs as a reserved memory node.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 0bf5cec3a2aa..faa0d0a716e6 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -257,6 +257,16 @@ pil_modem_mem: memory@8b800000 {
 			no-map;
 		};
 
+		rmtfs_mem: memory@9b800000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0x9b800000 0x0 0x280000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
+
+
 		hyp_reserved_mem: memory@d0000000 {
 			reg = <0x0 0xd0000000 0x0 0x800000>;
 			no-map;
-- 
2.26.2

