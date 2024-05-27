Return-Path: <linux-arm-msm+bounces-20610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A82B8D00A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 14:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11011B23892
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 12:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EC915FA67;
	Mon, 27 May 2024 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="us2JMFZf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A16E15F3F2
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 12:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814613; cv=none; b=MfjTot6ik34v4W2rpvoKIaKfJeQUsXRIGEihyv2nxj7p0YEkn3PN/cKBO/Niql6+ctGxupoO01SVtyRfI/R0xxHPqpVpnSugIPoDGFZ+bVh7WctyogKmFwbNH5JmIRFRq+JZDs6VZn7BF214kGIGeLfLOvwHn1Q50p+QraH9KGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814613; c=relaxed/simple;
	bh=H7pseenH3L02JxfV7omW/31iV86Lwn0PZV9E6T5f71c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NdlVS0yoanUrUV4xTlwAm6RgVgY0K85lmHe65pzlw3ELfaIHSVzXn7ZAr0aiTzFSrB2rME2snyrFos8w8DoAAZJEuA7Ac7b83bWFIwwq3PxL+zp98fY7hs6jtdtNEImtQGhpdpClwQwiU2EhZmgrJrqq71Sm+84ur0xiCs5vTsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=us2JMFZf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42017f8de7aso83324265e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 05:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716814609; x=1717419409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2tGSXM64q5CkEofoukaYDnOH1U7xvQ9rdr6WJfwwYM=;
        b=us2JMFZfcCsrXbXu+DgepLB03hPwvWVNaes8P+gZZvWmtnI2hALbF80CgWNS+SZX++
         Wgj/+fHXbpdhKaiYRUJSAyjlfE8FosBGfqirA775Pdmkoq13AvtUQ+RQTxoi+0PsxHlv
         gu/3zMa9h/UGxDkxxst1e2/m8JRZbE0epJzDQpjJ84B5k1vx5OCjK+TMjfafxSqImOWU
         lVoeYJtVk+LWjBRqLhB2GCpVmNuRVK88jiePIXChPIYMDvD7sqL4fte6MvDHgQduq7EK
         x1niuLBz6N7tXXRl9jU4ADIcWJpleWqhC1lNZ4QBFA8M/4rNRi9OJog7kX4Q9zmv2fDj
         xNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814609; x=1717419409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2tGSXM64q5CkEofoukaYDnOH1U7xvQ9rdr6WJfwwYM=;
        b=URHQzaJ6hbFzhv2FBVv7Lcs6O9JrJvl5toEVDelh9/m9m5o07dDnB9bzeoCh7T+pb0
         amg0iJgP3GiltOE2PALyVhrAslERPVeSddSTnd4mrm9594h9AHzy1AkTJ5M1mpbIM58Z
         4WPjY16Dd8Vy9uE+P7P+qzgwlvXHW0b3I3MCFr9E13u6PVgOpMXTNiXGVHNMt5GyZHZm
         45vE4hxTDIZYpfiC/9/+iLs0+6KQtRCsAQEsahP51XbooWbzpX8mWScjFaLsfCRNMxz9
         QDrwx7nvblzs8JPYfGjRY1WKseiTfnoJicmkdtt6uOgwZeZUm4s/7nfuaoUp4i3EE0Fp
         oQQw==
X-Gm-Message-State: AOJu0YwhKC3ESQv62ipGsA+L94cKyYg7+hkgpcBf0u6Oohkvr7Zi7qvL
	i1iEi+f4Xi+o/0ZPz61Lj/hx6W1h2uJhoymjxM2snq1Z5sh3zr3MIq7JULE79eM=
X-Google-Smtp-Source: AGHT+IFiFkZN2ztJz4aq4ARQTndSRHhYuJJSLUpwf/uPp1OX4TcFw1jCbi8J6K1zQHHsp2lLkGM7tw==
X-Received: by 2002:a05:600c:6b0e:b0:41b:285:8417 with SMTP id 5b1f17b1804b1-42108a2e796mr66785555e9.40.1716814609554;
        Mon, 27 May 2024 05:56:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f64f98sm138753635e9.24.2024.05.27.05.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:56:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 14:54:55 +0200
