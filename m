Return-Path: <linux-arm-msm+bounces-111466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OF/cFHnXI2pdzgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 10:16:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E59BB64CE63
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 10:16:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Zw1q/T7f";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111466-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111466-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D06D0301E98B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 08:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED73F31355D;
	Sat,  6 Jun 2026 08:16:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6E1262FFC
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 08:16:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780733804; cv=none; b=mobEwQ+Lo0CWoGyP2lQNZb10Udxs67Hpy6PmMQtxO9eCa6kkBAZOJoqTFmJp/pawnZJmIri10/aG2XY1ZjfpAwmCqn/uvEImVzLXuM3H3ApxdnU+pZenm6UcwrZc9+ktCawEIYJMPmtOKFG194kvepJeQhadbW9Onbi4PZqtm9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780733804; c=relaxed/simple;
	bh=XRLsF9m/UswY0c3AinlYQkni5aTuuuboCKSYyhRwQRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqtacoeO4qGa1MgbsYRHn0wRSW2/Yc3ofaCNtZXt6yL08ry+vd32kmeQNjkzfX0CcskqozDl8SzWkSXyutj9SUbsjPo9ZxueztgqBao3yjIr1a5WiObAreJlMIajhFM6m5KR4fJz6Lm2Sx1AlWEWb9TeCPXHdBPIKv8DlEwNYxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zw1q/T7f; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf1f074a12so28160805ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 01:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780733802; x=1781338602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8qChUGYgELG/aZ1nAOZ/r8X2US5HdwujYtACOKdC8M=;
        b=Zw1q/T7fLrAz6a61EssLqYSAiLDUi+Tz2NDCNw849dVZ83soemKzBkgH7wskbMbFF/
         SMgqqZHn2mvSBo2/R+4Jv+iSBeRXEhaW/XPv2sXRpmzUOHL6GOMYqTQTlCDxnjGUDsyM
         riI3RZWbcSirCNNxmHaOu42swk2i21TBwugsfTxA1vlbqkf3hS5Oy4M6nGoAJySEYawb
         uQuy8WPnUtwFaU3YV1F/HED3mfBxmdoHCoeZyOqmVuVHbxo78u/gENbJjJhxLObJGPZq
         PqBZigvhALNY8rq8mg6FO8oF4FY2EzLuHbiVT5KvJ7fJ9GH+o54S4k1CkDm92Zy/XmCj
         xc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780733802; x=1781338602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g8qChUGYgELG/aZ1nAOZ/r8X2US5HdwujYtACOKdC8M=;
        b=qGubVsWXqbEkdjlFQsPL1W+e+dvcZypO6/9rLK5yxHLmz9flQGnHfsIMHB3ydKHE3F
         bflYUdMRkWzXUOG4BFeVb2dGWToEYNqEA5Y/mrd7ymMnmHQtwQcQl/WsXKHoFQJZVggg
         QLnwetQoq11TpJlBDW0jhxvkEx+C5iABaF09oBG/KUQtnr6yAgIe7X7epkEHKUo+9I7u
         Msc92oV9EEbKJETP7SEdlADAOUVpQX5Hl6K+tY0oQ/+fonCyAdM2t85GAVAIRfp9TacT
         do0iodr/858XmRUdbcFVL3rJFUlnUwplte4d6dGu8eAkageIfUNzrWSPrqUb6FrbRz0V
         J/MA==
X-Forwarded-Encrypted: i=1; AFNElJ/0Bln+oWl9X6f2iqsLl7R5WyU5Un3RsjTNDZvhHuBQlKJlkYscfH8eDScIv58T0R30vovAuaK4nhqir1Tt@vger.kernel.org
X-Gm-Message-State: AOJu0YytTFH+73npZCafpfUygFWhxHvn21XHBMcdOPoUggSAGsJVMEsj
	6ik9WkBya9ZviEUQUrIrQHffkb/8ZG2mMW297DktRlpyfvpu0gdz2A5w
X-Gm-Gg: Acq92OEP1xzv9EoXT89C7meyvpRz/At/rK5CfcLxf7bvWcSgaUw6WzC2b9ATV5La3q7
	YDhAAFv7xL1SZ6IwAa/H5Rh4phFjLPVQ+r4qTcZxUjdAFcQxANQKhCuMW+4noz2OvpUvfFOVsHI
	r1Le54n83kP0Has6DkwxUvzy9zJbbwC1qgFb7n5MFuz2NIpRRlqscqaer8rKIEX0mv+SMbKNb6a
	ZN384YJn7y0XEsNGhy44jSlvhe30I3fKfZwYkgmZBUaO4jyIJRKASMfSOqlu8xE63wpLwiA3s1B
	SRc0mSMeTe36l5uzAdYovwBPHb+U+asPVe/NVyMSpm2puRsFY3Z6vFYI/xEx8ZQopybRXtj/xfU
	YAhBgdbYs3lpHvRTUkWL2BpPrd6lk13KQ4v3Cy8KlvZaeABRa8lDHn5t0Df0ms8Yol/y3af8Gdq
	TI6VtjwsWKiDXb8YlHwNxuOTS+54d+Q+ZLAIby0d4vfIErEiLtDujOQg==
X-Received: by 2002:a17:902:c94c:b0:2c2:33a4:aa8f with SMTP id d9443c01a7336-2c233a4ade9mr7285325ad.13.1780733802479;
        Sat, 06 Jun 2026 01:16:42 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:967f:7ce4:ec98:f08b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d55esm116375565ad.63.2026.06.06.01.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 01:16:42 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH v2] media: iris: check decoder format allocations
Date: Sat,  6 Jun 2026 16:16:36 +0800
Message-ID: <20260606081636.3-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260606040736.13-1-ruoyuw560@gmail.com>
References: <20260606040736.13-1-ruoyuw560@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,linaro.org,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111466-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:abhinav.kumar@linux.dev,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ruoyuw560@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ruoyuw560@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruoyuw560@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E59BB64CE63

iris_vdec_inst_init() allocates source and destination v4l2_format
structures before initializing their fields. Allocation failures would
leave the function dereferencing NULL pointers during instance
initialization.

Allocate the formats into local variables and check each allocation before
assigning them to the instance. If the second allocation fails, free the
first allocation and return -ENOMEM. Store the pointers in the instance
only after both allocations have succeeded so the open path can unwind
cleanly.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
Changes in v2:
- Allocate the formats into local variables and assign them to the
  instance only after both allocations succeed, as requested in review.

 drivers/media/platform/qcom/iris/iris_vdec.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 99d544e2af4f9..837f29f403bb7 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -19,10 +19,21 @@
 int iris_vdec_inst_init(struct iris_inst *inst)
 {
 	struct iris_core *core = inst->core;
+	struct v4l2_format *fmt_src, *fmt_dst;
 	struct v4l2_format *f;
 
-	inst->fmt_src = kzalloc_obj(*inst->fmt_src);
-	inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
+	fmt_src = kzalloc_obj(*fmt_src);
+	if (!fmt_src)
+		return -ENOMEM;
+
+	fmt_dst = kzalloc_obj(*fmt_dst);
+	if (!fmt_dst) {
+		kfree(fmt_src);
+		return -ENOMEM;
+	}
+
+	inst->fmt_src = fmt_src;
+	inst->fmt_dst = fmt_dst;
 
 	inst->fw_min_count = MIN_BUFFERS;
 
-- 
2.51.0


