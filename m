Return-Path: <linux-arm-msm+bounces-99762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YObVKXMyw2noowQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 01:55:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2B531E225
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 01:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E103304A9A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 00:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7006E202F70;
	Wed, 25 Mar 2026 00:55:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157261D130E;
	Wed, 25 Mar 2026 00:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774400113; cv=none; b=ctuH/l6s+LzF8CUNlJ82TubzLjQLk+jm+bP4erYVzXqgM+qC5IYmpZ+Gy9YSufy4JLhLJS5TkX9W9QNgAVC4w99t5rnD5gsQ+0SHXDWlPUnblv4CkjjXZXbWb0SCNyaCSkX5aqTFRSMoJ0NIdM0CTc3YRvJ8ZBT8zrCXq1taEk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774400113; c=relaxed/simple;
	bh=qcvPTnd5deZ4iLXShrdk3IyWOpcO+tDR71cJg0w/wYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CdmhnHztqZGHaX1ZGE0hY1j8XVqiP+4nBOkTHfvy3dAYBfo0B8BNLV5Uaa+qytQkAYN4rdL3J9cY8sFntMGMrei14yjAzF8gi2kmHNgtTEcRRVSXbnpLwdho2j3t6vpbEq4Zkj7Tq2bs69kAyJIqL9ckbwh1lTpHP+4dwv6qzWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowAAnQNdpMsNpuUm5Cw--.34606S2;
	Wed, 25 Mar 2026 08:55:05 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH v3] misc: fastrpc: validate overlap-derived invoke buffer ranges
Date: Wed, 25 Mar 2026 08:55:05 +0800
Message-ID: <20260325005505.98257-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAnQNdpMsNpuUm5Cw--.34606S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZry7ZFWkZw1UAF1kJry3CFg_yoW5ur4fpF
	s8Ka1rGF45Xw47GF1xZF1DuryfGws5JryUGrWfG34Sv343tFy0gFyvkFyY93W8CrZrZa4U
	Krs8ta9IkF43ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUBmhwUUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-99762-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,iscas.ac.cn:email,iscas.ac.cn:mid]
X-Rspamd-Queue-Id: 4A2B531E225
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

fastrpc_get_args() derives rpra[i].buf.pv from the overlap offset that
was computed from user-controlled argument pointers and lengths. The
resulting destination pointer is later passed to copy_from_user() or
memcpy() without checking that the overlap-adjusted range still stays
inside the allocated invoke buffer.

Reject overlap-derived destinations that would point before the start of
the invoke buffer or that would extend past the end of the allocated
packet before storing rpra[i].buf.pv and before copying inline
arguments into the buffer. Static code analysis of the overlap handling
in fastrpc_get_args() identified this path.

Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
v3:
- separate tags from the free-flow text in the commit message
- rewrite the overlap bounds checks using explicit overflow-safe
  start/end calculations
- post the new revision as a new thread as requested in review

 drivers/misc/fastrpc.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 47356a5d5804..587733e6702a 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/sort.h>
 #include <linux/of_platform.h>
+#include <linux/overflow.h>
 #include <linux/rpmsg.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
@@ -992,7 +993,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	int inbufs, i, oix, err = 0;
 	u64 len, rlen, pkt_size;
 	u64 pg_start, pg_end;
-	uintptr_t args;
+	uintptr_t args, buf_start, buf_end;
 	int metalen;
 
 	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
@@ -1016,6 +1017,11 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	rpra = ctx->buf->virt;
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
+	buf_start = (uintptr_t)ctx->buf->virt;
+	if (check_add_overflow(buf_start, (uintptr_t)pkt_size, &buf_end)) {
+		err = -EINVAL;
+		goto bail;
+	}
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1053,6 +1059,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 			pages[i].size = (pg_end - pg_start + 1) * PAGE_SIZE;
 
 		} else {
+			uintptr_t dst, end, offset_start;
 
 			if (ctx->olaps[oix].offset == 0) {
 				rlen -= ALIGN(args, FASTRPC_ALIGN) - args;
@@ -1064,7 +1071,24 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 			if (rlen < mlen)
 				goto bail;
 
-			rpra[i].buf.pv = args - ctx->olaps[oix].offset;
+			if (check_add_overflow(buf_start,
+					       (uintptr_t)ctx->olaps[oix].offset,
+					       &offset_start) ||
+			    offset_start > args) {
+				err = -EINVAL;
+				goto bail;
+			}
+
+			if (check_sub_overflow(args,
+					       (uintptr_t)ctx->olaps[oix].offset,
+					       &dst) ||
+			    check_add_overflow(dst, (uintptr_t)len, &end) ||
+			    end > buf_end) {
+				err = -EINVAL;
+				goto bail;
+			}
+
+			rpra[i].buf.pv = dst;
 			pages[i].addr = ctx->buf->dma_addr -
 					ctx->olaps[oix].offset +
 					(pkt_size - rlen);
-- 
2.50.1 (Apple Git-155)


