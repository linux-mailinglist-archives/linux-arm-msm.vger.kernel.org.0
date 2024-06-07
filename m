Return-Path: <linux-arm-msm+bounces-22041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD8F9000F3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 12:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDD441C21FC9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 10:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C40115EFD7;
	Fri,  7 Jun 2024 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZwzZjMBl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C223915E5D6
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 10:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717756369; cv=none; b=bxwtEJashVEjn3HSJnyEg7Ee5oMXSc2JHBkTVq6kEBLCpRO5YGfB5O4+hhRnbPyHhqjSjw/+dE2yCkFppopup9zsDxRKO085EzDGYEy7rqya7SPIDTAhJtD4kRIepgaiFLpy32ZPCToBbQLwT48tcEhUUVDN0OhLNcdIPr12Hlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717756369; c=relaxed/simple;
	bh=PnfnR5ofvGmzR3cAGsWfb/IhnHMMQC6d23aEe+zKSy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hEnzvNvABHMV9YCS891fMbr26Dj9B+ItqprZBpXG2RWH5SJdZbh3IrkzL0LRdwou3yPpSUYHlmlF9cxrsEvKYS27kIIyVxeb+Rpfazw/Ge/Gj5KnztKMnJeH0T9r7k5GUkoM4c2YjI4FI2BoCANC8w2ujLkOoKjoKRlK4XPovXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZwzZjMBl; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52bc121fb1eso312266e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 03:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717756364; x=1718361164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXHqKTBMvkLOCUaVlIXFtEKAT5w67M2g4SR5gDtEQd4=;
        b=ZwzZjMBlkviKm7hLYTh2GyojWiloL92yDdacD9ISiWjozTqHjmndFVVLunSuYve5ix
         q2TGCjpoFTJhX+KDAPnr0jp/gsUgdY6F51VBV5/m1mw//2K0ePJQEvoFtOs+69/320hS
         1tggtsIBFU1n0Ow+A0nO9DbGvPgCbSqTtGDOmSMVmDcy3MtmVy7lvWohtHGPf/uU5Oa1
         FTcm0/uZfzQXLg4ZT9Zrgu+AR4xJqfxZ872EkMovnfcvSel4ba5ZaJLZ3KX7kjv3VUXE
         LmuKM5JNg19XOuUyfkPabHdRDnLDbpIuSwRHikAzWNqdss/PizHyHNlv8f7/nHXuo4Gq
         O9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717756364; x=1718361164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FXHqKTBMvkLOCUaVlIXFtEKAT5w67M2g4SR5gDtEQd4=;
        b=ejclQji3bNlFW0ZFWOZ8IwFz2NOxeEUkACclytnLrror/CZIdmg2HO5dstzknMsBTg
         trfGiTWtBnTZEwMtlCy3LvxZtJdSRloJH9ssIlSa4asaZW+ismt5Lu43gcuNxsNEquQ/
         4V7YcYdeFcCW8jtVZ9Rwhb9TqPqO+kvW7AprTCElugr/qxgsnWhH5kOK8WvsWA4o6Gij
         pgthJflrW2ldh4VXDJD88onLciAollOPa93vjUlfoJcT+tbCxkgTBQA1NAzUfCjrXMs+
         d9DkJ9UKLdlmpkmbTT5FTNUI1tEU+idH5HkjJuSrTHn35fRUj9/s2frMwLZRMkRfyDMg
         kS4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxIjWtwbNAizlWCFU8XBXuH2eCRgf154Rzqp46H2nuMgVz4flUWP/fH3IV0BiRLJxWkxxidPAZRrHxv3m6a35sn5W0SHZmQUDPg2ACQA==
X-Gm-Message-State: AOJu0YzWRNDln2ayBBkVJN+a1OFQjoJDEf9rOzO0TZuYMKb+6MsDy6tF
	U1XjQ7vx7DKIcx88LdD2NVVeWoa9d4Y7FJLzJdCrSDK9b6EDnT9PN7DBuLJRFb0=
X-Google-Smtp-Source: AGHT+IEfRmkgSUU4rpMbZOFELjyn83+vGN3nJk3zOmw8ySBp0WmCIA4DbsRjuoCjEBmt9MJQxmdGZA==
X-Received: by 2002:a19:7604:0:b0:520:dc1c:3c5d with SMTP id 2adb3069b0e04-52bb9fc9845mr1293726e87.42.1717756363926;
        Fri, 07 Jun 2024 03:32:43 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb433ccdbsm483448e87.283.2024.06.07.03.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 03:32:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 07 Jun 2024 13:32:40 +0300
Subject: [PATCH v5 5/6] arm64: dts: qcom: sdm845: describe connections of
 USB/DP port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240607-yoga-ec-driver-v5-5-1ac91a0b4326@linaro.org>
References: <20240607-yoga-ec-driver-v5-0-1ac91a0b4326@linaro.org>
In-Reply-To: <20240607-yoga-ec-driver-v5-0-1ac91a0b4326@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1967;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=PnfnR5ofvGmzR3cAGsWfb/IhnHMMQC6d23aEe+zKSy8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmYuHHBxgeav0A+9RvfFsEXls6VfuKcb7IDR10m
 Zk5aogfZoaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmLhxwAKCRCLPIo+Aiko
 1Z1TB/4w8ojB0N6DUKmdsakiEnBw5J8mQj+zV1BZkmejD6QKswwFDczgyKJYioes3K77JyBTh2T
 5T+eiopA2oQZaSVIKB1bXJhdMDDdHYIUqJtC4O5CRxrrUFbZD5fCUprV1k2mtcKI7LMTL+kOA51
 6TzjNAWa8wZdI87Bs17OXu8kR4igebJojCgjZQKppQ53Qoxfkj7kkQMnYgHC+gtDaCt6C4i0S45
 DFTrHXGTbvTC2NrVfRMwbyLKZZa94JwIur+qRY1UmaD/UfDYZAwu5qfAvjpQruT/P+PtPhZto4h
 tag9UiPFIhhR1ETyeVZi4yLXY9fI906cNj1pBj0WrgHP1PrY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Describe links between the first USB3 host and the DisplayPort that is
routed to the same pins.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 53 +++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 493c99c8ce10..1e2c396aca72 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4031,6 +4031,35 @@ usb_1_qmpphy: phy@88e8000 {
 
 			#clock-cells = <1>;
 			#phy-cells = <1>;
+			orientation-switch;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_1_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&dp_out>;
+					};
+				};
+			};
 		};
 
 		usb_2_qmpphy: phy@88eb000 {
@@ -4111,6 +4140,26 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis_enblslpm_quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+						};
+					};
+				};
 			};
 		};
 
@@ -4601,7 +4650,9 @@ dp_in: endpoint {
 
 					port@1 {
 						reg = <1>;
-						dp_out: endpoint { };
+						dp_out: endpoint {
+							remote-endpoint = <&usb_1_qmpphy_dp_in>;
+						};
 					};
 				};
 

-- 
2.39.2


