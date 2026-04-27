Return-Path: <linux-arm-msm+bounces-104760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDhFGqyP72nRCwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:32:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A8B4766F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F69E30F1AC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7FDB351C06;
	Mon, 27 Apr 2026 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zb3wPGGs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C5634FF62
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 16:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306514; cv=none; b=nhk14Zne/vrHI0Vqb03RyeBI3AaJdXiI15yrXI7kNd8snYXxULrfGj/CMXFDxgJMPdKJzurM6H6xavmxGlFtsFXVAKfrx8Y9mdprdyZohPYom6XZ5d+L9XFMb3j6Ce0CF3V7bRAvp3Vx4WSFUeiMMUUHsqjDYXCUwSfHND8ireI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306514; c=relaxed/simple;
	bh=ix+qwnkesc5HtvM9vTfh/ENd+p1buRItGrZr1N6XTTs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UinLF3ZrdnjG7BNutoyWipLz84jkZDUwsjCnn+Z/8sjWVYtCykRBlp+zN9npnGE+uXppowpmhay9wpyjtYCp2Ty9KIjRgHHpCofjlXdZ6pkCoedBO9jGvdProMH5pkKaHh2M7VT9XkONFxO4bNHvlq94/n2QnAA3TobkBGBkT84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zb3wPGGs; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48374014a77so136147125e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777306512; x=1777911312; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v0TvH58Q6/Kcl0Q7VUseoTrwWfHbchIaxmWiW0daToU=;
        b=Zb3wPGGsONVVL5NN0OK34RuJn6JQViNVUOgf/a+jn99xdOi1GICn8Y6bP5GgetT7Il
         AR+f/aMc8uqivTY2ypSnKPqpEpMC3fwtrSqpdq4kCahPdyTFnraEtwTpfNikt39I9Bw9
         /aIDaoyC/t/QA3lHauJEuxKc/IYcwGY3sHMFM2TiAquoy7up334QoGYsxJM5rl2TLrDR
         gQdSC+c/AY/wXMI683IlNRdtPjK2m8P5gGUrOiPjvOntzfuKGCFbpM3JccGq708sjHrD
         fA9mLzMQgR5Ehkq5gbLigjhlp/aNjpWCyZJQ3UMlKxgouOOG6WaaZiu52MKmc8ug7Kqa
         uCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306512; x=1777911312;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0TvH58Q6/Kcl0Q7VUseoTrwWfHbchIaxmWiW0daToU=;
        b=qKRrhfJxxtr8uXsLt2cD9LJ7qR00KWqcpIQDjt9Gy2tHofAW8ZMs66jiV2tdECX0bY
         y+CRuBHygQguhlhu4PP52oy/GjPnqbcPlzx+UevHC9/wo0drsmArdNnSW7qn7jvADhR2
         P9BzTN7+U4PNQLz7N5SmgYN3I2vllT9GrXPJy+0U5Ao78iJE97CZ+4CEnJ+oZ7JpnrPR
         S8hd1fZiVyxCv3rEI0V33vvzydPRgAllrYoVxTRMNGQQY1H060LX2CMCWqZj2o9VwhVY
         5Bw9cC5i6tS6sgx5I8qbTkPAIcJIS5heVA0Qr+EIRZosICC02fxbiDwVVtKmAvFpUQjP
         gaeQ==
X-Gm-Message-State: AOJu0Yw9QVhyDfCxml8DNORF9VlQSV9dVXYC1bNP1g4K215PAVUb5kvB
	s1X2Xk9tHH14KX1fRNjlgiHjz4yC/8xvCC0jLw1RngJSJ5G0/BEnQwxeV6mXadfaK6U=
X-Gm-Gg: AeBDiet7U7HKZPX9rnkxe3ZArEZWfNmeaqE+/vJnbniFxhdIu+m3sGfhSepcSx077I2
	NFjAmiW9ti1DJy5srvO0ipqyUT4uSWXtVUh0UOHghqhDM3uy57K502iac8WhYLwuuNml7IiQvPG
	pHQRS4vtzJKoJZWQbmxtRB82sYoGOQmZ902Mb+WyD93KskUcClxGo40t3/6wF780rJpPvnElEGs
	ViCa10fmutbeYpoIapy1smAH0sCPQ/PJ6iSx8GAxvNDZYe3QJeCMCSn8fCIgl1N/EnEGeyzxUbI
	1qArtPNySzEmSTa8akUlX/QoUuWSe6rpWshgUn2QB6qQDkF2lkdU9NGgdJmb74hCgsADbbHdEae
	wTbK/vMO0YZ+6g67hELQue8VRGle9rw8AHGHqyGmm3Y7XzEBk55TZdV0C/0bet2dpC3q3PTOv44
	+nVLsCqGZpxcBM2lMTyrSv2eLCl2CQ8T2i/njv/Y3fffHKiHte9xL2Tu4=
