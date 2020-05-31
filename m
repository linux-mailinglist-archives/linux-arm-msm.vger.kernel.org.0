Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DADF1E995D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgEaR2b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728363AbgEaR23 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:28:29 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F78C061A0E;
        Sun, 31 May 2020 10:28:28 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f5so9119783wmh.2;
        Sun, 31 May 2020 10:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AmiVeCrlvBozr1mRsIgPlt1KZ72GAvwSr6GerYoq+fg=;
        b=OaxfQOx387pLNL1H0OSG417JXinckGQlSuFe+s0CR0s+gHvtJIkyGP6yVVtEE8bs45
         BreIYi2z9eFKy0zCKtn5RxwLOb9o8j1tXbgHH6G89qG9BZDPRku570E1T1SNrIU4CmBO
         VfHWPduqZpk9GbeF5QT6yBQnzKrFVcmLcUBEggi6BYS7bQYHa19FNPaAelv1fdykmlkb
         Awz018bFFwKIiPZEF7oZ0W14FPu2M+ld5MINZOwFfyAOoKcZNZNKpqaabzTLlvmxaowd
         GjrWHhTSuf4zn0yXpYgC0d/0286eosOq6k4Iw4b1SeHwaFLeWZ9NxcwpBjshjO2vXJAy
         P+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AmiVeCrlvBozr1mRsIgPlt1KZ72GAvwSr6GerYoq+fg=;
        b=IG34uPVQKCatTp8HZpX3xchpp1N1RNmDG3/aBrUAiSir6C+HfCkj8auWgabmsZEpBi
         vDzc1N7FWt1m8rQvukK5RPRXIgsirx5PqxF8pfJLP7kAY2fC9lrvtPDytlPm3fbzHuAM
         djN97pL3pg82VuA5UXTrhmELNpf97tl5J0wGHSTvDAbb/SNP/wM73g9T8IgypeVZcPyE
         DlLi0CPavdSCaYkW1f7hWQmROOC2dV9Tjx0VIs3IsAkVXMQnUSS+n9KZXOAhnHifEDvw
         G4FAat9lzukfybAvtFGuUXVLnWyFCvA8eXLvHEVUyBZ7i53eGc7lNDrA1pZKbfYktbz3
         yPEg==
X-Gm-Message-State: AOAM532p8Q66+AtRRw2HkElzKKRKzVoKo2GIvECYCeAwC2rDyDgkZW4d
        gL6+OuV+9xYoC7GCCOqkZHQ=
X-Google-Smtp-Source: ABdhPJyWbPvNdO1s9IosFQGiJ+PCFLgMZ9+mTEpvgwb4kD7BIR6opKm7nviya5q0Y/SnvO4KkFB37g==
X-Received: by 2002:a1c:3bc2:: with SMTP id i185mr1673379wma.33.1590946106751;
        Sun, 31 May 2020 10:28:26 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id b81sm8922326wmc.5.2020.05.31.10.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 10:28:26 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/14] arm64: dts: msm8992: Add PMU node
Date:   Sun, 31 May 2020 19:28:00 +0200
Message-Id: <20200531172804.256335-11-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531172804.256335-1-konradybcio@gmail.com>
References: <20200531172804.256335-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the PMU so we can get proper perf event support on this SoC.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index ef95f5ee83db..b86fcfb6f463 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -381,6 +381,11 @@ smem_region: smem@6a00000 {
 		};
 	};
 
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4)| IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
 	smd_rpm: smd {
 		compatible = "qcom,smd";
 		rpm {
-- 
2.26.2

