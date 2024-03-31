Return-Path: <linux-arm-msm+bounces-15856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8707A892E6F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 05:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91C4A1C20B5B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 03:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1184416;
	Sun, 31 Mar 2024 03:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fM2Od6Du"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B40B1C2D
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Mar 2024 03:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711856939; cv=none; b=B9eLqiJKqDAo3ajhfGC/asLVYT4c91hcKUXD8EX/kw8kbuPY3Myvd3tKYHQG8hqR3gbDbOb2PeKYYhH5Y03EPW985NxDRsB6NKaQ3PXzeo5ybPkvgDjqwX8OPXwgwe+oRTnTEDnAxAINDAqm7ck3iryuLJqw/MPnyX0GSdMDlwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711856939; c=relaxed/simple;
	bh=CLQVhmk/27P67Q5DDFf+FMW5mOTK698dPfd2w+evFJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gOn2lI5GkwIiUfZVk0GqacNYfc7rWON0pnibGuhNwEiUmdPQlWLFxDz2aBcPvoo9oySdRgTzhhttSdBRXb4QA9j1Pz6nlwrCugGsvzos1golVneMbawC5naidBGDHIGMPpLoZ5yMcVx2maLyMbJlGZXIutEg2ZCnagdeuvdpbGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fM2Od6Du; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5157af37806so3480719e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 20:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711856935; x=1712461735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VaUekUYydxWYYnPrJdmSSBGQEd6ZZ9qkV24cX+A0hWY=;
        b=fM2Od6DukrXxhDFkX9LFg41Q5zbh/vhxTvW1XY5K+6FwjIq4ndwZ2ODbLZAKT9sJxV
         ZN/Ltaxwwb+Hq9upoNXkiWoReLxYwLqv2aZmx/4rbyvFFQytXpHoHhi4l5H6/GbInoIF
         nl68+zAiPG/jF0xWf8F+jEUuXg+J+hDKvHHypg+wWbOiN94KSIRauN4hV2DxBhQLiAaC
         ABf5uZd/pGDVYguvahgj0K46559VNMXX90RlD/x5ks5khsKL3JJNhdzbomhS2xmpMnGS
         yruk2x4ZWPDHtoc1UTJVe4Yg7r4qIQ36bnWrX1L+Rk5uwAEphm24ToCO4gcYpP9ZIooc
         VjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711856935; x=1712461735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaUekUYydxWYYnPrJdmSSBGQEd6ZZ9qkV24cX+A0hWY=;
        b=DKfwhKcgc7cbCVIQnDwGEpJ6Ew9bUnKKO0JPnPvGpsQ2LCuILvOSlcXbw9O3dgY7PF
         FtslysUXueXb2OT0SMjx2321TbUDl86E/dy5Mv5UWdh6CqIhf9dCWkeI8BkkzlrsgSLC
         eduYqLISlZoPOhxJHfnB09pT9gwxHkGoq8BuJYUKi87WEZdXQhbJfhuyvYOzl1G5Njzb
         WLAkK2phfXoqaAW6gAZJ+1XGVegwopoVP7OsQik60NFmkxY4rD0aCWKNBDVnzZNvfr13
         /PGJGr3ZR5bzcH2JM4h0JZELzbf+mU98C6CO+ZOVzLcEHswSmTnQitGjk59thMwyQlnf
         U2nw==
X-Gm-Message-State: AOJu0Yzq1FrDN3ony2nfGUr8+seHufBH9KWuvoF/12sqcnlkcCL7LLkW
	BiIMSXPS6BVnrJPXq7o1A2Ak5GrUF4x5KVdgEYa2xXaIcZSBUl58AD8Y3dWXRsI=
