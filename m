Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24BAD3DEAAC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 12:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235058AbhHCKRN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 06:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235180AbhHCKRM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 06:17:12 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F22DCC0613D5
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Aug 2021 03:17:01 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id l4so27538684ljq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Aug 2021 03:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FsJoAIH4S+RjxCze2qp1zowJ52+FjRKDga6SkA/wG7k=;
        b=LI7tJOw368lOtxk+BRWyUom00ThyfKPx+XDNzofm7fmO6RGEQECfSzHmHJkQhjP24d
         aCA4+r11pGpT4HzFt/iwysrxYgYmkskZIsrCHVRxv2YM/z7IaSJJezhFbGBoKIZTyIIb
         HJ6OYSWmZERyJF/Gz52hs/U/jujxTpKLzmym8lzhcLWjqEQ2JpOLavGO4M3lmqpaDk30
         CJHTUlnUx3l4ORLkK6q29dAcnJUStsJq0DZETuAv66iOTPl3hzPnsnQCNLmla/ANP0YE
         KCPMzb8ffZVKYdM2Kg8cPWjZxs4MLdKLg2yUYtcIVEnuuxO9IMxvTsbrPTCRyKBkAiSs
         GaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FsJoAIH4S+RjxCze2qp1zowJ52+FjRKDga6SkA/wG7k=;
        b=EKf/trIxAsKEoJMS5VYkdqrCuKc+uan4hiXseAPAUlnnREJa1+m5QcWZWGqrzjzKc1
         wHuK4ajpRuZUF2HV0/3uCpVoHemFoJXEE295PDK8w6iXPoGUpCWvl3lpjTQ5OKfVa4lM
         q7eRlxAOu4MOnTy7RDZvlCqPrMxshGRmtCuC41nVQKR2CCBuTy5fOgu/Fd2LgMvI2aY+
         4jureVMo7qeP+Nv7BFZTQSeFJgHdRawCT83S3D+faa55ZUjYtsZsUVMmJm08g/8pUPMO
         ujDrMOavluUCz2PwXnv06cs9B2DCUsvhWVHdDLpm0qtMtMtZUeNiV8Acy1zEbAWSPbTo
         awkg==
X-Gm-Message-State: AOAM5326wfAxYp75rHiGyx+eLs0crql9/86GtMTQ4PydURxLk6KP/ams
        aBbufx+P+OT6GuJgGoyEBYaAUA==
X-Google-Smtp-Source: ABdhPJxNM7ZUJetzR253G1UXvy6y72lz2k4bBgzksy15ogkhFwYreU7aQMtLkhNR98G65Co0Le8vUw==
X-Received: by 2002:a2e:7a18:: with SMTP id v24mr14045030ljc.420.1627985820391;
        Tue, 03 Aug 2021 03:17:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y10sm1056692ljj.10.2021.08.03.03.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 03:16:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 2/2] arm64: dts: sm8250: remove bus clock from the mdss node for sm8250 target
Date:   Tue,  3 Aug 2021 13:16:57 +0300
Message-Id: <20210803101657.1072358-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210803101657.1072358-1-dmitry.baryshkov@linaro.org>
References: <20210803101657.1072358-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove the bus clock from the mdss device node, in order to facilitate
bus band width scaling on sm8250 target.

The parent device MDSS will not vote for bus bw, instead the vote will
be triggered by mdp device node. Since a minimum vote is required to
turn on bus clock, and since mdp device node already has the bus clock,
remove the clock from the mdss device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4798368b02ef..1df03c809d02 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2470,10 +2470,9 @@ mdss: mdss@ae00000 {
 			power-domains = <&dispcc MDSS_GDSC>;
 
 			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-				 <&gcc GCC_DISP_HF_AXI_CLK>,
 				 <&gcc GCC_DISP_SF_AXI_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
-			clock-names = "iface", "bus", "nrt_bus", "core";
+			clock-names = "iface", "nrt_bus", "core";
 
 			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
 			assigned-clock-rates = <460000000>;
-- 
2.30.2

