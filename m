Return-Path: <linux-arm-msm+bounces-40046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9AF9E1715
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 10:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24584161C42
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 09:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95BB31DEFE8;
	Tue,  3 Dec 2024 09:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cy4f+sUj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21E81DE4CB
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 09:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733217592; cv=none; b=O1ShY1dac1/wr80YWosqMiIu2YwJkEva+9FhOjl4DapGYRGdu5T8nnmiu2k97Ji4gOMnJ2pRo93pT6NRxuCL2JakLWncIjltKu9qieiot3U+sxFaIrRtEZBF/Q8ExhSXlOaqvYi8UM6PlEzhaBbkKAwvYmZCji3o599f7T5Uy1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733217592; c=relaxed/simple;
	bh=+RUkhSp74pt31GI7QEfwoh1/meW8bvxnwhCmfShcZDc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e0KkS+swm0Hr7y4n9tX9U13ZxxXnKwdH82myTDk8OHtahOtkD4DYwlvPUDZUr1plEwbUdy3fIXwsosZbSx7P5mDYK4DozIKxxflDTat8QN+kOxjYF79l3Yuy/34vR9+Du1QANneAIekXRQT/AMXUfU8XOtWmhD8nVVwtrnUyhx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cy4f+sUj; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso66467641fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 01:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733217588; x=1733822388; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CC9LNLFc1Hh67gjWV5vx9a18ct4bVImqOXc1JIJKqZg=;
        b=cy4f+sUjSjWYmuhKK9+4rP/+hrxuWrb4EtDv+mvkimG1Ys83MTxbz/kukQQ1Liaefs
         vCBS2uxC9omhO6/FRUIt/B0o8yC+OwILZmhbpC5vcPlJWNhKuZQpjuYDwlORvvvYUGqg
         /BPXcNx02RYtSi3eBIBpHTn9t3dB7Fm1YxPwZpn7Hp1ap9gQOSchvzB83WK68reLpUuL
         dwpY2vcIZ6pYFWNH+yzpNwDyXAwPZBtOQ09yiuDqbRP0QEUZHXuUbwuiJp2o38Y8Gq8U
         O3QW+GhjkzCBBPOVST26Bxm/ZOlkZKX02yRydtShCQ0Xt+/5QnVqWK+4fwalSYQpIfEb
         oLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217588; x=1733822388;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CC9LNLFc1Hh67gjWV5vx9a18ct4bVImqOXc1JIJKqZg=;
        b=XUkMqmPEA+i004LHdgYsJyMmdNu1q2Mq5FRCzcC0K/4IKx680aJddz7QHmKVi35AsM
         TFAXor9zBUVDWGLUqqwfD5tXvf6A8pCNWjWihXi/S10GHG7xVP9VG+B8PCiOtLKMBklA
         1OPDmqVdwtxVdbvzzOD7xoSdtgSDopitvWvxQ8No0aMC6YswOVd4iVbwG4Kw7joFyxLg
         ItI+VgwEvFjkHQOYN28+y4Kdt7PWF3bQ+C8OhoQML/RFie0447bEhI+uixiTGH7Tev+r
         TV354UVAEn6usozoK/1FDOSJhm5xxLQMazCbpX6zrKDXR1XSmD4jEdo1RG1k7ovUwRf3
         ZjJA==
X-Forwarded-Encrypted: i=1; AJvYcCUfQVMrlVB8RqDzHtv6JCy50nhIOeu4LeBhp2P6FJTujdARbzoC7cXcMP86lR6ILG2RGxWbgK01oqA5BbF8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9VD0s1lq+vtJ3xVmYeRiJkczZJ4pJ0btf7gQYlMlDZAtJLL4g
	aDMcRxtvIAQTN9P3obYulW1JlROXbE2TL3LUHFfO+7SSKLFVStpKUNi5xitAlc6R4M5o2eGrE4s
	JY/A=
X-Gm-Gg: ASbGnct48hZlIm6qms3u+KYLaCz5F0Jh7gOmL5JWNGn0Duv5AAMKrccvDwaeuwT0/+4
	7JOoIlYr3OMytGXK9T49Varpe20I9KGb6EgfeumSlu+VdCQ5WIfm75XgjDGUvYyL4H5IyDCHg8Y
	CRHOhp96BsoUPCukvaRujdP/LYXyDMWcvCZTng5afdOyCRXxphcv4Y6tfMu3iOrGkyHo+IS/Lzq
	vozZ7zCWRnS/+ey352tZL5PXWpwGJ6oRLlmAxa3bZ8f/mdRHh0WKYNMlizpf0r+6isfQ1AmuFmL
	pw6go0U=
