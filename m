Return-Path: <linux-arm-msm+bounces-75589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4098BAD1D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 15:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09D153C618C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 13:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3CA303A28;
	Tue, 30 Sep 2025 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NzRhiqGU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE82F2512E6
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 13:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759240640; cv=none; b=pNkkySEXzeHU8RKuLg10kbVWaEufAnLK4tQvvfCektAqK4y3SRPFTdgploRbZceOMwfzKk4Ir4uBqOmoA+bVtISd/ae4EzFPTDqDHWYP7lYIb/qo7sRjz6s6asTn3/0NcRqX02/rLQN1L6AkKY1P3OBGR9+EaqHjqYjBopRdki4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759240640; c=relaxed/simple;
	bh=LvoK/fU0u4wr6mRtgdT7avBiMc754iRAL/avyJ7a/+o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pEKXUo5loWM/dFHtjy8IIP367PYQgMcXfj+F2joAIL1eJevP138xYGMGW99RUx97aHDcysOtkESJ7UfxzFgPC9lXXy9dgTBRe5++ahp9u0Z60RzcicqeLdxXp7k32GW2Qwz5kgsOXjBuVVrRmjq6tgiZG8Ywmq01JQfawNBJTJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NzRhiqGU; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3be330b1f5so622106666b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 06:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759240636; x=1759845436; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eUr7vsKJmPNDRIs20r13nEz41hFknG/qraXbAKvVO/o=;
        b=NzRhiqGUDh498dEWpEe7rKJ8/3G5f0O45Ju5nXQu28UNz6wUWgZc32wWrw6ZCerq9A
         VftOqfCYplEWDsrfelFkcMxptOPlsxZX71A6pTaXtiZmSZD0D9WZFJtPgM6LURLCGS9e
         XJ1xZ7wDZN3Kvq2/WYK3dw2flt52Flzv7ybWZyHluobf4GfaNSHM/AtQ7js5CIz8gtU0
         EMHC75owQcZRd6YVhQlfbkf1aR+ff76LiGZ121W+Xhuk/ow4QAG68FNLkTMWT3T/SZNI
         yGgKrlgpN3vedgN5OdTFm0nUSHsYNIKNg52h5fzFgHvhI0tFaRHZhBKPMKrtvaYjNb71
         zQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759240636; x=1759845436;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUr7vsKJmPNDRIs20r13nEz41hFknG/qraXbAKvVO/o=;
        b=gMfehrtEab0jZHQlPVhWd7s3RZVs+/7V3Ocm6Ejf0Xxut5wFVqTxAg48P1i4/TLs99
         igf0KYedaS+i41XsqMmc+jvNBE2b3I+flJ6hnmcuxWQUP0WuY+iv/ytUYu8YUcY2gZdy
         /FypWLmooxSZXEYAzbgLughjjJgPEGybxdu+a43lDSvdjtXuxSg5zGnT8u9xNJJ3nNr7
         ubOXZEzY7hmkvkGJqE8zNBeZThX2qb2tvMiNF3vSz+aUjjTRsCe2L61W2pC2M0h9Qh7q
         hxmMj1AXBx7yEz69Wc66DXUzxuFxz/FXMWq0qFLPYQV40BoJkcXosivPn1dhPnfoAxP2
         1ynw==
X-Forwarded-Encrypted: i=1; AJvYcCWXzX2ZYzqZ/9wDfuutkNwTRXx3AgtjWVA0xgKPwo8Ok3/iq8EX6VddT2DIR/RO62FP5Rx3bkTIMYPEdOOv@vger.kernel.org
X-Gm-Message-State: AOJu0YxLjyHRYgnkBcGcDYPboxCMfAwrmRbemEu44267hRE4OAeWsMtS
	3Ci2/f7nCIEgl+ca7JibOo6hfqXcDTakhMs2cyrMSFseogVSx+pk/vGirWbmBYl4MPg=
X-Gm-Gg: ASbGncta2tU+4j451MPu0MgEeA8uP42TMW/YdTpaV5MRILsEckPE8cSInX62XwLgTXq
	XmNb+5VfQKWBiQYCfQA+l5vNhhE6Mr6dpiceN0CtuGBNV8juQ/N/cDVD3iaRnoS7bLrBpwm4scl
	hDWtFna3dA+inY8ze1+zYhPCJL6RBlpwovaBu279cq/6cAV0lP6M6XZxXem5RvgVO5bVOd2P07N
	Xh8TkQwfMBpyxD8LioIy9B9ZCuqmZLPP+cRykK/ucHpUMfDpBindByCwEaxR2xWByX8WTE6+Bee
	6NU5j45aDmPNINKO7zxN/+Far6tRmF1SIotO+i7E8BQeh8tcwlZSc1hYdaQ4txaKTrL4B2MRKD1
	oSFIfJfgSNr2eLPHJwZ+h+pSWpiRRd9WuPIX4pLLPQiEdWqX0Zp+fkhHVGqx+qbSmJ9F7uda9Cg
	Tfnw/6uKtXRhHHflke3A==
X-Google-Smtp-Source: AGHT+IFYeOgKWJT7YPQFm0YeDty93OJbZCiOvEyhMTrBgicIfyRCh7ByvycGfhKCy0N/oNg9ro2maw==
X-Received: by 2002:a17:907:948e:b0:b3f:1028:a86a with SMTP id a640c23a62f3a-b3f1028b47dmr844768966b.3.1759240635975;
        Tue, 30 Sep 2025 06:57:15 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3fb818fb90sm370234866b.63.2025.09.30.06.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:57:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/5] Mix of dts fixes and improvements for qcm6490/sm7325
 devices
Date: Tue, 30 Sep 2025 15:57:00 +0200
Message-Id: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKzh22gC/x3MOQqAQAxA0atIagNxVFyuIhaSyWgKFyYignh3B
 8tX/P+ASVQx6LMHolxqum8JRZ4BL9M2C6pPBkeupq4kNG5cS+hPw1WNkWvvqQocmoohVUeUoPd
 /HMb3/QCizpx1YQAAAA==
X-Change-ID: 20250930-sc7280-dts-misc-c5dd04fcf74c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759240635; l=1094;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=LvoK/fU0u4wr6mRtgdT7avBiMc754iRAL/avyJ7a/+o=;
 b=H5yzZH2WkXZYR+4lSp/dVFM49LH1oXDP4ygon7l785TAFzcmY8soqxtCdDZ74m6LvtCG+dBhy
 YRiXQCs2xCwDBBfEKWtUQVlGYrtt19LUwP9/KRphLv+OUW4yWD0tlpi
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add some fixes for Fairphone 5, and use correct compatible for
lpass_audiocc for qcm6490-fairphone-fp5, qcm6490-shift-otter and
sm7325-nothing-spacewar to make sure that driver can probe.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (5):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add supplies to simple-fb node
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add VTOF_LDO_2P8 regulator
      arm64: dts: qcom: qcm6490-fairphone-fp5: Use correct compatible for audiocc
      arm64: dts: qcom: qcm6490-shift-otter: Use correct compatible for audiocc
      arm64: dts: qcom: sm7325-nothing-spacewar: Use correct compatible for audiocc

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts   | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts     |  5 +++++
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts |  5 +++++
 3 files changed, 30 insertions(+)
---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20250930-sc7280-dts-misc-c5dd04fcf74c

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


