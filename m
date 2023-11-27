Return-Path: <linux-arm-msm+bounces-2079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D3B7F9FEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 13:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4117B20DFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 12:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167961EA7A;
	Mon, 27 Nov 2023 12:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lZ6cKU83"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87680D59
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 04:46:12 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-423a9cb7e80so8292471cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 04:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701089171; x=1701693971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0WeQVv6xDz1fA7FB+siaDKsF7jHm7RdEkvM6+sXcAk=;
        b=lZ6cKU83Ln+yT/quD7SMkjuwFY3qBG0aTEJS0eDJLPc+z7f10ZTOE9BTw5yPQsMu4B
         KjA05E+EIQ82KNtEcJ36VDnA78Sz+Pel8lJ1fOAw2dqzaNyxD2Uwfmot7VKOl8WwAtVC
         vWol2mFYS1sLZKRoplGwX7i4y+wYwYshYesxG7U/3G8fh+5x7vd33LULhwf8G9yXYGXv
         cJBGctkrKlqBTw0i2lrLUeQ4/sLTHFND19X7Nv+BzbZpvQ7UsNSfS/lLZd63BYfDszcW
         MLQw4nTqae/FSEK5EarttPP5YNwtAbXJckpVIq/bVSAddd5zD2r87JsLLJk4PeJ7sQG6
         2XQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089171; x=1701693971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0WeQVv6xDz1fA7FB+siaDKsF7jHm7RdEkvM6+sXcAk=;
        b=TCvn6IVOTYOeEpkIhaDUul5m3bFeCuXKO2F3HfD1KdRP3NxGq3Nt1su36+Ip/O5CRz
         QHJ365rpjzWxHkBIi5V6ZtGuqiQvMf8FY+FD4+yTjwRVs1WHTJf0MQZxva5RGyrSQVPA
         BOjCmTCG6MYm/InA3UGq40EnTuzwerJHiqjdHuimwkB17Jznz0xmDHmcwTZyn01jmJJl
         YVUjkj+H3LDK/LnL+ThEjviALprFlBTSxw7wIg+nmhV0kbe+1YYp9RgU8B7T93CHOx5q
         nmJ8iCyWIZSSfwCT0PJU5ZH5wzE7fwIYNmqhsMbRqa5iVB1twjItekNpiihjcYrVzAkR
         zqQg==
X-Gm-Message-State: AOJu0Yy65i20r0xt4Im/OMXBaFKVhVYmsvCrQcbeVavaoO6l4d4AIKqM
	7cPkX6tctuBFgp6vlPAQWF3F
X-Google-Smtp-Source: AGHT+IERxAcM9ld/cVONnYwD9Qw8esi9QM+/QvFXWK+aoyDNWVgo9aOd0jymm0Z4uVeT5EbnhzFY6g==
X-Received: by 2002:a05:6214:469b:b0:67a:35f3:4408 with SMTP id or27-20020a056214469b00b0067a35f34408mr9911296qvb.31.1701089170905;
        Mon, 27 Nov 2023 04:46:10 -0800 (PST)
Received: from localhost.localdomain ([117.213.103.241])
        by smtp.gmail.com with ESMTPSA id er10-20020a056214190a00b0067a204b4688sm2832231qvb.18.2023.11.27.04.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 04:46:10 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com
Cc: kishon@kernel.org,
	bhelgaas@google.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 6/9] PCI: epf-mhi: Enable MHI async read/write support
Date: Mon, 27 Nov 2023 18:15:26 +0530
Message-Id: <20231127124529.78203-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
References: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that both eDMA and iATU are prepared to support async transfer, let's
enable MHI async read/write by supplying the relevant callbacks.

In the absence of eDMA, iATU will be used for both sync and async
operations.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 3d09a37e5f7c..d3d6a1054036 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -766,12 +766,13 @@ static int pci_epf_mhi_link_up(struct pci_epf *epf)
 	mhi_cntrl->raise_irq = pci_epf_mhi_raise_irq;
 	mhi_cntrl->alloc_map = pci_epf_mhi_alloc_map;
 	mhi_cntrl->unmap_free = pci_epf_mhi_unmap_free;
+	mhi_cntrl->read_sync = mhi_cntrl->read_async = pci_epf_mhi_iatu_read;
+	mhi_cntrl->write_sync = mhi_cntrl->write_async = pci_epf_mhi_iatu_write;
 	if (info->flags & MHI_EPF_USE_DMA) {
 		mhi_cntrl->read_sync = pci_epf_mhi_edma_read;
 		mhi_cntrl->write_sync = pci_epf_mhi_edma_write;
-	} else {
-		mhi_cntrl->read_sync = pci_epf_mhi_iatu_read;
-		mhi_cntrl->write_sync = pci_epf_mhi_iatu_write;
+		mhi_cntrl->read_async = pci_epf_mhi_edma_read_async;
+		mhi_cntrl->write_async = pci_epf_mhi_edma_write_async;
 	}
 
 	/* Register the MHI EP controller */
-- 
2.25.1