X-Received: by 2002:a05:600c:3223:b0:48a:568f:ae82 with SMTP id 5b1f17b1804b1-48a76f53ba4mr517035e9.10.1777306511519;
        Mon, 27 Apr 2026 09:15:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm831407275e9.12.2026.04.27.09.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:15:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC 0/6] arm64: dts: qcom: sm8[56]50: add PMIC5 Gen3 ADC
 channels
Date: Mon, 27 Apr 2026 18:15:04 +0200
Message-Id: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIiL72kC/yWMywrCMBAAf6Xs2YWYNL6uBT/Aq3hokk1dwbRkq
 xRK/72pHmdgZgahzCRwqWbI9GXhPhXY7yrwzzZ1hBwKg1b6oGp9xLEf2KO8T5NV2AZvsaNkkEI
 819EFY6yDEg+ZIk+/8R1u1wYefykf9yI/bktYlhXbB9mLfwAAAA==
X-Change-ID: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ix+qwnkesc5HtvM9vTfh/ENd+p1buRItGrZr1N6XTTs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp74uKb2ozdry+gtK9PpVtoUyV16uM8YDEtdIU9+QC
 Y8qPy8SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCae+LigAKCRB33NvayMhJ0cNjD/
 4jT4nniphO6I938ifEeSXzOLnGrXSZAVZRm4gHek4HnnXWvFUiofn70t5efVO0tTr0sL83JZxlVuhn
 LQ4fVZJ7r7ehNhZApGd8lptQeg4+Py6WimCr83G4Op/MdGMGW0QR8Yc3qXA1EsMzY3RzCt7KG9NCiJ
 aiA5KXuckKJU9ds64cWdo7GjSx1xa4ecsss287itDetOr4oFOLKYO0ZbmYIIqMnnVgUiJX6BBCaZyZ
 whfFWkIhVdGz9iDfOeSJdWBBPUkl1IjVhrHAg5cM/WKl9erVe+fZJ9j3HPiijl5VKneuwc5FTw53EA
 RMa+GXcZKGxUic+mqoGGdt5FYbmN0KwD+bwhGkX8UsmriYj+S7wRKx5qRmuQurVU5z1JoSLKNVGOsV
 L2p/0t6fox/dyV4WDU8EuTxmZ+zn7Cgbb4ZxQDV/Z9nrQ3SoWTR1S7YeXvhpJvOUESyEe+CEIEweh4
 /wPsVqeOpxt0Jo4LzOdUMNyZ5YQzZM/zj+ccpmmwleAgoM322St8CCIsU3BOB4Z3xfjLr+LrvuTCDY
 cxI+fI4Et4vDEIjYwTHu+9ryRXDEXerBrfwy9TS1TYaUJ98WsZW+NJ6g5ibXYoQFC2ecV7dAWiAVMa
 5+ofvY+re/hue4OAe4X5YRp4aoi7CXetnVLXrVQTr5/PkXOKNYt+WBj/drpA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: D0A8B4766F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104760-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]

Now the bindings and driver was merged for the SPMI PMIC5 Gen3 ADC
found on the PMK8550 which allow reading ADC data on the PMK8550
and other PMICs on the system.

First, add the PMIC5 Gen3 macros to calculate the channel numbers which
is a combination of SPMI bus number and a constant for the sensor
type and configuration.

The macros definitions were taken out of [1] where it was initially
in the dt-bindings include directory but since those are not hardware
bindings but logical numbers, they can be moved to local includes
instead to make the DT source more readable.

[1] https://lore.kernel.org/all/20250826083657.4005727-4-jishnu.prakash@oss.qualcomm.com/

Finally add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (6):
      arm64: dts: qcom: add PMIC5 Gen3 macros for channel numbers
      arm64: dts: qcom: pmk8550: add VADC node
      arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8650-qrd: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels and thermal nodes

 arch/arm64/boot/dts/qcom/pmk8550.dtsi              |  31 +++
 arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h   |  46 ++++
 arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h  |  85 +++++++
 arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h |  22 ++
 arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h  |  52 ++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            | 279 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            | 279 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            | 279 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            | 279 +++++++++++++++++++++
 9 files changed, 1352 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


