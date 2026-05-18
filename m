Return-Path: <linux-arm-msm+bounces-108151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BbTDgvoCmoE9QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:20:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ECA56A933
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 273A2300A38E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61683446C5;
	Mon, 18 May 2026 10:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FK9+hbNc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563B0343D80
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099558; cv=none; b=K/yib6RvNWpeVEsqKjtryML6+zQNw9QKLnc8+21ssNkkro3mEamhrfox4ggbp5fwxO+EZdExVai/JBUdEcCe5/we6w+nFFWIQRKBrNp3kEshsqrgloEvpdHJURPkaQ1Grz99wr0d57utXBND41GRpey9/tHRov3qcZt7hdLeVik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099558; c=relaxed/simple;
	bh=HaUjxQQA89+gMWh1UZFOnARhBYJk6y6QAzCEWUsr5tE=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=DqRJMcWGWDhmiNa08FWSxRZfS8Yqjd59H4m9Lrc293aZxzQDni/S8hzwsTq5O8l2LwL6PJRgRCHaSoVI83VaEHbjcUtN25VxUVP80M97sIJ9+d8e1zkGaOcyNfZ4VHnrQE7o0jrHDAC3GYGC/BNjrNYoddFvUjPMs302qK9FKsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FK9+hbNc; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6802f9c5debso5141199a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 03:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779099553; x=1779704353; darn=vger.kernel.org;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HaUjxQQA89+gMWh1UZFOnARhBYJk6y6QAzCEWUsr5tE=;
        b=FK9+hbNc/dJvHyI1hKOPA/T2D4UIl5VXrYMGZ7YFBVx0qfpyAAPNSr4Slmzb02gdoC
         0alrXCzDA6kv0ZIiGl9kaBAAl1l6GeAVpX36w7r86rZzeyOG0qYiMRS/gIP/X/VjFPxg
         aXQJfR+2uyJFK5ClPLmAMx3s1upWqqV5z71s//YHgaThXzRnj/0UhnzdIgGQit11Aw7t
         5f0xESpD8fW329dL5wB6CSsRaU6EYkDy2dPSx1ruPUei1DbVCZXNDtlOj9tE1BmG/PE1
         Xwum6K0Nn7mSrouvQdMqHg/RKFBNc6neAYNSvl1wu80zy+6NMV855YjodgmTJAvuu46n
         d/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099553; x=1779704353;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HaUjxQQA89+gMWh1UZFOnARhBYJk6y6QAzCEWUsr5tE=;
        b=NJEPCDZWSqW5mgxhihaFwqopw2KxVG91ovlE5NBd0aVUpR5dlLo+Ygj9o1UtDjiulb
         1KHqsJqETlGTAZAFgsEGDJJSzxmL8UNp4xgOCS2rdQzLsZ9/48KhEZQ7B68oT+rMwxwx
         r65Xk4YY7m1J6RyjBEDQmIMzBFyQ7RIOv9OrJu7w/yrbDKMx300K8ANrWktCHjMHk8dn
         /CjztpoJXE/6Y5xzKIehUG7Na9fFKnXYAkZCOmW3wF+sAt8sDQpdPvVL1eLD0VWhqybi
         mrhqZ94TVQ7wQQrQ29qZsTLZHA93F43uhClF0+9eTlq5GUnPj0hph73y/vO0O2yZ9r9m
         cM6Q==
X-Gm-Message-State: AOJu0YwgtY7DWrpfj81HydNo6GDcPWAnQ5L12nkCB8awWucigh84i+nT
	wlQ/OptWI7qXc4gucMCXPYsNs02ZMZoa4k+SrHOEZJZCQ1X9pRcJH6teENEwpQ==
X-Gm-Gg: Acq92OFiy+zFguQdogvEEVsjy586r5UwLeZ6r0UkemSEQhUZWBIz3/OAWzoq1Eo2Tiu
	7jX+1hJg9PFGb5aQCVI8zjcKJ+spet5gAGtdezUDILGGaWljI/ouYsJ3tdk7vudbCnEF/9BXQ/I
	xrk75qn4KmpDDyZr+ITZEvvcoA7zEO/PlDZOwVfqWH7o0CJptmWA0G6uWjuO653AODn2rK3b4y8
	T+jmyESasgZUi08SsTUnghLY1STfx41rTxS9GO1XT/7KIvFZByjk8Wm/Yo/UPxc0SnkNnXS3f9X
	uc3DoDiVUvkja1WT8YgdzXV+mykxt+N969A13HINwnrbIvNLCbDOuzZFKLRu9OPdl3PKsvnA/5r
	H+xmq4HLVLsIFy9GXF7lK2m7XwRE/FkNReaKlQN9sK/9yYwxBqLFY60MkV7dIfsDMz+b2CvHpm6
	3UZ+/hhux49a/Ong+ZKY9qss1wbj/54gS/GgL36MSa6GbcgRSmyjAd4IKFl+VA4RpLfsVm29CJy
	7js6jvrDA==
X-Received: by 2002:a17:907:a08a:b0:bd2:27a5:7618 with SMTP id a640c23a62f3a-bd517960702mr671992966b.30.1779099552552;
        Mon, 18 May 2026 03:19:12 -0700 (PDT)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4ed37ecsm548406666b.63.2026.05.18.03.19.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 May 2026 03:19:12 -0700 (PDT)
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: qcs6490: since 7.0-rc5 hanging udev tasks on dragon q6a
Message-Id: <0650CE9B-FED7-4C18-AD85-8652CEEC4AFE@gmail.com>
Date: Mon, 18 May 2026 12:19:01 +0200
To: linux-arm-msm@vger.kernel.org
X-Mailer: Apple Mail (2.3864.500.181)
X-Rspamd-Queue-Id: 95ECA56A933
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108151-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[piotroniszczuk@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	APPLE_MAILER_COMMON(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi,

Since 7.0-rc5 I started to receive some issue reports from my users =
about stalled udev tasks reported by kernel like this: =
https://termbin.com/l7el=20

This is on qcs6490 Radxa dragon q6a.=20
Kernel is mainline 7.0.8 + =
https://patchwork.kernel.org/project/linux-arm-msm/cover/20260407-dragon-q=
6a-feat-fixes-v1-0-14aca49dde3d@radxa.com/
and =
https://patchwork.kernel.org/project/linux-arm-msm/patch/20260407-gcc-gpcl=
k-sc7280-v1-1-2445c2f7a539@radxa.com/

Bisecting shows first bad commit is: 14cf406e08=20
Reverting just drivers/base portion of 14cf406e08 fixes issue.

Is this known issue?



