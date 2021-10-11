Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F76F4297EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 22:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234829AbhJKUIt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 16:08:49 -0400
Received: from ixit.cz ([94.230.151.217]:50770 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234814AbhJKUIs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 16:08:48 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 48F6620064;
        Mon, 11 Oct 2021 22:06:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1633982800;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=sFSERW+c0MCFdwR7sVEFwPDbMSHIzzONuOZe7rm99XM=;
        b=DanC5hcXCtw32h3wFeYqJOUDTQ75eh96RxFxLUZyOq3XL9bQZfE+lQQy+CPJewLC/KdWjk
        CpgcjzKcGO4bppxtdMzqE79vBxMTeFepFMhWz1CfARbfWtzZh3CaeaOAtT18Zhuz6p1IeP
        U3rKQSvPTlOiHYLNGexCZAUE5HqhO+4=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        David Heidelberg <david@ixit.cz>,
        Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH] arm64: dts: qcom: sdm845-oneplus: remove devinfo-size from ramoops node
Date:   Mon, 11 Oct 2021 22:01:38 +0200
Message-Id: <20211011200138.115688-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This property doesn't exist in Linux kernel.

Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")

Reviewed-by: Caleb Connolly <caleb@connolly.tech>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index d4355522374a..dec2ac9cbb08 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -93,7 +93,6 @@ ramoops: ramoops@ac300000 {
 			console-size = <0x40000>;
 			ftrace-size = <0x40000>;
 			pmsg-size = <0x200000>;
-			devinfo-size = <0x1000>;
 			ecc-size = <16>;
 		};
 	};
-- 
2.33.0

