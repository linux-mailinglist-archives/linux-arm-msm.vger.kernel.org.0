Return-Path: <linux-arm-msm+bounces-2077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 738897F9FE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 13:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EACC280C8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 12:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A7318E11;
	Mon, 27 Nov 2023 12:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VAGhosd+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E795BD59
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 04:46:02 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-67a094a59c6so20011796d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 04:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701089162; x=1701693962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szORryW2l9J0pCg1kQG3OS6E1waFAt6BYGHK4qsw87M=;
        b=VAGhosd+z4xCejRdQEfPTtAgYbU0nVPbLa8Nq4RJjBNaj79B97hgFMQkObjHlqGfcr
         Znpb7txSt7DOV0k+R+G0cGz1HtkIuUJFIxd8VwpJrWG9rJul8rprB19xwhcyyAP1SxAq
         aDnUoo7auy4+MM78SavGy4XVDMpSo0ExF5M5R7nPY5ooj6+MqhR2IKb/oMz2hqx3mATW
         sa7P5U1ZougXN6WWfVXrwNnITBEIg5TaQoEGr40P+jUtjmV8merK8RhOrZ34/zQMhKjw
         2KtYHfkU1rQR8KtaLmPNWZGqSkgNzXoYm8LBAPzPSZRXPE7G8P8S5opVdC9G9ozna4Ur
         K83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089162; x=1701693962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szORryW2l9J0pCg1kQG3OS6E1waFAt6BYGHK4qsw87M=;
        b=OkV0fOd8oIiAE1xnpj2rMo8Se1qN9myixYg4CpuaB3lIOJlLiTh8w24Ne7JlIZDji+
         bljpazQQFvbYzjXkWtjNBZWqjTmKfeOUUhwsrpe2f1CSahNTUxHKrxR1EdY+VzI22qoN
         n8NjWf4jQxjZoLN5Uqga0qUeHDUu2xh5OoAVBDjtTWGYnQxqaKbqv/No+QZGr5zvTF/+
         UcLlHD4n91pcgOBgAsAJnw8hn45KsVwfCyoab1L+tC3EMJYt1dSWeALX/YcpJ2NMox32
         eIRSezOy+P/+g3RiPhBPC0t5lCXsHWdLO95vgFLOXcox7LiEUMl6uwc7c36eqYVw1Mf/
         YtgQ==
X-Gm-Message-State: AOJu0YzlLiwQQV4YnFZXnVn024/aGMPq1Q/fITUXh0bsgMDCCbPlyanW
	r8G8s7mun9Ay6AjAEV34xiT1
X-Google-Smtp-Source: AGHT+IGNZ+5w8hg9MvVkI8DO0QPnjtjCxvmdxlHAK2q1lIEDQmZD7Ge/AJWS0HSg8+MEFEMaOLLfag==
X-Received: by 2002:a05:6214:5596:b0:67a:191f:2872 with SMTP id mi22-20020a056214559600b0067a191f2872mr12122455qvb.11.1701089162091;
        Mon, 27 Nov 2023 04:46:02 -0800 (PST)
Received: from localhost.localdomain ([117.213.103.241])
        by smtp.gmail.com with ESMTPSA id er10-20020a056214190a00b0067a204b4688sm2832231qvb.18.2023.11.27.04.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 04:46:01 -0800 (PST)
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
Subject: [PATCH 4/9] PCI: epf-mhi: Simulate async read/write using iATU
Date: Mon, 27 Nov 2023 18:15:24 +0530
Message-Id: <20231127124529.78203-5-manivannan.sadhasivam@linaro.org>
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

Even though iATU only supports synchronous read/write, the MHI stack may
call async read/write callbacks without knowing the limitations of the
controller driver. So in order to maintain compatibility, let's simulate
async read/write operation with iATU by invoking the completion callback
after memcpy.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 34e7191f9508..7214f4da733b 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -234,6 +234,9 @@ static int pci_epf_mhi_iatu_read(struct mhi_ep_cntrl *mhi_cntrl,
 
 	mutex_unlock(&epf_mhi->lock);
 
+	if (buf_info->cb)
+		buf_info->cb(buf_info);
+
 	return 0;
 }
 
@@ -262,6 +265,9 @@ static int pci_epf_mhi_iatu_write(struct mhi_ep_cntrl *mhi_cntrl,
 
 	mutex_unlock(&epf_mhi->lock);
 
+	if (buf_info->cb)
+		buf_info->cb(buf_info);
+
 	return 0;
 }
 
-- 
2.25.1


