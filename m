Return-Path: <linux-arm-msm+bounces-89510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF46D38EED
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 15:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E04D3011EF6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 14:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04AE720A5F3;
	Sat, 17 Jan 2026 14:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwMMfcZZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6A01DF73A
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 14:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768659012; cv=none; b=ecv9P148Ql/KzpY74jOEfucFrOwI2MgJ1S4AWDG7cWkERZUKXXpMpkTIWYev47mlHiv0VrIFKdSV3MxHANlNaBR0lCzgt3ZaIkNMnxyaIAfhHqCPH+dZnDvKGo3XE6DiqqnfCGlakUvfeOCEjUxLupEyacGJF7TP+uNOLA1RBkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768659012; c=relaxed/simple;
	bh=QAIEr0P+YLPaShZQagznwIHykJGkUBoI8g4SE0BgWRU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ys/qarljAVFg722M7e9/UzCmmhwM1EvkT+/TML1WF0qbFWdGmbRG6S+MamFNol85xBSF9SJt6XRdCIewGqy7JwoRPm9Hvu5H8dcgSt6SNPnaKjqEca+77EGzFWFYK86TmVtZzeTRRCY9yKsdadf+0zmyj7N9e5RkkPwpyiASmzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwMMfcZZ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c03e8ac1da3so1120141a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 06:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768659011; x=1769263811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1YsjaSB9aIQokwOFTN0Ov8qKUwyht65twzNGrMEevb0=;
        b=ZwMMfcZZNCj5942+F7urbmHUqbJtL3JcjVWOC0s3ndieZ+mwPCjX7MfsVaQgp9aP9O
         xePVkeJV6AlrIgsPj4qqywx9v0p+XBw1Dk3tu/zD6xkuNHmxglNKiTG6MkxyXPqS1IF1
         w5kMyhLP8AdNR78h9rlUfomfn/VpSQGmnUtDhuNSAuXuuYa/78jj+6NtsxdHfsCVJyaH
         UC3fXUrKMduZH3ymloKdLdOZsKmTZiGTfBcPo50CZNrYzWlBicp8aFiKhea1tVE2HRfU
         tn5OSsIEc7GSE7PqLctWNkFxaL2Pcxx8PqrqIVTC/355SszVQoiifFbSB5nAs+txHkqK
         WbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768659011; x=1769263811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YsjaSB9aIQokwOFTN0Ov8qKUwyht65twzNGrMEevb0=;
        b=nDfyzaJBvLrPQahh1Sc+5lHQWHiefyVttn5olsTUx5kx5lokQ1HFH29n7AeFfmYwEl
         42gPgnq+Dj8/OC3F6264iLOf45TH1MwY0rhdbt93kj6cFwhtbdgtTFaqTH+XUBqI2oO6
         /4UuuobGQ7s6dc9acCyomXyn0AD6+dZ1RMS9SnaTBs8k6Mf51XJQONSk66niuvYK7CIb
         WCeHiZ8t9tlRRXWdm0BRgD40JkU65eAovCxq7bVJ5FLXbIzYeNUr0o0F6OEpCg/QG4yp
         UgYKaXh61qS94gU/d+jzVRJbohlpU/v8IQmBZYTqvR3+mAoSVSUHtKlXcgG+KB0Fz8zf
         x9Rg==
X-Forwarded-Encrypted: i=1; AJvYcCV9mgg6RdcpB3zU+RIcrYveyIIgin8W/H4VNEJZfLwnlL8hcqMZQVGoufAzNUPfzxHU4CzvcWZHpWsm+loP@vger.kernel.org
X-Gm-Message-State: AOJu0Yywc5jw90T6fhuIq78EvAL2L5a9ZHQUcxNUwnojMajQ2CrFFe6r
	6BUhuuvOKd25VGpIrg/BkHQ11okCvakg0BJr5dTO1okcSEzIZgQ2+fOV
X-Gm-Gg: AY/fxX6OCUEy/QXxu4puaPbA7pe/Cob+rTKjP5x7/l5Mafr8rex8Rbvbmhd1/yelhkx
	ofNlO0eo1zwMMXYOUpCBVWHB+Npa7qz8tNL2d3w4WdhYqLsMaNF8qfotk8/SX5+8woMlt4GkIyR
	I4jUtkFjAlyoyMI9568ZkgopDc1xSlNgy/CVVOfnpRhZQV/WSNhE+ajlIHqqRGBct/2OSzM98mG
	vVg+p8qcvIcJO+ass08WmE1z0mDToCGtem98rqGY58Cf/OCxG62YV/Zd4RQjfyC7wjLf9js68lf
	w/z75eyRK49aIjSLZczay4tjSQYHXW3YWVX4j1TIMnXJkpT/PV0J80CvlCjL6ftGgp8UPLceQ9/
	IJY22lFjV9W/YbCqy/m7FlR3ZkKOcG7QOv2FIxKryZk1P+6UHIyr0F+HbYG2NxtX/wStGFBHRNm
	szhrdyzEoLOEz7guR0GHNnxBgPMji1MzPE/A==
X-Received: by 2002:a05:6a21:1506:b0:364:1332:54ca with SMTP id adf61e73a8af0-38dfe7b7580mr5929841637.59.1768659011011;
        Sat, 17 Jan 2026 06:10:11 -0800 (PST)
Received: from localhost.localdomain ([111.202.170.108])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf32dbc1sm4834519a12.21.2026.01.17.06.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 06:10:10 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org,
	amahesh@qti.qualcomm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingjing Deng <xjdeng@buaa.edu.cn>,
	stable@vger.kernel.org
Subject: [PATCH v3] misc: fastrpc: possible double-free of cctx->remote_heap
Date: Sat, 17 Jan 2026 22:09:59 +0800
Message-Id: <20260117140959.879035-1-xjdeng@buaa.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fastrpc_init_create_static_process() may free cctx->remote_heap on the
err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remove()
frees cctx->remote_heap again if it is non-NULL, which can lead to a
double-free if the INIT_CREATE_STATIC ioctl hits the error path and the rpmsg
device is subsequently removed/unbound.
Clear cctx->remote_heap after freeing it in the error path to prevent the
later cleanup from freeing it again.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@vger.kernel.org # 6.2+
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>

---

v3:
- Adjust the email format.
- Link to v2: https://lore.kernel.org/linux-arm-msm/2026011650-gravitate-happily-5d0c@gregkh/T/#t

v2:
- Add Fixes: and Cc: stable@vger.kernel.org.
- Link to v1: https://lore.kernel.org/linux-arm-msm/2026011227-casualty-rephrase-9381@gregkh/T/#t

 drivers/misc/fastrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534..fb3b54e05928 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1370,6 +1370,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	}
 err_map:
 	fastrpc_buf_free(fl->cctx->remote_heap);
+	fl->cctx->remote_heap = NULL;
 err_name:
 	kfree(name);
 err:
-- 
2.25.1


