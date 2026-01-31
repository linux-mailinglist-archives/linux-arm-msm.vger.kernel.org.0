Return-Path: <linux-arm-msm+bounces-91340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMjaKYdifWkrRwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 03:01:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52369C02F9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 03:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A06E301546E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 02:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BA325B31D;
	Sat, 31 Jan 2026 02:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9d0gHCV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624EE2DD5E2
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 02:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769824878; cv=none; b=U+MJp8vRQkRcr8nAuU0vHxv4w8lru+p/4l+Ah5oHo4l7+9kAODfluztifQk1SWlgUJduf09A+BFsL9Q1MkBrl7R3J2mRsPQd7fYpMQUl3xl//ZEiTCGcf2QVMJFWLlmkmEoC/C/Jv/ENUi8qL3851n23JU3kM2jUmXcCvof0BAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769824878; c=relaxed/simple;
	bh=92T2NSenuzpQ1IeP2UgYsAzY+M+FQA1qO2qwotD+glA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ta7uo93Jk14f+mlLE6G0gN0Ssem3I0EB24BZLYJsJ70P+H/301rjcvijOggSowv1gj2mE2qdMQEk0YUw8KvENsiJ1emRnTIuRd3KOuRpl+z0OEcJXXbLgK+7vYlLGaWwg7ehdhrc247VJFAGibkxbEcpahmMTYwo+dMF1WWVJN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9d0gHCV; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1233c155a42so4696493c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 18:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769824877; x=1770429677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uXzjo1qPCGsNjEppRvNKaCpQ8NopBy4yIETlX1eZ16g=;
        b=I9d0gHCVSbDKxPb3iaDrzAq7DT05UKy6ZXgC28ObFI4yJ8ZkH0b27J5mwDH3AqRa7t
         KlXdtVBYv089lx0PVhZ2IIXyQqXxJ1RV4U1xJT3SZFkHqs7k7/GJWcIARFznuz0nAbN/
         6BD6hmjWGROcBUbZhWlJMWhAlLe3oc5GfyKfAfIqwurcbwiqIOAf9lxQLiC5b2gfWdmB
         njCSj1slqwb7h/Cr/ub4dJxx2MqlTn5Hvpk8UHFidOJbsFEfMyNvbpBKpVRTHI5kCfT6
         qb31mP71uRzPn6p+j6QVjYbCDYaiEmKnT4zCWbM5kguneV0Q9sjeF/CrbRmKnKkQvxDQ
         JZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769824877; x=1770429677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXzjo1qPCGsNjEppRvNKaCpQ8NopBy4yIETlX1eZ16g=;
        b=HYzUqIgwjRuH0OmfNOodt4oV9hgrQ1VCAPAPYmYksK71LAzxLUDXGtN03eqjqNwobG
         ZGxXlNpeRvfePq2UpiIE+bKYRvTLUoQqn3WJfV/+WfxNvi/E6SrMavlbw1M+sgGyw7md
         bdGfubc/He8NybKc9lPF+JALy6FYrZ8jtiHQu+JD7NCStpa9+CEpy4LT+q4Vr6rVSK1r
         DCS728jEUg92JMseahUFVoGh2dMC6bPd+kBfwmvmhapHxLYI1G6JKpbUbKaaI+OfJFAj
         CWA/6YCtU7CcMULADgtpOw+yfXfDSb5F2iF7P8ONWPMzXM1GxwD/IfVkspgrNxIjcVEc
         CqOw==
X-Forwarded-Encrypted: i=1; AJvYcCXO6SkYJTH+vGrsEVCPK5wsTCBCSO4zCCtrlh/+HsvcHtULJTZ7YJYAMOHlvg7U/E+FBi+5u9nPRAQJJOZf@vger.kernel.org
X-Gm-Message-State: AOJu0YxBmIun896OdHrxFzPZgmNx5UGEinosCiZqlgeBtb0D0mG0ML72
	2EjXZ8ZJh0m9u60/pxKCd4QMGu6wQNBY7T3N7YeWRu8Z1uKE7XaqK6iH
X-Gm-Gg: AZuq6aIzXXFPmpI9qBP60X2Bx4ntkrOy70q9TuRxg0to3c4E7Z1PaQZLBjduNzrBuwI
	i654OjCZ/Eevq6qVcCXehdUTMmW8Kox3gKAmUsEErUBtTFh7NowGxCw4q3TKQM/+mZu06J2KM+t
	/GLVbjJ7OAbIjXaX/XhBXizaAuRP8OmWlRbq6bsY9Vm04OOSKb9fqgcyi8UBzQBWi5hcokJYtQN
	MSkOyeeRnv8FNpBBWkl//o4CM4QWbqFO8H8vCVgSFGs/l+2EbBgC5eoSeFWU5rUQb8dDp8bFeN4
	wyiPXUo4U/zUtQou462WbgQLv75Bc8IsW6zWRmU+wFYgdNEkQiD3COMCBxCPihtmw5vJkUOqjv2
	d97Z/8ktcF/6o8NhX+2T7na3HWFXd26CW9gyn38JCoGRHNFK55ZolZcrpWQEvAztJJpJykhhAtB
	T1x3NOo1Q4/Sad/inrsRc6JAO7/l35IcH7KNfa7Zy7xH+TDtFuebYZgCA51k479xVHAa49TXbic
	q+CASgy6nC2ihpSiGU7fT06lci+XSlghdZesnKYZMbAPGMTlhSjAVakicwCs9qDdpiwNvA4FFGw
	NOfZ
X-Received: by 2002:a05:7022:4585:b0:119:e56b:989d with SMTP id a92af1059eb24-125c0f87329mr2407082c88.4.1769824876553;
        Fri, 30 Jan 2026 18:01:16 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d6b663sm12290534c88.1.2026.01.30.18.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 18:01:16 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] sound: wcd-mbhc-v2: remove unnecessary module_init/exit functions
Date: Fri, 30 Jan 2026 18:01:10 -0800
Message-ID: <20260131020111.46108-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	TAGGED_FROM(0.00)[bounces-91340-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 52369C02F9
X-Rspamd-Action: no action

The wcd-mbhc-v2 driver has unnecessary empty module_init and
module_exit functions. Remove them. Note that if a module_init function
exists, a module_exit function must also exist; otherwise, the module
cannot be unloaded.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index 26ebcdadeb7d..0c842aaa7eec 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -1631,17 +1631,5 @@ void wcd_mbhc_deinit(struct wcd_mbhc *mbhc)
 }
 EXPORT_SYMBOL(wcd_mbhc_deinit);
 
-static int __init mbhc_init(void)
-{
-	return 0;
-}
-
-static void __exit mbhc_exit(void)
-{
-}
-
-module_init(mbhc_init);
-module_exit(mbhc_exit);
-
 MODULE_DESCRIPTION("wcd MBHC v2 module");
 MODULE_LICENSE("GPL");
-- 
2.43.0


