Return-Path: <linux-arm-msm+bounces-42837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6030B9F858E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 418E7189787C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0F31D5ADC;
	Thu, 19 Dec 2024 20:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAR9aHvm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7F31C1738;
	Thu, 19 Dec 2024 20:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734638921; cv=none; b=FcLZ61vUYDac99RZ73GL2WbU8Kz1rHsr4DjAq/kfUhPc44wVPFgsAY5diDQqFRF4PgakJUdlBVvHLVdHuD9KwvBnZIFjkLRnYIfEi5dIN43wPRAS+52k1xGzLSgEGbZwiEG0T/e7lNhINCkfRjhmOK4zVMC+4WqrnGuvCt3J8sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734638921; c=relaxed/simple;
	bh=YgN6D9Ys/2Lezq3gR3imw5IwQRTwzbav7hGzaKEanFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6KPc9xt174qAmUo2N5zKh4htzPLuOELNZBcs8fJK4So1HJLe9iS+1H2IPTtMLGfSvulX2HnfsxMEUUUtaVUDpFwY/R52VZdGSRqOXW2gAXakF34TrchU43+wIyTiZyqtE6s3cb6ijj8vPiw8kxszh22fN+0HTdkBuwmO8d1wqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAR9aHvm; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53f757134cdso1144585e87.2;
        Thu, 19 Dec 2024 12:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734638918; x=1735243718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcbSv/BZ9r21elj2oBuH8EFKvDsTWgFDboQJeEWvOGw=;
        b=ZAR9aHvmV701fUNH6YLM5anx+6RPSnd2TjsTrVeiGhtU9BUUBlSHdBhoe2jyCvQyvD
         mDpgKKJDGPT6exoXeYZ9tFWaenfyGHzn3uVKMY6ehwsmJjkQVteC055UehFsuT6grbqa
         hjjHHi5If9BBSCJ1U/ou8Aj3cxDuy2LasD/SmQjBBtLUtEEREQ+1kT1cjfo1wW0XUCvj
         fZAZLEuIfWRAK2jgJi0KFmo//P/V78OZp4J28Hk6g4j7mxcJ95qcjRUzhTBu6DaeJDUn
         jGVlVIeBwJS8rhkPf9bOSQg8euNb3SGgZVJRAjlFhqgpD2p8Z50Gn9qPJ1dAW3wa6jrP
         S57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734638918; x=1735243718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcbSv/BZ9r21elj2oBuH8EFKvDsTWgFDboQJeEWvOGw=;
        b=PsUP9wPzBlcDENFPk8GUKXnlTrTVaMR3POB+gO9hfBU+xw8QAhH9uV92DJqQMe/vJO
         J8GKeYcoDTaglZUN0rLm3yGQggGm+WJ0O9AYS8vf5qVKyg0nlpTFaJw6FeUS0UvHi+g1
         VIfq6Hd/DVJR6FfnjKACyWh3tPNLskOgFFEdY4yqtq6Xu0wjgWjlAtP71cu5vNMBbrsZ
         VU+jGY2WpfzBio2A4NGRaohfoMxfY1qnpDXwrdmYVpc0frupxQMI0eelbHwjo+Rv5+9Y
         Ss90chcZ5w4Dj0QSCFNaqXDLG5Uf2cghA6GQ0MfMTz7yP+KivkiHJR5Y/cBEI822FPxu
         OPvg==
X-Forwarded-Encrypted: i=1; AJvYcCUdFSgYUKro9E+dN3jB7dbThFfEK8lXX/b7gfWs44aCnggGbGR2vjvLZczx+31DQWMQ5hu4UblCfjpX/hgw@vger.kernel.org, AJvYcCXEkjZGNu9007u8BBXnh4k8J7yoYZO2lmDWZWy1fvHBF87EUGMJ+UzOfkLpsNfJtkVuO9ibcQHL3OCI@vger.kernel.org
X-Gm-Message-State: AOJu0YwgTnU/ZBlPbTB+3Kups5k1zGnhxU9VzuZtUvmHpIqwIC0HljA1
	O9njXJRj7DigxdTiOAyx1xsieO5/U7ltlbIRIPsMKttgS+nQXrX0HRv3cMhNqWo=
X-Gm-Gg: ASbGnctB1aRjQ54VRDypzKRxyJAMWLQHmbDxEVWtqX9rgfrP3FyObq8MmrSM/ayJocC
	1QnvQNck2ruS7FQzv54+MJSMK4MqkA8Jd25VNEATt0OaKMNQ0oTw67WtUJjH8J3kwPyW0gWKhAW
	Sr9ZFDjwkC45YgjDhqOfwOZ5lDq8Ytms7QrkhCrw9rB2N80ijMoJ7DY7of8LWWMRbmveJ4+zLMQ
	J4kl1GSAKWqt2gQJEpTwnUo3BWM84AYc2Pm9km3k5gu8JMvs8E3PgLluoYMnuoDXkSCWnHv/2T/
	bPo=
X-Google-Smtp-Source: AGHT+IEEvi2/2raC9kDgH7WhZ4VHJYZltCSM0Jn3wdfI79zWF1LU0I4Y3nWZK+5qF+mF/eQJf/EF0w==
X-Received: by 2002:a05:6512:3f20:b0:53d:dd02:7cc5 with SMTP id 2adb3069b0e04-54229524640mr7620e87.7.1734638917633;
        Thu, 19 Dec 2024 12:08:37 -0800 (PST)
Received: from localhost.localdomain ([2a02:a311:80b0:1c80:9433:9060:39fc:2954])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238135d8sm265642e87.145.2024.12.19.12.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 12:08:37 -0800 (PST)
From: Maya Matuszczyk <maccraft123mc@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add the EC
Date: Thu, 19 Dec 2024 21:08:20 +0100
Message-ID: <20241219200821.8328-3-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219200821.8328-1-maccraft123mc@gmail.com>
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 0cdaff9c8cf0..dfe009613b0c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -538,6 +538,22 @@ keyboard@3a {
 	};
 };
 
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "lenovo,yoga-slim7x-ec", "qcom,x1e-it8987-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &i2c8 {
 	clock-frequency = <400000>;
 
@@ -796,6 +812,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";
-- 
2.45.2


