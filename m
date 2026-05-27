Return-Path: <linux-arm-msm+bounces-110006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGTrC/wGF2qn1gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 17:00:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 935DB5E6697
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 17:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 538A130166E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 14:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C766428487;
	Wed, 27 May 2026 14:51:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw1023.conoha.ne.jp (mailgw1023.conoha.ne.jp [160.251.133.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDFF426EA2
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.251.133.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893461; cv=none; b=hIr+1C0GG5CKJyEeii6pa64Faz6n227IywnahTgz1g9mcwnKAj/fBhBbdNQ92hM5EdUSq7IvWoEPrKtppE8mzk4hPXqM5fFNHb7saGh9Gq1MJmQgtbos3Y78b83UfQGvhHbAhn6yRwFG8h5St2+IXIdSjduP8mWtCu7BGkY75Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893461; c=relaxed/simple;
	bh=21XrfsMsgDnOkp0eli2/eNuE2ztTcATCHxrVaCj4F3Y=;
	h=To:Subject:Date:From:Message-ID:MIME-Version:Content-Type; b=WHtH9sz8GSvBDT1YzHJ1K0dpTHQ5G8jdasmZbjro/v2db7HypociA7gu/XNkkm1gUA7PtPLeh1+TPYHfhwmVEHub1fy7CBkQT/l2MvYwO6cJ0933WPyt8jBf+FD/LBLFIspPArPTjmn0zKT/Gc/GBRoWNQ0ZIj6WWeswnKikVBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoursmilecompany.club; spf=pass smtp.mailfrom=www1185.conoha.ne.jp; arc=none smtp.client-ip=160.251.133.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoursmilecompany.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=www1185.conoha.ne.jp
Received: from www1185.conoha.ne.jp (unknown [172.22.45.88])
	by mailgw1023.conoha.ne.jp (Postfix) with ESMTP id D4B7B180CCAB7
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 20:13:57 +0900 (JST)
Received: by www1185.conoha.ne.jp (Postfix, from userid 10146)
	id D3EA030497EF2; Wed, 27 May 2026 20:13:57 +0900 (JST)
To: linux-arm-msm@vger.kernel.org
Subject: =?UTF-8?B?44GK5ZWP44GE5ZCI44KP44Gb44GC44KK44GM44Go44GG44GU44GW44GE44G+?=  =?UTF-8?B?44GZ44CC?=
Date: Wed, 27 May 2026 11:13:57 +0000
From: YourSmileCompany <wordpress@yoursmilecompany.club>
Reply-To: masato.jp@i.softbank.jp
Message-ID: <VRRydpH7tEAReklXV8kzfnzTdoKaqcHfTLeMVi1Ak@yoursmilecompany.club>
X-Mailer: PHPMailer 7.0.2 (https://github.com/PHPMailer/PHPMailer)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_PHPMAILER_SIG(0.00)[];
	TAGGED_FROM(0.00)[bounces-110006-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[yoursmilecompany.club];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	REDIRECTOR_URL(0.00)[tinyurl.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wordpress@yoursmilecompany.club,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	HAS_REPLYTO(0.00)[masato.jp@i.softbank.jp]
X-Rspamd-Queue-Id: 935DB5E6697
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

メッセージ本文:
Photos for my escort application are uploaded.   
Let me know if the quality is good.   
Preview: https://tinyurl.com/5b5d5c29#B7e2V6

-- 
このメールは YourSmileCompany (https://yoursmilecompany.club) のお問い合わせフォームから送信されました

このメールは配信専用です。このメールに送信できませんのでご注意ください。

