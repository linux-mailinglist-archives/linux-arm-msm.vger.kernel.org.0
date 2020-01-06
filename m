Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F63A13107C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 11:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbgAFKXY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 05:23:24 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34348 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgAFKXY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 05:23:24 -0500
Received: by mail-lj1-f195.google.com with SMTP id z22so45585424ljg.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 02:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=B0/5oZmpyMpvoGdHibbnECdx+O3YaUpB8rzrVDmAk5M=;
        b=clEtWmbh+qaBqe+He2QKgbhvUT/cLCZyyQvw1JRHZwX93MLJhhwpKITQs2A86cqhDK
         R1FVH3Ul0Epai3TWrb4TBgeDApCtrRqtdL5z8uviLVawFn6h7LD1wEOhyhOIhlJoZWyG
         buJC+IMocTB2ZqduPh8Ae++DtZq6endywr62f5VL1SbHV1XCSI2dyK8w4+9Yk9uG5WDb
         1Obk37dnPqbEtjqDAQgg0HhbuiXjnk6PYm+xXNoz2bL+jcHaEC3T00YId8Qw8DL5WOMP
         xsY5IV8vtZQBkiunVu9CGDBU3/AYduXDd5o+PUcvSUcIKORFetRxY32ZvJswqfqff3ns
         sqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=B0/5oZmpyMpvoGdHibbnECdx+O3YaUpB8rzrVDmAk5M=;
        b=m/CvjDGUs+NbH1D8unapqYqPFxDmki1Y6zoLymaVr1jOwVBwoVg8xBp/YUFip3pjAY
         SrV2TkNd7k04eo/ePVGAcntSUhT1eV1N1/KUmpb2IUC6jkLIInCOOqGBCdx8tKUjM4UY
         zQgOLZyQQCasaMSgkO7ywqG+gff/5YmVgT969maE1iS0p7/2jrH1X4/1bg3TdfLitIGJ
         USIaZLz440BBwNLfH7qr3X+oUgFcfgNqG93GRuz3RyVfF4h87PLdUKOu3IKW3oLgorFj
         h2ad15fJyfBMCSaLEyJkZLtBr1EHnUkYt4w/cQ5oRB5mtgSJojLD04lb7fwd4YvGCtfi
         /iiw==
X-Gm-Message-State: APjAAAXlc9zcJ73irY9Ipw+q5uOiqzo/Xv+kA4EFnsVRcKMMlPpRh+ZV
        g7ZoNaU7KhptG4qXq2IZyGRZa7Kzfgc=
X-Google-Smtp-Source: APXvYqylp5NiLHXERz7acxYKyV5J6DD2bC3iTYDcgMA9NVOGybslb4wcRBjNRaJF/9+lKu8tR223bA==
X-Received: by 2002:a2e:8954:: with SMTP id b20mr44715875ljk.27.1578306202203;
        Mon, 06 Jan 2020 02:23:22 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id u25sm28836745lfk.46.2020.01.06.02.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 02:23:21 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] arm64: dts: qcom: msm8996: Fix venus iommu nodename error
Date:   Mon,  6 Jan 2020 12:23:05 +0200
Message-Id: <20200106102305.27059-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the following error/warn seen with make dtbs_check

arm,smmu-venus@d40000: $nodename:0: 'arm,smmu-venus@d40000' does not match '^iommu@[0-9a-f]*'
arm,smmu-venus@d40000: clock-names:0: 'bus' was expected
arm,smmu-venus@d40000: clock-names:1: 'iface' was expected

by rename nodename to "iommu".

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 4ca2e7b44559..9bbcee31f28b 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2267,7 +2267,7 @@
 			};
 		};
 
-		venus_smmu: arm,smmu-venus@d40000 {
+		venus_smmu: iommu@d40000 {
 			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
 			reg = <0xd40000 0x20000>;
 			#global-interrupts = <1>;
-- 
2.17.1

