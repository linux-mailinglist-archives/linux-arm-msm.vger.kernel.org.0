Return-Path: <linux-arm-msm+bounces-73535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F044B57593
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D202217FFD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993B82FC86F;
	Mon, 15 Sep 2025 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Owojt/Em"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B4E2FB98B
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757930797; cv=none; b=QrY0sCGVY3NNs/QAHtOXbzoXmtfrta8S+94zFyW+/Kr3P6VHuzaVMUSwUEF56gBP2YGO4ohOICvas0raej+Gt2pWjkQbRraCYYMULJS0JMqLe4Rhrh+rX3cGVHBybicMCaVu4J2QoMShMTUARDx/PmzHOLik8sxlSb1MQg9XkwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757930797; c=relaxed/simple;
	bh=ydOKT1/PJG94gTRDvCWS3LKFYBuI9gTVeaXJDFPVqx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hguFouq1IsjScaRcTmxBYOYoc5VktyGgLE8sjJ9lzTPWzy+/mmwQwHZ/0zPlnW5ukyxJfVZYOtZUMOoCg048N9CPLES2EnzWGKN6wqMeFR2FpRLIriWib4Z2f30ghDtsFf9nRyzxhAIw6GUzSFeDtFkaz0490ApTlRKz5QbWpVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Owojt/Em; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3dae49b117bso3087268f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757930793; x=1758535593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOQbP+sOwhZlxt+ueHzX2J9z+zGJpRh33jkk4ePQOak=;
        b=Owojt/EmvXTER6bu/Ei9ZDB++JkWzlR0T8f8wYV8/T7+wB3Na3aFf40/YTUvvMqiYz
         MuExCgnm9FcBD6vILVf6erC13Pm7Qo4K7m2NEQHFTRxnAzxqvP2QKQkz1PWy2YaIK9Qz
         L+DSq88FoCg4RHlQLhD7QhsEfpTXJRnqEtWsQKgFrQZPj8EdhDNvuLpcl7v9K34EK6hV
         eNxSBnxsA6eU1ry3TGhSaFb3uZckX/ltmlTd7TncJRI2vxI8TyiLbHP3cZ04qBy3u6+w
         xv6IjB+0sWTp4c2Ev3bPMNxNvd+zvMuIgKXkK83g678psNZ1BB9w90KCKXbysGZ1dhOT
         PKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757930793; x=1758535593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOQbP+sOwhZlxt+ueHzX2J9z+zGJpRh33jkk4ePQOak=;
        b=uLPLy1sesajKFsS3EDaQozHJ3Kzr014E3ajvmV1A/VM1OxlAejD+u/xxmkTdh+5gal
         hORPC4AatbN4XKxzGrwZ3y9um3sByTcS+fA7OUQL0ZKVLdm9aB44sbDlr1mCtpVKV0uY
         3RxU1L5ORlO6TUzSwjbge2I6naSg2rlunvh9t0TYZP8Kb2XsYEEiJsL/GcOGYTxSbMZ3
         C6MRGAzBzplVaxEQPrPhv6MYL6qnQrCWrdPnqeWjTrPZOvpOM96JkbVd++I5f4jNHU1W
         N0BpidM2uIoGzbwwfVo3ijYXGn9CKZ1scXJSCiz1ufqbwFJ1spaOTTawK8DUQhi+/R+w
         vy/g==
X-Forwarded-Encrypted: i=1; AJvYcCU6B9olGMeK026POX0gmpCDc6QckM8H3zaz3E+5Tv4SvVmExy662XYbLhrOzllLblhF5oJBzvMd4rO+IHUm@vger.kernel.org
X-Gm-Message-State: AOJu0YyLh0AfhQI80EjpidITof4KnYAzi02c5iMrahGmw+WiONPwRAPo
	OWiGLA1j5jufUjRFHoRIwRDxrhQieXuDkD5FCS6tnIHP948LbWKNayBLOPwKFk9VpMo=
X-Gm-Gg: ASbGnctFh736rCi6SVbz6NrmIU86b3qH4HpDVSh0AWBtuccf6s/nUPNBZZ/7RNtV4J/
	5nu3I5FZzHrHqdaNNH6IuejOZGvN6iHcDXOSlCQXDTanfFp8n2ee1QaPccgMtdW65+sLN9AC/gD
	8HNkh66LXulsn4zvjGUVf98bd0fq9SXh0EASLZaA1x1vtYdwHdlOvxOMfcWmX8Y7S/M+vnCvnR6
	F6bjEDxXLK/Q8TciccVf6ddSbVL0NOIyPHzY5zXyVAF5/oJPFEadxHnTJQqHRMp+ylvDqvxGMqz
	I2cYVwub1A8xvNuHO5344s6JU3hRne4NlRedEnZsLqWmi3OGi7Wf1cI0PCMiZfkEtF3MVV5/0hK
	/eJpeZMmv5+sfo79I8I5BO1ZNPs4eEt1mIMI=
X-Google-Smtp-Source: AGHT+IEzxwtBmYCgbr0PgRIMPx7tGP8Ho6F6LYO4VA23DeY9gbeUHKdAFtYC67Zh77DHAR5Lzon3tw==
X-Received: by 2002:a5d:5f90:0:b0:3e9:d9bd:5043 with SMTP id ffacd0b85a97d-3e9d9bd5644mr3381016f8f.0.1757930792874;
        Mon, 15 Sep 2025 03:06:32 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:eee1:5042:e713:2e9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd4cdsm17209127f8f.37.2025.09.15.03.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:06:32 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 15 Sep 2025 12:06:17 +0200
Subject: [PATCH v2 6/9] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Enable IRIS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-x1e-iris-dt-v2-6-1f928de08fd4@linaro.org>
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

IRIS firmware for the Lenovo Yoga Slim 7x is already upstream in
linux-firmware at qcom/x1e80100/LENOVO/83ED/qcvss8380.mbn, so enable IRIS
for the Slim 7x with the corresponding firmware-name property.

Tested-by: Anthony Ruhier <aruhier@mailbox.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index dae616cd93bdf54bf2d3a3d4d0848e7289a78845..e0642fe8343f6818e1e10656a1d8fec8fb09e7e2 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1026,6 +1026,11 @@ touchscreen@14 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/x1e80100/LENOVO/83ED/qcvss8380.mbn";
+	status = "okay";
+};
+
 &lpass_tlmm {
 	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		pins = "gpio12";

-- 
2.50.1


