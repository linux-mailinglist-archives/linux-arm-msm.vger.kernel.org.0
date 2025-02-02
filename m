Return-Path: <linux-arm-msm+bounces-46681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80905A25065
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2025 23:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8645D163A36
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2025 22:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDF62147F7;
	Sun,  2 Feb 2025 22:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fuN52ii/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0262D1FBEAD
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Feb 2025 22:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738536373; cv=none; b=rz3aNmsQDjz0m/ZeRU8pGQ0I4eY9/Vb4qf9NMtPXA6OM9DzwTPW9ykHYJvDg4YL0IDmnnCIp4orQBb0B3hVdFtUJfrHcaJP4tFlvJfStEnzxI5F7XMXoQdKw6O8rgtskncOB6hsI6JFZgiU4WcPfsShWTZSne2VD4yNSsevUF8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738536373; c=relaxed/simple;
	bh=AgL8Vh4o01HqqDUJ+cWv0Odl6D4wHVO6sMsIgzd0wkE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M93yiENf3NJKKMq5cBcoPjaGM9RFqtgIZxoihr69A+RrYtcE4yhTyOz32KQoMtwhAEkmgX+TSys5TAmSMOaXz4sZQMypC4jYkti/8JGg4mgXpimh6ea/J9jyJLJsqHW2GPHXQGkKLJts9rf5jGgyJnvJl5K2PoOD3qnnyOS4uys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fuN52ii/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so25648645e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Feb 2025 14:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1738536369; x=1739141169; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YMxp+N8AKPgVkLLt+tNd5Z5gGgVjKJ6HI6C9QfMvPDY=;
        b=fuN52ii/hTOy3qleFmXOZlsz7f5wuimSH6LILVnaC6e1QCacxvOPpY++PV6hls7bLk
         Q32pjDUBgMdoW/Pr8hqLHyHVFhBO7co62VBmpxuvLULCK8XRV6Y/ijrB5NnI5eTLX1hu
         5MWFVXJE0meVofQLwE4e3o2D3rGrWqKOIWB0+h+DV0jFMGvaVeAs1pCf9YcNJj4xB5pp
         W4kpnBgEns5tslGl6WLlwZwKh/kDNoJ3CLszjCKVjgz+LDyXmvA/v3ayCVWNs33KukfA
         0PTovCGWx2H1v8//xLB70WqV7pqNzq2386ORQRIX9mkSB/iaNDWmxis6hBehMRrDw0FF
         pUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738536369; x=1739141169;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMxp+N8AKPgVkLLt+tNd5Z5gGgVjKJ6HI6C9QfMvPDY=;
        b=okjCcEsa4wiZTOYT9lCfdzm8c7xnqvDaVc6YRxMlWc/ycJUCzZe2tu8qdzWZ9IaAb4
         yg38R3docutlq85HXM4/DSANNQdSjjQ8dZ7n87dhGFszU/BOiJjDftxORREhbV549in6
         qPywoOrnErlTOuWW5/RYSDVfu4lUPxaOMatMloF0bzbn7gGwFk50tG0jPgAB/09oXOB8
         wDL7Hc4kkZcC9TVJyx6XJ07uWyWaXXUG/Iohh9svGSJcjfkwxHGUYpRIH4YdBXVtZ+0N
         engTfuXClaUYWs94PDJJnxRTYBKfdCcXIW2mWmKSNp/LFBmP3lkiHy3z5/JPRD1Lj/8v
         RpBg==
X-Forwarded-Encrypted: i=1; AJvYcCXh2+KlDyycHAQHK2F/9FN6X4zxU1hPpMU5mTmtAm+Vmswj7qryqpzm7TyT9zAxcqsglxIyPMQjcZ5oip+D@vger.kernel.org
X-Gm-Message-State: AOJu0YzRl2p4eUzdRc+qzQv6MMnpikdDjO46NzMyrmLjUy9Um7ilD7Jj
	1i1vpzEvjoniRZpBFLSoPk3tAUBqsDlNoS1XQC77R7YOjRoS242dchWhD+y9VBY=
X-Gm-Gg: ASbGnctj/+Rvsz4dKt0Fetun88agwHrFmXOFiAM5V7EtTLFT0yV02X5vx0r+p/ZR9AU
	bvBM51dvDL6CZZUh8R1/8BOj4I7NJXucX34kiKCwpcHgAZUmbim9MkZy8+GZYatr6xCx6RNtg22
	StM80OEmKOkEQNbMaJgHvECHZtmIE0yayUwtLodARHErJAfvvYrv4RLq38bxAFvyNb+AFUBzO3f
	+rPNq0RtBw/LqN7SIzvrD7ZGf5wKIePjfMa2oRCnypCKiaxUenvLDGc2CZv9rfu6J/rgK/+Ghet
	znMVlQFnBfE/yje/QCV9NvV2Ym0=
X-Google-Smtp-Source: AGHT+IGcFZzU17tuXtMYl8AEybTSN0illAVTYf2xaoCzTK9YBwUnEwlsFBobc6i+n1sl9bjYkSI4Bw==
X-Received: by 2002:a05:600c:3d9b:b0:434:ff08:202b with SMTP id 5b1f17b1804b1-438dc3c360dmr159424395e9.12.1738536368984;
        Sun, 02 Feb 2025 14:46:08 -0800 (PST)
Received: from [100.64.0.4] ([2a02:a03f:6bc3:6b01:62c7:350e:556e:d0f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc80e61sm170849605e9.34.2025.02.02.14.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 14:46:08 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Enable panel and GPU on Fairphone 5
Date: Sun, 02 Feb 2025 23:45:50 +0100
Message-Id: <20250202-fp5-display-v1-0-f52bf546e38f@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ71n2cC/x3MTQqAIBBA4avIrBvwBwm6SrQQHWsgTBSiEO+et
 PwW7zWoVJgqLKJBoZsrX2lATQL84dJOyGEYtNRWKm0wZouBaz7di7P15EnLYCjCKHKhyM9/W7f
 eP08/RqZdAAAA
X-Change-ID: 20250123-fp5-display-75cece20d3ef
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2

Now since upstream DPU driver can use 1:1:1 DSC topology, we can finally
enable the panel and GPU on Fairphone 5.

Depends on https://lore.kernel.org/linux-arm-msm/20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Konrad Dybcio (1):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable the GPU

Luca Weiss (1):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable display

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 102 ++++++++++++++++++++-
 1 file changed, 97 insertions(+), 5 deletions(-)
---
base-commit: adff68376f7a6872be00d87720764b30f3ad1059
change-id: 20250123-fp5-display-75cece20d3ef

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


