Return-Path: <linux-arm-msm+bounces-106195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCLsGvOn+2mYewMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 22:43:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB8F4E0469
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 22:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DAD130166C5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 20:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E832C3AF667;
	Wed,  6 May 2026 20:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="kSo4oId3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB833AEF55
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 20:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778100197; cv=none; b=FdDkVJPaUjItsmayNtnKAsgLGSnF0SWoFxUceDKCV9pzZ6vuYct7x1ZhGtLk6hwVfaVbED0DXfgTr5QS0HTxToUXfoa4G0AfmE7S2qwatsnDfG3OGbwIrh4RDu8m2fJ8akchNsY4Cjir+B0TKGdEMSQL0KzZNRlVyJgdSke+IQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778100197; c=relaxed/simple;
	bh=UlI/Ldgr/z4TqX27Utiu2mS9vQZsNEx8JYq+LJHcV/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cs+yO1H7GOf3CuK9POvGcZxyLgix6Egpwvldr8XjQegFC56Zzj+iVXq504KktjLPRUvYXqIjf7XCd6gf2+tEE4TyvODurpRymXXCjT1ZfRZk+jeb2KuLsyx6e7nYZMoIa5vfmQnRcmfgotsKp1eJXHfLN9dc17B0msCbsvJn+aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=kSo4oId3; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778100181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x0fnomzzNPNPMIMv6dXz/heBJgG5FkaT8lZlyapkhuE=;
	b=kSo4oId3xoPBLQ8rxiY8LSf+pC6BztTvQeNPPB8nrTLUZneLR2C4SEePVheiwg1LAXPFbl
	U7kQm+jh90o1XFwGSrbMr6nuN3eTp6kouFKQDz7/e6zqkBwtvRWeYbc1mzQfNAwK5vwkH5
	riJgtYFoKH705jgnHS6jQBU9xQPIlhLmeF6AgBObqSNbnqp7JejRO9ckjLsZCyBrwq5QBS
	upceUgFkwqOqdp2pjbEt50IDY36y12bZs/ghE4Jl4nnR8Z/+Ez56GFTu4Jb8To1CSPrJKG
	nWW9pswgNjzrreblDqqK20ozeCFOqN25Yz9448fjeaD1z1GRVIYv2tWTcplZ/Q==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Antoine Bernard <zalnir@proton.me>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] ASoC: qcom: fixes and improvements
Date: Wed,  6 May 2026 17:33:01 -0300
Message-ID: <20260506204142.659778-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: DAB8F4E0469
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-106195-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[packett.cool:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:dkim,packett.cool:mid]

v2:
- add stable, fixes, and pull R-b for the first (q6afe) patch
- add channel assignments to the sm8250 TDM patch
v1: https://lore.kernel.org/all/20260423050801.210840-2-val@packett.cool/

Val Packett (6):
  ASoC: qcom: qdsp6: q6afe: fix clk vote response type mismatch
  ASoC: qcom: qdsp6: q6routing: add Senary MI2S ports
  ASoC: qcom: sm8250: add Senary MI2S RX support
  ASoC: qcom: sm8250: add TDM RX support
  ASoC: qcom: sm8250: shut down MI2S/TDM AFE port clocks
  ASoC: qcom: sm8250: apply codec_fmt to all codec DAIs

 sound/soc/qcom/qdsp6/q6afe.c     |  10 +-
 sound/soc/qcom/qdsp6/q6routing.c |  11 ++
 sound/soc/qcom/sm8250.c          | 284 +++++++++++++++++++++++++++++--
 3 files changed, 285 insertions(+), 20 deletions(-)

-- 
2.53.0


