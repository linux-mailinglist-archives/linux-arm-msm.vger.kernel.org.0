Return-Path: <linux-arm-msm+bounces-117387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q9cWMJ1KTWoMxwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 20:51:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AFE71EBFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 20:51:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PreVC4Ih;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117387-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117387-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FFDF300A126
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 18:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E76376BD7;
	Tue,  7 Jul 2026 18:51:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A9C217F27
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 18:51:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450267; cv=none; b=UGgb4JmI7IyEX0K8f5pvcnhLK6sUM8ERsNWnh70LWiDlIePnhYEa54gqGdVtgBB7oU5JixXfl6Iapivx6F/guH8ie3kmiH9dgR+wmgAtfEDM5Fw8A1iLtaf+6+Ib1KycWJzTGMHnmr8EUaSBTJQ6fq/Oi/Snfk2pjni+jLXkaB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450267; c=relaxed/simple;
	bh=Nw6innSIqpxVWTQoJU1GVIm1ikahkK7AGp/6PZZsT5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t93MlcZS8yL47teSpZTlHcs8pKieyFzCNafNaMTKPmMILFjH13Umv9E0hxOesgfhtkix6V3HvH9fMDCH8FARkS6PUUhlMPRPc+k4SrgBwAs0TjuF5SGMdete8pcbrjWSgqX3ig8i3i2yCvT1xrk+UwVl9P23uLFeekEgFzk9qcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PreVC4Ih; arc=none smtp.client-ip=209.85.160.182
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51bfb91795eso28264261cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 11:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783450265; x=1784055065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rTSr9YvA6zvfbdCXk8bx0rwgDXQY6cKDFEPWMlli5ik=;
        b=PreVC4Ihsc6NPo6oAh/7hscxHs0UNbd7Z9Wx8kr0PMb4KbIGU48eoR+HyqcNLXJi4D
         2gcBMPVXDHX+xD6ZGz83x0pqeXqsFYFM3qGbXekR01qN68wS+uXNAAY8n/ksTFpLy70m
         L6mWMKCT7hhwPzEr4YPhvZo0QFX5sUFnkdjdB5XTaROncbsjInSos8c8hp0HHwhB7uv8
         /ABZSCSfcyXaiLpR+7rMntzSjz5KIpgkBiOGU6SHXOywVO9DYZFLtnUpUTLyj9hq35UH
         1Ji1UcJYERctwAvATCLjzXr1XQBcjrmAsDE/F1ONuk9AnJ5LkEG8RxXFAtVaJkHMkSwX
         jkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783450265; x=1784055065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTSr9YvA6zvfbdCXk8bx0rwgDXQY6cKDFEPWMlli5ik=;
        b=bV4eH+YOPvYeOuqytgdcUnS8/y6FjH0LIx8p0LPWIJL6oLVTSjpp91cstRxHWtMl/1
         c3rcBc7oryE6APEz4DBroBgjajKK+DA3VVKM502RsahB9wiP07gdVcjzhYyYD1ZY0wrc
         D/pefE6Cer3bvoGqxcaL3TnAYP2GQFQFV/ZoukLhnSkIZ1u5jE0O+ItPs5mL29UhbEf0
         NYzGZqPSR4gkmqZ0cG4OuS4+rslwlCl5f+qPU/NhNeclpNmvE1zykD1cdmj6JRYwZKgN
         8+K1C08HJnUhW2GsPeRdYFf5Y5Yudrf6lafJ2XfD50C3Hgw5izRKu0w2azE7npoR89QY
         APpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpm8jSn0fmaEK/aAmoJ83tq2idlFhA/fPW5owQcWni9+5hFnI1UQ5oK33I3MV4lyu1DyT2v2QIrA1Zwk4xv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyul07yYrSXHsGRMTBMzexpYsvogoYIWHshqRmC8zzvUSMn3pNm
	duant23dHiQJfMU85z8FU5JKTeBaawfosR2dcNJOWSedxariMwthMh0R
X-Gm-Gg: AfdE7cnBiMR+R18Si0o92d96RvhVf/9tAOCFWIKm6iNKaM1cuHcvYVFqlDsUfk1RVV6
	++8/8azpx0vWxMmff4j0T17LrAFOi9bE2e4f7n0fWOfjGfgfXGGahCUceuNbyGvs3LxhT+QqcjP
	71/++8XNDlbooa9kImwV7SXiPsHK36P8oeuWNRwzeg6BXKVWlXGjFII/dtrChRVfCKeAlp4VEgt
	SJwsIcBQ4iRLMBhJ8mM2sCKAWnVfiYb6lDnsfJoNkMA1E2vyDiXmM7msRGjbe+JuAOaogqma+ye
	t2MW+ebhi6Y00+3SQSdXhoe0klmeayNeMm0OTS/+vmu4zGNYaEoZreayJAXyXUllQ0LiNPlOtVm
	0/lnZaPWDJ1Jl6kXnDjMfB4v6HWf6dPArpwu699r+deaMGagPE5rafH2j9OnvNX2c6a1mY7vXHe
	ag4h4YUMeDLrrsufqo8+/+0NTQOD6fIiRNNtzbaLMkBzsQbfcfxsZWt1KRc2te1c8EtW6zo5T8Y
	wgLE4IT1hMHVnM=
X-Received: by 2002:a05:622a:2443:b0:517:8069:8b07 with SMTP id d75a77b69052e-51c74801deemr70992621cf.29.1783450264903;
        Tue, 07 Jul 2026 11:51:04 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f471813c8dsm165950936d6.25.2026.07.07.11.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:51:04 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Adam Xue <zxue@semtech.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] bus: mhi: host: Fix controller cleanup on EDL sysfs failure
Date: Tue,  7 Jul 2026 14:51:00 -0400
Message-ID: <20260707185100.424891-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,semtech.com,oss.qualcomm.com,kernel.org,lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117387-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:u.kleine-koenig@baylibre.com,m:zxue@semtech.com,m:krishna.chundru@oss.qualcomm.com,m:kees@kernel.org,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dbgh9129@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dbgh9129@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dbgh9129@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35AFE71EBFD

mhi_register_controller() adds the controller device before creating the
optional trigger_edl sysfs file. If sysfs_create_file() fails, the error
path only drops the device reference and leaves the device registered.

Add a post-device_add() error path that calls device_del() before
put_device(), matching the normal unregister path.

Fixes: 17553ba8e19d ("bus: mhi: host: Add sysfs entry to force device to enter EDL")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/bus/mhi/host/init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 12dcb1a2753c..fd3050889412 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -1029,7 +1029,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	if (mhi_cntrl->edl_trigger) {
 		ret = sysfs_create_file(&mhi_dev->dev.kobj, &dev_attr_trigger_edl.attr);
 		if (ret)
-			goto err_release_dev;
+			goto err_del_dev;
 	}
 
 	mhi_cntrl->mhi_dev = mhi_dev;
@@ -1038,6 +1038,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 
 	return 0;
 
+err_del_dev:
+	device_del(&mhi_dev->dev);
 err_release_dev:
 	put_device(&mhi_dev->dev);
 error_setup_irq:
-- 
2.43.0


