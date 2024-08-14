Return-Path: <linux-arm-msm+bounces-28507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5571C951DFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D39A81F21703
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 15:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBF21B3F20;
	Wed, 14 Aug 2024 15:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H5N63MMX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3431A14373B
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 15:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723647861; cv=none; b=P5UO7OZ2cmHGArA1KtzPVqecw/mHkyDlc4Oh6KDrV6lgDjxFMlDBHLI5n8TMxYw/lYuUQW04EsP3IZZ/pHDB66bfYoek/EnBVZOb6hUhx64dNPjoocCOcOeS0N45EPdmX9Jcx8sCL+HxY6baPpEzvja2Nc0Ksk1S6zktL9Q1vjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723647861; c=relaxed/simple;
	bh=iH0p1V4eqat+M+Ev3ANGFPe7vqJ4jJ5CZXeTzvo7Cdg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mbCiBqquy7HYvZXVwvcoq2uWv5a8hMDJ9Y2h2hXi+YHm1SFNSjjeAhp9b2E7GpxA2IxRkbbd7+/NjieVkzkws/ASDERMcWvL58uBlCA4dXGK8XNQ7VJqaNfMWPbdt7nEfI0KuwvSvV+CimS6WDcJ//ZpJQDdMh4kd46UOGpDkK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H5N63MMX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42817bee9e8so49789225e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 08:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723647856; x=1724252656; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9XvQrRhyjQYZnQbMs3EjboskCKHEKhPSKVqnPioFGZ4=;
        b=H5N63MMXysNxuQII24p1ekBVXN5EGMX5OKt3hrNtOcoI0rgAa7MiOB+J85rWk1tYrV
         6rkvXHDLoOpP24TZ96Dugk66FJl4EjCSwtTGFHW6EEeSNlM0EYxaj+Swy800rNDIIFf9
         3bf5IQ4KdIuTG+4PJdTaVW2dF6Q4h64N1rWGoBG6JO4sDF2rojkEGUtpWB8sqCHwL/yB
         EC6GlySnNLiYuQ+rstGx9azYDkmysc4+vSQxloh/HQsrHjSvQon4aXVCHGcl4pUZrT0Z
         8yeft0Epsy/CpdXrcroqtwnX85V2mbN5YIjO5/dx7rHoVbacjr+rwXvPFppGTbEI3Ook
         916w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647856; x=1724252656;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XvQrRhyjQYZnQbMs3EjboskCKHEKhPSKVqnPioFGZ4=;
        b=u1t/3lxwcFPug5hPWhgReyenpChJgkdvCSgXWAr7IuvhWCn/S7of8JpQTzFYguewrP
         cdwLwRnYmfqDtGcS6dwxMxxKNW6nFrixLG1xhBF49wzwJUsjmfy4/AmZ+BP7EPk06BPk
         wl4liDgDdex5aazw1Bz/8LqyLEyHSgWUeuI+YMwV9JYOU4IuwFQ3mpY9q49HohlQNImt
         nlIz8um3grnFFj/6OdgqgKeEyf+nwvagXI/CkGyI4pfjXSS2sH4rI+q8qMne+yfet8HN
         yqUDy+ohIlVde8YsQ2+o/XNMkYHJWxR0kqfI/ACCqc3/W4SxIF/YYEF4vj2Jqg4ptZ1i
         px2w==
X-Forwarded-Encrypted: i=1; AJvYcCVlgwBxSypRPLsjBWqAvljoQyX75jxwKnG59ooqxcxfl7nH/hbUIrCMzK/bgEbc8B7yYxQP3yQLf0oMV7SBdqezyqMxBoPPnOmIKU7wnA==
X-Gm-Message-State: AOJu0YwDKyZcNkffJ6u5n4SwG5K7EvUxJzZknEMgPZzfj4rjV0BXHbpn
	HbhcjiKNZVObLH13aKBWzsm1t8GUYJYJnq3n8BO4Bho5gSEp6QJzh8upOuJf8hA=
