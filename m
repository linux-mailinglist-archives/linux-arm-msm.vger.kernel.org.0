Return-Path: <linux-arm-msm+bounces-21673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 900B88FBE25
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 23:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DB2FB2656E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 21:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363C514B945;
	Tue,  4 Jun 2024 21:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yr5AlDwS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4A5143741
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 21:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717537223; cv=none; b=J53vIzyvRD8edaEOdrZByCNjt25PRRBING8tR8kOj7JXh+jXn1JbOgUxkTSsNtKZceLQ3cj9o2PZEoog4tF1IRRFrRXwbb9MjJAhnhRC855wc1Qbp3/A2UCpwexAS7HDT9TJ6fidx2Vo1q9a544QJXWMt/onvWSXanGz7XibfUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717537223; c=relaxed/simple;
	bh=oAtiKWbEqdz+Rx/vFKANtNOS30yIJyVjx6/HCjlK6Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OHwNY/BVd9UPbvHQ18hnc7lbTFWMBYpYiKkCCKhR2J+NoNoCxp+xdRfxW7CkDZjo1zG8PaU+CRqHd8i1+j4Mqb1GsQQoB1ESCtgIsHEIbUrxy4QMhd1UH60DkAZAMF4wXvNqi9Ds+S/PWQ79k673LPivFW9/XzizN6LqMSwGWq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yr5AlDwS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4212b4eea2eso43734625e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 14:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717537220; x=1718142020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rqq18CXoyGbGnQpbX01uKNmZ4w2EbKsUOPcap/enREU=;
        b=Yr5AlDwSrICZlqa0eyAropgNGXSpdPbtFsPpxgD0RnvM08hrR9d9ZZnvbTnPqkBHME
         oOTrGPqvEol8rjOZPf/w0pWdGPkXb8Sl/VYkdiWWU2tHPUoY7dq4Ta2AI6PgSgUB53SH
         /OtP4JT4DqTjWWCGBzZrGCCj0/lozQN2/KUox2YoNGYLGVoBVcTTp00vqhO2V4QJGMxg
         howV9Yr9f9nj3ru2o7VyjvCtnq3l01UT4yN5DW+B7LOmmPifX4O+sEKLdttAWAIPUnlY
         srHiXB+9FIM7TEB/aFMz5gTS5TGcNmuBLKrPrurprc1MLZhU4yQhu6dZ7njMnL243Rbw
         An+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717537220; x=1718142020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqq18CXoyGbGnQpbX01uKNmZ4w2EbKsUOPcap/enREU=;
        b=QYAn5ylIr6GtF2/EPZq7FbUlv/23e0K6VtoTdQyM/3j/jPXXdFXVo+v0VzM5Q8/bVQ
         IviN2mHKWQiaN/SE1Kjw4P1xNWZkcwKRE9b4JgxohpkJYPBpqET2Vt4+3lMTgWvKMQqR
         3RMb7Rf2Gfev9js8Zr9Fylh95sSrLuKSReIdZMT+XNVIS4YLeq8Iu7Bf/57BVFtGiYaf
         hnA19JmL1n5ZU3iAk3wqqUBUhHtiq0/dZBe9uH0E7yafJYabcBd7Ql0zARUcF5Fgcaq1
         WB1T8sv5YFXntRzrVyR4nFU7VVEcaGzDsIpIXzFnEqTVj5uUAzuKjWBABHreFRqs8syR
         x/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUYcRCNa1oNbAnPkcVPHSWFtW/XFcyZg6T+zYbsU8WhRoKdRBrTDsF7mhm8OuAnkTSAxh/8cQMZDKygF7JUI1hqP78FMNaAuLHxUGjlVw==
X-Gm-Message-State: AOJu0Yyt6zKVGb8aJK7PkMa/24qPIoxWtJULL5aCT1r4IcKS1LP9F1ju
	vTkcgPNwKef6t43rQ7MA4s+meTnv9Otk9782pzuSh9R2X0gHUlyu
X-Google-Smtp-Source: AGHT+IHpCQ2HAPA1QqPFRWearVj1yS2MowqKgCHg9WOONS+xyrz1IWSdlUNZ7OspAvgXBXnkGD7Bgg==
X-Received: by 2002:a5d:484a:0:b0:358:4af8:b76e with SMTP id ffacd0b85a97d-35e8ef9437fmr441650f8f.62.1717537219648;
        Tue, 04 Jun 2024 14:40:19 -0700 (PDT)
Received: from morpheus.home.roving-it.com (8.c.1.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::1c8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-35ed8b574e3sm270624f8f.79.2024.06.04.14.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 14:40:19 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] drm/msm/adreno: Add some missing MODULE_FIRMWARE entries
Date: Tue,  4 Jun 2024 22:40:05 +0100
Message-ID: <20240604214018.238153-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing MODULE_FIRMWARE for firmware in linux-firmware,
this is needed for automatically adding firmware to things
like initrds when the drivers are built as modules. This is
useful for devices like the X13s and the RBx devices on
general distros.

Fixes: 5e7665b5e484b ("drm/msm/adreno: Add Adreno A690 support")
Fixes: 18397519cb622 ("drm/msm/adreno: Add A702 support")
Fixes: 3e7042ba87da ("drm/msm/adreno: Add ZAP firmware name to A635")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index c3703a51287b4..fede5159e7f5b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -609,8 +609,11 @@ MODULE_FIRMWARE("qcom/a650_gmu.bin");
 MODULE_FIRMWARE("qcom/a650_sqe.fw");
 MODULE_FIRMWARE("qcom/a660_gmu.bin");
 MODULE_FIRMWARE("qcom/a660_sqe.fw");
+MODULE_FIRMWARE("qcom/a660_zap.mbn");
+MODULE_FIRMWARE("qcom/a702_sqe.fw");
 MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
 MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
+MODULE_FIRMWARE("qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn");
 MODULE_FIRMWARE("qcom/yamato_pfp.fw");
 MODULE_FIRMWARE("qcom/yamato_pm4.fw");
 
-- 
2.45.1


