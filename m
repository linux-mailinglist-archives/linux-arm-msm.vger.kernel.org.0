Return-Path: <linux-arm-msm+bounces-104194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLJuNcyp6WkxgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 07:10:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FE844D295
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 07:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 867203041485
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 05:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF3F21E098;
	Thu, 23 Apr 2026 05:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="rUyxOvPn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357AE379ED2
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776920963; cv=none; b=L86h15g9dMqXq6a9uVk9f99QWNkDqoqWZH2MCvMxJ+NcOqSZ1rf8Cbg9RkNRXV5D4A8W4Q3Dtz+KawenRcpM+Z5gAcdfxD8cWwlDel5TtAcojAqkzRAga5Lp1KUbvUFxSmo+aKZsPK0Rpzq9L5ej1372z/bsjmf7wcQsn/YBJSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776920963; c=relaxed/simple;
	bh=2CcxHXcl40KXWqdQm3i0SJmM3IAwdd3p6yoEKXcE1zE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KYUwFFzUkHtSdg7isbhYw9Yiy7i7n8VS2Lzf3sWzOgyKXwKl0J087KqvB4pAR/dN1qj81sz5R04xVljQ2ueC9lldkmb/EGfBfguAl/z5A14F/yna1W1QYA2yR40Psjwye875dxbX91kz6xCp7FlfYoJ4upTNdytxVBipLKWVCaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=rUyxOvPn; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1776920950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0B16G3jwiYGXujlGvcDyOiqCiwiXORKPt9MxgmAF0wc=;
	b=rUyxOvPnZGwd0miXv0DPVitxlUPvMyulO9JopDGo9TatUkZG3VBlJV45VfDWiFzcOg9mI7
	y+IZ5hINQLKMEowedig4PedHQE9OLX1aXQJ1OexIODGTZb5iy77QbOB2jWAragyOYj8Ome
	jYYY/0y7JLRrb4XXjksD7AbZUpgySnCt127iXiqY6b0L+R9E52agjpn7z98AVxxq56cis8
	wMwafM+q1vDX7TqV2/gKTtAFqtDcTocdx8gEXHoI/TjTABikpTAoGS81DK5vDaceS3ToKZ
	6iGw7y3iMsOb/RhRNtdxQJpd4ljyJsrSEqJnndBMQPe2+uuUJuKw7xrXZ8SQBg==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Antoine Bernard <zalnir@proton.me>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] ASoC: qcom: fixes and improvements
Date: Thu, 23 Apr 2026 01:41:00 -0300
Message-ID: <20260423050801.210840-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104194-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[packett.cool:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:dkim,packett.cool:mid]
X-Rspamd-Queue-Id: 32FE844D295
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These patches are mostly the result of testing/debugging the aw88261
series[1] with other users in the postmarketOS audio chatroom.

Specifically the first one, related to the issue from [2] I was nerdsniped
into debugging due to totally unrelated changes to aw88261 seemingly "causing"
this (much earlier in the boot process) APR error to appear or disappear.

Senary MI2S is necessary for the motorola-dubai smartphone[3] where it has
been fully tested by me for a long time now.

TDM is necessary for e.g. the xiaomi-pipa tablet, this will need retesting
though as so far it's only been used there with hacks that use S24_LE format
(while calling it S32_LE) such as [4] due to the aw88261 driver not being
correct (which will be fixed by [1]).

Then there's a couple general consistency/correctness changes for sm8250.

Thanks,
~val

[1]: https://lore.kernel.org/all/20260420213250.215465-2-val@packett.cool/
[2]: https://lore.kernel.org/all/5976946.DvuYhMxLoT@antlia/
[3]: https://lore.kernel.org/all/20260403054417.167917-2-val@packett.cool/
[4]: https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/8be067d8d5507a4ff7274fa2a61e59600aa7a308/device/testing/linux-xiaomi-pipa/0008-ASoC-qcom-sm8250-Add-tdm-support.patch

Val Packett (6):
  ASoC: qcom: qdsp6: q6afe: fix clk vote response type mismatch
  ASoC: qcom: qdsp6: q6routing: add Senary MI2S ports
  ASoC: qcom: sm8250: add Senary MI2S RX support
  ASoC: qcom: sm8250: add TDM RX support
  ASoC: qcom: sm8250: shut down MI2S/TDM AFE port clocks
  ASoC: qcom: sm8250: apply codec_fmt to all codec DAIs

 sound/soc/qcom/qdsp6/q6afe.c     |  10 +-
 sound/soc/qcom/qdsp6/q6routing.c |  11 ++
 sound/soc/qcom/sm8250.c          | 258 ++++++++++++++++++++++++++++---
 3 files changed, 259 insertions(+), 20 deletions(-)

-- 
2.53.0


