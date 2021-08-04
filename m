Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC093E09C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 23:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239962AbhHDVCk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 17:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240008AbhHDVCj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 17:02:39 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCA1C061798
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Aug 2021 14:02:22 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id z3so2913108ile.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Aug 2021 14:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GAu8p3tjcesj9ZyybBwKeN/jK2mgfz8zSdEerPn6tnU=;
        b=z1zArIZFGyTmlE8814DCuSz/67i54nj56oZbf8w0ApKZEXhoFwSJv6Pk1HeNsH8d4o
         vvPlYadKMU/zjR/obYqS69yRuc6HJn9He4NY3m06vVmcVW6C1yzcYwN5a8Pl5+pjSJh0
         PstfNXx/2IXxcd3JlfGk1yHcl3eailMZaybSZgCw8BahzHAZPiXBm19pDCAleYrXrSb6
         WNKQimFgV6vcY7p56MrygixapbJO7/aub86P4ldYU3vcxxATo8HaLWb5oE5KZCiD+QFk
         pX9BH6yiS675HpRSqRmu2nlStBUuv15Q5OFnq6JKf08hu94I99Ftzn+LHyWeNa3iWaXv
         jtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GAu8p3tjcesj9ZyybBwKeN/jK2mgfz8zSdEerPn6tnU=;
        b=l6erVegPuu5ZzOj+O/sd0asZuVbXMLaaVnOhnGwwfkOck1ka6MkJYefL6SJf5k5kND
         bK3tIFjkMvVS5rXQXCQF3UFqwyGh9a5I56wfZsnq4abO5Hm5I24IRtYz81hgzvCLAj4z
         ffD/fBbsKWFkOax6s5yXgvPaiUNwHBC6hiY1S8r76vrNdAszaRTspQi+x/o0FFCiViYe
         T4ltoxBJ8rkvaP5THWCA5ZbTci/p2QVIlDVyaf+yUwUl1EKZFdZHEDmIH/ynBfgnycIg
         2hFvVEGEmPWhRaqyoDxYcfgw0riP3nwA4TxHyuBAXaLisRf/WabMa9451DQF2AluAC0G
         WCoQ==
X-Gm-Message-State: AOAM5335Q6wU0FbNWGKCZHX0ktWL+wFqzDMPgVDyF4i/8ZdMm0FjdFwK
        OV6Uhknn4XaKeBuvId+AS2DU1Q==
X-Google-Smtp-Source: ABdhPJy98vvmzjTpgGFOJCBn3onNvtO3ZY488DPqIqJMIfHhpAjcR/EXFN6lyws1OrGSArZHa32igA==
X-Received: by 2002:a92:6909:: with SMTP id e9mr748365ilc.231.1628110941870;
        Wed, 04 Aug 2021 14:02:21 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id d18sm1687396ile.32.2021.08.04.14.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 14:02:21 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     robh+dt@kernel.org, elder@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: qcom: sm8350: fix IPA interconnects
Date:   Wed,  4 Aug 2021 16:02:14 -0500
Message-Id: <20210804210214.1891755-5-elder@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210804210214.1891755-1-elder@linaro.org>
References: <20210804210214.1891755-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There should only be two interconnects defined for IPA on the
QUalcomm SM8350 SoC.  The names should also match those specified by
the IPA Device Tree binding.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index a631d58166b1c..01f60a3bd1c14 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -666,12 +666,10 @@ ipa: ipa@1e40000 {
 			clocks = <&rpmhcc RPMH_IPA_CLK>;
 			clock-names = "core";
 
-			interconnects = <&aggre2_noc MASTER_IPA &gem_noc SLAVE_LLCC>,
-					<&mc_virt MASTER_LLCC &mc_virt SLAVE_EBI1>,
+			interconnects = <&aggre2_noc MASTER_IPA &mc_virt SLAVE_EBI1>,
 					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_IPA_CFG>;
-			interconnect-names = "ipa_to_llcc",
-					     "llcc_to_ebi1",
-					     "appss_to_ipa";
+			interconnect-names = "memory",
+					     "config";
 
 			qcom,smem-states = <&ipa_smp2p_out 0>,
 					   <&ipa_smp2p_out 1>;
-- 
2.27.0

