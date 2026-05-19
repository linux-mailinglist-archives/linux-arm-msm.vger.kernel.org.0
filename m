Return-Path: <linux-arm-msm+bounces-108538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC3xNCV7DGoSiQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:00:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D6058109D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28AD9306CBAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD36A4779BE;
	Tue, 19 May 2026 14:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XW9L6ape";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bcBMUY+5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E89037B40B
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 14:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779202065; cv=none; b=TPMGoCzKwBMb3DOlz7IcsxFZ/hkEYrYpBa3zKdqkMClxgsIsvenNuQ+5pxqUv3G+blZxXEug9BlXdSxjpxSoFFmaiOgQ6IeqYRjDnQK7LrQUpLMKQGypD/1pV39xrmDQI7NtBPfjAvKHmF4EHvVT/EFiCQaM3dsIeT9vJjs5YSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779202065; c=relaxed/simple;
	bh=MqTKnSCziFxZ+NsgKUBcw9ux+x44pK74BKLiQYyRDHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2kargbgau21LTmYNaXQGtDqPdzrwKbdLIwPYfrc0jRdiKbmkR47CEmZsUb1G/BPNRCvXY5jvwWtt4/2oG9h1v6F8iOgFFpQwO+1FRiJNTxFoRhybz5n+7Th8xg+Ywe7n5WXWEbjRp7FEvcWXAjCQVxuiNxBER2GRMcDUzO86BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XW9L6ape; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bcBMUY+5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779202063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6r8iDBFlPBC89fVvBoaRrCLk0Thq/XCfLs2Px8PTdkk=;
	b=XW9L6apeE3FQfa3xtWOGP6WCUtnEpDa0ODDxAVyWj1lSuT0IKFkKVOaU5gdM30WPmyK0fv
	+XoyjeYKPZmXN5khdJvvNaKF5e83ORD2CSePUoGIk2Xl3a5hZrhpMSYoeiHCZLMT0eu0B/
	vAGx0N1mJOOUSN7HDTbJhfPdpbmsHqY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-5L1gYfEsNe--UbZlNijN3g-1; Tue, 19 May 2026 10:47:42 -0400
X-MC-Unique: 5L1gYfEsNe--UbZlNijN3g-1
X-Mimecast-MFC-AGG-ID: 5L1gYfEsNe--UbZlNijN3g_1779202061
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48fd9c22b8fso29966435e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779202061; x=1779806861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6r8iDBFlPBC89fVvBoaRrCLk0Thq/XCfLs2Px8PTdkk=;
        b=bcBMUY+5/vFHrig+JgIigd4XfB7XZ9jC4EXwKrs2z7dRQ2dNdgccYNK3pUuiyN8htA
         0sNCr5E2kxXcwyvAoe1cPbfseuijJrmegnDXLXk5dv/0v6ILl2dNbsS5WHylX9pKwcKZ
         Ez2ZA9wpw6tmdQW21K3REz8CdGGe+u0Ve6CDc/gtZe5D7tNXwMG6iX3hNMkwm2+3Nral
         klTV29D/jUUYG0vxWeEzolM1bLEEl4a3QhsSOfzurA9YAG7kJ3xt8kViSAvGMoJJ5vN2
         zFnv1LFbDg9vQOKRo0Xonmoks+AzRm8OQTFzJlp+6FuYgrwav9FvfF4dQqxEP4eie5MU
         QMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202061; x=1779806861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6r8iDBFlPBC89fVvBoaRrCLk0Thq/XCfLs2Px8PTdkk=;
        b=fXeqhEeRgIDXZMsP4YeANXFlnGqKn51SXIxiox7JTt7kGjkIKsPvZdl7igtt1sU7PB
         hFk/yWbK4WxG1G1cOduxljQXzO9VS7eWq/6iI7PbLdqaG73q0t3Yhs+bPp2UUVATybVc
         iLJa3SABRsUEB86g1tDGKnNpqy8xMAXij2bo08+XlLhivXfHC3xjOQ2HRXZaWlJoEdkP
         Zgo2YwRmY7ZGmPljVJX/yoq2wqk+IokxBENhMCJLTL0BPP2mfPM2pU54dJud4Xcpjwxa
         /IiJjlIRKDbV27GxlF++iC16XskhBm0Srm8IfMvchiSR+pwmQCDlFbou1dKwsytLfQJf
         2mGg==
