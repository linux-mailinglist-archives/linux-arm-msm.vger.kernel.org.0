Return-Path: <linux-arm-msm+bounces-34629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7129A13B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 22:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C01F1F224F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 20:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21FE215F52;
	Wed, 16 Oct 2024 20:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/IR0f0I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207692144B1;
	Wed, 16 Oct 2024 20:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729110181; cv=none; b=GgY3BTpZE404V+CZ7POn/QYFG5+l7rATZ9ueZAv+2otWLTnTWpekZZ5VWPn8HzEVdtLq6yXekTXg2G8/llqp1uYdbbQFttLNZ8XP44UsWWnzhEh3zUMvk6LvnrAgprq9jeHdnsHRrc/iDo0EGCeuyOXODjbuXxlv7SSVwqXcpIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729110181; c=relaxed/simple;
	bh=l8nuP3pIzD+PoCfTGlVJkqZ3H6aSTzMtu58vztyryMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WKbo2ZADLixAAkUNvjKyrZAVUO28qxDcygrYlpH5N6adTVehuK6dfKZuec2mGs49Z2Pxa/F5nhXoVRRDdSDlXbJQCtC6bi59hrACT+fB3s2Nl+Jf8GGMMlWnC58e6KgIClN8Z4yW6g27Fu3JteStqaz9cLLHiE1JQeCrGf9CEQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/IR0f0I; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43152b79d25so2112395e9.1;
        Wed, 16 Oct 2024 13:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729110178; x=1729714978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aLqCeMIG9rfb79faCQ4MCCGyVJzSc3OuSfzv4Dyb3mM=;
        b=I/IR0f0I71ufrYvBco/8GNGEoo2AcB47TiOHjf+y5qWDc7/5jPk1KoingUrCTYT3Y7
         JBPQ0XFzwfBdgNa7XNHnh47nN8lxeJeL7Ekzv2Xf1mPSfzpUZ5qA7mjlfg4kmwfMTxhA
         4yqsLQG3S1H2ydBMWs0UBbISYRDCsujYD/r6skNWNyVuQbnWV7qwp56GuyuyLxFqkLiJ
         Ey2jx6P8t1FoXKoYY1b8Z1Lo/DnrD+u3fsZk36CZ+ojkyzhzSCavMNVgSFcMVrI/ajTr
         esDWNQPGs98NuRMM1t81icdqtz9cQWav9/s2ivk/SFsKmvUbmfGmqVEGZ5ANxhsKK4y4
         SGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729110178; x=1729714978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLqCeMIG9rfb79faCQ4MCCGyVJzSc3OuSfzv4Dyb3mM=;
        b=FoB9jgBhpzU1e6c4DsORvnCZaZ0cPIu/nGQU/IYzHd9Eys13sml63vG03F9KEOrpLD
         QeN0EcZ8gvFuFYgCVossHexQJ7xHJ6zx0/HJfPyjmBbZaVHl36hmv87vI7JRinMJb7lS
         tjHEuoESoXIfCFmdtqO5+A1tXUUFEoG5UFMNc1GK5r5FFR5uAnLDskbhJGQ3kzRfhWzR
         7VkNUqmGava08mg8Fcn0vsVz4DbmyVPO3fI4bdsHrSsGbYYHwzT3s+dC7EQXddnN+iwk
         3nEb/MHlxPkxAkSb6iSyB6T6cVP/FkmjDbutLQKFcOWB5NHa6DT78OZmx5h6xqw54n/L
         ypdg==
X-Forwarded-Encrypted: i=1; AJvYcCV/xkxt51ixw2A0a9BLn+SJ74ma8ucBfYqOEhR+Na1/YI3TWUOqyvKwgCPGoOdH/2KKNpwgFH/qdTyD@vger.kernel.org, AJvYcCW3nVYnWEjlqyZhiYFA9J26du+nHAZJyoMH23vf/vG0I7iKiGQFkrMDLFV50xMmu1tAOI2lHwNlhY/XpVZOOA==@vger.kernel.org, AJvYcCXbxaA9Fe22TyQ8eBPmNo+Y7JT74QHM9Z8TUD5KES0ebvomZ0kgRJHOnYvwSksz3iurbIDRvDVcuG6AHFKm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzwqx6L1qAU6FSbb0Gwsm17Io8BVP8H4MeH3xSCXJeK7z5G0s2
	00W6k55PoLQowdGbWRow/U7TgBPHirg1U/K+iw2aL6OIwUIy5u0=
X-Google-Smtp-Source: AGHT+IGn4Ko3OzeNJyXpDIIA9iuVAZF4og+jqu+9del4WBjNHbm0cxoAeC8TAiw8tqYDeHPjoSxISg==
X-Received: by 2002:a05:600c:470e:b0:42c:b037:5f9d with SMTP id 5b1f17b1804b1-4311dea462cmr172756105e9.3.1729110178031;
        Wed, 16 Oct 2024 13:22:58 -0700 (PDT)
Received: from localhost.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c55a87sm3942125e9.35.2024.10.16.13.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 13:22:57 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan.Kemp@dell.com,
	tudor.laurentiu.oss@gmail.com,
	tephan.gerhold@linaro.org,
	johan+linaro@kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 0/2] X1E Dell XPS 9345 Improvements 1
Date: Wed, 16 Oct 2024 22:15:47 +0200
Message-ID: <20241016202253.9677-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First round of improvements.
                                                                           
* Add experimentally discovered edp enable gpio. Drop panel info, as it is
now documented in [1]
* Add Johan Hovold's fix for nvme regulator

[1] https://lore.kernel.org/all/CAD=FV=Wu3vaY4Rtw4OZwgAf_b44JpDsKJhUa-EXiuu1hn3aJoQ@mail.gmail.com/

Aleksandrs Vinarskis (2):
  arm64: dts: qcom: x1e80100-dell-xps13-9345: route edp-panel enable
    gpio
  arm64: dts: qcom: x1e80100-dell-xps13-9345: fix nvme regulator boot
    glitch

 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

-- 
2.45.2


