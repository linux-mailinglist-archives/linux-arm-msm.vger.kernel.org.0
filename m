Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC6062838DD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 17:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgJEPDw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 11:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbgJEPDo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 11:03:44 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF4F1C0613A7;
        Mon,  5 Oct 2020 08:03:43 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k10so9964126wru.6;
        Mon, 05 Oct 2020 08:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=novVeUtVrCeDASQBU/jiwNit0DAtiRgkD04BxRYpE7s=;
        b=QpfxYW8+eoggMkCmovQJZLD8OySO43u/OuDpuQe19xqCeKKVpSOdc9focQtdyoAVCN
         8IgkF5hnouKHef1fuGU8/d8tTbzxvAAEFbELTyLPjPh3dBMagP6C0zHI1QUZYEIi6kba
         kPzGL62g4dnjeQC4J15NOU59Sk+IUvz9adcG/hTNxVkkLUBiNr3gZP3dEoLCHyn9TVFW
         rHA4zNw/nEs6uYRtqvXrd3PkCsDzVod+vicPZTOGC1yxJyFxxiLI39S8Oav39bMT2qFu
         V7wkeC0RLmzRJUTj54NBLmlPGh6Ap3OP4S7XIY5ARcIL8+4onyVxrAANff+k4iXMOSMF
         vwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=novVeUtVrCeDASQBU/jiwNit0DAtiRgkD04BxRYpE7s=;
        b=WIt4VV4ZnYFWI8O77s7f2/vUFLjZrzxkI/Sov8thkdeFCzJ5f78MslSM2K34eh0C8W
         6eYYrPCQQ0hwA+0UqSuCijmOGI6hibzWC4R+qTEFZvj4pjTSt2P62UYQftWFSwuJGt0+
         xlUb5TefgJemKKGEuAj6jXNu0ztYmEb9UyCV/VcHjSEZblVfRSVWDGUtUs1pXiiRWagu
         WhL5mZ/TnLhF9SY6obnrFIJbzl5fPjcAR6pu2PSDQD/QflGViCDc2S7nzHTREz57072z
         MtqCEB1Iv06LEOsRr9KzFIbr6Rg1c72FQgkB31kPDyrg8+Af0MbpHcECUH9raSQPat3V
         n1yA==
X-Gm-Message-State: AOAM532/ahmaWFKhpkIgR2o0auisoZQt04nIEKGSnxScuZkVw/bOZT4C
        MBYO01DgxFW8hnsJDseeVl8=
X-Google-Smtp-Source: ABdhPJzIiSq2SvWIDmhbbiS762I2vw0HDRYdbv9SHBvHngetgDEqyJO9Kt+Lqdd/LbGgYD6zZ5OFtQ==
X-Received: by 2002:a5d:608f:: with SMTP id w15mr18114208wrt.244.1601910222516;
        Mon, 05 Oct 2020 08:03:42 -0700 (PDT)
Received: from localhost.localdomain (abab191.neoplus.adsl.tpnet.pl. [83.6.165.191])
        by smtp.googlemail.com with ESMTPSA id c132sm4662wmf.25.2020.10.05.08.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 08:03:42 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] arm64: dts: qcom: talkman: Add Synaptics RMI4 touchscreen
Date:   Mon,  5 Oct 2020 17:03:08 +0200
Message-Id: <20201005150313.149754-9-konradybcio@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005150313.149754-1-konradybcio@gmail.com>
References: <20201005150313.149754-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds touchscreen capabilities to the Lumia 950.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 .../dts/qcom/msm8992-msft-lumia-talkman.dts   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts b/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts
index 3cc01f02219d..c337a86a5c77 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts
@@ -32,6 +32,34 @@ chosen {
 	};
 };
 
+&blsp_i2c1 {
+	status = "okay";
+
+	rmi4-i2c-dev@4b {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x4b>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f12@12 {
+			reg = <0x12>;
+			syna,sensor-type = <1>;
+			syna,clip-x-low = <0>;
+			syna,clip-x-high = <1440>;
+			syna,clip-y-low = <0>;
+			syna,clip-y-high = <2560>;
+		};
+	};
+};
+
 &sdhc_1 {
 	status = "okay";
 
-- 
2.28.0

