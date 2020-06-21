Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6975D202C31
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2020 21:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgFUT2b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Jun 2020 15:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729810AbgFUT2a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Jun 2020 15:28:30 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45995C061795
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 12:28:30 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id i27so16876218ljb.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 12:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mL6HaqK6Q5R1aI2h++NtWnM5EslicmBEzVZCRl6DFdY=;
        b=QoEj1Uu6iFpPiKPPUb27lVO5CCZjVSvtUt6YF083zC6bmeYnCYFRk7Mu6Hq0nkjvJe
         8P7XBcKuBvqXD9+sWf5/xxzSLWgeo2CX3zs36eF8AphibjgFJDozQRgwUH2Qx81TMaAu
         GOY/AqHRicpVKGPDRxhDfojlBAz8CL1rL6rncWO48i1x2vg7XTczBenc/8SrBVtrHort
         Ny7E+WS/QRrMiAnDJ6+eza7bSjzjQI4oGdhxPiIhTMh637xSB8G4VYhPNvfiBhzwc5uD
         25g1aB/6iRpFDUoQBR5oWuPxQ9S6trgvryBmq7jAeXPOmTF+e2J83Jg/5+68bIxa8hQ3
         F45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mL6HaqK6Q5R1aI2h++NtWnM5EslicmBEzVZCRl6DFdY=;
        b=Wl83yt+bRTKpgHudYHqWQvZ/TyYyQIiZjZ3d1qH6Ic9x3bRi801tqlDR55VUBsBxiw
         bDLYil0+OJ6/tgs37sLOjPlXki4W/lxHtNnLcLkczSfh8BkXwpvNzcqSI170AVNwz/Rx
         d+jnbYVB5Mj5o++h3yh1higJqx3j3vu/DdJg5V7VypPcWOl5aC7ArIKzuOJLjPhK5p2E
         jIEeb0ITDsfDVVbidiPlPGdwN78YUFD6lFxcxo7Ik++5DTRQZsgbUXApjX5ql92xDoN0
         8i/YmhrDck0GrYLUFfil0ogAw2Ti+9VcqvFYMbywmxuRE1x2BXPei+Ikw6kY3ibr3JLu
         5xgA==
X-Gm-Message-State: AOAM533sT1XZWFL0N3LHt3tGaqpN4i8Nt8Aw1UPkIC1dbifPfEDYLDNe
        zQm/SsfNx2dq40RwDM1y6iPRfw==
X-Google-Smtp-Source: ABdhPJwKn7av31wqUshPFtvWePCYVKEh44VfX32LX8ObANrHNpYEQjR/Z90Is57/ItSkYkN+Qnqrhg==
X-Received: by 2002:a2e:9859:: with SMTP id e25mr6852919ljj.243.1592767707844;
        Sun, 21 Jun 2020 12:28:27 -0700 (PDT)
Received: from eriador.lan ([188.162.65.109])
        by smtp.gmail.com with ESMTPSA id o201sm2917205lff.8.2020.06.21.12.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 12:28:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 2/3] arm64: dts: qcom: sm8250-mtp: include pmic files
Date:   Sun, 21 Jun 2020 22:28:23 +0300
Message-Id: <20200621192824.2069145-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621192824.2069145-1-dmitry.baryshkov@linaro.org>
References: <20200621192824.2069145-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Include files describing used PMIC chips, GPIOs, power on, etc nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index cff7a85890ee..aa37eb112d85 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -7,6 +7,10 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8250.dtsi"
+#include "pm8150.dtsi"
+#include "pm8150b.dtsi"
+#include "pm8150l.dtsi"
+#include "pm8009.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. SM8250 MTP";
-- 
2.27.0

