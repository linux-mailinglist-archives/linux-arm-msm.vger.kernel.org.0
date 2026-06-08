Return-Path: <linux-arm-msm+bounces-111740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZX3nKUh+JmqtXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:33:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0436165415C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:33:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UpFfK6T1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111740-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111740-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCCAA302A527
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235693A3E73;
	Mon,  8 Jun 2026 08:17:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF773A16BD
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:17:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906672; cv=none; b=WqAlZnbySLoGqjtqepJnyLTQSDQCz5u2e8Pa+h4eIFwJ0yIfG1rgmnWYh4FaKq6Pj7YKAHqgIv1midbolOfaqnQS1vsznIlFmViGkr0n8t35WkQ0FOFwWNWmngxCM+NTvhbF69E8t3SGf9YnbqHIkiYTH1xqsbz3wWb5hbp1J3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906672; c=relaxed/simple;
	bh=Li9jQWFybM6msVbXCcQVnQCT4CCsaZxeG2KSupr+ghY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dczIuIqdduLRuJhdGj4ImaQ+Nfr2e+HV7fyRCIL7EPY8DmqjzvP/9OutawZhN6FYPbuyOlP3Yp/+Hzc7XCGLWeoxpRtBsswABrbvFYkOn88floGGwaqRvfxBNbN6JtfhU9d7b8xtxZ7+wWDfg1xNkW3AOluaw0iYWlYEw44HxxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpFfK6T1; arc=none smtp.client-ip=74.125.82.68
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-137335bc3caso4734415c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780906670; x=1781511470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bYTtDzvbWIHpiXUZf6PfSqu1DYtlFSJqScVaIHcDEFM=;
        b=UpFfK6T1z0Sd2VNtVAc42xFKxZNFPvxJKMjD6kBzQ02yrHRbdM13qIHYeLz5xNKEuS
         N4HjQcqH1pcsP70Td8y8DEEx1W1QwCo16Ufoe5ZngLjwgMw1cFmteDk9dj6g6jqvomlf
         2V93f//EOkaAETeFcQp1DymZtjIknuPhKf8/6Ud+DVoSQoX0Q9cLhD03Ef+4M5LeNmWx
         0JdSDvM0uH4ApZbRWogfsvhgZzerjlPWc/ORwatbid/RQhtUMgjS/FZDXUCWcnx85rMx
         EhzIfr+IanqNwphDjZng9Ua8XgiJLIA6KWpl/EDWkMM2Nv8JG/9KNbwKDEjoXDy8UTo+
         ttYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780906670; x=1781511470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYTtDzvbWIHpiXUZf6PfSqu1DYtlFSJqScVaIHcDEFM=;
        b=FEcO6JXh/bBK/WIqS3OsGToSw6SIR67j5qFoZ/Ab9DhVAlFw5c9g/JNmAQdMcI0xwP
         eFkXWMB31ygCUw00ACJwrR+6mGfiICWP55ZJX9LOWSY2vLxDb/1AyEVeVvblshrebN9N
         ZkVyf0y9gWAdjnet2zfxQ47dArN4x+lpzS9rk6eWuNEx2bjf9zwPtVYP141a4ZfvI/Ow
         rUiDKy/dDPQ5Mssw/uu0LlJUR2j2i7yHB2aGAcgdqzSqHBM98P0plgQwolm0Ig7bHLIu
         P1dwOvKwQ2RBQCHYomk/Kak22OQBcs/yVaYtL52eEzo8Lxt8aujP8jeq2Eo+7C1JNaq8
         r1rw==
X-Forwarded-Encrypted: i=1; AFNElJ+6MyPbKgkdMnddd1yylGL3lYIygUCIvh8H+AjfeF8sXS3UZoMRQ/XLSpCiXwRMh6zkTfspJeIam2cCXEFx@vger.kernel.org
X-Gm-Message-State: AOJu0YzjrQ6abmIbf3McUEljqurzN0eSfWKImkf20yjI3NIWN+ERyrHD
	IcmNi8EGVECjUCVQEzEYXqJbZrrB6g6+q5C8RckyABaXhgqlzdQi5Hzh
X-Gm-Gg: Acq92OGFiDwqe875mb7kvSw0e7D279WBi4qYmeCam5gEKf3T7PhSIRp5ctU3x6gKvxt
	aEmXTMN5U6m47d7+lRJCerjkGZWP0ANbRvLoPYYYHW0NvPHEAQ+D8BHl6Gd79y/YSnwP/DvVEzY
	voQV8DGefBLuDgcyMmeoN/2xm929gZYp3EO/nbJ/CpTelB8VBflAB6UbREf16wSo6U0och8gLHV
	9vw063/9wrTwe0S8X+hQJcwlsWTDhpYvMiLGtRX7S6D9ZB7I0BbEtWRyVdUkY9SfxBOA398jOpd
	0VlPlXV6470uwQhRPxzhCU5IjgkJoneErFH0Qt63aom5otFNIbuxt24YRAF2TcuYMXrUR9TMjj2
	+XAJc2wLcNXK+sRoKfuefxNrelYykahbExaXAiCabJGy7CuPogKKzvYMK0hyGn9VgxaT0NXfvWl
	LFTBctAOrBY/mEd4vYkiDF1fdxdy3BNSnWIMsttV2nFSjOaza8Uf9MQisbkN9z4ua5S4S8962uc
	B7t
X-Received: by 2002:a05:7022:62a6:b0:137:9399:fc59 with SMTP id a92af1059eb24-138066e0064mr6055045c88.21.1780906669600;
        Mon, 08 Jun 2026 01:17:49 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-138063de4a5sm7678245c88.13.2026.06.08.01.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:17:49 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	busanna.reddy@oss.qualcomm.com,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v5 0/2] media: qcom: iris: fix runtime PM error handling
Date: Mon,  8 Jun 2026 08:17:19 +0000
Message-Id: <20260608081721.82846-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111740-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0436165415C

This series fixes two issues in the Iris power management path.

Patch 1 updates the runtime PM handling to use
pm_runtime_resume_and_get() and ensures that runtime PM references
remain balanced during power-down error handling.

Patch 2 rolls back the maximum OPP vote when
pm_runtime_resume_and_get() fails during power-up, preventing the
driver from leaving an unnecessary OPP vote active after a failed
resume.

Changes in v5:
- Handle pm_runtime_put_sync() return value in
  iris_disable_power_domains().
- Add a blank line before return statement in rollback path.

Changes in v4:
- Added Dmitry Baryshkov's Reviewed-by tag to patch 1.
- Reworked rollback handling in patch 2 to use a standard goto-based
  error path.
- Roll back the OPP vote from a dedicated error label when
  pm_runtime_resume_and_get() fails.

Hungyu Lin (2):
  media: qcom: iris: fix runtime PM reference leaks
  media: qcom: iris: rollback OPP vote on PM resume failure

 .../media/platform/qcom/iris/iris_resources.c | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

-- 
2.34.1


