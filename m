Return-Path: <linux-arm-msm+bounces-92755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHoZK5zrjmkCGAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:15:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C98E1134560
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E6C23018AE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 09:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B6434C140;
	Fri, 13 Feb 2026 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JopeMpVb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A0434A775
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770974105; cv=none; b=UfeC76HSckr0StZrx57YrD+FodUkvAiEWONEdR9/2fwsBYpvWEpPmNbvjZJjPiJuKQdp9PhhglqO3QYQuEKpYkbMEfAx/EJJm6APZGMVtiia7CBXTt8NCVv4cAp2hYp7wpHtXVtpT7ak2rlglA/UuZABpXbkTc83a2yZRWc5r+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770974105; c=relaxed/simple;
	bh=6veDJhQ+0eIaAZOJcIL/D3XTVNjNN5zMO0OVns1Zp9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lBUrbWyUNOY8Cxu75K37uBse5t1an1JJJW45vm/8lPrWSVz1huH3+1WL92AvMuZtgjm8Rq5RF7BFR8K3Q+2nyTr3l0TLVhpjKAioQ27qRUFdtY4on+RfG1Zon0uZx6uH4IXgRG92PgR7vRvWSZse+LfZZt8aQJqDFLrE1KAgj90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JopeMpVb; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4836cd6e0d4so1002075e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 01:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770974102; x=1771578902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zCdD7lSk2JqQGo4mK3E+TOq0B3GIskXXL8ofh8f8Wjk=;
        b=JopeMpVbFyhvRCZ+GvvY+jVq/GkvIszhKagp8svDWVaR27vdfxFTqm1WwEVbjh2TRB
         /MoBygNutQlNi3RhzP4GlP56luqkwKSDL3GjHxpOgQhaWvkycB5XAAAgCf1J/w0f0fzA
         vQqmVLdh2535wDTVW8UqEG0PfiJ9iSr2Ivqou9JnsJG/l6YqV/GZc+6/DuO2MKZkD9nX
         4P/1oASQVaxt/eg29bHHDZFu30RC6V4WtCqiY3TarMgzdhuSn8WDZcAbvAOf65FBNqpq
         MYU8LAggOZ+hPn/Y8+2u39xw3fQk0J8S780EG93l4SSCE1bQRrEFAdmvf4zOSyvpTv/H
         aiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770974102; x=1771578902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCdD7lSk2JqQGo4mK3E+TOq0B3GIskXXL8ofh8f8Wjk=;
        b=XMIn9rhb+Gn5cfhW9KaSttuDfdgIT83m7e2fpGxHKUWzfQqGj2FtehVGnUbJ7yc3pI
         N4MuWXAntKP/tORdXHEV/TzlnF1xJ/6zNS/Zg+Eb4HCQHbN2SkZ3A3fw7Wu5vERJgI9b
         +7JRH/pTMht2m8sB5uKjis4C2xDgZmSj3T1tlJd4GoCXCRi3Wmt2Gj9CoOV+i2L02IPv
         vUVYgOgQ3gb7Bn4uQvUa4a82slp6e+kOhPjV7soSoWHtx6+gRcdA7RiOkyqO4rHTxPqX
         6pyBv+tmvpanH2q6JciszAhocyo3V+9hAdwpr6ihOfzr9djzCofuzjbOwT5R849MBDRZ
         qLtA==
X-Forwarded-Encrypted: i=1; AJvYcCV7JsHL3vK/3K+RgqHgfUv4FSQd7ZGEq8Lrdubfh0jobX/Sboe0IGl4T4GkboHU2EPDw0hwujhHGk99G2Rg@vger.kernel.org
X-Gm-Message-State: AOJu0YznSFT23OQlOO9mS7Yn4Wub91syPteglyQsWx4cUMp3/q9/m7GZ
	ddqpP1cie5hxVDVb0xuL/YrgF5LWGinGWKN4Wji/qHzbMTeNFNGkudSMGg+N6A==
X-Gm-Gg: AZuq6aJj+0ZB3VVgKZg1dEn47T6pyYpx99H4+Di279/I1avRvfoJlzedoMnLtOac7p0
	OPAtxa558XeVSu3wkblxzcNWAoO6+CBlGIjSghktVqw3uYHMFp17l9dc7OPDYRcTWgWQp5VDsoz
	+eto8b04o8FZX1khwwOQVc08xDDkaOdKESdzywMdeLUeSVmohxGL55e1OSWxzI/kli/qT2rcWv9
	C+SmzvEUk/ii0kRDZNy2429Aefip9wHGmXnggYrbeUvaR4FtArfoH+i1er9wqF54mVbYHx27qqK
	GnFZrNzi3fceKZYqE7VI9Uf8bLLjLOSpeCrjNoQCWuNbrJVs6fzHnz+yN/i91dIsVrPrjPw28hi
	ORxIgEAaKW+FS1WRzYbj+aiMycySzSbOUVtZXuGlhZQZ+lKSfRS+F6JkZlTZKyN7On3vHvuCdq6
	qHJl5klKrEcE9TovvoSZhn2X4KSiQax5SnwnkIm9rrAaJMfn6YaHlkGNnDfRKp8qjHmuV0r6+VZ
	rw6XQ4dyyjVGnBVMKzE
X-Received: by 2002:a05:600c:4746:b0:47d:3ffb:39ed with SMTP id 5b1f17b1804b1-483710546e4mr18587225e9.4.1770974101882;
        Fri, 13 Feb 2026 01:15:01 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-82-204.paris.inria.fr. [128.93.82.204])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm4035968f8f.0.2026.02.13.01.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 01:15:01 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: iris: Fix dma_free_attrs() size in iris_hfi_queues_init()
Date: Fri, 13 Feb 2026 10:13:27 +0100
Message-ID: <20260213091330.23431-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-92755-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,oss.qualcomm.com,linux.dev,kernel.org,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fourierthomas@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C98E1134560
X-Rspamd-Action: no action

The core->iface_q_table_vaddr buffer is alloc'd with size queue_size
but freed with sizeof(*q_tbl_hdr) which is different.

Change the dma_free_attrs() size.

Fixes: d7378f84e94e ("media: iris: introduce iris core state management with shared queues")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index b3ed06297953..bf6db23b53e2 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -263,7 +263,7 @@ int iris_hfi_queues_init(struct iris_core *core)
 					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
 	if (!core->sfr_vaddr) {
 		dev_err(core->dev, "sfr alloc and map failed\n");
-		dma_free_attrs(core->dev, sizeof(*q_tbl_hdr), core->iface_q_table_vaddr,
+		dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
 			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 		return -ENOMEM;
 	}
-- 
2.43.0