X-Google-Smtp-Source: AGHT+IHmH/lZvjGcJ8hd1XXOkhepYdrTq38ZINMbfl6cgbN+vgIZhEXaS4U/b6MJaA+KEgX05jhvHQ==
X-Received: by 2002:a05:600c:1f96:b0:426:6308:e2f0 with SMTP id 5b1f17b1804b1-429dd25f8f2mr20826075e9.26.1723647856256;
        Wed, 14 Aug 2024 08:04:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7cfbasm22313425e9.45.2024.08.14.08.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 08:04:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/7] regulator: Use scoped device node handling to simplify
 error paths
Date: Wed, 14 Aug 2024 17:04:04 +0200
Message-Id: <20240814-cleanup-h-of-node-put-regulator-v1-0-87151088b883@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGTHvGYC/x2NWwqAIBAArxL73YK9QLpK9CG51kKorBmBdPekz
 4FhpkAiYUowNwWEbk4cfIWubWA7jN8J2VaGXvWj0t2I20nG54gHBoc+WMKYLxTa82muIKiVddX
 UgxsmqJUo5Pj5D8v6vh9oAOq5cQAAAA==
To: Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1380;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=iH0p1V4eqat+M+Ev3ANGFPe7vqJ4jJ5CZXeTzvo7Cdg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvMdmd+tmcteMBql83WlVuhACQS93WzBw8oMPj
 AV6xtrkFf2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrzHZgAKCRDBN2bmhouD
 19bKD/93motsO9ftIadx261e7kNMivGz4JoHeOh1m5TRM7Kk6m2sJE4pXZaOgkXsJik6Et7Mvqd
 AZKA7lclS4PrvpzTrvDVPcEIv9Y7vgKxlnvLV1oQp2SCplhK0dn0PIbS760UMl5gYv/TvNCKJUe
 O6qbI6MF9qwoz46qgn47zFpPPV/muo0s8I1qB4IBENZLcRF390zBtn6WjoyRSrMJp7h/DT3aM5y
 0hbqZCCtooU5IUPtLkRMPdSmgVhGTXzKfOoczB8oLsz7yrXW9ULE4e7rIr/PwCBsSG6WjQ7kgjV
 /V969nWY2hikvDHOv0hLD2RikD/HJU2umVC7z33f/SDy5XlgmnnrsXEscpSFzCo5LYFf8Qe1job
 v+RVCRExOdKbzAXiTNSHV/MZvKXoU24q3WxKT48raQlIvAaOX17J9u1dhptMjPeLlOuFqeb9hbd
 aGSg1+pkfVLP2d10TNhfFQFJ45KPV2DO4xj6ZXtRU7w9urnXFEcjWSgI64Tq94KhDdbqI2lEOTL
 /8+sMrdz6drAVAqYe/kIrh1LL51aZFtnYzU+qlgC0Z6/mlfncaBfiu+wgVnob4ae59v98IPm9xa
 fvoHAh6/EfiZ2cfLC1dhp7BKY9HzIse8L7Ia4UmDQz301tRpQbTAOmGvLcGTquOqoO4WrDHcfJw
 Qx63gwZEjZZsuwg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Make code a bit smaller/simpler, with less of_node_put() thanks to
cleanup.h.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      regulator: bd718x7: Use scoped device node handling to simplify error paths
      regulator: bd96801: Use scoped device node handling to simplify error paths
      regulator: max8997: Use scoped device node handling to simplify error paths
      regulator: s5m8767: Use scoped device node handling to simplify error paths
      regulator: qcom-rpmh: Simplify with scoped for each OF child loop
      regulator: qcom-smd: Simplify with scoped for each OF child loop
      regulator: scmi: Simplify with scoped for each OF child loop

 drivers/regulator/bd718x7-regulator.c   | 19 ++++++-------------
 drivers/regulator/bd96801-regulator.c   | 17 ++++++-----------
 drivers/regulator/max8997-regulator.c   | 11 +++++------
 drivers/regulator/qcom-rpmh-regulator.c | 11 +++--------
 drivers/regulator/qcom_smd-regulator.c  | 11 +++--------
 drivers/regulator/s5m8767.c             | 17 ++++++-----------
 drivers/regulator/scmi-regulator.c      |  8 +++-----
 7 files changed, 32 insertions(+), 62 deletions(-)
---
base-commit: 7b3754ef5d53bb1431e25f65126280993c2e640b
change-id: 20240814-cleanup-h-of-node-put-regulator-80df40883f35

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


