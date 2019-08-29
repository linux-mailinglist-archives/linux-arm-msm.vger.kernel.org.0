Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9B5A14F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 11:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbfH2J3j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 05:29:39 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52699 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfH2J3i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 05:29:38 -0400
Received: by mail-wm1-f67.google.com with SMTP id t17so2945265wmi.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 02:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8gReQ7CjJRAhm4L6Tiz8Y9x8ZLQilV94lsV5veC3IIc=;
        b=PtDj5xCzFk2wfuU6zYpS9GCEDFNAdkqEJTun597to8/wlUXA2ovkmt2++lgNbddgWj
         nghCcmSOy88teYBBZJklqSkpkrGk0u7G46HXOPF8zXasJG7NYAM4xbl+IrqiDHsa4a0t
         Us1d9idE5Oe+d+yY46bKYHNlylT6HBA1I4f9ZwezXwkD49LPzyQsGAN7eAW+RkSJIfrX
         oFM8uxkVTyFTRc9rtET54Bn2IAabx2x7VgSIL6F2u1KCjd6gCSJJ11GQ/KNwG/jIsSzh
         Zlf6IL+bUikvtRslDtQAgaYAJGHhijvgZ0U1TiJIxLjlZ0DTgAmlBZZXglO3NV/qtQoq
         2AEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8gReQ7CjJRAhm4L6Tiz8Y9x8ZLQilV94lsV5veC3IIc=;
        b=QPSk37819q+fTxJjt4KDfOsQEJlA6wABnDn+ogvKTG867qxHS47K2Ik344mIOS4mpw
         1lakuUgrXisxFXAyHQApuJyZHN3gWyaTj+lxvSJrRKxbg/dKyJNMMh7X1TsD0nbM3rO7
         CvQMhW99wEffjzmmIm6EcpMJypR5UdGLFwja8/0A/AvRyNETihATkG8tPq/odd2hB485
         8ZHThLK+7CIEinMQ5zaK/WhnS5ifSdX/95ngS/46Q+ltaQhnqQG+W21XeP79Rep3gj2h
         ODNTZfoLGdhjtrH+yuUkl0XRxPSb15bJ/+DBHvkxVNnA5q02A011xN84Sjzs+Cz+gvR8
         n+5g==
X-Gm-Message-State: APjAAAUjJZNGeV3eCgkZq2nZNX/sWJyGryAiemuxOSEJvNKpAfRSS1an
        hZxxPFpOpIPW4P7+NGetzLoqLQ==
X-Google-Smtp-Source: APXvYqzOYofeicG26OGoFyHrHuKzsT2ky6ZgtQ05RxJCwCRhZ+vIGCCRk1RVQrAARSynZ2t5y03Taw==
X-Received: by 2002:a7b:cc0f:: with SMTP id f15mr10002879wmh.39.1567070976668;
        Thu, 29 Aug 2019 02:29:36 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f197sm3609512wme.22.2019.08.29.02.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 02:29:36 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     arnd@arndb.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mayank Chopra <mak.chopra@codeaurora.org>,
        Abhinav Asati <asatiabhi@codeaurora.org>,
        Vamsi Singamsetty <vamssi@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 2/5] misc: fastrpc: Don't reference rpmsg_device after remove
Date:   Thu, 29 Aug 2019 10:29:23 +0100
Message-Id: <20190829092926.12037-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829092926.12037-1-srinivas.kandagatla@linaro.org>
References: <20190829092926.12037-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

As fastrpc_rpmsg_remove() returns the rpdev of the channel context is no
longer a valid object, so ensure to update the channel context to no
longer reference the old object and guard in the invoke code path
against dereferencing it.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Mayank Chopra <mak.chopra@codeaurora.org>
Signed-off-by: Abhinav Asati <asatiabhi@codeaurora.org>
Signed-off-by: Vamsi Singamsetty <vamssi@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index c019e867e7fa..59ee6de26229 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -913,6 +913,9 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (!fl->sctx)
 		return -EINVAL;
 
+	if (!fl->cctx->rpdev)
+		return -EPIPE;
+
 	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
@@ -1495,6 +1498,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	misc_deregister(&cctx->miscdev);
 	of_platform_depopulate(&rpdev->dev);
 
+	cctx->rpdev = NULL;
 	fastrpc_channel_ctx_put(cctx);
 }
 
-- 
2.21.0

