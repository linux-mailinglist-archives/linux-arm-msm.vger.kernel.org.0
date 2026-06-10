Return-Path: <linux-arm-msm+bounces-112459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EGxNO9VfKWq9VwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:00:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F7D669843
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:00:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NNptyTKO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112459-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112459-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C666306263E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05ACC35972;
	Wed, 10 Jun 2026 12:57:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B604C13DDAE
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:57:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096238; cv=none; b=IBfArPbLEnNN82ARx+YsApb65TBpnJi5HNxb5Ubv1u61i7035v0cyYNNMmEsiQSIU4deQXKMb9jFtI/RwXhttYKK330aL0YTHnmGZaSL0slZa6p1BrXrQNOFs+9EuRbPXFV/Riu3i3Pr9drF+sbpoQqZ7Vktba0rKIvCjoCtL28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096238; c=relaxed/simple;
	bh=KkBff9/uoWbU/a1+RXW9N3cbfvzcrEwEXeqzOc1Mpg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rix/v+HdN4e+lONJ149wRfWO4Mcu3COtAlpM7627lDgs3vGra9hFdoVVy1LUnDBZuC6xKYFMeOpCNsYQ2lD4ihQ5gli+GmN1mbnluEF989tZYf5QDfE7MWFvPaLbyB7o3tpD7deec49R0DbtAhPSQXUxT2jUvcdNhy+pwOUh4ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNptyTKO; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so55602465e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781096236; x=1781701036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8BqhA8Ur5Cm+1riN1NRvX1rCZrGcR0jyTnzO209HLgw=;
        b=NNptyTKO4/ta1/HHnrajbLFcEfen5W/J4km0FSvFJPrjif6uHb9FTrFjpN1Nerwp0g
         DTQOGtX/5iU2oGUXK6KtWFhmNNaWdJoLBtIszeG1YDqw7vrGb7z43U6YuLRAJpgIU+hH
         r5LicJ5DScebIPMEPV8y9eIkACBPZLn4vNR7aXRwWoZioCQfYjwoQqRpb8bAh+n9JPi9
         Tt3Jipq6vICK2YhrXe263gRDsgH/1oZ5VODcfpCHYUGF3Ds99KvMUuyNlpajHe+3dVH2
         x+yVEl2zyHnbcBl4QUwiHkMEcQJTPSM1uQ3v0aPfae6hONGXYGY4vlg3i89JKNyaBkm8
         QuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096236; x=1781701036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BqhA8Ur5Cm+1riN1NRvX1rCZrGcR0jyTnzO209HLgw=;
        b=SEX6ov9kX17OzaoIElpJXGHmHZDwn6WNEWbNhfKTGVd15DCj5/LrrXwU/9g3B+3Akf
         zXSK2lVjPHeIog0MXAjuMAxIC5E9Y4rKliRJC4qR8eVvtRv9izFaeKojrNlzYgvJYqux
         kXabz1nHUyYh+ERXl00e0zxveI7b5Xdm2r1RNEiUOj8HyaNOTkFUWY3r6GKAdf+6fG+o
         9v22zMFe3UhWblcbYbL4Yt4HQ7u+IGRtFmEatIjylTuMYhaYlf1GOo6mfEzAjlkjE5AK
         BniRir6yaYIVYEj+zvTLAeLPcJ+1PLs0K5rZXJ1CLYuer5dms7o1Y3m3NNRVGc9Cu4te
         gPHg==
X-Forwarded-Encrypted: i=1; AFNElJ9m7PkYarckVnyfdq8xtAoyiVvv4imDmqFIAkbAGMSjFmszvm2Vwb4b9UVFw3c3qHRp7g+Vvyla6focnoBi@vger.kernel.org
X-Gm-Message-State: AOJu0YzQdTCQc8AJtvkh8CDZV7hP9aN6lRuGn1Cesm9HB3wcaauFbb9X
	j4//FrO+q2bOYLmKOTt0oTSx3PyyH7qC3rXYTuuiv1ZKh39c8oe9JOI=
X-Gm-Gg: Acq92OFQTv/wjCdr9EWYzQy6mrMWpN6Ym3ySC/GhNhgszIpzsWR6JKCNsl+Lwyee1Qs
	PjKpV52ztBMI4Mn9CrOMW2OKpO8J4uixOVstyUVgqRWz8whm6z0aou0cclQfhbjX3cV+pzeZ3YZ
	wTVYeCZ4vWmIx/jr0v03R1B8t60gsbrIN79uE+J1cCiYjvkdZlhJiDra9y+VbYzwPZx7LeCeqcc
	Of1ToysrO7GiuSbhEh/FzfMfcWp1UMkVp16thWLO3ltVMfXRGARzlybeHzHNI89gMPhYNX2JgBc
	wAPzqK62aP+h22s/OBV77FC9rw155TnGEV+EEl2jcTCWwV9n264GVa5OojkuSca+qTQdg3pZxZh
	exfEEwSOYyzRrWYrh03ITt3Y38qI8JmIwyd1PckA8XxvvdMUj2wf/zKfPjRvQtXRFQFa6x7l7e0
	HR/dz0gvONuoyWA4w1JwDZp+9kYonP9S6M1JjIpswOEEFEH5EWj/wzbMbEpjE3YaSJrWNfD1fF+
	juVovRk7t6sEmcWJs0VL3BGu437xtYftWgLSvhfPT5OQcxYWp/LR94=
X-Received: by 2002:a05:600c:8183:b0:490:5cd8:d213 with SMTP id 5b1f17b1804b1-490c25c4898mr357967815e9.15.1781096235966;
        Wed, 10 Jun 2026 05:57:15 -0700 (PDT)
Received: from localhost.localdomain ([196.119.91.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d66c8sm537328905e9.10.2026.06.10.05.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:57:10 -0700 (PDT)
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
	Mohammed EL Kadiri <med08elkadiri@gmail.com>
Subject: [PATCH 0/2] media: venus: fix HFI parser payload size returns
Date: Wed, 10 Jun 2026 13:56:53 +0100
Message-ID: <20260610125655.10517-1-med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	TAGGED_FROM(0.00)[bounces-112459-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:med08elkadiri@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47F7D669843

Several parse functions return incorrect consumed sizes after the
refactor in commit 9edaaa8e3e15. hfi_parser() uses these values to
advance through the firmware response buffer, so incorrect sizes cause
parser desynchronization.

parse_profile_level() has the correct pattern. These patches align the
remaining functions to match it.

Compile-tested with arm64 cross-compiler (gcc 13.3).

Mohammed EL Kadiri (2):
  media: venus: fix payload size returned by parse_caps() and
    parse_alloc_mode()
  media: venus: fix payload size calculation in parse_raw_formats()

 drivers/media/platform/qcom/venus/hfi_parser.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

-- 
2.43.0


