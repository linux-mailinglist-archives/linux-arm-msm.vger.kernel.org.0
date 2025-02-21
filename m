Return-Path: <linux-arm-msm+bounces-48962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E3BA3FB93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0622F168CBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A887205514;
	Fri, 21 Feb 2025 16:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FpKrEL5g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABD51F3FF1
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155600; cv=none; b=Lr8DcgfoVpJMdUIzSsGJUDIvi1eI5/gUQmXvQLtqyRppfP9Vjsb8GIo6SXXR3KXxbRJHN+m5c6PpPrMA+g5cVmP7TW3lD0u2XHNPpo8tSf2XRMb9wrgdPPQS8d95ovfQ+P0RHdD7Rc7I9P7sxmTsMh3cF4St3AfIY2o86/EngI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155600; c=relaxed/simple;
	bh=58el747QaUYblc8PrcT2XRT/P6dYHKEqnzf+Xf3ZDsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bN6xRWKtdYgB8qVKVVfSvaNwspiTg38Es77Uvr7tX5XJhtISnfGqDaLR8UkzeAbXoqAtOYOPszs9EOQu/AU8uBBS+OJoEGVfgcnDNCg+eNG99dS9J5qyCooQ7X49HbASCY/u2XtjcDH38EUvB8Jz8n199qN3KsWdr5O1stB+DHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FpKrEL5g; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dc5a32c313so424321a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740155596; x=1740760396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pr6V4CE4n+/ohix4U8o9yXYKziEg4CQrF9x7lwxCJ/s=;
        b=FpKrEL5gLZ93FuJvTZ1o6FN+UlwJ5w/6x6oaGkz9t4IlJMmAvqFGIe1IDxb6ciBeO2
         2GWUpMBaUAhN5RXTFmUgsSWrWq5OYs1ll79Pi/Gh3YVIvMrWPSHj1MHQ4OMmKOQIhup5
         0EmGZ2v8HWj1OYCdl32kG/m6RjbZIK/YhwFu9P+qPDRfYhsPelNFk8PbXheEmVMWXvId
         /aKY15tfgF2hyPgqBcLVpFZvrnSTrdiGs0VHildz67YpGiwe+rJcRLpzhY//1itR54BN
         60GP94zd2Fd1MTBs7uVbd8ERWTqT201hpOLOheOUtrdHcoXinusgAGcLhLgc3m+ljkBU
         su8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155596; x=1740760396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pr6V4CE4n+/ohix4U8o9yXYKziEg4CQrF9x7lwxCJ/s=;
        b=oVfR406YFg1XkJfZ3+KMdMJQR8tYrULnG9nKH7M0dZvdWKRPBTpRtdMaL2itLc74v5
         buzLXlTr2/TUVMuuI5Hs0FXDjonFiOkY5L7AFQwHDin8zqGsaRg+3kgGiqDo3WQbF/Xy
         xjzoPgM96F30yZ9FZ03eYOjF18w5kacIEWE2HysVH0H63om8QD2QAZc6M1NFbYounYMl
         G5CIOsR3Su/5Z8TYqsnVbZ2GwgC/DKDNBm87sjVNI1n4f02z3UKufjM5FEEuR792esZG
         yRXcEZHmRwGFji8nRjODnQLqXC9yOufL+/tGEA6j35/6sLJTQROjA2weECzZt3L83noC
         wRdg==
X-Gm-Message-State: AOJu0Yx6xgj+ELRSRU/XKHbq3PsfZAmQIYGugbqnSgvi5fOH6YeZ6c0g
	rHO+2xI97cUKCZs3pbpHAC2Ai3bv4Tc38mhLc4TcEj68sg8kEjKfKNhNxYYfrGY=
