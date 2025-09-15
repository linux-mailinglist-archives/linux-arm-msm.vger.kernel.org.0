Return-Path: <linux-arm-msm+bounces-73579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 743EBB57D24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 15:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81FA51AA2D05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63DB431283E;
	Mon, 15 Sep 2025 13:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nrgbE7Xv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B34531352A
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942936; cv=none; b=UehkxJUftkAFrXJYS85H5Qt+PEKftrnGJhTtPdlGucSFcjNDlm5zvCmRTlnhlE06zluB/npRqhaxd6L808KoHgPGDJ7VNeOU4hTGKIY1unxBmCCij0DJC1a06OgDP6r5Lq8y0A+WlIyoyNMvWQN48OQhR+mvAE/cGUIgj4a8P1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942936; c=relaxed/simple;
	bh=xEgvgp1w1rmeywAOVMjlCu8mw7ilAI0jVsgUn340nr4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WiPoWR2EmzrJoXE550SmhETRwPDvUuG4fE3PT7r35ikRovMOUMrPIoq4pW16y3pNZlzHD7CG98pg40bM6nZm53EcUQjljNLRChUbO083sASQkVZkRE07eW3pZ7QlvFirCW7ZWUBjgDDkjRv4G55hAP7Jy9BURPrvwLd+K9NDA2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nrgbE7Xv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45f2f10502fso4875875e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 06:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757942932; x=1758547732; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E64EnDDoUOocvbh8uugNWKeoaww3AkFSaRKoHulwLmQ=;
        b=nrgbE7XvEID0Yju47ylFelyaSgKwRjFDNdtTH9r5ZEFtndr0BODbIooSPcabYXplaE
         E/DQDT+OnDxOxMHUnPk3gWKAQAp4p6Q3Nu2Mm6x99ZgjvMNAjYRXD7M1JM/sB94JjUKH
         elR6lnOPdOuW6h2/t8pv88Sv6HoeKoXk3Gc7ExIbNkWsz2yOA1R8S0nhPOvx9t3J9pP0
         ASD73GG3og6N/lHB6IJBMTszg/T/Bbci4ZKT/2pn7phJ/AzKmHPDwXKBaNG1UtAMteSV
         MApAgRtCb+vZH9rkzD/Cs/ekKEl+mISkBK5+J6VrIh3FHIz/4KRKpYr7gaO+Hezg/N3b
         C6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757942932; x=1758547732;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E64EnDDoUOocvbh8uugNWKeoaww3AkFSaRKoHulwLmQ=;
        b=Sc2H4oAoddzMGu7o4NCHFI1fOuZCyOqDXISllHEpWTyMfETRUXuOkuqyxfIQKg2jox
         FzzBWhG5SWTHjlwHFKA6zs5iI6XeBxIR64g0l/pNql9Pm51DoZCTtecjuaT3IrTUPma1
         h0zDaNbwaCF3xmI5/ohWxPS3d7cAT3otsdWyB9yt4DLMPvTW6aATRcVFqnimPiYev1qh
         Qc38Ejo3NC1qVVPyd2rt4kaHsQEDWp4u2PUZFfvZapYxDQYnD/FHuvhbfuYkr9Oh7SOx
         QepA0mGsZFjX05580z12vDnYC9Lw7O4TvRiXUU/psGn8N16eujeCQrkNVkV80mtezZk7
         L+pw==
X-Forwarded-Encrypted: i=1; AJvYcCWW2LXVnY6LsFQN159yNnqiouz3pBHlzWPT/sS3IQGK1VC6idJFzZ4HW5gqQGsy53FiY392IZzRqv/zKco0@vger.kernel.org
X-Gm-Message-State: AOJu0YwViAlRMfSX38ajqhOt6684AIG8SNDyXYCiSEgHydZj2daDh2D4
	ZCyHSX/oZLk9FCN7AvJMtjIlh3u09FST6cKcOk4nHuVnDeaq5K1tOVqoxmwtFcdz/Q0=
X-Gm-Gg: ASbGnctVCtIHzCh0m4tYog/7i/Ev4ZLuN0BOMOfRqLRVaJxkEyMnxOgvJRIg+WLyEmd
	wJdcq2AuMvUXhNfne/A2hwjY25csHpT6vWYT5sMh/LW3vGVS0WWZ7Lx1/D0NKe+lC9g0A5Nzqzi
	r+9Tu1VcMeuIz1C7m0q2jyvsy/gS7oz2J9lm8NaEiz9ya33nHeyAZdokM2m7EoMg48pTzksknMk
	uQ/SNFG4XdTTOisin3jkhCzQXXVPQdUt+0SsmO2csky70fO9fBrEBmLQczS0GKIZrpVTf3O66IH
	Ar8RONUlVU/OmLvoMrhtZCKaZeJoirqdzoL643VVUdaBuEaIdVlujeneD2wVtfLdemL/T8mXVwm
	IxVKS9kCut3XNFZrQfSKaGsw+ha2LFfZdyCrNdRBV5urzUA==
X-Google-Smtp-Source: AGHT+IGMJiALjnpkCZFxZk9BbN00L9xwO5fbJ1orbywijGyhwDs/6vzS8QZBYd1u/SfOaaq9fQHVyQ==
X-Received: by 2002:a05:600c:6c94:b0:45b:9afe:ad48 with SMTP id 5b1f17b1804b1-45f211d57e3mr101731705e9.16.1757942932310;
        Mon, 15 Sep 2025 06:28:52 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:eee1:5042:e713:2e9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9fd89af70sm5978874f8f.43.2025.09.15.06.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 06:28:51 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/3] arm64: dts: qcom: msm8916/39: Add missing MDSS/SDCC
 resets
Date: Mon, 15 Sep 2025 15:28:29 +0200
Message-Id: <20250915-msm8916-resets-v1-0-a5c705df0c45@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH0UyGgC/x3MPQqAMAxA4atIZgNtoGq9ijj4EzWDVRoRQXp3i
 +M3vPeCchRWaIsXIt+icoQMWxYwbUNYGWXOBjLkjLcOd90bbyuMrHwpOlqIHVWGxhpydEZe5Pm
 HXZ/SB1cE2jRgAAAA
X-Change-ID: 20250915-msm8916-resets-52f2e52602b7
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Vincent Knecht <vincent.knecht@mailoo.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Add the missing resets for MDSS and SDCC on MSM8916 and MSM8939 to ensure
that we don't run into issues with the hardware configured by the
bootloader. On v6.17, the MDSS reset is necessary to have working display
when the bootloader has already initialized it for the boot splash screen.
MSM8939 has the SDCC resets specified already, so that commit is omitted.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (3):
      arm64: dts: qcom: msm8916: Add missing MDSS reset
      arm64: dts: qcom: msm8939: Add missing MDSS reset
      arm64: dts: qcom: msm8916: Add SDCC resets

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++++
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 2 ++
 2 files changed, 6 insertions(+)
---
base-commit: 62a9be0b3388d1026117de536f6c81e09ba219fe
change-id: 20250915-msm8916-resets-52f2e52602b7

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


