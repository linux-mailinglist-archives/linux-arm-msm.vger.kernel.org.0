Return-Path: <linux-arm-msm+bounces-2853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F230880071F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 10:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EE721C20A3E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 09:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A171EB5D;
	Fri,  1 Dec 2023 09:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3/USKZBT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B6719BF
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 01:33:46 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-54bb9024378so2185776a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 01:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1701423225; x=1702028025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZnkqmBniHnZdrQ3H0Htq6tTPHmc+KBhKFIvMd2nGfo=;
        b=3/USKZBT9U5r3ON8z0C/0FP2StuPZ1WOGuqLuXknWK7ZRXXycnvwSRR05xuyomNL6x
         1DekGSE/GKymCfwW/ZuzO6cYgq5En2Lq/9VBgm7OS60rUyqO28oy9etmS86EQuSPlAgw
         hTQoBR5nFNgKwD+HtlGOryGSgAdTkXdN568R4pTbt+PfudPgRErJ1lboNvwrmyxHNLcp
         GBjM1hjCPq9XiKyoKw0slZWrsvDa4CGrphUghhFRdJnL6b4/2mk29pjjeutobT9kIFEG
         3jUfoTMSLr5teHPJ9eVotvPQnULCt0U/ub6/oYyBwnmLiDyNQjoSTzAgQZRonVTg41OD
         OemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701423225; x=1702028025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZnkqmBniHnZdrQ3H0Htq6tTPHmc+KBhKFIvMd2nGfo=;
        b=kP1eY+o1+JzrYRq4aFFwKtH6KCYJAyFmWWOef3yo1+fIFz5JgnCsKvEHgTMqUJrn95
         oPVqJpXSEmJxZ0b2lfXFsGM4REGm1mY2wwJwmMYXWGMAJsQFxQUQAB/tvKymq1Iy8bik
         SMYhF/OASrSX8QUOd8HWQ7ykqdXzsF7C586vDrJI/N5/dkMACYXG/nOX1mc9hAsE/WKI
         marGmP1EMtDXWlw7ZMLuhdd2VtNeQ1yP/l2Xx/Wh2Qd3g50q51Hhle7HY7l/NHVngufT
         nL0YTlBYNmJT9YZgdhL/0v2+KkRCftprnlFgEuTv9MA0TdjjFDCRXUo/Ljc2LrGdu0tc
         +4Sg==
X-Gm-Message-State: AOJu0Yz9J/pIJgWtdr3YYtFWC5K0XrYKjG1y+MT1gv0kQu0mW7a2YxRu
	pxOcdXUDVcJcqGr07KMT1FspQA==
X-Google-Smtp-Source: AGHT+IEx7bQWlk5Sk9+GArc/75DMVD8pdS1erYGGQPg6u7WQZOoG9DtK6vetGtm9IzaAPWFLj7T3Kg==
X-Received: by 2002:a50:d756:0:b0:54b:7e11:c1 with SMTP id i22-20020a50d756000000b0054b7e1100c1mr584027edj.10.1701423225346;
        Fri, 01 Dec 2023 01:33:45 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (dhcp-089-099-055-216.chello.nl. [89.99.55.216])
        by smtp.gmail.com with ESMTPSA id b16-20020a05640202d000b0054bbc6b6580sm1423708edx.31.2023.12.01.01.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 01:33:44 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 Dec 2023 10:33:19 +0100
Subject: [PATCH v3 2/3] arm64: dts: qcom: sc7280: Move video-firmware to
 chrome-common
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-sc7280-venus-pas-v3-2-bc132dc5fc30@fairphone.com>
References: <20231201-sc7280-venus-pas-v3-0-bc132dc5fc30@fairphone.com>
In-Reply-To: <20231201-sc7280-venus-pas-v3-0-bc132dc5fc30@fairphone.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

If the video-firmware node is present, the venus driver assumes we're on
a system that doesn't use TZ for starting venus, like on ChromeOS
devices.

Move the video-firmware node to chrome-common.dtsi so we can use venus
on a non-ChromeOS devices. We also need to move the secure SID 0x2184
for iommu since (on some boards) we cannot touch that.

At the same time also disable the venus node by default in the dtsi,
like it's done on other SoCs.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 11 +++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  9 +++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 5d462ae14ba1..459ff877df54 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -104,6 +104,17 @@ &scm {
 	dma-coherent;
 };
 
+&venus {
+	iommus = <&apps_smmu 0x2180 0x20>,
+		 <&apps_smmu 0x2184 0x20>;
+
+	status = "okay";
+
+	video-firmware {
+		iommus = <&apps_smmu 0x21a2 0x0>;
+	};
+};
+
 &watchdog {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 326897af117a..0ff9a2484096 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3836,10 +3836,11 @@ venus: video-codec@aa00000 {
 					<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
 			interconnect-names = "cpu-cfg", "video-mem";
 
-			iommus = <&apps_smmu 0x2180 0x20>,
-				 <&apps_smmu 0x2184 0x20>;
+			iommus = <&apps_smmu 0x2180 0x20>;
 			memory-region = <&video_mem>;
 
+			status = "disabled";
+
 			video-decoder {
 				compatible = "venus-decoder";
 			};
@@ -3848,10 +3849,6 @@ video-encoder {
 				compatible = "venus-encoder";
 			};
 
-			video-firmware {
-				iommus = <&apps_smmu 0x21a2 0x0>;
-			};
-
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.43.0


