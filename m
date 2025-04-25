Return-Path: <linux-arm-msm+bounces-55620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F234A9C821
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 13:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50CBD9A3F22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55DA924A072;
	Fri, 25 Apr 2025 11:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jI12LOsT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512D8224B06
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582036; cv=none; b=h93dneM8q32LGHqGyvgzVbCYVtRQA7FmurzWcl8x5cEzTj6x6Zh8inysiMP7ULZ8ho7aALXWN/DSMHI75oe8i/tkR4eLxcTMro9nv2cEMDhyJ29Qg+gSUEr4FBokquUDZRELaNFqARCbsr7cpfzQDi6LIQNohvojWyXotnrUCYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582036; c=relaxed/simple;
	bh=t4TthAZ3F9lMsEFWpdYB4WXYguLQ2nA96zmSR9QywDQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z+g3ocYE43zPl7Zyi5A32LhUcjNpNeSvfsSpC9pHaKEfmbZWjUvNnRIrx+JooSR53uUEz1rXEiVEuGavZvCYzH+AFfaz7362UYpropZ4U6TSG4CMqbO3IkHVscetImVytmZQZlB+0+OPSfNMo4FpF4frDgA6YFHdsFRTkNmS/8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jI12LOsT; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-acb415dd8faso316988666b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 04:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582031; x=1746186831; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=13kUB0+PNIat0bECR/AFF7iIgHZGfM9/hy4AbRFvOtE=;
        b=jI12LOsTw2SFhWRzJ0pL7YsyPUJUVi4JM2od+Im0qTvTQLVdJYyOXlAy0KnTvPFLWw
         ma4yAKdwve2+2GQadd5b91Os1UR0lYi4fhMpCWhvJ42yMzqWF53vpsjU+B7rLEWuc/pb
         L+jEyDnPQUJVb3lJDyzcQufeUwCiZyUDZrLsRU3sBx5cSoXSHTCzWStHgyB5b2ad+xFO
         vC5Cm9CHdPC6yzEeB1ylz3YwzjLAkpQAkBeAqvxGcpv0g6dN1rcLf8+GE0yg8egc4ES9
         Vc2qCva7HqnVP04GUQ4L28+nYz5rvd3Cz7RTfb4Tsoe4nJ8/cXO+d2wNkl2zKf6qxvnn
         rkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582031; x=1746186831;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13kUB0+PNIat0bECR/AFF7iIgHZGfM9/hy4AbRFvOtE=;
        b=p+6coC+Jp9K0dDNauBHfh3hCpN23TOChXGZwQwwqqFRuaaZ2dmYAcvzqVZi9Tp9JYe
         KWJw17gXU8ZYVu6nE342cmJJVWzFyZRSL0OewaFEPhH51Mb5eaHNKP6r5UGP2UW6Pj3l
         BXMh4fMdXOXiuLNVUsNzbQeVeghsPiNWm5n5NvSBvbaiICDMfmU4APFnmOLWh+p6k7Kj
         JX/lL3+PqrkoEl++ddZ9tZ+xjbQxmJ9JsnqEtNlaTbzTz3WNWd4ciOy7IizRDJnBQv7B
         xjsk8YmAKtF+KUammeQ1izpKU79oYKaU/840KwfogIx2QkKk0/pmGoGUZMveZBaN0WLG
         CVrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR4SKnjPIr9cRi8051afCzxcgVJKStPkrhSW5mnA+CW3qCYmHi0uOOhQDuaGQ0YIiCBU++cd/4dQoQ7P1p@vger.kernel.org
X-Gm-Message-State: AOJu0YxZMgYXQ3stqyTQ4a3pK6eE3ith3UpP/DPMwtgJ7BP4aa7NBPYc
	S0fXM2c572iLkEEvtorKhUFB5XDTKY8vgYB1x7uVXWxydKTKtBU/WwaC1V0YxXw=
