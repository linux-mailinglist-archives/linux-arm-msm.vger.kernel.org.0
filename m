Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B56F2C624D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 10:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgK0Jz6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 04:55:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgK0Jz5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 04:55:57 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22E9BC0613D1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 01:55:57 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id q13so5535483lfr.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 01:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aMtoWeMWHvc6/ZtjQjyHL53GwuZxoULh8/VicAMR0S4=;
        b=zBgYUoi+Wp+Zkjr9yc/EFdEGWmMetrUqD71QhqJ4mybzbhfkXi+IHX3GDTgcJVG6LJ
         oetTDTA1Qa9V91Ukphg90T1k+O+X4IVhP+mtLeKEXcCLU3+NCpdcgqhgSVcfc7+dhHha
         wP71Rhs5IVJ6Td/kHHolO3SYutoMaByAsa2jjG5pxYiW0Ia/7Bz/yHDCVW4CQg+c2nCp
         yZLvVv3ICikrYkS/0meeuPpSH+SUzKhxyrArFxp2cSAtoYlT9ZvuBvRIfu2lrbd2sevm
         aZJxWs1CE2xcZjQZciremtzHaRLBi/PdG/PDmLRqZZP14ZURXDleP5ZFASsPyt9sGZnM
         FZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aMtoWeMWHvc6/ZtjQjyHL53GwuZxoULh8/VicAMR0S4=;
        b=ZSB7cHG9rJnYKM1rfNq56ptjYWKjLZmb0CVopp2miQpm6wMFKgIjw1ITWuF+FnVcbq
         FxAwj/djgVpCk+9OmrVgbep2OT58XabKfmYUQ8gNIgAEexy4I9su9kv1+T06E3wTwVDP
         4xkXqBFFPKiDstJkdPNB307TzsGxPDF0++dBigBVEsupOCTq/56Ll67SLcNXlPqS8dRg
         wTaTxb1+fWZ+z29BQILEQkccgaCp70g0xO1TKHZptz+wy2iwk7FsW7tuo0JBouUPvGuy
         9ojJdBRigvwxt8RD4NmDSChE4YKvFw+27eerSMGXHSWjhGd1XHdDqsWqTMqQkMMY9kaM
         faww==
X-Gm-Message-State: AOAM533ZmYIMIo4THN52tNJ+4eg65/SY+y6luTuC8qbFU0s2hiGeby+I
        UxPxdh35NWpL9f9sIjG2+thITw==
X-Google-Smtp-Source: ABdhPJy2Cvm3ldW+DDIKuYbC7MW3KOeuwxbQyyQ68/1/nR/6Gv+/fRy8ENzU3+nlTkJDmwd544HffQ==
X-Received: by 2002:a19:228f:: with SMTP id i137mr2809626lfi.477.1606470955564;
        Fri, 27 Nov 2020 01:55:55 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.79])
        by smtp.gmail.com with ESMTPSA id x25sm628477lfn.99.2020.11.27.01.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 01:55:54 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 4/7] arm64: dts: qcom: sm8250-mtp: add gpu/zap-shader node
Date:   Fri, 27 Nov 2020 12:55:45 +0300
Message-Id: <20201127095548.128217-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127095548.128217-1-dmitry.baryshkov@linaro.org>
References: <20201127095548.128217-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add firmware configuration for Adreno zap shader on sm8250-mtp.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index dea00f19711d..b5a474ee008e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -358,6 +358,13 @@ &cdsp {
 	firmware-name = "qcom/sm8250/cdsp.mbn";
 };
 
+&gpu {
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/a650_zap.mdt";
+	};
+};
+
 &i2c1 {
 	status = "okay";
 	clock-frequency = <1000000>;
-- 
2.29.2

