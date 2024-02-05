Return-Path: <linux-arm-msm+bounces-9841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1C184A24E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 19:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3234F1C21823
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 18:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493594F5EA;
	Mon,  5 Feb 2024 18:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IR+FRdJB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEBE48780
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 18:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707157706; cv=none; b=bsuFd9fANdYKAdhm8zeWu6oeNPeqxGytvvwxbkVTMeauupN7+WRa/8sgkY1KKsDJTKfnVkJsVldMXuVkTHq48jnAYM/kZeZKa4g8/bVNWZ+wXIcZtqNnClRExZSGcyQHAi2+HxAnhYmC2LDqxT4kLxpUHaUzK+Viv1xzEaj5xWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707157706; c=relaxed/simple;
	bh=duYonnfrjmtL3WfqDlD+fJi3VRmILgwMOyyP+rEIZDg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fTd2fHQkWccZwOOuLuGYZZbG7d0eMFtcH4swP8bmmuhuF7OM/baN4tGg7W/lfd2+lVdEw7jWz/4489/PWoQJ4E9TClea3z8WTOc+ytM+Ba/WvlSJWcuJ9uA6qV4WM+VEjY7vqxMczl73DrIZwmfYahNqcZ5Oo2c/KrMOt+KcHQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IR+FRdJB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40fdc653665so9183955e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 10:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707157702; x=1707762502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEj/dNYHLTAVVx1z4vuCfUrAofiAmwzp/9dgycGoE2E=;
        b=IR+FRdJBWEJlwol55LgcG9rJ+EQpuf/6vFOzeE4qX8tb/GAbmFhOOCDAWB7d+1SWDW
         mQnMgX0W7O4NZWsweJdv00EAgniOn1S13upH7qEyn1MQSMxugcDes0ibYV79maPWrPXq
         Es+3GdiRbmfnbWuI2nzTGz9pyCg7UOORwcotBif0nysOQPl7VcVjz8/Sx3o+N5apsfIv
         HmVzFxJyM2fswz1SqkoiQsLSXyoPd6pxVmMUnGDvxB1bvN8KeJbgafnKTuwPu/A+FP1E
         d6tyU5Kosxq5Mp9YhgkdARUQdNKsUU895XiHIPUKX6AG8yCWf0/5FHrtwoGqWTQNgoBJ
         Z0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707157702; x=1707762502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEj/dNYHLTAVVx1z4vuCfUrAofiAmwzp/9dgycGoE2E=;
        b=EI+XRhXswn2W1peS4jv3CGSWSS7dI6LUkCQCHftio+3YGBysMHmuc/PiFunYV6nvZN
         wvWVx0bsZQeOScGZHYhHAlZD+mEv55ljbl1BlMCjDMrEymz052OZ+qkfqPjc4Ct34m8k
         4cBKURlzOyD4JN0Am9icArG38mGinxY7Dk2zzPJHqbY6fMwroC+BA27YqRkCKJz6eEc+
         pVJwRbx6Ywys0MouFdv80gkIU+tG70aHgcmpz6uJinXGo1M9uO/j72+QT05pOeVm7fiJ
         bgdYDU0Xl7O76CCnOaknTJYWZpCR0fY1MA+0Cnzu2kdP+/srzk1a/Ve6fe+YjJpPQsrE
         agrw==
X-Gm-Message-State: AOJu0Ywvf401nKviEZghFe7yu8LP/OG7XvIXulOvLDO2O3dyFjQtzipj
	lsXWuo11u6dnCviszA9CRZAS5EnFhPGvGTazUF2x2cDmuAUusGq1tpFitSdov7o=
