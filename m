Return-Path: <linux-arm-msm+bounces-115012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H+5dJkdbQmpg5QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:47:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 000156D99D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:47:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b="NxzTI0/s";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115012-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115012-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5BC632107F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0B9403AE4;
	Mon, 29 Jun 2026 11:31:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8A440242D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:30:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732661; cv=none; b=aQznyjiZDEME+8k8ZEmiyBF2GHlCXLRLLStOdIpkGuG7RSlIB1jZCy5acrUBnOoN/N3GKls1KgDhYZ4CQ3HialGNpRv8DMxA0yzhRS7M03yn+u76DSx1U5qqPxTireuWXFYrSvgKRU5JfVZnAKzpk0GFz05axtGCzkMViD/uFE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732661; c=relaxed/simple;
	bh=T+u31/tYPCIKbHePCAx6XE3/fgW1CfS9TMPZrMbED38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GH8KYxOVItDADA+ppsOK89U3yh89740GEZHPXcodoIW9oR5g94G28Gtc7dlq0f+I3JG4BlwOcgG69moPOfuaNW0r+EuwRBlzQa1LL2mYQXkFE6e8sqAONsXd5AI3KWHcHIxwLQDK2hT2vki070t9i+i+xZgj0wQwavFugkO/CvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NxzTI0/s; arc=none smtp.client-ip=209.85.167.45
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aebba706b3so450866e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782732657; x=1783337457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sHjaE+SllLx+V+I0hkc13cI6sSMbqhb4Wet+ebSYTM=;
        b=NxzTI0/s2mITMGEHDHkbU6l4WC08lCHCfwnRd4qOe/272GDpRT5eC9O5K0tOV67KC4
         FqClaXzf1lYd0C91g89JPx1WSohEN9ZArp7t07YEz1ExfUwjZKhuWzvOQCt5PYH46cdb
         45vCxCgabXzulzwiqLMu39EYaptsrgGqmWk+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732657; x=1783337457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5sHjaE+SllLx+V+I0hkc13cI6sSMbqhb4Wet+ebSYTM=;
        b=VKUdi/U8LYZFMlJqy4ACWt3IjtNc7K4zWXwqzXHKSRZIw67ELQIGJtC7w+KgJUH3lw
         mbSa/tg86loK4L2Oin3aZDim+usqdez/VcqoZj54X4SxO28+YKXwUN/XNbDDN9jV8meV
         BlbQalB4bvnRw+SmyyEpPhTGliSHEubY6pw86O5uLWz4eyTHbdNGHnvZdMwzp9SP+rNs
         vnWsU0aSd8X32uMXriy1ovX1NffxR5PLezrN25bhXtuJogPLzUo86l+HlcLCMMf6AOT8
         ESxTzUMaJcg7O9OO/MeRo5s/47w/khMlhu37XF0RMHvPt9uw2qCzORD0pkZqWSejOKNG
         yDjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqiO7wmdu8R+aQ9QzYPJHaxDAMVRkEERDCQe80OL+2EvHXQ7Qw6sJ5lkWJwGM2DTTWyT92DrHN/C6d7VU9@vger.kernel.org
X-Gm-Message-State: AOJu0YwuHa2DhWBpbVbC+WFVT3A60AWvpT9ZUEElkIV9VKN7urr7iXgM
	VU0L+kI7eoiBuKSVGrXOEo+YvFWZmqIqbkXrRCez962oPudZQ74bDxPkijBZzUFHJQ==
