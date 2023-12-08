Return-Path: <linux-arm-msm+bounces-3944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA7080A2F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 13:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7F43281813
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CA61BDFD;
	Fri,  8 Dec 2023 12:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OipLCJ+k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4A61984
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 04:16:49 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-33340c50af9so2024831f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 04:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702037808; x=1702642608; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3IGQsu1vJQMbo69tBMgGWpNsiQddO4zHQRIZGR7LoHg=;
        b=OipLCJ+kStFlVSGivHQiYKrEWWemyY6tRLO9Sq2AK7Rr4+hWnx9NrMxqdW/syw8hQR
         LqnhYqIX9+9LRRcgb+F6Au3OxwV8nf6iwTN52Ckfqk2MmxJyYXb6PpCNKK+MASbjMpEo
         Y12WMneBjUpAzEI76qOdnfegvJVwStaYKEmuCf2xTK+DvZfl8PN/lMiobynmw18pKfaN
         P+wnmI7qXa0ICjmxQ1M19fOWCteb+0YgTl3brLq8FkYsMxHbaAAC+lipvgNjWRZC0g6s
         5kPmL7lys2nBkoBC915mIQ6fiRnObchGRvE4Wca+kUruYqJd1yWmO8IvcpsJPveMPBg+
         L7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702037808; x=1702642608;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IGQsu1vJQMbo69tBMgGWpNsiQddO4zHQRIZGR7LoHg=;
        b=ivZ2lkWmQaWnGHoANIFYkVbEjOChyZT5CetAgS8G/iO782KeZFWWp8qTiKOeerW1FE
         E4mrWIyXiGvLUTfqAk/pWrnVwiYkQraHirPmPKbpM3GUaDbIRV+3sPvmN4/nq0yZKYhQ
         7BYkWAkVqfG5nbZaKRfS78+CHxEMO023TKE3X+EJsJkFGT4RLtvQoODfKO6g32ls7Jr2
         quN3oaZXIKPECyi9dbH6NJkJskPyZw/gfDMnVCfbndLkee//xUubvTZCONkquXyHoG4N
         ZloMqxAu8RiKppKUVQFoNtQu+/W6ZQxkCrjfAK+LkIr8X72+aorVKjGDtwnmpuMyY8gX
         14zA==
X-Gm-Message-State: AOJu0YxQdyjTujC4Ags2u57HpneEULPH9mEV7HvfIskxsPD8NMoR8SoA
	P3tgsR7F3S74ViKvaOCYtt+Qso4VXw5tPLzlCnEt0Z1X
X-Google-Smtp-Source: AGHT+IEMGZcYeTWbQirg0EcsaVOhC4OIZ6XlAwOw9E/uotiYomFPyW6VCwV/xLkgD4TBT064ePZPNw==
X-Received: by 2002:a5d:4d49:0:b0:334:b174:9a14 with SMTP id a9-20020a5d4d49000000b00334b1749a14mr1514761wru.50.1702037807788;
        Fri, 08 Dec 2023 04:16:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id p1-20020adfe601000000b0033334df1259sm1930875wrm.20.2023.12.08.04.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 04:16:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 08 Dec 2023 13:16:45 +0100
