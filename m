Return-Path: <linux-arm-msm+bounces-10096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2565984CBC3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 14:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 578711C21BF5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 13:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D27977644;
	Wed,  7 Feb 2024 13:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="dnS/pEGg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1177276C8F;
	Wed,  7 Feb 2024 13:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707313228; cv=none; b=b/S+z4mWVh1T82Ve2yUEUSVy3+R2mW5/DittvhDCu2lEaTmuW/O4ticXkPYox5ZmubOMU0f+td9ugnu6xwP9gBmMdSEGqEw8bTL56QaszsBKstEPdN2LD6DXHVAsuwnAQUHOLZ2GiLW6DVAFSZv4aEQUGHy9tSNr1dUE41SdpFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707313228; c=relaxed/simple;
	bh=KXP8XQgu1vPb7UIBRCAFbCn2XbWBSi9zlPgqvl9ob/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HKVmc58tWiKp6qm3ZPcBjrcG0veBRNalmGLjmRKFGX/iHDaYkTk7ydA5k+Xoo5qlXtKtaZxhpvk0vVRha2DCUG6LmOOk/iv8NTeMKN3Q8P7ACeSc28wuLOPDv55U1jo9Ipyj0ZeXr7ZDILV11tQE25/bMA/LcX+5LWx72H26MHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=dnS/pEGg; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from fpc.intra.ispras.ru (unknown [10.10.165.6])
	by mail.ispras.ru (Postfix) with ESMTPSA id 5CCFA40F1DEF;
	Wed,  7 Feb 2024 13:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 5CCFA40F1DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1707313222;
	bh=oJI2plXYN0CmS62atrDcw/0YXz35BqxpvKCMr0u8TjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dnS/pEGghnu4Oy0O9SuHkrzqgDeZ7i4KRaZNBOgqTCUn9dO2dcYdlm82QgxdXGc8K
	 o828vcRrxI7O4ZgCVoqyFpO+b4RyfvABP6gxgZxUbcp9tMKvpQTRST+NUK8bwLEQbZ
	 XEW14U6grY/0yQn1oj7PgPTPtteWDh9r202FoABA=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	Sujeev Dias <sdias@codeaurora.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Siddartha Mohanadoss <smohanad@codeaurora.org>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH v2] bus: mhi: host: free buffer on error in mhi_alloc_bhie_table
Date: Wed,  7 Feb 2024 16:40:05 +0300
Message-Id: <20240207134005.7515-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <2024020709-familiar-slapping-a96a@gregkh>
References: 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

img_info->mhi_buf should be freed on error path in mhi_alloc_bhie_table().
This error case is rare but still needs to be fixed.

Found by Linux Verification Center (linuxtesting.org).

Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
Cc: stable@vger.kernel.org
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
v2: add missing Cc: stable, as Greg Kroah-Hartman's bot reported

 drivers/bus/mhi/host/boot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index edc0ec5a0933..738dcd11b66f 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -357,6 +357,7 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 	for (--i, --mhi_buf; i >= 0; i--, mhi_buf--)
 		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
 				  mhi_buf->buf, mhi_buf->dma_addr);
+	kfree(img_info->mhi_buf);
 
 error_alloc_mhi_buf:
 	kfree(img_info);
-- 
2.39.2


