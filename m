Return-Path: <linux-arm-msm+bounces-104516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ADAKeyd7GltagAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 12:56:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F41B9465FF1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 12:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95D7E3009FAB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 10:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7B13939C2;
	Sat, 25 Apr 2026 10:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pBKHsWUU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055C93845A6
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 10:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777114578; cv=none; b=saANShAPOgGhEeb42kMZD5/EkBpMGISsA4a/wMqqu68gqyUFAJY2pXGyQmlOH0B+nGqAcg7nCM93rqZLBeHOfnzAeTrx2zkOXNydxsYxqa/51f8C6sQ6vTBJz51YWGCAjJ8sp2O36zoZtYjYfLTDK25IW+cKeF9/iEhpBrvN9E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777114578; c=relaxed/simple;
	bh=0DFMRmRmnT3HIcrBDMAr1tbxa08F3uNrVtX65Evd/tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aMeeSVvT9xDOJ3lK8U0Ga+V8Wmf7kkblnhwRohAnyKOuBkBkZrgbook/UZXxz7EIcQywIkmHtTT5/rMXpKRsurl92E8uiKtz2KQHajCzo4qRU0LE7BmATmf1TIQz6Aojf38tbldESY9EOhsBslJsW9us3HnEwipOtoc1CTPRlWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pBKHsWUU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b2d3a9e149so45853155ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 03:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777114576; x=1777719376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6Yo5rERlGwlb3Ci6vxCe4GRUzMyoCAKAgtEtNiZmzs=;
        b=pBKHsWUUQFqC4Jr2gMSQdSUOJyg57E/uvYIZTTf+HL8H5SieX2Fpn8kKEUpNwDasfF
         bJKz2FZ+XeLhXw7J22Hj60BkEhN2/QgcQ3fhDuie68MfQDq7n7A36v4OrjnqY1fRbIfO
         EvwCHmZSzRA0orFpglAahu2qb3iHjq3aOmbg8dhFokereqIHNdktTlPxlLY7Sw6uXEuw
         GI8ZRg9q8S96g9TLHCmwcGglupPTiXSaDSRzlA629oNdPLvLL4WLayY10BuJByh691qe
         DLmT63b0oOwKT+EWHGw1sX4N4qXvawPac8fqK0eHmNtEtWvZgCNfCjK9hEjINOcrtChV
         OXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777114576; x=1777719376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s6Yo5rERlGwlb3Ci6vxCe4GRUzMyoCAKAgtEtNiZmzs=;
        b=RyQNbIL6pFFqJK4iTkEyZKbWSH5RobVqTn3cLtlP41abylU1gEONFSBGUpNWMdjmkK
         gA3GWYqWpLVtc2trJ55E0nRSd7aNgMPFORX7H7VHKHtjKXKvpohh3uGsujvtSZHiusgg
         c9ZD4jWCRN2WxbTZItZqgGVOGo8oRSYivHV4Dq5JPZIPz+jYEL+RWpNAG0l8BS1Yk8ww
         6kSxMs5x8NhT/Eq9SKtaWYY9srcZ6QnzzQNbzbUB7iwWPYccfycvwK41I1MMiZ7KeWWP
         +bI2Q0pylzOwvRncTkbs5a+htlbrdVDX8l6sWmzlsTE4MS7frkuIoweorDbuGNVmEwIk
         Kndw==
X-Gm-Message-State: AOJu0YxLWSuvZuBatJw2Cg71xg1r3uAR2tJ/y7ZrC8uCzlkNN6fGfDQh
	Mw2wGmRH+oE9+NCXd5iy1RTpBEpSLtqgubWXxnAWC5oJtydZ1ZmdAwIz
X-Gm-Gg: AeBDieu6SM3IZW0y5jp28EVTwonHvXZEbkrmJ9zBqq4WPH+fZ/tNddnK3WTqWvLyv3G
	AOdEiH16bTXGvW10G+fJvry/qlECvbaKI6NsuAFjg14hyNyrBmO4xVKLBbgmq0L5FgnXSXilWkL
	gQC/KsJ9+LkSoZLpf/uSV+jhar5KDPp/jgwMQroGvYoUSVoLvAHD8PYcn27X9KrAs4Ju9t33oQW
	vW8tF+N3o4t6Um45MSMy65VVWkyYHmpvrHEr4ZKAX4RcRRZ8iaEcHtmLL0O6fYy8eAYF1VzPidM
	epW+z5A+C/2iZO1iWYoawwCc6kYxDFtD48uYKDNxC+Td4bpGW7WljVlwl4/wEP1PvQPaSR9Qb1u
	q5McNvIctQU1ygc5sIaY1d5p9PiA3vSJktZf8h2x16lE/jIS35FRpizkXg6GQRYCcs7t3ne2L4/
	jz6MD1B4aueQSIxmYWekv5r5I38Dkm
X-Received: by 2002:a17:903:11c3:b0:2ae:5346:d4e6 with SMTP id d9443c01a7336-2b5f9ef78e0mr323118295ad.28.1777114576428;
        Sat, 25 Apr 2026 03:56:16 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa33486sm303832345ad.33.2026.04.25.03.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 03:56:15 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 1/4] media: hi846: fix hi846_write_reg_16 handling
Date: Sat, 25 Apr 2026 18:52:57 +0800
Message-ID: <20260425105300.745044-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260425105300.745044-1-mitltlatltl@gmail.com>
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F41B9465FF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-104516-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..09c109f3fba9 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1270,6 +1270,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 
 	if (*err < 0)
 		return;
+	else
+		*err = 0;
 
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
-- 
2.54.0


