Return-Path: <linux-arm-msm+bounces-111076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5nOxDeO1IGoe7AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:16:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7D063BD14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:16:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BY8FDJzB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111076-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111076-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79B7830151DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 23:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BA84DA556;
	Wed,  3 Jun 2026 23:12:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3B437F738
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 23:12:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528340; cv=none; b=llDHWHtidjwn++c7pB4meqK+CBFlXJglFe11RManrSOG0zgxBDJehS7pEG57z68nqThIiAN98CqoQMMNU3/ehXooeNaw7JWwVsWjPbqbSbJlaKVbjVqK+aky4eE0TsNoSuEUbiBBHPRt2vkqO1/J6UIlA+nbcLbT2bND2HaOJN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528340; c=relaxed/simple;
	bh=56urM9owzVBr7SgwNvKD4dwc3Vjrr93bKnrQ9nWu1+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uGx5d72a9FNInpPMKrMfow4JJX2Hp43MYBSn2B4QNlUKVInP6wktkx/tKBMFYVVJd0Wc3IIZFtvL15/4Acz+5ezwKnWCJ/umiFihpTzGfGnC/yvIWMIjwBDH2rCeX7Sgk7ifiRx/dmrJ4pNlWK6kUkK4IjJF7K2ya6k6GVvGyUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BY8FDJzB; arc=none smtp.client-ip=74.125.82.194
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-304ec41197bso45016eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 16:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780528339; x=1781133139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P6xR0LWYCueJ851tt5RP16XtHsKU69wAadguzLJ/l8s=;
        b=BY8FDJzBCYocBmgyC7RhfBac2rfho4kwOBX5s1W6S1swPE5JZ0UFG1Wb4IQnuMdCLb
         8RjD3tZouSsAahYaUAgLpql9KYQBAyOlCnc2ig11Um4B/Jjbed66DZ6VoK3rkNu1Kd59
         sIoHurHMuQ4UeB2Ho7KXI/MjSLvQiMvVk08ETeH+rZdqpA+II1+3v498/iL5p9zXYZFt
         6iHGpDUASb1AKvJ7YeHUxsxkx3LCHetBLPNsuPvngonzyuyWo3mcV0HT8B/18UR7n7AZ
         vzhSf9sjs/EwgfiZZUFIAB9kW6Nfc5qpTSREHRPUS0r4F0W4RfbACSQpu1aZgmHgeM9Q
         jXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528339; x=1781133139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6xR0LWYCueJ851tt5RP16XtHsKU69wAadguzLJ/l8s=;
        b=srduNNjMBR/tCS4Z131yopv4N7kwc/eyWte5cwVcEM1ZHBtDagaoTL+ljtZP/ULpUH
         G1hFKjxczLsFvpIVGlmaKwk/tuc4QGNUtnn6o3LzGrVtlUmGcE9JI4JlQ6oIQ1uofdnm
         s+WZc0KUcKDQwYKeYHxbLVIgzqCA/8S4pZWUh76/wG73h6PXjNWbJCNj0VP0qsn943ed
         ulUf/504UF4LHxYVR8/Ia+iUCq6J+lBb0+2nYn+WtIw01mrQ322IrN42AMm5yk2LLNeE
         GUUwF3VNcGXS/cMqzOIZZkKxsTWWIXQEJsoaFeOuH3S6a6up5ocPE7HlCZ9N90gdJJRe
         HMqw==
X-Forwarded-Encrypted: i=1; AFNElJ99xnYU18U+s6dRSjQXTzK6HhcwLzZynY+uQT+OyJRjmBXysNUnCjOzJJtQvrm1KDkvGeI93I7LCypDTKGd@vger.kernel.org
X-Gm-Message-State: AOJu0YxFggVfSeC9/nuBTRZqIhLYcx7Gt5UBPI/A4dxAiOnneBBQGBlY
	DCBToAayPetV8fmm589kWoCMCmmisNrfjOxEqUl3M4HL09xRg/vjSEWi
X-Gm-Gg: Acq92OHFENUTK75kuzWuhVHiuCvCjfei4H0kQ1f7kuckQvA1X6ELOtdkxxAu+iFhzhZ
	44uglCMk4864Q7y5kJQjeKU8tFlTmR+/XZJNbQDpGDPCqcVglSIQs1DmPcjhEDR0yelQMPDaaIl
	qS0vSgNkW5mGxqM0OXl8b2/iKHu8agOnU5IqHkGI/8/fLbbLLpR5hmzngPGepSAKKkmCwZkiN89
	nhzyIzm1Fh1I72B5l1zQodfmOCeJp+0Hmv2rvm5SZq6TwGXeFwz+YQTt82kOPRurP9ulB+60F+C
	cpC+9reR4kInP6ExOTMedkTp1SpGplXLeVm8yzw34OpEPjYLfQDtQwb2SpROldTvKH4yPW0Hjhn
	8C1wE4VE9+6akWq7+ow0X55cgleVTXcAlwKjS+hf6V1uMBwigLUFUoKEm0lymMOC6Ox8Q3Od//l
	oozcJiJBYMnz43aWKIRUtJ8zqNgpNGtRFHtI55KgE3hBP7tXdMkpy1dGYKMmvt4khy0w==
X-Received: by 2002:a05:693c:2b04:b0:2e0:1f09:d924 with SMTP id 5a478bee46e88-3074fa3b818mr3683165eec.5.1780528338898;
        Wed, 03 Jun 2026 16:12:18 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcb98aasm3368943eec.12.2026.06.03.16.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:12:18 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	mchehab@kernel.org
Cc: vladimir.zapolskiy@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: qcom: camss: Rename unused macro parameter
Date: Wed,  3 Jun 2026 23:12:02 +0000
Message-Id: <20260603231202.6569-1-dennylin0707@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-111076-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A7D063BD14

The ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_0_CID_c_PLAIN() macro
declares a parameter named 'c' but uses 'cid' in the macro
body instead.

Rename the parameter to match the identifier used in the
macro body and silence the checkpatch warning:

  WARNING: Argument 'c' is not used in function-like macro

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-ispif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index aaf3caa42d33..8b0753e606c1 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -83,7 +83,7 @@
 					(0x270 + 0x200 * (m) + 0x4 * (n))
 #define ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_1(m, n)	\
 					(0x27c + 0x200 * (m) + 0x4 * (n))
-#define ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_0_CID_c_PLAIN(c)	\
+#define ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_0_CID_c_PLAIN(cid)	\
 					(1 << ((cid % 8) * 4))
 #define ISPIF_VFE_m_PIX_INTF_n_STATUS(m, n)	\
 					(0x2c0 + 0x200 * (m) + 0x4 * (n))
-- 
2.34.1