X-Google-Smtp-Source: AGHT+IF+pYErz1kpD3eIIL5x4sUIrRIiDsWqlvfMTbuZhhsoChxhFgBLXzN+QJSiFdHDv6SmgVXa1g==
X-Received: by 2002:a05:651c:2114:b0:2ff:a95c:df1 with SMTP id 38308e7fff4ca-30009c0d858mr12308381fa.6.1733217588457;
        Tue, 03 Dec 2024 01:19:48 -0800 (PST)
Received: from [127.0.1.1] (217.97.33.231.ipv4.supernova.orange.pl. [217.97.33.231])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbb915esm15591811fa.19.2024.12.03.01.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:19:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/9] crypto: qce - refactor the driver
Date: Tue, 03 Dec 2024 10:19:28 +0100
Message-Id: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACDNTmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyML3eSiyoKSfN3C5FTdotS0xOSS/CLdxCRTCwszy9TUZGMTJaDOAqB
 MZgXY1OjY2loAwmn4e2UAAAA=
To: Thara Gopinath <thara.gopinath@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+RUkhSp74pt31GI7QEfwoh1/meW8bvxnwhCmfShcZDc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnTs0vT2Q2VlnO/jIG3fZpQwI3Q0yjeNlv2gNCq
 xzoBdmSemeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ07NLwAKCRARpy6gFHHX
 cp/nD/0WCGIDjIpD1NFtXulwrj1wA0XucQewSAWAplsNUDPNn0CNPa4BkRzhxoiBFf5+tS15M2M
 lPGMGgrMhiZa0CLexY3xvIHNDPNRUr5Zb3JVDav1fCqxEubeNODjtiiKiw+piuNk2AF6djuc1Ln
 dZm6A4r15cbXRLqAB2cqYabA82OH0R53A7P79B339FNTkt1SfHJBNiZ+c5QG6EvIaZgwdrwHXwo
 AINH2F/QmfrE+lMi2qE1knd2sOIh9qicx8QlVzH6cvgmc8MzdcfJjKXMFno75Dg0BLdEjH2eTNU
 FcipUP5frmOFb26gJct8damAlS73BhIdBlQMq9JELarIWcNI+IvApci3kgwtkv52WEYAECwQ6ha
 RSktu8EjLazohZO7fnVffs8rs759oZCGpbCJoQ1PpARXWiNYXBgATwo9cS3XzxM9REIVZGWTt4T
 iyT6CVBY30k8pkMS+CI9zxs7Lxqh3br4ZiLPg1cgdDRoF0sivBkND82jMtn5vBk2hQpNWVG/KDH
 EkrgKGtAMHd/bfVQwREmjjqk49m8g/bPCkeC1w30XScsbOWH5AunokWLf0UvHgG31vGqpG/cn1e
 QlL2D2QSf02UCjKwfWIUAyTiluB8HVAs6LUHO/8E1Z7wvGgBmvCENq05he3EspxmQkRHE4aaX7p
 ARB1UL2sixR893w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

This driver will soon be getting more features so show it some 
refactoring love in the meantime. Switching to using a workqueue and 
sleeping locks improves cryptsetup benchmark results for AES encryption.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (9):
      crypto: qce - fix goto jump in error path
      crypto: qce - unregister previously registered algos in error path
      crypto: qce - remove unneeded call to icc_set_bw() in error path
      crypto: qce - shrink code with devres clk helpers
      crypto: qce - convert qce_dma_request() to use devres
      crypto: qce - make qce_register_algs() a managed interface
      crypto: qce - use __free() for a buffer that's always freed
      crypto: qce - convert tasklet to workqueue
      crypto: qce - switch to using a mutex

 drivers/crypto/qce/core.c | 131 ++++++++++++++++------------------------------
 drivers/crypto/qce/core.h |   9 ++--
 drivers/crypto/qce/dma.c  |  22 ++++----
 drivers/crypto/qce/dma.h  |   3 +-
 drivers/crypto/qce/sha.c  |   6 +--
 5 files changed, 68 insertions(+), 103 deletions(-)
---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20241128-crypto-qce-refactor-ab58869eec34

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


