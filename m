Return-Path: <linux-arm-msm+bounces-115014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KtseC0RcQmrN5QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:51:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 277AB6D9A7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:51:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=PuKdQKTO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115014-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115014-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 479BB31043AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC93403B14;
	Mon, 29 Jun 2026 11:31:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFED402BA1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:31:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732662; cv=none; b=HAW06WpuZuarQC003js/+vaDFCpPla39s9mfPfE+PtcJpkQtEdVSFXj6KeHISDLuVjjjhbQI1UpCpEkoT6UICScrdwktO+lf4aR6pSu9ehuveRHrpEV4nmCOeY5/WaCO2qNw/xYubUTdS6pelCrvAh8bXpSSpI5hqX200ibmHGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732662; c=relaxed/simple;
	bh=ZFP65eOMqBrUdH9uFBg2XIXldh3NDouJtW5AEBr19dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qK4K2RO3XRaUDS1UKkX2MkNjU8ACO1jdJl/H3KVLA+z+AGaBrXTDUVUyaZ5xgEAIfKiIcMInGfVTtVn+qxAVcvbJ94XVZ3zTHP9L3LrMTA9QOlx4yo4F5AjlzETyQzZLQ5yUPgds568IfVVVeQor+D4CzoMpl29r5iliwQYTL4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PuKdQKTO; arc=none smtp.client-ip=209.85.167.42
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb91c003eso802329e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782732658; x=1783337458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2h4vq6YMyhV7+/J+J80e8AqbTVSrOVELjNsb0fjYJrU=;
        b=PuKdQKTOveSigBh9f5nUsZqgRrzMfbbcKif/dsEEZNiGtutUQjqlLSR8uvi7zG/yOr
         r3qevowzNc4WWweXv9gaCzehQEJwLVBYhWef5uynBprdTuJ5sWVLnvE8rAJ7YpM+3cDj
         fy+oc7uJQioUbnoP19MoFV/ggzR0WFiMHQK04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732658; x=1783337458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2h4vq6YMyhV7+/J+J80e8AqbTVSrOVELjNsb0fjYJrU=;
        b=k4HT3IYzPJEpq8gJQpmW36EMBtZtjj/d7iIA8x8vH7O80J95bTYwklHyaQ41tm9EwZ
         ZMuyzdlit8PqLxz1KaNd/II/Cp83oLda5db9sGMIhA8U0pezg4Fx9AaObRcB/gAdnUcj
         FeeE2fIejQ92LhIyAv/0RDZPQMiI2FV1DOlla/XzUAzC4jftIa9RZM6nvXiPxuD1rG4+
         iVs55pb9SDA6VU30+plCExckAZZ17lMriguDrwUo3OcKvoNrkFEDgFKwLd7WI0oxI4W6
         tb3CA8WqwVAh5DZyuXvXltMPWIeC8GyMLvuYKZfzlnTQTCspdBgKK14CCNty30yo0r0+
         kRzw==
X-Forwarded-Encrypted: i=1; AHgh+RoZV8fSiuDJHxwlL74KU7XJeYEsLtY46/0DU6Vg7t7yyjJiwpQ3tO7Ig/OdeDY7eRrYX8LeW4NAhP3QiFaY@vger.kernel.org
X-Gm-Message-State: AOJu0YyBJqyVPxBgzEe20xHXPTrvy8QIdIYFWSUyvFN3zg6BUIqtkVM+
	mlmQgca0QY7ss09FCck9JWWmJ6gyzc7oztKNfz0CFjM1VS9rnMg3/Q65Ol4PkqIPXw==
