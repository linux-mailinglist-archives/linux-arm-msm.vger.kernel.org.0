Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2142E20679B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 00:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388906AbgFWWsr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 18:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388875AbgFWWsn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 18:48:43 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02DAC061795;
        Tue, 23 Jun 2020 15:48:42 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id a6so3193680wmm.0;
        Tue, 23 Jun 2020 15:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ifjgCBZsxoZWFbpjL7YnqG5WtDh2d/dA7anPnB2AUjM=;
        b=kVK0cnAB0v0GwL+ZxWwF/PPAwrH5obD/qHyzdhLSHmEY1OiQfRtWAeH9v4ptleKdHw
         OHFxwZr7cvMVPxv+NiUoA5oRVUMkvbWLhXBRrN13AgAeN0tdSIoKx1LUHbtO86Qw9VOP
         z/eXbKRshucLbYpw4TQBP73fDCcMCtCAf2DoaOFRgeDl/SAOK24nAv2c5DBcgnPBKGqH
         ub/eA8GcOmCcHHAk9VTZV8GpQlzFwwMYRTMJSzJMINLnbJuoyyFGPpR2vChyOXBwG00g
         MgoMHufMXZ5OM4s/yCmVeOihCVjB95pWxQz1FVG8Y0TbUqkveeGwwUR6IXGfbsp2+rZC
         m6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ifjgCBZsxoZWFbpjL7YnqG5WtDh2d/dA7anPnB2AUjM=;
        b=KPkqqVM9HzujryGnJX6R35/NrgtohCyqhotu+1Xg1uOxn60zRKf1lq6bKErmiNSk0N
         f9Y0ZKbHx6OfckUd8TtzGPV6TqYxPsiV/XPBdfLoTf72CTa5kDk9/8kTaMEpNTXpX2Ha
         kChNtdIZo9XGhMOyKuqTTkMvSiJ0/kfPAUfYHEkJexVyssyXQRZl26/Xw2Ynh+/HmFOK
         bmrlg2fJaCGz1VzbapVvuTVDuEXB3ysBn6930ieKB8VofVQB5Q0EtCfTVb0TEMMnmpGZ
         r2JW6vRJ9L2JsimjL7g+fkhepORZO4G59j3n1+sJ7IDHajDRMvXvZT1XsN8/DcRhLZEp
         k0YA==
X-Gm-Message-State: AOAM530MddXfXvYvVTFEsjlnCKQaWtpTQDfppSn8s5Q9UrGo18pvQX8Z
        DpB8KRV2GI2uLMfsrFsT+70=
X-Google-Smtp-Source: ABdhPJyeh7zSOFt2epc5qJs8u/4K2+PiqAd2RqZT3y05V5QXGm8jGkmkYDs1IDl68/qLd7xLCBLRsQ==
X-Received: by 2002:a1c:dfd6:: with SMTP id w205mr7655813wmg.118.1592952521695;
        Tue, 23 Jun 2020 15:48:41 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id g144sm5671179wme.2.2020.06.23.15.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 15:48:41 -0700 (PDT)
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
Subject: [PATCH v2 09/12] arm64: dts: qcom: msm8994: Add PSCI node
Date:   Wed, 24 Jun 2020 00:48:08 +0200
Message-Id: <20200623224813.297077-10-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623224813.297077-1-konradybcio@gmail.com>
References: <20200623224813.297077-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PSCI node to enable multi-processor startup.

Note that not every 8994 device firmware supports PSCI,
and even if, then it can only start the cores and not
shut them down.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index b3c01ebc5c67..9eec8ab6bf2c 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -159,6 +159,11 @@ pmu {
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

