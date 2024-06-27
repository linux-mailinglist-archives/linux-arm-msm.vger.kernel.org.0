Return-Path: <linux-arm-msm+bounces-24433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5478191A570
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7CB71F24614
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 11:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B823B14A095;
	Thu, 27 Jun 2024 11:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Thtjle8C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284F7148833
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 11:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719488399; cv=none; b=jQpyjeJZXLce2LE1gYmsEy0PdVdQN9LV5qdjmBKPfG4nMZyU5nzz0MFhyfokjHqGFgNix91P74MSIUFzS0pp7sf75I9cc+alTcl7W4fAVtf8EESU9Orjlx82WPgpiULOzKAiFOQb/7Xfj6pkbQMFD4nwo9TBua7zaipwfXAxRlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719488399; c=relaxed/simple;
	bh=H2oINYv1RisztMZ/1SAqTZYHs/1i3Urmq4+NkMvMiMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UUFbP94Ys8PqlAvzc69M3aRxX4vCnrVLtqXip7TsB3pTGkm2xSnlVNOBJAs9ueGFTYT82okL6doCc8M9PqwNwVGzHo6k3SujzqA9IiiRGkXVL9UIeIIFTbcf4+FLtp8veMlvZuzxoSq8IWM7DLjs90RET25HSpKy1gO4W03Nw/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Thtjle8C; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebe0a81dc8so104379321fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 04:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719488396; x=1720093196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbI7/sd74idfi/XMipln9/gNNA6hsJvdqtzVYepkGFg=;
        b=Thtjle8CV8sAZ48bIIqpc7edKv32ptt4YMAdb8nLauRmRbVzyrF4rAd0bP9wXsv3QP
         r0l9sY6A4LmbmYizqFVH3nvsSW8Q+K1GRV4RUhpwqP0WtaS1o15S3TfAceDGKJtFaKVR
         i8vz41XhVaP+YR/484dkjsjVkHTg3jFijCNol1rQ8pRRLYquDEdYaiKPQyeOrxvzWk3Z
         LX9G56MHG4E9AMq39rugx17tjoZsBurACY5DdWVSwvPO98apD72uvm+05eFk2wrSaJfn
         SKn4LM/bm7P3alUpJF42+JTs3nEh++eX4yDgZna4IrdL4BN+6RsN+QA+Jjb3STxxoB74
         lNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719488396; x=1720093196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbI7/sd74idfi/XMipln9/gNNA6hsJvdqtzVYepkGFg=;
        b=QQnMMDRDJJG3AWVLpuhPeABsqGxogXWsA8nP5gA6P5zdm+qgai6HPJK7c8Mw/dT+mX
         V7vmdIyVWA5+RRE2ce9dtjxKhsrzCI4EKlMgIXWg2eAxOZgmjzhiPtvQ/h4EX/F/fQum
         kaeu1nBwKEZlLrgrOdt7zMOhw9BCXYTo9XahzCmjKYLbE3bIzH2NKRsIciMmESQhDEWQ
         sPtIPFD1IEjHzUZvfU7rLRlaFGA6X+R5yLhPWQ7dx5vrgkK0yFW2FvbQjK2z+5dSGKFw
         FVW1Om4qmMttiPk6o8cB/pkQSBTAEDDxAfmtlTJIFiCpIrvRTSdUhgTPgHsuSHyXHFef
         HBDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwK8TSznySsBZLYgiN79EWnLCYXLjo3WBEVw/3VEFL7Jgd8uVq/bLUxk5lrZWjifqIWXjMlXI7N0EQGwKHTKZjwaEQ13YfvJw6fOeZig==
X-Gm-Message-State: AOJu0Yw8F/9L9B5m+x8z5EFAHxklc1Ms/uqeyOwYZeWmF/waFVv0H4OY
	Kl/BpTVnejxinddbIVAeiqh34H/ei2MrYrfjwxdM1YicQRRE637P61VZSsyLQG0=
X-Google-Smtp-Source: AGHT+IHFDzARAto2HLAI3TxjHyub50L0O0Jnjrz9yXwhDePCwserMcflGKVLOY5zTOX5jsXXhqzpcQ==
X-Received: by 2002:a2e:a442:0:b0:2ec:5019:8fa4 with SMTP id 38308e7fff4ca-2ec7278a341mr44969421fa.49.1719488396147;
        Thu, 27 Jun 2024 04:39:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7fe5:47e9:28c5:7f25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8468613sm62081815e9.39.2024.06.27.04.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:39:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 net-next 0/2] net: stmmac: qcom-ethqos: enable 2.5G ethernet on sa8775p-ride
Date: Thu, 27 Jun 2024 13:39:45 +0200
Message-ID: <20240627113948.25358-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Here are the changes required to enable 2.5G ethernet on sa8775p-ride.
As advised by Andrew Lunn and Russell King, I am reusing the existing
stmmac infrastructure to enable the SGMII loopback and so I dropped the
patches adding new callbacks to the driver core. This no longer has any
build-time dependencies on the PHY changes so sending it out separately.

Changes since v1:
- split out the stmmac patches into their own series
- don't add new callbacks to the stmmac core, reuse existing
  infrastructure instead
- don't try to add a new PHY mode (OCSGMII) but reuse 2500BASEX instead
Link to v1: https://lore.kernel.org/linux-arm-kernel/20240619184550.34524-1-brgl@bgdev.pl/T/

Bartosz Golaszewski (2):
  net: stmmac: qcom-ethqos: add support for 2.5G BASEX mode
  net: stmmac: qcom-ethqos: add a DMA-reset quirk for sa8775p-ride

 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

-- 
2.43.0


