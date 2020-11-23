Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C840F2BFF9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 06:26:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgKWFXI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 00:23:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgKWFXI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 00:23:08 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0ABFC0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2020 21:23:07 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id h19so2193627otr.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2020 21:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gPB8jyEvRTDll3+OFebcmdns8Pb9GVbTpzeshP877as=;
        b=YRGdmwoRapBuPCrJ1O5mn0vg216dlKGkQAqpnvJtHLcVzMzXtUVqn85tId71tPDa1S
         DDDjE23M9OdzOveEx5dsZjpquvgJojtGXD5lx4lGmBF3i7TRN6x9VqV9wAhL+FefKH0I
         sI4g7pNTxJwIuKEJifJEo0ecyulEGf6USnhkAO2WYaNb3LXoAwbiDRA7aIvqn9R0F+H9
         HY8zhE14Z7ziqCLUf+Et3UATq+DtmHXCpx+F/A25pNQ6TjQASn7PWN4kMIygJrDcZitr
         TJtMaVqSHzYKi/F3MRz+rRDhmRUtj1qDtdv297CtCy4tRyY/WcA+tFQSE0ltG/4JfUSX
         uh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gPB8jyEvRTDll3+OFebcmdns8Pb9GVbTpzeshP877as=;
        b=atDaGhQHJOpwWuYDJHudW4ySe1BhHylmUTCrFUVpN5g85R/67pvh3euWEJeCElWqH1
         x7q0nsKVMU3g2rCj5W6BiZ6vorKsYgxVoyphLl4QiAi4im/xbDCCslEfXWCjC/1/lzi6
         LFoOm9e080RLHGhbjfh1WX27x3YSmUX/9LM3o0TJoozBPmv0mlDzdiS4YPb65S/+EDJF
         2LuPt7v118NqUGaiIW46k/8NecXU1Dtt1Wc1wsXVOgwGMbaJazULRG+6JGr4PBxj1olA
         vwJTugAEh2+hY7l5TPoZ7lxeDuuvaAbP0diUQIZlLo0skEbmbicYmdT8jdTKEnCl3xLy
         DeQA==
X-Gm-Message-State: AOAM531pmlL+is551H0Jet2Dh6p71Ru7iKmLJ1j9nHuhyuTpKWcQsyVB
        dha35EkwEsp7YhkGiwlwdbzsdg==
X-Google-Smtp-Source: ABdhPJxSoWQnnis0JVovc038X7lf89ULCBchfIIeB7gvEtTKOVbx6s42eh5zn0EwBmmP/ifbdKV9zA==
X-Received: by 2002:a9d:7cc1:: with SMTP id r1mr2414805otn.37.1606108987282;
        Sun, 22 Nov 2020 21:23:07 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u10sm6412316otj.31.2020.11.22.21.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 21:23:06 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Alex Elder <elder@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sdm845: Limit ipa iommu streams
Date:   Sun, 22 Nov 2020 23:23:05 -0600
Message-Id: <20201123052305.157686-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Android and Windows firmware does not accept the use of 3 as a mask
to cover the IPA streams. But with 0x721 being related to WiFi and 0x723
being unsed the mapping can be reduced to just cover 0x720 and 0x722,
which is accepted.

Fixes: e9e89c45bfeb ("arm64: dts: sdm845: add IPA iommus property")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 0da27b065761..a6147bd54cdf 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2136,7 +2136,8 @@ ufs_mem_phy_lanes: lanes@1d87400 {
 		ipa: ipa@1e40000 {
 			compatible = "qcom,sdm845-ipa";
 
-			iommus = <&apps_smmu 0x720 0x3>;
+			iommus = <&apps_smmu 0x720 0x0>,
+				 <&apps_smmu 0x722 0x0>;
 			reg = <0 0x1e40000 0 0x7000>,
 			      <0 0x1e47000 0 0x2000>,
 			      <0 0x1e04000 0 0x2c000>;
-- 
2.29.2

