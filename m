Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E85D3A9D31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 16:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234031AbhFPOOR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 10:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233893AbhFPONp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 10:13:45 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B096C0611F8
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 07:11:34 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso4203638wmh.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V9cAs4L74nz4XfccSVfL7ca2Yy/QzkxFU6fTpHjGxgY=;
        b=f6yrmsi/ZtXMLCtqR0C38J36hLarvdkbEShpFPv9YhdnH68wYcLE1B7zWbSxeL/8i9
         ieKVPDG+PWXF03PuzBx7vwGJYQ8baQxsxNHWZIbiTwpnTMAvz5TtAC6BRp3ugrWnR+N0
         yYIZKvvhMTk9cG8nUewBL3wXxku/Ma72pEaK/QYrBK+88LlJ4wG4R9J+GzrRRoyTws0t
         qEw8k9eNVwGQSD+Ml6RU2hf+S9bIwsvxsYA9i39v56K/MtTkeyQfH1i0MO1bdZ3kiuJb
         ZCPkOCBIYVPdaTTfrw8dqAGDnt8fa1nxLGunC9Li5v0D1D3pMQULJDrKFwZBYqhyqAzJ
         fgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V9cAs4L74nz4XfccSVfL7ca2Yy/QzkxFU6fTpHjGxgY=;
        b=OJwvjzIRuft4uEEKiH5JbOvM209JzQK8r2LkfCD754VamQQlp/4JSlR98el070P0lM
         vGmqECnV0WoJSFHtl6uHonxg90v1LCpaJRtgoqk9TVWDh0v6T0AhNHFTwxpo6KrOEOIO
         p04JlXyW8iGz/0Lim27r0m9tHL4LsZTYvHyEsUKfR+xbK7hKYRXFeEL9MVtkDtRlQsbj
         1LAxcOAM4FDEWn8cmUyzxd+E77lztOuyCTVhhN7P97mwRsvR+4GrA2f4w1JD6wufE2ax
         ZBlCyE0+dypzp03TqMogfPkksMQXzbTRykeLZNEjra8isKHv0/rBfCbt5GDIBMlkVDSY
         8OrA==
X-Gm-Message-State: AOAM5312Fd4K68tM1MgMk2sN3QUa9NFroh2Zw5eUdpYHSSsFSFi/j8FA
        1rWSu/6JmjwKCNoVIGM43JyHzg==
X-Google-Smtp-Source: ABdhPJzhqvsnDX658wb7DXQJuY+cteqhlVKnNJdgPiZIlDqxxex1YvcFwSPcZKdmecVDbQviKrIh1g==
X-Received: by 2002:a05:600c:198f:: with SMTP id t15mr3679658wmq.27.1623852692720;
        Wed, 16 Jun 2021 07:11:32 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:9df7:76e5:7e94:bf1e])
        by smtp.gmail.com with ESMTPSA id g83sm1968375wma.10.2021.06.16.07.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:11:32 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jonathan@marek.ca, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vinod.koul@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [RFC v1 09/11] arm64: dts: qcom: sm8350: Power up dispcc & videocc on sm8350 by MMCX regulator
Date:   Wed, 16 Jun 2021 16:11:05 +0200
Message-Id: <20210616141107.291430-10-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210616141107.291430-1-robert.foss@linaro.org>
References: <20210616141107.291430-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add regulator controlling MMCX power domain to be used by display clock
controller and video clock controller on SM8350.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index ed0b51bc03ea..5dd32d4b1936 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -169,6 +169,14 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	mmcx_reg: mmcx-reg {
+		compatible = "regulator-fixed-domain";
+		power-domains = <&rpmhpd SM8350_MMCX>;
+		required-opps = <&rpmhpd_opp_nom>;
+		regulator-name = "MMCX";
+		regulator-always-on;
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
-- 
2.30.2

