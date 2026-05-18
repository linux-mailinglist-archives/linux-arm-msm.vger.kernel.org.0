Return-Path: <linux-arm-msm+bounces-108166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ItbJ9LwCmqv+AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:58:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F14956B18D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC031300752A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D393F0AB1;
	Mon, 18 May 2026 10:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTFjmCJ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B281A3EFFC1
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101897; cv=none; b=E3G9DMNvXR9pjp58XfgHko6MnI2D1b7+7Tx4yCTFEI/F6+lR5mtaPMUCWoqEbRODnuufHQh08mZftc0DsFYVTxIZgi2nj90C5b4bckXX8z74AHVylRp70K/87IN/zlf+IxKtmxRhyhGnkE7x1foxBpWxpYlVIhlzD/BUSs/n2TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101897; c=relaxed/simple;
	bh=O9YNQzI1HHIKBIBkzsKm32RBLUqeyNJY3cFZr5m9atE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=asMlpYUoeyV0l24ecfkLxudgv96kBoKs03GNv97J7gj8jTxQEKmRWA/usDVT02WTg4OGMueeG5fN6EjlnQ7lBA2+RfNsCblQxgZiBRC1f2+bZ8AUgQACruzCydVXiBWPCJ23Hm1rWxwLJ2U7iXLPshb2mYfSdXXxWSHYUXBt9nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTFjmCJ/; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-837dfccd950so903566b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 03:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779101890; x=1779706690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2bedMT/1wLJU6lQZbrg2nG4yNZCN3FiqAaO+Q+eV5ME=;
        b=MTFjmCJ/8qpHXrmlMsZG0zxmJiaNApJthbgELgKyeGFNuphiV5oHL4GhlDzuQZi6De
         QrSUDQ5LM1bXGHrAU8kfeDW8JYaBigDMEhrljIYoJFhnqlKOYmrd7k4tDLdYCd+MIr1M
         USAn3zHhtACtx4TdUXquMHXjtWtCUx0cDM8Mp0gZVfNin3IwhDTIMhBjIS53SPXDm3qV
         IkhLcZTvjEopiXOjNNQWZMzbKMrbSIEXR696AjEv5JqsULcn2zrxnyNG7DBJA3/Upxs+
         bXo8oEpu9KO82YeGhARrprAkaziMLdMdO+qQUYkSn5KhIiFUiDpRwqonF/YOMQ3kkIKA
         Gs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101890; x=1779706690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bedMT/1wLJU6lQZbrg2nG4yNZCN3FiqAaO+Q+eV5ME=;
        b=JSJToH7vhJiHcIUU+B/dq9fFQzzFph25XveW+NJAKGnDy6aqDj4Fvd5XqZTDTaScXz
         fooyOqskMNJbjqoMuj9wxnyd+f8X+EWyTthddsnh5R3m2+SlXaBfhvyjx9BiQBnkZHcr
         K059TvQ0bAZ/kuxa8dQa94l4dCML27CTzMifaocKBJ1t9CwHi5YGAtaXG0PkJkcvrnK8
         Uck42OlS266t7Gj4xHq/dFtRGKpJZFA6Ba0o+bnQ/Ht/4xrBep4as84uugzL/HE1spKH
         DP9JqLurOIbPFeQBWrSMJZ8f0TncTOSOzt2Z4FZco/aRxo6gkYgBVwmp7BxSYG1I3TbD
         EJpA==
X-Forwarded-Encrypted: i=1; AFNElJ/nTsEzZl427k2nQRqCWtlI6BC5ek5irxGH+PNTTm4TmriQrH5LgvsALcpC6Ti+PGmeUjRzt6xFnsAQJ0al@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmpg7DF24oxJrkygfgOKOeASY533RbXMe92XdL7vSdhpvy9Ebu
	F2QepSeKBjvAd+YD7ph5JQ74/2tw6W3E4mTeSn1GNH1FlQXHCLlWK6HE
X-Gm-Gg: Acq92OEi3GMV9EhAH3fgXPztROS58QxcmrZS+sNmsaTt3sMg6gJgGXygGabCMFEhROQ
	H7dXKrTurwbdtt5VxIihM78UpZtkns0Q34vkbOPatWYHGzQXyFBnEby2dhLHA0jO+xeyGec5Z2M
	vRy6svmzEAjdwX31jr99ATt5dMerzxMpD+pO3RLfNVKzTZhMG1/iedS/O8TLGcHrR9dtgU90V9F
	su5jn29n01hx/th4uAQOMWcxmXGIyNNjwL3DhuGuNlzEUIXLqY+H2bIIx+nb499UEEdExMCkg0z
	dfmilUtY/MC9TGHIYYzsb0tmPIByyMN5UqEdazyfNcOh2VQpwodB2tjV7WrL+4d5IoAl6+wXB24
	g5xYlANEZgjyBvuBdDyAsft/edMCgf54J2hK+YYJgKvWkK+6hD/O6rN8VhuI027np4kjKP0AuEH
	y55nBlgZO6gTDKkw==
X-Received: by 2002:a05:6a00:4403:b0:834:e882:3280 with SMTP id d2e1a72fcca58-83f33cef68amr14145948b3a.31.1779101890282;
        Mon, 18 May 2026 03:58:10 -0700 (PDT)
Received: from lgs.. ([101.36.109.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196818efsm17201275b3a.16.2026.05.18.03.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:58:09 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: qcom: iris: avoid double free on video register failure
Date: Mon, 18 May 2026 18:57:55 +0800
Message-ID: <20260518105755.988961-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6F14956B18D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-108166-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

iris_register_video_device() allocates a video_device with
video_device_alloc() and releases it from the err_vdev_release error path
if video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  iris_register_video_device()
    -> err_vdev_release
       -> video_device_release(vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vdev through vdev->release().
iris_register_video_device() then releases vdev exactly once from
err_vdev_release. Restore video_device_release() after successful
registration so the registered device keeps its normal lifetime handling.

Clear the cached decoder or encoder video_device pointer on failure since
it is assigned before video_register_device().

This issue was found by a static analysis tool I am developing.

Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..0d259f9b22a1 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -151,7 +151,7 @@ static int iris_register_video_device(struct iris_core *core, enum domain_type t
 	if (!vdev)
 		return -ENOMEM;
 
-	vdev->release = video_device_release;
+	vdev->release = video_device_release_empty;
 	vdev->fops = core->iris_v4l2_file_ops;
 	vdev->vfl_dir = VFL_DIR_M2M;
 	vdev->v4l2_dev = &core->v4l2_dev;
@@ -174,11 +174,17 @@ static int iris_register_video_device(struct iris_core *core, enum domain_type t
 	if (ret)
 		goto err_vdev_release;
 
+	vdev->release = video_device_release;
 	video_set_drvdata(vdev, core);
 
 	return 0;
 
 err_vdev_release:
+	if (core->vdev_dec == vdev)
+		core->vdev_dec = NULL;
+	if (core->vdev_enc == vdev)
+		core->vdev_enc = NULL;
+
 	video_device_release(vdev);
 
 	return ret;
-- 
2.43.0