X-Gm-Gg: ASbGnctCKpCzvOxfEZzDNgunyFOIsrt3vVTBDqgqHf7NszZA1kE93RVrpOvLeAvleKD
	OOnsAOlSe/Im+AeFxSlTc9pkdc30oaG/lyjqp/fHrfuvjB7poUEv5LdJ+EwCdmvGJfdPLIS5MoF
	GT6eUhryQuwhiJ/LmTlP8052ECNi15RDGb3muoAVCJ3nm3CHz4HUf0JIoYRVaH//8t3sLFHcx1v
	zg6oDDha0LyDe0kp4FhGjo31znnxkEVeE68juh/keLhw4u4dq0hkrUD3zhXk5YcrnlatRQzSCto
	IokA4qzry5wliazwz1FyGkThSsHV9x3Xm/WDXL28r4ZP4snzdUCeVhzM+CSxNs9UbAutIQ9IdVE
	W
X-Google-Smtp-Source: AGHT+IFEHDWaO5nyIxPiWWcbwkOBVSwasZgtjTgcGcSW2UKpgSK8+2mgZdfDWWay6nQZOldOVXVwpA==
X-Received: by 2002:a17:907:7e90:b0:abb:ebfe:d5e9 with SMTP id a640c23a62f3a-abc09becfd6mr137980166b.9.1740155596394;
        Fri, 21 Feb 2025 08:33:16 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba4fc0c29sm906814066b.157.2025.02.21.08.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:33:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 17:33:06 +0100
Subject: [PATCH RFC v3 2/3] arm64: dts: qcom: sm8750-mtp: Enable modem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-modem-v3-2-462dae7303c7@linaro.org>
References: <20250221-b4-sm8750-modem-v3-0-462dae7303c7@linaro.org>
In-Reply-To: <20250221-b4-sm8750-modem-v3-0-462dae7303c7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=879;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=58el747QaUYblc8PrcT2XRT/P6dYHKEqnzf+Xf3ZDsY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuKrGMc69vwxtmqYIn594pRbxcKz5y0PDRR7xG
 gfyLYQ9BeaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iqxgAKCRDBN2bmhouD
 1yEBD/9LimOUG6VHa6OBQzMNZnvayMoedtA4hcmr9gQaqWwaH3Ec6W2kbGL09BwUysR+JXQnvPm
 3Aa+7OuUltSfutHk28u6XjiHPxbwPZWrGgxXP0nim36evinyEyISPofl/qkepkWsXVf0o97XzlR
 luhyvG+L7HiYZLBNl2TeMTcHP7PKwaVFefwcl3h9tjgiVIoZSsBsYJ5hu/A8LB8yPgFKDFE2I7k
 Do58nsM5V0rUJ1/PKJB46L6VKDTd1PfQEH1rZl/0Oe5A53kCSyu9baT9py6c0vG2mLu2auKHuhw
 vMWoCyb93OOyqpEyes7fbgAWG85AoFfMLxjLV0nQIniaNHmlKpF5ley8gcyRouWUHMnSEN2xIR6
 alifhJbYbukvIntM4WXUpWo4aP/MEzWhUueUCzY9Al3Ox7NRKwLZ65MQRaE+ukmvIAAKysPhEx/
 8gPunb0jIX8J3JxSW1XVk1QcZGACsLMvIqsubV5omB4chk0INskQ562X2qeIj3mZZJu4WYVJplT
 pFiHb5N3AZk7QuMv3Jexo/h76gkKEltGg/9EzmUPzeSAoy7sO3z4fUvP49aCo87vVPN2jprL6gw
 3atH4u1QhCcNshhIz4p7qC0Ud7ljtsJyrSs4ltiPXs1kCHMHx4FdTf0s6qUqUTJmf5RtizWUYOV
 dy+CRaUE091G6vw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Enable the modem (MPSS) on MPT8750 board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 5d0decd2aa2d0e0849414534cdd504714402458e..72f081a890dfe49bfbee5e91b9e51da53b9d8baf 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -798,6 +798,14 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&remoteproc_mpss {
+	firmware-name = "qcom/sm8750/modem.mbn",
+			"qcom/sm8750/modem_dtb.mbn";
+
+	/* Modem crashes after some time with "DOG detects stalled initialization" */
+	status = "fail";
+};
+
 &tlmm {
 	/* reserved for secure world */
 	gpio-reserved-ranges = <36 4>, <74 1>;

-- 
2.43.0


