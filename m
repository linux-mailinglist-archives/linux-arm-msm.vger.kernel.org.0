Return-Path: <linux-arm-msm+bounces-2076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8CC7F9FE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 13:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 819FD280F89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 12:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2574818E14;
	Mon, 27 Nov 2023 12:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RuXvUBGA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E19182
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 04:45:58 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6d81faeefc4so737846a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 04:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701089157; x=1701693957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah8iq1Txz+5feKQ56aPHrEDMCkBylT8O2PmEcpgbM28=;
        b=RuXvUBGAKjjtt2WFuHTMGCEakadqjzI5hBbsshSwCsGVPxJUrrRoHPAwEoQNbE+mn2
         0PE1tUs8o4ndBJ0Aq1vSJB2DEJu9+7YBMEPXL3LTCE4gYvrQ7ZGr2VHsfueiohs3kzN8
         YkL9FYSepfSdRNlek8TI2UsJVIJG1HOWwSb1rLZEqtAdaimu0qMRzylJ29AABlUTDVW4
         /VdgPlb5Y9GO2q0A5Kpg9oRfjmn9dODyckzwxhlLgdZEB1+XeaKbQOSSeyFhn4du3vEY
         /Uf/QIa363jhYvqLHtARPTEjx/uzFW58k0axdx1I0U/zSargvJ9fjAymQWIRxZtMOg3b
         RAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089157; x=1701693957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ah8iq1Txz+5feKQ56aPHrEDMCkBylT8O2PmEcpgbM28=;
        b=IOASeHjmtb/a8/crywc51sP+XHDjLCaQVIC2x/FSZEdMKiz4/Hd0EMRpAHpFjnezro
         Jx8BHbIUAaxG2tf7RubuC7m6UPInb57hGNZv55SMyOp3NxhPK2TXKdtce8x9KwisaS+A
         KkeVc3oDdYUXA5ZLjHUzIWPGH6Ztg0krSdBBoyau3taSzU65EyARtZyef6p05OYSPJL1
         vOjFYVA9COsRd80tU5J5yPnnp26xOr61U8tp2qkf4k/MdyW/ZrsxtTE1fesLquQAdIN8
         nXX/VuRzV1KnwI+ioOpycWhXpoFmlRQEFYrVWhrgfUJxC+VMXmTjouoUvoKsMyiczi6K
         rx6w==
X-Gm-Message-State: AOJu0YyI3q7gWv5QOkZgDD59FuVsIp12TC3WZlJdlkc7gLU1GRFE9AW5
	2T/hlpld+PgVLDjEgaNNcj/8
X-Google-Smtp-Source: AGHT+IG8yTjpBWVehWRL+B7ZcIXrUSuHpjOgGUeYzRMY3Yi+8iNrXtu1MquzIqT++f3DfkvIy4QlUQ==
X-Received: by 2002:a9d:7d96:0:b0:6d7:f8c1:e473 with SMTP id j22-20020a9d7d96000000b006d7f8c1e473mr14360011otn.19.1701089157632;
        Mon, 27 Nov 2023 04:45:57 -0800 (PST)
Received: from localhost.localdomain ([117.213.103.241])
        by smtp.gmail.com with ESMTPSA id er10-20020a056214190a00b0067a204b4688sm2832231qvb.18.2023.11.27.04.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 04:45:57 -0800 (PST)
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
Subject: [PATCH 3/9] bus: mhi: ep: Introduce async read/write callbacks
Date: Mon, 27 Nov 2023 18:15:23 +0530
Message-Id: <20231127124529.78203-4-manivannan.sadhasivam@linaro.org>
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

These callbacks can be implemented by the controller drivers to perform
async read/write operation that increases the throughput.

For aiding the async operation, a completion callback is also introduced.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 include/linux/mhi_ep.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index b96b543bf2f6..14c6e8d3f573 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -54,11 +54,16 @@ struct mhi_ep_db_info {
  * @dev_addr: Address of the buffer in endpoint
  * @host_addr: Address of the bufffer in host
  * @size: Size of the buffer
+ * @cb: Callback to be executed by controller drivers after transfer completion (async)
+ * @cb_buf: Opaque buffer to be passed to the callback
  */
 struct mhi_ep_buf_info {
 	void *dev_addr;
 	u64 host_addr;
 	size_t size;
+
+	void (*cb)(struct mhi_ep_buf_info *buf_info);
+	void *cb_buf;
 };
 
 /**
@@ -96,6 +101,8 @@ struct mhi_ep_buf_info {
  * @unmap_free: CB function to unmap and free the allocated memory in endpoint for storing host context
  * @read_sync: CB function for reading from host memory synchronously
  * @write_sync: CB function for writing to host memory synchronously
+ * @read_async: CB function for reading from host memory asynchronously
+ * @write_async: CB function for writing to host memory asynchronously
  * @mhi_state: MHI Endpoint state
  * @max_chan: Maximum channels supported by the endpoint controller
  * @mru: MRU (Maximum Receive Unit) value of the endpoint controller
@@ -151,6 +158,8 @@ struct mhi_ep_cntrl {
 			   void __iomem *virt, size_t size);
 	int (*read_sync)(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_buf_info *buf_info);
 	int (*write_sync)(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_buf_info *buf_info);
+	int (*read_async)(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_buf_info *buf_info);
+	int (*write_async)(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_buf_info *buf_info);
 
 	enum mhi_state mhi_state;
 
-- 
2.25.1


