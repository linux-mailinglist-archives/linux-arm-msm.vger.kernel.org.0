Return-Path: <linux-arm-msm+bounces-57725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BD3AB591C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 17:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBAFE19E4BE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 15:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D03129E07C;
	Tue, 13 May 2025 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uQDD5Qza"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1BA1C8632;
	Tue, 13 May 2025 15:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151576; cv=none; b=Hsb10Rr1P7sy1QJjPYeYGWrOVyBC4knc6kk+Qu+X20kTG8E4VycdxLEyU9FYMdrlaPqsiUayR6U6C0yVxLxkflyb/fsPKlO6Lfitp8H8wdj+riUNfWfrZ4ReBmBFXxLJyraOPMD66KvX4ZzXtsVpexaIwRHzoVMu5c987k78+Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151576; c=relaxed/simple;
	bh=v2B2sJq6WJ3s/RGL6l6vpiYq55R11ku6FNcj8XhDOYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uG66reE/LeEj86dlnwXVJ/p0xvSG/QabdA4jG0VhqDBdcyWj7qRuQoPQkk2N4CQS9Ugb2sOx+mI6aQh7d96HHYjkx8ThUl8WjZUBz+lvleaV4gZYDVFN7Ujvj5g0VTq87NYVHazaULg8ecPpIJuIF/LpK1WhUS9H0/f8u9YEmfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uQDD5Qza; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64A6C4CEE4;
	Tue, 13 May 2025 15:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747151573;
	bh=v2B2sJq6WJ3s/RGL6l6vpiYq55R11ku6FNcj8XhDOYs=;
	h=From:Date:Subject:To:Cc:From;
	b=uQDD5QzaGwY38/mORsML5hTD7ymUJRSi82cObZr1bNoKvEZxE64MKQ6PLjprwLvqG
	 W519cOT031KL/YijYCQjQVSP7FtG4rAD4Gi/FDQMYNLfWHBRvkLJjGVJlL5eDn3TjS
	 tVPocVDgIq177HUzzQjBeGkCMEAWjRVoZAABqxCE7YDxSaIW2+bNp5Defsxfu1nnW3
	 a5WQzdePTeTEp5S1X5r6NYnLiXDr5Okc/geq9hM871xkUhr6Hw0BOaBfhSLLFqEMTB
	 6UyBTxagLXo/J+A8tT+k2siXHBjweU7NV2aqhOkKMNbXX+p0Nt3Tg47e5ts4CuoGTO
	 RyvG4hcVrc1MQ==
From: Bjorn Andersson <andersson@kernel.org>
Date: Tue, 13 May 2025 16:52:46 +0100
Subject: [PATCH] Revert "remoteproc: core: Clear table_sz when
 rproc_shutdown"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-revert-rproc-table-sz-v1-1-a8c6b5d6f8a7@kernel.org>
X-B4-Tracking: v=1; b=H4sIAM1qI2gC/x2M0QpAQBQFf0X32S2WpfyKPKx1cEvoriTy7zaPU
 zPzUIAKAjXJQ4pTgmxrhDxNyM9uncAyRCaTGZvZvOAoQQ/WXTfPh+sXcLjZFvCjKWtTOVBsd8U
 o1/9tu/f9ALoYlfxnAAAA
X-Change-ID: 20250513-revert-rproc-table-sz-53ecf24726ae
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.14.2

Clearing the table_sz on cleanup seemed reasonable, but further
discussions concluded that this merely working around the issue
and that the fix is incomplete.

As such, revert commit efdde3d73ab2 ("remoteproc: core: Clear table_sz
when rproc_shutdown") to avoid carrying a partial fix.

Signed-off-by: Bjorn Andersson <andersson@kernel.org>
---
 drivers/remoteproc/remoteproc_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 48d146e1fa560397c11eeb8f824ae0fb844a022b..81b2ccf988e852ac79cee375c7e3f118c2a4b41a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2025,7 +2025,6 @@ int rproc_shutdown(struct rproc *rproc)
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
-	rproc->table_sz = 0;
 out:
 	mutex_unlock(&rproc->lock);
 	return ret;

---
base-commit: aa94665adc28f3fdc3de2979ac1e98bae961d6ca
change-id: 20250513-revert-rproc-table-sz-53ecf24726ae

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


