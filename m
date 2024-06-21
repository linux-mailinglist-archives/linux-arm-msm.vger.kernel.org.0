Return-Path: <linux-arm-msm+bounces-23542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0EF911F04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 10:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8B241C224B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04CD216DEA7;
	Fri, 21 Jun 2024 08:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="p1OAOJEq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDBD16D9A6
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 08:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718959367; cv=none; b=csGFJ0LkuQaxOFi7BMuNQRaORaTUBPK5kZaP9fA1EUcWb4V7xKGOfQvNsMIQYD3H5cHAToJMYJAF9fFrTCG6Q2hBoe9Hj/IndU+XFaaOMpustE3x1o4dOR470nhe1sQrYzfYOtTVnGjGymUVF76nqiWEY4eptWtbxfCMDY8A8Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718959367; c=relaxed/simple;
	bh=xqKek1XvqTCfr6NwYsPzB4GImiJYhgGIGr03tZ1blJs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LeK0nbjw5eaRd8LrHGAaCRVQq1qCkjwRBZ2x955cuxfNTBnwM7EyAjwD7iu9FSVu4Lh34GxlVmuhdKEr2irO9R/gCJPnvB4NmFzkzzK91SQ55bXukH19st6PRhHJhbr9rglfVtRHaAJwuOBGaOW6MCRopO5kwquyHGAQnhywFas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=p1OAOJEq; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6e43dad8ecso297992366b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 01:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1718959364; x=1719564164; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kUnYRScJzL59U2vYuUFusX/xjPGk6acayJAkE49irck=;
        b=p1OAOJEqurtjb4zgOI5DrNGzp8Mk7CD/3QdpgDfBFnEcYHdArLD4borK8H5XK+7OOo
         oNlqFmjm3G7dE66Ftnw3s+ujnx8RiFdiT/MobjXzPWUDRPb0gdoJ2Vyze70tnuLxNz6j
         aPGyBPmPlkNirLg8CBvqrzdt1yV88XmO0htJNgbl+JFnhRfWgd4LYHEn2c7YuY7dzZO4
         XDmrjaKGj4tNqFtYRSK94EYWvxmCFrIaR33u0SJGDLss+l3MYRZ2DoNvVojkpAX8j2U2
         GZRrR/xA+tKjYnvmSOM362pWef8JTJvMLTHHldZJVgljldS2ZptA4vc4d6e7w+3OQlPT
         Me9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718959364; x=1719564164;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUnYRScJzL59U2vYuUFusX/xjPGk6acayJAkE49irck=;
        b=f891w6FoTRs0s+DE2AfkEBm7Qk0P/hdLn/DLkdilJTcDuX4S/9CXHAvJKjODjNn0/d
         SWExXPnqUNLZ320wlQa/ctpjD7r8qao3NAjV5Qw68o3pNug+PmUuUcGRPDGHRvAFzOrD
         drmMmFHJrlSEO0M8JniDDZ5U3PbztgcZeLqecO6hMT5nR2qKBQs1ncqbL55YbSAbIOd0
         vlsxz0qnTpqQf2lkt8R3s/rYYrU93HETlVZh7B2fuKbhBqFyIXfD9gM4HZ51CIsp4z8w
         ASYjGwmGBHBiUROrCF9MpqmhTY9wvge9jsMNm/tnRXNOoYJ4grnYHvy44kxKxnG8/YYU
         ojyA==
X-Forwarded-Encrypted: i=1; AJvYcCWr9MZZKH83nok5kjUHTE0qfn8sNprH/LgZYg1Y8XKvWhetg/1uac0izQhB7HwSAoHYVaZiZqXTQHUpI0sTKhqTfgjQ/76y1nf1ySKfhA==
X-Gm-Message-State: AOJu0YynB7VIVi5Kb7yO1NLY7Sq2B1c6P23/DhVcangnDaPp8x8Y7l3c
	t9ruLdYjIH9rD9whzRvLtTHdbM7l/A+7Ie26Bs/WB+bRvMTKrEga/6nFuqOUINE=
X-Google-Smtp-Source: AGHT+IGk9CWilm5qia4rnGMjRHdwvVHpwVCxmCigKKbigiJMGhUVq2PvtH2YD/02WIjUNb44SYwydg==
X-Received: by 2002:a17:906:27d0:b0:a6d:fbed:7953 with SMTP id a640c23a62f3a-a6f9506efe1mr729475666b.27.1718959364083;
        Fri, 21 Jun 2024 01:42:44 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf428c18sm58993166b.24.2024.06.21.01.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 01:42:43 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add PM8008 regulator support for Fairphone 4 & 5
Date: Fri, 21 Jun 2024 10:42:29 +0200
Message-Id: <20240621-fp4-fp5-pm8008-v1-0-dbedcd6f00f1@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPU8dWYC/x2MQQqAIBAAvxJ7TtjERPtKdLBaaw+ZKEQg/j3pM
 Ic5zBTIlJgyTF2BRA9nvkOToe9gO104SPDeHCRKhVqi8FE1RhEvg2iERetWNNpY76FFMZHn9x/
 OS60fUBAAmWAAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.0

With the PM8008 regulator driver scheduled for Linux v6.11[0] let's add
the dts bits for Fairphone 4 and Fairphone 5 which both use this PMIC
for powering the camera sensors - and the pull-up for the CCI (camera
I2C bus).

[0] https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=ib-mfd-regulator-pm8008-6.11

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      arm64: dts: qcom: sm7225-fairphone-fp4: Configure PM8008 regulators
      arm64: dts: qcom: qcm6490-fairphone-fp5: Configure PM8008 regulators

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 105 +++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 109 ++++++++++++++++++++-
 2 files changed, 212 insertions(+), 2 deletions(-)
---
base-commit: 89b2edc37183ced80c5ae14277b10bf6482a0a94
change-id: 20240620-fp4-fp5-pm8008-909ab08689ff

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


