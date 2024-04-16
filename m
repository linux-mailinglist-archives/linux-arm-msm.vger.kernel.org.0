Return-Path: <linux-arm-msm+bounces-17628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 572CE8A7867
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 01:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F72D282180
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 23:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE2C13BC21;
	Tue, 16 Apr 2024 23:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RQu4G2sa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A5B13AD34
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 23:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713309037; cv=none; b=D2PU1A76bp4/KLbef/56vRU229J2eFGDnEuTKNgICbgl0C5uDjN0PCPCB2WqpAsV9MTqcSCW4vAj8W+ClqUEKnFNuxQZrlwaYDpsxufV+R2BIn6HVHEa2ev4sgKfK3LCYwiDxnSUGIn+dUHxZg9jW7FIV2b8saDTqugGhontdgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713309037; c=relaxed/simple;
	bh=EbIYGk++rgx+7NmztvVdLwSFy7KqI+W3KHG9jDFNs9c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cbghZIiJQKxISbevTZSQmzbrlUMSlmm8e2yI8stVsDbU7y9bEJG6bYZZ8RtBj+cRphhDwA466XarUCGsUqmIt4zWIPm/7WcLw3M8cQ3vKYbCMAYCGK5D/FKbVc/4Asa8ElMDfMZh7bLYzGvicva1IgktESf8bQ+Adc7cfxj/gRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RQu4G2sa; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7d65e76c9b9so217520839f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 16:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713309035; x=1713913835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojvGKcc7AAkbvn6SYuvIFckxsha/qXH2nNMIJd0yE6w=;
        b=RQu4G2saxogsehrb1pFyerWHXtJ2xMdE7NXCqgZs+we7V+MXf61A5kZrij3VBaGu7A
         oZGFS6+0nxHXewFO2xWW57izhKEg7qoCbyb6oN5XuLQASsC8g1bJppP9tzuvCQ50aLFM
         Ja5HDrUaJZEWDxOwh1STNenvle/XScy3uAaCBShkEiFOQj4qTWCMb/3ty6bxm5XD0ziK
         zY+hh87Xglw8sUOW5NJio2lFH/n7LfC+vv1crukox6Mgq6zGSTgCKlBf9e/NHgoCZgxR
         QVM/7VANx1CO8LxBNHD/Cff5oUHLj27UJagoc3qQd6nMMyCeRYh0CtJcKD77r+NVNNR6
         mEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713309035; x=1713913835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojvGKcc7AAkbvn6SYuvIFckxsha/qXH2nNMIJd0yE6w=;
        b=iwiZeI5lC1Kp2o7SPbaxK99i/vBO2HBNRRn6i5auiXotk2LKhofFZdvmYxD7o6HMQG
         fqokmuDmPdAsAgGkuPBCe+ZxQ8Tw7nWT3/zP65IL+niyZIIjL08BkjOQujLV05HCaHiS
         V6eRr8GVa2TU8r4QAZXkeXcHrJ3htGRXtyl4w5lgFR66vSRyvKGSbE+1fmOSubg+r0um
         iAfeugeDwTdhjb2JT2eriAy/DnxL2Ukze3BTLT1WGa3speu02xLFnJFnQk3iX4Wgm50h
         4eaUemgAQNlpwRKMHU04b84cKB/IrcKiFXX2jOoDbujAwXEVGseQIKhiyL/FayB0XER3
         WJhg==
X-Forwarded-Encrypted: i=1; AJvYcCV9r5X0ktPN4QqHMDLtoXERzGfGuPdgC2Qoz9Fh4naCT97sdjaemsMvLcD9ZfWOIK24WlhfEHBJokovtFkN0neKNgOWhzvyFAsRHoG1Kw==
X-Gm-Message-State: AOJu0YyC1/DQ9tH5BztexJAyhGdTLl18mHUwqME/IaGjRPHohtaF/GzH
	Q2+o/dS+PiCF3IkbtaLmX9PsMUr0+ZhAeOS92KiL9v7vl05QFnhRW/u00oNObDU=
