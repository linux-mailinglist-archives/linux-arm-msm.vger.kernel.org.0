Return-Path: <linux-arm-msm+bounces-108785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJa6CAbPDWr53QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:11:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 713855908CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF86431E7D93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09ADD3EFFC4;
	Wed, 20 May 2026 14:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SPXSd7bD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aoQ1Su8U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C403EFD0A
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288293; cv=none; b=OJmukdHy11uOtb958YrwtbFyKYGeqDIqtvlV9QkJjp8MoTxlamsGHLdlEKXlymU9DTa6uvm63c0SVUAwOkaKgrpTKwmaux2Jedg3dFVv074gfHaZgdET0oaOV8G6AKqJ+zsvD7TZcfBqiRiZF/JCuewthKQGaLvWEwuo5aHbxE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288293; c=relaxed/simple;
	bh=jEfZUqFY074Lw5sfn5a4E2fvpuL3y1rjjmlZE/QrIhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=is0tY9HKg+729LYqWMo2qqxswbTmPcOk5GcH2kScU2P2T0G73AJlWiPEQt0UzDGGY02SPKJ719c8BJimCkaYkUixOm1keMMbQnT5z0x9VlqpfbRz2BP48vJmUunWuhUXb+j7f9c2BnHlf3hjf5oBnp5QX8VckCT3IkCBVAXMK1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SPXSd7bD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aoQ1Su8U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779288291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kn/KwXlRjqhIt+wQ6tJp71uiYnDltrIKBv46ZENJaNM=;
	b=SPXSd7bDbewiitI8XZyfhPBqd83a3mvOHtlooYfPOFd8zW8YEQ6Z09wyVmijZzyMRGFjWV
	UQyweVnR90xjKxVJc5zXANFsQUCcQdixlCijTXeSK33yaEXaH0riCxJdzoJivwFEFCayBa
	iXjWN1MZS8YrXoq/IfBxYkjOOlmrpPY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584--_r-CAApNo2GvXwdbR4dTA-1; Wed, 20 May 2026 10:44:49 -0400
X-MC-Unique: -_r-CAApNo2GvXwdbR4dTA-1
X-Mimecast-MFC-AGG-ID: -_r-CAApNo2GvXwdbR4dTA_1779288288
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48feb8b9acfso29834155e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779288288; x=1779893088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kn/KwXlRjqhIt+wQ6tJp71uiYnDltrIKBv46ZENJaNM=;
        b=aoQ1Su8UXifJFaamXIHxbmq2WSYxpOo8d93rUZmm9MZ+F2xuoKSpt5B2cMa7HEWFXb
         wwThCw4vieEAnYcQR+qQaWatWU6GhGBO9WqX4LuxTmJpqhpCWbWBeDXWjv2utmpzNWdT
         AnBLs6M0+5OovsVdgaTvP9NK/bWUHRpNjeADrU9mIFJtEjYgp+nV8lNGYP74Om1cauyz
         irP/Yfg+r1htVO8HcMJh5Wtzt67G2o1SIFv5cnVjAGKI6DHLeA2PG5mHu7pD2Zbon1xU
         b8Edu63I8gzx1o5QtH+3pAyuW9qIsQfsoyDpXR4ZKgSKH2kDs2XkD8Nx3hB+31N+Xglx
         W+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288288; x=1779893088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kn/KwXlRjqhIt+wQ6tJp71uiYnDltrIKBv46ZENJaNM=;
        b=AZCTFV6e9B4fMxV0cE8ENO6vcyq8KdBjVOIM+LQ/jXn7fErALYI8lUOvk2gzwMmBlP
         Rg7vpyjsE8HpFA5YIirYLIL2DTiAIMPwYreffHlV14IVpx1/0B9Yt7hp/docNGC5VU87
         PdKXncul0oIaPbtHx5fnSvVEfonvCF/NPJBJKRi0pzYzkLZvcf3cOGcco4NDzUbzZ7WP
         dmtT3ALiT2M7QtlkttHNsPk+zGBlSonYRT1Fsu36zTtWrkTs2IndBDEBLiz7CpppgAPm
         3m3zjTRJF0v88wG1jcluxFxZr1GnfHukobfD9zthiJUvUVguQYFGr/dw1dJfDa55oqZy
         EyFw==
