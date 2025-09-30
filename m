Return-Path: <linux-arm-msm+bounces-75593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3492FBAD1EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 15:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E90891C7E5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 13:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CC6305E2F;
	Tue, 30 Sep 2025 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="YnmsVLG1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B34C3043C3
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759240644; cv=none; b=VmDkZ3o5tMwVf8m7ErjOW2MhGTj2olCSTGx9jkaG/BYAd2oMfKusMo0AQmr9ViWRzLEKC9EKySpOJuTMuMGPkkiZntN8niMloU1w8RMYT7SyKaoFohCWa8Wi1sE1VLj55EIoA7w8shVEICAgKJ8jWgY0DEPJMnJ/NMdOJUvXLC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759240644; c=relaxed/simple;
	bh=VdrjHbZY8p6JBS2yBxBjZF8UPgGBrsrohOZQSKM2ILY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bhDO1Py5uAemQszHLQFzmlqb3SYXNjNACR4UQ9WEisCC6RUG3zeO44Px/81P5ogfVjb0NkW/PEg9KfuwPks2Cf1dhopEhqLmoV9X08U1oBzjiwouNyA7AB0/RPMEcEWvB0K7aho6+a1CuIt6/XkCHT+/qWNgmAk41zM76SfR4uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=YnmsVLG1; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso12909641a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 06:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759240639; x=1759845439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IhQc/KxHi+cDc2kNGR6DJ1hzrVsKnRbRYRWEuK1eFg=;
        b=YnmsVLG1GKEDlBWH3NHQeJz+1pBjCRM3cISRPIOJSAjbF6pNP+JuNQSoL+qXt2cQtU
         18vGO3YJDMeaWQDNsm5TkW2J7InP4yPF3RVyRWvFP90rlbxm+ZbW64opvTS+s9cKeL8d
         vOEVv2TtQ9whNkXzM940UHyIRJTO2bVzb/yolDtBRs9SF2vo8DFbcYKFpgmEkCnDoVvR
         eVAbzVCOD7arZ0pIB0QM/63Vx9PK6mYNxtf9BRXoYLP5nVQqR3b30OrRAjL7Km0VbpZv
         bX4h1Zuht6UOdNZG2pZMC40x6DksXizwIJp0QGUXFLZ958cmgqG+ZEa31n/4n1fURCzp
         wjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759240639; x=1759845439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5IhQc/KxHi+cDc2kNGR6DJ1hzrVsKnRbRYRWEuK1eFg=;
        b=KXg5rbg1tUiYgopH9bwjDo8p2RHvkW9Tr6wuoUmHOhHTWYu4gPjZZlB1An6xSfZa63
         cFCxuWqBZpDCv8NyZ6WxxHWhkW4MpqlNwCSovL4Y9FrVyXAsUvUNzsgpiu3pP+uouTKG
         jJOD8pj0Aavx0dVODDjA7JlreiMnxNqpKPrtZJOCJM21oJcQQ+iRd9FnZ9znZR6HLw05
         6CFf7uXq5KOe8ZsUexp3knz3QUKMf/gROc57ztdqiIeeRj/qRMIgGBQRdP1NCu9UZ9lm
         ak5Mn87uIbRW1tHUGQqHilE7vfOKMONaP4/jVU0rVcRWiFwz288VA9kiW0AiljmK2ch1
         Lmvg==
X-Forwarded-Encrypted: i=1; AJvYcCVrgGE/0JMAjIl1eY/XeSGfu47k+rTnf7XFrLIeyRS/wP80OVPVdtU58HLoOHV51LpaetP68jBn1XhOxdRg@vger.kernel.org
X-Gm-Message-State: AOJu0YzLawrn3HwHPku3UK1i6sGkTc6rlT1D5wwstzoxGtJdm8uWDgjL
	lNsbLrie+ruUIsvw5JsLdaGNlVCp/v8xKDNf0pP7PF4DRtLKbfBVq1N/sR/8Ib/7alM=
X-Gm-Gg: ASbGncsiOnX5F+bPqjWwj8xfO1WTneWFwTSt35UyEYJbFFwz4cHEFiSnp72DOwq0MMv
	VPoytjjVnYhn5YD0+t7PYk4FaQDMIRio9EOsZnyhAcxoxn31+wHyChatOmErXi0iE79AOlAJh9W
	fISF41RUsH7FQN1nKosg3Ib+3jUPg1nF/Zlx6xVPwKO4Y3pxKPRdO37bYjmdFLApib46wIrQ537
	2xPdS7GUdfVIsT59yUsigjYas4ARNNVHb5KLLR2s15f1jHxOFIeMikppARVM8G5JX+5bgGXY/DK
	v1i2bzwqLPTRgOFAdaenglADzNGibmq1NI/BzqRx3fkH75S1RMcvUh6V3Tc5lVRRH0ugFxRfcwq
	qRWjCI9XiwpYlNtxPcz8V5JbDRZo0Q1O9gK8/SRtIR67GI6JIvcFgUPGdOilp514uNDWhLRyH0t
	l0gDIAm71xAuVuREP+0A==
X-Google-Smtp-Source: AGHT+IFTx+BUtdYFfL6HuTb1lAb8kQTNr6zB4Xa+33+fIcOgSz29G8fLSpBMc7T/d9jfJ56OBR2HxQ==
X-Received: by 2002:a17:906:6a1b:b0:b3d:73e1:d809 with SMTP id a640c23a62f3a-b3d73e1ef65mr951599166b.48.1759240639542;
        Tue, 30 Sep 2025 06:57:19 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3fb818fb90sm370234866b.63.2025.09.30.06.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:57:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 15:57:04 +0200
Subject: [PATCH 4/5] arm64: dts: qcom: qcm6490-shift-otter: Use correct
 compatible for audiocc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-sc7280-dts-misc-v1-4-5a45923ef705@fairphone.com>
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
In-Reply-To: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759240635; l=869;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=VdrjHbZY8p6JBS2yBxBjZF8UPgGBrsrohOZQSKM2ILY=;
 b=o0gnni3kPdNO8veSF1wAx3y60Q78M2zZesq5qeidQB8NNxrF5O/6nLJWVHRu7ouKyWaZEAPrV
 ory0fpzeVztCEIjjhL/6QuRUTbzUT9onXoQyRzZnEeVi2/Wb7hk6jyw
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Use the correct compatible for this phone with standard Qualcomm
firmware and remove references to power-domains from a 'reserved' node.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index eb8efba1b9dda422dd0295db2a52420a1a23d070..6be2ebb2958f5535666ddc3866d2eca9272abe59 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -568,6 +568,11 @@ &ipa {
 	status = "okay";
 };
 
+&lpass_audiocc {
+	compatible = "qcom,qcm6490-lpassaudiocc";
+	/delete-property/ power-domains;
+};
+
 &pm7250b_adc {
 	channel@4d {
 		reg = <ADC5_AMUX_THM1_100K_PU>;

-- 
2.51.0


