Return-Path: <linux-arm-msm+bounces-65044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F67B05CAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 15:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AC9F3B4D9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 13:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035FD2E7192;
	Tue, 15 Jul 2025 13:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b="CyUPqMmX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CF72E3364;
	Tue, 15 Jul 2025 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752586012; cv=pass; b=U+uIEf/Znmu1BjKSIEGgCHrsTyNgBBz5wOsqDbAY7FlBq7/rX6B98UPGcXvZQTzXSR4bqS9CfllEQfxYv5xBT+aGZt7e+QEH/sNm3cD26lCTGAnnqDt42wK2GsN24ByQqnz/cuk/Wy2sXkf92v9tFTQCpXlyIXdQjWz03pEB30A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752586012; c=relaxed/simple;
	bh=3kV3XK4Oj/NFgw926XIllBN71d9KEP+3WCn+SQ5Oa0U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qPhP/Y1p7ssab2Bu5J2FAbRtPwNNzoGptpAS4ETw+AjAer4PRbJuQaS7RYTKM4JHb//0A7UJmbBPj5/S3je0vESgZCD9kpCGlEVKi7ND/LsQn0HCynUSR2a7hBKh9IC/KjL5/gCpTEZlZmDzHnhxd+wNOC20k1bhoYiqgcF5ru8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=usama.anjum@collabora.com header.b=CyUPqMmX; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1752585914; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=As7fPfOdRy6Kcm4Y/vwNxdgIzeHGVQxX8kS4/1ZTQSteNGjDiKGzejCMh8iCzxis3Ud/6RgaTgu8EQ7Oj8c6QSOMByabJH4rpKt+RGAdU/twOdTbdyEUEMRHhKHt2xzxHFDzZYZAd8nKWeKamabZjSJXbPQRzMDopkWMp6/5wLg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752585914; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=P0+2t2yk4whi7yM40d6rNBhp8wlUr7VSL4U50D3zsIo=; 
	b=WgBMU5fpQCBFiZjTieTIpx1OjPUn0Tqd3T0dvErB0DdKYGMFJvixPVtDsPRNrWXYqMC0JfEcwdpp0JJE/dMVCwZEjOzR/p/F7xSb6S+ppKcbpgN6yjPp9ffKeiIh/iBvbhur85uR5JzjKeikF9i5E3N+SsynamQbP5px3zURhvA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752585914;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=P0+2t2yk4whi7yM40d6rNBhp8wlUr7VSL4U50D3zsIo=;
	b=CyUPqMmXADK9mIMg7Ao3abWEy+a+YpBB02dmhd9mFfSjS29TOAevA2UI8Ig6HcEE
	SBo8ZTvIiCxFVQSiNMu+wVHSTlnF5XmorFAFs+2+SjOGWZG3y7X/AEtvyz+qIcYQN8z
	k0eTKcCiQOOIwadtydntEvW2DuZI3i2Qb1qzgiZ0=
Received: by mx.zohomail.com with SMTPS id 175258591140265.3635130996754;
	Tue, 15 Jul 2025 06:25:11 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Youssef Samir <quic_yabdulra@quicinc.com>,
	Matthew Leung <quic_mattleun@quicinc.com>,
	Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Kunwu Chan <chentao@kylinos.cn>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Yan Zhen <yanzhen@vivo.com>,
	Sujeev Dias <sdias@codeaurora.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Siddartha Mohanadoss <smohanad@codeaurora.org>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: kernel@collabora.com
Subject: [PATCH v2 0/3] bus: mhi: keep dma buffers through suspend/hibernation cycles
Date: Tue, 15 Jul 2025 18:25:06 +0500
Message-Id: <20250715132509.2643305-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

When there is memory pressure during resume and no DMA memory is
available, the ath11k driver fails to resume. The driver currently
frees its DMA memory during suspend or hibernate, and attempts to
re-allocate it during resume. However, if the DMA memory has been
consumed by other software in the meantime, these allocations can
fail, leading to critical failures in the WiFi driver. It has been
reported [1].

Although I have recently fixed several instances [2] [3] to ensure
DMA memory is not freed once allocated, we continue to receive
reports of new failures.

In this series, 3 more such cases are being fixed. There are still
some cases which I'm trying to fix. They can be discussed separately.

[1] https://lore.kernel.org/all/ead32f5b-730a-4b81-b38f-93d822f990c6@collabora.com
[2] https://lore.kernel.org/all/20250428080242.466901-1-usama.anjum@collabora.com
[3] https://lore.kernel.org/all/20250516184952.878726-1-usama.anjum@collabora.com

Muhammad Usama Anjum (3):
  bus: mhi: host: keep bhi buffer through suspend cycle
  bus: mhi: host: keep bhie buffer through suspend cycle
  bus: mhi: keep device context through suspend cycles

 drivers/bus/mhi/host/boot.c     | 44 ++++++++++++++++++++-------------
 drivers/bus/mhi/host/init.c     | 41 ++++++++++++++++++++++++++----
 drivers/bus/mhi/host/internal.h |  2 ++
 include/linux/mhi.h             |  2 ++
 4 files changed, 67 insertions(+), 22 deletions(-)

-- 
2.39.5


