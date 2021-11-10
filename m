Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC65C44BF62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 11:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231418AbhKJLCe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 06:02:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbhKJLCd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 06:02:33 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B075BC0613F5
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 02:59:46 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id c4so2350523pfj.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 02:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QYYqWkSF0jbV84eY1f/qlBJe1yt7+OpWykcTHwVzfUs=;
        b=YPOyr3wozw0D/eHhgHNRiEI8BOWdv6kMuV3VZWqCLN5TcKYU9MSpBsEa+U76q9tEvU
         AdgPsekD9mgYzO/7J9hUj6iM5a8DgJ6+5tEVDgYLuYJN90L9Spy4RUq2O/C1VHxO/fmY
         88Cl3Snoxggqu2Ce55TvuzfiZXSvhUQUTiCCMiJgDGxV6om+vDS6L13G+tgiunZWCmwd
         bjWZ3ylvRZkL993HiC11vGSitMkEviAVoEExZp5z0zdFFy4tgU3/VvrWwIYO3B/5v2dZ
         J8xfL1px342ZFTB2udE0DLwjMsVVDA2MMcX/Ov0h/mIvzNns77rss53MmiEeVkqObJou
         cOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QYYqWkSF0jbV84eY1f/qlBJe1yt7+OpWykcTHwVzfUs=;
        b=HAqe2HGEpmw1M8wWc9FP/xE1Wm6sOdI/U947+ymiBznupYZudn4BYdIhav7Wcf1yc+
         p11xZ1Zg1mqJyd0qdJCpqHVHmgEiZ1/MuyzdRCc4SdO5BLSKCljRBMQJbcemewgBJDAw
         mesF8elX6ZJUwC3QZNLvHm59P128+bJBXKv1c6MPfl8LBx9pETiMSFirzSXw9T5eARRD
         v2eshXCnGTD5L8TZ1ICYA7r4ST43979GgXV/2wo3Khj9UuUrdP5efkM3mjDQp883khms
         pkZA3RrpvqCf4/Jc4ColQ/FafLUfuz8wjFvkx6SelB1VnEZkboOyw70qvo3fWk4waHwE
         qYyg==
X-Gm-Message-State: AOAM531sCsoLhAXv+gLpJ7n3KwHx3oz7pw+WW+/VVvuaf2vPR60zXVAr
        LhXNrpIqnLxnHazenTLdKsbYLVtm6jPU+w==
X-Google-Smtp-Source: ABdhPJw57NcpOzofx+IMYY43mlLCAtfB8iyjkZ0/QQx32Ip2jplTFylh/FMnlUzaPdjV5w0pXSKr2w==
X-Received: by 2002:a63:86c1:: with SMTP id x184mr11206316pgd.114.1636541986052;
        Wed, 10 Nov 2021 02:59:46 -0800 (PST)
Received: from localhost.name ([122.161.52.143])
        by smtp.gmail.com with ESMTPSA id e11sm5585282pjl.20.2021.11.10.02.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 02:59:45 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, stephan@gerhold.net,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v5 01/22] arm64: dts: qcom: msm8996: Fix qcom,controlled-remotely property
Date:   Wed, 10 Nov 2021 16:29:01 +0530
Message-Id: <20211110105922.217895-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Property qcom,controlled-remotely should be boolean. Fix it.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index bccc2d0b35a8..27683d7fdfe6 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -713,7 +713,7 @@ cryptobam: dma@644000 {
 			clock-names = "bam_clk";
 			#dma-cells = <1>;
 			qcom,ee = <0>;
-			qcom,controlled-remotely = <1>;
+			qcom,controlled-remotely;
 		};
 
 		crypto: crypto@67a000 {
-- 
2.31.1

