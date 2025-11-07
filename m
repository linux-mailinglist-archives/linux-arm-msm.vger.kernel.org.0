Return-Path: <linux-arm-msm+bounces-80786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC440C40659
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 15:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 81B9C4E1807
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 14:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F48329C7A;
	Fri,  7 Nov 2025 14:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UPdH/4Dw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D65329E63
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 14:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762525734; cv=none; b=Pec9tHI+sMzqgkHg0WgWmpLYcKbFRU3Ytyx/m+Oc35Y0mCIOjmvk8CSqrw4SHhnw5hUrx8+RiX5fohHpAq/ZJBQLr+AoSnm9fnxagHSZulxpjf3g0cl5YC9IJcEZD/DxlbOPikQT5QPbDFxnEBgFgiAE9kxPgMRbsNUPTWxuKhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762525734; c=relaxed/simple;
	bh=3BhTKLrt8Wvihg8vp8choQ0z6FtpnObNcCgY0g7rt6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qblMbHDavkVZ16f0PjOyOsbBEnqi5tqk0UqBFUC8ClkBe4JA1Zq3SCEdHC+wfoVpU95ifRBwb0d/pwFqFVfgv+pWADPp1QdTpzZSNV2w6sXgVx5r0/pyvmFjJw695AzdA6eQ9euGgeBFADyng8PBs9Cn7gglthxlMTA/WIjUPkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UPdH/4Dw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4711b95226dso8155645e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 06:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762525730; x=1763130530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tcbvvRs2xvl1u3FoZnWA9K4Q8QMEKWU1ON5YmKljc6k=;
        b=UPdH/4DwWdOBXzrhJR7At9cVPp7MoA5VMbzwNkD1qCgMeXlLmjtkIGcD0dCaw4rc5r
         U6daQOi2XupGPYhNYGcgtsKqenR2uzQugDAjcEeXBlh6IYDanL6R4M5sqLHOJyKgaCBh
         2zf0TrJ6+u1KUBqU+om3tEV6u+oyP9y2qypBvReywd6h5ad6lMSbOCMZoCz2tp6lM957
         5uejcsMQXepXY/F7BK4A25sAWCChtmILtmdgrp0X8ZT4rnJPtf2dbaHSfW/Jk0sIXHmD
         poAuIJb0nwbDhuMLP79i5lhV/z3e+K+JZFt/Wsyg7QMYK6UszNRnBjupqAqFSHiRo808
         2kWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762525730; x=1763130530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcbvvRs2xvl1u3FoZnWA9K4Q8QMEKWU1ON5YmKljc6k=;
        b=petZ8+LJPx/YNeS1W9OXWB3wRwKr2Pkw82DxP2Sqah5pbyNbapCoueyHjhqKx3vmGH
         owG4Uxx6BYEmq38xodVT3p/3QX0gZVTAw/dCAWyqAivBJ4U65Ui0dfmuYpu74l0qrcca
         RKcLQ2u1R7Jxwl3lJTOrJV7nsbMfSqPza4VrZf/AHw5QadBeHXTTyDZk5W7iqOPg3UQg
         lrMAT/kOZdi3hmjaiCi+Z2LgCggMWJIjVLqZMrTfS4c+/XzN3yYgp1xtLA9SZ7PCtstQ
         4TMSqJFwXGMGWy1y9zLWoq+RrGPotiemA+ln5jZekvwfbjvhasbgxnJhYpwOYL8Zp8xB
         fTBA==
X-Forwarded-Encrypted: i=1; AJvYcCWNaBQenSALkGoMtPHrYE7T+xWq+ePTr0hTzkpAo7373OForQpzljttLq65rCg8KnLnn53H2rj4yXlk5dSb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7NM/EbJJu/TF6lXODoFUBT6jam1b/VXIwDdq02np/tDxecSPp
	Qpm0SHwO1+R5WsCvM9yAhxM8ZMf3gx4LRF7CRrwj4NyAAG/SK4rLuUVS8Zm+F3IWKhM=
X-Gm-Gg: ASbGnctwoykV2VBurjDmMJwUWt30ubYwtUpsFu2Opqglh6o2GMoS0NQZLuX/xw3jI3D
	o9QotNyWGeFLaZo2TE19O/X/VNyWtYMw9frvjPaevt+IXuqnCsr/Sl3RpMRB+l07JC/oL1ZrNUB
	Xw0bIWJUfGuk+5LC46ecT9ybIQXDprqtaUwyrLeeguRIEUctmUKZSQFIeQ93nHVuNTp5TmRHq61
	bRLUXPOyfO0VKskiyQwOa6LxitkdUSzoq5QJl3xT+rY/yNWQd2DLi7iyRndsnXQVBypsTHMxJgk
	eVOQw2zd3uAzctRAp0pxAID/1AAxzj0n7tVQH7+VvTWmPa2tPY91TVbvXezS+cfEsqVU0OaRWA7
	CUXkTolJDajXWKPkI5TPbua5VqcrTCi88qA4tRmRvb3wxDJBKcypvJM5YDlqRLHDHKLy3WVBTGy
	+3xU1EgrQ9aEuWthWjQd+QvJGT
X-Google-Smtp-Source: AGHT+IGSUrN/hCHTEKNrK/nAtni+bSccTeEoJLzD46C+Lw2FCkxvsZIT3Eo/AVNFZdrzTW3STsHRog==
X-Received: by 2002:a05:600c:4fd0:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-4776bc886femr28359035e9.4.1762525729708;
        Fri, 07 Nov 2025 06:28:49 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdcc552sm181970865e9.6.2025.11.07.06.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 06:28:49 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Wilczynski <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] PCI: endpoint: epf-mhi: add WQ_PERCPU to alloc_workqueue users
Date: Fri,  7 Nov 2025 15:28:35 +0100
Message-ID: <20251107142835.237636-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistency cannot be addressed without refactoring the API.

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

This change adds a new WQ_PERCPU flag to explicitly request
alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 6643a88c7a0c..27de533f0571 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -686,7 +686,7 @@ static int pci_epf_mhi_dma_init(struct pci_epf_mhi *epf_mhi)
 		goto err_release_tx;
 	}
 
-	epf_mhi->dma_wq = alloc_workqueue("pci_epf_mhi_dma_wq", 0, 0);
+	epf_mhi->dma_wq = alloc_workqueue("pci_epf_mhi_dma_wq", WQ_PERCPU, 0);
 	if (!epf_mhi->dma_wq) {
 		ret = -ENOMEM;
 		goto err_release_rx;
-- 
2.51.1


