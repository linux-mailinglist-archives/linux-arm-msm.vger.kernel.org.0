Return-Path: <linux-arm-msm+bounces-110945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0cbeJJIXIGrFvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:01:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3280863746F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:01:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=G9POPP12;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110945-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110945-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C06F03030104
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6914946AECF;
	Wed,  3 Jun 2026 11:50:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BA339A061
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:50:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487411; cv=none; b=e/BL0lRdX/h/C0YNSIZJ7FL/ly4VDviloeNbXtEqaKNoCbt/jtKSUJ+2kZluI1fEmvAXYpRYcWO2kmLkJKXv1C4bey3F5uTnAH1Lc3IgAez/2W9JiZ2csFAojdFJDmrIe8kwEtzSKwB3cCNWincBt/exT+Iu6JV48NuNkxkUdxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487411; c=relaxed/simple;
	bh=8V62zHp0854T6kOPYi3qN2Z3/U8/1EVVhnVNlAFTfV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BEj0yXKc74L6lo/ZFBXTrlO/o2fva316byhKc1HvaebKQjUnHnnPM/bDdOr4jK4EMrOrvGLkU0LepNXjL59lg+K2yYWctp8ATCuvidCmRpJWcBoIoQ+SgPEPVpg17aik4H8M4UNLK3buZdVUfQ4gh2parVS9lM9DJ6sHF90QfmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9POPP12; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c132ac5ec2so14656045ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487409; x=1781092209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLpX7pXcoYewnIuzKIYAV54Q2yRbmRAcp638a4WMytU=;
        b=G9POPP12/zIze1OJwM5EBERPv+Ua/N/VHeBNJfTRncw4uahcn+b8hUvoen+HyhYtfM
         wJBAOW6NUpkPQQzAZ2xoV/lr7ubZPk7dGF142u7ZsFvyk9020IBJA6Fe1jlGlD3hATiA
         veG9PNU5c3dUZEX3cYPhZYRZjINGK6/zJRhmdh7nUNbkYYzGVEC6+lKZbkQDnTpLEaoy
         XrM7CMOsBm+tx//3rs1uLcRejS41k5Fjz46ztlnEnZmtu2c6wKtMh9E5PAzNMmLuc/Sq
         1CaifxTpfqp5/nA++zecYdQobdg/GjURIlqm8NoL2JYvBpdXoLTnTUvtE8ortPQXaxIp
         xYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487409; x=1781092209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLpX7pXcoYewnIuzKIYAV54Q2yRbmRAcp638a4WMytU=;
        b=Q3QVmFl8+T8SDvcJ2x6bGje3CsfswXP3tSVoml4XAe+DKsyYG8WM5CbpjWtmikW59W
         xaNK0CU4QLALhxLmBloVDRHtyC98aIN10ZMUvvBg7WinyquRd/zkMXynaOUuAOC+NuYZ
         Xwf6bzemDxwglbyE775ZjOfnOBkOKAISY+MdyQR+S/IEU+Fi9CeT0MibPoPpp4Bnyysf
         8IzbPw5pZu+vZz44cI5EWDu1KGZc7eXy+X3TCS/UMRjTlayXNUdo3h4gXJmYeUlSF08T
         E6d/LE2sXgkJb8mht1f3gurCU7+VFdk9VLEXap5aeYkzuz6X0XJ95ZJHZU26bW2InNwK
         8gEA==
X-Forwarded-Encrypted: i=1; AFNElJ/8Ct1iMz5pfA/a/6nzf8r0jqSNRdWzI9SnAfW1KLXrS/7P6/x8uh9gzDqCT+nbwb37tZNDTJvpRuV0zc3e@vger.kernel.org
X-Gm-Message-State: AOJu0YwyUd5bJ+aWZMZUN7O6Zz3dx4REPH+4hXDzIbotKwmQZxSbsiIj
	Jr+Bg/WB75Yxa56FiKRcz1H8aGMzYoTOoa55Z0H0loNRxQWYfySJQYhH
X-Gm-Gg: Acq92OGHxIbbOmStqCFcYxfc2crnoYAvTe8InM5ksIleNo45dSxfHeszyeXb4If8Q7r
	Kpzv4T9mbYKbu09S4tu+ZLDpudbLwsdNeNH0TKYRYP544wOyuUtTwHNATrmsU28NcacAR9cxW2m
	PXqBx8bc5XhIzOEo0dJKXNv3KUpAzpMTOZOOF+Utssk9Dxk18aFXOjmYSVyn51j752rFZP9XOvB
	uxWLMTbALOn4VY4UTrjrbJVRns0t4dwP2OaszFm4IpihY+iZqkRytC6USrwyPLu+oJ6LhrL5dUM
	vLwrpfomsK+dOzmRn8rWznmndoo49Z+kB3CTO8nSClQzCMKWonS2RadvJV+BXqDNMqSLxS+HI+h
	MpIU2ad9VIH6yjdnucf5cid6B0yIQEHmJwEi+o4vpG163TNqBPtKBK3CuUZ2o67MbIzT31CPnSD
	mHCh+M+GWL1xWpy0WVbMozx+FVReaqBVGP06v6cTgfRc3pFy2BI0aBBGnhnior3r5FYW7cmOn8w
	pwwjio=
X-Received: by 2002:a17:902:f60e:b0:2c0:ccdb:e01d with SMTP id d9443c01a7336-2c163a17aa8mr30913825ad.8.1780487409445;
        Wed, 03 Jun 2026 04:50:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:08 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/9] ASoC: qcom: Use guard() for mutex & spin locks
Date: Wed,  3 Jun 2026 18:49:40 +0700
Message-ID: <20260603114949.149595-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-110945-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[phucducbui@gmail.com:query timed out];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3280863746F

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts spinlock and mutex handling in the QCOM sound 
drivers to use guard() helpers.
The changes are code cleanup only and should have no functional impact.
Compile tested only.

Best regards,
Phuc

bui duc phuc (9):
  ASoC: qcom: audioreach: Use guard() for mutex locks
  ASoc: qcom: q6adm: Use guard() for mutex & spin locks
  ASoc: qcom: q6afe: Use guard() for mutex locks
  ASoC: qcom: q6apm: Use guard() for mutex locks
  ASoC: qcom: q6asm: Use guard() for mutex & spin locks
  ASoC: qdsp6: q6core: Use guard() for mutex locks
  ASoC: qdsp6: q6routing: Use guard() for mutex locks
  ASoC: qdsp6: q6usb: Use guard() for mutex locks
  ASoC: qcom: topology: Use guard() for mutex locks

 sound/soc/qcom/qdsp6/audioreach.c |   9 +-
 sound/soc/qcom/qdsp6/q6adm.c      |  52 ++++------
 sound/soc/qcom/qdsp6/q6afe.c      |   8 +-
 sound/soc/qcom/qdsp6/q6apm.c      | 107 +++++++++----------
 sound/soc/qcom/qdsp6/q6asm.c      | 164 +++++++++++++-----------------
 sound/soc/qcom/qdsp6/q6core.c     |   7 +-
 sound/soc/qcom/qdsp6/q6routing.c  |  10 +-
 sound/soc/qcom/qdsp6/q6usb.c      |  28 ++---
 sound/soc/qcom/qdsp6/topology.c   |  71 ++++++-------
 9 files changed, 190 insertions(+), 266 deletions(-)

-- 
2.43.0


