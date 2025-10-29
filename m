Return-Path: <linux-arm-msm+bounces-79452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A3903C1A6F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 13:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EE93B3595A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC66F34028B;
	Wed, 29 Oct 2025 12:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlTsM2Mb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8076D339B51
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761741282; cv=none; b=qgeN4pFoK0GXjXQKcyY+IJSsOcSJtuZyLAJJHPai7UDXubkjJQwAed4mLjb3hoXFIxglNOTeLODUoX8TQeE34Z2c/zVXZkE+THQ7+0hjD9t1PiwXNfWCQfvpZ3efMkgVgcp2mFXGowdNSbbc8K0xn3dqvPZXiArG+eSUyPrstM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761741282; c=relaxed/simple;
	bh=MXV1J4/+oon+M/oX4IvFjQMNXVSF1SduLg0p6csa7Sk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NNIZHkwT4GWhlt6x8nlh7et2hjNyWAL5dlc3tOLtk3FHniCr3K9ZR6wboEy7LzQiiMSmraD8Fm3kx+PPcY/XupMP6rmGvMMwbDgfdmzYthNNR9StaQTYogTbKIA1bIHMRMhSqkEmaEG9APmkWmr3ioqs2x3oCTyPjkCnM0QqEvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlTsM2Mb; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-781997d195aso5170576b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761741280; x=1762346080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mLbzXZCnL4JaNq6mgAHYUsHmpe2Hmi5djVf9Q/V9xNE=;
        b=YlTsM2MbR9EeECgQHr8kew7suP6O6K5qbkyH953T16wNEaAsdkyw1xC3Qah/vaKFRS
         uyPRip5w2rqcd2yRBia98hutLBpQ0PoSOSbX2UQlPjIxdVqEmmiTypqaHR3QZfZcVuwe
         vAuJXF2j2MdlZBTDnjwpkdSO1u8/bGYFnd6r33yMgFJ+IOAtSkQ0W9NwmMMb5bPwKUBq
         Ap1FFQc7VYsoTNNoajcmeNrfIMhaCeJTUUD/C471jonCD8/nFIunNDJDGKS78SBH409u
         FhD/HFFeo6UV4Mn5UUGVXE2OBYn4VhrcDp68yTn4zObfEj7XVy9V4FB3P5eS+Yi6rE9a
         g9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761741280; x=1762346080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLbzXZCnL4JaNq6mgAHYUsHmpe2Hmi5djVf9Q/V9xNE=;
        b=pjZoOoKKu+M92R6UDZ5oTb66Xu5xLfqo2fYe0mDmlxDoDyG9GvM227RbqfXLsUjYi6
         tqpPBwaiifWvo4RN+H5la9hboMRNMan7XfSm58dADEY1cLdvA9ckeNRXqFiWEZbIZyR+
         eSRBeZMC0sBzbJ1Vaif3AJaAsjfZQ7UP/AImh9UEOnPxSMSz7CoJ1WHN+2g8qVmHvPmJ
         y9xN/plArJAnEyxlSZchUR7st9APY8IRoidJsNSHlfdD1bJgdAmUoFiuQrbsBrZrHP+a
         pkDv3T2s28DF12lTEJxFt8l3GHwVTRu4TV+v5u/Q8uHwYFMUBqQONXFhX2/T7+Vxa1Yp
         AjoA==
X-Forwarded-Encrypted: i=1; AJvYcCUU7AymnesxInX2yXyCnWMbAX+FYzOe7SYDwsk9kIW7DIC2ExQAAc3VaOAYkeIMf1hFw6oHBeB8vdtFHiaW@vger.kernel.org
X-Gm-Message-State: AOJu0YxzuWVoX45bHaRvTHHqCCUkPp3mhzHGVp6Z4KG0zFdaReP+fdor
	BL7/cS1U0AwaTQmfAZjYTYPh/r7tQ64IklNLvSP5WaU0uNCKrb4LqHxk
X-Gm-Gg: ASbGncuHgIL4rTMNAAUIsvgFdq+K7QwwIOj82FoC3b0CtTM+WDFDrSXpTYoOJdZmjhA
	REcceEgPzOZFUug2dNl+NSg6STSjRdLio6SC1TL8aAUGYkwDcenCHe5E5OJwpB+NqsJ1v546Gdu
	QI/XW7D3p9lrw1G3028ZIeCCKDipRl/OEv5AOGqN47o+3z2ZhPhbVjzgpzDG7USBTu+ChxgHE6r
	V9TckTCFxigqujXKX8rlo7Hnxo3o6frIbrm435Y6pvlwV0KHCwlj9tn1yHas62djpqVsqQ3lEGq
	nwNaRGzJ/Bq7t+yhvVtwxkTFrxUqnHd+E9X5tOfGa0s2mv3fT49hajJNv8ddW/JFiTvLucp5sck
	sIJYko+u3v1Vz0U0jELrxSgH6bMeFUZE9VFnJZyJz+1XqyfmC9FUVh4ZrniPe3ozcqP3iuEZ1yK
	7HzO5nWMh90p4CS1VHBH5lcg==
X-Google-Smtp-Source: AGHT+IF5zDqYY2uyyaccHKjplnekkK2/6d+ShgjS5kIKOgPfbgi53OKTaTURa3EPvj0xY3duZVdWCQ==
X-Received: by 2002:a05:6a00:b51:b0:7a2:7458:7fc8 with SMTP id d2e1a72fcca58-7a4e2dfbfc0mr3441055b3a.13.1761741279605;
        Wed, 29 Oct 2025 05:34:39 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7a414087cdbsm15206397b3a.64.2025.10.29.05.34.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Oct 2025 05:34:39 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] dma: qcom: gpi: Fix memory leak in gpi_peripheral_config()
Date: Wed, 29 Oct 2025 20:34:19 +0800
Message-Id: <20251029123421.91973-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a memory leak in gpi_peripheral_config() where the original memory
pointed to by gchan->config could be lost if krealloc() fails.

The issue occurs when:
1. gchan->config points to previously allocated memory
2. krealloc() fails and returns NULL
3. The function directly assigns NULL to gchan->config, losing the
   reference to the original memory
4. The original memory becomes unreachable and cannot be freed

Fix this by using a temporary variable to hold the krealloc() result
and only updating gchan->config when the allocation succeeds.

Found via static analysis and code review.

Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/dma/qcom/gpi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 8e87738086b2..8908b7c71900 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1605,14 +1605,16 @@ static int
 gpi_peripheral_config(struct dma_chan *chan, struct dma_slave_config *config)
 {
 	struct gchan *gchan = to_gchan(chan);
+	void *new_config;
 
 	if (!config->peripheral_config)
 		return -EINVAL;
 
-	gchan->config = krealloc(gchan->config, config->peripheral_size, GFP_NOWAIT);
-	if (!gchan->config)
+	new_config = krealloc(gchan->config, config->peripheral_size, GFP_NOWAIT);
+	if (!new_config)
 		return -ENOMEM;
 
+	gchan->config = new_config;
 	memcpy(gchan->config, config->peripheral_config, config->peripheral_size);
 
 	return 0;
-- 
2.39.5 (Apple Git-154)


