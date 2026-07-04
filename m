Return-Path: <linux-arm-msm+bounces-116494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D+RtIzIWSWocyQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 16:18:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 636EF707BF0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 16:18:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=mayanjamhf.org header.s=default header.b="RGU+vL/9";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=mayanjamhf.org (policy=reject);
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116494-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116494-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 074B830037F6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 14:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D92623E325;
	Sat,  4 Jul 2026 14:18:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from server.hostingdoves.com (server.hostingdoves.com [50.6.111.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF7F1E32A2
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 14:18:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783174703; cv=none; b=prIjs1MEa8J9gxR8zNFsZVHhuPqb+bASgx37/S/lVQMb4NZ8O0Cdu/b3CDRnOYd2RSqBi9I5GqURw5jIj+kO+7I6B5PR/1/neTIMWT1amB7w44o6A6fJ3uH84rlev7yizfxTERmDcGgTrS3t5ri2naggnLQ/RKs6cnoj/AIVuOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783174703; c=relaxed/simple;
	bh=bVfCMM+NYNJPYz8sdZdFbDYeoefrzRDy0O5uWat+g1o=;
	h=Date:From:Message-Id:Subject:To:Mime-Version:Content-Type; b=TFmPSWPUwhWw8DUpIpt62F/Ydhk8jWfaSHQoWCiQJ2JJn4GP6/w2CsYCmzqZqU7Vh+qUJZC3esU8gqsDjre1A+xYEbjFLvkX+FKTgxh5lMyxiBl5hWFXSa957eWNNa1EfFBy/7qho2o1W9aB9GOAedHI7fCjL9Yj5KBwB3R+eRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mayanjamhf.org; spf=pass smtp.mailfrom=mayanjamhf.org; dkim=pass (2048-bit key) header.d=mayanjamhf.org header.i=@mayanjamhf.org header.b=RGU+vL/9; arc=none smtp.client-ip=50.6.111.18
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mayanjamhf.org; s=default; h=Content-Transfer-Encoding:Content-Type:
	Mime-Version:To:Subject:Message-Id:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bVfCMM+NYNJPYz8sdZdFbDYeoefrzRDy0O5uWat+g1o=; b=RGU+vL/9rwcyKcLKqffDMlmHv1
	HnPZrYbk4qbGE2pKcKM0KttfCUrQ8uXmlqxCQK/9Ocdf4aYXdAWzBEheL+tnYJmrWQk6RNLmaJPRV
	ucb7O6AVGNi0OGjqEkV4hBgA/pdhv/YKkPMKeHB0Aro5r/CfKL0DsVSN0RYuW1oGR76P5G7vec4HK
	SY4D6rFzk++X816l6XAwzyhaE8GAcH7TcRCPLDBlP6RzqI9rELMmbZmaeq/rwSfHvfkkYLdSQ48V/
	UJskOvb3F8vXMW3USQhs4rZn8YMWrLh40u6xmgb36BD6jTD+cMaO+bARbcJJAn/iwqL4FE1TV7vwg
	0zw3nlsA==;
Received: from mayanjamhf by server-636484.hostingdoves.com with local (Exim 4.99.1)
	(envelope-from <info@mayanjamhf.org>)
	id 1wg0sq-0000000AqwH-0tMv
	for linux-arm-msm@vger.kernel.org;
	Sat, 04 Jul 2026 16:58:16 +0300
Date: Sat, 04 Jul 2026 13:58:16 GMT
From: Mayanjamhf <info@mayanjamhf.org>
Message-Id: <1783173496.0uM133YdFfxHyZPR@server-636484.hostingdoves.com>
Precedence: auto_reply
Subject: Thank You for Reaching Out to Mayanja Memorial hospital Foundation
To: linux-arm-msm@vger.kernel.org
X-Autorespond: New Message (sent by contact form at Mayanja Memorial Hospital Foundation)
X-Loop: linux-arm-msm@vger.kernel.org
X-Precedence: auto_reply
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server-636484.hostingdoves.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [1015 976] / [47 12]
X-AntiAbuse: Sender Address Domain - mayanjamhf.org
X-Get-Message-Sender-Via: server-636484.hostingdoves.com: authenticated_id: mayanjamhf/from_h
X-Authenticated-Sender: server-636484.hostingdoves.com: info@mayanjamhf.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.05 / 15.00];
	DMARC_POLICY_REJECT(2.00)[mayanjamhf.org : SPF not aligned (relaxed),reject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[mayanjamhf.org:s=default];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.14)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116494-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[info@mayanjamhf.org,linux-arm-msm@vger.kernel.org];
	HAS_X_GMSV(0.00)[mayanjamhf/from_h];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	HAS_X_AS(0.00)[info@mayanjamhf.org];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_X_SOURCE(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_X_ANTIABUSE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[info@mayanjamhf.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mayanjamhf.org:-];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,server-636484.hostingdoves.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 636EF707BF0

Thank you for contacting Mayanja Memorial hospital Foundation. =0D
We=E2=80=99ve received your message and will get back to you within 2 days=
=0D

