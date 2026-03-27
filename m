Return-Path: <linux-arm-msm+bounces-100186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBedIL7xxWkkEgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 03:55:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 283E533E98F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 03:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D16C1300C0C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 02:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0201E33D6FA;
	Fri, 27 Mar 2026 02:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awCdkszt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C764A1D5CD4
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774580153; cv=none; b=CQnJ+sTxAwk2/Bs7aTYyww/4B/VlPm1Kvss88SmbeRIBzG+TN9YsnGhgl3j9ZF1yR15cZN7lTn37y8tWkhN76tEl3V45MzI/dX2s0/8EEyAi5GnggePdnMkID8mBPYzHLATD6ToiepqwrHV32rFVccQk057WidNOt8wEory7Pt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774580153; c=relaxed/simple;
	bh=iINfrVicT0U5ezZ3pE2giAjTHpsPII0vZlDnVZgk1BU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s2ExR8KlOCW5WihHNE/aYy+e2Pl5n8gUS0jOciLC7xtw7uMs0XdTjj5mZynOHQOXq5z3e4u6FNKUt+inf4zeuba/SQPyXw/JNafUM+cMrSRs6ZwsYzaY6Xht6JgkQoKfsstfXgNv6zoBCNsp+17brEhrTopBGDpn7GHj91XwnGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awCdkszt; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82c20b9fb16so757261b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 19:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774580152; x=1775184952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxOcLQAL828r9gNJF4VDxn22m5oC9wjYM2C1LJJwNlw=;
        b=awCdksztQSH1m9srS8WvlXY8s8eMij47LZRcVIjbHnQ8BKPJzn0vV1Qojw4yfAwLnY
         tDqsJ39RdPE7G3c+OFLqlsOnkFUpjjKs0wNJmS/fJd8izXibn0gJgjEN6djJdHoOngJj
         pSBlQaYJOqTCOG+m+erYfjyoTKPI3Mq71ovQBKNkZL1I1riy7C0QYPJ20mRjqZ+BqEHP
         X9uqOvdUbcXhQChS9crtdoprifBhLkKEn/Ki4fIEmNjehDgH4q4NwhBZIldOCmKl6fyH
         Lm0K9jspV/w63AvgEh0i4lrNK7XDh0h4G8PMzuDgaQokaj1awJ9xr5qAETqRUrX52gsh
         FtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774580152; x=1775184952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxOcLQAL828r9gNJF4VDxn22m5oC9wjYM2C1LJJwNlw=;
        b=YUAfdoTmuGl/812z1su96HL3lvpDr4VqbXyOD19xfUL9NIrFJY09uWDKcZLeoKbnbZ
         MR76TvTpkz69UNi5DSvTmZjMR83nLhbUUXnVT6hPZvsD/jGhut5Y+29SakX97L2z91Ob
         sE//Fj3PAXTVWBFdi8adb6V4IWKOCWaSDInXcASbMpybOFNaLlzguUjfpEz4Zg/N1HwB
         QTpzM35kt7cuWBLi6WyEQEI1kD51E+lxir4WWZl0mjUDSp+rhtwUgVpyF0+Q7cfkCOcZ
         4pVY4LciO6kD8+C8ZKrxRZQSj3Npn45Xng0has/fP/AIk8jMCnxkeplJTo+ReThAXIGb
         p2QQ==
X-Gm-Message-State: AOJu0YzgfvsxGo8QqVBy60KwZ0rJT7bkzZrhdpXDPT70preqmrHzmFCD
	aoWbh8e/tmmoxTZHMW2/WZFKfyzoyuqdN38A3v9Ny8P/86jDnhOgyWfTSEO+Q3Fc
