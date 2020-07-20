Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A6222616C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 15:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbgGTN46 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 09:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgGTN46 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 09:56:58 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D69CC0619D2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 06:56:58 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id o8so22360625wmh.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 06:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=heZQEJKtev2CQI/n8g2TDagbZY/W2wQcpaekNIFJuUs=;
        b=UF9/f6eBOh8Njql9gfXYFJNa9cLoIDysO7T58LKC2ovFVrHoCsc7xazgV09It9uUe9
         pw/4slj42pzEM8ZCk7evpiq5OO4kyomQP4AASoG8SBJ9y5XYWg6mU5L5LHGEF0WvmCrS
         XM/avfvHAms7iMT1gm+nAIQVVxR0uOnQbIc3X/PdXvYb1LKtnhAlMTa8xdNhiWfHlEm9
         R8Ng2ogVDHl0hepfpaveeFiW+2/CB+eqi0AQD7TQhZ4LD3u1rzojmUNpdL6EpiThFib6
         AE1eqXknZvxKgY+cRrKexO6fs9bloCm5B3d6PPm7glHpNefVwVpFEKcHQZ0r3Gpjb+f/
         OxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=heZQEJKtev2CQI/n8g2TDagbZY/W2wQcpaekNIFJuUs=;
        b=mnwMI6EG7v5sWSeAf2PPdyefBdo7hsN3fHa1MiweLpB4LUMGvDiYsjZiOdiaWMhwlK
         i0SsxB8A4maNgQSnVFywQ5JDiVWzxISWd1P3Z9E6TkZSOAyK9qYnUtYqsbViA8RCQlkY
         EdUWcpYTFxj+2ljwqCPC9VoSvxFBEcB4g2LNQkUR+aLiiE/KV/PTIkm+tE2mT6c38EAe
         dHVJ+kQJW2WS6cb3qSN5xK1art+aJ4oglArZMqBcoXOKv2Eo1mtbqKXfC5i37SBicqB/
         lag+nL3sF6PEp/4NSm8BZ+JifHchyNa4C3coxrHBLLlvUA4nylKjoPMy3onXCNy/mbld
         wpHA==
X-Gm-Message-State: AOAM533bMcQHup8kj0zT2Hhxsl8HFwJgavheWW7KL9k2vEG+Xj1FtsGO
        uSEDtO9gGt+FfIWXIyzXYM7M0ihXAF4=
X-Google-Smtp-Source: ABdhPJyLKFCLaaIv/lrlasEADHJ2jO6hWGktBDtzZdF3XZzsBMYFJAOYCYZiLC9vmu/KvWtMs0mjdw==
X-Received: by 2002:a1c:3142:: with SMTP id x63mr20994392wmx.62.1595253416698;
        Mon, 20 Jul 2020 06:56:56 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id d10sm32776743wrx.66.2020.07.20.06.56.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 06:56:56 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, bjorn.andersson@linaro.org,
        robh@kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v6 4/5] arch: arm64: dts: msm8996: Rename speedbin node
Date:   Mon, 20 Jul 2020 16:02:19 +0200
Message-Id: <1595253740-29466-5-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595253740-29466-1-git-send-email-loic.poulain@linaro.org>
References: <1595253740-29466-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The speedbin value blown in the efuse is used to determine is used to
determine the voltage and frequency value for different IPs, including
GPU, CPUs... So it's really not a gpu specific information.

This patch simply renames 'gpu_speed_bin' node to 'speedbin'.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9951286..2811b8c1 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -424,7 +424,7 @@
 				bits = <1 4>;
 			};
 
-			gpu_speed_bin: gpu_speed_bin@133 {
+			speedbin_efuse: speedbin@133 {
 				reg = <0x133 0x1>;
 				bits = <5 3>;
 			};
@@ -642,7 +642,7 @@
 			power-domains = <&mmcc GPU_GX_GDSC>;
 			iommus = <&adreno_smmu 0>;
 
-			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cells = <&speedbin_efuse>;
 			nvmem-cell-names = "speed_bin";
 
 			qcom,gpu-quirk-two-pass-use-wfi;
-- 
2.7.4

