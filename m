Return-Path: <linux-arm-msm+bounces-96186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHKUFAKbrmmqGgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:03:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE933236B69
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5786C302A7E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF7638B7D7;
	Mon,  9 Mar 2026 10:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1skKwfK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6473A38B7CC
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 10:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050607; cv=none; b=rukzz9kZhlgRCkySg24xYHTc0ydc2a1RjhoEZasVjbbN5DxuyJiq0GFZ6pPnQr9imQh6SLO+nIMxuh29kFRtvYdDyR3AxLAbETjZ+pw2HejboJ9+C5e5ZIeG8YVL2Wq7kIbOZAdgFb6k0HTw/flk/X1Ftohq+fURLrtXp1L2M6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050607; c=relaxed/simple;
	bh=pysRxiNl+osRd74b9koXBzLEhRiPtuW9Y/0Dbz35bCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rrBaXMisyrb94rYlQexTV4u07q3a4R/q0GZN54zCpwQrIORI1jYCM/bpnypbuMR4E0Srr7OlyL41LOKIuPnFCYGenxs2ohZLrAg88oEv1JAaklXqktOgwTrredDBmBWbVLitTJegVDQCOI74cO3fsZyB4+BTdNCB98IscRPPzzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1skKwfK; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82989744ee0so3265394b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 03:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773050606; x=1773655406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9nlwmWhwIXO0X3Jk30jSEyo+dFAjP7rZs6urd0jScw=;
        b=i1skKwfKlWlF1B8clE7Ln/vnZ1s/E1MvJdWVlKx4YkB68s2B+4MIaiqbBiLY4Sgjlv
         D23BRzKWXvPo6vSZO7v2umXmDoYVRwA/hUa+K4LzHkeFZE3vJeM/ktwo54iA5nFWiyDU
         G9isuKEQ1Ie73dzmZaQujfh18dElEPmlhwZTkvYGoQAgBUPtybTWDR/MiBHAc7npQydP
         F5g/FYq3CfavfBKWZVtoiJbxc0B5fTVx9+j0qDk5JBdULlducu3D2vyLq+PwMh++6fHl
         m0gPA7q52olNZoaZfdUU49sWzlnr72oURF7djihHM2NKJWImZbsw4ptOuj/kz0BBz3Qp
         X6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773050606; x=1773655406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9nlwmWhwIXO0X3Jk30jSEyo+dFAjP7rZs6urd0jScw=;
        b=CJbH2SahGAgvAAJQHAVzms00vK/fYf+dtERr5bZ/9jPp669rC6naiuO8WBspq63yIu
         LX/ydFMxDohPisUjpsbQveaA9dERQxUDJUUZWssARoJR0+bfYR8fMnbOvauL8WSoJOry
         yJngcVwo6F88FHrCW1w5yYFn/ggoAR12awQG5IcpvT/DmrtfL45PZp7v4w27b1HdFJjF
         H3foybINAu604suFGAXfROvQOqAwG66QjPRNTjayQeuGYRAWOOjkWebHQR/6NUyTFOZu
         846yaHPb5XctqvkWvAzELdhiGSsTjDuh9kHDyGtES5ZkHTtkCVBoblFFKxMEmvSF+PWi
         KDzw==
X-Forwarded-Encrypted: i=1; AJvYcCVOrZ+pBVNiZdMYsOQgQLHVWvMsWGssnKW/WTanY+eUJGjCCriabthokJ3JT1Q6o1nuNdVX6KdIcwWYDoU0@vger.kernel.org
X-Gm-Message-State: AOJu0YzWunHrnVq1ITpPXoTxCxfl+dM3k/bQSy0ppYsYnW6vk/vudP5t
	IT6RQ1IIMqQ4RherRNEPhk3zYr5NMhy5jnOZhWslPBeH+o98YorGXhjy
X-Gm-Gg: ATEYQzxRrXabpOewWeeM9Oe/fqYL92SzLiSth9csBkluTHeObCZvjLPQ02cAEz38Uw1
	BZRFmYfMzdlveh2ru5RzcSl2t5JQg2FYPHpePxBjL/KEWlJToNirX3FesDBVtZldXVnUBHajNnx
	1/hH/RfLvdTqLGxcNZWlp+RXoH2GZLUXUHnVFbOQEWDrF0n5+coDBhvOKW7sx/6HFVjub5fP7EG
	HDOKKKivYSctQ/L1i3WURg/FC8wQkEqdTGL72oiJuOCUqzxG10lcI6lfviJADiGBzaokip48LxN
	K8KwLWnjW0xBJ+QByZBKkxHuynB2E5nbUaxeZ2baKd7BuEBMYMZYq/2h6xanV71Mh0N/pNrtfmk
	yF0R4lA/5QC4+k2Emarw+j3LuhMxG2eYltKAbwiUPprmrgwpfkuaneumg80c0IQf6xk1re1ClGj
	GWVfy+UONIYLXUcnGQ1w==
X-Received: by 2002:a05:6a00:7487:b0:829:82f1:8bf7 with SMTP id d2e1a72fcca58-829a2d6e341mr7386135b3a.11.1773050605584;
        Mon, 09 Mar 2026 03:03:25 -0700 (PDT)
Received: from nuvole ([109.166.36.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829af8695cesm8147353b3a.12.2026.03.09.03.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:03:24 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	kernel test robot <lkp@intel.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: add the missing parameter description
Date: Mon,  9 Mar 2026 18:02:53 +0800
Message-ID: <20260309100254.877801-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BE933236B69
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96186-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.982];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add a description for is_bonded_dsi in dsi_adjust_pclk_for_compression
to match the existing kernel-doc comment.

Fixes: e4eb11b34d6c ("drm/msm/dsi: fix pclk rate calculation for bonded dsi")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603080314.XeqyRZ7A-lkp@intel.com/
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index db6da99375..6cb634590e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -569,6 +569,7 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
  * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
  * @mode: The selected mode for the DSI output
  * @dsc: DRM DSC configuration for this DSI output
+ * @is_bonded_dsi: True if two DSI controllers are bonded
  *
  * Adjust the pclk rate by calculating a new hdisplay proportional to
  * the compression ratio such that:
-- 
2.53.0


