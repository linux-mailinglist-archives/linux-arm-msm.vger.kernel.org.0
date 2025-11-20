Return-Path: <linux-arm-msm+bounces-82600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 33976C71973
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 01:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 109454E29E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 00:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C74204F93;
	Thu, 20 Nov 2025 00:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gXxg7J3i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5061F03C5
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 00:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763599577; cv=none; b=dH6Mldh1adTr/2Yj4yLgDcFqOQ8GrK27tINwNFTcIMPX0v8us/SPMi+3AGSwHR1dJlFmlOwf3Rlb3r3hY8134E9LWN8F5b0MG47vbnB5K6TI/PApkuyMyYuHfyoKt7AMo+6PhxJ9/c7rD5CaiWfl3HO3nEu2efrASXjwpMp/h3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763599577; c=relaxed/simple;
	bh=cfRYehKmIYEVCp2eb7c/iu9LL0ZbAiyq0M8tgp2yQLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aZf1I9K7z6UXwuF2P6YiDw18RpWXmp2GnlfOuuGrzq3yI6jKl32lLml0mDer01C1XTpU0qcVFFXNbb9aZchE26U4t7t3g/r5tetug9IrDq3U84Hk5ettiamaD9w+3g7ifigN+Kbu6wbwcmoYFcO4b6VlVWqAql/OUValiqOjti4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gXxg7J3i; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59424b0fabcso33669e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 16:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763599574; x=1764204374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j5e5nQefCPDRN0dJhI8HXjijaK923N3wC5GLZmrz9s8=;
        b=gXxg7J3irP45HSPNTEPqhWZjYAtD3Sy2g0T8Mq+RMGm6+QG3d4FvB492m+zcTxuZZr
         JxTnOfu06aVu7MCUbcZTqLUd5b9BggK3tGXnq0T3OZg2mcv6MqHf89wYj+iKnioVM3Li
         EvZFK+hFNNlMWSPtq7NMYxHy6EL+kQr+uGQ15g2Ff0dOwkOOkKDnRpsG0S0Ok3aILFSf
         3BREvxGttXgWsX/4G/6u2s+MDDXAJLgGmvo/JPQVBAsHokjLRNrE0nK6vTZheJOWuql1
         o49tCRn3x0jK/OutYYu3YWXc/UJlO/RnSxbokgldd0VTpaBARqJppWjJ25zXqQ2TmMZI
         KFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763599574; x=1764204374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5e5nQefCPDRN0dJhI8HXjijaK923N3wC5GLZmrz9s8=;
        b=XVT7B2X8LKn/smDfxX52MZtP5uTpM5S76YFtNG71rOWfJj4JNjVmNafkfi9vOtUJ2G
         /X5t+d1OS/aezaYuZvX1yt0iUENboo/xMVJ8AmxdP6PXejT78/GGMARcGdw4uQ92K573
         FZGNakhdPdwSTciwPV1mQ0BVzqwBNF4bEZwhK9PeKQ5LsooH0cswgwVODPv8Z5akEg42
         YYY28Ebgi5Elej/ZEG2JGu41dmFQADppGGIpvwe+a6e4+GIdhPtqrnT14yNx+33Q3Zi5
         Ujnp+btk7qYhyg+EjOc8jZmm9xvtItOHFE47hqtOLzHxCQz+jWcj1fH/YsKUy2XYUoXf
         71gA==
X-Forwarded-Encrypted: i=1; AJvYcCUFKDEz1m6DwKevIQWk9Y60KXZ/vd8DNyDguVoXVB2myhiAZGgbRnkN6qYuhEKbFvi7/N+o4gFqlhVgZWAB@vger.kernel.org
X-Gm-Message-State: AOJu0YxSmAssXrchLR9tN436narm9CbkeXhaWQqUJVwBagBGYyAxJBSg
	jFPRw6kO5zzOJI5PgRfOh5FMwvefsW5YCmTSLDbSiBLzTdXspzW0jsGesGVjpIdd+TGOTFfLo22
	WzNIm
X-Gm-Gg: ASbGncub5sP8hcDkJNceOYlJc2uOPvRAN7GOV6Y3wHi5eNco+5imPgYyXsgktLoPqIL
	JmRvQL6cSaUIfMjAX5xQW+OYqGjXqpLaeNpbcHa+90BYFgpgKOJjoXDNO8kdPjAmD/eALNJaEDE
	LkZC/pIPRFB470saKItYCPGrzsgBk29VYBJ5TXEIugGmeP7z0pxfjxc2N39Qjefy0xiPBoAVoTa
	1CgVhR7v6UevoeOyDveUJ0uUJdA6ryexkNwiVfvWABrjIymzVEpE7GwaOc+1UP6kPasaWwYYvRE
	Bm7v5Hsx/EmaWa4I65eghv0bwmc2OreZ67HVcmkO/q/UP51rJNEcNZqDFZM4iZK/Qc5/EEJ9RrS
	baRG/sr/mD4GK+Cs66NBH4boBBMYwq/BfVfKzgSMiZHjH56AmVBAFg8U0aGOMhgnQMcCxY3nsLo
	85Dbgu9qkjjHvdJQbDjzgno/hFFK7bMSyRZxuoAOlWOPkxIPHMTzGRGQ==
X-Google-Smtp-Source: AGHT+IF0tBnQr3LZJWz9Y765jwY1r6Y8p+uKy+rRNcAVxWJTHaRd7ZfpFTD0aQ0FWs/nGcZqBFo4Jw==
X-Received: by 2002:a05:6512:3b99:b0:594:5582:f77e with SMTP id 2adb3069b0e04-5969f4901c4mr12357e87.4.1763599574149;
        Wed, 19 Nov 2025 16:46:14 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc59a9sm229479e87.71.2025.11.19.16.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 16:46:12 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Rui Miguel Silva <rui.silva@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/2] media: qcom: camss: simplify registration of sensors
Date: Thu, 20 Nov 2025 02:46:02 +0200
Message-ID: <20251120004604.2573803-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset simplifies asynchronous registration of sensors connected to
CAMSS CSIPHY IPs as linked media entities.

There is no difference between these patches and the unapplied patches
from v2, where the patch review discussion didn't progress further.

Link to v2:
- https://lore.kernel.org/all/20250903002255.346026-1-vladimir.zapolskiy@linaro.org/

Changes from v2 to v3:
* rebased on top of next-20251117, intended for v6.20 inclusion,
* added gained Tested-by tags by Loic,
* removed already applied patches from the series.

Link to v1:
- https://lore.kernel.org/all/20250513142353.2572563-1-vladimir.zapolskiy@linaro.org/

Changes from v1 to v2:
* added a gained Reviewed-by tag to patch 1/4 (Bryan),
* reworded commit message of patch 2/4 (Bryan),
* explained better a removal of port node availability check (Bryan, Neil),
* cosmetic and non-function clean-ups of lesser significance,
* removed already applied changes and rebased the rest on top of v6.17-rc2.

There is no any functional changes between v1 and v2 of the series.

Vladimir Zapolskiy (2):
  media: qcom: camss: change internals of endpoint parsing to fwnode handling
  media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() function

 drivers/media/platform/qcom/camss/camss.c | 54 +++++++++--------------
 1 file changed, 21 insertions(+), 33 deletions(-)

-- 
2.49.0


