Return-Path: <linux-arm-msm+bounces-3322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B528803955
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 16:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CABDDB20BD6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 15:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171CE2D04B;
	Mon,  4 Dec 2023 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mWEYmch8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE27CE6
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 07:57:54 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54ca339ae7aso2073134a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 07:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701705473; x=1702310273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIqBW47UxB0U4Lntp8XanrWtWvMtJnMZvAyQeQ8L0HQ=;
        b=mWEYmch82HJPlD01A1tSOXI9cqeBCLpnGSTCLgj6Uw5C5iBEOB0CYoM37XsDd17bRl
         qhW8TJaWBD/sFpOCLFHwF1Y4qbs1cX9DcDO00vr8pXlT+FmWq9oTpFxmfO/aHpiZrK34
         lRxYkEdayp4m6RfSm0HzZ8w2fPxziDngJeff1VIs6xcDSAvc8+yDoyAsO/ODtm2CLldp
         I4fH9KGtmHm9YIFxM2uBlRf6zkleZW6R5JinaxzdcPL8s2bUji+b0U0St3l2HS4gPtos
         QK8kcC/Tt9/yJKTkPJPjPc2fOpSjhXtPlVfVYkpQnQzA/ZDGPM8XfW3AFTd4EzwypHby
         0WXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701705473; x=1702310273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIqBW47UxB0U4Lntp8XanrWtWvMtJnMZvAyQeQ8L0HQ=;
        b=XC/xFZEsIkL0DQI1c87rBWehETB8Rw1OyMpElEa8wyHd2UUlGD2QQOskXoSa4ONACG
         kxLQtVjioID6Fb9dBZebn7fJuSaT/4V6+oeNMwczMXRgYlNvTTstc0iAJ0VYY0vqSvJV
         vFI+rdq7nJ/ehsw0TuKQJcQSUYCdFDT3JxlP8i22zfkh78WOdQCYx43HWl1vsh0lUC1T
         ZQQPxP2VCp9isun437NfXnqSAnL6BbYP1fGi5St3vr515hhQKkWteYOXnKyOvQVEXPcj
         ElJDExGPgDilxxWDABpjLFexPcS8rYlLHC15NB1T4TbQ7Wagk1KPtj0Mb1XeGm0mC4ZM
         7sVw==
X-Gm-Message-State: AOJu0Yzw3EWeHMiTmJygQiphdy+gbZKGUGo+FFqFoQmp/BwMJebsp8lN
	Etunv+rGxaBGv3HrxwQMFWzq6g==
X-Google-Smtp-Source: AGHT+IFYj5YnPquUnio+bwx8ZpNrfUXJB7IFHnM9MMZ/9hhhiBQGCLEV30qbcJTadkZNHXXqY65OYQ==
X-Received: by 2002:a17:906:f94c:b0:a1a:f475:2ebf with SMTP id ld12-20020a170906f94c00b00a1af4752ebfmr1515131ejb.59.1701705472340;
        Mon, 04 Dec 2023 07:57:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id q19-20020a1709060e5300b009a19701e7b5sm5429304eji.96.2023.12.04.07.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:57:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 3/5] arm64: dts: qcom: sm8650: add ADSP audio codec macros
Date: Mon,  4 Dec 2023 16:57:44 +0100
Message-Id: <20231204155746.302323-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204155746.302323-1-krzysztof.kozlowski@linaro.org>
References: <20231204155746.302323-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Low Power Audio SubSystem (LPASS) / ADSP audio codec macros on
Qualcomm SM8650.  The nodes are very similar to SM8550.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Bindings were documented here:
https://lore.kernel.org/linux-devicetree/20231129113014.38837-1-krzysztof.kozlowski@linaro.org/

Changes in v2:
1. Drop assigned-clock-rates, split clock-names into multiple lines (Konrad)
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 86 ++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index bef4582f2a26..49bc52271301 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2611,6 +2611,92 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		lpass_wsa2macro: codec@6aa0000 {
+			compatible = "qcom,sm8650-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
+			reg = <0 0x06aa0000 0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "wsa2-mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_rxmacro: codec@6ac0000 {
+			compatible = "qcom,sm8650-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
+			reg = <0 0x06ac0000 0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_txmacro: codec@6ae0000 {
+			compatible = "qcom,sm8650-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
+			reg = <0 0x06ae0000 0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_wsamacro: codec@6b00000 {
+			compatible = "qcom,sm8650-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
+			reg = <0 0x06b00000 0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			assigned-clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			assigned-clock-rates = <19200000>;
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_vamacro: codec@6d44000 {
+			compatible = "qcom,sm8650-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
+			reg = <0 0x06d44000 0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec";
+
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+		};
+
 		lpass_tlmm: pinctrl@6e80000 {
 			compatible = "qcom,sm8650-lpass-lpi-pinctrl";
 			reg = <0 0x06e80000 0 0x20000>;
-- 
2.34.1


