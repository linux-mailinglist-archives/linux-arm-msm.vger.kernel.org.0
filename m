Return-Path: <linux-arm-msm+bounces-45270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 449FCA13B2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 14:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B6E3188BE4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 13:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A49A142900;
	Thu, 16 Jan 2025 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tHgIXJ+R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1D922ACD4
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 13:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737035485; cv=none; b=Vx5ZmKJviR4plpnD36XveddseAoIflpQ8Eb1tvwIapFoBTTKponxHDV3yElT2XkiTk0hfpJB2qiPHHDdsaWLYA991qO5OL5b0aCon8lbYZDe6gM/smhDEQf2Etw+5UoGcutGm5Cp1PIjZvsAMuDjwmiDvnQvbBYOIjNi0m/bZXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737035485; c=relaxed/simple;
	bh=4uuXXMls8114LWh45Vhuuj5GpluyhflqvtpAwRLCiZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bgi93NoieCedOz01TImoYEErFvCUg9+IzgbU5BDb2aDtJTIEZboPeSVYi5Ax0otACqhh612njouqjYAXdAaAtchHEqlDbm1vN4to8Fy7wBQUC7XkCFU1p+k0NmZkrvCouY11o//HuhZa5gpG3Xntz7u6/6pzexFSFDlBibWPKWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tHgIXJ+R; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so1305208a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 05:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737035483; x=1737640283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuraTNV/U058me9OXCx94wz8W+2D2JAwEjqocWrvvU4=;
        b=tHgIXJ+RhgWyKWeULH9vC47wnwv+66RYejsTNU2TQYn6YulkcMg4FRaHz1ALBidFz6
         8AVSJBLHxe5oamim63jjGTHcfHcVCKyTSpwzjPJkKpDOEMnsHQ2Kle1Xy5Zqush55fjH
         j6mkm2vvGlOfJGT72ur9oVm4iyNNfd2SgFhoLBHQ63c5tGtI90Iptv4jgeHCMlPtIRqB
         qu98fKnvu5W3uZhRVUeS/Gyt/o7zIF15cbC0YvTGyC/gfMlLum/6bzMO0BtaeLCKkaoJ
         EIbBTolFLLba30SenWzfHYQ4DIWv1HCDeQ+WjjGUytO8sRHLw/c1EA8u/X0C9iWXn4cQ
         /X5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737035483; x=1737640283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DuraTNV/U058me9OXCx94wz8W+2D2JAwEjqocWrvvU4=;
        b=I4fNlSHtlMBd3RTJJ1GUDuovQJB5AdOZ4ayER9a8VoN565r2F75d5rYcqO35NNPF0t
         hDOH207pgcirdpknfGi+BmpFq1hA8zk7gxrjq/qSDpGS1NG6hQb06NIdypf8NfOrVmUQ
         ej3yStDAXLHnO/hgUo4y0Y19+VerslP8r1qGcf17GOeBOlmjV9vjhGQ9oxZqYtE9sbzf
         0HSGOjC4/jfsCrFvPEvIEyhKAOq5O2XNeuDKjKayY5vvSoF/sAK7aKVEuUT8EEMQLolO
         Wr6Fjv3VPy/67LMXL1u7wEW/oNbM1yYgMMmzAEtGxodTjFFRBtJY++LQ3W0m09ts9pLG
         eEKA==
X-Forwarded-Encrypted: i=1; AJvYcCUlkmlsdnWqxt7n9dMq3rp8OeMZs08UlCGaURVxfYDK3y2qrtoikzgymCzF1n5I6w3zkrVZ4xunTVtzb2SN@vger.kernel.org
X-Gm-Message-State: AOJu0YxpN73RhAcHmibs6BHjop0qGjJUh+hWyNxjARnLNB339Km5LU+w
	xKseR67+1udivt3SMXdDZwBZyTUWKIqmG+0uvVrio9nAXYSW/PUs/Uslrn2s1w==
X-Gm-Gg: ASbGnctBMB/wUejf7PEF4LCqQIyo6jEvnh+4ZX/ZpUDNEy3DoyFcmJ10WSQm9bCadSc
	w0gwByF0V0O6ukxmn4gEHAZyfvKXZ3t4Zf7bPTzi9De2mC5y75fjoM47f1ruteCR1L+ewGD2PQV
	6q9PrLqGHEOgjzjVuiidKWMS6yZyEvW4wKSpoaufbXjoBIKjLOGXPgd+p5h7GrmHNFs9kbMypna
	lhRn5gueOI1XJfykptFrNaoxCKOvTSQKuy0IMGFxKjS8KMQFjIiMRaphmaFvFxVr7mB453AsFD/
	aYNu7Zj3
X-Google-Smtp-Source: AGHT+IHmaGQZNbO8JtgXuwbUObwC7YFWTkj6AMiRO/klNtQ/UWZdvAYSXN4Noy4pr3wn0/p+IsYVIQ==
X-Received: by 2002:a17:90b:520e:b0:2ef:67c2:4030 with SMTP id 98e67ed59e1d1-2f548f4ea90mr45589561a91.27.1737035482828;
        Thu, 16 Jan 2025 05:51:22 -0800 (PST)
Received: from localhost.localdomain ([120.60.79.208])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c1cba9csm3341229a91.24.2025.01.16.05.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 05:51:22 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kw@linux.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	lpieralisi@kernel.org,
	shuah@kernel.org
Cc: kishon@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhelgaas@google.com,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	linux-kselftest@vger.kernel.org,
	cassel@kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 1/4] PCI: endpoint: pci-epf-test: Fix the check for DMA MEMCPY test
Date: Thu, 16 Jan 2025 19:21:03 +0530
Message-Id: <20250116135106.19143-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250116135106.19143-1-manivannan.sadhasivam@linaro.org>
References: <20250116135106.19143-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, if DMA MEMCPY test is requested by the host, and if the endpoint
DMA controller supports DMA_PRIVATE, the test will fail. This is not
correct since there is no check for DMA_MEMCPY capability and the DMA
controller can support both DMA_PRIVATE and DMA_MEMCPY.

So fix the check and also reword the error message.

Reported-by: Niklas Cassel <cassel@kernel.org>
Closes: https://lore.kernel.org/linux-pci/Z3QtEihbiKIGogWA@ryzen
Fixes: 8353813c88ef ("PCI: endpoint: Enable DMA tests for endpoints with DMA capabilities")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index ffb534a8e50a..b94e205ae10b 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -331,8 +331,8 @@ static void pci_epf_test_copy(struct pci_epf_test *epf_test,
 	void *copy_buf = NULL, *buf;
 
 	if (reg->flags & FLAG_USE_DMA) {
-		if (epf_test->dma_private) {
-			dev_err(dev, "Cannot transfer data using DMA\n");
+		if (!dma_has_cap(DMA_MEMCPY, epf_test->dma_chan_tx->device->cap_mask)) {
+			dev_err(dev, "DMA controller doesn't support MEMCPY\n");
 			ret = -EINVAL;
 			goto set_status;
 		}
-- 
2.25.1


