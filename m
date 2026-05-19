Return-Path: <linux-arm-msm+bounces-108431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KfWOYIqDGqwYAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:16:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A94B357B0F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C219303C794
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C713EFD28;
	Tue, 19 May 2026 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SatVj3yh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8111E3F0744
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181907; cv=none; b=AFufA8CU7KdrxTD3SyIgXSGB/WVkTQlN+WI4yyugVtsYyu2yAZzUbez2rc89wm9lFT3oyqnZ+Pbp0AwJovM3JX5Owz5Iv5136ReibvlC1EcYqwDaKLRvCPTtxEvjgr6o2VTVgvgfz0a1kXJXHVNdmFd8dNk5VfzReQKbsVxvH/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181907; c=relaxed/simple;
	bh=bO38FoplUF0OGefgQu5Ge6i3It4LuEiVmTb7e877Jfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ERt5+GiwpP4EBA2cCgAz2Vi8UFrTu0eE/VshyLC++EEKebgmqllR/FqV7v2MnANpTfUFhclL1pEOA+pPhZOdj+DHCS0Ir3mC+3IZvy+QcymnHw0LtfCjmPBHU/MioWDykfa4tsPyezdv2ZtFVuKORlOib91g45KAKhMWjOmSNSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SatVj3yh; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c80227c9572so1492665a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 02:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779181906; x=1779786706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NeHeRdGkO0e2zRMbKYJezoLxkuEvt+FGgdG9h+Dao0E=;
        b=SatVj3yhK7pULLb55fh8yNfdp1+n1NlERVYVz0xUmwD4XJp7NOi7c2aRaHwy9aCpCZ
         T9mygHB7ol6lTkSZ69k+VqGNlmGnd6s18siGUYXEjBpGWmqnRSMHCjY0K+kQeJuyaO60
         IBElEBKjkxek8QojcKkD2I6dnajW4Bivm7w20sYCLwM1dEgkOLm/N+24KvABCXETpvKW
         dSxXAsoL+uQsPEr/E+L+lXvkV8u1qB3jQNM0tfV2oSOUbFcROibA3e2MLrdrLs6Afw4G
         x9Yol+QMSmxTzvXxxPqfupRL6hq7egvDGDUaf1IOnBtLdv93SH22+lcIwjwdamB/Ik0k
         styA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779181906; x=1779786706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeHeRdGkO0e2zRMbKYJezoLxkuEvt+FGgdG9h+Dao0E=;
        b=QUrJtjb4Dxy50BHcNT6Hf3J5QAZw2FTbvaMzl4GRgjgsCET0GGL6jtu/j1YGII6uCw
         DS2stVWH9GM7zSSwX8FhTjCnTmXPkdfB7dq97fhyp3P//MGNoDePe63XWtMRD013jWaL
         cQU/t8+ESxIZkd0pNY7mHicUi6ME0rWEpPyqppSMGL2YEiNm0fqCdUSG9UyWjBXHA+E4
         w81lQ99XuRB/CecLQweKSLb53Ga+p7eGnJCF1JF7pjBz7p/CkqHvfdlyz/vTUsUb/GZE
         kIrO195Li1bT/bZLsdUW4TqP7mCoQfsQ5/XS9M1I3YC4GWTUXFFZu4+TrvxhWHqgc3CH
         jdvw==
X-Forwarded-Encrypted: i=1; AFNElJ9brRs4DgEzbXlHZqmRqHdpawxjMtl3mGBsqWw+1m0zIlNqhdh4I0P7mcSDDK9uH2EtJpJuDX7+jjl6+2Qm@vger.kernel.org
X-Gm-Message-State: AOJu0YxDn9iF8T/0n5qwWpcl5Ogg0kDz4sqFsU3QB2NZw3XdQXfb0/jP
	8Sn2rgRlN9rgfipGkbjcv9GXg+IqsMw8FbGRjStjR8fxNzplvtQNkohFisTLQwKEIJY=
X-Gm-Gg: Acq92OFKDFriN34nhYzxmAe1cjhyGRA03X+oTe1Nxiu27pxvGvvJ7J52A6rvfw8iBvP
	k3YKshKyP3o5FJ+uiL46SAJk3N2FrA2bIVWNnATyh8QTUxwlOvBPVpvj9Dz/HDauzStR/iMNwDG
	/dSyhmPeDioMwZWZ5srJX9C/BNIB/lxNo4ElwtN4U97cMSRlzEVg2nbNtAVbtRtqn9jehGUL0n2
	U1tsWsM1yjIUjuh8ekINn971p/qBhZ11fGm4OqAGCuSy5iLuDp3zm222JVUpky/JVREwDa5NR0P
	+BZu0aaMOSh3hl1N84kJKUqttBCM2sSZU1iGEHSPrb5poYtMYniW2TytEwsjS+SaNBr4/o222pn
	DW8mKnr/IrODyzheN6nP4gRcWNySbp/UTzD4HiUp3UsaMk6b5SifqTysmMIDAdz/Y+hyL3aHxPO
	NBGY8TCQ==
X-Received: by 2002:a05:6a21:32a7:b0:39f:a8fb:3354 with SMTP id adf61e73a8af0-3b22e71ff87mr21414233637.17.1779181905823;
        Tue, 19 May 2026 02:11:45 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0626b2sm20595369a12.6.2026.05.19.02.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:11:45 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stanimir Varbanov <stanimir.varbanov@linaro.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: venus: venc: avoid double free on video register failure
Date: Tue, 19 May 2026 17:08:19 +0800
Message-ID: <20260519090819.1041314-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-108431-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A94B357B0F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

venc_probe() allocates a video_device with video_device_alloc() and
releases it from the err_vdev_release error path if
video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  venc_probe()
    -> err_vdev_release
       -> video_device_release(vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vdev through vdev->release().
venc_probe() then releases vdev exactly once from err_vdev_release.
Restore video_device_release() after successful registration so the
registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: aaaa93eda64b ("[media] media: venus: venc: add video encoder files")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/qcom/venus/venc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index bf53267cb68d..9a5a025607fb 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1579,7 +1579,7 @@ static int venc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	strscpy(vdev->name, "qcom-venus-encoder", sizeof(vdev->name));
-	vdev->release = video_device_release;
+	vdev->release = video_device_release_empty;
 	vdev->fops = &venc_fops;
 	vdev->ioctl_ops = &venc_ioctl_ops;
 	vdev->vfl_dir = VFL_DIR_M2M;
@@ -1590,6 +1590,7 @@ static int venc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_vdev_release;
 
+	vdev->release = video_device_release;
 	core->vdev_enc = vdev;
 	core->dev_enc = dev;
 
-- 
2.43.0