X-Gm-Gg: ASbGncuBwosxc7jlbbvOmKIadJCsFfXDpr8Cy8C00PAYc47PXZPu+3PXbJIR04EGLPB
	XKfNEaJczS0gRrdcLZCCsJXTmLQ3fRv2kmOApXkRVYnnANwh3OPrx7LJI/8JSe+AsOSeBNhhck8
	5GUERNB5AYDAmys0mdpihlFcvk6gQb0yGiEvFtZBnMNBsQHkViYz8R3cAmehcHisMkSrd6ZrNH7
	UL8B/+D74WIJfT6eQlsyLTT9bfMB8YW+F7VYZ+JBzoTmFBHP4MB5QwUgQG/pOKFGCeuDgLpmudu
	8QIgElIewIENpuUqj8ULdY8YV6hW/KKR5AzkAZ9X5zN2dA2VTV2yBlP4EFBNJ/Tpjng2r1+Yy2q
	q6MOBtbjpvEo21nuHBTFGQ2wYy6wLGtwg24zwlswSafinuAqDswqykhXL
X-Google-Smtp-Source: AGHT+IHT3eQUsAhEeDs3qU9PR3mRIlzHW76qCY013tbGyfPlA9ZIGQ4NtCbgs6pmjE11nGsBbT4gBA==
X-Received: by 2002:a17:906:db08:b0:acd:89ba:8069 with SMTP id a640c23a62f3a-ace71037786mr189289866b.7.1745582031401;
        Fri, 25 Apr 2025 04:53:51 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:53:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 00/11] Use q6asm defines for reg for all qcom boards
Date: Fri, 25 Apr 2025 13:53:39 +0200
Message-Id: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMR3C2gC/x2MQQqAMAzAviI9W6ibE/Er4mG4qj04dQURZH93e
 AwheUE5CSsM1QuJb1E5YoGmrmDefFwZJRQGQ8ZRaxxendc9eMHAi0RWDM5xQ7O11BOU7ExFPP9
 ynHL+AHx37fZiAAAA
X-Change-ID: 20250425-q6asmdai-defines-d55e10c33080
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
readable. No functional change intended.

Verified with dtx_diff.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (11):
      arm64: dts: qcom: apq8096-db820c: Use q6asm defines for reg
      arm64: dts: qcom: msm8916-modem-qdsp6: Use q6asm defines for reg
      arm64: dts: qcom: msm8953: Use q6asm defines for reg
      arm64: dts: qcom: msm8996*: Use q6asm defines for reg
      arm64: dts: qcom: qrb5165-rb5: Use q6asm defines for reg
      arm64: dts: qcom: sc7180-acer-aspire1: Use q6asm defines for reg
      arm64: dts: qcom: sc7280: Use q6asm defines for reg
      arm64: dts: qcom: sdm845*: Use q6asm defines for reg
      arm64: dts: qcom: sdm850*: Use q6asm defines for reg
      arm64: dts: qcom: sm7325-nothing-spacewar: Use q6asm defines for reg
      arm64: dts: qcom: sm8350: Use q6asm defines for reg

 arch/arm64/boot/dts/qcom/apq8096-db820c.dts                  |  6 +++---
 arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi            |  8 ++++----
 arch/arm64/boot/dts/qcom/msm8953.dtsi                        |  8 ++++----
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi         |  6 +++---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts           |  6 +++---
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts       |  6 +++---
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts       |  6 +++---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                     |  8 ++++----
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts             |  8 ++++----
 arch/arm64/boot/dts/qcom/sc7280.dtsi                         |  7 ++++---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   |  8 ++++----
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 12 ++++++------
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |  6 +++---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           |  6 +++---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts         |  6 +++---
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts             |  6 +++---
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts         |  2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi                         |  7 ++++---
 18 files changed, 62 insertions(+), 60 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250425-q6asmdai-defines-d55e10c33080

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


