Return-Path: <linux-arm-msm+bounces-108784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBisLG7LDWqq3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:55:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0C659044D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B8BA30AF3E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F733EF653;
	Wed, 20 May 2026 14:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Eg56L6zl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UTyhdSZ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAC33EF0D7
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288290; cv=none; b=YMbo4A2lGihh7sLlAGrkWIc9iGOl2mSIu/6cOi1OQg4KDKdvgQFZGd+lvl7thJDHKbcPE45/OYj6C/spPfjlAxvVvBoCWBof7bGTL+T8wznJzT8VhhGIVmE2+Kg6MwtrheO3A+NeOoa51eefzsFoWwHQs8JP1+gaUhDcTjqivMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288290; c=relaxed/simple;
	bh=MenNASaSpX/A8DK7imp5VmknvIT3hXGOI33HP3Epa3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T7QjfenxlwMeVt5U1S4UbIm+BWLB5IcQ3R+IRo6yWPob0EadHCUSTCkU+lKJi4hCQ2nVaBSpV4vixMsMkdaA22yg3q8uNYUxppaInCAGO80HOttT4zoCSuB1DYtMKrqLxgDu9mni/qJ6LwDx2AXkgUwrSdJtczfp/DD4yD//qSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Eg56L6zl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UTyhdSZ4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779288288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7doYKg7uNXVfPcHfcWD2JJnnh8uBK1RxSsGyXu0nvLQ=;
	b=Eg56L6zlaIHntyJN3g4ron+74wLZe5BB9W//x5T1Y3NlE+dUKxpN1c36nQqAtXOd0k+F2H
	LGQC1QnaudiSF6s7NlD/v6ta5MZ4F/FL2dT1No6h58U2scmJHESjQKXjSVv2ow4LSPTq8v
	1+uKFKawcgftIh9QMa5l70pwtrV1RlE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-eS89bpcdPz6Jz9CNfRmcWA-1; Wed, 20 May 2026 10:44:47 -0400
X-MC-Unique: eS89bpcdPz6Jz9CNfRmcWA-1
X-Mimecast-MFC-AGG-ID: eS89bpcdPz6Jz9CNfRmcWA_1779288286
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48d127eb013so22406505e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779288286; x=1779893086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7doYKg7uNXVfPcHfcWD2JJnnh8uBK1RxSsGyXu0nvLQ=;
        b=UTyhdSZ4sp63E3YjLJVVTLMWALtS/X4eEb9bE9OAFsfH89EOnAVhwNsnQg3omAwqmE
         h31L3hPT9J8c3c6A0dRsiWKqaBi9AXeOz5vSYYwwbNjIn5RRhq5lOOLN8eIiM9/IDe0O
         O/8++s8iW/98CoQVOD8gpmo7AQEBanKUsWimqxmjQ69RaOwIjQk8l7Xvhz7pilq0T8U4
         LKq9gIwWEfdFdKQauOQkiDzixYvsec3xlGWkhQhUpOnoJIZrA16sbspgy1MPCgW0DZP3
         HOGkNodDAIgjEax7IctP7jlLPxlLBZbQcpLwYSeL7h5XNxCB53DDWwCJ1YA2HxiBC+1n
         9qvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288286; x=1779893086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7doYKg7uNXVfPcHfcWD2JJnnh8uBK1RxSsGyXu0nvLQ=;
        b=A8EAvEWXCUNPZ/jFYuYpaLLgYtn88/eJi6jyAbL+DTCSlJ84m4ZRr5H0wAA0dImhLQ
         eWAMlNF9FoRuZV6e/cw3vvhjpnVZyvceCNkPD8JT06ZXsv0Pp1gjhdYgAtS0lOkBAAg2
         nHjW0gCQn+FAsnpmnNBQ3bDGYi/6kUOssrybITRTFeFAvanW51ssUUNkHrhMfCMj5S5Q
         wWGby5DwfgUMP0IQeg4kJojT9ttE76/UFDLsm0A36YUOAyuFVZ7Yl3BBTAuWZzgjImCE
         gLPRB4S4tj6OvR7GmMP1DNypFNz8tVlaXmay/deKHIMD0MbdT85U7dcUPEpe5ERHevqB
         sVwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5wXpE18NnfL50EWK2MCJ1UxO1oX5Dj0RotfPTTEtCox/8RmZAV83jSFdTY9uV8zWeSM3pejHIoreNB6QZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxsTuhzUhSQMmauAz1T68D4QvyUfXdTArXNCoYbg6JltsdLisDK
	MgGVhQyIu87lseWCoq3IaB2IPE+MNjBYX7MAGk7J2w/Sy7UADQSp7jdMHGs7ObrFuizsDafqhkI
	fo9zA+YGS2931YTPAqgYj8XNkstkb+6CSkdUPfjITAeJzZrey+/0Dx4ZJza2p/159qW0=
