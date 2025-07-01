Return-Path: <linux-arm-msm+bounces-63179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE98AEF492
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62EE47AE1AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F5224466E;
	Tue,  1 Jul 2025 10:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6QhC9oY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEADD18DB35;
	Tue,  1 Jul 2025 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364622; cv=none; b=nanKMf3RiEVnXU24euEDHOHoRiBAHUZL4gEmXLSrTmOzpeeJT4XycxF94kO4N+DP4qolaqs+f0swCmOb5fKqVDWeyVKEju31j01tl3e09ebHCcgUZ4sozRo5V94TENOv/q7MZFSyFvwecdMvvw+wFv7rcOnDXWl/j4b2r6El46w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364622; c=relaxed/simple;
	bh=Wp7TC5nSz+8PwA/4ATcFGGxnqfSCKNySOL7+6Yn+9OY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VO50f3w18qUOmt/c8IxmdrpJCeJyU/4qOgo16xPL9gXfu1E1IKy8IPxocyl7jbmrEkJel+XGp9erHMkGwcAkrzDjlWzWxPyGHkhIDWI2vSu0RxJGE0ZKvXwp4ZAGkeQZLv7SIhfxAnsPQTBO4RRc1sTLPWACoeZrIjUtdswayr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6QhC9oY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453398e90e9so24746305e9.1;
        Tue, 01 Jul 2025 03:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751364619; x=1751969419; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+U9qFNfxKwKhoB7NC6h6Lu3o/jexQUeWxNnkfZW9HME=;
        b=V6QhC9oYAH2DaTZLntnNw6qwCRstXSkLd/3PaCTeqF4SBDKLNSW2SCKmmWRb8SCgYy
         PF5vFL+Li1fe4hnv67Y53LPYawmDZUJikKEumQL/1jIG/9YulZkhRvPNjHu3BKZYMK5r
         KoMWcc7RAISnOFvCQ5c5K24ytETKFf6DG9oJZmV6A6/4YFvPClItv+7Io6lPL2G9mDJR
         TuI6qHnb3IlTvKOGXAqS6Mxz63U9FpyqK1Fy6ApDCVw2ZqKwdPa67egmpS72XjC2b/6z
         QZ/XU3Px+wIz65XmvgJw6ckbG4Tc2CrRsbJIVLZ0N8aMAMIpVlKiUgOrLmbPKnKoXTGa
         PUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364619; x=1751969419;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+U9qFNfxKwKhoB7NC6h6Lu3o/jexQUeWxNnkfZW9HME=;
        b=JKevqqAH3p5UDDaHXajk8ygUT297pJq1dVjsM0W49U7nD+dWRjtX6I2bHYlzIlwmx1
         JCtZ7pUfA/E3Lr72KsGe9EBmmpvo6zs6eMLdb3KHHdF8eCv1OIpkjCtsotDyt567OT59
         o3D1MUMsP2HncK0l0lMaIQhqkg5a7eO2DwIhX07IeawcKTj4gWWSjhtPqNHso8yOXPQb
         TkJPJZcyHvRYOzA0vfYKZ6XyFxu5o6Ot13SWbjJPVcdKtNIukuSK0Nn9prtd7j7jodVI
         Bee/sEbFS2icsQpN12tQ6qm0F+daIwZ+k7iQ0IJ3+HAnI2J837IC23HF/91kqGL1NoD5
         X2cg==
X-Forwarded-Encrypted: i=1; AJvYcCUmq9lyK/YzF6LI23XUDsiLyo7Eic+kbkgNQbI7jKU58iLncZmevLafrBD5y3ojpRjcwrOFLJnm6kqwe5qX@vger.kernel.org, AJvYcCXT0c3vIjYf0yK5sZgvNQWitvpmXlu5AWAFmDxcSC+s16KhbimSnULHhNKwkjRLnWP0iFW8JLHpa+CH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw951dcD4FtnYKV+9vbfvaK8Bh7pY2obqGp3wT2BLxipoq7ffyn
	MXUFkKuth9zaggW2l8HqcaJdf7Ff6yYu4tQ5X6upfzgJz1KJ19Pqh49niatQ0Q==
X-Gm-Gg: ASbGncveCiCw95PrtUm/DAmYGsPGrsbzj6E5L82eQu6CSFasPnL214MQ+vPstthjYhC
	U7rQri3G8I1nuo0Sjb7PmwSShZuw6kw8NahnN6z2vFKecNZxUFfNti7ojimTpEqZc+VlMIhBtrc
	tIVaygmXAhP3avW5j4lN6dQk4PjOOu+DwR9akILlP78qgKBtCFPO+4iDFQFhL89RRzkIClII6WR
	DpM/cmsbxrM5nxF/F7fnyrfI1LQKktFGrmUGoUEW3bWNXHXWuhLQJp3CXs6xsTdxIyb3mSOYs3W
	CoXw5d1mJYrhdMzkvwqaCpZZr86y42hrmepPWnF1eHgQtA+17zg/gMFZZcLQIGpJTLNH27poy9P
	29MxGyJ3gy87eOb8=
X-Google-Smtp-Source: AGHT+IEMbn4eAcCLNfXuQ1moFOKF7EXVX4p6uSonTqTbWlvmW6uUlHQpb57mpyLdE9iF1gSGF51JaA==
X-Received: by 2002:a05:600c:4e07:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-454a1082dccmr1535395e9.0.1751364618882;
        Tue, 01 Jul 2025 03:10:18 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm191321355e9.5.2025.07.01.03.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 03:10:18 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 01 Jul 2025 12:10:13 +0200
Subject: [PATCH] arm64: dts: qcom: ipq9574-rdp433: remove unused
 'sdc-default-state'
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-rdp433-remove-sdc-state-v1-1-ca0f156a42d5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAS0Y2gC/x3MywqDMBBG4VeRWTuQxGqJryJd2OS3zsILMyIF8
 d0buvwW51xkUIFRX12kOMVkWwt8XVGax/UDllxMwYXWPZ1nzfujaVixbCfYcmI7xgPcxTC1iD7
 ld6RS74pJvv/z8LrvHwtWPw1pAAAA
X-Change-ID: 20250701-rdp433-remove-sdc-state-692f5e91cdb9
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

Since commit 8140d10568a8 ("arm64: dts: qcom: ipq9574: Remove eMMC node"),
the 'sdc-default-state' pinctrl state is not used so remove that.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Note: dtbcheck produces the warnings below, but those are present even
without the patch:

  DTC [C] arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb
/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: usb@8af8800: interrupt-names: ['pwr_event'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 32 -----------------------------
 1 file changed, 32 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
index fa7bb521e78603fc4fd6499f398b74c99b018772..5a546a14998b04a4b52abfc12571ec0f793f959b 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
@@ -128,36 +128,4 @@ wake-n-pins {
 			bias-pull-up;
 		};
 	};
-
-	sdc_default_state: sdc-default-state {
-		clk-pins {
-			pins = "gpio5";
-			function = "sdc_clk";
-			drive-strength = <8>;
-			bias-disable;
-		};
-
-		cmd-pins {
-			pins = "gpio4";
-			function = "sdc_cmd";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		data-pins {
-			pins = "gpio0", "gpio1", "gpio2",
-			       "gpio3", "gpio6", "gpio7",
-			       "gpio8", "gpio9";
-			function = "sdc_data";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		rclk-pins {
-			pins = "gpio10";
-			function = "sdc_rclk";
-			drive-strength = <8>;
-			bias-pull-down;
-		};
-	};
 };

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250701-rdp433-remove-sdc-state-692f5e91cdb9

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


