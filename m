Return-Path: <linux-arm-msm+bounces-77826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 960B6BEB5E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 21:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49F6E6E66D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 19:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453D62FC01A;
	Fri, 17 Oct 2025 19:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="zMUftkYy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF60E2F6578;
	Fri, 17 Oct 2025 19:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760728406; cv=none; b=WaCKx+04ze9xUjGGH/aVb2ulFwzS57JCKyYONqlONux1s+GR31QoZwAvgzq5pLSK1bLQ+PLeLqpr6ddkA65PJzXe2vGCTXyDjtcLRPnn/f4ZY7brDe2JnU47ehqkT1PpMB2PCij38JmYKV2gzEGBx6kqSC2f6j6Nr76eMe7+LJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760728406; c=relaxed/simple;
	bh=B/4CFFC04kfn/4pF1Lj2pUDWYoWFbC/wxciHoxpXm+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bm1wlL0SXKO16P5bnR5+5u0ZuQAvpMSgoixcT/k0Mp60dli0X/T4qHH5iDbQ47PX/pqXLdrBursq7vCXPwjikIcbC0TkeKzjaL1avSRvTMJ/0UzeCCxXgyL36Xm4VwtWkuUZOzda/7nUUZDi5qaWQuCiEyoJiFnXgya6LVhv+/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=zMUftkYy; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=xe0kaKSEcdc2dfzKa/JwrBqVybeL3nuJ+ho4ZZwcIwg=; b=zMUftkYyjSjwSNr/oKR5/cloHv
	iC3MRgjZm5SLpE0Vf8thT+38qThDL7xs2xCJ15Hnyfp2hsmMZ3GF1N1CG6M7wf4zg8iGasciXVCBL
	XIDsKcBpH0E6/Zhkxnczh/LyC1G2lPS9OcDqsypTpgbix80hF786FC9p+SurBQJwZGps1sILaj/SK
	5TjVrZ5opyxa+OzCOZICbp20ONWC3Bp3LUernE1IY6AoRkuCYKLofx30CcWiEsQm20Ar2jRnV9VqC
	M2NjknvAWgSViz3tFJMoYD8iEo6K+yw3+RlXLWSyhez/klz+0ppArbHRMUIPKHQ3+4mPXLdectK3m
	2E9ZHHzg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ptE-00000008pKs-04K3;
	Fri, 17 Oct 2025 19:13:24 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] firmware: qcom: tzmem: fix qcom_tzmem_policy kernel-doc
Date: Fri, 17 Oct 2025 12:13:23 -0700
Message-ID: <20251017191323.1820167-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix kernel-doc warnings by using correct kernel-doc syntax and
formatting to prevent warnings:

Warning: include/linux/firmware/qcom/qcom_tzmem.h:25 Enum value
 'QCOM_TZMEM_POLICY_STATIC' not described in enum 'qcom_tzmem_policy'
Warning: ../include/linux/firmware/qcom/qcom_tzmem.h:25 Enum value
 'QCOM_TZMEM_POLICY_MULTIPLIER' not described in enum 'qcom_tzmem_policy'
Warning: ../include/linux/firmware/qcom/qcom_tzmem.h:25 Enum value
 'QCOM_TZMEM_POLICY_ON_DEMAND' not described in enum 'qcom_tzmem_policy'

Fixes: 84f5a7b67b61 ("firmware: qcom: add a dedicated TrustZone buffer allocator")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: drop "area:" from Subject.
    Fix kernel-doc comments to have the ending "*/" on a separate line
    by itself. Otherwise scripts/kernel-doc becomes confused and skips
    the enum and the following struct!

Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
---
 include/linux/firmware/qcom/qcom_tzmem.h |   15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

--- linux-next-20251016.orig/include/linux/firmware/qcom/qcom_tzmem.h
+++ linux-next-20251016/include/linux/firmware/qcom/qcom_tzmem.h
@@ -17,11 +17,20 @@ struct qcom_tzmem_pool;
  * enum qcom_tzmem_policy - Policy for pool growth.
  */
 enum qcom_tzmem_policy {
-	/**< Static pool, never grow above initial size. */
+	/**
+	 * @QCOM_TZMEM_POLICY_STATIC: Static pool,
+	 * never grow above initial size.
+	 */
 	QCOM_TZMEM_POLICY_STATIC = 1,
-	/**< When out of memory, add increment * current size of memory. */
+	/**
+	 * @QCOM_TZMEM_POLICY_MULTIPLIER: When out of memory,
+	 * add increment * current size of memory.
+	 */
 	QCOM_TZMEM_POLICY_MULTIPLIER,
-	/**< When out of memory add as much as is needed until max_size. */
+	/**
+	 * @QCOM_TZMEM_POLICY_ON_DEMAND: When out of memory
+	 * add as much as is needed until max_size.
+	 */
 	QCOM_TZMEM_POLICY_ON_DEMAND,
 };
 

