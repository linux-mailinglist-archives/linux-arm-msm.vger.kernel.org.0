Return-Path: <linux-arm-msm+bounces-23054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B098B90D372
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 16:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85EE6B2E58E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B811216631B;
	Tue, 18 Jun 2024 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vhcezod9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0368416CD32
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717880; cv=none; b=sCul+fsnIOPkatM2cjEAOa6iArlgLchVE44Sz8aqrBOweMb1F1Du0uZSiYg/dEeyQnP6LrwQIcpRaO2iw8SWjIb0YmqQQHQF4mPn9MmDN1iGNSi9mRdaVm1vp4FQwYktYIt7t0wbun/UGNMUF3dJWnA/szJ6ayjMy2zqqK5+qMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717880; c=relaxed/simple;
	bh=LrbREgccmp+ApJP/aOqmOoRz76Y1lEsELda3PHy44H0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DvYGotiFuxhASzj8uloiw2grcKizOnvyTIzJffTO5Dy+PmEPtFcO0DuzhF+F4oufP+mTIgm5X7JPkwPNDw2ojGtiND+v+XUvKkNbNZmmNOQVo284cX3IsD+EtPVI5I394iQvh0M80of5WR7cr9MxlBPPVyfYxZQb8V6pJDCaGXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vhcezod9; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7955841fddaso443956085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 06:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718717878; x=1719322678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yg6dOdrePmQkedMibhUOvsYt1qJByOG1v6bUXQRrIc0=;
        b=Vhcezod9bTjHhu5dqi2/RMzSrpi/ALRIrD13HlMTNDime5k71fOYHpXqTA0EAzSTOF
         ibk6ZrbAFsxebknblBSyrY8gFdd8P+sBG7eAkQEU1IySvLTS8osLtrxzors5DvQwtf3o
         3XUgD72NIfh8x5K1dQ4L+Br3iGldTXf0z4HmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717878; x=1719322678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yg6dOdrePmQkedMibhUOvsYt1qJByOG1v6bUXQRrIc0=;
        b=a6cWmPJsxs6mpx+2RLg0ZJJDosCUZfBIjqS5daebWsSt1I1di9tZj1zTDzkbqqYt5f
         h/oKBYPH6PqQV4LVoIvRawAE1fWZH21o24cISJLK4/meV0v6/nAsPxL3JMBkE1n59KRg
         pEtABfgqO7TRAm+e8kuCiSYeTqHq8c/KviOkL1BvbxPdcYu6IEoRCaWjrS9A/QWXsU7j
         xL/iUQd+dYaeU6K5wddU8YTPbXGP3g5pfNk8oZ1BYr2JWunG2Ur4RyQQuJijJ22U4YuK
         5PgVcy/ImRphqsIs1Cl+jwnI0pGin2PrFh/3prHggtPYbpRaaHRdEiic3SfxZOQs/6Pp
         tR0g==
X-Forwarded-Encrypted: i=1; AJvYcCV7CHApfrD9CwBQJ0+oVwLhxLSQ9aGdn4rEw4ROOGSZP0vbxvHvnwCTC3ERVtSGd8Uj+OFcWJ031PLtODFTUEBNLg9XW5M0An8f8hQaaQ==
X-Gm-Message-State: AOJu0YzTvHkIQTGGcmhqePcAsnk/NLtF2LRddAzjvZxvStP4AfXTU4PV
	+Wq/nPN433TyuFfV8hdvpyYx5u7zPC5RlRhRWHjqenudATUXEdlQN1UPWLRNug==
X-Google-Smtp-Source: AGHT+IGAgj3YnsFss9qEjXgsxLbOwfO0PDliSTE4TcCbevE5n9KjJc7F+p+/GujvK9mbnLR+t5wqXQ==
X-Received: by 2002:a05:620a:4308:b0:798:5598:bdff with SMTP id af79cd13be357-79ba75e14e3mr450019785a.0.1718717878028;
        Tue, 18 Jun 2024 06:37:58 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abc06e93sm521666385a.82.2024.06.18.06.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:37:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Jun 2024 13:37:51 +0000
Subject: [PATCH v5 08/10] media: venus: Refactor hfi_sys_get_property_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-cocci-flexarray-v5-8-6a8294942f48@chromium.org>
References: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>
In-Reply-To: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Replace a single length element array with an element.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_cmds.h:77:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c | 2 +-
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 75f4a3d3e748..0a4de8ca1df5 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -156,7 +156,7 @@ void pkt_sys_image_version(struct hfi_sys_get_property_pkt *pkt)
 	pkt->hdr.size = sizeof(*pkt);
 	pkt->hdr.pkt_type = HFI_CMD_SYS_GET_PROPERTY;
 	pkt->num_properties = 1;
-	pkt->data[0] = HFI_PROPERTY_SYS_IMAGE_VERSION;
+	pkt->data = HFI_PROPERTY_SYS_IMAGE_VERSION;
 }
 
 int pkt_session_init(struct hfi_session_init_pkt *pkt, void *cookie,
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 2c56ae303989..f91bc9087643 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -74,7 +74,7 @@ struct hfi_sys_set_property_pkt {
 struct hfi_sys_get_property_pkt {
 	struct hfi_pkt_hdr hdr;
 	u32 num_properties;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_sys_ping_pkt {

-- 
2.45.2.627.g7a2c4fd464-goog


