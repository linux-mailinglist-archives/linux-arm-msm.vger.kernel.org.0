Return-Path: <linux-arm-msm+bounces-54482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D3A8B5C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 11:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8228C189128E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 09:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2C52356B7;
	Wed, 16 Apr 2025 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="kGxttYLa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339E222DF99
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796568; cv=none; b=OtYUXxsIMIQXGsF3WNKyAyBaAazmPBC7KHQzxM12kMPIE230SkPaN8F3Fiozk8/bPC5dnwFJcm0jWWtym/KuiQAawXQgR9CZsI4Q7wEU/d98kPGMCipmG9aNmOMt5TwOVqjzRJcO5SMNEqT17dMvU2N0IHXYRiavjLNNGr3xlzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796568; c=relaxed/simple;
	bh=v6n7jILdjhbGKHuKJjta2U75MS/4ZHmGbjks7d8eyvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VfTs0vUH28Hdt6yC5xdrseFUZixol+NmJbB0abbomUeyC3u0sMkn6zJZcNVLwPx92gOl2RF6L6HDu8rFuDdbFI0T9lZpZAlAxUpHSgp1apIcXAfCIjAU6FEwfGQDhsqGIgo2jh+/SmsODMBhX7L9fzSfjNZL4pgmYslhkQBQR+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=kGxttYLa; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BDF183F1F4
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 09:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744796559;
	bh=i9ixyQFFhUHW4HMFMtkfJpGgEC202KPMs1epsc652uI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=kGxttYLa0keYSDHEUvcBIgxrkqoyt/vG3nYwIJJpOGxLeDbEC4WTCGybqRdHobVMj
	 nSSDnanbgd2QLSMjhBrRBdoMNYUnw/7b7l+1a1P91xleTNGNGw0LTZtiPjTA/297R6
	 JDqzS4YZDfoRDXKXkFALL+iLd+Mw8evYmzBUB7B1tQ+uV4xx6iaVrnQ6Z+Y/SD8s/V
	 GZPDE5f9c86MRk1q6HfrSZ3jlxpV5eCbqeVHMOAiKYUM1a2rx/EpCQWuYGc37phe6+
	 qwdPsVnLtbDwsAbWFVLUYHjQX4ZwegWqE3o9vGYdyXsT4TuKVxt82o12RyyXadIPX3
	 YwgUjyZx6LCgA==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac37ed2b99fso559056966b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 02:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796559; x=1745401359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9ixyQFFhUHW4HMFMtkfJpGgEC202KPMs1epsc652uI=;
        b=ZuKE3h7I6nW8AX4/v7FzXTcNOVNkGOBTovY9HFAgIncUo6MF3nd2dISHG22tfJzHoT
         6afDFmsgp55vD/CiDvnXpS8661Dc2wS8KUxlIhb+96kdXvZaP6Zl1wfvWJvtuAE98Vlc
         zpYAmxDxHxI8EfYxwINNgUjQ+D3HtgbQyLOivR86lbTREwkwI7xOf9AkPoK8Y2fvPP4F
         Q5MSdWEznM0SMpM1YaXuCTEwPUI63lAt7LuBaqGtiqfqCgt9U5L8/BnfTXaYmD7kNebb
         q0jf0TMw3kQsbqKN+5ZO7fyKBTBBm9ikIeCFHCUm9K4g5ooB8ieSpCNmSIhDCZRvvqh2
         Ef8A==
X-Forwarded-Encrypted: i=1; AJvYcCXDroXLVV6Z34ulhirssdFSWzy446zac7oBtZssdHPafgu0a0KlJffbjwwvMChQz01tznM4N9tVEnjoGrH/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6d/9MMjA+eKgwOIzjZFQDZsaxR3JSIfJIscJHOPGti6eSMS3Y
	jQmvHOSGEnYEFiy6eMGGFbICyemL3PkBu2TFbz0TRVUfWcmHJlHrazRO5Htva1H6NxNhqNViYPS
	bg3p936KQ4IOs2hid2NV0bJjAZ+6bHM0266CsZrG58CBst6dqyamZ7yHxehKoxk+X0N6JiVhKLP
	9RB4k=
X-Gm-Gg: ASbGncssEcVdz6vdVBS+nlaxOIVBThX6kDKrEy2Nqm0TbXCZ2i5Y5e2qZUdWUfq/ic6
	MyhYyozh7pq6cFhYYk0W8nfavm/Txw7LralyLVrLl59h/KBAH9Kt9dJkOX3M0DJXZlVe+r6+wfj
	NA8TtUMk3UolqAE68kjxx6VLd6D78FI7rP1YzGAjuXZy3+3oO4tAKy87mrleI3M2APrBbj8BEqd
	ycqX1s4NQepzhkOeT/wI5n9OtFQHHyj2+ndcyvPwXmJBgHzH6vPsU2DzBjao47kqe3J/XpZkwRq
	mQtGlsB3t3+lleEYKSU64taLbE2KEsUgKjQ/QXCp/DpNWef4F/g4x5an
X-Received: by 2002:a17:907:a42:b0:ac2:842c:8d04 with SMTP id a640c23a62f3a-acb428e0393mr105040566b.17.1744796559121;
        Wed, 16 Apr 2025 02:42:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7ls/+zecyrOEaABBTILwE0kIy3epCcGQns9JrjSqagljy01aArWTanNTW2rX4QlZq1npbDQ==
X-Received: by 2002:a17:907:a42:b0:ac2:842c:8d04 with SMTP id a640c23a62f3a-acb428e0393mr105037766b.17.1744796558467;
        Wed, 16 Apr 2025 02:42:38 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cde04c7sm95510066b.55.2025.04.16.02.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:42:38 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v3 0/3] HP EliteBook Ultra G1q support
Date: Wed, 16 Apr 2025 11:42:33 +0200
Message-ID: <20250416094236.312079-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408145252.581060-1-juerg.haefliger@canonical.com>
References: <20250408145252.581060-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the HP EliteBook Ultra G1q 14" AI laptop.

Based on HWINFO64 and APCI tables, it seems to be the same HW as the
HP OmniBook X 14.

v2->v3:
  - Drop status properties from nodes in patch 3/3
  - Add acked-by-krzk to patch 2/3
v1->v2:
  - Don't rename the X14 dts to dtsi and directly include the dts
  - Add a label to the sound node and use that to override the model
  - Reorder the dt doc patch before the dt usage


Juerg Haefliger (3):
  arm64: dts: qcom: x1e80100-hp-omnibook-x14: add sound label and pull
    out the model
  dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q
  arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook
    Ultra G1q

 .../devicetree/bindings/arm/qcom.yaml         |  1 +
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 30 +++++++++++++++++++
 .../dts/qcom/x1e80100-hp-omnibook-x14.dts     |  7 +++--
 drivers/firmware/qcom/qcom_scm.c              |  1 +
 5 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts

-- 
2.43.0


