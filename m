Return-Path: <linux-arm-msm+bounces-28395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 546E395060C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 15:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2A101F265BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 13:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3ECE19B3DD;
	Tue, 13 Aug 2024 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UwIdipH4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED26519B3D8
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 13:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723554604; cv=none; b=fKBQVqnpVy+2KRQVuhNDgvF9ndRXCEACc5rGS3+0/xSjepRdY9k0gyRVgxwwesZxqbHGvM1fRmw5FVO/oERoKP96HOjuMePjzQ+liCvn6lYYIdqu+v8eClCRoAHwaj5vHtw/Ns/MsQuIqPTvufYOy1e8tc2zmfvquoJFbs3JVQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723554604; c=relaxed/simple;
	bh=5E+ChMVkUDEea0MRqunugi3O9LwTWIxDP7/k4dm6sTk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C+y3sMlSMOfHTyjQDGaWdM1SZocGbrZC0YPGozWViBFCzQ2QojSEiBLOqHOUEj+VgJ97lyrPg5up8uMcIKt7o7GKkgDvYl/UwWqMpflYtq1gPDRlDnRy1WQuWIxX3vZzArojHMtP/aa+lOV5VqpkFzbEjbiY5W0yYis4og9QGy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UwIdipH4; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5320d8155b4so2665400e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 06:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723554601; x=1724159401; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bfrR+V00LqrdU8oaNQWDLY7j0SlE+UnhvDANccxHlMY=;
        b=UwIdipH4jITpPhSswoRfiG+KqoFqJM19XKS+7QfpcKDiJQctNecILYNSOD383VBEHH
         9iITVkSWWH62CKmKcmwxGCqyoaMlvxSUIIr4WGwOQq3M4KnlHu1kda9dHgbeSChmppgY
         +RjQx3Kt5wFqZkCb4HYcmkQZez85V5mJ6zcxCPRID48H0d8ofgek17FEpW0wE1j27CCx
         I3/bePpvnRo4DWR6RvWj9CCFxV8wnTcedqSSsgdmdadUhA+muhmsoEcbgeVE8efBenQ7
         XwrvdffgWTvg4f2QMatDTeGrCgioWAyP9uVDIn/mjRZGKy3I6qU/Y6VgXddTvGhvq2Wn
         UnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554601; x=1724159401;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfrR+V00LqrdU8oaNQWDLY7j0SlE+UnhvDANccxHlMY=;
        b=IBGbxPX/p/LBzZJzvirr/fjSm5KSKPIY1jwiv8JqqfADrll6OQ6p7552TIvoPeGDAc
         tFk6ua0JxS5tv/g46MFUKY5zZnVBtrnZYEVk1hjeMQT3kUr85DrWs3qHF4DY0DYCi3QT
         QBBEurCGK7FR2UT5aA54QdTZEfPX4Jbf8NQL1hxxAcT5PRhAC+ayGz4UsGCJjGG/3jqJ
         Pum6bcxjYbIBzx6tS1HIkgFdl+4aDXSx1jvuSpiRaO/A6/x8UnVqATLUaeG139QHjtHv
         +m0X4hv/jKmlGp9w08GnB5gd69/WGV6vTEZMBuIugTzMDuTtJm0aYJaVw0GO8oXJDtCP
         UE+A==
X-Forwarded-Encrypted: i=1; AJvYcCWsTJ9NvY5xUaI6Daf76uxxNqhQEsWYCvBQlbCoMolkr46HHWuCq18W93OUU8eUUtXImIvHIaS7Bn41YBB2+AIcReAx42e2rO2wVYjJPw==
X-Gm-Message-State: AOJu0YyerR85y2bLtaaXBeeJWYg+4p39Fkd51Or4B0O1ED//Zwc7GdDY
	7HjNi4YH650fZyp2M777OfHm1u4aAaOAiX78dbeMy/z/Y7WKOaimhliQsATJm+A=
