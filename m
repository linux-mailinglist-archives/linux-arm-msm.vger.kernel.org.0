Return-Path: <linux-arm-msm+bounces-73537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7AEB57597
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE9361AA0A9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B402FCC06;
	Mon, 15 Sep 2025 10:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hzF6fvmq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEA82FC037
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757930798; cv=none; b=udPKynyzzItHtBJlQFtub+DDohz/QW+2y2n52M9sp/mT9cQ+zVQeFZFMmgIiuljRR4r/c1Zei0uXfoB6Y0rEREIcGVsJMuh9jpaqG4c43kim4KR5UsE7T2lNoo4BFDOEIWDlYD6cAREyV98AIft8Z2menx6ryqaZkc8jOIeyoW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757930798; c=relaxed/simple;
	bh=hJIwkiz9sypHEiHD79ZpOaAj0rAaVF4u0ldF0tcXL3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S5WZQflZlUa0cfcwKjC6MAJ8L6TcGttkQAPkFQehSmEZWO8wEYVOLh2wpWm8zDiZAvUCHnevYxGhOsjcoyDw8CZM0avgPpHL579NMUx7h1f5zUKgCgoJuqQBJMO+3Xd7ySF4ivmPNGztNzOyYuAUXICe/MEufdv4ticHDmLLtm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hzF6fvmq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3eb3f05c35bso356560f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757930795; x=1758535595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGHFxRjJDleNewjPVp65zuO30fhwOTH80zSHnSHmwac=;
        b=hzF6fvmq27vDWGU1sWwnEn0bqwSoD/YumqTGOuCIbGO6ieR9iAe9mOITX16KuAdyZJ
         S0pVS6WVzDm2dDoUJcJYyiAo+KLBYsRN4JsSnWuqrwDlOrh4CJzTBxPhSDK8xdOs6TcA
         6Pr3aMQnzd9fBbTJJShAN7NIvbQIDn+inR5Pjg5Jotl2o/EFsSilnKrmfHyhX2vqoyPl
         Jtlz0H7tKuBF4RcQruhXT3R7DRyeO5JAdlmwfSwGxC2BKjvXRhwb+Q2a8shblJ1uvKjC
         hjgB76HRqnphp1NxtRUW5MLO03gMDDcq6CAEGNupPrK/NGuZukJdirfmrkHzJhd1upke
         Fl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757930795; x=1758535595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGHFxRjJDleNewjPVp65zuO30fhwOTH80zSHnSHmwac=;
        b=w5/rTXDEGyFE7sMSHHhWUQI+Km7W2tjYN8e8960mmGXFBIL6KwtvWYFKLDDGxmiP0w
         ryiEK8Pij1XVRgY79WMrDr1Lmje6JRi3OWLHJMiZ24cqiAmogPb/otvybZuea8VPx687
         iTHaSwFiE25qzdSVdPXvP92OnxRUu+b1CiWcRhTL7blLCySiJzEtT4bDNkW4gYPiizRH
         KgrIXxmzJvAMy5klHYr7v2p2fB2RS7SNR+vjSn0mETFXx2Nqe5URjSMrQvAXCKOdY/tz
         ZHBRX6oM37bouiC/aY6BzMVzZ5oL2VS2AH2nJ6IVovlkD1B8hbeqjjNg/OB7b+t/e5Vu
         /qaw==
X-Forwarded-Encrypted: i=1; AJvYcCVBSj8htdF+0UR4nQC/mT254RHgsi4qmDJZJxggmi0gOcFP+YisaWbnpXuiawbhMF+BymJPvqrnxsBqfcfI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6KVFPQFjgh6akf43fr/3QBXfje9UBOr++ZN0GNBcvA0pis7IO
	HaGydzicf2yt14wIU5R/1X0THSY3qDyU/A/wEiGeNGBpPRBwAcWN90p/1TJoq5nv8q4=
X-Gm-Gg: ASbGncvWMQUuGp9otSiGUwUoSHe/65j+6lH2mY9y71C9dMIObTTVOeguenQfiXsU2ze
	RXqQ/+Gb2yJADbUfxoSvB2QqVpd1aBpdwA1EYeJpkTtcjxp8m9RGqv7FSzj7utO+dUzT3tClBwn
	2/iSlt/nEDb5VsV/fsymy6eyFaKFoIceAJv7cnjD+H3fGpdiY0EIEcofA31H1mP44bPFdraCG7d
	PRNoiHd9C2mEfRYDQpQDVc9qpjg1u+qVts2bZVVpTphHyxX4flPxBm0wUQ6ixdhZf09trJ96qp+
	v0z/u/iQqSIMDLuAaL68cp5FKbboxuNIUKZ5skcLlCq/SFO5QKEwkPh6EYvWvhzbC2v6MHfo1B7
	ELdmtRaOhy7gvie674iDDDxncVpx3p5VTWeY=
X-Google-Smtp-Source: AGHT+IElgrSVID5upnr61Jr9QDLifzP3jmV2135LUHdvrrOdgcUm13X1jm52Z1V6i5ZQyQaHDlAhTA==
X-Received: by 2002:a05:6000:1884:b0:3ea:9042:e69d with SMTP id ffacd0b85a97d-3ea9042ec43mr3268023f8f.17.1757930794918;
        Mon, 15 Sep 2025 03:06:34 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:eee1:5042:e713:2e9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd4cdsm17209127f8f.37.2025.09.15.03.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:06:34 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 15 Sep 2025 12:06:19 +0200
Subject: [PATCH v2 8/9] arm64: dts: qcom: x1e80100-dell-latitude-7455:
 Enable IRIS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-x1e-iris-dt-v2-8-1f928de08fd4@linaro.org>
References: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
In-Reply-To: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Anthony Ruhier <aruhier@mailbox.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>
X-Mailer: b4 0.14.2

Enable IRIS to allow using the hardware-accelerated video codecs. The
firmware is not upstream in linux-firmware yet, so users need to copy it
from Windows to qcom/x1e80100/dell/latitude-7455/qcvss8380.mbn (just like
GPU/ADSP/CDSP firmware).

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts
index ace2a905e4430d6cd1db59e9a9fb7441f7fe0aa9..32ad9679550efce1fda1182bd874d6a3c53d8f03 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts
@@ -38,6 +38,11 @@ touchscreen@9 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/x1e80100/dell/latitude-7455/qcvss8380.mbn";
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/x1e80100/dell/latitude-7455/qcadsp8380.mbn",
 			"qcom/x1e80100/dell/latitude-7455/adsp_dtbs.elf";

-- 
2.50.1


