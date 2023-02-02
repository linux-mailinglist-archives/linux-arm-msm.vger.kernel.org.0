Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D136687DA0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 13:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbjBBMkU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 07:40:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232273AbjBBMj4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 07:39:56 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A714F8DAFB
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 04:39:30 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id q10so1582778wrm.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 04:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8ipbXkSPL37n3A8t/Jal5T88LelKqVf60eLRmlYx4I=;
        b=yPFYZBDkdeU1SfbbI4WBoLvzuVyDqyurZo7Iv4WA07ahS9AlT7H9JooRpXEhWc8iQ2
         d+/CKarwMrNaR52YnitdStMFvQVwRSC6Dww18dePwk/wNDuN+mypBJEGp2Zt0BzqPPbd
         Hryycf0C1QKErW2aZIyaUfKXhMjV8C+AxC4PNNdwRjNwFEqo1auMQViIVZ54kemprZRR
         hEVR+C2/IbTzd5bx+ARz+QinkZyFYtQplkTnuhGCtJPnas493f41jjazI3+yPbRq2/Ar
         Ur6GcgFbpJT2Xd11PnEzeoW0Iz8XNOqHZ8kIKjd5AqtxocpWB0eR6I5CHwkUgjCSBX8R
         qoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8ipbXkSPL37n3A8t/Jal5T88LelKqVf60eLRmlYx4I=;
        b=kkRjsGgmm3hQ0fRlosB8WYq4wruJ7oFvS4pBz8LZDDaA+OSx2Z9C1t0Uw2noELdwm3
         fyr69i+SJexv/HI0j4+1EiiUuvfCkRNp9hxyNui8TDC1sv5PQh+L624hz1xk8P8hwC21
         Cu833B9uVcKhxa7OdZf08i9ddP4w+UYz9WMYnHkyz91iHNkIZfYTT5Ipdtm/h6PXWZIu
         9QdQ0s4QNEQHF8uiN1A2XLv3fZ0mh7TsjBIhycx7MoR/CumW9JxdbpWSeD1HK5I6oebe
         3PyEUBodSfQVckaMH3SXSKwEz579fIqatXKEnq1hJmZTIf+6WFWHJ80Wv9uWWS6utPbv
         SnVg==
X-Gm-Message-State: AO0yUKW2xNVK5CYSwKilbAXNJWRGIlMf1DOA3MPU00w2ozB1l8yEiE3/
        WspOG3Z2DjEiE/WYT4qjUx88qg==
X-Google-Smtp-Source: AK7set+P0OqTh2slEdaZnFO4/olYoP/mCwp659pG1hQHxj/yEKy3FeBSAa0OML5p7Jj1lizYHmPQ5w==
X-Received: by 2002:adf:ec0e:0:b0:2bf:b839:c486 with SMTP id x14-20020adfec0e000000b002bfb839c486mr5549655wrn.55.1675341568837;
        Thu, 02 Feb 2023 04:39:28 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id j5-20020adff005000000b002bddd75a83fsm19525644wro.8.2023.02.02.04.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 04:39:28 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v6 12/12] arm64: dts: qcom: sm8550-mtp: Add PCIe PHYs and controllers nodes
Date:   Thu,  2 Feb 2023 14:39:02 +0200
Message-Id: <20230202123902.3831491-13-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202123902.3831491-1-abel.vesa@linaro.org>
References: <20230202123902.3831491-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable PCIe controllers and PHYs nodes on SM8550 MTP board.

Co-developed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

This patch does not have a v3, but since it is now part of the same
patchset with the controller and the phy drivers patches, I had to
bump the version to 4.

The v5 was here:
https://lore.kernel.org/all/20230124124714.3087948-13-abel.vesa@linaro.org/

Changes since v5:
 * none

Changes since v4:
 * moved here the pinctrl properties and out of dtsi file

Changes since v2:
 * none

Changes since v1:
 * ordered pcie related nodes alphabetically in MTP dts
 * dropped the pipe_mux, phy_pipe and ref clocks from the pcie nodes
 * dropped the child node from the phy nodes, like Johan suggested,
   and updated to use the sc8280xp binding scheme
 * changed "pcie_1_nocsr_com_phy_reset" 2nd reset name of pcie1_phy
   to "nocsr"
 * reordered all pcie nodes properties to look similar to the ones
   from sc8280xp

 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 38 +++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index e756f83a941c..265862d0e44f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -407,6 +407,44 @@ &mdss_mdp {
 	status = "okay";
 };
 
+&pcie_1_phy_aux_clk {
+	clock-frequency = <1000>;
+};
+
+&pcie0 {
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_default_state>;
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1e_0p88>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+	status = "okay";
+};
+
+&pcie1 {
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_default_state>;
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l3c_0p91>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+	vdda-qref-supply = <&vreg_l1e_0p88>;
+
+	status = "okay";
+};
+
 &pm8550_gpios {
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio12";
-- 
2.34.1

