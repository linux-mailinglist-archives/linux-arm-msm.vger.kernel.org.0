Return-Path: <linux-arm-msm+bounces-34991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0349A45A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96D4FB22AB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 18:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225DC20495D;
	Fri, 18 Oct 2024 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvFHcF1X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7E9204937;
	Fri, 18 Oct 2024 18:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729275616; cv=none; b=nP51eHc34Edl1lpIBAE5H39B7xGvtr9iZJqouU8PFXH1JNrNgM3EO0Hx8kjohyKSsdc9+K7UjlhaodYfHoWjDocoGILLjHaGfHVChytc+PSLUAcvFEQzrjfLH8hwidM9miFozBoEdAXK/zOvBM/nASn9Y7S6LJMYM0O1vowi36g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729275616; c=relaxed/simple;
	bh=4CxVELtCiC1PGqAMrMDaZY++hvnaH/4mDabb37qz28Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gq82gvo/pLYCc1OCx9D/9nPUSeeVjBVDy1YMJWzHoOu7/f4Uefb7Ma5uiAmssqXLViCn8kPTqd+eJckgTc/mW3El1+CSU53Hfw39Fy9rGetuSgYWvuasG/fuNy7zrDS08oFy+j3ZYfg139LTvpsD3dz1nydJPTlZV9OBwDGqiJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvFHcF1X; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7180bd5b79dso826380a34.2;
        Fri, 18 Oct 2024 11:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729275613; x=1729880413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEtsWUfg8YbHWegd1g+Jr8qqOJM5RSkKK7SlSHJ9GsA=;
        b=kvFHcF1XIFh1bqhCiT7nsTvEq6SDeRjBIVGxi9vmR7wv6ttSqDsVn5URFjIgmEBPWd
         jb6ECOFCDFZcDp5/GNrlJepIclSqMqg24K0BEWdxQlTSwo6WLuP3ToRxSlJS07bL8HbC
         j+/waD+qRw8BY18AYtIugbcP5k0Vm1OGo2rH6qszjQGCDSsRmwXDiVdw2c16o4Alod4d
         KXNODQz90VAlmyQD8ZA1yrhzzBVCk99jQhC8/yrhykJ/M0AuIdGvdHLSC4758y5NAbuA
         b1K8t/Jt23wxqg26Yd9DaZV89MQMkgPHqTh7yxB0NohNYcbmwX/CiN0gn+d6M04RFEKn
         eAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729275613; x=1729880413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEtsWUfg8YbHWegd1g+Jr8qqOJM5RSkKK7SlSHJ9GsA=;
        b=KyaTdjCJyRHrdqYdPbm78BO6MnJ5xy+d8qRUOxoZzj4GXqcLvtezwk6PsvRw7imyVC
         jnbbXL4gpzYT71X0P1ZEZSDbZV9Y5BzYgoMVarx+yO/qw4Dpy6YYes+QVeXpar1Zbban
         ZRXgU7zEHz4h3OOswxjrKnUino+CyKFXylvHFzQbQ/Oq4skwz/F1ZttsJOIte0VQUeDV
         wP60Y2j6a5dGu8tap9x9bX+a4JbCY8Oyh2gLL0tIn1edBWTx3Wj4VKdBb3hMBeqMHFuU
         KYpOQIyo+Wyz34/5HFta45Iq3x10ES6axOXkiNK64CR6x/xwUO9/sl80fqYKcvl4ctSl
         5Y6w==
X-Forwarded-Encrypted: i=1; AJvYcCVWNmL6jet60QGmORUFRYXBCz1geEETsvxFCkZDOVTv99QW1psj+BZpxS4vmdX0U23iREupZz2yeUcSyvj4@vger.kernel.org, AJvYcCXOjSVIFBAgYgJIMsWdNQaXFXy1rrQHS6v4bG4SOx71Kg3gO/LX+0ksFVlgiMd0dtrI/S31Auk1sG+1aDdu@vger.kernel.org
X-Gm-Message-State: AOJu0YxahSm5c9aTP1x8nSmAX1X9T4yuRJ384rYQQSIMeE1O+zVwN8M+
	DpsZui7DisklwwOz71Jo5VX+YvNbmRYi+8ZqqCFYjGMPXI1fxH8fnLM2gw==
X-Google-Smtp-Source: AGHT+IH/ZwPbMR+tkggdmm11Pqicm2tPVZQJBJrQzdCvwhafo8if+1UoU0Ata2i19T16kZzjOo3q/A==
X-Received: by 2002:a05:6830:91b:b0:718:15a9:505a with SMTP id 46e09a7af769-7181a89f0e0mr2549619a34.23.1729275611695;
        Fri, 18 Oct 2024 11:20:11 -0700 (PDT)
Received: from localhost.localdomain (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5eb8aa2f668sm340542eaf.44.2024.10.18.11.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 11:20:11 -0700 (PDT)
From: Denis Kenzior <denkenz@gmail.com>
To: netdev@vger.kernel.org
Cc: denkenz@gmail.com,
	Marcel Holtmann <marcel@holtmann.org>,
	Andy Gross <agross@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 01/10] net: qrtr: ns: validate msglen before ctrl_pkt use
Date: Fri, 18 Oct 2024 13:18:19 -0500
Message-ID: <20241018181842.1368394-2-denkenz@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241018181842.1368394-1-denkenz@gmail.com>
References: <20241018181842.1368394-1-denkenz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qrtr_ctrl_pkt structure is currently accessed without checking
if the received payload is large enough to hold the structure's fields.
Add a check to ensure the payload length is sufficient.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
---
 net/qrtr/ns.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index 3de9350cbf30..6158e08c0252 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -619,6 +619,9 @@ static void qrtr_ns_worker(struct work_struct *work)
 			break;
 		}
 
+		if ((size_t)msglen < sizeof(pkt))
+			break;
+
 		pkt = recv_buf;
 		cmd = le32_to_cpu(pkt->cmd);
 		if (cmd < ARRAY_SIZE(qrtr_ctrl_pkt_strings) &&
-- 
2.45.2