X-Forwarded-Encrypted: i=1; AFNElJ+FvyXjJjgTlC0nEICaPdp5nrazjGTT4CrhsO7YvZkhQFZHofXV9R7dKIBT/oQCqciOyPZonTLQNPY4uG6F@vger.kernel.org
X-Gm-Message-State: AOJu0YyaJitSZ0Z4lDDMRAh3qz3lzVAwpNVQAO8CwaL1gylW5irFLztB
	VAOd1kuCtA/4nIWB3Yyd/Cu1hyEqYVHcuZI8qSPp8cjVTvRSzGFOS4dkD5OO2qGohwGH5yZa3n3
	jYNf9XKjOHFM/WHkfrxZYkrD8W7LN+Cqya0mCerCHYUdurcvbOSvCOY8ncVUrXk2I5vM=
X-Gm-Gg: Acq92OH2G3jnyEoTQLR2yup7J6nwze3ac1wlKHXbZH4kAAoJBSXkiSvw/JjwAYn6HSm
	evUltFwd2BT76fdPmStGCf2rkwTgtTuONi15GcM3jNiGgWnsfsm2AZzcD9AJggs6nXUqMteQRLK
	j37VVG8E89wNx4p7B+uFKtzgv8LFjU4yWEtdXsEeTOoyBZ0p7nCUwcXaZHiNsda/Of4pGIHOVkn
	AYaCsuBfkG7KX8BjsgeIBwvPAZt8QQ+TVD7IpiPHrGiz1ghw3flacmGXuBJ7Nfdxk+qbEXynKr2
	0WqpOG0Ke+evZBMVV2ydYoDMNAm8BnzTU5CtFURVwqrWYLRGCdkW9kwhvSzQz1JefCAf5vbqofX
	oC0W1fm3M1MzNnsIIyv3tvJZjYPJHEY1A2FkkFrNiMTXHPrg=
X-Received: by 2002:a05:600c:858c:b0:48a:563c:c8e2 with SMTP id 5b1f17b1804b1-48fe60e54d6mr245200645e9.3.1779202060695;
        Tue, 19 May 2026 07:47:40 -0700 (PDT)
X-Received: by 2002:a05:600c:858c:b0:48a:563c:c8e2 with SMTP id 5b1f17b1804b1-48fe60e54d6mr245200135e9.3.1779202060303;
        Tue, 19 May 2026 07:47:40 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49008c047absm67922045e9.0.2026.05.19.07.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:47:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Brian Masney <bmasney@redhat.com>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 8/8] drm/msm/hdmi: Use the common TMDS char rate constants in 8998 PHY
Date: Tue, 19 May 2026 16:47:04 +0200
Message-ID: <20260519144712.1418302-9-javierm@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519144712.1418302-1-javierm@redhat.com>
References: <20260519144712.1418302-1-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108538-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,linux.dev,gmail.com,oss.qualcomm.com,somainline.org,poorly.run,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 09D6058109D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the driver local defines, for the minimum and maximum TMDS char
rates, with shared constants defined in <drm/display/drm_hdmi_helper.h>.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index a86ff3706369..3d2c1de975da 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -7,14 +7,13 @@
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 
+#include <drm/display/drm_hdmi_helper.h>
+
 #include "hdmi.h"
 
 #define HDMI_VCO_MAX_FREQ			12000000000UL
 #define HDMI_VCO_MIN_FREQ			8000000000UL
 
-#define HDMI_PCLK_MAX_FREQ			600000000
-#define HDMI_PCLK_MIN_FREQ			25000000
-
 #define HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD	3400000000UL
 #define HDMI_DIG_FREQ_BIT_CLK_THRESHOLD		1500000000UL
 #define HDMI_MID_FREQ_BIT_CLK_THRESHOLD		750000000UL
@@ -649,7 +648,9 @@ static int hdmi_8998_pll_prepare(struct clk_hw *hw)
 static int hdmi_8998_pll_determine_rate(struct clk_hw *hw,
 					struct clk_rate_request *req)
 {
-	req->rate = clamp_t(unsigned long, req->rate, HDMI_PCLK_MIN_FREQ, HDMI_PCLK_MAX_FREQ);
+	req->rate = clamp_t(unsigned long, req->rate,
+			    DRM_HDMI_TMDS_CHAR_RATE_MIN,
+			    DRM_HDMI_TMDS_CHAR_RATE_MAX_2_0);
 
 	return 0;
 }
-- 
2.54.0


