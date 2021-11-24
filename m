Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0ADF45CA13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 17:31:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348918AbhKXQer (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 11:34:47 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:36353 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348913AbhKXQer (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 11:34:47 -0500
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 24 Nov 2021 08:31:37 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Nov 2021 08:31:36 -0800
X-QCInternal: smtphost
Received: from ekangupt-linux.qualcomm.com ([10.204.67.11])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Nov 2021 22:01:27 +0530
Received: by ekangupt-linux.qualcomm.com (Postfix, from userid 2319895)
        id 7C5DF44F4; Wed, 24 Nov 2021 22:01:26 +0530 (IST)
From:   Jeya R <jeyr@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org
Cc:     Jeya R <jeyr@codeaurora.org>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: [RESEND PATCH v3] misc: fastrpc: fix improper packet size calculation
Date:   Wed, 24 Nov 2021 22:01:21 +0530
Message-Id: <1637771481-4299-1-git-send-email-jeyr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The buffer list is sorted and this is not being considered while
calculating packet size. This would lead to improper copy length
calculation for non-dmaheap buffers which would eventually cause
sending improper buffers to DSP.

Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
Signed-off-by: Jeya R <jeyr@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes in v3:
- relocate patch change list

Changes in v2:
- updated commit message to proper format
- added fixes tag to commit message
- removed unnecessary variable initialization
- removed length check during payload calculation

 drivers/misc/fastrpc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index beda610..69d45c4 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -719,16 +719,18 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
 static u64 fastrpc_get_payload_size(struct fastrpc_invoke_ctx *ctx, int metalen)
 {
 	u64 size = 0;
-	int i;
+	int oix;
 
 	size = ALIGN(metalen, FASTRPC_ALIGN);
-	for (i = 0; i < ctx->nscalars; i++) {
+	for (oix = 0; oix < ctx->nbufs; oix++) {
+		int i = ctx->olaps[oix].raix;
+
 		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1) {
 
-			if (ctx->olaps[i].offset == 0)
+			if (ctx->olaps[oix].offset == 0)
 				size = ALIGN(size, FASTRPC_ALIGN);
 
-			size += (ctx->olaps[i].mend - ctx->olaps[i].mstart);
+			size += (ctx->olaps[oix].mend - ctx->olaps[oix].mstart);
 		}
 	}
 
-- 
2.7.4

