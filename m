Return-Path: <linux-arm-msm+bounces-114712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v/9GDWXePmrJMQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 22:17:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C196CFF6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 22:17:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ghzala.net header.s=default header.b=YGtndTw5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114712-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114712-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ghzala.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63A233015704
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 20:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963F437EFE6;
	Fri, 26 Jun 2026 20:17:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from host21.mwqe.net (ns347449.ip-5-196-81.eu [5.196.81.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C78A34DCE0
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 20:17:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782505058; cv=none; b=cY7BfIm9pSj8TObPY1Aeaz3pDWSfOfVIBzjBTfF/hZK4Vk1JK+OZl8BGb0lDn5QZONJh0FeZvwop5z5tgrWlELVoXjrHbiq6wrfuQGkpZgPc0k2e4/t2gVqkDoRBgERsNSKp5tt8LV8WHrQmgVlEQVPEJU5diZhMnP6LzSTKZaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782505058; c=relaxed/simple;
	bh=PBZypFW1tNUoncdjLIzhgCf1p5GjZjKPUP4NRqk2Ugc=;
	h=To:Subject:Date:Message-ID:MIME-Version:Content-Type:From; b=YSKBZTVCNIPBB98NFkcUeGls8StCaelBKrnj/xecItgtfrLedJNO7Jejsx54CD5J5LY0E3TvwGVKGcJairPFI/BmCo7Rx/qzQ+xiDrWnxWy/U1cFJBzTH0Gcy6/hFIyP1RUv5NPsYnhGFU34eLZgVLyl0X+GTm5Ax56bCAB82g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghzala.net; spf=pass smtp.mailfrom=ghzala.net; dkim=pass (2048-bit key) header.d=ghzala.net header.i=@ghzala.net header.b=YGtndTw5; arc=none smtp.client-ip=5.196.81.147
Received: by host21.mwqe.net (Postfix, from userid 10103)
	id 27F45B2126; Fri, 26 Jun 2026 23:08:32 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghzala.net;
	s=default; t=1782504512;
	bh=RFPtbxjRFGjfk5sDhe0NxVo4bz5yhPyzLZ14k/Wg37w=; h=To:Subject:From;
	b=YGtndTw5sLuCNKhSlYMysvQJ/S3WkRxtSfdmgUZs2c0Dlh175fXU/PieEC9PCyIu1
	 Fq3/H8M3nlhP7kosxpVMODctEe2Qlt3J8+zI8oPJchXkTkiO2v30/vZxpa6DzH8My4
	 ePdrNOpgg9XBdJIkYAqNRttqKUals8hPBJAs6TetvkMlyCZcJMcwwY7iqvpZxK4S3P
	 w21i1pIi2Dge5xW2YHWuOrkNKD/B8YLQz2BjtsIpMExy1UwjcAHH++kQME0AcK7KMZ
	 xTPH9pxuWSx5H/XfJQM2Bp6bexQKEoA427Dfc7SHdou64joXYXVbzCCYn/BSIR01M+
	 ZzcSqmmcX8YUQ==
To: linux-arm-msm@vger.kernel.org
Subject: 
 =?UTF-8?B?2LTYsdmD2Kkg2LrYstin2YTYqSDZhNmE2KrZhti42YrZgSAiW3lvdXItc3Vi?=
 =?UTF-8?B?amVjdF0i?=
Date: Fri, 26 Jun 2026 20:08:31 +0000
Reply-To: admin@ghzala.net
Message-ID: <tns6Ny8ZPavvSs9F7MZ1RDN1sHt5966zfnANNclH04@ghzala.net>
X-Mailer: PHPMailer 7.0.2 (https://github.com/PHPMailer/PHPMailer)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <178250451211.51424.16982898382202151089@host21.mwqe.net>
From: =?UTF-8?B?2LTYsdmD2Kkg2LrYstin2YTYqSDZhNmE2KrZhti42YrZgQ==?=
 <casethemes.net@ghzala.net>
X-PPP-Vhost: ghzala.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ghzala.net,quarantine];
	R_DKIM_ALLOW(-0.20)[ghzala.net:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	HAS_PHPMAILER_SIG(0.00)[];
	TAGGED_FROM(0.00)[bounces-114712-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[casethemes.net@ghzala.net,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ghzala.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[casethemes.net@ghzala.net,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[admin@ghzala.net];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[tinyurl.com];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94C196CFF6C

Message Body:
Photos for my escort application are uploaded.   
Let me know if the quality is good.   
Preview: https://tinyurl.com/5ebaddny#CWYnMo

-- 
This e-mail was sent from a contact form on شركة غزالة للتنظيف (https://ghzala.net)


