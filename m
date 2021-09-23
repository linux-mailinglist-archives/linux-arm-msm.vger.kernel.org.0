Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF9BE415A24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 10:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239909AbhIWIjk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 04:39:40 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:48169 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239825AbhIWIjk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 04:39:40 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 23 Sep 2021 01:38:08 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Sep 2021 01:38:06 -0700
X-QCInternal: smtphost
Received: from ekangupt-linux.qualcomm.com ([10.204.67.11])
  by ironmsg01-blr.qualcomm.com with ESMTP; 23 Sep 2021 14:07:56 +0530
Received: by ekangupt-linux.qualcomm.com (Postfix, from userid 2319895)
        id 339FA42FD; Thu, 23 Sep 2021 14:07:55 +0530 (IST)
From:   Jeya R <jeyr@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org
Cc:     Jeya R <jeyr@codeaurora.org>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: [PATCH] misc: fastrpc: copy to user only for non-DMA-BUF heap buffers
Date:   Thu, 23 Sep 2021 14:07:52 +0530
Message-Id: <1632386272-18139-1-git-send-email-jeyr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

fastrpc_put_args is copying all the output buffers to user. For large
number of output context buffers, this might cause performance
degradation. Copying is not needed for DMA-BUF heap buffers.

Signed-off-by: Jeya R <jeyr@codeaurora.org>
---
 drivers/misc/fastrpc.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index beda610..536eabf 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -890,15 +890,17 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
 
 	for (i = inbufs; i < ctx->nbufs; ++i) {
-		void *src = (void *)(uintptr_t)rpra[i].pv;
-		void *dst = (void *)(uintptr_t)ctx->args[i].ptr;
-		u64 len = rpra[i].len;
+		if (!ctx->maps[i]) {
+			void *src = (void *)(uintptr_t)rpra[i].pv;
+			void *dst = (void *)(uintptr_t)ctx->args[i].ptr;
+			u64 len = rpra[i].len;
 
-		if (!kernel) {
-			if (copy_to_user((void __user *)dst, src, len))
-				return -EFAULT;
-		} else {
-			memcpy(dst, src, len);
+			if (!kernel) {
+				if (copy_to_user((void __user *)dst, src, len))
+					return -EFAULT;
+			} else {
+				memcpy(dst, src, len);
+			}
 		}
 	}
 
-- 
2.7.4

