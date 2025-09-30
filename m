Return-Path: <linux-arm-msm+bounces-75601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD2BBAD323
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 16:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BBC8162A65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 14:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B293225761;
	Tue, 30 Sep 2025 14:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QDzZKkIb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01E6306B05
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 14:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759242762; cv=none; b=adU0wShAjz9IZZRS7asybRsG2FzObJo2T/tRrmkMZyzvtEMKBwbIqlVLdcLvvhnXA05p+uPRVRbdruGr1Xuk1dDaWPGFb3RBWW0a8ul5P18iekgLPW2rFcECdmGke3JsqDi4KJZoNLBnZve5r5x48OK69qDRi7MNFK03K/vMzRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759242762; c=relaxed/simple;
	bh=lvctC9UZ9/7NZkyWnJLbdkf1JYHTsQZ/REX9jctNvl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XNrBtBDA85fhh7ifJifA1hE4vpTOvOTYmyIiHElAIQdQxLfrvaAcACliIY7oCfhH4UuL/hiEgjHsQ+T4xKYixR0ebiTSuNd7CQERAsJhF1WCg0laqxvu6uB5UASW0hRkaircSZeqCUBrPTa/KXEk+1CZ8X85C1vXqhZHnJeMv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QDzZKkIb; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b07d4d24d09so1155175466b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759242759; x=1759847559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPU0fkE7kS9d2V6qsy9O55PBYIoaiLsw1EoR/Hm7yn0=;
        b=QDzZKkIbXRNwEDkrjK9sOfU1fb57i1eVzYmJFEdm+z2elqzxdZG08b/sRo0LOKim4H
         MTlBiw+NGn8R8QjtxX04vCRnNN96iCZQrdtAekMsmSe7NRemCG3QNVfiwjSxpTiYDGrH
         Gg6hgQ5hJ3zVOZusozjXv/26mlnDqXR0igHV4ZfENu5gLld4i5027cbclMdTitf4gIqY
         /jjY5U5BsHj7N6Zh22GlT7YAtaqzs3Nhuw35ddqfHOUxBGzVETrr+fH+IJxO/eNF/77P
         RbfieerpwmlZ4d00Y6TbRvCYqKZ4EWRbpj8zFJW7qsmgQQu/rlG4VvQSNUPc7JRGLQE7
         ADpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759242759; x=1759847559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPU0fkE7kS9d2V6qsy9O55PBYIoaiLsw1EoR/Hm7yn0=;
        b=gdxFl6o4Vu7O0CmcreEEhYgp5EO/QpyqLVzDBmVW+pLz1XU+C9M1i5wRaLDiFWE8uN
         y9mAsJP2Iva9Tf+Fvqq2KLEBbexkJ9omJiRaq0uqseH3Hwsa2nlHKh0P93448a8Sd9dO
         W5BUsArAhTARFAqkqCzAaOZWT/RB5i7pUspVeMoBBywb0waNOhC0oXYBJGgEDNnVRreo
         Gfet00LsvIfxvzvI9shw94tokDpdsIwvWHKf6AjzaOXpaC8LuvbOkKA0L7IfD0dREvkU
         W+jhET+US6E4GKkQky5sjNAv0lUYdu+4USiyCHHiXeGfBqzbq11cdsa9mgEJU1FSyh8X
         U/Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXfQVqyBiuwplqAMZh5U24faj6Z/E/9+o75Xm525rzKWoDb8V0K4nJlk632greGQ6OGgAJzsbBJx3VynDd0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz19CqeiadE0sdfJZIG4VnI+5Xa2BhWSMpV6AMZ53ifsV6AD4yC
	WjoYo8JnG/v211UgPYATx2g1b6mZQQpsJuSabxkvpOs9ab1bWk5y7FJ5QVh/hHsL448=
X-Gm-Gg: ASbGncsfQzbWXbpLW4trF/ImPUJ9vqA2aPWld6Le1bu4YWAES9VyFBMatJNaYXQiAMZ
	PTzguaTeJOSH6KdljdK7Kr7HSgibZcMAED2mCW3uzsNsXShm0mnhLyyjD30SCCJnOZPK3iIvw55
	5AM+dMHf/sVHfvAKQdiexzNvs9RCSk4xIFiLBlkZCEzQ2bmo1z2QYUn91i88fSAihDOAVoO8ObZ
	RyI0JNARt0ddkjfzDbH6lgeG6+C1OUFYoIf07F7rnj4CFm6lG5f8zu7az6E+mYeFLKCAcpjBM4f
	7gQQOfM1p2usFJW6IrAGyz/cQpdZPBSL7UzNQIZmIPgjMUy908g/aCp3FeGdemWze1bvaHcxOIc
	7fBiciuCJLYIK5YUboQReFigsSbmoDhr3d2O1smb3/VURVQ/2TWFrlpXUCqQwiZPda8KmvqpEh9
	cXlwfqhj+0zy7HGt7Vr3URAzHiMjcI
X-Google-Smtp-Source: AGHT+IGT+tcwdtG8+Nk5QcSQLl/1P9H18xoE0BkX5+EFdQ/TDVamP3BKtsWgTbMh3TfkbM0QHAZksg==
X-Received: by 2002:a17:907:1c15:b0:b0a:aa7e:a191 with SMTP id a640c23a62f3a-b34beba9405mr2469612266b.57.1759242758446;
        Tue, 30 Sep 2025 07:32:38 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3dc2cf61dbsm499858466b.29.2025.09.30.07.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 07:32:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 16:32:23 +0200
Subject: [PATCH 5/6] arm64: dts: qcom: qcm6490-shift-otter: Enable RGB LED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-otter-further-bringup-v1-5-7fe66f653900@fairphone.com>
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
In-Reply-To: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759242752; l=1112;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=msVLhRVtyqqzcb6CEAQvjXz9Vl2Le/8AL8FbBJzu/UI=;
 b=juPccTJVCdUljWzxuw8dM2AJoUPx5guCgbIJ2bhQkA33KFFP+NMXg+y9PPjFVdfpdX1bCr8Rn
 GjBR8tNb2ggCcjRRV5pNmAntGlg/BQjlIoMqleUHNlEaMY61XHIiFjJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Luca Weiss <luca@lucaweiss.eu>

Enable the RGB LED connected to the PM7350C (PM8350C).

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 36cc67469615974c193ea3a9db1b2362869d56bb..b4c69dc50ed0f0b3cb45341a01c89210bd261993 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -632,6 +632,33 @@ led-0 {
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