X-Google-Smtp-Source: AGHT+IGV4QM+ZQyacTcVF0aiO9yNi0KWBTjwtVHf34aREHi/p1o1yA6zAmftfb1gT6OIXQyLIpZQRg==
X-Received: by 2002:ac2:544c:0:b0:515:a799:604e with SMTP id d12-20020ac2544c000000b00515a799604emr3837322lfn.41.1711856935018;
        Sat, 30 Mar 2024 20:48:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k9-20020ac257c9000000b00515ce9f4a2bsm762980lfo.35.2024.03.30.20.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 20:48:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 06:48:51 +0300
Subject: [PATCH v2 1/7] arm64: dts: qcom: sm8250: describe HS signals
 properly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-typec-fix-sm8250-v2-1-857acb6bd88e@linaro.org>
References: <20240331-typec-fix-sm8250-v2-0-857acb6bd88e@linaro.org>
In-Reply-To: <20240331-typec-fix-sm8250-v2-0-857acb6bd88e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2725;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CLQVhmk/27P67Q5DDFf+FMW5mOTK698dPfd2w+evFJI=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxrHXZU0JhmlOAMjHy+ZZZLbjsVf3B1SLny07eR19U+PV
 zkt6d3YyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJ/DjK/j+8I/rvmdDH1oab
 79/Pu79OTfjJS+du7tt3W9dZTZ+xKXRfU9/BtQuyZts9/1h9cNMCgQBJKYvzVwwsrrs2pv4x5q4
 Ulnb24Vabw/aK+9+/m5lZ5zWX9va3vfEwnJItxsPx9dmBQK+sOYUNVUGiwc+1N33ya+Ir8828Nf
 /AN7WkRXd/h8z3jHMy287ePY1H7xmHY3bVwr6FEjPy+P19dOPf/+UWs2gMD2XNYJtR7nX8uPn3e
 WcOy3FODsxya8rKqGtvYOWa0+6UvVg5aXPXrmJJR/e0IDbDH5rx+SfN+pd/ONQrNdWM7bpgNWPC
 JHdX22fnZa4HH/n7cNIr2T8uBZcCt0nX1ta37Obnn7ADAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The OF graph should describe physical signals. There is no 'role switch'
signal between Type-C connector and the DWC3 USB controller. Instead
there is a HighSpeed signal lane between DWC3 controller and the USB-C
connector. Rename endpoints in accordance to that (this follows the
example lead by other plaforms, including QRB2210 RB1, QRB4210 RB2 and
all PMIC GLINK platforms).

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                 | 8 ++++----
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi | 8 ++++----
 arch/arm64/boot/dts/qcom/sm8250.dtsi                     | 2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index cd0db4f31d4a..44239d1e57e9 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1356,8 +1356,8 @@ &usb_1_dwc3 {
 	usb-role-switch;
 };
 
-&usb_1_role_switch_out {
-	remote-endpoint = <&pm8150b_role_switch_in>;
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
 };
 
 &usb_1_hsphy {
@@ -1465,8 +1465,8 @@ ports {
 
 			port@0 {
 				reg = <0>;
-				pm8150b_role_switch_in: endpoint {
-					remote-endpoint = <&usb_1_role_switch_out>;
+				pm8150b_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs_out>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 2042020eb0dd..6cc0bcb40f1f 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -659,8 +659,8 @@ ports {
 			port@0 {
 				reg = <0>;
 
-				pm8150b_role_switch_in: endpoint {
-					remote-endpoint = <&usb_1_role_switch_out>;
+				pm8150b_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs_out>;
 				};
 			};
 		};
@@ -723,8 +723,8 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
-&usb_1_role_switch_out {
-	remote-endpoint = <&pm8150b_role_switch_in>;
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
 };
 
 &ufs_mem_hc {
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7f2333c9d17d..440bbb89bf8a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4196,7 +4196,7 @@ usb_1_dwc3: usb@a600000 {
 				phy-names = "usb2-phy", "usb3-phy";
 
 				port {
-					usb_1_role_switch_out: endpoint {};
+					usb_1_dwc3_hs_out: endpoint {};
 				};
 			};
 		};

-- 
2.39.2


