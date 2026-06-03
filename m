Return-Path: <linux-arm-msm+bounces-110883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id auqpKf5/H2oGmgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 03:14:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 445626335AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 03:14:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=s0i+dSzS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110883-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110883-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A02F3019113
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 01:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E44C2B9A4;
	Wed,  3 Jun 2026 01:14:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA51305689
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 01:14:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780449275; cv=none; b=dn8ERpi+NQdlKk2t4Opm6nU65vlwsAXf/eRaBn1NzfvdOtnW8HJF2ujSFgjHhK1R8jV8nrkGmjqN3QTjajuEF27W1d403CV5CX01996fMm8CpXIC3R7MNd3KrKB/v/s92Dzq03x1brLdLeW2WtbY9s0e1mDnzV06du98RriJbCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780449275; c=relaxed/simple;
	bh=Kztzd7NXKG8IK8+em5/LCAi5C57avspABVpmOq1/LyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IX3MS9a16GbqREFeDdTsUtANFAIHUajMbnRN+1Zh8DrfzhmwKme6FYcuQCYzKkrzLhmWP8V+7Y0Yar+CK+OfWh2TLyJNnUIKLyIXt2NlTNpJO/BVNXDuxJgtEKpz6/vKGMzGfZ5XpNdSiyiUie51fXG18kQBNLBRZOohsATsx24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s0i+dSzS; arc=none smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36baeec21dcso3087152a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 18:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780449273; x=1781054073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kztzd7NXKG8IK8+em5/LCAi5C57avspABVpmOq1/LyY=;
        b=s0i+dSzSDa1JwwDQcCkdAbDpoOL6P/quyxPKDhvOmC3kVLxwZMrr/FdZUD27CECBFT
         nmE+++U/IoHj1nHClADgXHcJbAWasaFHTlbKjh5mNEuLpqeoO9Ht3v/NHlK0GKgvtnGK
         yjIVp6y8ths4KwRugMWHrG+SV8QXv8G+uh7v/ySi34p98CU8OAhjlgadwqqx9/psnbK4
         GTxRomgi89p5vaorNgjT5a7sNe8fhryVlE4npLqW6jy3PLWECEYWk/1VCUQA6T3AV72u
         vC9vSSNgJ72TM+MVPeGFDKJwBdkBxZ3vN7llGFizDZAwri6K+d1bZ0XchjHxQcOmjt9i
         Nw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780449273; x=1781054073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kztzd7NXKG8IK8+em5/LCAi5C57avspABVpmOq1/LyY=;
        b=IerpRdbl4eY1UcxIfiJ2W8s/ex9AtDsyaL6YO6oN3I1ZhAJRCK/MwJUHVPimf0uyRe
         lUu+qBPsKzunoVn0p+pZsUgDbwYj7CGhyYiNijN8bor9rZ95/PyPIuO7amVNxT6oGbh+
         f2/2glK09CGuqei9kW2/eB+THCgO+YjqoPw4Th95+inIs873gLDdrvp35k1s5Wim4ocZ
         GkaWmOKISLPzk6KKbk1UrpfeX8ToDl5bQQ0j8i38WBukIqeIl6AkC6O+x/zm4fZZpX3V
         DRyLVgID6nyrpeTH0ACv12Mr3AjG6tu6pq5EqUyrYX590DKDxUCrMG9YmM6iSVzvap3n
         g3eg==
X-Gm-Message-State: AOJu0YzWN/bquKblniEvNu1WlSDN+ELPuxXa8ZLh1zzhClq5R17T0SIx
	KEVb7P8fjIau/hodgxN25SJXimsjJwhe/9popW2+YZeRyabJ8eIGNeCw
X-Gm-Gg: Acq92OFLWLpMSt3nqbNJjASuQ2akcqM2oiIifyFgPEFZCitz5eE37ofQ0pb6GgewKiU
	oSisJyOgxBAIBYw8vbyBFgYW0QbD6Bs/0s+OfMqvNP8y7ilEEnjPV0PmMc0nxDssOstrShMvdiB
	wgezGIImq/iVOmP0IBpHmr44u3lywMOHpnM2FOZuZsuiC/u684KsjFyO5IgD147rn5c9W9M7dJk
	MpggszPhZyvHFvWnHGzXCKxJMZRKk5qaVtuvvvn4Z5lGe5RdQLIpNyJeMYdkTiiBy5ODhoQfQtZ
	M1SsNpIQZ/CTrhKI35vJ5lSZYIRoACDsMDdPcU7Gh/HDOOO1dTdUWjMvVB1KerLpYwB0GbUEDOo
	sbblKzXq+yiGv7sUq7I0+HUxwk3u2Vaj33RknbdRu0OWDHOP0/L9+48Zhj823GbLiS0TfQ62CYX
	CH99e2XM7/UuHkRSL/r0I9LzxWvSzpNG7lFLAD+nrZhyg9c8uBzM14hGjv0VKUWnRa
X-Received: by 2002:a17:90b:5744:b0:36d:cc9b:2f67 with SMTP id 98e67ed59e1d1-36e32a42cc6mr1074968a91.19.1780449273236;
        Tue, 02 Jun 2026 18:14:33 -0700 (PDT)
Received: from BNE-CLN-QCAO.digi.com ([159.196.14.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd90548dfsm4866590a91.0.2026.06.02.18.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 18:14:32 -0700 (PDT)
From: Qingtao Cao <qingtao.cao.au@gmail.com>
To: mani@kernel.org,
	kees@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek Pernamitta <quic_vpernami@quicinc.com>,
	Qingtao Cao <qcao@digi.com>
Subject: Fix long latency in MHI PM sys error transition
Date: Wed,  3 Jun 2026 11:06:10 +1000
Message-ID: <20260603011333.3306102-1-qingtao.cao.au@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-110883-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:kees@kernel.org,m:linux-arm-msm@vger.kernel.org,m:mhi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:quic_vpernami@quicinc.com,m:qcao@digi.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[qingtaocaoau@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingtaocaoau@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 445626335AC


Hi community,

I have been using and testing an older kernel than the latest and found that
once the fix to mhi_pm_disable_transition() is brought forward to
mhi_pm_sys_error_transition() to poll if the hardware may have cleared the
RESET bit in its MHI control register, the handling of AT!RESET command on
my EM9291 cellular modem won't have to wait 24 seconds (but 11 seconds or so)
to finish.

Please kindly review this change, thanks!

Regards,
Qingtao

