Return-Path: <linux-arm-msm+bounces-29202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 661A3959F2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 16:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DC621F22DBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 14:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3941AF4D3;
	Wed, 21 Aug 2024 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wRcK7bGY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9385819992E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2024 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724248884; cv=none; b=DVTBhIs3vt8AKcXSLlz5PjgiBj/qnGgFzEwBUqehRFH5rnYUBnU4zJdYP3hSxxak/EDJm9qdE2hrtlsPxvauMAYdsNlPoMSJbLQhXYxVsmQuN/clx3abmYc5Ot8Em7dVUj+2IToUMOe2qf8Jigfv64yv2Xpj2vlhNpR8ooq4R5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724248884; c=relaxed/simple;
	bh=Daq610+UqxkC20cK5k+fETXHquN8huL0hKtlSrO1pPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DICgExHdQIxVIxHZFMAlLaYrp9lAJLwbEDy5vHHJ2gPjSTgISKkQmbIceHdZVoVceFpCuZ8tu7AVm8KOqcD17ApaEd3E+lQKq4GX0WmhkIqnoevPATdSepNgsVEaX/JJysWVjacRSgdH7m/jHECSEvTPBJ7p+D/xgYyFHA3FgjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wRcK7bGY; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3718d1f5913so25762f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2024 07:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724248881; x=1724853681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yD0krxOY5/W6QTrcUKkfr8cJvRntUma9bL5Bgx80An0=;
        b=wRcK7bGYzGHGk852gdY/cH6ngrKvh+FTqBSZ/BpKFjYjN3TOlTQmIge5TU4vrsfcpB
         p4GXu0bSMHRwqRfV71XggK3Y0iigBB3Xq7X71QpyBATXMn++BShZp9mj/+HXE4bcOVdF
         SHMMsGGM1cxiwnR6xJ2UE6bbNN3U4P8+dco4iQ2/gbp3rNIWMS8gB0+i2FhiBV8gtnw8
         qilIXoapuG3Xab+0RnM08sPxruZrEBCSBxiZcWN9qjGwxGWbtc9ZPCIowrvQ9b8kvFIv
         Xj2zm4notIxyXNBlhZZikmzW20fK0b+gnQAZFB9n3UQHT/i1622booKXQipDeusQITCL
         cw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724248881; x=1724853681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yD0krxOY5/W6QTrcUKkfr8cJvRntUma9bL5Bgx80An0=;
        b=e5lV8uMbIwV1B/tI2vaNHsFncIGFYvsZCgQkEZUDciKfXt90cCpS8HrwT8UmrKYyU1
         UboMlxHFgvze7IYf0kI0f6pXi3QCo5BhsR9RLjLxhVxEkUBrDEEcV+BhhvHCU5fC8z+4
         E2E19RN626kal9NPy/nZtugb7FHD2vOJOYy4GulmGwgI7q7XyQv7EY1iAWpjr/oSgZj+
         8nbNex9hOwPih08NBJd2gjltKArLhqswU41TaYomJMCKuLVSMFs6bQcysz3OKwZOPVuR
         W1f4OUoh1qnt3hlzzhqfA0NnmVPO5HC++grFSHM8mxvtC66ieurSzWESmYLV75T0IEOx
         nNIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGYV0qlTF3cOj47767hq3tXltJfity0cTmd2yH5iJ/GDqOoLMzgXhdPadp0iHjtm2/RHa4SjwYKjLXtmao@vger.kernel.org
X-Gm-Message-State: AOJu0YykDE8LScPSXBrAiW0aodiWMji9WThV4xi2n/SORVXljg0a73Ra
	26X5JqNt9KTlIDyTfG+NtSEP/cywHm03N66o6Btzl2fJDQ1zXguS1GkTqn4w85o=
X-Google-Smtp-Source: AGHT+IFfLN4lQ92bV+NBTSr+WjZM2MEigBvBEVElGHbZU2cSj86dC1PrUMnkUjiJoBqWVFzwdKKWfg==
X-Received: by 2002:a5d:6d85:0:b0:367:9505:73ed with SMTP id ffacd0b85a97d-372fd82898emr947949f8f.7.1724248880506;
        Wed, 21 Aug 2024 07:01:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a867c7bb3bcsm69132866b.132.2024.08.21.07.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 07:01:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND] arm64: dts: qcom: sm8150-mtp: drop incorrect amd,imageon
Date: Wed, 21 Aug 2024 16:01:16 +0200
Message-ID: <20240821140116.436441-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SM8150 MTP board does not have magically different GPU than the
SM8150, so it cannot use amd,imageon compatible, also pointed by
dtbs_check:

  sm8150-mtp.dtb: gpu@2c00000: compatible: 'oneOf' conditional failed, one must be fixed:
    ['qcom,adreno-640.1', 'qcom,adreno', 'amd,imageon'] is too long
    'qcom,adreno-640.1' does not match '^qcom,adreno-[0-9a-f]{8}$'
    'qcom,adreno-640.1' does not match '^amd,imageon-200\\.[0-1]$'
    'amd,imageon' was expected

The incorrect amd,imageon compatible was added in commit f30ac26def18
("arm64: dts: qcom: add sm8150 GPU nodes") to the SM8150 and later moved
to the SM8150 MTP board in commit 1642ab96efa4 ("arm64: dts: qcom:
sm8150: Don't start Adreno in headless mode") with an intention to allow
headless mode.  This should be solved via proper driver quirks, not fake
compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Resending because it was marked as "changes requested", but no changes
are needed.  Konrad suggests to take it directly.
---
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
index 286350ac7751..256a1ba94945 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
@@ -355,11 +355,6 @@ &gmu {
 };
 
 &gpu {
-	/*
-	 * NOTE: "amd,imageon" makes Adreno start in headless mode, remove it
-	 * after display support is added on this board.
-	 */
-	compatible = "qcom,adreno-640.1", "qcom,adreno", "amd,imageon";
 	status = "okay";
 };
 
-- 
2.43.0