X-Gm-Gg: Acq92OHMj736a9ffIbP/ZPd+2JJ+N4wrUqxo+MjvVt6FVFqpbohX1U2Mv5A0Si1OkVc
	XVvH5jPBdUPgedHE93MFFWRtFhrGuayHpbMscgmxErwBFv7CiAUUSqXZ4ek5U9ygu30vR3+KCaw
	03dGEG9d8dO+Rr9nMzp3xBvLRua5US72MemnHlCN6xI6oAQHdJR7krdR2pT/Zlb/tfYp4MMvmMp
	3/I2BjPohePIQBpQiftfsHWAQKdJSZRku129zyEPtw92AVBFQ+iJWbqj/Fw75ymdJanfT2vQWnb
	d2eo5eabF/Z0idHXiCoKqBopbemhYBsObubNOipbtTNZL2XrnbDl6s5dJYwoB47c3RtStZtytSk
	57raFsBBYncw7bspOnMk4s3FhEOdkXqQai6iIG3POvGet4rpRtnXp6Eo7dQ==
X-Received: by 2002:a05:600c:c10b:b0:489:1cd2:610a with SMTP id 5b1f17b1804b1-48fe60d55c4mr267397185e9.9.1779288285856;
        Wed, 20 May 2026 07:44:45 -0700 (PDT)
X-Received: by 2002:a05:600c:c10b:b0:489:1cd2:610a with SMTP id 5b1f17b1804b1-48fe60d55c4mr267396555e9.9.1779288285203;
        Wed, 20 May 2026 07:44:45 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4862209sm398446965e9.0.2026.05.20.07.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:44:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
Subject: [PATCH v2 7/8] drm/msm/hdmi: Use the common TMDS char rate constants in 8996 PHY
Date: Wed, 20 May 2026 16:43:43 +0200
Message-ID: <20260520144424.1633354-8-javierm@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520144424.1633354-1-javierm@redhat.com>
References: <20260520144424.1633354-1-javierm@redhat.com>
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
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,poorly.run,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-108784-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: AA0C659044D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the driver local defines with the shared constants defined in the
<linux/hdmi.h> header for the minimum and maximum TMDS character rates.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

(no changes since v1)

 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
index 36e928b0fd5a..71da20322b3d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
@@ -11,9 +11,6 @@
 #define HDMI_VCO_MAX_FREQ			12000000000UL
 #define HDMI_VCO_MIN_FREQ			8000000000UL
 
-#define HDMI_PCLK_MAX_FREQ			600000000
-#define HDMI_PCLK_MIN_FREQ			25000000
-
 #define HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD	3400000000UL
 #define HDMI_DIG_FREQ_BIT_CLK_THRESHOLD		1500000000UL
 #define HDMI_MID_FREQ_BIT_CLK_THRESHOLD		750000000UL
@@ -632,7 +629,8 @@ static int hdmi_8996_pll_prepare(struct clk_hw *hw)
 static int hdmi_8996_pll_determine_rate(struct clk_hw *hw,
 					struct clk_rate_request *req)
 {
-	req->rate = clamp_t(unsigned long, req->rate, HDMI_PCLK_MIN_FREQ, HDMI_PCLK_MAX_FREQ);
+	req->rate = clamp_t(unsigned long, req->rate, HDMI_TMDS_CHAR_RATE_MIN_HZ,
+			    HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ);
 
 	return 0;
 }
-- 
2.54.0