X-Google-Smtp-Source: AGHT+IE1crAZw0sd1g0PC/pporzYqVsn81Ipa640yGOTgge9CJpWJLRF2nhKkj54tIp4lvsEO3ucIQ==
X-Received: by 2002:a05:6512:2825:b0:52e:a63d:e5c1 with SMTP id 2adb3069b0e04-5321365f4f7mr2561512e87.30.1723554600857;
        Tue, 13 Aug 2024 06:10:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c938280sm10305003f8f.36.2024.08.13.06.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:09:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/6] soc: qcom: use scoped device node handling to simplify
 error paths
Date: Tue, 13 Aug 2024 15:09:46 +0200
Message-Id: <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABpbu2YC/x3NQQqDMBBG4avIrB0wMaD1KuIixt9moCQh0VIQ7
 27o8tu8d1FBFhSamosyvlIkhgrVNuS8DW+wbNWkO226UfW8GnYf2HAm9hx3DnEDp/PgeHhkHvB
 yg9KjXWGoRlLGLr//YF7u+wH1Vj6vcAAAAA==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5E+ChMVkUDEea0MRqunugi3O9LwTWIxDP7/k4dm6sTk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmu1sclGeL25uWmbIh61eQ4X3RnuxqcZGjDLXB3
 LqJ5mrZvfyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrtbHAAKCRDBN2bmhouD
 16+pD/47fOi4Su7/0hW8+e1B/SXwxMEUHtmgv+GLUzN1CmnNS/QcrC8KrYp+G96ySZPNuNk/kIa
 +2eA5mzV/VxnutkLZoCwWNeGQra2URSxXhEwyLk8ryozp8ZImTYUcMq1CYiHdTquTZM7P+VNsMh
 VxbklyPFpKhnKrRmWBvxjK6nrbebFi3FDsfPnLhG4lbmH2/lvWA12FjW5Q31NPTZs9+OqIQ5NR6
 w8SCQkIQ57yWzgsbV9xd3C7d9yCH8swDvfgwWT/cU5d3/1INR2JRkW6jRrtJFA/uI4SFAg2Cyaz
 BO2dG0swKABdmZWgGyp5esvG+pRMQ/rjWbeo91olCr0YjF9APSq7SJ9KqyWCPNJRsUtHYcf3S6s
 LC4kY9rJ4BQDsCC5VvF/nhT4LZ8zx/Yor67F+IgYrHNDP5wIoa3rG0eigEFNb7yHBXp7vm45Jnd
 ukpi7bP1oRejD7JGjcarcKbVrxsOSLrp9EhZutKl78GcHejuAHMDMShrjpdF7iJhdXvHo7m4Ic4
 FUhvuyDuzzgIu3ZCi0pklU/CsMg1e1aYib0cXn3giwQXo2nXtYw3jpk4SqKJ75HslFQRzqXWiig
 TZO9e8C1znDhMqac5yfBTh5XuS1WCtroC63NpYPaVOQk30DCG9WMKJ4ZOs333aGExyXs1akhGUn
 17wWXkpVs9CSxUg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use cleanup.h/scope on device nodes to get rid of of_node_put(). Code is
a bit simpler.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      soc: qcom: apr: simplify with scoped for each OF child loop
      soc: qcom: aoss: simplify with scoped for each OF child loop
      soc: qcom: ice: use scoped device node handling to simplify error paths
      soc: qcom: ocmem: use scoped device node handling to simplify error paths
      soc: qcom: pbs: use scoped device node handling to simplify error paths
      soc: qcom: smp2p: use scoped device node handling to simplify error paths

 drivers/soc/qcom/apr.c       |  5 +----
 drivers/soc/qcom/ice.c       | 14 +++++---------
 drivers/soc/qcom/ocmem.c     |  7 ++-----
 drivers/soc/qcom/qcom-pbs.c  | 16 ++++++----------
 drivers/soc/qcom/qcom_aoss.c |  8 +++-----
 drivers/soc/qcom/smp2p.c     | 16 ++++------------
 6 files changed, 21 insertions(+), 45 deletions(-)
---
base-commit: d54f33dafd9e93367ffaf95318ed371138a6c8c0
change-id: 20240813-b4-cleanup-h-of-node-put-other-7e9c7128abe4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


