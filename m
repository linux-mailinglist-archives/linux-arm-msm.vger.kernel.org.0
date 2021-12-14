Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110CB474E5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Dec 2021 23:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235318AbhLNW7M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 17:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235092AbhLNW7L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 17:59:11 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8724FC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 14:59:11 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 207so30547746ljf.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 14:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jMeSXoL9O+nVWzUxuXzuxlRG686vo4uKJcR2hEXNT20=;
        b=xCy40oaHFPu4nv+TNnypJURLDeyiwZenKWG8F2ruWURxIufTVFkMVSiS4clVFJt1Dc
         gbLXCVafRCq0ZPUbZqfJOla/zuJMs4EGO1yqJwyX8Ryvg+fEhLLYsyeFrgVuUcWaGhgw
         kSK5oZ6mudoVKuD0Np8uvfohZxCXoBPdQFvEDEE2CUM3yyKbhgvmXoKJ6APC6xSgKP91
         pz6efRgNvQU5x2l3gzDAr/wraCvIQT/PSeerXRFUh2vjC+Ae7CMp+FsJMQZMVjON7emx
         jg1XN6jvCNKKFggwXJw0avLb4WAq++kbK8Ah7a/3eSLMEA0MDR0MWmFY7X2Lmx45DSqi
         3RIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jMeSXoL9O+nVWzUxuXzuxlRG686vo4uKJcR2hEXNT20=;
        b=0y4WeMkXaOQmHKSuLxHlTVhT4hvtHp4iG/45oJTnLGwEWk5uNfGa7Q0Ds/nxXYW2iU
         7KZza8SwQN+0oLKewx7OsYBzdX+mypZLRVLEFAjBVSlUBUGcZvgSRcfa9QJ2N/Cvg1Gk
         xQwJUmPyynqsK+Ff2ZewTgfsir4VbtBaSLiWpnn8lloYkjh6vMqVn7bYWrYMK9L6cA/t
         2WY/4Xb62thUehnOEzZA48F4tOpRU+nVgjr2wP2nGsXo8F83StXKcOFG4eS1qCgTgXfV
         dQuAuzeuTuMzyOxY/voq6ZKqgpBDh7iIh8AOpkDUoJO6ZMvnEhDnoUdnbh30itN9Xkeq
         /Njw==
X-Gm-Message-State: AOAM532CAa8gj90XLBfkbVmzZsEAdBMxteR6+4CumzMlVjcz8654j3Cd
        2GsEwCBxvbo+hvZYtgw7DugWww==
X-Google-Smtp-Source: ABdhPJxnq5xbEmSid44VxVLbBL1VtJTpV/poTZmb71b6bIzMtOc/J28LTbj8HK0yDbk5i925aX45Wg==
X-Received: by 2002:a05:651c:1204:: with SMTP id i4mr7614321lja.437.1639522749853;
        Tue, 14 Dec 2021 14:59:09 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id t10sm45115lja.105.2021.12.14.14.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 14:59:09 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v4 10/10] arm64: dts: qcom: sm8450-qrd: enable PCIe0 host
Date:   Wed, 15 Dec 2021 01:58:46 +0300
Message-Id: <20211214225846.2043361-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211214225846.2043361-1-dmitry.baryshkov@linaro.org>
References: <20211214225846.2043361-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable PCIe0 host on SM8450 QRD device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index e02d3c86e365..f6577ca7d2df 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -346,6 +346,10 @@ vreg_l6e_1p2: ldo6 {
 	};
 };
 
+&pcie0 {
+	status = "okay";
+};
+
 &pcie0_phy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l5b_0p88>;
-- 
2.33.0

