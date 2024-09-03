Return-Path: <linux-arm-msm+bounces-30582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC2A96AC61
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 00:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 977601F2586C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 22:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7D81D58A8;
	Tue,  3 Sep 2024 22:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRKJTb+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A411A4E82;
	Tue,  3 Sep 2024 22:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725403392; cv=none; b=VI2OLNyXiA9/eTW/MMVvvTH3GM08zU5QXRTcjAz2QjNpLfNBu2fA8QCTokzmr2lmEUJPHKoSAMxgMZJ1zMEcNytGfzC/y2/pRvFF7mKiC5I6qPusTs7Y3Jr2zZqhTP9dzKzjEZ2Q6ECoNQKzE+ONvsKzNV2prQPJNO8w4Nlupeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725403392; c=relaxed/simple;
	bh=4O38kzP1C4mwq/te7kWRdexD5d0cJoNNawdVsQIDiD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iNi4bcGWpXOPinyRm2sfh8UJFdrlJHDXPcnnV4rzyWBEHZ61mj/Ff4/+y4ohLVGqr40TLacbq3cUiWFV8j+SgWIvEt0cvz8ECKcVKGBrH984kp9e9F/W9C+YLq65G/Tn0VN5kmtlmyH4LhZI+2OwstZ49B7r9bqp2bRcIBKXDvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRKJTb+x; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42ba9b47f4eso588675e9.1;
        Tue, 03 Sep 2024 15:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725403390; x=1726008190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sqPUpjbIID/Lp1J8+i504K1c9trTsq7CBv5b90KNbCk=;
        b=QRKJTb+x5sF1oOSWqTfU+qLFFA6ECuhL3Ck09vfKuJtsoZ3ggmyRLz0elAiLkR3Wid
         t1EkLgdEbNnK7ZhQCT1Tr0eutEnlxWk9qtMrtK5y74tVBE2wJX2Fd5bTz4xQvFNhskzy
         mtLapsx7oAS4f1rzMsSlLUt0gTNqa7uuC5bEcDhIISbwME/ezp/5TwpamdCD54yo4y2n
         AsYpB/qhBJ4k3gfIOoc5UiMHca/xV/XzIWD0alK69uXCLQ8gPKRq069OT95b6fAA77Bl
         gHWgsHHJEsJqZKUlzaW7FmDq94JSjZkjAAEkDD9flIPpa4LyLWEQocSDjrbHGPGaogEP
         pI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725403390; x=1726008190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sqPUpjbIID/Lp1J8+i504K1c9trTsq7CBv5b90KNbCk=;
        b=J3tPaPX0R9z/gF/96tEI6dc7CjHb+JGX2ih1nNWMMzFhEpfbHKhkzGgiO0pdwhYFcg
         SkWHyuNsqKIp/uEuJuWN+SGycPHo9pSLf1RzipJczt3OLaq2JULrRIkUgWVsrKZjrsFN
         lq4u+JA9qvpSDv1i+2xd/rwEqDPyzJvPPDlVtE3XcDI0M61LxMECwDrLtxFNJA5ZXJtf
         3WR1KDYuUKgyceNckoehSRxLvRRsotWtyOZolr8+I8ZahcvqV+F5w6leD9hw1JSnJwf7
         uUqlJ6K0czm5H3ehgmH9U9kTLekc+tf8VFEFVBvDMaxeopCLOeQl9gp9hickFbgu6JEb
         77Lw==
X-Forwarded-Encrypted: i=1; AJvYcCU8kQR1soFeHHkFGho7hV45FqAWYyRURtWtGzPOcsLQmS/n8N++S4QY+64TmK4goVeGsyhH1T0d0oej@vger.kernel.org, AJvYcCWs6VQ4TJsB0aLq4VZRIUPvAX408HAYqkmOZWFpZbTVBl0LTLSKXOWqfhnXmK6NbHBXPvOjf8Lj0jK19Kij@vger.kernel.org, AJvYcCXkvY1RLtIjColwTqIfpNE+r8ZELEV3RGebLwU+nP5rTlXqY6S/lCdHQQNWc7VaII/0Pu72usZ3te51VpT8Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI98Egyp7gmZoJYCd4MxpWQZXfpXZ5aPyt7Re3CcwYQGD3qEEE
	gEaH3lIguhaLR/OK4bA7P3dz00f5hW4uqhRUdgilIzQjDhy8irBJ2KmMCKI=
X-Google-Smtp-Source: AGHT+IFpK/x+tIbXbbtUAjVQAIdFm3v5tPEpFRbtKXVk91hMUadO3Owzbyc9WTdozncpRInHUF6MLQ==
X-Received: by 2002:a05:600c:5125:b0:426:698b:791f with SMTP id 5b1f17b1804b1-42c95ac1917mr353365e9.3.1725403389464;
        Tue, 03 Sep 2024 15:43:09 -0700 (PDT)
Received: from surface.home (2a01cb080508df00ca9665fffed23409.ipv6.abo.wanadoo.fr. [2a01:cb08:508:df00:ca96:65ff:fed2:3409])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6396516sm222955115e9.4.2024.09.03.15.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 15:43:09 -0700 (PDT)
From: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Microsoft Surface Pro 9 5G support
Date: Wed,  4 Sep 2024 00:42:48 +0200
Message-ID: <20240903224252.6207-1-jerome.debretagne@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series brings support for the SC8280XP-based Microsoft Surface
Pro 9 5G.

Jérôme de Bretagne (4):
  dt-bindings: arm: qcom: Document Microsoft Surface Pro 9 5G
  firmware: qcom: scm: Allow QSEECOM on Microsoft Surface Pro 9 5G
  arm64: dts: qcom: sc8280xp: Add uart18
  arm64: dts: qcom: sc8280xp: Add Microsoft Surface Pro 9 5G

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../sc8280xp-microsoft-surface-pro-9-5G.dts   | 1099 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |   14 +
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 5 files changed, 1116 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-surface-pro-9-5G.dts

-- 
2.45.2


