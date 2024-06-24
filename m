Return-Path: <linux-arm-msm+bounces-24020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E719156E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C6A51F2524F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 19:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A348819EEC8;
	Mon, 24 Jun 2024 19:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hQ6wXJH3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EB2107A0
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 19:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719255986; cv=none; b=Ty15R1rUn7kBuTj6A94fSvTv6VzmYdfG9l0QvZZTIJhWOGlUPP8ZR4YDzPR+Kj5k05kEhdCgAxVE8VGqyfUQKqpDvL8SPl0tBv3lQeUAcOzQo6AoEGTeV6IJSFQnHp+sBZLVIVT7AZkR5UqyQWvTjYKM4Dhx0KwMkZwL6WHbGRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719255986; c=relaxed/simple;
	bh=1dLFH1BN3fCMPMV4hZ8XzTSy79RRF8rKOFlO83dhJ70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZF1YsxHn2MW3aYaAqZciVPb18RfR/EKJknyiUPHcKoh6w/7H+UAVu3El/0fSOGfiXypKHUZ7UHfLcK9qKxPyqDA55d7VsDa1icH6u6lMU2ib+h//phclg9PT5A7cRws1T47G4U8xp1GFwTsXIWqxjN3iGDgx37OXgJ19RCFIEbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hQ6wXJH3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-421757d217aso51663655e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 12:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719255982; x=1719860782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jtibGmNRXCXDZFzGLSqXKj8dY1qUNsegYw3njVNk31c=;
        b=hQ6wXJH3aB5twnsjaO1MXFppybEYqv2tu/vaQqYxfFrEEHDGBqk0x7jztf2QjFFzXO
         Ba/CAm6CVVNZsyZ5XRvpYO99y+fW0OqbpETCHox3pI3RTTMYRJ9VJCdtYLN0AwA0A16g
         wxRt2mqpzQmV8ZOYhMufhbT4592F/xlLnwO8Rovk/Z33BOnIeFD5MzTaHVoGl8u9Y0CT
         XRURe5ZM315qZu90B9+MUrQlh4ybTgoSP/NEl5esA8EceiOcVDzyyr+aJvv90nz/UEpc
         wje2r6+qlpWP+MnJEPyBhI0o/5cnmY14R2XBUuz33TPUpl5pyWuucVmJl7/PB3E8CJgF
         HIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719255982; x=1719860782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtibGmNRXCXDZFzGLSqXKj8dY1qUNsegYw3njVNk31c=;
        b=pBxNQX6sKizWGdrXOlkzj6jQFENw3HC3x+TQlX124w8RtvObxIGs0dQY6YwFBp/NDN
         yMAXY8ukJvyyYTdWZvJ/9m80xz24RfnwHVIxuyUL/eKNeHljpZXR05Ss/z5dZYdfmckp
         m9oGftVYqqPN8b+IVrWobiUht1HxSwuce9QFy9ixXp+VRdIYXxHtH33kqvHzGa2zCJQj
         dyqCfRX+loEfbv5XmLtvYSv9Y6FH8wdwWhcCn1ck5OJhAJZ/0ESrtSS+gc2zGIo5hjIv
         XtjDlzqUnZ64taet8TMiULKEsqIzM1AsKiL6BuJg4q5a3a5e0Ras2132CTfUTvmqPmhB
         ayRg==
X-Gm-Message-State: AOJu0YyJkur8CIqxaidokT81G0kMjsNRlE0RMT6w1aZ8D4Kr+tHcPwGb
	DrkYV6G+bpR4Ucm83vaKgqL6IPZlONNbzfvjyB2Kd8ijx4KE10OctCP7mqO/H1w=
X-Google-Smtp-Source: AGHT+IFLpYq7oL+k6nqRubCfnJ1jZVdzNTvXaNtfeVafAGEmCMonKcUlI3do5gX5sPMGu+O0/embTw==
X-Received: by 2002:a05:600c:42c7:b0:422:902b:73bc with SMTP id 5b1f17b1804b1-4248cc27201mr49942765e9.13.1719255982146;
        Mon, 24 Jun 2024 12:06:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b80e:a46a:7fb3:4e3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f667dsm10770383f8f.16.2024.06.24.12.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 12:06:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Elliot Berman <quic_eberman@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] firmware: qcom: tzmem: export devm_qcom_tzmem_pool_new()
Date: Mon, 24 Jun 2024 21:06:14 +0200
Message-ID: <20240624190615.36282-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

EXPORT_SYMBOL_GPL() is missing for devm_qcom_tzmem_pool_new() which
causes build failures with randconfig. Add it and fix the issue.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406250127.8Pl2kqFp-lkp@intel.com
Fixes: 84f5a7b67b61 ("firmware: qcom: add a dedicated TrustZone buffer allocator")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_tzmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index aab6376cade5..5d526753183d 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -324,6 +324,7 @@ devm_qcom_tzmem_pool_new(struct device *dev,
 
 	return pool;
 }
+EXPORT_SYMBOL_GPL(devm_qcom_tzmem_pool_new);
 
 static bool qcom_tzmem_try_grow_pool(struct qcom_tzmem_pool *pool,
 				     size_t requested, gfp_t gfp)
-- 
2.43.0


