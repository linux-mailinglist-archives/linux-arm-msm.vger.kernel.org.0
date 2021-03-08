Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D46D83307E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234743AbhCHGJ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:09:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:44686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234709AbhCHGJR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:09:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6548064FBD;
        Mon,  8 Mar 2021 06:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183756;
        bh=CyYABHcD+oFrjW3nuRNYFDZ69jT+/uhmTq3OrHJnZ7M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KeclcJYH6RmXmaILYyGjqhBSONeVh06PFd+XuAq0sbeEZMOMAIsKomQE8QBMe16RH
         ARKLKs2x1Z4SgFA7gvs/DjKurxJ6sS8rc8Y/QJmW+z9lxcxKGUtyEM/35hxjUICmDM
         5CmzAFwwV5kEff0iHpnRm4VjcS/0VxlpmOkTRCWOH+LnOqC013lcA9Hv7qS0H0ywMP
         R6nN3waxeVWbNz8wPGomWDa63jX807ulFtfJZTl9oedXNbdviLHcvj917d8MuUob7Z
         69t/02i6u40T+JFz1MGyOJ1OdY39j1cLA63J/rEZLJvlNIAh56hfUou3wDUl12ULoQ
         PwnEK9yhvztNw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 13/18] arm64: qcom: msm8998: don't use empty memory node
Date:   Mon,  8 Mar 2021 11:38:21 +0530
Message-Id: <20210308060826.3074234-14-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308060826.3074234-1-vkoul@kernel.org>
References: <20210308060826.3074234-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We expect bootloader to full memory details but passing empty values
can give warning, so add a default value

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 1f2e93aa6553..2949be4740f1 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -18,10 +18,10 @@ / {
 
 	chosen { };
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the reg */
-		reg = <0 0 0 0>;
+		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
 	reserved-memory {
-- 
2.26.2

