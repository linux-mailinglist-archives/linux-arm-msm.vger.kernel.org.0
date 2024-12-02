Return-Path: <linux-arm-msm+bounces-39811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E0D9DFDC1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A72B1635D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF301FC0E0;
	Mon,  2 Dec 2024 09:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="T4W00Jm/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4531F949
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 09:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733132951; cv=none; b=tDGMvO8qfEfCNAbqwKSPA6CIYHC97WlkhKNRv7sd/TxeP9eg41+RbPNlcjn+aRx3ohZoCdHy0RoNralICtPgPWUTH5scDgQOlickAhcxF4vdpphWk3JDUIP6vguU+XjIh405w9yoJ9nSnd0NkyVFiXnDuph+lbxFDIqol/wLVLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733132951; c=relaxed/simple;
	bh=7TsWaTIWJQYD+y9SICdpkAnWxQKe1BiPBtoMoUrrt9g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uijdhhAu8bEPHFtQFY3ke9oF3D58Aq4gcBQGkrCdq94D5cIe9I+KXyNOrRUTHF5mbMzWv9I9o6Ibjh96ZwZDPMXz5+Ep4RnyTSAMAH+F2GyYhWE3KurTg8Z2m4Tf10/thm5iJKuRNFihVtyqCi5NZK3K7p3Fpoli07Hn+1Uqf5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=T4W00Jm/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434a9f2da82so34413205e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 01:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733132948; x=1733737748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+tz/xNuOuXmUEM+zhS3HXnHXawb1XEPnU6wuMOHx78M=;
        b=T4W00Jm/IPoUkK5t6lu2Z2eR1Oc6HNuVPu/YKg1wC1RPxWZaB90X+BYk/Kiyv3Ygzc
         H+lRi+hM68p+B1t14P6aCfmfRTNw2GoMBtlAZbZUx2RdkVm8yChtC21bcCiCtoUDqQtU
         S7mdh1XOx9GEYe/n7lxOKcDQJQi4J5K8zSHmT0RGtF29Z8n5r2zV8ME6D8GJmuE9YKh1
         r4uUEdeEWxXk1RugfQiQ/wpxCC/XxxtoGTvFQ6nauMHSDCVvSCi6emJ8+4SnmSzwQagU
         Nwtr55JZquqj55AP02O+CAEDPfYbTWO8w/PPrxX4S+3DLePYu/WaeEcqnBMe0sYDf90b
         JEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733132948; x=1733737748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tz/xNuOuXmUEM+zhS3HXnHXawb1XEPnU6wuMOHx78M=;
        b=QfPnmOueBFUYr5I7ZRj1jNMTAQj6ipwrcFHG8z4Il19a0cjfHrO1vA5x7+yUH6boj7
         +1YBrSt0mORAenIVgfVOWZ7rxbKgeljeLSihICDWn4FL9bejImhkN4e75GEaeLrmF1L1
         z6m5OzxwrF27fOZYuRVkfPeVlluTrg6QyGH4okImxujMFVUd80rtV7ieNnvuC5EWcfgM
         xHsEN45oeV1ymJTpEOvSifTltM0fEwAs9NNCRvJELlw3MK4nxuBYqKTiGThB7wIQDLry
         0ghsZDhEi/cC5JD2BJA4NkDE6hYyapjg3Pe+xvLEb1MC21Hz3/SnV2doOcZ0YO9wwuHL
         bURQ==
X-Gm-Message-State: AOJu0YxvvRu58oesJ+Q795siTBllnD+gVwbY2FUQSDIvtuBCwQwUFJSH
	O80rWfDSpZ22gFtsQ9vOSjG5WjTfgo4P/jgFNAk1+KOMYAkKhPT00oIHJBzip5c=
X-Gm-Gg: ASbGncuE4aONSA2ASxBY+ijuaYIuMGNJeincW2z9QMrpwv8LeePQxV6K8ZQA0sfuOj6
	x45dn4f/arRdSTIv+21EqMsSMxvPXYp73ZAS80ibT4OVic6Kjql9HuoMoRPtMZYjY9x6rsuOH/n
	Li81+gXNyl0O5ga4otDjrATofxnGLDkmYRWIcHx3tJI5NJNiet2U1AnhQYKXpff4bAbR5e5jfPD
	+sDcSXSYiTCHw/uXs2mT50/z/Cw/pph6k4+pNQyYuofJZ4/wg==
X-Google-Smtp-Source: AGHT+IFBViBzFl4UbOb2Q7QPujdsLTswwDPnJQOow8/tEwXztCuRe/qAmFq2iQFkA4m98awINGeM7w==
X-Received: by 2002:a05:600c:3111:b0:430:563a:b20a with SMTP id 5b1f17b1804b1-434a9dc01b2mr185421235e9.11.1733132947755;
        Mon, 02 Dec 2024 01:49:07 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:223b:dce7:ef1c:4bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e3c21ba7sm6486475f8f.53.2024.12.02.01.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:49:07 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [RESEND PATCH 1/2] soc: qcom: rmtfs: allow building the module with COMPILE_TEST=y
Date: Mon,  2 Dec 2024 10:49:02 +0100
Message-ID: <20241202094903.18388-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Make it possible to build the module when COMPILE_TEST is enabled for
better build coverage.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/soc/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 74b9121240f89..58e63cf0036ba 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -139,7 +139,7 @@ config QCOM_RAMP_CTRL
 
 config QCOM_RMTFS_MEM
 	tristate "Qualcomm Remote Filesystem memory driver"
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	select QCOM_SCM
 	help
 	  The Qualcomm remote filesystem memory driver is used for allocating
-- 
2.45.2


