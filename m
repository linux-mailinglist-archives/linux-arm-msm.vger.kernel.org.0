Return-Path: <linux-arm-msm+bounces-73538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4633B5759D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A69B417C876
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E535F2FD7BB;
	Mon, 15 Sep 2025 10:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mwVaMN+O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9542FAC12
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757930800; cv=none; b=ZVV9kKoV3CdMxfC5FzfF/1dUYQT+o9JkeNCE3MIUY2+R+i0SQmliWe1oTdzalKEMQFkMhsPvrfi7mAUG+KXOOnOYa4nJVPuzlc2nqReDM8MF4HrFej/E1u8U00M2TFBmj8vhAb7MJNj8JkA29ICRn4bDldHiYXx8Cj8xD04vtwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757930800; c=relaxed/simple;
	bh=8Enp+Mkl2UxqpACVzNToxnoA6OxpULssI+bvEQ0Nf4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hT7QmfatLYGGDRcwv5qz5lTAOeC5GiQMUAOVRHhyBSe4tmnQV7/2Epmkz/awR6KIpOxSWCM88dLxltTCjULo6Vt8Ovb0DPclCI6pySRoa744A2J/TNrljQLpwTY7VS1gUQYSr2ZMnjL7OtCI9ZE+9IfhkdBJIAWth6KBJL2M9g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mwVaMN+O; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45f2c5ef00fso8637865e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757930796; x=1758535596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMJ/RBwT6mg+UjxGTL74eJG4QUt2rz+S26/sAVei4C0=;
        b=mwVaMN+O7JQojI5YqTtmPbLUEgRTHwx7+kjEd4Hk26ECRuVMtOrUAwNtl23nqe7RZU
         1hJ108f9SK0/8xqBaMN7vnA03bygmzYGVkOZl+dEgIZPgp1CpJjw9gR60pHJruSVjUkJ
         6AnAUkcJcmKDMqh1/OAsNdsXDmxIM21IVgACFPzkU6aNcGokJO3PeHwjGmmUGSMbL0qa
         +Y98Lf3dUAAcQZHPPq+bhvpmMKmqO5XLzeJ+ULPAmkxtdNUe1CmsSE1YVUY6E+FqBml+
         +4H0TCRgnq3gaqNfLEJ4HX8BRRhL//svw3QCw3WFB6E8C0KlHAv7dgpHU8GOUGD1Zosy
         V1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757930796; x=1758535596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMJ/RBwT6mg+UjxGTL74eJG4QUt2rz+S26/sAVei4C0=;
        b=s+5QnwiubZ25zwrFcmgMZrD9CZOU/wzzjQL6a3jxh4zB0Re2cUStBvbM1FrpSeqgvy
         qqgjCMB24S29ctSGpjSk+lBFeZFoeU242PSdLG4IspseddJIkz9JR7MFzX/6ZO32Y7IT
         aNg/A7gdqzYX8gMrlQWU7JvUOJSdQlRnDn2UbouuOqLn9v4TSSpVeVusXccD/NusKde/
         T4pCQQ6Qu/9ZDHOA2wsuKOsy2019UL709a14QBIzkEQ17Mk0OIjhpdWmsiixazzbCCdt
         x3K5vDXEi4tqzhBNs5HOp5yKznBvv3LwwCtdGmGSc04yyxXzKYGVrr+KtCtUE/iOcJB3
         cJCg==
X-Forwarded-Encrypted: i=1; AJvYcCXiadvN6H8L4T+/GKkDmEH5Ef8x27W/WkhYJucKrtf9zuLFJBOrBjK1HLiSjTFYqQSUXccPlMVrHsmMTjbK@vger.kernel.org
X-Gm-Message-State: AOJu0YzYPJFM+csGdx3qJm1kckMAen2lB7Iy7QkST/H8kNpVDYO13JRV
	ISYwyerfFtbhqKZNR4HUS7PWlKX37isoZ/VqSzUBJfE/25eMYSMLqtljwKjXJOE5Y5g=
X-Gm-Gg: ASbGncteZi2Rd46FUKM2uiWxJWK+c1EXupz8HYntpaP6KlnVkcocKP17zeJb+XOdDcm
	jMYkl9YxqjjunnsYZU28qcKLQJt7ZBFZrviCrZ/FkhNS5kl8lkH6tX0ebRmYzispal01lbYHo4u
	hVq3eiRLI6NnHz9x5pdxuZw5ITvFQAt8Wzaxt52JShUuh8vPNGXzJsINM80+GRpxHkciVuucGte
	87F2csqJxOXV9r9AD0EOs6T4/FzMjDyJ6z36v8xD9qh099OlE6t6reoYZtOT3HVQQ6WYjywcvr6
	hfFz/S70cSIbOD5hGeza6Iu/Jvx0nrKmgb58xRIbw7neVop0cUHoJy4obbLu9nbB/R9iGriYWAY
	klrRnreIBrosMgMh9/ZqE5dPJSFtXI3Aa0G+NQUfOLh2Plg==
X-Google-Smtp-Source: AGHT+IGAYfNbairUcoKCWSDsEU5WSecLpPfBO1ydBVHA7jvKLsoeowirgMHHx11PlHl8N8clREqLbQ==
X-Received: by 2002:a05:6000:2509:b0:3e2:fd26:10f0 with SMTP id ffacd0b85a97d-3e765594128mr11920512f8f.11.1757930795969;
        Mon, 15 Sep 2025 03:06:35 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:eee1:5042:e713:2e9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd4cdsm17209127f8f.37.2025.09.15.03.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:06:35 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 15 Sep 2025 12:06:20 +0200
Subject: [PATCH v2 9/9] arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable
 IRIS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-x1e-iris-dt-v2-9-1f928de08fd4@linaro.org>
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
from Windows to qcom/x1e80100/dell/xps13-9345/qcvss8380.mbn (just like
GPU/ADSP/CDSP firmware).

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 19a2604038a88f37e6ab87129a6318db78345339..58f8caaa7258077d2c267048ca048279109ddb71 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -875,6 +875,11 @@ touchpad@2c {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/x1e80100/dell/xps13-9345/qcvss8380.mbn";
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.50.1


