Return-Path: <linux-arm-msm+bounces-84841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF5DCB190B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 02:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B02E2308B5A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6E02192EE;
	Wed, 10 Dec 2025 01:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Ri/GDVTu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EB021420B
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765328740; cv=none; b=EL2z8v4U6//wysVcOxt36S/Ro5HS8opNJCJQ5RTM5RfeBq3DuqC5VcMiEEWvatK3A+LMUufBP0ii0RvI8H39SWDB4nK6HnqXaDm1Mfntn7GvVc28jq1veFs59y4zlu9+hniP08B39+yhMrIKwt6qhagnggEFIBFsMBzADBc/95I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765328740; c=relaxed/simple;
	bh=+i3BTfPhsLE8GEo/94/1SE3mgTKecjalY7mtMdqKORM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SHyAaaQrU+5yc/G1+wZ2ru1w/J+ZgHRBlRi6aQr/qXNegacX7V7uQ6pA0/l90mKuq0CcMHM/+dGih4dq4X5U9HShQ3hkHiToD9v+I5WFzqZbmsYUiBGN4Jj8RKYsDU+wObbTpsiSr9ZBAh2XMuruQhATEd3j+v3i8HxvnOCS70U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Ri/GDVTu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477a1c28778so77755795e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 17:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765328737; x=1765933537; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HHcSDCZPYXhd26Yn2LSvoK/Mf/qVpncEW7C95ovxbvY=;
        b=Ri/GDVTurLUN3C7rCjTK7gMxfgCFTeAyd+wgZf3VlOWirmins7VV96LR0XWNU8Pcbk
         KPcZNfqm/TTxCZ5W/4NoVrVzpqoTMk2xGaec8Uq/UEUdQjZBcnXLj0fFQDfFVRcsLu4O
         3d9u4Cek1OvQq15QHkhWoUuk/JsCinEnOQW9fH/A5RhJbVXmDMrVVvFvUc7Tsrm+rcZI
         x52DwrDBDD63Y+6YAFMqyybxi3f8ZOnA3PsCJn4OIO+o38haM6oJQtSDgkl5mzZ7Wux1
         4LuksXWI7P9BzNESHVl9gsM9LUBvRtSrTDnAfnk9S4M024XaaiC+3uPsydu5XsZBP0a4
         mPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765328737; x=1765933537;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHcSDCZPYXhd26Yn2LSvoK/Mf/qVpncEW7C95ovxbvY=;
        b=RPYAbW5QpKGgsjiFOZQz2beE7hO/Mn+e2udyr/09ETSGaCWpX7ENwppPdlW+YMDMWS
         eCZdSwngDDheLtZjG2QGfRyCr9ovNCPndCzfeoNMQU9HlshNkxZCbQgE70uM7qSnx4Gg
         PN7955oqNM9FJMJw0agxAhxHJykJYMctePKcZq/rSm+0uWFlfxnodI9ghR+ezjK+lwsR
         gOUzbvW7RzQu3cGlhSKH8mtYWWR6AxEw7GFixA/bmrQgsnSpgAKPs85vRsW+I/Yhyl92
         ACrpgLqkbMKwngoKP7dn8j5T1F3zffNprWxgp4n8oasRQvkcfLhihQt3wgwqdkS8/1qb
         8f3g==
X-Forwarded-Encrypted: i=1; AJvYcCXLK2JbkRAmGvPUOcCcPIMMcF8SK3NGN8itt4wIph3Cv8sW/khrs5YyKZHth1g+sYEFpQ7h6tH6h6bGLWh3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0aa5YBFrjt/yXJxz8ZvtPbjq1SMyacRn6Dm8GtLD30D/bC1ep
	8Bkl1TIv9NbHswFsj+OWsaNP0/34EsTFDciKBXkb3/9TG6NrmjBVg72AQ1s0yKaBK/A=
X-Gm-Gg: ASbGncscX8OF0j++bT2/gb1tkpB3abztG+rRZ0cyIKgfe/thKa5CSW76iv9gUJu0sYI
	NNzJYemERAbD39ra9/H5sjafVEHIvnXsSmhTfxOQAvq90gT7VUcmF8xjxZd82uec2o1geDfcog+
	n1V1Rqt3mJVFwV4qcukxIC+ZyIVghBndGRyqtvbDGe3OrQOVFK0e4nA5s3dTiNOejOlAfl1/LRG
	BPm4pLrQUDRJaHA9x2Uoc56eLOpbP0V4laVxhRf+L+KeWYY1Lh102DTuJUpOAXNlshl3oEcpXIs
	yZmoo1cZtp9g/ynLu8a2lxCmEhkvAYs72qIK7mzoxGXp1lxZDBwUzPF4ZkVKInpfv4CJ8h0M4wF
	f8yDe6vPjkqLNj3EPB6oY/hE/pArGajYHL1AIgCiSFO/u1aoqEdfB5ODOPFcN/b7bhaHb4Uu1ps
	AmxnBF0CE15XFM0/Q7xcjWUZGm3rmsxUXLqklw73fXsD9/3idtE2+pFNBwxEd7
X-Google-Smtp-Source: AGHT+IG0T6nWXe3W7j54A4PIsvvrJ8+7alDZyq2DAzB8aUB31Ina+UJT5hJjNMeivMH0tZ/Ul8SsHQ==
X-Received: by 2002:a05:600c:528e:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-47a8378c79emr7622015e9.17.1765328737169;
        Tue, 09 Dec 2025 17:05:37 -0800 (PST)
Received: from [10.200.8.8] (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf9acsm163206575ad.28.2025.12.09.17.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:05:36 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Preparations for camera support on Fairphone 4
Date: Wed, 10 Dec 2025 10:05:26 +0900
Message-Id: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFfHOGkC/x2MywqAIBAAfyX23IKvIvqV6CC61h4yUYhA/Pek4
 wzMVCiUmQqsQ4VMDxe+Ywc5DuBOGw9C9p1BCTVJJQWGZNDZC1OmhLMR2igfxKIN9KTLwO+/2/b
 WPvs3PC1eAAAA
X-Change-ID: 20251210-fp4-cam-prep-640342df0834
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765328733; l=883;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+i3BTfPhsLE8GEo/94/1SE3mgTKecjalY7mtMdqKORM=;
 b=WYroaOjCibHjE0paBIII6ZqmzENJydkJRzz6ylokmPfmofZB4qZ4I1nlYmOCU7+MSpxAM7NY/
 udMRwR5fT0lAWBhaWZdjprM3ucYrMDCO5qetfjwrRt2D/WWahkT8brU
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Start adding some camera-related parts which can easily be upstreamed.

This contains the EEPROMs, fixed-regulators and enabling the CCI pull-up
voltage source.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: eeprom: at24: Add compatible for Giantec GT24P64A
      arm64: dts: qcom: sm7225-fairphone-fp4: Add camera EEPROMs
      arm64: dts: qcom: sm7225-fairphone-fp4: Add camera fixed regulators
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable CCI pull-up

 Documentation/devicetree/bindings/eeprom/at24.yaml |  1 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 72 +++++++++++++++++++++-
 2 files changed, 70 insertions(+), 3 deletions(-)
---
base-commit: c75caf76ed86bbc15a72808f48f8df1608a0886c
change-id: 20251210-fp4-cam-prep-640342df0834

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


