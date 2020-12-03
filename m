Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02CBD2CDE90
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 20:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgLCTOX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 14:14:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727309AbgLCTOW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 14:14:22 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925DAC061A51
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 11:13:41 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id d8so4368424lfa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 11:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sFYmSsN1bxbi/L7R8RFFX1/U9uadQLLW+YvtA4kqQ+w=;
        b=GHAsOfteqJMZ+zT+RROIHULp1MAraxI4QgEvUe9IMPDs4Co/iEJy6QWiCJcEvUH4Xl
         Z4SH0C4OL1SzOA9ih7bBK2S9e7eSSchqSogrkkmrr+doyxcq7wEnSNb6Ipp9Efbd2yrB
         TZmK3ZmZwz0TlFb5YkuZIIvmjM8l4LRB0wqgQEtr52O1k+7BcRiIUByD7IfRtuOqdEij
         8mmXUHgp+T1uh90eIj21oqwOd6Q6JrlqxLxtmME8iAml6Ce89sFO+WQMuejBWJeat8l1
         3MB5sVli3w3mqzVYQGdxrxMIi4UEdF1EJOqXlF56O+tXwTpMCO4w3mqVGQ3ZVFlXaOpR
         CP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sFYmSsN1bxbi/L7R8RFFX1/U9uadQLLW+YvtA4kqQ+w=;
        b=S3D1cp9dGENWPN19+3SLoO7eJeDGiFxzv1y2QYebG6SoE2Ong/lE0kjd0wT3dmK9Fc
         SRgNh42+3IQSXNFLosILLavMBoshkTSt5SE6DpObNKSXSzWaq9YFSNXnZ06+6j743EnR
         81BditVVnBjLmBztMXIhBpxmqTddKf9hIOpRlJ9bFp5D0kaVsyhs86Sz5YRXWnthrOn5
         q1cBg3EumRm4KjBJHpU519wHPwgxpwGnBjshw6+tBgPnvMxNJ/gEb4QihmU+es57/oGk
         J7bVA4RzhmlLCpLOqau6l/4RRXvb8xjmoTNUVDn1sJUsGqx3D8cQ2efElzOpIffFxMoO
         LEpw==
X-Gm-Message-State: AOAM530EWARSY9OiUjEJIJxsnJLtblagWLTFoTaiOtOJ2i5mCpq/Isjd
        gITe7cPqqIL5kEBBB53sCC5I5Q==
X-Google-Smtp-Source: ABdhPJzCEN262hCLb+3TeAEKT3aVjIEVhHQSJCeN5fx/vBA/e+WReUSu8b8zJNdDUzdbe/M7wCd6vA==
X-Received: by 2002:a19:43:: with SMTP id 64mr1927578lfa.504.1607022820070;
        Thu, 03 Dec 2020 11:13:40 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.117])
        by smtp.gmail.com with ESMTPSA id x10sm102472lfn.307.2020.12.03.11.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 11:13:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8250: rename smem device node to follow schema
Date:   Thu,  3 Dec 2020 22:13:35 +0300
Message-Id: <20201203191335.927001-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203191335.927001-1-dmitry.baryshkov@linaro.org>
References: <20201203191335.927001-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rename 'qcom,smem' to just 'smem' to follow the rest of SoC (and device
schema).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4c472db2738e..bdd9bd303415 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -334,7 +334,7 @@ cdsp_secure_heap: memory@8bf00000 {
 		};
 	};
 
-	smem: qcom,smem {
+	smem {
 		compatible = "qcom,smem";
 		memory-region = <&smem_mem>;
 		hwlocks = <&tcsr_mutex 3>;
-- 
2.29.2

