Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02FEE290C40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 21:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393109AbgJPT10 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 15:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390727AbgJPT1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 15:27:24 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1FF7C0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 12:27:22 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id q21so2000903pgi.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 12:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZutnMIL/H67VpZ1xfDw9FLjDAwyBxbbGIobudgCrQiw=;
        b=ZQjOSsgcoMO2CXnhaskRO+312Zp1tq5TjmkQJljC2bw3kX+ZPV2IXzKRDk4V+yjMEY
         OpzoFsN/c/F5jFJNAnmwThYzSYjR0IHeQQ5tNjTiaBYd0ff6wi2hLkyMScSNRHF4b3I/
         MXYMr0Zp7MLr3gMMddAntXzeYVNuN83TIC100=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZutnMIL/H67VpZ1xfDw9FLjDAwyBxbbGIobudgCrQiw=;
        b=PLXIiINTXXXImHARBjVt3gQjqYgqNelnC0NdYPTLEf2v9sok0x7x14g7pSgNNC5b+F
         Y7fIICCOWi/Qhr49t7egEpsGWNOWb1dvXOPMJP+SDtE1ygUPbu1dV4fOpjLv8oGdNtD5
         GH8OC9+BI0UUKK2g1E6bMADf9W0+CEw4FYQcvNTGX2GreZtt+wJBw84SiJQ83qq6OKW1
         c9LSXAaCbYM5kObkScgPOdD8F1AuD6lvFfurBcNKcrB57TqlNPDsdGN7EoiNWl+OqW9b
         UNez3Wnx7+zy7+JhIHZVx3RgLsY6bnLjzIaaZ8Gc8YleM/PEhI8+QmL/3HhXZFDogeCv
         aDQQ==
X-Gm-Message-State: AOAM533QSSMgwkyjGSpHSuVaMdGzm23K1Qz7PU4iwRQfn0RGr5afgimk
        43q4nwt5PYljAFfRIMIDKbjNEg==
X-Google-Smtp-Source: ABdhPJzPDLW5Qh+Ws+bU1lQWYvuirtLbAiDWTvm404IMCWAvRvAa3q56OWdGjKb1in4J7nomWQ8BCQ==
X-Received: by 2002:a63:f815:: with SMTP id n21mr4540376pgh.410.1602876442423;
        Fri, 16 Oct 2020 12:27:22 -0700 (PDT)
Received: from evgreen-glaptop.cheshire.ch ([2601:646:c780:1404:a2ce:c8ff:fec4:54a3])
        by smtp.gmail.com with ESMTPSA id lb13sm3566622pjb.5.2020.10.16.12.27.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 16 Oct 2020 12:27:22 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] arm64: dts: qcom: sc7180: Add soc-specific qfprom compat string
Date:   Fri, 16 Oct 2020 12:26:52 -0700
Message-Id: <20201016122559.v2.2.Ia3b68ac843df93c692627a3a92b947b3a5785863@changeid>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201016192654.32610-1-evgreen@chromium.org>
References: <20201016192654.32610-1-evgreen@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the soc-specific compatible string so that it can be matched
more specifically now that the driver cares which SoC it's on.

Signed-off-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 6678f1e8e3958..f1f8bbc0b37bc 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -660,7 +660,7 @@ gcc: clock-controller@100000 {
 		};
 
 		qfprom: efuse@784000 {
-			compatible = "qcom,qfprom";
+			compatible = "qcom,sc7180-qfprom", "qcom,qfprom";
 			reg = <0 0x00784000 0 0x8ff>,
 			      <0 0x00780000 0 0x7a0>,
 			      <0 0x00782000 0 0x100>,
-- 
2.26.2

