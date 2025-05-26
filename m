Return-Path: <linux-arm-msm+bounces-59427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE23AC3EC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 13:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A83A1896E85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 11:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7491F8ADD;
	Mon, 26 May 2025 11:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xQ0igW4c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81580199FAC
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 11:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748260002; cv=none; b=QpH0KU4P+rfx+gh3uHLrO88I0bmblXteI19lMtsklp76H+F1GyLxPhRp1QDCQo//QdqrDDFm1vxvhblcwu8dvJCRxfIOCeMc5O2vX+boYxqPvXfmzP3aJ85flbx2QnNCBP1xGakJW3S4R74VergVZ1cvBiR4FUnZV9h1gdhKwxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748260002; c=relaxed/simple;
	bh=6FlBLYTl3cCzkcGmmf+RVCVm/VVZyCcyYvoy0ulBW7U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ouW31DSjStXRO7Inmu//RzQBfIrT9E99KrZymQTwJq1eH0PxDrIe9DJKXwlTrL7nvI0MPDQgRZ8XQVREljQ4wCveYFO6M73lW+aHhfMM+QdwQrXynqWzSixxxa39zOvRX9RenpNcyYhcqZcn5BIp6jCMFtbtcW5wN8d5fslLhmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xQ0igW4c; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so4069505e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 04:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748259999; x=1748864799; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UmT26TZNIjKSub4/U1HbwSxo7V17Yc99eYvs6OG6xlI=;
        b=xQ0igW4cH+dF8fSpSq1uLZZ8e4rwvYem+N9OBUqEP4q+ONDv/97cpbFR2v0Y7Aj14x
         cJuqxHb8CPHsZ6FU10nnCQ5kqZmqTBEF/PiiWLZ6rHeH89rs1Q1i1B279RNLjXzYDlxm
         6Vy9oGv8qJhdyl3z1NMJGkiykkHr2h82DdOYvnjVhd0Hw0uD9sU2ezlGD86mxWORcWvs
         sQO3g+Wz0VSSX4rCJELWj/XLmvv2SUl1YUX9itQ73HlbpisEKMIC+cZ6q+1MzxU0nN6i
         Q6YVXmEmNDwtxuE30EWvozXy7jmaYjZNwHCoy+21dnV8PnETzQ5YHZk176AqstWJsaJL
         +CuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748259999; x=1748864799;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmT26TZNIjKSub4/U1HbwSxo7V17Yc99eYvs6OG6xlI=;
        b=FAyGDUpgXVdl1/YE3X9BXCFS9vpBqIWM+eqmdRIgti3O5jfahiveCjoyaYvsFUy22B
         Pil2ehfNicg9Z/GioyE3+GQlriiofk8D4h0Yon/UHFltkQrVb76np9lwvgt/lJY0oM0G
         RZ2ZJAL33xb+rWRvQgjCLUjrwXQhylCT3mVcBxbJmPggaTlXJIRh0kW1ZmTQo5hgcvhD
         yIiCtORqJjnNbkYfXHF6iDb7zyNXPlKtooF5PYdxATeLw69YIsDQcmQjImqSrJRwfVig
         DjQfFDr05FWhtqpU2F3MZrl8QRJNS+MbNCKlPYBPekm6NwVvEDXibsbU+XsierKDK2BE
         vl8w==
X-Gm-Message-State: AOJu0YyixvKysdg+Zvh8V0ytgoqufMg0i/VTg1zR6hK6rWa/VnMZXQq1
	Tq5LT/EA98aBRrTyQQAfrET1ga9s/wD/DytydrUnInRiVlSwH2Z8u44JuJcAFPalwjw=
X-Gm-Gg: ASbGnctBE8hMIAwRAokuMzLUuPW5dJue+SM0+cWUwbUsK+HhFwZVO8IU/1oKxcA564V
	PwdAuv1WIq6i1a/IBYhBilKj+dPEgqu/ick+j+LWxaAoBog999hUSER3fe2vMyMQT1OA07DaokS
	EoH+pUvpCOoVViLF3Ldzu4XTbV24irNVOaXwFRxxj2JIQOP1+Vs/lwXFqJqiKG3r3BY0MEPtgoc
	VX0M7NMHgfy7hoTeTPpu+EjI2usPfTCZ2JCzNwtwNkilet0qF9e38MWFqieelONCXv8hetHNNmr
	ktTCW0cfy7xUjfFX9IqDBnXg+wits0JfF+KQNpNYUas1G5aFCuBtwApBOzF7pdpAdO5/zsc=
