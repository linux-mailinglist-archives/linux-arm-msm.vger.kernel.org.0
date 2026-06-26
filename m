Return-Path: <linux-arm-msm+bounces-114703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dBFvAA+qPmq/JwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 18:34:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CD86D6CF234
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 18:34:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=Y+lA7GXs;
	dkim=pass header.d=redhat.com header.s=google header.b="ppQtAJW/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114703-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114703-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FD1B304126B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 16:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF1F3FE347;
	Fri, 26 Jun 2026 16:33:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD653FDBEF
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 16:33:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491601; cv=none; b=pMWtldBJg6KOvdns/Zu9iEWXqYlMhEYzlKehKzX0mhg1/g0/zWHTcPsTXWsyBxo/yc6DE5kg+pNhS8SnbYXgx18Dd3kNsITDlNJ42Z4yOL96pIS0BKXyoUabYEMuvQn9Cp7k25xGNHK3sXAkWw7BQbuZy7mrvf/hRa4owF1Sg/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491601; c=relaxed/simple;
	bh=0r4awvo3WX8HpQ0jmDWfm41yxp/V5lWErULOVsOPMpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sXpWmjXMMSk8QEskAtg8yn0Qv1liyN+3yjWAM24wZDLv8eE3vNarTvzl9AvOw+Q4EOKgwd6kOOSg4wCgwGNAlaNii9rCdokec6uZcqoJd28hjnQUR6AeS7y5uHSbDGsg1xGG5Gg64AQPcvBEi3cirKTJZ44sREVrLKe8TXgU5hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y+lA7GXs; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ppQtAJW/; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782491598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kw3/l9vbkRy63uWAwl6dQq9fs/WXuwY+XB1uAAWGcwc=;
	b=Y+lA7GXsp+9jM2uDwl3Ld5hJuLuY2afAfm+B+oC+1JQH4XLTluYBJHPJRUANK/1Ti2eY0o
	P29hCRi220FelqU9faCJxYh0EyPP0E8dMT7TzsoyP1Cc0+zzdgWzTZ7vx7cZaaVjxAOgig
	LMaewfAZZxoFHkhCYi4V9xyDuDTvEaU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-tvMl1DHlNW298GYqlqYbkw-1; Fri, 26 Jun 2026 12:33:17 -0400
X-MC-Unique: tvMl1DHlNW298GYqlqYbkw-1
X-Mimecast-MFC-AGG-ID: tvMl1DHlNW298GYqlqYbkw_1782491597
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e06f4680bbso25107736d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 09:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782491597; x=1783096397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kw3/l9vbkRy63uWAwl6dQq9fs/WXuwY+XB1uAAWGcwc=;
        b=ppQtAJW/PXCDrl+6fBWoYy9NB5yYuYtFUoKealljDsoPAuJFDE/yW1HrAm/aulYk2L
         4gW8Y2LAFx+qGrN9DdZ7bpp/glEXgG6Wmyd85SYohk70z2U3cBFLJ1ZjmuR3DX4/+pRF
         qddNrTt0t5l9rrSsunMKx9vXTiai0GzLV7DSyiR/KQMzsuxHyKjIsfRJ3UahCr/WfTrV
         QNZWvmxQpfiR8suiBIPkTOc7bAH5bqplS+JDffAXeWYqK19QKyqbq9tUCyhuSnm2Ynl3
         gziFHxPP85VeZ04bEje9XUd9IzHR9gpGJUzPSQC/6WQewFsUguRa66OusT2oEpsfsW0+
         513g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491597; x=1783096397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kw3/l9vbkRy63uWAwl6dQq9fs/WXuwY+XB1uAAWGcwc=;
        b=BSGgfVs6C4JtEhObCjdm6rpBO7ZD/haOXTxcttjJ1Hzz66k+QqV0ej2a/iDRnJMVQ/
         Y9W55+DMlYWs1cbBncf3quSqnoHF6k0Hp2Y6Tnby6tsVEUncA0w6cQ1Oprxx9vUhyVje
         VPxS58fgKuoKe+YR2OjUUVPqyvT6ma4gxXbbaBN1Mf3KN9F3HrByBhlA8ouJ9vDboenu
         6w/hnKfzrfjGshF0tfaO8GZgDN7yei/Jefmxf8t+UAkFtVKGjWwMUk4X4jTUO6wWvk8W
         aXGIhkqTdyvntmCcJiCxIDAhW/4JpyKsHDoQVAcfBPvYE+i+oSJymBA4YFa7sR8B9ltm
         cGsw==
