Return-Path: <linux-arm-msm+bounces-54142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D81BA87406
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 23:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D50616C3E6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 21:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2EC1E5711;
	Sun, 13 Apr 2025 21:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7cFtO/G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CFC18A6AB;
	Sun, 13 Apr 2025 21:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744579523; cv=none; b=YOgGhpHe890z3+/wKPqD+N4cSMrzmtFp4tmifpyZiATtY9DDqD0h8Z75SnnxZ1HCVKhE+D+eOSBty2L/AwBjsLV4MHcsIn4hq3bkEyxE9O26U9FIXaqzFNx/DQ9m72WnmmJQckMaz2RSYRGPRofx62kNypoPhl2SkxG2fgtpvKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744579523; c=relaxed/simple;
	bh=5Gvjxuiz4tIpVCf8TMTiZhg89HT/QHXIx2h9bVWfC5c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VykBmeuVnjJ21UI/epmsRjmbafcZWZ/KZ/xJVLvekZni1MIvHMUz8LHSYFidVtMu5d/Clp/Wu7buNUH/ApiAzKXNTPS+ZVYBrFyrSoL2zskPr5YbG01yW9VgEQDZmqm/+GsQg/6tnzbmwG2DWiJq/NjN4tHQNKvH2ThoJQYU8Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7cFtO/G; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c55d853b54so67778085a.0;
        Sun, 13 Apr 2025 14:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744579521; x=1745184321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kXyN5mEROq0KuHSWhrvVBB3AlRAW0b2iMUNC6ySyoYU=;
        b=C7cFtO/Gesr2x41p2LylheU/ToCQxYtKvYei2pySdsfe/uuI9ndmyQ5lQ29hc5odet
         rZpTN583/Opu3gzto8nL0tUhDYl0BTe3PUjJ52KKbRO9DYB38xI1byQghH47qEG2iVEX
         Uz1oobliaVJo9/cqvbWbpO8CuJ7hXi5O+0a/m/HqE+cmMnD4KB9GCYXI1iKL4/UtY+vF
         TDiJDOlGYHghVayU4ReDKaGjgqxGgfkR8eXMSbGpMzzukElmkr84Z7myvt27PQT6Hnh2
         vGVzNEb1tye2WRvBtTJ4XMzU/NovfwK8AzrhG4Q8n3gFmY0r3lqxJQvVizD9hsHnqOaO
         ozvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744579521; x=1745184321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXyN5mEROq0KuHSWhrvVBB3AlRAW0b2iMUNC6ySyoYU=;
        b=lmacEnribLZ6kd5vQmUoo85mXvWkU7gqnzzcPLgjpyWrBu917lKOf+KN2flJc4yMQo
         YTSv1rcOgN3TAEIMzopXmTLj59Pmlizp3Na+FoZxfYrZzBqmc80YXUIf76c0MJhuGwkc
         hwnXQiQ8DZ1Qw9P0leRAxrNm934vwSATaczZdxbFgQY0ncIK3CUXku4fK1CdOx8gq0e2
         MgetJC2i4ZPqTyDfyhK0oLoFeA/nIEnNK5M+6ycSrqumennVL8ZP2LP0w1GRzaz/9Vn/
         NEN/tE66hGZjOSZAXzYaHb5XQ7yxPD8SeIhhxC61gFjZszVsErXOJoy0UGoMeNLWDbxa
         Z0zg==
X-Forwarded-Encrypted: i=1; AJvYcCW3VAREjzlQTaARDJWHPbKCcb1C6dycVP7VX8qgyhUueL14JGVwYYhdL8M/F5a5UqzS0GGNGiDu+bvz86Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye+7LD/W8R2Vf+nJdyC98b1O0ltA7fh9MPfI3CcQxCMGeb0wJr
	fjdKwjYdOyANgmS082BCXPgn9LEHzk6dyFjMRrpziS+Vhbk71p0=
X-Gm-Gg: ASbGncsL8D0RFUAIozJLF90wcJQ0JIHP1B8qzLuFOExhWkngHe9t3jYMf8oVYOezGWZ
	E/nRu4zSR9K01fiBAVsQiICtUlqmlTKJ5M0++04IL5+Wbm3NCzQ092bSD4GMK7vqbpt2d6h9dMA
	XnYMntBms9zWkIph+m1nnwAfQLulXReHVJVXaHMrZORx3F3nPRq8aRQ95LyPQl+MsT8xPqdJwue
	cfGEfz4nGlMTFupngpy8TPas+FYVlwXC3Y9sJ43QpBZCdSRY4ee4oGzc/dvA5W9O++6EWBI5TqT
	EDLfKdVjzCSfG7xfeBTRnfKyHNieBlc5HDBBC8l/5I5jiB8k
X-Google-Smtp-Source: AGHT+IGUIDGZx4RDYLf+e3q1ZO105YaHd6G9mo/y7DfLqWwk/GMZ2JANXYRz6vCw4fGNfiNCP/X/qg==
X-Received: by 2002:a05:620a:29c8:b0:7c7:a574:94e8 with SMTP id af79cd13be357-7c7af0e51e8mr437622685a.9.1744579520559;
        Sun, 13 Apr 2025 14:25:20 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0c9aesm609585285a.90.2025.04.13.14.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 14:25:20 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	lumag@kernel.org,
	quic_kriskura@quicinc.com,
	manivannan.sadhasivam@linaro.org,
	konrad.dybcio@oss.qualcomm.com,
	quic_varada@quicinc.com,
	quic_kbajaj@quicinc.com,
	johan+linaro@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] phy: qcom-qmp-usb: Fix an NULL vs IS_ERR() bug
Date: Sun, 13 Apr 2025 16:25:18 -0500
Message-Id: <20250413212518.2625540-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qmp_usb_iomap(), one branch returns the result of devm_ioremap(), which
can be NULL. Since IS_ERR() does not catch a NULL pointer,
add an explicit NULL check in qmp_usb_parse_dt_legacy() to prevent
potential dereference issues.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 2a55ec4f0a04 ("phy: qcom-qmp-usb: merge driver data")
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 787721570457..8dab20b0c11c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -2152,6 +2152,8 @@ static int qmp_usb_parse_dt_legacy(struct qmp_usb *qmp, struct device_node *np)
 		return PTR_ERR(qmp->rx);
 
 	qmp->pcs = qmp_usb_iomap(dev, np, 2, exclusive);
+	if (!qmp->pcs)
+		return -ENOMEM;
 	if (IS_ERR(qmp->pcs))
 		return PTR_ERR(qmp->pcs);
 
-- 
2.34.1


