Return-Path: <linux-arm-msm+bounces-32747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B2B989CDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 10:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BE021F22360
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 08:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24A917BEC6;
	Mon, 30 Sep 2024 08:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aFtb1pWb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237E011CA9
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 08:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727685217; cv=none; b=Xn2qiTPTfDQeGILwYXBUFZZP73fIsiIuXKQ84BS1wkqh+D0nD/OfVU5One3c4PnIxFkCVAMRBG5DUJcF9RLhbWHbA48ppOLCoLZuvMQSdtn1pz9PFSvAcdBWI2ojU4WKs2ZFfLF/fIANCR/y/oQiyPEgoakpgJA/gpwHdwZLBAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727685217; c=relaxed/simple;
	bh=F+ugbM8rh8xJUmWflA48lW/HaRfLcvq9rMFWC8bGUN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EtUmB8HIxO2PXnoKjRVVO9vx/HMMD1ATNqAOho0KtN2fH0Un9AbKh8lggRDcpg9nQzpe9kz5iQwX8dwZjfrr5wgOtTc+WH+ypKOzm6cfh8fAD/Eleoj6nMjRBbRSIuKaMxv2d6N19PzwQPLulPsoMeX5fsFpLRNBpsTdMF96u2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aFtb1pWb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso50713285e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 01:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727685213; x=1728290013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RqqnGJumLhN62a61w28siyzdMQ5DEHGmALkk/X4lZgc=;
        b=aFtb1pWbiY84X6lRuRUXUneM1H5rt+xm+trtsQbHO9Ve0bRWsnxZJEHKICMwPCXvso
         WdfUULnbixhA99vDmnNkNU+OtVca41g1SKtlINm9kM5ZMdiCqNiB+/A1xMDdl/cjidKj
         +aUcw5QyNXVjBQfEla/sSVfe0fq80KkF1AfKGHvcHeTYBbtYysuD+AI5ZVQznC5ILkkP
         /iXogonuRqOcddjbPS8lDhKxRVRPFv0vB6Hl8BN19DpkM/IEeAkemzxcyoRXhBc7qn44
         gHb581w7T4fn7+zE/n1OMP24d/oWTHZGW4zv3nGlhsOV+07+28oBysh/OaeoT5s6jehD
         ZZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727685213; x=1728290013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqqnGJumLhN62a61w28siyzdMQ5DEHGmALkk/X4lZgc=;
        b=LnwduCERwnuYIDvt4zmDQlThCjYfd3I3vkIQo9pPG8CI41uywnXmmU5hoDoqSSEpmA
         I5kA5nASbn2qf4R7mI5i8UnLiOhhV/xDQkmC2+r9nPvTTpnOSg+3BU9WJAV/0H//s1Rg
         +XSYZ7A8/tuLq34xZBGv+j0e2TsPuf8p3vddTS0Imgjzl9g0DGpHP+nJ0JN5iIFz4BOK
         GXgV5JOBzXog0Sb5DZlm0gUQZTra5GPC05qS5e8h2VU3yXi1Xej8k7zwrmSzVx1OfC3L
         79gEDoVhmkRyBNrU/nt1uq8vV4YjXLOZ8DMhz25xv04jjioGCuD2tVwSv6JRIXWuIbHA
         2ICQ==
X-Gm-Message-State: AOJu0YwHRyUz5XOt6aNlJdAc3A+ndHCHe4wMo3+DAw1vC/G4VOc4Ia5y
	lliN/DnZOl+iXbXoAMSun05YfLeogpfaSpQ3bA7k+YS5Slh6uBkiyPe8p8qeU1A=
X-Google-Smtp-Source: AGHT+IEpfKaaF7ng7r33UN1uAzh2QTa7nC6zLFplvgxiU2PQg/kQXr3wXa0AF2YNi+DEP0KP7TMqmQ==
X-Received: by 2002:a05:600c:1d20:b0:42c:ba83:3f00 with SMTP id 5b1f17b1804b1-42f5840e1efmr126867055e9.1.1727685213448;
        Mon, 30 Sep 2024 01:33:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8791:e3e5:a9ca:31a6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a36251sm144502825e9.37.2024.09.30.01.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 01:33:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Elliot Berman <quic_eberman@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [RESEND PATCH v2] firmware: qcom: scm: fix a NULL-pointer dereference
Date: Mon, 30 Sep 2024 10:33:28 +0200
Message-ID: <20240930083328.17904-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Some SCM calls can be invoked with __scm being NULL (the driver may not
have been and will not be probed as there's no SCM entry in device-tree).
Make sure we don't dereference a NULL pointer.

Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
Reported-by: Rudraksha Gupta <guptarud@gmail.com>
Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/
Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>
Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
I dropped patch 2/2 and am resending this separately rebased on top of
v6.12-rc1.

 drivers/firmware/qcom/qcom_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 10986cb11ec0..8bac4915c211 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -216,7 +216,7 @@ static DEFINE_SPINLOCK(scm_query_lock);
 
 struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void)
 {
-	return __scm->mempool;
+	return __scm ? __scm->mempool : NULL;
 }
 
 static enum qcom_scm_convention __get_convention(void)
-- 
2.43.0