X-Gm-Gg: ATEYQzyWp/XxDuqs3kzju4f/W2t4c0Sr/gDIXWklb1+DLxVL+oOiuDROJc9U17rHODQ
	TuTklq4pmrsC96kjrJjTj8D9Gfqu0NSh48NKfI9Fz8W/o5VxYNBlYX8aDYJhTocqqnKhefa5jST
	ReCrAoekO+F29UQWHjsECl4PIajeJHk/4ztgeRrh+2W5wNw1tIjXKr+XadYKNy3n76ZMYw5LCqo
	psi/mBrNOzeH4TZT9K0SHq2nnHDE6ZOcLG5xlX7GvxLD0niCnWADWzDpRtDwkO6FjiUY1L9j+5R
	WlRJu0pTYi+4zU5ZhT8ADV4t3wPkQsqaq4uk4rEVNyHivmsfqbxxRy/vN6fk1gm9rjiW/zF8zAi
	y9VW1QUorWsOz2YgFqyvpIa+1n74bD0lslFLAjwF6a0aArG8LU+SuN7L8HoNWMfHeBfcEK0UICR
	7mieUvnuXzmj2pNsmMKWuW+YVpgM1tc9/3/2YzHiduzC+16cuX3U7jTC8=
X-Received: by 2002:a05:6a00:3e21:b0:82a:7f1a:758c with SMTP id d2e1a72fcca58-82c95c27a26mr779771b3a.11.1774580151840;
        Thu, 26 Mar 2026 19:55:51 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d1e63b6sm4205803b3a.12.2026.03.26.19.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 19:55:51 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] soc: qcom: wcnss: simplify allocation of req
Date: Thu, 26 Mar 2026 19:55:34 -0700
Message-ID: <20260327025534.7864-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100186-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 283E533E98F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Get rid of automatic kfree and move allocation down to where it's used.

Use kzalloc_flex as we're dealing with a flexible array member.

Use struct_size to avoid some pointer math.

Add __counted_by for extra runtime analysis. Move the counting variable
assignment to right after allocation as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/soc/qcom/wcnss_ctrl.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/qcom/wcnss_ctrl.c b/drivers/soc/qcom/wcnss_ctrl.c
index 62b424e90d90..ffb31a049d4a 100644
--- a/drivers/soc/qcom/wcnss_ctrl.c
+++ b/drivers/soc/qcom/wcnss_ctrl.c
@@ -94,7 +94,7 @@ struct wcnss_download_nv_req {
 	u16 seq;
 	u16 last;
 	u32 frag_size;
-	u8 fragment[];
+	u8 fragment[] __counted_by(frag_size);
 } __packed;
 
 /**
@@ -201,16 +201,12 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
 {
 	const struct firmware *fw;
 	struct device *dev = wcnss->dev;
+	struct wcnss_download_nv_req *req;
 	const char *nvbin = NVBIN_FILE;
 	const void *data;
 	ssize_t left;
 	int ret;
 
-	struct wcnss_download_nv_req *req __free(kfree) = kzalloc(sizeof(*req) + NV_FRAGMENT_SIZE,
-								  GFP_KERNEL);
-	if (!req)
-		return -ENOMEM;
-
 	ret = of_property_read_string(dev->of_node, "firmware-name", &nvbin);
 	if (ret < 0 && ret != -EINVAL)
 		return ret;
@@ -224,11 +220,15 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
 	data = fw->data;
 	left = fw->size;
 
+	req = kzalloc_flex(*req, fragment, NV_FRAGMENT_SIZE);
+	if (!req)
+		return -ENOMEM;
+
+	req->frag_size = NV_FRAGMENT_SIZE;
 	req->hdr.type = WCNSS_DOWNLOAD_NV_REQ;
-	req->hdr.len = sizeof(*req) + NV_FRAGMENT_SIZE;
+	req->hdr.len = struct_size(req, fragment, NV_FRAGMENT_SIZE);
 
 	req->last = 0;
-	req->frag_size = NV_FRAGMENT_SIZE;
 
 	req->seq = 0;
 	do {
@@ -264,6 +264,7 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
 
 release_fw:
 	release_firmware(fw);
+	kfree(req);
 
 	return ret;
 }
-- 
2.53.0


