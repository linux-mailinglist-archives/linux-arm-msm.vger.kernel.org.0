Return-Path: <linux-arm-msm+bounces-115013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n6BIKs9ZQmrl5AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:41:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE1E6D98A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:41:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=GbaJXqxS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115013-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115013-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B44273070F03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19EE403AF7;
	Mon, 29 Jun 2026 11:31:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613904028C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:30:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732661; cv=none; b=hWQ3k1d6+C3m7WUke6k+PmHtSLHVpVUYTlRu45ZFOqAR7pH+sb15Bp5diOCy+nqUVXcqH4MseNfkimSmHlGf+BPOH+J2wj2/Qk9p3ThnVb7ZOHB9HrO73Ife9T+qFhpYU3rfMRfN7DO/TtIpGOmuRl8vqQpRyiq1uxm7d0Dqh1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732661; c=relaxed/simple;
	bh=fVSsipjqfFjmKIgDvHYn/aOCO3VS/MORnhB3D6YoAnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XzoHBrjPFGFvDYn6Q6R1PfdGT7fluuKJN0yHi3oI23xllOc3cX9aY4jLs7g5UYdImFh4AbgHT6r3H7+tFuazWkVCAenucBK3l0K4NTcj6CHw3JPBuFNAGP0/L2/z+Yv5IQPT/BtlVu1JzBVmRP49CMEOrfQN3T1swzw0jFa8hf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GbaJXqxS; arc=none smtp.client-ip=209.85.167.42
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb77b3afbso1308121e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782732658; x=1783337458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+j83kG36DsCnonwHw1dZITPK+XZ4QpuUae6YxajbFU=;
        b=GbaJXqxSu5+nlXgs6+RSwSh2rWFbicki16YL9GpJWJXzG5L4YM6fInBRscKHOj32+K
         3tjsG6XyYakxL/lTEjZ6v2lK3C6rsiFARdwixDVvuxz/rtpskHD6a9DfTzeP9Y2YvEIU
         8sujqJZjxYOAcHy+odfwwrIpO5ehxTS3W4Tg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732658; x=1783337458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B+j83kG36DsCnonwHw1dZITPK+XZ4QpuUae6YxajbFU=;
        b=dlGCjWpjjLF+h3aglfIvs4lx++rRCbJTl+1iaLRexLeQARtWJS1ps9NdfcCrFzl2nN
         KgpA1xJj9ywS352lm8weJAgQMNdnLaTOVZz+M5zF/JIRiqVlhTaXFnLs9Hxwu1XAMglX
         lIcR3MoeRDamsj9iZWaRoc0MDr1G/udvt/fFjZo/U2oknsLCLbk1J0GCohq23BrMmuBl
         sFOx0AkGol2Sr5SZ4Bo/3e2+jwZf48CjtwqOVREoCIyhbEGYl+a0/BNKTOk3PET0jAru
         pWN/KKsVOiy/LgRfSzdLC89G2lrR3FeLGx0tafUYiGOIV5Y2xg2ecNnJpTbKw3Bv9Gyc
         7W5g==
X-Forwarded-Encrypted: i=1; AHgh+Rr1wIJMn9b62RZFV6t1hUH/T6y2iV83rV4MvdDc0Zts1Eo/m0lIXt6zB5mWLrSo7UwecUw92pg/1DMB7i4r@vger.kernel.org
X-Gm-Message-State: AOJu0Yweovuf7k6ugDiM9kFxg0ARjfA9j6o7NVvmp4+df1nl4v6q+r7G
	yfLUTqHGNuwHfz0x+Y00weFEka+AoZzasLx/wSvzEIDqSr7O6smXGRdEj3ybF9CNEg==
X-Gm-Gg: AfdE7cl/p/d5uls4hTqsxWye+N6oZVhoNrH5eFegrTBMkbn3gsZtRit0g3jOhXCYzX6
	Vj0knzln99j8sdVDvdw3fG8gJIgvQRLzgRbPmJmPE1jYhGhk5EHW0WruWi6JuzTpY9970ZiuP72
	BzlgaV90RPUd4LtvD9KKT8mUlwWMVozYJzrDV/52GuWlaH6h6KAevjGwaUdT7u3ReyJyXLW+FCF
	73s1tLhhDCyHi0BCCmAx0lRmralfDDX4vehJqvjbELzspT8pBEUvNmkCLfciYevT6Cb+K6uJ63v
	f6n8AKkh+csf2vwU73ZZBsPdfTXxuWmduMo7VKKu6azXe7Tsa4ez2mFabpegIEOKBsL1cvn0ZL1
	b/gVeVTawiVhGU5Ic2sC7OkaSt/Ggu4REQRe+jYDAYWrBlDxfvCifcp2xLcVDEgC/rriUx/Wyhn
	ApSIReq36C+I8RwDarAVnyB/eFuhbR2FTMlb62eaFKtQreBWCQ2ZuPGwW/0Y/OBFQv4qUk
X-Received: by 2002:a05:6512:3b22:b0:5ae:b5a9:6e88 with SMTP id 2adb3069b0e04-5aeb5a97175mr1119424e87.53.1782732657693;
        Mon, 29 Jun 2026 04:30:57 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2cffc04sm3597745e87.17.2026.06.29.04.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:30:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 11:30:49 +0000