X-Google-Smtp-Source: AGHT+IEhRf/Nq70YfOTrEL0Ga/uegesRWr0w2slR5DVCq7BJ+6JlbySRSoBMwByr+5DcIPQnXJ4VeA==
X-Received: by 2002:adf:a112:0:b0:33b:15fc:22c1 with SMTP id o18-20020adfa112000000b0033b15fc22c1mr271098wro.52.1707157701997;
        Mon, 05 Feb 2024 10:28:21 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW/9WEP5RMyqyIoyiK3EYuSmo/OO7XiMrIADASEM48FGfWG76Ej9QS0/h/WB9eKfaUo4LTV04U38ij7kayZPtYlYdJStuPF9xrxBpPbRKNhOuRiNZ31hX/hvVA8qvBxmGmJWcXbAsFpICmLQgpV/QUccyZ2ObTQZcRIhhDgnRUfLVr5MtblFMmkInHMmXLpm65WgCwFBAB4BxoxQWE58HWTL9gZy4r0phfFgIL4pzF02ntmJdlzClUNpmhhb1/CdugDGekPY6B3ihBZQO+ToMxR5/73R30tQCr4zGEZ7kju6gY6nCTTBGZ3oZTVaKGQib4n9LffW33GOeE6GHDLxuTI5sIdamxWYfhEe3He7dK7mgsdfRPvvViBySp8l3c+nKhksfSShfUxLeTGy+dXcT/7rbC/dnYWv9BzQ8RfvHSdhLxwwRZT7JdFHFHUOxyAY8QFYs/iGedj6UAXerG8OFKad5cAXC5ikYPiDObMzJFnkgB18n41nZKXVd/0lufl/VfCOcmeIjIALR/Hg69nFa4wirfjL+S9VtsL6X0sBiv3jCUEtAoGuUpVxVOQBlwNrxY=
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d678f000000b0033b17e18df8sm203229wru.12.2024.02.05.10.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 10:28:21 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Deepti Jaggi <quic_djaggi@quicinc.com>
Subject: [PATCH v7 02/12] firmware: qcom: scm: enable the TZ mem allocator
Date: Mon,  5 Feb 2024 19:28:00 +0100
Message-Id: <20240205182810.58382-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240205182810.58382-1-brgl@bgdev.pl>
References: <20240205182810.58382-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Select the TrustZone memory allocator in Kconfig and create a pool of
memory shareable with the TrustZone when probing the SCM driver.

This will allow a gradual conversion of all relevant SCM calls to using
the dedicated allocator.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/Kconfig    |  1 +
 drivers/firmware/qcom/qcom_scm.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index f18686edf415..d24d83223867 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -7,6 +7,7 @@
 menu "Qualcomm firmware drivers"
 
 config QCOM_SCM
+	select QCOM_TZMEM
 	tristate
 
 config QCOM_TZMEM
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 520de9b5633a..0d4c028be0c1 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -8,8 +8,10 @@
 #include <linux/completion.h>
 #include <linux/cpumask.h>
 #include <linux/dma-mapping.h>
+#include <linux/err.h>
 #include <linux/export.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/firmware/qcom/qcom_tzmem.h>
 #include <linux/init.h>
 #include <linux/interconnect.h>
 #include <linux/interrupt.h>
@@ -20,9 +22,11 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
+#include <linux/sizes.h>
 #include <linux/types.h>
 
 #include "qcom_scm.h"
+#include "qcom_tzmem.h"
 
 static bool download_mode = IS_ENABLED(CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT);
 module_param(download_mode, bool, 0);
@@ -41,6 +45,8 @@ struct qcom_scm {
 	int scm_vote_count;
 
 	u64 dload_mode_addr;
+
+	struct qcom_tzmem_pool *mempool;
 };
 
 struct qcom_scm_current_perm_info {
@@ -1887,6 +1893,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (of_property_read_bool(pdev->dev.of_node, "qcom,sdi-enabled"))
 		qcom_scm_disable_sdi();
 
+	ret = qcom_tzmem_enable(__scm->dev);
+	if (ret)
+		return dev_err_probe(__scm->dev, ret,
+				     "Failed to enable the TrustZone memory allocator\n");
+
+	__scm->mempool = devm_qcom_tzmem_pool_new(__scm->dev, SZ_256K);
+	if (IS_ERR(__scm->mempool))
+		return dev_err_probe(__scm->dev, PTR_ERR(__scm->mempool),
+				     "Failed to create the SCM memory pool\n");
+
 	/*
 	 * Initialize the QSEECOM interface.
 	 *
-- 
2.40.1


