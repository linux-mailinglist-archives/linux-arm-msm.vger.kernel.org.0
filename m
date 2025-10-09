Return-Path: <linux-arm-msm+bounces-76578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68041BC8310
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1DA19E2469
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2292DCBEC;
	Thu,  9 Oct 2025 09:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cAie7e4U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8497E2D9493
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000813; cv=none; b=QuFMC2FmkpxenVX2je8l42+2Usqi1R2uGVqB8l1Cq++2WyYYf5sZXNEDzyD1q4cKqEHCuM6rwSSHCZi7bJjfEOlWbqnpLMNR/FyS2LPoR0wRluI3CgCMwbVdg0Cv4gFxD81LHQugAbGQD8+Ab40AGKjG3el+8/y1A0Ogctj3Zn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000813; c=relaxed/simple;
	bh=6c+LDrNFsl3Mf/zVKIj375u+Xy0wPf0+vzPBVIwWGeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pFbYJSP8Gi1uWU97lvhPooBGmderzcib02iusfFcmErGxyFeWySI5oyBVhl/qwtgq6KKxgw7m11h3PFARBqSjwuXox4AQxKqTSvIMpHVMag51UGTNKjw/uUDVc/P+g+YtldrJxwcdW1pPbxtYYYX6wSrqkWS2TXisuVLpCHV7oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cAie7e4U; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62fb48315ddso1053944a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760000810; x=1760605610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ekJw9Dpe4LT8cbettXRBucWkmba5D2JfYHQVJm3ydg=;
        b=cAie7e4UuiAbHPLhkLohgg6i1tOMLJIjPqHSrp1ROKvr8ADW+Ylpr8kiaIzuGnpk5/
         0uTuGEbCpelqA6/Kh+lELV6Mg4VRfHp31sIHYLtKyBbaXjvMQq8kQw/tdCwRkn+C0dTx
         ntSVi9kImsQLMv1nzup2xWIVQ9o99XI1HU6nW3hjnocLkl2uHK8ZiHuLjjGgry3YWxhb
         y8MKP7VIblGwTPx99Vt2MIV3ug8sVbax9vMfzLrpFnGqNue/DoCS/y2uCFzj42C+/fHD
         X0/DqSbK4svp8l3gCIvxu3knmQ8l36NSol2NhHp218o2kT7594mCo+GJPhuqC1VEYQaG
         0diA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000810; x=1760605610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ekJw9Dpe4LT8cbettXRBucWkmba5D2JfYHQVJm3ydg=;
        b=XHUpIdPz1psss5c9Mu8RQVZbVl78LqhbopdeZ/QNLRlrUAmrumKHkuLg2Reuz+Zgh+
         w2fvD9GbBjtnBkkwcSM4ER7UBSVA3CZ2vqULZbYe3V2bUtp75oOnBRQsSg6lLKF9yQH+
         ZZSVVI5IXIbMhEwsJQ/MSMnHSuG14QRNDDt/kaDST6Wypx2RqOJugzzmO8M0cY5sdhrY
         0g6NphQTwScb7rpxyKn4WmC6BeC1Pw0lk0r93wdG/KJAZmP3PUh0r4oS3jKS3Lw92lO2
         ZgKqbHZ0cz8y2QAszTN0YqLkaTlu17OvoAUN657TalXnUQ0o4jXU3iEbzfkjtiuJG7m+
         yDZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA+SVvDhYTs1QPnDsjAGgZ2tcz9vy6DJKVktL3fumqImCOtncjYT67zcZ7226OrWpp4g2OpSvm0ibjocln@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7f3rLwrhXyhwmlZ6mRaQXlcF8UE2QbEyvBO1ddBbHoSAsVq2/
	mrDu5nYHGgw1S29mNUMNWjpLXmJBDK4CAp9ybTCoRNtHLqTKxltk9fmPvagD3eBqzes=
X-Gm-Gg: ASbGncutfpHCmnkbjtKNy2OBlsyFdCAVmwub+L7JcXM7ZZxj9bLcTlWFJwp+w2N4/Wh
	DeqPklvtDaq/cITAMD2Jow26khFfzNt0P0WuHRcT47Jz3qBWmGgpPf/erhsK0YKOdaTFFjSqEtn
	92aP3k0ASdaG3HYYzlGzagJSbfsDj6lF1d6j0ufdUl7Km2I1c1GPb+kiqcXlcMcrfbl3xRU857/
	zJCOSj/pBd9TXt7uHnuvWPp8tCSQIrhGG4w6eoSPXKOJKpDujvxVMW12Bk1jS6lC83k8Z1zqWHL
	fdmuuEI+jWUKyQxTBd1GZIZFhRqPvbPf5GGML+bi/83AEGL1x1J/yAVaWh8dakS4LxZIJGV5Sgg
	tHlKzjGXjxIWKBOWH1+as2jmzSfmDLw3RaN2W558WH8CO9B6M7v9rK7o9ie7FfBHAclshaSXgsc
	DfOiM9CI7H1WEkOutSg31V+C+Aj9m+
X-Google-Smtp-Source: AGHT+IGVnju8p0EtiVRVfPYKo2DKq9aqai7ZQykeesawT2arQe+oRNmMFYDi5jeeocRAxFAQMHEcgg==
X-Received: by 2002:a05:6402:210d:b0:639:e712:cd69 with SMTP id 4fb4d7f45d1cf-639e712dbf2mr4128487a12.18.1760000809554;
        Thu, 09 Oct 2025 02:06:49 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f4109046sm1905755a12.44.2025.10.09.02.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:06:49 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 09 Oct 2025 11:06:35 +0200
Subject: [PATCH v2 5/6] arm64: dts: qcom: qcm6490-shift-otter: Enable RGB
 LED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-otter-further-bringup-v2-5-5bb2f4a02cea@fairphone.com>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
In-Reply-To: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760000803; l=1117;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=yyPwwquHQ/hor9rKpE+9NwLbamAj8RJZBJZ1Khr3/vc=;
 b=z6PdzX5mDNnT5WJj/LvOPGdVhBBtxqgjFNbSFc4dXE8k8eCqz/pKrxJLlPzBNCJXkFHDd4cxx
 tepyVBNdHN+BrD03oBFeKB3I2JWXKuv5ol87WIOaChcKJkalYXqz06O
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Luca Weiss <luca@lucaweiss.eu>

Enable the RGB LED connected to the PM7350C (PM8350C).

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index ac6ed79e57b1..af6f7b41201d 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -618,6 +618,33 @@ led-0 {
 	};
 };
 
+&pm8350c_pwm {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
 &pmk8350_adc_tm {
 	status = "okay";
 

-- 
2.51.0


