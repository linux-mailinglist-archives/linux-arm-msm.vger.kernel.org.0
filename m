Return-Path: <linux-arm-msm+bounces-77695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29673BE6E16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 09:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B65DB1A62153
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 07:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC172222C4;
	Fri, 17 Oct 2025 07:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="smX0nXXb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93F62882CF;
	Fri, 17 Oct 2025 07:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760684825; cv=none; b=ZBhnNv+pBWIC9j8Oc5gCd/04njzAsP/tLoheoDNoo5FaivnsxQWSor4oyoNlVwHEyi3HmimCuE2PwFlQls+2NVBkJ2uWdyQvOxi9xnZtRO3vyltk9PmBiF9qGBdxzxz/xWaZHVJP1BOH+/qfGFAkVTvrmFNDpjjT/RlfQ/zFyek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760684825; c=relaxed/simple;
	bh=xBh1R3UthDEmxmkM8IMXCgp+M1OFHkv/MTrcimlOEDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RJi0T4QyiPlLL7YN/eWl6t0gtnyB73+vrklVkvCfmbtMhKBskWBbQbzUKBt2hKIXm2BeYI5saxFB3FkSmh0BrkxQykLEAYSuGa+CgJVYOodzmiILUYRSqsA7rCiwYgE5C6djH6hOtoeyj/5J1AMXkzWmffDW5tm1XCKE0Ntn/4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=smX0nXXb; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=vy03HBxcOKZ1/JJzbpc0jDLnVA41ktEh3OYdHPxBGuY=; b=smX0nXXbiOm8leylrnmbwToSK2
	LOzDEp94Q4H2wKC6xxHgPugiFRdIDOc3kPdsFzXtBzYxwDiUCJVNfolCnl0jXpRIt5pT8ao5y5T2E
	misgK3OX/amIMCmBSG/xTV4geCqgVYRKmC4AuYY1gcNq5H+/xjVKfhR6fDVg8tVC+i7K03RpsFjF4
	xTkpivFwSkle2c2MeMvaarfBFZDUx4PGQ/xXFo88KumG4nTiQpm439Reh/rXAtpqzGhbE5sBjBqvv
	qS88FTlQ+tupyL1majtv2lXcvVOI67H4p0xEt25GBRyvQuXtPim0UOxLd6BL7SIGYlEbeztDFDv9Y
	Ay996eyQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eYJ-00000006viL-2AdD;
	Fri, 17 Oct 2025 07:07:03 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] firmware: qcom: tzmem: area: fix qcom_tzmem_policy kernel-doc
Date: Fri, 17 Oct 2025 00:07:02 -0700
Message-ID: <20251017070702.1637092-1-rdunlap@infradead.org>
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
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
---
 include/linux/firmware/qcom/qcom_tzmem.h |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

--- linux-next-20251016.orig/include/linux/firmware/qcom/qcom_tzmem.h
+++ linux-next-20251016/include/linux/firmware/qcom/qcom_tzmem.h
@@ -17,11 +17,17 @@ struct qcom_tzmem_pool;
  * enum qcom_tzmem_policy - Policy for pool growth.
  */
 enum qcom_tzmem_policy {
-	/**< Static pool, never grow above initial size. */
+	/**
+	 * @QCOM_TZMEM_POLICY_STATIC: Static pool,
+	 * never grow above initial size. */
 	QCOM_TZMEM_POLICY_STATIC = 1,
-	/**< When out of memory, add increment * current size of memory. */
+	/**
+	 * @QCOM_TZMEM_POLICY_MULTIPLIER: When out of memory,
+	 * add increment * current size of memory. */
 	QCOM_TZMEM_POLICY_MULTIPLIER,
-	/**< When out of memory add as much as is needed until max_size. */
+	/**
+	 * @QCOM_TZMEM_POLICY_ON_DEMAND: When out of memory
+	 * add as much as is needed until max_size. */
 	QCOM_TZMEM_POLICY_ON_DEMAND,
 };
 

