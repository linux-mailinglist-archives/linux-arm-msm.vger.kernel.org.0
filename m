Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E77F23307E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234745AbhCHGJ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:09:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:44692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234710AbhCHGJU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:09:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82F5964FBA;
        Mon,  8 Mar 2021 06:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183760;
        bh=+bXlc/A/yPfGU2TZ/R9MvtWoPwCi6wOyfKT8DOhfuhk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R0VzWD+KKfQdlGm0dySytSy/dwxHGlBQ9uYmhaDfUoVFVFpE0OoNS3CK9Vvv7/AHa
         Aj2iLTTFCFkP+vD5sRt0gsA7p48JvxzJv1WwfQJhiyQG1z6YqD1ZWLcfyfdBTnrTh5
         BwUqiapz7zzc+egW2Q0Pqss0potDBZn2SlrfPmRxtRcFHswuCnR65TCSpuxEHngyN/
         QAVl3HL/fbP0O5EVaBiiUzN4/nDSyWIPSwX2OLhaBBvWjNIMyXyaPRlf6KjaC7oXwu
         HO2e4eg+oWlVaiG+d3+mimkfR62POnyZ53YwoyhFgfSU7YtPyB9Qer0eDeH7RAD6DD
         NzUX99lC6dnUg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/18] arm64: qcom: sdm630: don't use empty memory node
Date:   Mon,  8 Mar 2021 11:38:22 +0530
Message-Id: <20210308060826.3074234-15-vkoul@kernel.org>
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
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 5a7cf85d0cf1..23679b9e5e60 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -311,10 +311,10 @@ scm {
 		};
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the reg */
-		reg = <0 0 0 0>;
+		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
 	pmu {
-- 
2.26.2

