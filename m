Return-Path: <linux-arm-msm+bounces-20416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 601678CE8D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 18:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2EA3B20C7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 16:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A7512EBE6;
	Fri, 24 May 2024 16:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dylanvanassche.be header.i=@dylanvanassche.be header.b="fIeNgb5/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from www316.your-server.de (www316.your-server.de [88.198.220.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C660312F59D;
	Fri, 24 May 2024 16:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.198.220.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716568986; cv=none; b=oSycB8rmEkZY7TOIXQNlZjU20SqLF0PPOyU6UcXJGwUzKoN9VT36uY88WnyTQNj6mNNIWoA1++qr2qJbKKvHTplmMSHqOcksdmk9fSGJ5XQxgXGVu1OS6axi36c2gY9GaFqumBPR5N/OzWDLTqY7IoY8/MUp6xy7dpssw/l1ZQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716568986; c=relaxed/simple;
	bh=kBGVY6CpHhaXJmaLY3ecr1SySiFvAY8aX82+3SK0Oig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJClvQNB9485ziE3cRrzMqfntaoYiBv9phE2r8bhW9fS2/rUlPW/1+NOarb9Jih+eYSTaJXWkHpbro5yg/e3M0ep7ivZ80cyV2kkhNZYCH84wfSe6kjCukcJzjKmhbMcKyrku1Pvqbru049Gxg9OCvpNVr22DPl4t9L19I4SqeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dylanvanassche.be; spf=pass smtp.mailfrom=dylanvanassche.be; dkim=pass (2048-bit key) header.d=dylanvanassche.be header.i=@dylanvanassche.be header.b=fIeNgb5/; arc=none smtp.client-ip=88.198.220.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dylanvanassche.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dylanvanassche.be
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=dylanvanassche.be; s=default2306; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6fL1tq5YHxeAA+CRy4r/mRxLDFZ+WeZfw73SYF9S1o8=; b=fIeNgb5/aQGy0F4vl7Epu1fZZ9
	CNd+F7myGRbzKMC1gvEm3TfcvUGp3kPHeAby0d2lRXglZ41AHBNRyHorse3Z4bVuWR4o7VJYcNX4w
	SUsfCSDtBqIA5n5qlZ36lpvSTfKmVk1mqihqYW3EMSbONg2XKVmh+2x6IEMqBYsVujud8u0HN4byP
	PZwqFXBDYJ4pPtCsoCZvft+p7sPm6zJgT6HyLEaVxYCnvLVyRT60yLGinjFs4AFNWPQMGSbZpfxYm
	2DTU1FcJ87HLyWzStYo1wgxC42vFzyjeKMKO5gyjYiIHI9zw+4x2GQgKqbd8Sp5y/rIGZZXBD2SVF
	QrCGTxMQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www316.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <me@dylanvanassche.be>)
	id 1sAXYq-000K0U-RS; Fri, 24 May 2024 18:14:28 +0200
Received: from [169.150.196.25] (helo=desktop.telenet.be)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <me@dylanvanassche.be>)
	id 1sAXYp-0000gS-2w;
	Fri, 24 May 2024 18:14:28 +0200
From: Dylan Van Assche <me@dylanvanassche.be>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Dylan Van Assche <me@dylanvanassche.be>
Subject: [PATCH v5 2/2] misc: fastrpc: use coherent pool for untranslated Compute Banks
Date: Fri, 24 May 2024 18:14:03 +0200
Message-ID: <20240524161423.15392-3-me@dylanvanassche.be>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524161423.15392-1-me@dylanvanassche.be>
References: <20240524161423.15392-1-me@dylanvanassche.be>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: me@dylanvanassche.be
X-Virus-Scanned: Clear (ClamAV 0.103.10/27285/Fri May 24 10:30:55 2024)

Use fastrpc_remote_heap_alloc to allocate from the FastRPC device
instead of the Compute Bank when the session ID is 0. This ensures
that the allocation is inside the coherent DMA pool which is already
accessible to the DSP. This is necessary to support FastRPC devices
which do not have dedicated Compute Banks such as the SLPI on the SDM845.
The latter uses an allocated CMA region instead of FastRPC Compute Banks.

Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/misc/fastrpc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index c06667b29055..f53d20e2e07e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -953,7 +953,10 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 
 	ctx->msg_sz = pkt_size;
 
-	err = fastrpc_buf_alloc(ctx->fl, dev, pkt_size, &ctx->buf);
+	if (ctx->fl->sctx->sid)
+		err = fastrpc_buf_alloc(ctx->fl, dev, pkt_size, &ctx->buf);
+	else
+		err = fastrpc_remote_heap_alloc(ctx->fl, dev, pkt_size, &ctx->buf);
 	if (err)
 		return err;
 
-- 
2.45.1


