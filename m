Return-Path: <linux-arm-msm+bounces-112460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nJVYNRNgKWrHVwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:01:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF85266986A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:01:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pBSI4TWs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112460-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112460-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7377A30BEBF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA9717B418;
	Wed, 10 Jun 2026 12:57:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7134533B945
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:57:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096245; cv=none; b=oCzG/3ZgagkOfviw1bssHoPCGBp8wnkmfhd8iEtWU27c0Eho8c2xKISTC142LY+abXQZtm2YfE8tREJRU7w3WW4MNFgqXf3yNba2cLX1o4I8UlRILgPlM0k0IjiZZbwtqwZZTJK6ufNIRj//tCXMLx0Rx+HJscCOL1/HAUB0QLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096245; c=relaxed/simple;
	bh=6YA9f27qh9mxNMJTy0t4qFwBEHKoclJ2oyWrLICkyF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jLDjLKecxJI0bFdDNVNH4AjejqAxELqdIHsjYeuuv57uAjHfPTz5wxSYzvtYhuRzlnTrPpPEc+5dWaCQjd+j1R6O7GS4NkHsYTsX7tkubHyDKtgefMTAk175PjUbTMakgpjyRzaMC9ScLkbvOCKKbareConWPbkxxv/X2KtE96w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pBSI4TWs; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso77715045e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781096243; x=1781701043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5uqsocWiifn9fI4qO/LPuRHJe9fzJpovNTdwKX0G8U=;
        b=pBSI4TWshHy8z07GkK8iUK7BKMvUWX9HIEvO4tsOnWS6uRIi+8B3+j7t1X/B47JMTj
         NygS53LOiDkCpo/aBGuxtAIZqqpLmPoVfd3iy0kAKCvMpDFc/Olc/9VD9++PrCiHuWMb
         xsRL9JbYXlF64fR1Cz62AliOJmKJd6lRA2n/d5ufcQ7grxKFnvq4i/zDLh3swOR9dh1X
         i9Ae3iLjdDds0F08Dk4h2nI1EU9ta2zVhyf8vGOXbn/XdxpMfbL/++ki+TuvehfNjLVs
         L6yjTghPwb2XAAQ/qKkxxhdWi3wBaZiTpvXb60DVgbMLmxkeYKohd2Dp3MzCDkNX/lXy
         Wsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096243; x=1781701043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H5uqsocWiifn9fI4qO/LPuRHJe9fzJpovNTdwKX0G8U=;
        b=oF8lfbt7sSa5yfTo3inYMHZZwyDJzFX55QDyfpLyodGAxp8dEu0bQroS8tUGkiY3RV
         FFpTBcN3v+d8qm/qJdCTcdpx5Jk2aOkHNt/GTJsrMgybXRTD+1EpIkN02oyHnE8CZ+x5
         z7qXCIereQLhoK2RBxSv4vskiAxvgqDI+yfpRPyLMf/w74g66Kji5XckYjfYvumJarEw
         W0l0oZAyXRdwEhdMbtCp9iit6gXE+8SxVo7HvIBatF1LL/l5hLrZtxqLJQXKrtzzjY6r
         ggflCgxL7NwWLwnb1NlVwLgYrr2ae0Sh2HAdk73wjbPtIrrH2cymPKYdav9ZPFmUUSVU
         xKdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Ayyr7BnEzp+cK/RmupBTM+La8gvZ41PLZ6rgpSNUks+Kphb7dntsN9Pjywl8rfLEzBgDtB2Y6/k2aAOK3@vger.kernel.org
X-Gm-Message-State: AOJu0YwEhUpk3PHUsV4yYtx9bwEzP3TzgrbRIkq+3hfLYN1EgI+k6rR1
	UGU1ZgLF4KJICxINnpSFEVGT9SW2XVa/KUXcLWoExaMsCYA2lTTbel0=
X-Gm-Gg: Acq92OHvWquMO7YwP21R3EB/PpTPv9hZmFs07jtXyFGwFXfYNz7MppagQF4qFa7mpqc
	7RfqVvqJKLkJRm1cYNbTWH1DER+flg5GTaJawe4DvGPyom2050p9Nm8qS5QVThXABQwgH3rl3SQ
	tnpZJR3vEkgKYrwE1CWevTI7fRoHIqpP3bn3OZrhryd6KTaKhrcMm5V/d/1PLQXcg9iR1FYGH79
	0xZhPw2Qo0LMLU28gAzO+vP22jfPg4Hsg0HAyFFBTWivfnr9aV4AOZ2qU3UKwuJ0OCTmKQP2967
	T7yX3SBgE2ST+doD8gkzXZywm/twRp4VRNlB0V2NH5i9Ycvgw1HrPj0c4ibTMAMbvHD8DJJUaUw
	gqkJAjgtPa9BktpY+ICKxozoeCSowZHSSshDJ8gG1Cp9q/BWMKioDTc7cCsggZaQy92afbz3Txt
	ImjRVXtWlVzEe+QTWPlm58W1RiGYruixuF04DGcuDp2TXBASTuVpNNvZ16CHCYIwzt94ziEKFch
	pHVw8GnYHxd465uGYf3MjjEh/yVwqVAPnBRFnZBHne7in7Xn9prFc4=
X-Received: by 2002:a05:600c:4444:b0:490:b9c3:6c59 with SMTP id 5b1f17b1804b1-490c260579fmr398877765e9.29.1781096242349;
        Wed, 10 Jun 2026 05:57:22 -0700 (PDT)
Received: from localhost.localdomain ([196.119.91.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d66c8sm537328905e9.10.2026.06.10.05.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:57:21 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: quic_vgarodia@quicinc.com,
	quic_dikshita@quicinc.com,
	bryan.odonoghue@linaro.org,
	mchehab@kernel.org
Cc: hverkuil@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammed EL Kadiri <med08elkadiri@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] media: venus: fix payload size returned by parse_caps() and parse_alloc_mode()
Date: Wed, 10 Jun 2026 13:56:54 +0100
Message-ID: <20260610125655.10517-2-med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610125655.10517-1-med08elkadiri@gmail.com>
References: <20260610125655.10517-1-med08elkadiri@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112460-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:med08elkadiri@gmail.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[med08elkadiri@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[med08elkadiri@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF85266986A

parse_caps() and parse_alloc_mode() return only the size of their fixed
header fields, excluding the flexible array payload. hfi_parser() uses
this return value to advance through the firmware response buffer, so
underreporting causes parser desynchronization.

Return the full consumed size (header + entries), matching the correct
pattern used by parse_profile_level().

Fixes: 9edaaa8e3e15 ("media: venus: hfi_parser: refactor hfi packet parsing logic")
Cc: stable@vger.kernel.org
Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 1b3db2caa99f..e2af4e9901ee 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -85,7 +85,7 @@ parse_alloc_mode(struct venus_core *core, u32 codecs, u32 domain, void *data)
 		type++;
 	}
 
-	return sizeof(*mode);
+	return mode->num_entries * sizeof(u32) + sizeof(*mode);
 }
 
 static void fill_profile_level(struct hfi_plat_caps *cap, const void *data,
@@ -146,7 +146,7 @@ parse_caps(struct venus_core *core, u32 codecs, u32 domain, void *data)
 	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
 		       fill_caps, caps_arr, num_caps);
 
-	return sizeof(*caps);
+	return num_caps * sizeof(*cap) + sizeof(u32);
 }
 
 static void fill_raw_fmts(struct hfi_plat_caps *cap, const void *fmts,
-- 
2.43.0


