Return-Path: <linux-arm-msm+bounces-53819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED58A840DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 12:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0838D1B85881
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 10:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9DDE281516;
	Thu, 10 Apr 2025 10:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FNs/SU7b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C14281364
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 10:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744281448; cv=none; b=OepNctH0Z7RF+ig58MD9XKzWF8JxoRwPt6u/bZKcpGrp8c9pq2M+Uwiooz2YhrAL98NFKQNGD60LVtaCzwaB+lKUiId/dd4N1yBn6d7kC8LtnnV3dp0KhVvBL80KIG5oquUN9Fxd8iT3HhW3lTWpUAKWrDMhdLIoYrZdcX0UfOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744281448; c=relaxed/simple;
	bh=L1x+MEpRCSfrf2Z5t+ZWnBQnsCOKl8zGDEi/DBrESfI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=moxVf3GCPAxAnqQnebQPvTaYoXmj5XLL4YLXZin04M7IfnrKxklygI7CM6+k0ado0xe2FSRjZiOKHMRa+BLUwPzFBSp2+RhnC3oxJThIb1IEOM72yLR4xv5xemIaoh4dunA5EF5/6hvXV8t/M5XwY/2LwdBTRuJyDr11PQ67afg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FNs/SU7b; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so478746f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 03:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744281445; x=1744886245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aYtjGBXatHaseT3Phi2jIW+StTZyswtuqFhYnfH/gE=;
        b=FNs/SU7b9esSeNgXWoWBwd5rCQX3MZWOFhAf4z6GcdGulWqyVSGQakO48T6QYaJQ0D
         bZ6t4M7kUnapr8RB27eOQ7r6TP/38pVZoweJ4rqr9SyOUUWN03epYBQSOV2Hy8ZrL57c
         4Icb1CPI4fST7TAekEoL8camthBXymMTG7zoidS2PxQ2YdKKNNiMamc+j41Zc8hhDYlq
         1jG4S/A/sXakbKTgM5nmlqpdC0t0zcU4sbhi6T79t4oYEjTgo7/ZtRgxu2C48MzVWkeB
         jjzTBEAbgTcfVIaBsX8K82GRSXEqQr+/f5b6L4axWHsZvJLYbycrOzvqZZab19NVhgR+
         dJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744281445; x=1744886245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aYtjGBXatHaseT3Phi2jIW+StTZyswtuqFhYnfH/gE=;
        b=iBH15wWDl2vurfU5pDxavkX9tQYrMuv+FdCDP8Rxu0qUv5RXvplpUoYA0gykzU+4Tu
         QVVkAZOrt0bSjfHbMfq5G9Y1/gbF2o/7q79B3TWLn7YRDKbr/ogf0jtckKngJpJbwDLy
         GDIktJiEPtFgw3ZyEzrlX7wNiyiZkr7Bs7Skc79SN7wTzTAS10dV/CrvXmpaFeSg58EV
         8i7Egi37I/7/K6AIhnwDqIsQcpVIoPjNb3RHL8AwkDRU4LdKGhyhwxefIXNdEjEMv2DQ
         6OVIFyylrHP31Xd7Y6RBsR1QNJTp3bPAfOeMVqkT7bEFMoJ3krkzRCx/135ydrwQRwc+
         IbEA==
X-Gm-Message-State: AOJu0YzALJZycDYuMKMylvuNiwGt0HXuUnToYHzqNhlTi/aXDcBpA4zK
	GJpgmBtZv9hZkI9+0oFWeXkUOIGKrqfJjEu2npR5HwmkNyNcpn2TPv2l6TEsc0s=
X-Gm-Gg: ASbGncvyDznUEQwslujjxU+gEcKXYESMHBi48lRt4ormLJRNmoh5UepAaJXx7MRgRTh
	YlNUwDDkMyG50+jGmbvBjoHHGkK5SnBmfRb+N3kses69TPAzUnAki1kbZ12jzDIe6DQZ6XlksUT
	kd84wSttTo4qHgr8qwDcuJ5+4psro0iUJV70pXWuEWpsiLspIev2phDjQzNKjldjYfCB3SKh6XH
	Z/Fq95V2D0y+aOnYXS/1OZfKwUwfLoXJkd2UfrqWaETom5lyZ6+Fmtc3ty1EaIMrSHg38YwvMyp
	pq10c4kHnGfvdnBmWiN9ByzKDQFBwN2J4xKrt4+8dpG799jj9LF0nXpmjDuziPzLMw==
X-Google-Smtp-Source: AGHT+IGGCF1uYN0vSOy+9N6MTk1Sll7akKwdvJm3f6V81SnCFhS1Hq04fztkt0wX1t2RP9Kn4lRv9Q==
X-Received: by 2002:a05:6000:2210:b0:38f:2413:2622 with SMTP id ffacd0b85a97d-39d8fddf94emr1702026f8f.47.1744281445152;
        Thu, 10 Apr 2025 03:37:25 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893612dbsm4309388f8f.1.2025.04.10.03.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:37:24 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	srini@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] mailmap: Add entry for Srinivas Kandagatla
Date: Thu, 10 Apr 2025 11:37:13 +0100
Message-Id: <20250410103713.24875-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410103713.24875-1-srinivas.kandagatla@linaro.org>
References: <20250410103713.24875-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=ZhYHEoqrUkGkRgz46TiGnWcPMiKR/N1g2slVddB+DV0=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn959Zm3y7kLG6HvBFTp7/7z9RyQCDI8Z0cZJte YmqqO7XWtWJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ/efWQAKCRB6of1ZxzRV N8i4CAC1e4sdQHEe9sOx1teSQqtqYSkc9V8pStNn0lGq2HBACEukAa59Qb7+IxwFcdI/fvNVwoj IZ8PFTqOl2N+eMpABQqYZn11RiZECUCl+LNEF70jhrN8ZolLoeYLYuC+sp7lrPdRRvjTzXlu+Bk QAOcD5+btV+okFLbjsM3CVCFyxYGCSQVlI+hGTDY8A1+VxsUZABV13u8JuXFsPsmCSqTwHeFMCC 9/XJQjg6/D67SzfntnoC/FCsVMA/Z3HQbQJUsVLaVN2RVmdwcLCxDzEnNU5R7QD8dp+7NCAT2fa bG5/S05epDUFKboyGZpLCzqbQLUUVBJNFKO4xdKxG+KlGqpB
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Add entries for the various addresses that I have been using over
the years and remap all of them to kernel.org alias.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index 4f7cd8e23177..0326d5e75012 100644
--- a/.mailmap
+++ b/.mailmap
@@ -685,6 +685,8 @@ Simon Wunderlich <sw@simonwunderlich.de> <simon.wunderlich@saxnet.de>
 Simon Wunderlich <sw@simonwunderlich.de> <simon@open-mesh.com>
 Simon Wunderlich <sw@simonwunderlich.de> <siwu@hrz.tu-chemnitz.de>
 Sricharan Ramabadhran <quic_srichara@quicinc.com> <sricharan@codeaurora.org>
+Srinivas Kandagatla <srini@kernel.org> <srinivas.kandagatla@st.com>
+Srinivas Kandagatla <srini@kernel.org> <srinivas.kandagatla@linaro.org>
 Srinivas Ramana <quic_sramana@quicinc.com> <sramana@codeaurora.org>
 Sriram R <quic_srirrama@quicinc.com> <srirrama@codeaurora.org>
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com> <sriram.yagnaraman@est.tech>
-- 
2.25.1