X-Google-Smtp-Source: AGHT+IFi3/gmplobIjS5SJfn0KyHlODX/EQBn4/S2xiJvgSIWALbxR27pts1oOqmmjMW2djZV2atNw==
X-Received: by 2002:a05:6602:389b:b0:7d6:65cc:cc05 with SMTP id br27-20020a056602389b00b007d665cccc05mr20170496iob.1.1713309035312;
        Tue, 16 Apr 2024 16:10:35 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id le9-20020a056638960900b004846ed9fcb1sm372170jab.101.2024.04.16.16.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 16:10:34 -0700 (PDT)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/7] net: ipa: add some needed struct declarations
Date: Tue, 16 Apr 2024 18:10:15 -0500
Message-Id: <20240416231018.389520-5-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240416231018.389520-1-elder@linaro.org>
References: <20240416231018.389520-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Declare some structure types in a few header files where functions
declared therein use them:
  - Functions are declared in "gsi_private.h" that use gsi, gsi_ring, and
    gsi_trans structure pointers.
  - A gsi_trans struct pointer is passed to two functions
    declared in "ipa_endpoint.h"
  - In "ipa_interrupt.h", a platform_device pointer is passed in the
    declaration for ipa_interrupt_init().

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/gsi_private.h   | 7 ++++---
 drivers/net/ipa/ipa_endpoint.h  | 1 +
 drivers/net/ipa/ipa_interrupt.h | 2 ++
 drivers/net/ipa/ipa_power.c     | 1 -
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/gsi_private.h b/drivers/net/ipa/gsi_private.h
index c65f7c5cdc8d0..968ab1e596e87 100644
--- a/drivers/net/ipa/gsi_private.h
+++ b/drivers/net/ipa/gsi_private.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
 /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
- * Copyright (C) 2018-2022 Linaro Ltd.
+ * Copyright (C) 2018-2024 Linaro Ltd.
  */
 #ifndef _GSI_PRIVATE_H_
 #define _GSI_PRIVATE_H_
@@ -10,9 +10,10 @@
 
 #include <linux/types.h>
 
-struct gsi_trans;
-struct gsi_ring;
+struct gsi;
 struct gsi_channel;
+struct gsi_ring;
+struct gsi_trans;
 
 #define GSI_RING_ELEMENT_SIZE	16	/* bytes; must be a power of 2 */
 
diff --git a/drivers/net/ipa/ipa_endpoint.h b/drivers/net/ipa/ipa_endpoint.h
index 995f12af1623f..47259616c679d 100644
--- a/drivers/net/ipa/ipa_endpoint.h
+++ b/drivers/net/ipa/ipa_endpoint.h
@@ -15,6 +15,7 @@
 struct net_device;
 struct sk_buff;
 
+struct gsi_trans;
 struct ipa;
 struct ipa_gsi_endpoint_data;
 
diff --git a/drivers/net/ipa/ipa_interrupt.h b/drivers/net/ipa/ipa_interrupt.h
index 7f8ea8aff7fd4..64bd8cff1a041 100644
--- a/drivers/net/ipa/ipa_interrupt.h
+++ b/drivers/net/ipa/ipa_interrupt.h
@@ -8,6 +8,8 @@
 
 #include <linux/types.h>
 
+struct platform_device;
+
 struct ipa;
 struct ipa_interrupt;
 enum ipa_irq_id;
diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
index 42d728f08c930..9569d35d899bd 100644
--- a/drivers/net/ipa/ipa_power.c
+++ b/drivers/net/ipa/ipa_power.c
@@ -9,7 +9,6 @@
 #include <linux/interconnect.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
-#include <linux/bitops.h>
 
 #include "linux/soc/qcom/qcom_aoss.h"
 
-- 
2.40.1


