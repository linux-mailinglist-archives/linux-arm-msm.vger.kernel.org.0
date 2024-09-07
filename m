Return-Path: <linux-arm-msm+bounces-31204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF0E970241
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 14:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A390B217B0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 12:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFBD15FA96;
	Sat,  7 Sep 2024 12:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uNKYK3nv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CBD15B57B
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Sep 2024 12:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725713495; cv=none; b=q90NVfDQq8aLaxtPQzyoMsMXutneML0rmXYSudS8DNd5xWtQOmUGWw2lJJtXCF6426hlyYkL/bKOiiat03flxa2ejVKS0yQKdEg6nV1RDofMZf8/EgPX+Rvk/Jq/4xXt78m+rvwvzdwqT2pUXOC6IpqkYqBEq3Sl7ttYXVX7PkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725713495; c=relaxed/simple;
	bh=mlgAAn6y1IVA0pzyPONzxQeJLkN87dF7Z/QWTl5Bx/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qEnDbxQz0ayZ0iXwqI5fuuClcOdaM3hqUViacWssCeu+pBzuPANov43+WleXiWYW4qDibj9kiRXmw1rkplIamCzrMAn96J7oALxrugmktUT0Mf6Eil49SiN+wkcArsuAO251UCsGo9ZSO8GNUJtDMeoCoF4lWaNFfFB/jbUm5go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uNKYK3nv; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5365b6bd901so1466116e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Sep 2024 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725713491; x=1726318291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ry35yCJ463+zD4OGlWWPKJGpjaBwBkhPM2x5J37i0CE=;
        b=uNKYK3nv1Q6V2rf8j7veAp/0f6/fVpvPAR5NmEn1aDgnzDndL0PW7jvFPnnzimlfSS
         dB5ONRRHW+fus2kSj1CbsFq1vKxK0Mgs3WKegpF3fMFWDClk/cyqfTWLiSSzHkFCusMA
         +5OpgbIz18or6/lxlwEWXy+wcwUbpgck2RPunbnekJmLZFT10O1QmGdLwC0xkQG0kGrh
         qLy3OUXZJqZnjwAd5srWJprPMNQcl2GKZoouOTFPTCfqOe7i4IdH1mTKeclo/uwA/xu0
         3L240WmmXaXxX1U2dkdvpSpb6fcothMDurserWfLY3yI9EdNR4ugb21wURPKcbQ+GWGu
         0juA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725713491; x=1726318291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ry35yCJ463+zD4OGlWWPKJGpjaBwBkhPM2x5J37i0CE=;
        b=qS5mtUpsnakK4yKDqfpdfqKl8csFHsqbYY09Pr6yjUdxxDsqFlvkqyU1rieMPlbpRh
         qORUP+xy9l6WSm58OdgPCMJ/4iNL8rIa61ocx/FCf7tUYpIkwVpcYfQBVe/n7LnbrPIW
         yihtwZc7l178lAe/4KQoho71XdulCE6nn+/xwnCSVMRa3q3yT4QZ8J9mmEAyYObDRW5i
         8Vd6EDktuWVOrKQdzatk/MJeqw0sopAR81rxnf/zg947MFsfKkgKBodQE+x5FVDYgjtE
         v2ZeF5cg/URKy7SczQmH1uSBMps6XuihfVALWH4tX99H6BOkkOEtAFMp6Nww2+euu/nL
         G9rw==
X-Gm-Message-State: AOJu0YwEgEbqtZiQwona91NCgmnH8KtdaOMXNFXDxjxSHsNE7GO6NBGh
	MMdUtaLmUfNhfGNwlZGlY6V9PHvvRd9R8BfShbs23/7I529VO7U4xpwqKvGNtH0=
X-Google-Smtp-Source: AGHT+IEOYXbGoGUO5kEmH5otBnf+rwik5L5cVUNcm0tfDqQeLLbqt7pwNbM7kCgryALND2b51rr12Q==
X-Received: by 2002:a05:6512:2c0e:b0:535:63a3:c7d1 with SMTP id 2adb3069b0e04-53658808338mr2826012e87.48.1725713489995;
        Sat, 07 Sep 2024 05:51:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f8cb76fsm143273e87.177.2024.09.07.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 05:51:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 07 Sep 2024 15:51:26 +0300
Subject: [PATCH 3/4] arm64: dts: qcom: qcm6490-idp: enable WiFi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-rb3g2-fixes-v1-3-eb9da98e9f80@linaro.org>
References: <20240907-rb3g2-fixes-v1-0-eb9da98e9f80@linaro.org>
In-Reply-To: <20240907-rb3g2-fixes-v1-0-eb9da98e9f80@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Komal Bajaj <quic_kbajaj@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, 
 Kalle Valo <kvalo@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=741;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mlgAAn6y1IVA0pzyPONzxQeJLkN87dF7Z/QWTl5Bx/I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm3ExOw/FMRhOsTTuXWpEh0sw/kSrPWZPsk0sGQ
 TR2yMbWxymJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtxMTgAKCRCLPIo+Aiko
 1fAfB/46pS2cy5RrZoYjuW5FHyWBpnDqz4QHMaQ1OS4nFZSd7ca0LgA7Qd4TFw0uFPFe2p5o/gm
 mfx/ghco0wj0+Xs/kakA5EqcP307OCrtgW55catskE0zAWKnQhTHDB7kzcGqmQnkvd8gfrift/Q
 jlWtr4GNvrEG3Fn7mvHgROrCg26MtTdGo+rBekA/5mjQovR2A3VU6U9fdHY4+Ao4TWY23wTj40j
 fPGzXvI15RV8jPdr5Og7+vGnG6OHsB91pqTCp4gKWa6hzAPo24lQOxAOKi/PqW6A5wA8Kh+ofy9
 vZhpZtq9PPrD9Hg48fe7dknHHZinlnZRHOD6X71RWiZYhYQC
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable WiFi device and specify the calibration variant name on the
QCM6490 IDP device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Cc: ath11k@lists.infradead.org
Cc: Kalle Valo <kvalo@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index c4cfafb3ec15..5f3d4807ac43 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -728,4 +728,7 @@ &usb_1_qmpphy {
 
 &wifi {
 	memory-region = <&wlan_fw_mem>;
+	qcom,ath11k-calibration-variant = "Qualcomm_qcm6490idp";
+
+	status = "okay";
 };

-- 
2.39.2


