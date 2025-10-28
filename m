Return-Path: <linux-arm-msm+bounces-79100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 366F8C13188
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 07:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0734E4E1D4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 06:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D481DE8B5;
	Tue, 28 Oct 2025 06:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qe0dxd4b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D13611E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761632205; cv=none; b=Y2A2o/m9h7/RQljvokQ7SjDY144hOMmvoZXUwLPUjsJdJltfgdLTvi39ndlpJ1/uDuImIUC3yUQxJiiTofKPjc4zbqlKYpdNsoYXvLq/E9q8a/FuKkRzljhCzWXuF7D74xXnRr2SZZC6blH6883EL0ae2jTKDTWSd80VTaqpJlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761632205; c=relaxed/simple;
	bh=3q7vgrsEYAl/mHjsczJ7QlOK8tqZttVCqjidcksmLTU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hf5t7eNiTeCy9s32yGLo0jYNrv8Cv91aPCT66W2HwmJwkZhFgZGMWl3BwIp/onIgG3bOHW8wFhcdjHOs/2LOSrbh+9bTaxM0JZ0GRDvQNQ4N85jnDpxhED0IQm4lBph/JScTAuX4JDtzvs4GTdTJZ1WLHDz8LnPNAa1boroSi8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qe0dxd4b; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so82456865ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 23:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761632203; x=1762237003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M4Rb55I5lLUug6IGvr+iG2g0hErU8FZ4QrrA0bkbgrQ=;
        b=Qe0dxd4bOtGxFZr9We/nGpVAMSGj3aNIzuMpH5JSeZ1Ui8Rmy1Lzp+LnRm6T+lcppp
         ayRAdLl+TT/O460oUd0rJss8wXsCJj6T4OSmoWzxXZtxiW/P8WhkNoIJ4JBNxGcjGEXU
         b06H3iTNcrUZSCLXIGbkFpPjM311mRIzvonN6FuJJSCPN0IlFqMLfYfdRYmvNNW6yArA
         I19TEExAK+P2HrqCamUrDGK/yfm8wyqT8uHbh1LsubfTAi8NNV8s2a8YKfndbIniueih
         la0jiBzo4ovi72LM3mH7T5MBa+cmziYbmiPOMjuN9URehvfMiS3kIjmduuIBujPJiWt1
         yklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632203; x=1762237003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4Rb55I5lLUug6IGvr+iG2g0hErU8FZ4QrrA0bkbgrQ=;
        b=QwZFgrPmoTt/TR71Gcs3+Lm8Fyx5nS07rtAta7fLjh6DzoO9wGdvN7qUpQfmfsLO5S
         rIwLTC+XdLFGr3tmqfp5l0wCuhug5NgQZhrKcXf3424EzqTQM2S2hyA9CF14x2Sh0EEK
         dGeZtOJgMIsipP9ly+PpRoUd9/tpHHlMgp8cGO7p2I+0KscxKIypFiZWgG2gwV71HEYw
         sfzfJgORTO10d8uo4VrWHb3CCqrsa9xFZ1FdpB8OdYp7bnUGIiy+5ZYag8kora395n83
         LJ3QrxsG3raBJelnMtoTVl37Cej8cksY4SwXhQzZVNBB6jc8nWiuXoHJwjHYjgBp16VR
         TTKA==
X-Forwarded-Encrypted: i=1; AJvYcCV0/w9fGAAYvV61X7cnjZdPpQClMHzH3/pYEc6Mw762x94MTs2Lor/e16INLXI66bb9QnFWBMdnrzJBe8mA@vger.kernel.org
X-Gm-Message-State: AOJu0YwTXUZCQRrC+JsNVnBERTz+g3eIwo8vNROZheCcAg4pYpMQ6dN2
	bd+lep/eyAmMu6KTvTP26GJqYH1S40BDwDWudZGRIANXhKlKBU+HzMV6
X-Gm-Gg: ASbGncsau7vE7Rl0GKGuKhtIvIMmdiZsBjmadBYFEYy49KoDAfCDPYBZB6XVPrszW1g
	X7q/aOyHGyMoPxm/2czQ+9dTGAJlwRUv2c9ZwHTqy3el7K/GqsvzcznjLxKXDcelfpIXjH4quns
	DE10FogVgGH50t8Hs9CLwuzgg9fvU3Nei9SdL2QKZWMVTFAayEc5KWzIRGdcm+OE5IYJbnGBgYV
	so0QXzND8y+g2dffU0HJQLxb+pQUnPxi4aDGvjmB3E7+CjMWLO4BKSAJSxnUkxuY7tFjkZhNRde
	9b8JC4FqxSiOHawmmZ/c/LKBRrFf4buigBF17TWUcZQhqOtOn/a22IMTmPX/zW4kkea4G6hbJeb
	sGYc+/rrz1Gbk9cB49vfqWbyLOJDlSaYZVL6ShJTwjd+A3YhRyXaxuSeBepwMHlWAJ34BPjyMKm
	D5Luzu3pcdh5V3vGPy0kpvgw2w9g==
X-Google-Smtp-Source: AGHT+IHTIhRQHTr/xzwx+z1LhLuPWrR6wig8oy0fi1xGmqNWoAym+r1NmbbRsmQoQzQAu6/rb28qXg==
X-Received: by 2002:a17:903:186:b0:267:6754:8fd9 with SMTP id d9443c01a7336-294cb507c55mr38028255ad.39.1761632203414;
        Mon, 27 Oct 2025 23:16:43 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e429d9sm102612935ad.100.2025.10.27.23.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:16:43 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v1 0/1] arm64: dts: qcom: Add dual-channel LVDS support on QCS615 Talos EVK 
Date: Tue, 28 Oct 2025 11:46:35 +0530
Message-Id: <20251028061636.724667-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch introduces a new device tree for the QCS615 Talos EVK platform
with dual-channel LVDS display support.

The new DTS file (`talos-evk-lvds.dts`) is based on the existing
`talos-evk.dts` and extends it to enable a dual-channel LVDS display
configuration using the TI SN65DSI84 DSI-to-LVDS bridge.

In this setup:
- LVDS Channel A carries odd pixels.
- LVDS Channel B carries even pixels.

This patch only adds the new DTS and corresponding Makefile entry.

Thanks,
Sudarshan

---

Sudarshan Shetty (1):
  arm64: dts: qcom: talos-evk: Add support for dual-channel LVDS panel

 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/talos-evk-lvds.dts | 128 ++++++++++++++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds.dts

-- 
2.34.1