X-Google-Smtp-Source: AGHT+IHN6lyvCoX0jpVJZ8NXnDrC9afkOAXBGgdMZ1Sd1pkeJXm6dqEd9v3TYlIKZf2jgXjEWqvEtA==
X-Received: by 2002:a05:6000:2507:b0:3a4:dc32:6ca2 with SMTP id ffacd0b85a97d-3a4dc326e33mr528002f8f.7.1748259998621;
        Mon, 26 May 2025 04:46:38 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cc52ab88sm7592310f8f.11.2025.05.26.04.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:46:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/3] arm64: dts: qcom: sm8750: Add sound
Date: Mon, 26 May 2025 13:46:31 +0200
Message-Id: <20250526-sm8750-audio-part-2-v3-0-74429c686bb1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJdUNGgC/23NQQ6DIBQE0KsY1qWBD0TtqvdouiD6UZJWLChpY
 7x7wS5ME5czybxZSEBvMZBLsRCP0QbrhhTEqSBNr4cOqW1TJsBAcg5Aw7MqFaN6bq2jo/YTBVp
 LAWXZVkowIGk5ejT2vam3+y97fM0Jn/ayt2Fy/rM9R57bfKKYBHl4EjllVDEuhGbYCGWuDzto7
 87OdySDEXZE8foYgYzoRmnTGokIf8i6rl9u63L0EQEAAA==
X-Change-ID: 20241122-sm8750-audio-part-2-943277d85302
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1599;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6FlBLYTl3cCzkcGmmf+RVCVm/VVZyCcyYvoy0ulBW7U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNFSZ+thKr6fJ6Eo9APj8b8AeSQvm0TJI1wh+k
 oak4ROk5nyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDRUmQAKCRDBN2bmhouD
 13p2D/wNYQvyt7tmyj/2uZFxnA5DJdq3xyworfuTspJ/y1L5ALC8rCS1SHlSQnmM26G+jDtMWb8
 q4L1FkvkWK+If2f5ksF7J4cydTymUrERT2KdyMWhPGom8VEbGfycZ2lixxCZjV1ZNXxtn91lVwC
 odmCTR/cIq84vN/DxxuZb7gzyJXr9LS5pJFbi4w2xMsIPptMepGLB5lrEdb3ITNU2OWw7l9sTIF
 tQETTTtoMXmqGd+CePBwfQzw0q17RPQJUatGhpCRkGtFMZ5Xx07lMpiTGLsMzrcl52AccNsm603
 qGUkSTV8jn+w72PsIN/JLeDAf4EKJmQodygm2W5nHc+p3/mduQa2ZOzNdawcLET6BD750nDDD6Z
 lyC4Agxjv6ys38pJA+jHChFYUs7myfti0SfyBtVzL6Uw+TCvQfKPW611XHPCxxg6sV9vRBMkStQ
 SZ+ntpmSb5Safq77tkgt9k37U6+fuy4HljQt4a/xPcH7LxmG3KwV0eZTqjXqWxLDodYITfB4oCi
 TKlDgtFFaL1aDcEVoA7kQ332GvgRK6UzE6L7mZ9DdZfCTi/i3C7qlFvfwgAGRsjD8bGN90+CeH3
 MIvL9/LysP9YX6m54Elpv4PvhcL4M6vpYcybH7oA0l66gkEDKPufDQn1QeJiKHzQxl/5vVqq5Xh
 z/foOahCXUQIP8Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v3:
- Add vdd-px-supply to audio-codec node
- Add tags
- New patch #3 for QRD8750.
- Link to v2: https://lore.kernel.org/r/20250519-sm8750-audio-part-2-v2-0-5ac5afdf4ee2@linaro.org

Changes in v2:
- Patch #1:
  - Use v2.1 compatible with v2.0 fallback (Konrad)
  - Use hex address in <reg>
  - Re-order nodes to keep proper sorting by unit address
- Patch #2:
  - Re-order codec/cpu nodes (Konrad)
- Link to v1: https://lore.kernel.org/r/20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org

Bindings for the new Soundwire compatible:
https://lore.kernel.org/r/20250519080453.29858-2-krzysztof.kozlowski@linaro.org/T/#u

Dependencies were merged, so this brings the necessary sound on SM8750
MTP.  I have patches work-in-progress for USB headset, but this have
dependencies and need some cleanup. I will be posting these separately.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      arm64: dts: qcom: sm8750: Add Soundwire nodes
      arm64: dts: qcom: sm8750-mtp: Add sound (speakers, headset codec, dmics)
      arm64: dts: qcom: sm8750-qrd: Add sound (speakers, headset codec, dmics)

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 215 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 225 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 122 +++++++++++++++++
 3 files changed, 562 insertions(+)
---
base-commit: 0fde2d760e610a74f67eee9e757a3d4a95388f36
change-id: 20241122-sm8750-audio-part-2-943277d85302

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