X-Gm-Gg: AfdE7cnAmVXq3RWhKwqiTPHfZJ/j13PMroC3DXGNOxtWcNUbKpXRWTm8jvbQDVmuZzi
	B/T+l/6MoEJ9tufOhp6sbF7V61rHaTwUleJgv+DlXP47fYvCU2TlSRXlq6cz42gHPAbmL/b7WoK
	vcbwFWr18CzsZU/K9cpleHbFkgC3KE/cvPDq+PfFiJNEDXyhKVFwi7OrIEGh2UtgCe+GlP1qRmv
	+2T8ShP+bVpzAwWe6klpIB4B0RHPPPDcK/hgiDd0unvnPROSWK/Jm3mu3KMV7T9soRn45lQ+j5G
	wevgKiTdgqez/At95K5xImTbLgcchbhEzQK58TXPSu0mXaQJS8HCuBMN6lXuyri07X6ygWXI8mw
	HTirGgeZ/KJUjP4ES/B/7q3MWFivwrpzWPTEBWek8krPaMoS8791L8qlMDujYk8AFKlrzox7yxn
	OaOwCByhk/kB/F/mTSNlAWXU7qwjGGhNzkOwyLvsSBSJkGyKF3iqHJ8m/0XLOJhfjTMTlB
X-Received: by 2002:a05:6512:135a:b0:5ae:b6b4:f20f with SMTP id 2adb3069b0e04-5aeb6b4f2b7mr1088221e87.53.1782732658474;
        Mon, 29 Jun 2026 04:30:58 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2cffc04sm3597745e87.17.2026.06.29.04.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:30:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 11:30:50 +0000
Subject: [PATCH 9/9] media: drivers/media/dvb-core: CodeStyle for
 dvb_frontend_open()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-cocci-7-2-v1-9-5884c80ee3b6@chromium.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115014-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 277AB6D9A7E

We can rearrange a bit the function to reduce the indentation levels.

No functional change added to this patch.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvb_frontend.c | 49 ++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 791834e088b6..0286da57f382 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -2875,7 +2875,6 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 	struct dvb_device *dvbdev = file->private_data;
 	struct dvb_frontend *fe = dvbdev->priv;
 	struct dvb_adapter *adapter = fe->dvb;
-	int ret;
 
 	dev_dbg(fe->dvb->device, "%s:\n", __func__);
 	if (fe->exit == DVB_FE_DEVICE_REMOVED)
@@ -2893,36 +2892,32 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 				return -EBUSY;
 			adapter->mfe_dvbdev = dvbdev;
 		}
-	} else {
-		if (!adapter->mfe_dvbdev) {
+		return __dvb_frontend_open(inode, file);
+	}
+
+	if (!adapter->mfe_dvbdev) {
+		adapter->mfe_dvbdev = dvbdev;
+	} else if (adapter->mfe_dvbdev != dvbdev) {
+		struct dvb_device *mfedev = adapter->mfe_dvbdev;
+		struct dvb_frontend *mfe = mfedev->priv;
+		struct dvb_frontend_private *mfepriv = mfe->frontend_priv;
+		int ret;
+
+		ret = wait_dvb_frontend(adapter, mfedev);
+		if (ret)
+			return ret;
+
+		if (adapter->mfe_dvbdev != dvbdev) {
+			mfedev = adapter->mfe_dvbdev;
+			mfe = mfedev->priv;
+			mfepriv = mfe->frontend_priv;
+			if (mfedev->users != -1 || mfepriv->thread)
+				return -EBUSY;
 			adapter->mfe_dvbdev = dvbdev;
-		} else if (adapter->mfe_dvbdev != dvbdev) {
-			struct dvb_device
-				*mfedev = adapter->mfe_dvbdev;
-			struct dvb_frontend
-				*mfe = mfedev->priv;
-			struct dvb_frontend_private
-				*mfepriv = mfe->frontend_priv;
-
-			ret = wait_dvb_frontend(adapter, mfedev);
-			if (ret)
-				return ret;
-
-			if (adapter->mfe_dvbdev != dvbdev) {
-				mfedev = adapter->mfe_dvbdev;
-				mfe = mfedev->priv;
-				mfepriv = mfe->frontend_priv;
-				if (mfedev->users != -1 ||
-				    mfepriv->thread)
-					return -EBUSY;
-				adapter->mfe_dvbdev = dvbdev;
-			}
 		}
 	}
 
-	ret = __dvb_frontend_open(inode, file);
-
-	return ret;
+	return __dvb_frontend_open(inode, file);
 }
 
 static int dvb_frontend_release(struct inode *inode, struct file *file)

-- 
2.55.0.rc0.799.gd6f94ed593-goog


