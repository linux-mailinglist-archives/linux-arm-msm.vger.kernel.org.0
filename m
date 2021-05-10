Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322EE377CDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 09:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhEJHFM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 03:05:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:32796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229863AbhEJHFM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 03:05:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB70C611F1;
        Mon, 10 May 2021 07:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620630248;
        bh=tn1IyB/mPRcoVh0UNJ5HiOCI2ksqiigo+gx2BWth6QI=;
        h=From:To:Cc:Subject:Date:From;
        b=SFN6hnOWZYGXuciGptOMzErjYhp5zvVw4p8zHOZfUG0p7CSCf65AIFxY/HDDclwkz
         8G0S10XQcuAhpqPt+cJPFtVo5M40q2w4Tz32o1lmcP66vcI/cigTCWGeAttQvoAMQO
         L2es3amFLxobRSzt4GM7RXuLXbviAyYwrd9Co/ey3Bpm1Xszp8QibyT72PgFX+Y3Wa
         GzBN+MpGtGi6q5i5CTUkzdSws+wT8ZC6yIYRT5hPcrE33Nuj20p0AIyR8R2idpylM2
         WC7JSdet3uGIo0kFU7te+bu1ky5ZazzXWd0kxRqrx8cd/f59D4v3kMZ0h/0z59vMeq
         Q1ahL3jMd0Xhw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8350: use interconnect enums
Date:   Mon, 10 May 2021 12:33:59 +0530
Message-Id: <20210510070359.3837925-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add interconnect enums instead of numbers now that interconnect is in
mainline.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index ed0b51bc03ea..a8cd224a2f31 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -656,7 +656,7 @@ mpss: remoteproc@4080000 {
 					<&rpmhpd 12>;
 			power-domain-names = "load_state", "cx", "mss";
 
-			interconnects = <&mc_virt 0 &mc_virt 1>;
+			interconnects = <&mc_virt MASTER_LLCC &mc_virt SLAVE_EBI1>;
 
 			memory-region = <&pil_modem_mem>;
 
@@ -1063,7 +1063,7 @@ cdsp: remoteproc@98900000 {
 					<&rpmhpd 10>;
 			power-domain-names = "load_state", "cx", "mxc";
 
-			interconnects = <&compute_noc 1 &mc_virt 1>;
+			interconnects = <&compute_noc MASTER_CDSP_PROC &mc_virt SLAVE_EBI1>;
 
 			memory-region = <&pil_cdsp_mem>;
 
-- 
2.26.3

