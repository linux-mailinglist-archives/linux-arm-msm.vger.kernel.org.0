Return-Path: <linux-arm-msm+bounces-116213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id giy9OvVtR2qlYAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:08:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C646FFE58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:08:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OhPQopWK;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116213-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116213-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09AED30B1DD2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7636C374A0F;
	Fri,  3 Jul 2026 08:00:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE21037268F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:00:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065626; cv=none; b=E7LAV5kbbRCoeNSL7l8Di5vN8sqypPz16vDRmj12pH+TEAFv7tXYMHQNgU3U/zEN4GZ6H63JY/XqOqv58b91M5ju7QlE5JEzDsK4J9Rtqk9tZAjU1IdmyszKDbBgkKinVSHMfEJkGZKl8Nl5orCGGyHkhDKEW3e55l+RWiOoRC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065626; c=relaxed/simple;
	bh=34nDGORWSQqcLgVsQP4EEN2mXvHlBSSBG3ZDW0Oheak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RQEcVmdyWYJrv11s710mb9wVKN8EigIM9/U/W+rvxzUuENL+i5xSWHWfqo9Dr9CBh96BHMHPGli+0SzFRrvRFM1LOErl0XkxQ1qOIfLZeCWljXDxTXBMfkXjCJucKX+GGMMbY18UqFxHFlimfpauIKcH0UPzjqjNDEyFzthm+uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhPQopWK; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4629051c946so168333f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783065623; x=1783670423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8F7QCm3oCmhZ0k8ChJtucjmxHtKA72tkWkJA20N+D8=;
        b=OhPQopWKSiTFyhwUpcf39j8U3d3st5FVF3wxlBTtwB84CxS2wszPYf8dstSSFX9nvi
         0lXJVbocdXVVbt9pjtpfsqMhNMER0npDjH9eiS9SnLJQTjZuFld689aG++Jm46j9hPdx
         40hcLN3oJP2G4Nr6rvqrw4fe2cCPSoH4OIGoN9GN694iUqfCGf1eEj4fvp9Til8Ie4zo
         r9TODeO3SYGYuLtIBt6V5YHrXxSoUvA1/IY3P6oEdu+ep41AxCONj48LzbUtTaqP3+jZ
         Z6DWp+dcKl1XsTnCOGWlf3cy/bvoDCVnivzZjEgAtTEUa4UEbany/k0bKpxRHsva0lUW
         sEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065623; x=1783670423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E8F7QCm3oCmhZ0k8ChJtucjmxHtKA72tkWkJA20N+D8=;
        b=jjVagru2SxuoUHa0uMMuR9ge7Ycr5GO7UPlKlSXn+MIxsqFEm3g+5HeR/cjX65AoQG
         IBwZlp3sCCdp0CtWMwCcnaOEGybwzhJvUnQHpHip4N+9NTAlE1A8+AELiPNTnqOF4GY6
         20hE+dhHB5a+vRskmZvxOnGrGhD0+9R6cxkjjj7/6CFPr5Uv3Tp0qTW5sAV2vpKFxJfW
         efzgZKcX/4V4ZOg71C4PHFNeac8/1dtr+w1LJFiR4pmvS8n0Y2ZbkGwaIpS6OYpnuW4I
         uBJplh/wOmNn89UXDTD3X1+qsdI1jpm8rHLsJp7ZiZVj55QdBnq1LR2jKYU3vw/3pSPr
         86mA==
X-Gm-Message-State: AOJu0YzDN3O0RqM7swn0BGFTzlIge/xbmIT5mCZYid6XkZ8AJ1DJtwS5
	vtje6azHhd1Lw8FeiRj0JyCpSEaBYG1/onU5wAcSR76YO4NMKckdFDaDMmtP9w==
X-Gm-Gg: AfdE7cmdo5N8KNhwO7EyXoipXFMgysE5+ImZgQRzcV+KpbzEZaIUN6XmzrniG57dWbN
	w2dlVJBfRCQzes2eEbQ47cne2oPAnns2bVuH7ra0FVxK0GqPnZKVyLBCjT1FIm6pTTEp18I7cU7
	B9Zc5qToabV0/j4JY1hvCZ14hoKpkzktFybHPu9t9scOsb7sv7hZrpaUQZ6cbvHL2qviqy0DRgV
	xDYI5r36N0u+A/RKxmbQ1kwJNX6blhHrwHp781PyhGpZIWEfLvtckMTvowZk7CCh4W6iI48pOxG
	5NqLuUABVP4ca11a4QN37uFQ1p/NL1r5ga+JskPCB7kffazyk+p2j02kg+MZhVtMDXRQePrNny9
	9D6kCEf574AL9cLjQqbDQqIesu891+mEqlwlBKdu4G9HdUdaIBmxC94Ai2eVnCrFcoViv+G/rXg
	skToOkJztdIfVFns7SPQ==
X-Received: by 2002:adf:e88c:0:b0:475:f0c2:75b2 with SMTP id ffacd0b85a97d-47936c371cdmr3000082f8f.29.1783065623068;
        Fri, 03 Jul 2026 01:00:23 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:cb6f:2cd6:80ba:ca9:891c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477d766e0b4sm15116051f8f.0.2026.07.03.01.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:00:22 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 03 Jul 2026 10:59:39 +0300
Subject: [PATCH 2/3] firmware: qcom: tzmem: disable SHM bridge for SM7125
 platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-sm7125-samsung-v1-2-3e5f752048c1@gmail.com>
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
In-Reply-To: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>, Vitalii Skorkin <nikroksm@mail.ru>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116213-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:newbyte@postmarketos.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:xerikasxx@gmail.com,m:nikroksm@mail.ru,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,postmarketos.org,lists.sr.ht,gmail.com,mail.ru];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85C646FFE58

From: Vitalii Skorkin <nikroksm@mail.ru>

Currently SHM bridge causes RCU stalls when booting. Disable it for
SM7125 until a fix is available.

Signed-off-by: Vitalii Skorkin <nikroksm@mail.ru>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/firmware/qcom/qcom_tzmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 0635cbeacfc8..50f500834758 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -81,6 +81,7 @@ static const char *const qcom_tzmem_blacklist[] = {
 	"qcom,sc8180x",
 	"qcom,sdm670", /* failure in GPU firmware loading */
 	"qcom,sdm845", /* reset in rmtfs memory assignment */
+	"qcom,sm7125", /* hang in rmtfs memory assignment */
 	"qcom,sm7150", /* reset in rmtfs memory assignment */
 	"qcom,sm8150", /* reset in rmtfs memory assignment */
 	NULL

-- 
2.55.0


