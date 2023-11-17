Return-Path: <linux-arm-msm+bounces-1011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B567EF88B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 21:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7A672812CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 20:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7316E46448;
	Fri, 17 Nov 2023 20:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lq5YaUbx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A37EE10E5;
	Fri, 17 Nov 2023 12:17:49 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50a938dda08so3472459e87.3;
        Fri, 17 Nov 2023 12:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700252268; x=1700857068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rp1PJD3fbqcG3SyJh6PyVw4BgbN/nqe7WX5bZ+cRyaI=;
        b=Lq5YaUbx1hOhI/LgQewG21k9qCyihRoUDudAj2WfRQeTP/zhvcB0lT2LUFay3xx6ZV
         E1c1djZCO95yHVfU918GhsUmvfOrb0E314VuxFPV94/DWV/eOIryPSDt2tT9zorgOJtL
         Fih6+BbTiXswNhbGImpnk/HEkCYHKlpoFZK05BmxZ2o0Mh32MpmIQ8Dq68lr0JtF56Px
         yHFLWCiFGjqFz+ZaWUDIgM7qnUQNVpKFRgotZfxOJx3GKpffP4aVbIHFV7+Y3c/9yrov
         PW3rXhTEagjmSjtTQ5O57EwtCZTwh5wC8DcWhDUt2rINnocd4Vmf6U3Z3V19/PDluDcS
         sLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700252268; x=1700857068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rp1PJD3fbqcG3SyJh6PyVw4BgbN/nqe7WX5bZ+cRyaI=;
        b=egqQZJnwm27QBN/PpawyAjvXS1H7RSRoEoozJGWd/4o3l5yT51E2YzAH4KHaH9328L
         C/MdXRKboqwncHaT8D3v28SXsuMqow5sdhEFtpe4FKPxoe0J98BOM1glLp3Fj8z84Q80
         X8Bv/uyeP7bFgO9OBIqqnkCOpmdyfL9JpqMt33tIwvPQanA4bYQ+hQRPVd8c9AzJoKAS
         6lpvGbEHVg+eZasVawOdPcAyxvmJgR95jd9fr+nN2VHC2/fmZVOOmap38EOU/o3aDW70
         YLG7vOcvscrZCV3kma7GEhWMBAXyfciAHBSHa59uCas9ICB3Ob/8zOGfyjLz4jj8acb1
         zHQQ==
X-Gm-Message-State: AOJu0YwUhWKsM6fQopyl+sf6hPCK2nE544r4DRgQY9uiFEYoag9vQBsb
	UYqR6pjnZLYjFGIHKGI/V68=
X-Google-Smtp-Source: AGHT+IEDzQxeOZM+dv5vcYduaxap4s88cpLIzNFvp1/HZZeJhpV/nKXrFTelwCaUsTnkXxb/Jtupmw==
X-Received: by 2002:ac2:5296:0:b0:509:4559:27a9 with SMTP id q22-20020ac25296000000b00509455927a9mr552199lfm.8.1700252267655;
        Fri, 17 Nov 2023 12:17:47 -0800 (PST)
Received: from david-ryuzu.fritz.box ([188.195.169.6])
        by smtp.googlemail.com with ESMTPSA id e7-20020a1709062c0700b0099d804da2e9sm1130630ejh.225.2023.11.17.12.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 12:17:47 -0800 (PST)
From: David Wronek <davidwronek@gmail.com>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Joe Mason <buddyjojo06@outlook.com>,
	hexdump0815@googlemail.com
Cc: cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	David Wronek <davidwronek@gmail.com>
Subject: [PATCH v2 7/8] arm64: dts: qcom: sm7125-xiaomi-common: Add UFS nodes
Date: Fri, 17 Nov 2023 21:08:39 +0100
Message-ID: <20231117201720.298422-8-davidwronek@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231117201720.298422-1-davidwronek@gmail.com>
References: <20231117201720.298422-1-davidwronek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the UFS found on the SM7125 Xiaomi smartphones.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: David Wronek <davidwronek@gmail.com>
---
 .../boot/dts/qcom/sm7125-xiaomi-common.dtsi      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi
index e55cd83c19b8..22ad8a25217e 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi
@@ -398,6 +398,22 @@ sd-cd-pins {
 	};
 };
 
+&ufs_mem_hc {
+	vcc-supply = <&vreg_l19a_3p0>;
+	vcc-max-microamp = <600000>;
+	vccq2-supply = <&vreg_l12a_1p8>;
+	vccq2-max-microamp = <600000>;
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4a_0p88>;
+	vdda-pll-supply = <&vreg_l3c_1p23>;
+	vdda-phy-max-microamp = <62900>;
+	vdda-pll-max-microamp = <18300>;
+	status = "okay";
+};
+
 &usb_1 {
 	qcom,select-utmi-as-pipe-clk;
 	status = "okay";
-- 
2.42.1


