Return-Path: <linux-arm-msm+bounces-95749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDjbCsGeqmlLUgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:30:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 972A521DF28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 129FB3115335
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 09:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821CD344DB5;
	Fri,  6 Mar 2026 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEP2Jh0b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52182329C7F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 09:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772789159; cv=none; b=nizDn6KoktepVWp0+ykApD9cy74q3o7mFbFcPkWYjWHKTvmS32W67znKOzEzxGYESjtHaURu6hV2PWSPjM86XoPSOX0iOFJSmINCmuj/rRb11YoMDrhPQcJzFXjKh6RLvbqVRHZObrIw2/6qe/7+oNpHj5KUgTUQFeVcAwjW7d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772789159; c=relaxed/simple;
	bh=kfZgAHlSr6nZQja57iAH7qUSL/+/SzdzRgomI38zw6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QAL9HQCQV6q0bKfY1525FyL+7TnRzSXnasfe+IVhikGzSUOE564VRJlGdAqfR96vo3OmllxBGI0Ai2BYLBSZg4XRuPYMqA9vBR8wym4Gf7xm5V3dR7epm2bVFaoQBRDxNnMETBEBV9HVF7yczr/YicJc6xiTH7A6yaF6K0YJr3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEP2Jh0b; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c7381c4345cso1050316a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 01:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772789158; x=1773393958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ewHGacURbR5hWeKGyZInp1e9Eq3/0vuCV0I4zH6dBM=;
        b=fEP2Jh0bD1t2cI9u+1y6Dk4aQwCe/9TdTrG2SttVHjN1hzn37Ha1B7bfX13Tm8nIyc
         iadT7M9b1f+v2rg6FRhx7w3wa5GsIYY470vhbyn0u9RH7Agk1I4kq8+lp85ixklSQaO4
         Q9Ct854xFgPT2bb8+gFhTpTH53OqCLFQNWYqxzDrKEYhz0MBQ6pPgIl+hKJcDNO836/l
         bKGk5LAE3zIIyKQ61VjyId5SFpdryermqxpq58p35d8De3i/s1x2KD8y0HYkgcc4yZux
         rXAK1/2C02T6rZx15X9wC6oH49ZZV05JDc1eNHgSL/PlzUwcssq9UzklphP37z8a3uxX
         3Mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772789158; x=1773393958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ewHGacURbR5hWeKGyZInp1e9Eq3/0vuCV0I4zH6dBM=;
        b=h2Z2XT2bcrFkz+rYOyBh/eq9gUqdJ+9N7My7f4hvEdk9A6QzKbpRPOEZrgshAJypl7
         S7AypZZe11INxBBHVQe8uhepZSBfu+vz0NbvBRwCssLzUn9fDuyd462R3m7lNs8MF2tu
         F2a8heSBt8BcZlmMMPeFLueU0xKbpy6dAr1JhaSUQ/pWusvk/OM+J7a/JUDQfQHeWYeL
         qXuXvDwig7Xx3RTA9B9uErmq09gsgojuWQi8s8KjzUzQjLXV1tmikWSkXrcQfLVFjYea
         c/WuxB1qIDc75lKLV8MSin0VBYwJXnao27sLfy9/KrNnk+BUOIyI+lcOXvLdFli69FI+
         tiGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyVAg8vc3Jlf+3OxhfagMAvU4kFgOyvmY9BRJuZWO0e9pqz7wgxQQ1h+4t8ehc0TzhdNYOS9RQt+5nLcL8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg9F4JKzTiz7kwyefOm0hI5m793egAhzITbnj0OjWFZKMdMAQk
	hYJhtqCVz743rYm2CPcXqEQSjAOFX16AMr6TDrW3bUi24vq+qTFGiHz7
X-Gm-Gg: ATEYQzz4OsDypIJL30OgdkyjzNaT8Hnx98hWQMfr1+vi8W4jKT6BQP+CemEO+ibxpPa
	bsAnLYRcrrii8g/kpaoqrZcj220WxEUBvkcTHR88F17mFSNIRH2YqOCzLr/WulX2+uRpt3bv9gK
	G/Om0Vz/YcfdYunao4nz4ClsiSUGUWZzI65CRFFqBs8uAv+Vy2XltZ1hll+jQL4oPY8PoDFBHog
	U6fFC5GcEbcWOTLISfnrinEzaGv5iv4KdpxLEhPdTysykjhvTa++CEj/GkpK+eWkdi1aLFt6uTn
	0XfE7N6tGC+qrLZu45u/cD4FEpb7u6PunyWMJqlsTATrNP/eZJxBiRGCryhNKB6P26z300FJW+7
	blHF4geccPYRynoykjw0GAeLBXlKBBdhw0iW3Fb8Am+a1fQ2boWpDmCqxRSanPG+LVdMik3SlAs
	3aY++W1UIVFh1UsE+ZIw==
X-Received: by 2002:a05:6a20:cd96:b0:38b:e8f3:7065 with SMTP id adf61e73a8af0-3985a84978emr1449373637.19.1772789157619;
        Fri, 06 Mar 2026 01:25:57 -0800 (PST)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e195c40sm1021673a12.31.2026.03.06.01.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 01:25:57 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Eugene Lepshy <fekz115@gmail.com>,
	Danila Tikhonov <danila@jiaxyga.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: remove bpc > 8 entries from allow list
Date: Fri,  6 Mar 2026 17:25:00 +0800
Message-ID: <20260306092518.37849-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 972A521DF28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95749-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,jiaxyga.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

In upstream the msm, for bpc greater than 8 are not supported yet,
although the hardware block supports this. Remove them until we
support them.

Fixes: b0e71c2637d1 ("drm/msm/dsi: Allow values of 10 and 12 for bits per component")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e8e83ee61e..b60b26ddb0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1824,12 +1824,9 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 
 	switch (dsc->bits_per_component) {
 	case 8:
-	case 10:
-	case 12:
 		/*
-		 * Only 8, 10, and 12 bpc are supported for DSC 1.1 block.
-		 * If additional bpc values need to be supported, update
-		 * this quard with the appropriate DSC version verification.
+		 * In the upstream msm, only 8 bpc is supported for DSC 1.1/1.2
+		 * block.
 		 */
 		break;
 	default:
-- 
2.53.0


