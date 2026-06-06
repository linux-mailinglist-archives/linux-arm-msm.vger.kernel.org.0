Return-Path: <linux-arm-msm+bounces-111467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fIdeIhHnI2pn0AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 11:23:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD5964CFF1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 11:23:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Xwu79pNv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111467-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111467-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F77630214C0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 09:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28DA282F0E;
	Sat,  6 Jun 2026 09:23:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06764071F8
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 09:23:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780737806; cv=none; b=HexyLwN1siPKefSdTmG83cey5uTR6KRKibvPUpn36go8TIUyczuECKUinOkmmb5ztHeNa1a6q8+2wUE+K8NMnkJ+a65O/E9OLkmAksPGINZ94THV5hsgUhlLryjfTIZjfxHhJn6uvmJ7iF5apyCmj84f+0qEqp6Ct3hxIYlp77I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780737806; c=relaxed/simple;
	bh=mDkPGwiVHQoklipRC1lQByxUrrOmsEjd/nyIvxoNglU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=uT5Jb5TkFFMp8lD8eOp3ybQVt5EHYKNIvWqXTAk4yJq42HX+vX5hOZjkLa6DxAeeWqc4ez0/HlvN1HSuj9BgrLWXSFWYGlZBZACDwW3aK/oxZOwiY+hkPP/E+p+HL0hNq08c2MpnjPgwsb6ww3+G5XTz6NYZ54tLE4e1wKFJ47Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xwu79pNv; arc=none smtp.client-ip=209.85.210.180
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-842cd900ee0so103781b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 02:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780737805; x=1781342605; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i90N6kve85T3Z6vhC3b/4AAHhPovipRsLvYZQX6Fo9M=;
        b=Xwu79pNvNAJyAcpUIp+V5v7QdyVZQJzxE6qCUCNzeSpks1kkEBD50Crxr/4ETF2sCs
         zB8O9HgMf6s5oMqBzAtFd110xvib8O9wyJU3FqfMqaDHOywAxaXTVsrmPjMxufNTgwDb
         EHHcSesYcM8l46MYcrLwwIniZ/C8d+cl21sDgg954Nv2iDpKAXqi7ZFYFAUIXP53LHBF
         PYiFOOGnI8iAdNQTeoICT6bSJkdY37/EwF+QJTI+a1hmdjURCDwqobIARgQo0NPhiR7W
         HrppKk/ZZ2MzTTCVk9sG45j0rWxY4/C7vgzXrLa0l6bq5Jnwa2kFeyzaISOn1cL4JN34
         Zn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780737805; x=1781342605;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i90N6kve85T3Z6vhC3b/4AAHhPovipRsLvYZQX6Fo9M=;
        b=PjHXiqpXjUf2/QtinCq4nB77w8enjrEneE7x8Ezxs/R/vWwkoz3zLeuYy53OkEGn5V
         b98YWxQNxj0it09LExWhZtDC+R+WNp+WJgFajKPerWEUmHrgcfJPf7gxQMnoP+fezV+T
         yHg66PsapQkdxLk70rQyVg671WjcEWqAodfQBma7lgNXwh06U4ryionnM/2I8zDp8sKr
         yZoc3QY0mzBnA7vTiz8qrd3lSHT81ZLKHv3D2jxzSYPBgxYSjB2Wv7FQgJo12Lusy4/J
         brmi3hIGrzN6xX+uQnrIxyW7GxXHF1fQYDFs6ID12EK7NBVdIhtaZa9NuyILJl8hJ3uY
         1Bpw==
X-Forwarded-Encrypted: i=1; AFNElJ/iY+rkNnDYotE2bZx2pFFF44JM/f6riK5GNQlTCgy9ddV4kzVxfS6BmtDaU+21xscDgV7vO7SktekWQIs8@vger.kernel.org
X-Gm-Message-State: AOJu0YyMePmtYGe4o6gDxQ0rD+fVMQaQoMVep3KkF6klWyoqH4h9xxn7
	QbsPpmZm1ckTsdsAbd9mrQRGDAofLeDWWKulqr2RkWdOMNH7YGYfMo17
X-Gm-Gg: Acq92OEyH5dFShlELO1IpFpI9kAAL9HIuk+ZtLkAwCiQlNUYvqJwXgt11QYhHJ3Se9T
	1hSlDCxDbtWFEE3EIrvlOUFj1jmFAH20P9B7Kmjto/1c5S+j2QIl8v49Ha6z7/PLKr6XmZzpFAW
	ggt69w6diR/SYdZ8+2VVOfYSxzG/6Z+sTkDxs54cs9D5pUOUIRjE7hv1Ud6IELfosMqB7XZomVh
	GiGrror9N5zLlaYsGZF4pwMbUTuPJruf89/at8OAZu8c+kcs8596KXCoVWTln6oL22qCwPCvhol
	VO+eLNHLaXKCF67OJf+ML7HQ1NlXygV67ueN7azsWEN4I8OiTDdDr2L+NOsDn0MBUKbapvxndus
	55qkKBOyt+8vRYqAohO+plLQp+v4VesAq46GzXgHe23YkyW/+U6+XO/BklGSak5yVIiQquoB+il
	HMwUWZv3MobuGeSLu/BHnlCKWeWt8ov/EhFxc33wAx/843RdC456nSdA==
X-Received: by 2002:a05:6a00:1304:b0:842:3801:47f with SMTP id d2e1a72fcca58-842b0efa50dmr7854414b3a.17.1780737804994;
        Sat, 06 Jun 2026 02:23:24 -0700 (PDT)
Received: from [10.46.148.203] ([2001:19f0:8001:53c:5400:4ff:fe86:d241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428235006dsm12236720b3a.13.2026.06.06.02.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 02:23:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
 <178040480680.1778078.1165164069560552075.b4-review@b4>
 <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
Date: Sat, 06 Jun 2026 17:22:10 +0800
Message-Id: <178073773007.397244.9871455646149843167.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111467-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iscas.ac.cn:email,pastebin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBD5964CFF1

On 2026-06-02 21:21:27+08:00, Icenowy Zheng wrote:
> 在 2026-06-02二的 20:53 +0800，Pengyu Luo写道：
> 
> > On Tue, 02 Jun 2026 16:14:45 +0800, Icenowy Zheng
> > <zhengxingda@iscas.ac.cn> wrote:
> > 
> > I don't focus on the upstream for a while, was this problem still
> > here
> > recently? Could you attach the base commit, so I can reproduce it.
> 
> I tested on v7.0.10 (with some extra patches, but not related to
> sc8280xp).
> 
> It seems that raid456 module will lead to the hang because improper
> usage of GPI DMA, and without it loaded it seems to be working fine.
> 
> Could you check whether you have any problems with CONFIG_MD_RAID456=y
> set?
> 

The magnetic keyboard (USB HID) can't be connected somehow, others are
fine, such as the spi touchscreen (not upstream yet), which utilizes
DMA definitely. My config is here https://pastebin.com/SdjuyJYk

Which device are you testing? Please attach more information if
possible.

> Thanks,
> Icenowy