X-Forwarded-Encrypted: i=1; AFNElJ+v1vWbjibFDNknq96qNBiCbaVpuama2bnuwgUEs5AM8oKnpCnEApHrqQuBrDUxRl76o9AcBj5aduPNasrE@vger.kernel.org
X-Gm-Message-State: AOJu0YxwXgVflVyoppnpJ+wChrxBftK1TWxAWIx9LFiSijixd0hI9bSm
	E2NQNUy8qyEx82wd/eh7mXudvdEl268xZZuCIyXJpMKh+l+0NHt4M7jG3/grIRpvbKrN+4qhcsd
	YMXq+/grXb4H6ewFSBGPNkhI3XeQ9HIiyc3zXYOtfDW/WeJusOd6s6B8ILDPAFKCjT6g=
X-Gm-Gg: Acq92OH47OxdOtCu3Lj1c3Z6B/Fekkk7IMtS36oPI0O5Z9pfUEsPIPQysGPTJOH3/8c
	U69oAeoXwrB2U87HRTrX6c1CJeVfUZbrpHzgj3ZNv4FvgVkwZvk7jDhmCK77nim+4BfY+jGoo4B
	4ATux6o41ctBimDPGf3Uux2ytNVRJcyz80Fgdit24kQniX76kwej+52uC9X3wKhOACMihfjTIqj
	0+JdzZGhdUciTB7PGXYqxJf2GD21YGmso5V1ngncD7QODTT9q7SZF8qyn+ds1KIGt5hFSUzL8QP
	k5J5c7Ni6oYK0KXHtEeESAtaSC35mfNz7HwMdNs/2wiLA0Pd/7MJ5raZDCemhIi7/Zg97LUfmtl
	c6tCOSUuVOVlwqcoEblfdWOoXmhgx9quvismAgShTcRWcMQMJ2l8CoVi/0g==
X-Received: by 2002:a05:600d:8496:10b0:48f:eb8b:997e with SMTP id 5b1f17b1804b1-48feb8b9ab1mr239050515e9.26.1779288287902;
        Wed, 20 May 2026 07:44:47 -0700 (PDT)
X-Received: by 2002:a05:600d:8496:10b0:48f:eb8b:997e with SMTP id 5b1f17b1804b1-48feb8b9ab1mr239050115e9.26.1779288287373;
        Wed, 20 May 2026 07:44:47 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm394075225e9.4.2026.05.20.07.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:44:46 -0700 (PDT)
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
Subject: [PATCH v2 8/8] drm/msm/hdmi: Use the common TMDS char rate constants in 8998 PHY
Date: Wed, 20 May 2026 16:43:44 +0200
Message-ID: <20260520144424.1633354-9-javierm@redhat.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,poorly.run,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-108785-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 713855908CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the driver local defines with the shared constants defined in the
<linux/hdmi.h> header for the minimum and maximum TMDS character rates.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

(no changes since v1)

 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index a86ff3706369..05c3ffad858d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -12,9 +12,6 @@
 #define HDMI_VCO_MAX_FREQ			12000000000UL
 #define HDMI_VCO_MIN_FREQ			8000000000UL
 
-#define HDMI_PCLK_MAX_FREQ			600000000
-#define HDMI_PCLK_MIN_FREQ			25000000
-
 #define HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD	3400000000UL
 #define HDMI_DIG_FREQ_BIT_CLK_THRESHOLD		1500000000UL
 #define HDMI_MID_FREQ_BIT_CLK_THRESHOLD		750000000UL
@@ -649,7 +646,8 @@ static int hdmi_8998_pll_prepare(struct clk_hw *hw)
 static int hdmi_8998_pll_determine_rate(struct clk_hw *hw,
 					struct clk_rate_request *req)
 {
-	req->rate = clamp_t(unsigned long, req->rate, HDMI_PCLK_MIN_FREQ, HDMI_PCLK_MAX_FREQ);
+	req->rate = clamp_t(unsigned long, req->rate, HDMI_TMDS_CHAR_RATE_MIN_HZ,
+			    HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ);
 
 	return 0;
 }
-- 
2.54.0


