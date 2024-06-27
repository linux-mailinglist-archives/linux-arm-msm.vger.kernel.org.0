Return-Path: <linux-arm-msm+bounces-24455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEE091A676
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 14:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC66C1C241EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 12:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588C9157A68;
	Thu, 27 Jun 2024 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xe2TlyK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFC215574C
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 12:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719490825; cv=none; b=MTkAOrVO9Nf6yzUGv6afBGe8E+kpjgJC1YxqoRLk/l19NDV8yUgcRI45TbKwbFIxJbkG1DyReKr/vM4fJgztN3CoWbuYzhkELCksoyE3CdAhXaaHJmOc5T2pVBPRhgxVGOb4C3vRqypFJSHnPPalvu0HrE1osyDGzBASsqOSWxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719490825; c=relaxed/simple;
	bh=qNca58iBYx4/YKuEF39ubRjoZFVpXO/dT2i36hZSDME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1QWgslOnPjpp33lkFZEB1EyOPwpAbZ73RinYQAOG8LMYniFzpH96WQacynlH7s9Vf5IathruuqjB7d9Hpe8N2+w5Rc/BPmJ6nZvlhU1JAPcm7JA8bmlmGt9f7AwhRgMaY6gZ6YU+YOArWOG45ogqbwfss/v7//m6PwL6kLeT5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xe2TlyK8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4248ea53493so34009705e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 05:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719490820; x=1720095620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLaPa6oLv08wfG7ztRt+Jq8bw49dbPOID7Kl0obvBh0=;
        b=xe2TlyK8fS05RHPM6fBBTFNlk6SLuaEiojqImZS+mXt7KcVoRN6KM32T3KQuRSMCNW
         L71WjpWwuoD7k5MP+D8O5gHgEfkgfBXadXQxWSwjWCqyJs/t5CBqxNbO5F3eTVVERkMz
         M5IFLBBAmYOZuLFDyuOzI4fF4vz3SrOLmKD4lmnv5uHdogjkznOMcjauDxQ0MZLWXzqa
         s4N9XaLXQov2ssN/5+H92IwdzDuZBvX+3jTmoDWNWP2atO5D6b6Dr0aN7MkHb7kHUH1Y
         ZGjpFYfvxrXzMVv0Fz/NE3xc8GQwTmQrPC1vKdr9vSTnAVF3maS0xyKq6t+CcCrljB7x
         TcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719490820; x=1720095620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLaPa6oLv08wfG7ztRt+Jq8bw49dbPOID7Kl0obvBh0=;
        b=M4H7ENj63A6ydwscSvD7eJ6bugfnqnZcqw2bmAL39kl+wbaEaW8dronvYYq+08FjEg
         ORFBLa9tO4N14BmCe8AVkExhNc2N3bJBDPoSElX6b+Bym9KZN0RA/koywL9f19P7XVLC
         ymueW5KUv9v0nlwSDpuzIDj3GmsGFsmJ59kLWOEzCAGtS0ngl1eT4EkS6Jqp6OUny8XQ
         vFY6LcCoARPKnPrp2IXTy5Tgsi6wxKIWmqjhDW3ppeGx0ezy1VcWSbEwcYi9fY+AtcHE
         QFwTEJw7bh9HyxamFqWVVY/h64UkOWHUyl64gIZB400WBWJEJaIOt6lwfVjUKBxhiydz
         feaw==
X-Forwarded-Encrypted: i=1; AJvYcCVoSYlwwoM8lqSowz7guhWcE5LOJfRCOLTqMG86SY1iRiCoCsX5nKoMnwnTxldLt+1t+B6+ErynUgOuFh2REjgV5zGPxe7aXKgt6cq/BQ==
X-Gm-Message-State: AOJu0YyXz4ND3KOtOzXKXjOrUzfwVHuu8CfLx5vaHNo0gMqyDH33tNbQ
	WrLDUrVYQTEKowu5WhhwfKCiAZltx0ldahu2nNtgwU2rxSz/bOgZz13aUidkLMngcEsfvWvUJOs
	x
X-Google-Smtp-Source: AGHT+IF9LyXXslFdXuXYv3RM7YBWaD56RzK0d5p9amICa6hES+d2oxb/Wx1KOpMAgRTDRs+UDqUtrg==
X-Received: by 2002:a05:600c:2d91:b0:425:1335:d7ca with SMTP id 5b1f17b1804b1-4251335d892mr39769075e9.36.1719490819993;
        Thu, 27 Jun 2024 05:20:19 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8424b43sm62692885e9.32.2024.06.27.05.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 05:20:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: sm8550-mtp: add port mapping to speakers
Date: Thu, 27 Jun 2024 14:20:14 +0200
Message-ID: <20240627122015.30945-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627122015.30945-1-krzysztof.kozlowski@linaro.org>
References: <20240627122015.30945-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add appropriate mappings of Soundwire ports of WSA8845 speaker.  This
solves second (right) speaker sound distortions when playing audio.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Bindings:
https://lore.kernel.org/all/20240626-port-map-v1-3-bd8987d2b332@linaro.org/

Can be applied independently, if bindings are fine.
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 26dfca0c3e05..ab447fc252f7 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -842,6 +842,7 @@ left_spkr: speaker@0,0 {
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l3g_1p2>;
+		qcom,port-mapping = <1 2 3 7 10 13>;
 	};
 
 	/* WSA8845 */
@@ -855,6 +856,7 @@ right_spkr: speaker@0,1 {
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l3g_1p2>;
+		qcom,port-mapping = <4 5 6 7 11 13>;
 	};
 };
 
-- 
2.43.0


