Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1B21EDA17
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 02:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbgFDAnl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 20:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728386AbgFDAnk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 20:43:40 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DCAEC03E96D
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 17:43:40 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a25so5111811ljp.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 17:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WIkdJuvo5vgQuU83Odu1i4xYBGADX3T9viV7I7q9F8c=;
        b=nUCFwJBHHqa3pQTGJvj1uRrvHzBusitDErdDpnmRg6SwwEMg03Ak214lkfD0CR+lWV
         Fi52bfCTeWAFStBqYAgLpirn4aX+VRqff7b9hb8nW8GCyfUQnoyfB8qRqsSgdIXzAHR8
         lkhO52ddG7XQ4lfkDuMTa/77vBvC8z5ZxTOI4xSefHcQfeqX3t36RRJN89lpRunymOq9
         PYi9KO+Br8JzijMYKhkYDAT6ZpM94r6CJyDvecytKjIFxKU3WHbg7S3WYyjX5PNSQIy/
         H9KieDfl9mV1bYRbDioPE83pvcrIzW3Acl+FjuEg+16+9yUTKLUObgzUzePcIKn3aDJ4
         kd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WIkdJuvo5vgQuU83Odu1i4xYBGADX3T9viV7I7q9F8c=;
        b=QjL/DOeAaFN5rRpBLlxiaOldJp2msOPzi31hwIbdGL0dG87mRcoSnNbOwRR+qUL0S3
         afNkKLx9m1cMNexnP6QShDMH+ctcmjwpfochVKC/C5PcsRLKsoCQt+RZRVmF7yjOIsme
         JNtnzcTmQWTBfvt7bI+plSPLd9cKRqsc80BUNAVmJ8yKyS93iMuiLyE+4EVLxSgzULgu
         t8x7sjm2rj2y3661Qtjy5oGRC+EPv7Spsl2DHJO4YFICmpg4qnPiHT+IiiKIXVTlbmob
         9d37YCMohh4AToTAevHjcQPeZe1bUDKDkTFeR9pf9SU9FvWtj7PIkFoD2nkeC2r6cTGA
         2ogQ==
X-Gm-Message-State: AOAM533o67PLhBzD4kspQzQaComOQ2aWB+W6KgtISoNg5MrzFtI5Fkg1
        Xqtqr8WTII9b257XfZkXoJKEEg==
X-Google-Smtp-Source: ABdhPJxEhy3UQF7ZQOqBFprb8bfVManzAo1C92YFtPg35GyKtK0pEE04QtivQ6E2A/58ddPqIIQF+A==
X-Received: by 2002:a2e:9b50:: with SMTP id o16mr888749ljj.164.1591231418401;
        Wed, 03 Jun 2020 17:43:38 -0700 (PDT)
Received: from eriador.lan ([188.162.64.226])
        by smtp.gmail.com with ESMTPSA id t16sm858527ljj.57.2020.06.03.17.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 17:43:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: [PATCH 4/7] arm64: dts: qcom: sm8x50: add empty thermal zone nodes
Date:   Thu,  4 Jun 2020 03:43:28 +0300
Message-Id: <20200604004331.669936-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add empty thermal_zone nodes. They will be populated by PMIC dtsi files,
describing thermal sensors and trip points for zones handled by PMICs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 3 +++
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 141c21dfa68c..869a54352d77 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -857,6 +857,9 @@ cpufreq_hw: cpufreq@18323000 {
 		};
 	};
 
+	thermal_zones: thermal-zones {
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 9dd27aecdfda..972d8e04c8a2 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1736,6 +1736,9 @@ cpufreq_hw: cpufreq@18591000 {
 		};
 	};
 
+	thermal_zones: thermal-zones {
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13
-- 
2.26.2

