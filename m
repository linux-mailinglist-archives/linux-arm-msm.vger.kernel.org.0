Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB622962CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 18:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897361AbgJVQgk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 12:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2897355AbgJVQgk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 12:36:40 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB22C0613CE;
        Thu, 22 Oct 2020 09:36:40 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id v22so1237024ply.12;
        Thu, 22 Oct 2020 09:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nDX397cQgzi1RP7Xa1kem+DTa9TAokdNyCTIWzzUu0o=;
        b=pXYjdUUlvrho5ldzchG0lyeU5Q6V1ftioPW0uTf/tZZRqG98j2CjL49DDiWZ9rCEt9
         anfqlFejUAvnOFFQBEPt1T5OyZjZezCKi5DyZvUAK3H/kSfGqZFa4cXuh/1bWoHieNmv
         lIZJC276WWoA35g8gzVfgOxHJuV33k06s5cZhhpk36LkdQUrpqNf8nkrGOQbqWw7AUrS
         SBym7vllUO+wDk0LH38l3+NZqP+9TBrrPPXHw2nakJ26e6GMWK6VeR4/VlKa346tJZpI
         sxON8P5qZpynMXpNg4l939Un6KQToJ3C1dr7Ypy7JPL65dLAuQpwau+9EUsHw9A5h6rw
         VUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nDX397cQgzi1RP7Xa1kem+DTa9TAokdNyCTIWzzUu0o=;
        b=UhoaSu7ERwzVuNU85BzrGhFmp4biK5/KTpH3taZjCyNIJRsyoHZC90i3sZGBiYfjeD
         0/SdPMkeY4XKbtRyJCSaJTzuzVkM+Zl1/kCImn7YML3UOczM955Wh4xXqaaEUA2mxwsh
         ym9HX/1FTuwb4AhI+hu3rKASzLuHJdk2RKaxoVCy9hSuK25xzXQgRwBXtqyQF/p5AE8T
         rswgO6wM7YnIstR+IrumtwxoN1Apzy8pTkZjwdEzuxgXyq0sANO3IQBaqS81huXK9iHc
         dV7/ncAAA3CNI9l41X1HjS6T3qSJmbRxtjpH4M02TM/38/sx9DreIfY9dwcyGPwO8ghn
         GaNw==
X-Gm-Message-State: AOAM532qHU0Ge+HW1GXkMfEShkpmAALxAk2HZAMHbrfbvU2JABWoyAog
        ZQDtY1iBRC0qSRVuYqHcRRLDI7Am0o0Hdg==
X-Google-Smtp-Source: ABdhPJyyLpC5UK2zwIZgXPbUBYWPShqmVVk4l8rDynQHePrbP4vvhbq00vnT1ujOemB+Up500kqESA==
X-Received: by 2002:a17:902:654a:b029:d5:e98f:2436 with SMTP id d10-20020a170902654ab02900d5e98f2436mr3323426pln.21.1603384599163;
        Thu, 22 Oct 2020 09:36:39 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id z73sm2822004pfc.75.2020.10.22.09.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 09:36:37 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Rob Clark <robdclark@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: qcom: sc7180: Fix number of interconnect cells
Date:   Thu, 22 Oct 2020 09:38:10 -0700
Message-Id: <20201022163810.429737-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Looks like thru some sort of mid-air collision, updating the # of
interconnect cells for the display was missed.

Fixes: e23b1220a2460 ("arm64: dts: qcom: sc7180: Increase the number of interconnect cells")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 6678f1e8e3958..a02776ce77a10 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2811,7 +2811,7 @@ mdss: mdss@ae00000 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 
-			interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
+			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>;
 			interconnect-names = "mdp0-mem";
 
 			iommus = <&apps_smmu 0x800 0x2>;
-- 
2.26.2

