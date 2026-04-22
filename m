Return-Path: <linux-arm-msm+bounces-104158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COZuL+YA6Wl5SgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 19:09:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 491574492CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 19:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20C5E30086F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B93372675;
	Wed, 22 Apr 2026 17:02:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from haege.immo (real-impulse.de [85.215.196.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D502D238A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 17:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.215.196.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776877347; cv=none; b=iKFVYrmGLlQdR4vExbyNmZfxf1ROZwPVUp5DjtHUKT+YQsJtdYNgxBpwhYnwDVH6V4Czyu5kxIaimGXTrTik+Nn20dp/h+O7EQ30MqIMgeorfGGG1aHvF6bn2AY7eK74+ufzoTiAs4xp+okS0ECrBjfyhLY76f7lvmnro3nq7cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776877347; c=relaxed/simple;
	bh=kOK/9+5Dwi/nuyVAowUlOGlMqOWUFZ8V0+lJjFIFWkQ=;
	h=To:Subject:Date:Message-ID:MIME-Version:Content-Type:From; b=i17W4f4XgytB125/L0sqEMKX3SXXOZlAWvvkBaLsgINE10JpaAx9B2wMDx6ttgboL3EwrwUuRmX6LVCm5n/UYQCKdk6VORBLqgJ0UgDxXgyziEwURFIwJxI99zGdgsygy27VdN1BqziQAgEtYM64QsuF1D6U672keccTNZAZXJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=haege.immo; spf=fail smtp.mailfrom=haege.immo; arc=none smtp.client-ip=85.215.196.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=haege.immo
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=haege.immo
Received: by real-impulse.de (Postfix, from userid 10002)
	id 88B80194C1A8; Wed, 22 Apr 2026 16:54:15 +0000 (UTC)
To: linux-arm-msm@vger.kernel.org
Subject: Kopie von: Your account will be deleted in 24 hours
Date: Wed, 22 Apr 2026 16:54:15 +0000
Reply-To: Blavollown <linux-arm-msm@vger.kernel.org>
Message-ID: <be947e3b1df5c3b0ee70b521ac49e9d8@haege.immo>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177687685551.3777337.8949583758846790276@real-impulse.de>
From: =?utf-8?Q?H=C3=A4ge_Immobilien?= <server@haege.immo>
X-PPP-Vhost: haege.immo
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104158-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DMARC_NA(0.00)[haege.immo];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[linux-arm-msm@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[server@haege.immo,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[tinyurl.com];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 491574492CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dieses ist eine Kopie der folgenden Nachricht, die an Karl Roderich Häge via Häge Immobilien gesendet wurde:

Dies ist eine Mailanfrage via https://haege.immo/ von:
Blavollown <linux-arm-msm@vger.kernel.org>

Your account has been dormant for 364 days. To avoid removal and claim your funds, please sign in and initiate a payout within 24 hours. For assistance, visit   
Preview: https://tinyurl.com/2h2jvc2e#0jz3WY


