Return-Path: <linux-arm-msm+bounces-26863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A41E8939E07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 11:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 453251F21393
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 09:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35A314D2BF;
	Tue, 23 Jul 2024 09:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dLjiLbGh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ADD14D283
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721727533; cv=none; b=PWwbSwmsmsZXe7cyrVde9SWUqbMwO8w+4Ayako5Pgnv0KTX5ym77NV2OeRDfozNV2BoVOSTZ+/5XqWKYv5u4FnBdwZsS+cz57AzBZ9X6lOp1WnhYILJt2ES4YYpsc8x4dyqJzVFZhJ9qqW4Dtq/fFwXXTEXOI7lCz2KRDsycXho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721727533; c=relaxed/simple;
	bh=V5cD+v01bU89IZjF8zWiQtINoORB56hD9c0ATcYUpFA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TD4qvrfxMT4VsBIICdfQ7OWtG5TOR6qfOG4rOVWhwxUxizFL0MWG1IZDwKuC0c8Fx5h/9OxsSxz8/4tDVrqmtjWzS2tW5tJk+MRWIwr7ouXGyjAF+zf+Eh0cBOn10kh1JMo3AhTlf3R63Ri+2JL63mvQnoTwdkQyn5T+j1eZNG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dLjiLbGh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42797289c8bso39751975e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 02:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721727530; x=1722332330; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZT8KK8QFNLGrx2pEBPaEZTvQziPUaAsWcAU8RB5dc0A=;
        b=dLjiLbGhHMtq4WEb5QYChnGcSosR3slW7T6CRpYD9MUvNz6TK91dH2dSYJbcJjM9M9
         oBm/ye9td8uyurnbn+tYz9+x+i9fI4HcWpFMIYmvC7K1yoxS1TEHJ85e+j5u3xtV7oA4
         1cOPjqS4Ud5TfO2QK6wsB5QOT5vTd2JqOM9cNGX5fuQzZCM0YVODmxAa/UWpwFLFAvuY
         gyY9LzS77xjqBLKc800lDkidsL1l1tzuo6Pzd6kQKyAo2f+SxKuWZ9ZcJb+67AUzr9YC
         XwdnlUBfEaKU7g8XmVONYkEPUOXANsfmTO+HjaHngYQ5TQSlu3d2OVbUGMUD9bII1Mzg
         k1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721727530; x=1722332330;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZT8KK8QFNLGrx2pEBPaEZTvQziPUaAsWcAU8RB5dc0A=;
        b=SO1g3/NVoUzpuXFn/BQ3wf0XT5Zn5R9/667Bq4e0QBkcK2pkRZ5TUI8ytwkmPCnYWc
         H9UAVTJ5xyslVZuUAFpKkbUv0jwPUxeuSzzg0E7cDh1VtdmFSNFUDYb9vpnEEPfBOaK0
         kt4EjqTVoww3KVKCPLX04u2DVO7y6F/ijP0lx4CssIzKdoX4A1qRm/eong/Qblc+uTMv
         IbEWDJdP/gk085QVVTSrJJ/5Q8IP7Px5ql21+TqDRCO45PgqqrOy5xSOsvrLccoPZGe2
         9FXyBvC1VMsjUCL6aR5HgBHR8CDajqI/zFGoYS1HrzJXoSbh3jSOpalr0Ziov93HA6kC
         CO7Q==
X-Gm-Message-State: AOJu0YxSeqwdDLeg+RwWbyZ6yCzU1HdJS2DUTcUGDbwUIJYhu7hsCyXO
	yT1qbf/YrWkYaMlGaiOqgQhRTzc5IZbjQyWko1XO6AgLyL3t0axDQjeZMJUD2v0=
X-Google-Smtp-Source: AGHT+IEXxB7K34amU/7o/fs6MOk5nRp6AFdaJrDuJKtFTJ2WdhTVm630EYls9qGTtKvnCVnpsnEcFw==
X-Received: by 2002:a05:6000:10c2:b0:369:9358:4634 with SMTP id ffacd0b85a97d-369dec15cedmr1538753f8f.19.1721727530111;
        Tue, 23 Jul 2024 02:38:50 -0700 (PDT)
Received: from [192.168.1.191] ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36878694637sm10953345f8f.56.2024.07.23.02.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 02:38:49 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
Subject: [PATCH v2 0/3] arm(64): dts: qcom: fix dtbs_check warnings for
 qcom,spmi-pmic.yaml
Date: Tue, 23 Jul 2024 10:38:48 +0100
Message-Id: <20240723-pmic-bindings-v2-0-e1cd614f8c4a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACh6n2YC/3XMSw7CIBSF4a00dywGrmC1I/dhOqC8ehOFBkyja
 di72LnD/yTn26C4TK7A0G2Q3UqFUmyBhw7MrGNwjGxrQI6S94hseZJhE0VLMRTWq7P16qK9Fgr
 aZ8nO03v37mPrmcor5c/Or+K3/pNWwThTSl0lTicjnbg9KOqcjikHGGutX4tNGRurAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rayyan Ansari <rayyan.ansari@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082;
 i=rayyan.ansari@linaro.org; h=from:subject:message-id;
 bh=V5cD+v01bU89IZjF8zWiQtINoORB56hD9c0ATcYUpFA=;
 b=owGbwMvMwCXmtuJiX/SRuS2Mp9WSGNLmV2luYDOprvpQZ57TWs1/6caUxFldDf0rjj+7lxqwv
 0cj0oaho5SFQYyLQVZMkeVw05c1r7c7CV3ZXnUKZg4rE8gQBi5OAZjIr1aGv4KdbMnTrXbOmG5R
 tP/ur+a2G9cEvm7wu+tyzWP+u/T+L1KMDKeDF1o++bf6uX5MavpMzV2HwnjWiDxxrF+3hI3V2FN
 6BxMA
X-Developer-Key: i=rayyan.ansari@linaro.org; a=openpgp;
 fpr=C382F4ACEBB74212D4B77ACA46A8D18E5BC49D84

Hi,
These patches fix all [1] warnings whilst running
make dtbs_check DT_SCHEMA_FILES=qcom,spmi-pmic.yaml
on both arm and arm64 qcom device trees.

[1]: There is still one warning left that was fixed by an earlier patch
by someone else, which has not been picked up: 
https://lore.kernel.org/all/20240606181027.98537-2-adrian@travitia.xyz/

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
- Link to v1: https://lore.kernel.org/r/20240722-pmic-bindings-v1-0-555942b3c4e1@linaro.org

---
Rayyan Ansari (3):
      arm64: dts: qcom: pmi8994: Add label to wled node
      arm64: dts: qcom: pmi8950: Remove address from lpg node
      ARM: dts: qcom: pma8084: add pon node

 arch/arm/boot/dts/qcom/pma8084.dtsi   | 15 ++++++++++-----
 arch/arm64/boot/dts/qcom/pmi8950.dtsi |  3 +--
 arch/arm64/boot/dts/qcom/pmi8994.dtsi |  3 +++
 3 files changed, 14 insertions(+), 7 deletions(-)
---
base-commit: dee7f101b64219f512bb2f842227bd04c14efe30
change-id: 20240722-pmic-bindings-756df58afa15

Best regards,
-- 
Rayyan Ansari <rayyan.ansari@linaro.org>