X-Gm-Gg: AfdE7cl9IE0usmHdi3ZDuTFxlt7y96crLmMIraDWoW64VxerckjdwLvfdgkq0v77Zhi
	Vlukfj5K8Zp+ql4iCKe5nYk0LOvAWZa13WnulojAnfTxz7nwW1C78DGfSWrNhckbwIleDV+erZI
	bY+HkD6KprS9QL6EEdcUrHnTUtTPdxV5zxO/0itazRjuN73TmnnJ9ixAuz249PbPLUX4x3CNqS4
	xy5BQTVt69vbpt12RtLs3ezHSEOUjOUciVdzkc0wX+c4qghY11Frs8EfMwgmPLGBQDWIkqd9RyS
	nLw61fq1+uA5h+1Igl66AszfBjUUDJnz7rGodV6oLl3+I9Allsi3QrCOqnwkzsL9UhZ7HrxMXkZ
	VFSJf9ybJRb4YXFHbsKX/E9ZFiXbdwsbWte+BstFUQzlLbrGufe5OwDvknTBtm5teE/7xMjJ5z/
	poNTjpGvvcLK0Jg4bsRWWyw8+BT0tmTSStCCBf4IDLkPr3tYI0bcRv5iCSwAbiZEh/IiSsoUquT
	yPJMTc=
X-Received: by 2002:a05:6512:350d:b0:5ae:bae2:f0df with SMTP id 2adb3069b0e04-5aebae2f1e2mr482972e87.10.1782732656837;
        Mon, 29 Jun 2026 04:30:56 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2cffc04sm3597745e87.17.2026.06.29.04.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:30:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 11:30:48 +0000
Subject: [PATCH 7/9] media: drivers/media/dvb-core: Split
 dvb_frontend_open()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-cocci-7-2-v1-7-5884c80ee3b6@chromium.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115012-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 000156D99D3

Move the actual opening to its own function.

Not intended code change. This is a preparation for the next patch.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvb_frontend.c | 148 ++++++++++++++++++----------------
 1 file changed, 80 insertions(+), 68 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index d082b6c57c76..d99b0348df54 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -2760,77 +2760,25 @@ static __poll_t dvb_frontend_poll(struct file *file, struct poll_table_struct *w
 	return 0;
 }
 
-static int dvb_frontend_open(struct inode *inode, struct file *file)
+static int __dvb_frontend_open(struct inode *inode, struct file *file)
 {
 	struct dvb_device *dvbdev = file->private_data;
 	struct dvb_frontend *fe = dvbdev->priv;
 	struct dvb_frontend_private *fepriv = fe->frontend_priv;
-	struct dvb_adapter *adapter = fe->dvb;
 	int ret;
 
-	dev_dbg(fe->dvb->device, "%s:\n", __func__);
-	if (fe->exit == DVB_FE_DEVICE_REMOVED)
-		return -ENODEV;
-
-	if (adapter->mfe_shared == 2) {
-		mutex_lock(&adapter->mfe_lock);
-		if ((file->f_flags & O_ACCMODE) != O_RDONLY) {
-			if (adapter->mfe_dvbdev &&
-			    !adapter->mfe_dvbdev->writers) {
-				mutex_unlock(&adapter->mfe_lock);
-				return -EBUSY;
-			}
-			adapter->mfe_dvbdev = dvbdev;
-		}
-	} else if (adapter->mfe_shared) {
-		mutex_lock(&adapter->mfe_lock);
-
-		if (!adapter->mfe_dvbdev)
-			adapter->mfe_dvbdev = dvbdev;
-
-		else if (adapter->mfe_dvbdev != dvbdev) {
-			struct dvb_device
-				*mfedev = adapter->mfe_dvbdev;
-			struct dvb_frontend
-				*mfe = mfedev->priv;
-			struct dvb_frontend_private
-				*mfepriv = mfe->frontend_priv;
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
-
-			mutex_lock(&adapter->mfe_lock);
-			if (adapter->mfe_dvbdev != dvbdev) {
-				mfedev = adapter->mfe_dvbdev;
-				mfe = mfedev->priv;
-				mfepriv = mfe->frontend_priv;
-				if (mfedev->users != -1 ||
-				    mfepriv->thread) {
-					mutex_unlock(&adapter->mfe_lock);
-					return -EBUSY;
-				}
-				adapter->mfe_dvbdev = dvbdev;
-			}
-		}
-	}
-
 	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl) {
 		if ((ret = fe->ops.ts_bus_ctrl(fe, 1)) < 0)
-			goto err0;
-
-		/* If we took control of the bus, we need to force
-		   reinitialization.  This is because many ts_bus_ctrl()
-		   functions strobe the RESET pin on the demod, and if the
-		   frontend thread already exists then the dvb_init() routine
-		   won't get called (which is what usually does initial
-		   register configuration). */
+			return ret;
+
+		/*
+		 * If we took control of the bus, we need to force
+		 * reinitialization.  This is because many ts_bus_ctrl()
+		 * functions strobe the RESET pin on the demod, and if the
+		 * frontend thread already exists then the dvb_init() routine
+		 * won't get called (which is what usually does initial
+		 * register configuration).
+		 */
 		fepriv->reinitialise = 1;
 	}
 
