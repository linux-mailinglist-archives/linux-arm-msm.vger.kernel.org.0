Return-Path: <linux-arm-msm+bounces-56153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F97AA0F98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18E204A4481
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B72E21ADDE;
	Tue, 29 Apr 2025 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="nvaNxoRw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FBF21C162
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938222; cv=none; b=QO4ndOaVvYH681B6QqxQqLlCgyDgEaSZRckKB2rEOaJTjorqHtFsmFE9q0b8QSL7+MhttjdJqwVc+BN/YoUc9xlHIhm1B4LRzB1zD2/9iwT9526hDVOkN3xBHfaJJt1I3IRjJJLMLDmGHVrapc1kHv4aUoonRcgNLkLOEgNo3iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938222; c=relaxed/simple;
	bh=2PdqbEbagwoDuKzEj0IRmpbhZpPVeui/bIiI8irZQ4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9RJ7VbDWdGFDbimV1s6XJn7wr0Q0tUoNfMl1GNdgXGqKsO4rhiGGZSplkOKeWl3q/GUc/AplttvAfKU/2OXP+LisrEW7YGMP0Knv0r0q62x5CuMMBSHDZlTVtK8kRpSntLG7eSLq6fEwg/XpowhviF9iegnw3yMiLJ5Q/YXr8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=nvaNxoRw; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C0C103F2B6
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745938207;
	bh=52MijEJOA2wvCQcL6Go5NIekwbrP8EYQEpSc/TVugz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=nvaNxoRwoCDNsq7UpgzciIuMPv/EE9h65aYebGA0eWUnBNjASYieq2V9nDIPO7xYo
	 UqQFcXPH5e8b49DRtLiSYbUnStQJXSJuq3lcX0IBx5K8xnZaX/2/7y+mLJtLBA5tKY
	 qgHrLHLU4a6opQc6j3GNjCLUCwmSv7qAaG8kGuKCwDqm/K6JPAg1GlJUbJ/LoQr+N2
	 DMYhAzg0MRLbQhVW7NII4pCBoGFHr1n6nxRodNChd9VD+NZgUlQWuNuExvxyJBhEWI
	 SqA3uB9ZIFsLcMqU3sgbIUdi7SCrnB2T08eDXUXSNOrRsz4N+XiZoraKW8lRFak6bT
	 ZGSdmZILvj0DQ==
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39135d31ca4so2340878f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 07:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938201; x=1746543001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52MijEJOA2wvCQcL6Go5NIekwbrP8EYQEpSc/TVugz0=;
        b=DosUtvuoVqUEu6rR2EUPxSvHaCk/ivveBLG8jS+B4pB1DBtmBFIAZf1WT/JDqzH4+t
         6UKIlOT9v0YGHeh/nQf0+mi57DDL3pYzQa2kadRQtc/2W5BD88guRyqsdhGSGBA5uvZX
         Ejc+ubn/IXPQTsHEZxrZVkjagvhIlfOzvtK0u7xrkU+gwNqygM1E8sjTLyQ5QchBZXq/
         6Nr7TiP1E5876rD20TmOxTrewMK5lo7lvzSAxguxs+PfpRhYgg3rYuImDAXZElaJsNqI
         dtpGJ4yd0x8ygq65b+NxUVEOrPHEK3NaLeqdOn8I4OvC/1TykOxqfwMpARGWg6jPmihL
         6T4A==
X-Forwarded-Encrypted: i=1; AJvYcCWjE7gB1Eeuc/qgJrvffc+meFQjSbdVgQyyBPCo7Cp0lA1LnJYu/5bW0uzxHEuzFFg9obIe9urPuXmE+CDC@vger.kernel.org
X-Gm-Message-State: AOJu0YxEO1nq+HeVEYJDzrkL2T7MkUdJL/S47d1/xSWvt3faN0kS3Qq/
	3tnFLoXg/AaJGqeoCltUy3bSnI0+N70GztNbRMsUczLJZ/C+j7UzLWqVoUiWziLmstUgEbVjTDQ
	H3LjE11mCO6R0AGHHfr0k6Jme435Zrr55/bMMnXNnede3V+PmJDQt1OuIsnwa3N5R9OGF+5TiIv
	vEBjM=
X-Gm-Gg: ASbGncvkh7yjw7ksj82MSuaL2O68C360GRQ8yy1QpyjCKRIrmWPw853jB4ADGbAcWw2
	frrN+OiqcXsekqQTohlnbFciBsC9xPmHmQs7OMbtKXq0l8UsbbMYEQwttfx2uiN88Q/I5HmwrXa
	CzrrRTKby6NkkORAxKOn43i370LYlaJpdbfPT7UwUHVjBnl9TJtMxIeDYIqXRNUAk6dYpT09YAc
	Fb6qBiFsoQD/O3y8sHgZkPWDuG2OPrYCPGQRl4+CBMHY5OUKgIsqTu/bj+Qzm+HmEf3pYWMAz7F
	Cpy/lkpoPdicsdp9Wc1X8kSz1BY3AHjQsX5R8di/XJADrWURLiVcsoHR
X-Received: by 2002:a05:6000:18a5:b0:3a0:8c01:d463 with SMTP id ffacd0b85a97d-3a08c01d90bmr2630920f8f.9.1745938200825;
        Tue, 29 Apr 2025 07:50:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnKBHWKNLptuYZLJZBRUoe7eBhk55Kl8aqDH7g/w/SK5bZ6Awe0yTGofYm3mWix+gf5bziAw==
X-Received: by 2002:a05:6000:18a5:b0:3a0:8c01:d463 with SMTP id ffacd0b85a97d-3a08c01d90bmr2630899f8f.9.1745938200468;
        Tue, 29 Apr 2025 07:50:00 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8d1a5sm14498765f8f.13.2025.04.29.07.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:49:59 -0700 (PDT)
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
Subject: [PATCH v4 0/4] HP EliteBook Ultra G1q support
Date: Tue, 29 Apr 2025 16:49:53 +0200
Message-ID: <20250429144957.2088284-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416094236.312079-1-juerg.haefliger@canonical.com>
References: <20250416094236.312079-1-juerg.haefliger@canonical.com>
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

v3->v4:
  - Bring the sound model back to the node
  - Split the driver change into a separate commit
v2->v3:
  - Drop status properties from nodes in patch 3/3
  - Add acked-by-krzk to patch 2/3
v1->v2:
  - Don't rename the X14 dts to dtsi and directly include the dts
  - Add a label to the sound node and use that to override the model
  - Reorder the dt doc patch before the dt usage


Juerg Haefliger (4):
  arm64: dts: qcom: x1e80100-hp-omnibook-x14: add sound label
  dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q
  arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook
    Ultra G1q
  firmware: qcom: scm: Allow QSEECOM for HP EliteBook Ultra G1q

 .../devicetree/bindings/arm/qcom.yaml         |  1 +
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 30 +++++++++++++++++++
 .../dts/qcom/x1e80100-hp-omnibook-x14.dts     |  2 +-
 drivers/firmware/qcom/qcom_scm.c              |  1 +
 5 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts

-- 
2.43.0


