Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA5D846651B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 15:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358530AbhLBOVi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 09:21:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358479AbhLBOV0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 09:21:26 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E69C06179F
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 06:17:42 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id k37so71924007lfv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 06:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IjAiB/BeYwBoMDPwZ/mxvZy1FpiqnDkRYGMsFqXo2Hg=;
        b=B7LL2lMMIaUD5ngA8vRhlo46sl61A+aJfstg3XxHb+MOHdvnS2txAVqZflgPEcZ6GR
         CkHTfsghV3LJ3/HrfbB6xd91UU7JpcKQKGLuFl+AyIAl925MM7hX0N6CJVyZfW3hvsTZ
         2v6NM6WGIadfya3zmAVhR1xXMvFDBRtwxX4cdhVasecKzvTyetd01NvLqEo/lsF0KzSF
         kxw974R6+Uik9k4kGxw8Om0LCqcHR21M780765DdzTQm9CXOB/QN0RSstjSkT0Gdv5Ed
         Oo6pXxu7G6XogwTJjB8JJ7FzUH76xOe7zQ2ZgdFOhOCRV1PGkSBhG+Xf/2VU3XE2JcQf
         b3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IjAiB/BeYwBoMDPwZ/mxvZy1FpiqnDkRYGMsFqXo2Hg=;
        b=JPyu6S2KndOmPtZwMpV2KP0uG2R5nqPwBDIJLBWA5YrPLyGN0sDwvB2Kss2JWRbZzT
         ELJVZyjiMjT67rTdeFsHSVZcrub2LsEMMhbZmStHgojRF0rbecQ+0bmSwHenxBjRkYgg
         I//5c4hML5q8P+J79OUMSGi055qCDrlTXAOtLM4RFQLnYp48FcnI1T7D06VjxmsEk8M/
         HX3pzBJBTv2O+aOf9xqqafMfKA5CtLS84I42O/2sUu1nM8Uk6yCp8GTlL1jCYcdUZgc6
         zVW30T72VMB82br4qzqzNCrijt6AXksw0QJAixI9bgnUW0fctHIeSIjAyp4Ax8qeuNqs
         jNrg==
X-Gm-Message-State: AOAM531V3iTG8GaVwgcKn5UoCCu7p1MrQlgxLYum5nER/dTv4XS9b5jJ
        RbWYjUwF8bVvTZ+hOQpDusTnrg==
X-Google-Smtp-Source: ABdhPJyfp0uYJ9etbMtMlklrnjy47rzZdkltbr7E4QEfi0/4P9AaFnjikSNJydRlflIuqAINtg1IZg==
X-Received: by 2002:ac2:4c0b:: with SMTP id t11mr12753180lfq.520.1638454660607;
        Thu, 02 Dec 2021 06:17:40 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m15sm362487lfg.165.2021.12.02.06.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 06:17:40 -0800 (PST)
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
Subject: [PATCH v1 09/10] arm64: dts: qcom: sm8450-qrd: enable PCIe0 PHY device
Date:   Thu,  2 Dec 2021 17:17:25 +0300
Message-Id: <20211202141726.1796793-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202141726.1796793-1-dmitry.baryshkov@linaro.org>
References: <20211202141726.1796793-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable PCIe0 PHY on the SM8450 QRD device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index 8520911d6b7d..30ebafe9c6d2 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -346,10 +346,20 @@ vreg_l3h_0p91: ldo3 {
 	};
 };
 
+&pcie0_phy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l5b_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <36 4>;
 };
-- 
2.33.0

