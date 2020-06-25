Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90E2F20A4C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404279AbgFYSVv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404171AbgFYSVu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:21:50 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76ABC08C5DB;
        Thu, 25 Jun 2020 11:21:49 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id g1so4947891edv.6;
        Thu, 25 Jun 2020 11:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A69JzujOnyhenXPlRXTW6BkPoGZ0iXxM/MOzTEanPgQ=;
        b=ODFyvm5V8bJa2FAJCCG3ScLpGvuqvyll5vw+2FS1j8/f3AMh3o/RBwmH0pAJmbooEA
         IHhRPcnmy7f7F9vB4FMkQdE8d/a+XdhkzH9FWOtKhKIcXLc9yHTn1SWLGMV4orkQNszE
         SqaApbEwBSw+7CUXs/uAi/PdTn76L6AF2BekoIxFeC87v0eExUhl9HrEhIhygrjhERYI
         IoSWfbGdrrYLC1TevvEKFO+uXY8fqzEDfPMVHn20vKZiA0ouzcTWZcs2/8C0i+F9hvjp
         e5WdAgTj2t0guBrdyf61r2FuTHFEN7cDEYJUkhnbxOSiGxnfsGvwepN+iNCj9SCk3GEo
         EPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A69JzujOnyhenXPlRXTW6BkPoGZ0iXxM/MOzTEanPgQ=;
        b=iabDMrgcxIYBEFEYjkow+AkraKystP1DT+9bhMk+ej0+w9fuzEC/ylFoGQtVuyzqaA
         50dbOe9gL/vaI6RBs2NXVC05rVQASfes3nR2HAkoe9jGFN3lzWXNVSqS57pGqv8C62Sk
         0wDJUIQyZeY0Asw80ULeGvYtq2LywnFSkLg4Xk0jSDTaZbrBpvufW4gI/EhLdWHuJtGr
         bdGeb1OoNKGdA4ZKJLplcG8+fQ1XW83krCz3sduuuILLBPceCBxsNKIB56YnS91S9lA4
         khBDRThTJlehOKEgHtqY8SlTi/+kyzcRXV11djjDywWaUMkAA2F7ezgilVktYl79Vzzj
         kuyA==
X-Gm-Message-State: AOAM531CJfxdq8cEq7q720DoL2/1jepsH302O9/5ITfo6ID0UIn8Plxl
        +hIkwhKmnzDscNgyHqnh8Is=
X-Google-Smtp-Source: ABdhPJzmfvbOjx/IWB5RRMpXTfXgVoCKevHrkNt9wPBD16ZSLt4MMQH4HpoXMxfQErxEdfaFpeUGJg==
X-Received: by 2002:a50:f413:: with SMTP id r19mr13324539edm.17.1593109308677;
        Thu, 25 Jun 2020 11:21:48 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id lm22sm1523448ejb.109.2020.06.25.11.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:21:48 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/13] arm64: dts: qcom: msm8992: Add PSCI support.
Date:   Thu, 25 Jun 2020 20:21:14 +0200
Message-Id: <20200625182118.131476-11-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625182118.131476-1-konradybcio@gmail.com>
References: <20200625182118.131476-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This SoC's firmware does not fully support the PSCI
spec, but it's good enough to bring the cores up.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index c4c9a108ae1e..bc3acc0cf9bf 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -135,6 +135,11 @@ pmu {
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4)| IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "hvc";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.27.0