Subject: [PATCH v2] arm64: dts: qcom: sm8650: Add DisplayPort device nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-topic-sm8650-upstream-dp-v2-1-69dab3d074e4@linaro.org>
X-B4-Tracking: v=1; b=H4sIACwJc2UC/42NQQ6CMBBFr0Jm7Zi2hqKuuIdh0ZYCkwhtpkg0p
 He3cgKX7yX//R2SZ/IJ7tUO7DdKFJYC6lSBm8wyeqS+MCihLlKJBtcQyWGar7oW+IppZW9m7CM
 aKwcn7SBco6HMI/uB3kf60RWeKK2BP8fTJn/2j+gmUaBttHJC33RtbfukxXA4Bx6hyzl/AayZ9
 ynBAAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4416;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=kOCvkPLlhPEG/JnikF90pED2iti8kSKJ83SgUBzZTxc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlcwkuqP+jlemcECarZ3ZTC6PfD1TN15rZvEQJoLA4
 CoLOUxiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXMJLgAKCRB33NvayMhJ0UouD/
 wPJEHSTBdcYnhPmTrAS2yAh52G3rkupj1ymmp5fg8tOuMM7ze386TP2f3i8EGZ8O6UWxjSi0QafbRu
 KJcefLBkObxeiR0tShvkZHuYniaGs1PECAj/lYL8mqsL9IXuZcnpyw8XNrhys5kzOEj9xY8H+UkoLS
 6XT4krWjNJEiC4821RxffsMYMVzIyZXL9wmIzMcw/gIBO0h1W/gJ+RlNEYIzYo/HTEmGxvb/UL8e+G
 MMhYWgD/GrD1rAWoDQj2gT++ozqVjs9EB2M9CD4Xo4/55at4gcuevNSyIixyZfa6TMxJjUns5gbE5c
 j4W5BIlppzLF2R1YbKea6giUr9V42MA2L8boTt+JYHtVG2lcH/O2Tz5zKaPgW4RcJQ3o82Chi7vcpi
 nRAPuFPUXJWg/SHnuUWYref0MX+qXBcnvbMtdoFeU5pXMl9HIIJgTuHzmqNpaUJZeEjdrxrBK/cBVc
 vc/VKYWsPMMX68IBKA0sLAD0k4vFWzYC2PDTNICKHugVMt7rLJhcvcZU3esJpMraLnjYfca3DT2acY
 ynuWCRjRk0prze4e+NpzV2PHOrq7drMBdtuO712glv3ZUm5cMijCYA3BRIBsEzD+yFCKF3LhvtmymC
 2HWLEPQXbOBC7VRHBCzonwhtrw3DVX5scowA/ucuu3M0HL21jPipN1RpefFg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Declare the displayport controller present on the Qualcomm SM8650 SoC
and connected to the USB3/DP Combo PHY.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Dependencies:
- DT: https://lore.kernel.org/all/20231130-topic-sm8650-upstream-dt-v5-0-b25fb781da52@linaro.org/
---
Changes in v2:
- Dropped applied patches
- Fixed regs size
- Fixed power domain
- Fixed subnodes order
- Link to v1: https://lore.kernel.org/r/20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 120 ++++++++++++++++++++++++++++++++++-
 1 file changed, 118 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index d1442b100e79..2e6ee5d89e01 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2781,6 +2781,14 @@ dpu_intf2_out: endpoint {
 							remote-endpoint = <&mdss_dsi1_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
+						};
+					};
 				};
 
 				mdp_opp_table: opp-table {
@@ -2982,6 +2990,88 @@ mdss_dsi1_phy: phy@ae97000 {
 
 				status = "disabled";
 			};
+
+			mdss_dp0: displayport-controller@af54000 {
+				compatible = "qcom,sm8650-dp";
+				reg = <0 0xaf54000 0 0x104>,
+				      <0 0xaf54200 0 0xc0>,
+				      <0 0xaf55000 0 0x770>,
+				      <0 0xaf56000 0 0x9c>,
+				      <0 0xaf57000 0 0x9c>;
+
+				interrupts-extended = <&mdss 12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&dp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-162000000 {
+						opp-hz = /bits/ 64 <162000000>;
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp0_out: endpoint {
+						};
+					};
+				};
+			};
 		};
 
 		dispcc: clock-controller@af00000 {
@@ -2996,8 +3086,8 @@ dispcc: clock-controller@af00000 {
 				 <&mdss_dsi0_phy 1>,
 				 <&mdss_dsi1_phy 0>,
 				 <&mdss_dsi1_phy 1>,
-				 <0>, /* dp0 */
-				 <0>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <0>, /* dp1 */
 				 <0>,
 				 <0>, /* dp2 */
@@ -3054,6 +3144,32 @@ usb_dp_qmpphy: phy@88e8000 {
 			#phy-cells = <1>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dp_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dp_qmpphy_usb_ss_in: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_dp_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_1: usb@a6f8800 {

---
base-commit: 4f6dbd119dad99dfdc5051b7a1bd123cc479e5ee
change-id: 20231207-topic-sm8650-upstream-dp-ab1fc1bf0c76

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