Subject: [PATCH 8/9] media: drivers/media/dvb-core: Refactor
 dvb_frontend_open locking
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-cocci-7-2-v1-8-5884c80ee3b6@chromium.org>
References: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
In-Reply-To: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Du <bin.du@amd.com>, 
 Nirujogi Pratap <pratap.nirujogi@amd.com>, 
 Sultan Alsawaf <sultan@kerneltoast.com>, 
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Abylay Ospan <aospan@amazon.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Bin Du <Bin.Du@amd.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115013-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:skhan@linuxfoundation.org,m:kieran.bingham@ideasonboard.com,m:bin.du@amd.com,m:pratap.nirujogi@amd.com,m:sultan@kerneltoast.com,m:Svetoslav.Stoilov@amd.com,m:sakari.ailus@linux.intel.com,m:aospan@amazon.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:Bin.Du@amd.com,m:ribalda@chromium.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DE1E6D98A7

Split out the wait function, and introduce some new toys: guard and
lockdep.

This fixes the following cocci warnings:
drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2776
drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2786
drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2809

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvb_frontend.c | 58 ++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 21 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index d99b0348df54..791834e088b6 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -30,6 +30,7 @@
 #include <linux/kthread.h>
 #include <linux/ktime.h>
 #include <linux/compat.h>
+#include <linux/lockdep.h>
 #include <asm/processor.h>
 
 #include <media/dvb_frontend.h>
@@ -2841,6 +2842,34 @@ static int __dvb_frontend_open(struct inode *inode, struct file *file)
 	return ret;
 }
 
+static int wait_dvb_frontend(struct dvb_adapter *adapter,
+			     struct dvb_device *mfedev)
+{
+	struct dvb_frontend *mfe = mfedev->priv;
+	struct dvb_frontend_private *mfepriv = mfe->frontend_priv;
+	int mferetry = (dvb_mfe_wait_time << 1);
+	int ret = 0;
+
+	lockdep_assert_held(&adapter->mfe_lock);
+
+	if (mfedev->users == -1 && !mfepriv->thread)
+		return 0;
+
+	mutex_unlock(&adapter->mfe_lock);
+
+	while (mferetry-- && (mfedev->users != -1 || mfepriv->thread)) {
+		if (msleep_interruptible(500))
+			if (signal_pending(current)) {
+				ret = -EINTR;
+				break;
+			}
+	}
+
+	mutex_lock(&adapter->mfe_lock);
+
+	return ret;
+}
+
 static int dvb_frontend_open(struct inode *inode, struct file *file)
 {
 	struct dvb_device *dvbdev = file->private_data;
@@ -2855,19 +2884,16 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 	if (!adapter->mfe_shared)
 		return __dvb_frontend_open(inode, file);
 
+	guard(mutex)(&adapter->mfe_lock);
+
 	if (adapter->mfe_shared == 2) {
-		mutex_lock(&adapter->mfe_lock);
 		if ((file->f_flags & O_ACCMODE) != O_RDONLY) {
 			if (adapter->mfe_dvbdev &&
-			    !adapter->mfe_dvbdev->writers) {
-				mutex_unlock(&adapter->mfe_lock);
+			    !adapter->mfe_dvbdev->writers)
 				return -EBUSY;
-			}
 			adapter->mfe_dvbdev = dvbdev;
 		}
 	} else {
-		mutex_lock(&adapter->mfe_lock);
-
 		if (!adapter->mfe_dvbdev) {
 			adapter->mfe_dvbdev = dvbdev;
 		} else if (adapter->mfe_dvbdev != dvbdev) {
@@ -2877,34 +2903,24 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 				*mfe = mfedev->priv;
 			struct dvb_frontend_private
 				*mfepriv = mfe->frontend_priv;
-			int mferetry = (dvb_mfe_wait_time << 1);
-
-			mutex_unlock(&adapter->mfe_lock);
-			while (mferetry-- && (mfedev->users != -1 ||
-					      mfepriv->thread)) {
-				if (msleep_interruptible(500)) {
-					if (signal_pending(current))
-						return -EINTR;
-				}
-			}
 
-			mutex_lock(&adapter->mfe_lock);
+			ret = wait_dvb_frontend(adapter, mfedev);
+			if (ret)
+				return ret;
+
 			if (adapter->mfe_dvbdev != dvbdev) {
 				mfedev = adapter->mfe_dvbdev;
 				mfe = mfedev->priv;
 				mfepriv = mfe->frontend_priv;
 				if (mfedev->users != -1 ||
-				    mfepriv->thread) {
-					mutex_unlock(&adapter->mfe_lock);
+				    mfepriv->thread)
 					return -EBUSY;
-				}
 				adapter->mfe_dvbdev = dvbdev;
 			}
 		}
 	}
 
 	ret = __dvb_frontend_open(inode, file);
-	mutex_unlock(&adapter->mfe_lock);
 
 	return ret;
 }

-- 
2.55.0.rc0.799.gd6f94ed593-goog


