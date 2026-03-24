Return-Path: <linux-arm-msm+bounces-99638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wND5OGJ9wmnqdAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:02:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD95307D31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F6AF303035B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892AE3F0751;
	Tue, 24 Mar 2026 11:45:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF723ED5CF;
	Tue, 24 Mar 2026 11:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352732; cv=none; b=rmqt+2/WuklxWK+NaUWD3YLlTh9kIq0E0SKeMC63UN91kXy8z2a+/J31SEx6i3GxbHlWCBiwfaBvdPPI9zbNWJi9lr6CSZ3vQZhwbva9o2uyx+4Rx/zJmgtUdoQ6MUtykbl+8G2AOZ8j0OPRxBuBlo4T3qHWw5WudkSgwx0zIK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352732; c=relaxed/simple;
	bh=kANe2RExJa5fW0q4VTFhcx+Us10jEBNsK/g+oNvG0gQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e3Dmt5Hf0rIY5F8tCzlb9+LsRWRbcUVI6LyGMxJe2ygiLyKVM5A1wU0s1nfIjiHvZOgGUSn93NRsPB9XvDeGd0tvHWBxyOHbQdALdCOLBytDeqwSCA9fLqADNhpi5L60OuE/WvkObUX+f/br0VnVvJBdtC1l2WxKE0s1Y0BpTnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-05 (Coremail) with SMTP id zQCowADndgpKecJpRaFUCw--.54020S2;
	Tue, 24 Mar 2026 19:45:14 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: srini@kernel.org,
	amahesh@qti.qualcomm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: konradybcio@kernel.org,
	thierry.escande@linaro.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH v2] misc: fastrpc: validate overlap-derived invoke buffer ranges
Date: Tue, 24 Mar 2026 19:45:14 +0800
Message-ID: <20260324114514.79392-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260324014459.93364-1-pengpeng@iscas.ac.cn>
References: <20260324014459.93364-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADndgpKecJpRaFUCw--.54020S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZryxCw4DKFWruw48JFWDArb_yoW5GFyfpF
	43Ka15CF45Xw47GF1vvFnrWryfGws5JryUGrZ3G34Svw1YqFy0qF9YkFWj93W0krWIvryj
	krs0qaya9F47JaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUQZ2fUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DMARC_NA(0.00)[iscas.ac.cn];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-99638-lists,linux-arm-msm=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 3DD95307D31
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
arguments into the buffer.

Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
Found by static code analysis.
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
v2:
- add the missing Signed-off-by line
- add a Fixes tag and note that the issue was found by static code analysis
- run checkpatch and keep the patch checkpatch-clean

 drivers/misc/fastrpc.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 47356a5d5804..7dfb5eb6dc92 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -993,6 +993,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	u64 len, rlen, pkt_size;
 	u64 pg_start, pg_end;
 	uintptr_t args;
+	uintptr_t buf_start, buf_end;
 	int metalen;
 
 	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
@@ -1016,6 +1017,8 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	rpra = ctx->buf->virt;
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
+	buf_start = (uintptr_t)ctx->buf->virt;
+	buf_end = buf_start + pkt_size;
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1053,6 +1056,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 			pages[i].size = (pg_end - pg_start + 1) * PAGE_SIZE;
 
 		} else {
+			uintptr_t dst;
 
 			if (ctx->olaps[oix].offset == 0) {
 				rlen -= ALIGN(args, FASTRPC_ALIGN) - args;
@@ -1064,7 +1068,18 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 			if (rlen < mlen)
 				goto bail;
 
-			rpra[i].buf.pv = args - ctx->olaps[oix].offset;
+			if (ctx->olaps[oix].offset > args - buf_start) {
+				err = -EINVAL;
+				goto bail;
+			}
+
+			dst = args - ctx->olaps[oix].offset;
+			if (len > buf_end - dst) {
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


