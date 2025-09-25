Return-Path: <linux-arm-msm+bounces-75050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B50C4B9E914
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1110F4E320D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AB52EAB6D;
	Thu, 25 Sep 2025 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ARbZW2Ds"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB752EA49D
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758794871; cv=none; b=lymHjKzHaAUVfFj/cWJz6ngV4TnKKQX+h2aJ+ntTRIsDV0iHgeKOhmdkP0zl84Eo6fGXxjYWYT6vuh2uVuXlO4qhlB0kH7XaK0zUJwDID2Wdht1bck0EdpEXYVsZ5n6sB0ZAg/s4qnvuyx+CbB+P1PBG8SmvhaqcheCWu/FghFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758794871; c=relaxed/simple;
	bh=LhKzzlkTCNl4IkWDMHZ1OAuhVnKTDiivlJgT2WmkiVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h9zZasQk+NB5HrZjnIIAp6/2lDnIzkAy0LtxQ0hEC1AC8zPV0hvU/xWnGSXg3C6QRf6/9bk9I0XCvD9bpTUFTQMKdWGSUh+hpFe6ZaprbH2ZpL0ey2Udazf08vm70o/V/WJgaXE2W/jXI2YRg1lUSsQTrkSDjQorW7CuOFHGUxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ARbZW2Ds; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b2e173b8364so127738266b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758794868; x=1759399668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=903p68FO4P6xFpR2fJbxs0+vg6ytltVcymRFkkxQT9E=;
        b=ARbZW2Dsa7h48FcBgS8Y87noqo0j6tF/GHZePIRsLQ1BLftnoe4/gWqNiwgodeOfFe
         VMHQD6lnlp2WyX2yz/vN5qmuflLKRnupwqkCM7UXR+YSG0JlD9RNfqwqIdsv8Ekecxon
         CyNP2jb5HFrN7A4bOWGpF0pbhqi9DOsemrzVGUnWINpyxx1V2tatKJ1ln675j6yb35Nu
         aE7Hd25uEI1x5AA0E2y+Qc7Tgj3uDsgHge7rbU6uHMJDFYR/nKUvOUM310NIum6zqaM2
         XqSvMklKeakEEre0aE5GHjFRYtqv+M3vDT5vtFSA6RtLlibzNeHJrfDzToAHXAoCNWFt
         F8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758794868; x=1759399668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=903p68FO4P6xFpR2fJbxs0+vg6ytltVcymRFkkxQT9E=;
        b=RMfGcmjSvUIqYkCsJJiMXwcewPUSo3mNZ0gqJxc44rE0bttn6yp+lDdQrw2jsPeqsJ
         8WYvwM8DBWOMtVf/RltU4Fec9NG9NaSunqn9MhzVg8T836xotxOF/gIOByFw1CEZQvlx
         +HlQPv7hmXb+76zFNEHFoenDdl5SIqPg+PBQJRikZnrTVEV19pUACyUW4CVUF9/55uYi
         VyvEw0AiKcmRkzYJ9Eq95iTXPlqlVnTY1dpeQwyWu+/3BwPr+tMLEP0guDTzkCBEs2H4
         HmIAVPxnmqOyqBDAppCpRBm2LhiRsvGKpti8+w9kY/70XTvHXyahb/CdPAF5MED3lCza
         oW/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXb6Q65Y8fvrHFlRVFSIO0Mn0sHmMwmtR14QP+tryXSPVNjN/ckDMLadwe/5gfLX2FIZE4g2AUDNxuwzNVM@vger.kernel.org
X-Gm-Message-State: AOJu0YzpuNO+IfDTLlyTKA5GgV2miiktlYX+embSBKHaMpjd/m3GAoBT
	P3QtFDOXVXBChzIvmy42E5OhhCP4ZFvoo4VBbtRgAJX+TH/5gw7LZXwOj1S4Rh+O3gM=
X-Gm-Gg: ASbGncsM6aSaDpOwV2IFA4bYyrsJmK9Ct1i9Jm2Wk5FT8hCQrhEy6iF97Ke+iHUs3HF
	+uqSjFVMbRVXmL1xytJkQ9E402G/+ibaubU1K7m3J9MTARC05THqgKAVtEKpQgEXQg87S40l1pV
	G2BBYJF8eC9+lGvz59oIKmsaQ12qboL+I4/x5ZW9szbOrCp6FmS540R+OR3Sqlm9tfbfeRPNu3W
	CV2WO5mbeWg3jTN64rbGHsz7dqK+BFKbip2TWRcYkw0nJSWUb6GsI4WvIBA/whlo5XenuTWiuxe
	pw0k8rv7eQeps1JurJB23bOGNZp8fCscGlMAtu06aDqCY2xGNOfojAYmwlpUC8jMLucZADxE6Ox
	5NIDaNfXzFSgPl+BW8YyAElGY03I+jZIXedAhH/cK3IFAzq6EFLYyy6mwcN/j9+kIFv5yL7GtbG
	XM5aGn
X-Google-Smtp-Source: AGHT+IF+rhp1gxg0uR33r/iYlZ/H6zFSEFREOPZi/QkHkOOsdTv1r3hShr/lDkKFBiRpBVxjnCVhdw==
X-Received: by 2002:a17:907:7f1f:b0:b04:1d07:40de with SMTP id a640c23a62f3a-b34bb32043emr296615366b.23.1758794867875;
        Thu, 25 Sep 2025 03:07:47 -0700 (PDT)
Received: from [172.16.220.225] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f7746sm134270766b.59.2025.09.25.03.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:07:47 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 25 Sep 2025 12:07:30 +0200
Subject: [PATCH RESEND v3 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 vibrator support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-aw86927-v3-3-1fc6265b42de@fairphone.com>
References: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com>
In-Reply-To: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758794865; l=1348;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=LhKzzlkTCNl4IkWDMHZ1OAuhVnKTDiivlJgT2WmkiVk=;
 b=HeTBl3q9SOYLzKQKn/q13ycWxEYizcLQXQkg7cffIeB26/YJEFy+IePzXMRYWra4/avx87cX2
 zjAzQHQoBoTCbjALCUOjSkFG8L0xlt893+/BK5/GDrVjRmfMDicC1Uk
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the required node for haptic playback (Awinic AW86927).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 4c6cb4a644e2a7a5ce6848283e8732b3dda1758c..9576efdf1e8ded31dd2babd40c377b2de9ae9c41 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -866,7 +866,16 @@ ocp96011_sbu_mux: endpoint {
 		};
 	};
 
-	/* AW86927FCR haptics @ 5a */
+	vibrator@5a {
+		compatible = "awinic,aw86927";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 101 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw86927_int_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c2 {
@@ -1415,6 +1424,13 @@ usb_redrive_1v8_en_default: usb-redrive-1v8-en-default-state {
 		bias-disable;
 		output-high;
 	};
+
+	aw86927_int_default: aw86927-int-default-state {
+		pins = "gpio101";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart5 {

-- 
2.43.0