X-Forwarded-Encrypted: i=1; AHgh+RqavcOrxvPXHLngiJESE3siDTEmXzXCWaYkIAYGhUqUZryCNxTPSuHjoNJWM/J6BFaDH2seS0ys+H1CEWOt@vger.kernel.org
X-Gm-Message-State: AOJu0YzwaAjN+0uWAW4DJSdY4sbs4zvb1VlFPgbnMQgmEeWlJU9hCBAB
	igmlLAJdEgQaGVj94im3oNcZ7yaEA4p2D7nvxShgG8zEekf8nIXv94h3kHzJQjZCe3ds5cWjR3E
	xP9jywY1Cvzzqoc5E7lu/9wuueJ3E8Dep3SlJe9yVzRqMEDbPAA3AlkB31kGboOwSr2M=
X-Gm-Gg: AfdE7ckr84GqyfmqvmMK4h92vzLHE5etK6i8w2oxy/GviSg2nBhf/DYdlbckTJCb6Tb
	UcZPkWVcn4oJoOKL8rMNnSKj8XKQ29XWQlK8wY//9180PW60nBHSjlNfYhd87x6tLGC5gywASZG
	ChebmaZ43ktCEeSGs6HkDKNWMeFtfcUdj1U+b7hkPhVOmpJ+9YrRYlYMfWQHI+QCScySMyfTZKf
	JLV7EThSklfLwFzZPaffF3HJh5TnDEsow9FS6xNuJnSPNGXAxY7E4O7qcuQ+IkprfspnRdDcZUk
	A1SaHm1J8rh+LwUnI/w3xDetLRIv9Ci3bcEUnusj22zTyrPhGJalG2ArT8Sm+GMoeifSX6Sgj2j
	AqkEOM0o/dDUb7SbQ+cRdCEET+wELSzUsCuStoJ+HH9lsPJKOng==
X-Received: by 2002:a05:6214:f08:b0:8ba:3fc9:88ca with SMTP id 6a1803df08f44-8e6d6288e1amr126315816d6.39.1782491596632;
        Fri, 26 Jun 2026 09:33:16 -0700 (PDT)
X-Received: by 2002:a05:6214:f08:b0:8ba:3fc9:88ca with SMTP id 6a1803df08f44-8e6d6288e1amr126314206d6.39.1782491595157;
        Fri, 26 Jun 2026 09:33:15 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018566sm234540526d6.2.2026.06.26.09.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:33:14 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 26 Jun 2026 12:32:44 -0400
Subject: [PATCH 3/4] driver: core: remove dev_set_drv_sync_state()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-clk-sync-state-v1-3-4156d8196dc8@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
In-Reply-To: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=0r4awvo3WX8HpQ0jmDWfm41yxp/V5lWErULOVsOPMpU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLsVh4SmnZ/eu+lX9xbTjbc2WlU6P9o2mTu3INrcnQOn
 quTl1vq0VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEttYw/LPqCjq9dLLlFIv4
 vS+OMCRdDS6NnFbj9jikMjbqctaWUGFGhoXZFyZ9r5+SOvGeS1TQ5jVLJsy9HVIYb5ivJH1gc9/
 hdRwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114703-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,sto.lore.kernel.org:server fail];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:ulfh@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:neil.armstrong@linaro.org,m:dongxuyang@eswincomputing.com,m:jens.glathe@oldschoolsolutions.biz,m:johannes.goede@oss.qualcomm.com,m:mripard@kernel.org,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:bmasney@redhat.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD86D6CF234

dev_set_drv_sync_state() is no longer used since all users have been
migrated to dev_add_sync_state(), so let's go ahead and remove it.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-6
---
 include/linux/device.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index b7a3dd4b56ed..7f71217ecd48 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1128,18 +1128,6 @@ static inline void device_lock_assert(struct device *dev)
 	lockdep_assert_held(&dev->mutex);
 }
 
-static inline int dev_set_drv_sync_state(struct device *dev,
-					 void (*fn)(struct device *dev))
-{
-	if (!dev || !dev->driver)
-		return 0;
-	if (dev->driver->sync_state && dev->driver->sync_state != fn)
-		return -EBUSY;
-	if (!dev->driver->sync_state)
-		dev->driver->sync_state = fn;
-	return 0;
-}
-
 struct sync_state_entry {
 	struct list_head	node;
 	void			(*fn)(struct device *dev);

-- 
2.54.0


