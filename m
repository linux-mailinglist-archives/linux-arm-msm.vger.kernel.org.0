Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08F7C4F313
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2019 03:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbfFVBV4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 21:21:56 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36968 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbfFVBVx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 21:21:53 -0400
Received: by mail-pl1-f193.google.com with SMTP id bh12so3794229plb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2019 18:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UJEwQtJkIZfbBqvjIvCvA/yth1IBpQ7oqB1C3jxXe0M=;
        b=sXkNatyXtejwKy/sxoDXafLPyHSFvYsKIjYJrXbWVlnfp2fH60dwJAkkJtmcS/crTQ
         MId3NLomd4gUBfZ69/4VhTphnIUWc/+aH/CcEN62M55cZCnb+bBrwsRRjyyCtheBOplL
         zGI4m+CPFoWQPYmu3abSRLMlX3ECAWBvaVR0dlZZja4riuJVY9A9CL2tX8o7olfMUqPE
         ZNRd1tmZ6kPcRdTypp2+HXQ+/AJrxcvzze2t5JWH0yRzHBVvv62LkaIAF1zYZ2yDqRz8
         xbkLUMPF+x7QtAxVnl5V6bsd3Y3x76LRsINkTv77aHWuQaE/htUngHdeDzOF5vsmDoqP
         c7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UJEwQtJkIZfbBqvjIvCvA/yth1IBpQ7oqB1C3jxXe0M=;
        b=faTAh30HZYi6Jy0D5eUDPLSIzNgrG7yGEK1c6ZW6q1qbf13gglHSgdQ1cZqOe5MCzx
         RJukH+i32rRdjFULgRABV2FlnybaQw0/von2hyjU5zPyB08ikc98pnZq0+Ll5USGXpKl
         IbIqIgIN+3TdrcObg3XViHC0/MJ1UMPnKrvWsviEY0EijKksng9aX8GjAIxryf4t1ABJ
         QZiuO/Yy5l8SCS8Trb0XmlvF6DJ4muZcXwatZnwUvZlsstPppb+XWgUAvmBkQM2qOE59
         P6AxESR+5+qJbZCEZOxKss2pG09XeUWbyJ2qlN/x1GMoMO/7NFp0j/L/4z2gwNYB3c4e
         JCzQ==
X-Gm-Message-State: APjAAAXgELf3NDw9bfDZkEYTdZ/V7SWTkNZW7iu4RCMS5ETiGCek3X9E
        pngZQ6TBEfXQmwiYI6ZVxUnD4g==
X-Google-Smtp-Source: APXvYqxNa1V4Hk3uu0tW1qtkOcOdw6uFlI+C3zioqKCnf5I01AVdlH5R0Ww6zTdspfoZJfyc8VWGVQ==
X-Received: by 2002:a17:902:aa83:: with SMTP id d3mr110047275plr.74.1561166512481;
        Fri, 21 Jun 2019 18:21:52 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u5sm3539148pgp.19.2019.06.21.18.21.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 18:21:51 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] remoteproc: qcom: q6v5-mss: Support loading non-split images
Date:   Fri, 21 Jun 2019 18:21:46 -0700
Message-Id: <20190622012146.19719-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190622012146.19719-1-bjorn.andersson@linaro.org>
References: <20190622012146.19719-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In some software releases the firmware images are not split up with each
loadable segment in it's own file. Check the size of the loaded firmware
to see if it still contains each segment to be loaded, before falling
back to the split-out segments.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 33 ++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 981581bcdd56..8fcf9d28dd73 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -659,23 +659,29 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 {
 	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
 	dma_addr_t phys;
+	void *metadata;
 	int mdata_perm;
 	int xferop_ret;
+	size_t size;
 	void *ptr;
 	int ret;
 
-	ptr = dma_alloc_attrs(qproc->dev, fw->size, &phys, GFP_KERNEL, dma_attrs);
+	metadata = qcom_mdt_read_metadata(fw, &size);
+	if (IS_ERR(metadata))
+		return PTR_ERR(metadata);
+
+	ptr = dma_alloc_attrs(qproc->dev, size, &phys, GFP_KERNEL, dma_attrs);
 	if (!ptr) {
+		kfree(metadata);
 		dev_err(qproc->dev, "failed to allocate mdt buffer\n");
 		return -ENOMEM;
 	}
 
-	memcpy(ptr, fw->data, fw->size);
+	memcpy(ptr, metadata, size);
 
 	/* Hypervisor mapping to access metadata by modem */
 	mdata_perm = BIT(QCOM_SCM_VMID_HLOS);
-	ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm,
-				      true, phys, fw->size);
+	ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, true, phys, size);
 	if (ret) {
 		dev_err(qproc->dev,
 			"assigning Q6 access to metadata failed: %d\n", ret);
@@ -693,14 +699,14 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 		dev_err(qproc->dev, "MPSS header authentication failed: %d\n", ret);
 
 	/* Metadata authentication done, remove modem access */
-	xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm,
-					     false, phys, fw->size);
+	xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, false, phys, size);
 	if (xferop_ret)
 		dev_warn(qproc->dev,
 			 "mdt buffer not reclaimed system may become unstable\n");
 
 free_dma_attrs:
-	dma_free_attrs(qproc->dev, fw->size, ptr, phys, dma_attrs);
+	dma_free_attrs(qproc->dev, size, ptr, phys, dma_attrs);
+	kfree(metadata);
 
 	return ret < 0 ? ret : 0;
 }
@@ -981,7 +987,18 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 
 		ptr = qproc->mpss_region + offset;
 
-		if (phdr->p_filesz) {
+		if (phdr->p_filesz && phdr->p_offset < fw->size) {
+			/* Firmware is large enough to be non-split */
+			if (phdr->p_offset + phdr->p_filesz > fw->size) {
+				dev_err(qproc->dev,
+					"failed to load segment %d from truncated file %s\n",
+					i, fw_name);
+				ret = -EINVAL;
+				goto release_firmware;
+			}
+
+			memcpy(ptr, fw->data + phdr->p_offset, phdr->p_filesz);
+		} else if (phdr->p_filesz) {
 			/* Replace "xxx.xxx" with "xxx.bxx" */
 			sprintf(fw_name + fw_name_len - 3, "b%02d", i);
 			ret = request_firmware(&seg_fw, fw_name, qproc->dev);
-- 
2.18.0

