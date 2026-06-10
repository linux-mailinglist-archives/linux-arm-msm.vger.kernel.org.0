Return-Path: <linux-arm-msm+bounces-112462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7cqOOGVgKWrZVwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:02:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DBB6698AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:02:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bnXgkwJE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112462-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112462-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAFDD32B3857
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736F33DB31A;
	Wed, 10 Jun 2026 12:57:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB7B1A5B8A
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:57:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096250; cv=none; b=AkifZ3Xc78cnzchx12+j/A+98l5Win0EEhx51+BMhEq8b6/AtCjDt7MbAQwfa9tm4DA0TfJNwvv9yzw8wvT31B3KonfM6IgsMGgmbKKBdOgN0Nj0bv5zRX5vHVS2KtJEj+ecAFvol0KELpT1FjS7Jv1BhYBVlm1cOXDK4g/0kZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096250; c=relaxed/simple;
	bh=KpIx1agiZkgrFurtoJ1ET+tTDHaal1A3VQITZbFLKeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r7kMJdaBZwZQ2powoCZsh5d1g2azc4T7IGNsBp/TBcpn2rUCy0bLqgYshUmUzQD6/DbkrwgM2dCPAHrmO0OJMNV/7oQsAzyBmqaKHuE/nOJR6MfnVwqVMP0Hv5qFTBiAIbajRzQ+S5AmsjujzZ/GOmsZ9+jlWLlV0QwgjnoWy+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnXgkwJE; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef616daf6so6229044f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781096247; x=1781701047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0d+zdeqH6lMcQH9MYJ6TD+dtSYgdC4zwQaodD6IKOc=;
        b=bnXgkwJECRpyxDxO3mR9D+1ghNsmeNjn4PGD/neqzOOPe7wWMGoVmU/tV9rYTN/yH5
         0NIRir8Am/LKag4JfMBXCIUNMzKkd3sZPX8fzKgyF/XCcy7oSO7rnFLzTZgIh4Hnq7rW
         W83cBP1C1uiMB55m/4dyh+VwZ5CAwYAMRWIccPMwmVH5zhAH/fB7tHEjNqk7nh5oEXEV
         21/q/vcSMpr0+6y4w20pvowwbUiIZAmUnn9C9m6NOc5UdLQACjvZmvR+U+70WeM3IFBc
         WZGVZHHIM7kMcH7/u0R0EiEK/4MXTm6mU+ec+dnfO5XbRo2/OkhDqBRAlRz+o5YaYDcd
         x4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096247; x=1781701047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t0d+zdeqH6lMcQH9MYJ6TD+dtSYgdC4zwQaodD6IKOc=;
        b=hFbK1QfNxj84py8ACWHUJ3SlreaCGD4eVcNpR8dfnZOi2qcw6nWrBkw6efCI/Vtaug
         oQPwj+2JBPX9QkojABMte8H8WQpfYFDHuBJvZHqptP4jM/g2ottP/7mz5+Ve4Gwjt2r1
         KfWJaJAT6xzTpqOvv62gr7upys9C3guDXbuTIxW6OYWicC1UPvnT8PlN2fT+cEqczgd3
         a02UnwOiLtiXcQlMmmPnGQ1sdXl29aCSJzqel4phFfg9knTZzMvjQ7CG1zuLuI8KU3+c
         SuOm0oP1nIeZSIKQRBQ4o/SOB4E1gGxnzyiRzKyaDoNz3rK9mp1VAjp1F7CIfLtNhb0j
         mhYQ==
X-Forwarded-Encrypted: i=1; AFNElJ874q7UILWpqklkEgKS0CnxPCjusF3YXPuvWI/K9byUySGbgU53/JcimYZZeDazup9aR+jJffqucw9cPOLl@vger.kernel.org
X-Gm-Message-State: AOJu0YyYi2yNU92urbS3TjedTvmQX0jLn0cQK2YSXCb/4ic2pxM50Ou4
	xSDOul5ruX8Ilwd2IhTXX4EKC7dcyfqInC8bgvtHRJD/MXhdLOsKPHQ5UBvJtfc=
X-Gm-Gg: Acq92OEV8FeD9s6q1amLNVMqIzwP1gVcRT+pizoEieALveczGHYTjv/gfQLwNIuruBy
	kuPBBWoMjFzbzJi69s9NoRy+7vB6gntJFJmW5SUFb1P+rbgc96LZdEk3eyh6/wYQ9qeGWGDTBL7
	Cd/hvHTuX97JRnCqSPbJrKt3B68qhyReXlxocRNEtKaq6pTXBQVPDMerMU2OvMsy5dCMJ3ATDO+
	NU1WASducbttK0pvfiDnqjH3rIfrtqZBTK32XyQRsElUPIlyoF7+o/+Y32Bl6i6FffLiFPyMv2S
	Tk09x/ZJ7vV8j/uD9Z1W8/FRIy6dUfRQ36HLIFqNcMFT9I2u+ig2AOu8FYiUTcJ50n/eMWRDDYV
	EHXLE1brH2wd4oOxpKnm/y9y724mUl/TaOTOiO80x+rhz0ZW2iBYTKHfjLzNosZHdYaAENbF+4K
	PC5JbgLiiZP8TG62HjGFI6ahnF+7Hpn0jWwkKS5iABUsZOmDY4j9vKtNKYICnpkKS94OoJqM9aH
	RSEU7KWxX+HLflb2PFDuOaOnlpsCoakulBe1IVHmxuUntiRrYvtsYnnd8GspIo0kA==
X-Received: by 2002:a05:600c:6384:b0:490:acb8:1490 with SMTP id 5b1f17b1804b1-490c2591e5cmr378024635e9.4.1781096247246;
        Wed, 10 Jun 2026 05:57:27 -0700 (PDT)
Received: from localhost.localdomain ([196.119.91.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d66c8sm537328905e9.10.2026.06.10.05.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:57:26 -0700 (PDT)
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
Subject: [PATCH 2/2] media: venus: fix payload size calculation in parse_raw_formats()
Date: Wed, 10 Jun 2026 13:56:55 +0100
Message-ID: <20260610125655.10517-3-med08elkadiri@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-112462-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82DBB6698AA

The consumed size is computed after the loop using the num_planes value
from the last iteration for all entries. When entries have different
plane counts, this produces an incorrect total.

Accumulate the actual size during the loop instead.

Fixes: 9edaaa8e3e15 ("media: venus: hfi_parser: refactor hfi packet parsing logic")
Cc: stable@vger.kernel.org
Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index e2af4e9901ee..522bac7ba154 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -171,7 +171,7 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
 	u32 entries = fmt->format_entries;
 	unsigned int i = 0;
 	u32 num_planes = 0;
-	u32 size;
+	u32 size = 2 * sizeof(u32);
 
 	while (entries) {
 		num_planes = pinfo->num_planes;
@@ -186,6 +186,7 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
 		if (pinfo->num_planes > MAX_PLANES)
 			break;
 
+		size += sizeof(*constr) * num_planes + 2 * sizeof(u32);
 		pinfo = (void *)pinfo + sizeof(*constr) * num_planes +
 			2 * sizeof(u32);
 		entries--;
@@ -193,8 +194,6 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
 
 	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
 		       fill_raw_fmts, rawfmts, i);
-	size = fmt->format_entries * (sizeof(*constr) * num_planes + 2 * sizeof(u32))
-		+ 2 * sizeof(u32);
 
 	return size;
 }
-- 
2.43.0