Subject: [PATCH v10 05/15] firmware: qcom: scm: make qcom_scm_assign_mem()
 use the TZ allocator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-shm-bridge-v10-5-ce7afaa58d3a@linaro.org>
References: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
In-Reply-To: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Elliot Berman <quic_eberman@quicinc.com>, 
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@quicinc.com, Andrew Halaney <ahalaney@redhat.com>, 
 Deepti Jaggi <quic_djaggi@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9Erqvqgiad5rjTJsNR0YSbu/CRguRxvgVp+lpYCpIVk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVIMIKOO9v8eTMGirexp87ho1NlUlhkeO/Hz9j
 WAf+2zXRZeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlSDCAAKCRARpy6gFHHX
 crGMD/0YS7UnmIE3KqMGN3f/lgIUFTePpK9qvRMHBPLj2Dpag/edaQyVnec1ocNJlO8pz/bNR03
 UdWI8Po0hrZN8wLxgwxiAytFfl+Sa/aJ99bbZjwnd7nk9o8icNvkBmE6wtg3OFHSx4rJspet0cf
 tD7cJ93DyEg8nVqzSw4anW94zC0NczKotQmHBvEmXzuITPwUmAsIVjey3it0QaXigk3k1LN4yLj
 pQmOTt0CINtQexASpTZAFvC++O0u708QBAU12SjPXB+9vNWpd/9OHS/P1Sp3ISzJqQP37QH+Ozz
 opcFF0t5siyZ5FgdRvui5YOcoIMdAmy1i4XhIqlAo5+UlhqsOqrAvV218vnNdsJFooB8Mm162Ga
 lqRB/8qrODadaf4jJY/5k2/mkL7jcCOZw9eFJQfnDNN8VMZdry4pcX/nnYDGMwgPV2I/1/xxCm3
 qbbCV1RsuS56M2JZtdWxrbPwwvxPlAdCaRm9nmC7rPuKHPg38FoEglA7uz8iLYLSSSvw7CdUVP0
 L0KLtJGnM6v8AFX0lR0wQ6ka+np8QNJYiU2/rLCL7QWAEXNgTDe2MIICEUkrR/RH05lP3cGml7a
 x6R0LfAwyWSeue/g49j07ahDu21bvrhvd/+tgJ63nVLSILaYCqg0v2LVevZbxkLcYmL99Ifhy3L
 6DqEfDKi8bRUI8Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Let's use the new TZ memory allocator to obtain a buffer for this call
instead of using dma_alloc_coherent().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1d207c14afc8..ea4d71bb0ad3 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -6,6 +6,7 @@
 #include <linux/arm-smccc.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/cpumask.h>
@@ -1019,14 +1020,13 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	struct qcom_scm_mem_map_info *mem_to_map;
 	phys_addr_t mem_to_map_phys;
 	phys_addr_t dest_phys;
-	dma_addr_t ptr_phys;
+	phys_addr_t ptr_phys;
 	size_t mem_to_map_sz;
 	size_t dest_sz;
 	size_t src_sz;
 	size_t ptr_sz;
 	int next_vm;
 	__le32 *src;
-	void *ptr;
 	int ret, i, b;
 	u64 srcvm_bits = *srcvm;
 
@@ -1036,10 +1036,13 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	ptr_sz = ALIGN(src_sz, SZ_64) + ALIGN(mem_to_map_sz, SZ_64) +
 			ALIGN(dest_sz, SZ_64);
 
-	ptr = dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_phys, GFP_KERNEL);
+	void *ptr __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+							ptr_sz, GFP_KERNEL);
 	if (!ptr)
 		return -ENOMEM;
 
+	ptr_phys = qcom_tzmem_to_phys(ptr);
+
 	/* Fill source vmid detail */
 	src = ptr;
 	i = 0;
@@ -1068,7 +1071,6 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 
 	ret = __qcom_scm_assign_mem(__scm->dev, mem_to_map_phys, mem_to_map_sz,
 				    ptr_phys, src_sz, dest_phys, dest_sz);
-	dma_free_coherent(__scm->dev, ptr_sz, ptr, ptr_phys);
 	if (ret) {
 		dev_err(__scm->dev,
 			"Assign memory protection call failed %d\n", ret);

-- 
2.43.0