@@ -2871,8 +2819,6 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 
 	dvb_frontend_get(fe);
 
-	if (adapter->mfe_shared)
-		mutex_unlock(&adapter->mfe_lock);
 	return ret;
 
 err3:
@@ -2891,9 +2837,75 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 err1:
 	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl)
 		fe->ops.ts_bus_ctrl(fe, 0);
-err0:
-	if (adapter->mfe_shared)
-		mutex_unlock(&adapter->mfe_lock);
+
+	return ret;
+}
+
+static int dvb_frontend_open(struct inode *inode, struct file *file)
+{
+	struct dvb_device *dvbdev = file->private_data;
+	struct dvb_frontend *fe = dvbdev->priv;
+	struct dvb_adapter *adapter = fe->dvb;
+	int ret;
+
+	dev_dbg(fe->dvb->device, "%s:\n", __func__);
+	if (fe->exit == DVB_FE_DEVICE_REMOVED)
+		return -ENODEV;
+
+	if (!adapter->mfe_shared)
+		return __dvb_frontend_open(inode, file);
+
+	if (adapter->mfe_shared == 2) {
+		mutex_lock(&adapter->mfe_lock);
+		if ((file->f_flags & O_ACCMODE) != O_RDONLY) {
+			if (adapter->mfe_dvbdev &&
+			    !adapter->mfe_dvbdev->writers) {
+				mutex_unlock(&adapter->mfe_lock);
+				return -EBUSY;
+			}
+			adapter->mfe_dvbdev = dvbdev;
+		}
+	} else {
+		mutex_lock(&adapter->mfe_lock);
+
+		if (!adapter->mfe_dvbdev) {
+			adapter->mfe_dvbdev = dvbdev;
+		} else if (adapter->mfe_dvbdev != dvbdev) {
+			struct dvb_device
+				*mfedev = adapter->mfe_dvbdev;
+			struct dvb_frontend
+				*mfe = mfedev->priv;
+			struct dvb_frontend_private
+				*mfepriv = mfe->frontend_priv;
+			int mferetry = (dvb_mfe_wait_time << 1);
+
+			mutex_unlock(&adapter->mfe_lock);
+			while (mferetry-- && (mfedev->users != -1 ||
+					      mfepriv->thread)) {
+				if (msleep_interruptible(500)) {
+					if (signal_pending(current))
+						return -EINTR;
+				}
+			}
+
+			mutex_lock(&adapter->mfe_lock);
+			if (adapter->mfe_dvbdev != dvbdev) {
+				mfedev = adapter->mfe_dvbdev;
+				mfe = mfedev->priv;
+				mfepriv = mfe->frontend_priv;
+				if (mfedev->users != -1 ||
+				    mfepriv->thread) {
+					mutex_unlock(&adapter->mfe_lock);
+					return -EBUSY;
+				}
+				adapter->mfe_dvbdev = dvbdev;
+			}
+		}
+	}
+
+	ret = __dvb_frontend_open(inode, file);
+	mutex_unlock(&adapter->mfe_lock);
+
 	return ret;
 }
 

-- 
2.55.0.rc0.799.gd6f94ed593-goog


