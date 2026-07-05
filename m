Return-Path: <linux-arm-msm+bounces-116542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xJLMNDMzSmpU/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 12:34:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFC2709C2C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 12:34:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AipTD7R3;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116542-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116542-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6210C3012C42
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 10:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692E029D265;
	Sun,  5 Jul 2026 10:33:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FDC3242D4
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 10:33:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783247624; cv=none; b=dC2Zzu03K81rjTiWkM0ZWODx1V8bILAyvdYvnsNrZlcDiEvNSIjvO8ARMkDseoobFl3IzWv8kGx+X72IylWFrIhOdPy11bZUK8s3H5v6epquavMVFDN3fPgPTIaCNDFwp5JNxYoRoI50RhDxvnYjYhLRAuQxTqYjvz55PZ8nTFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783247624; c=relaxed/simple;
	bh=lAPIbiJiqMqb5Up3h1/qudmb3tYdHGyZZmsTohHUWX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dgP9vGUd/3RcqtKQ3KIAqlqV9srhPbbDB03vTCrwFUL/uFFyrZaBfVjQPYU6SeL3ul/IUWEM19xrt6Nr5/2TowFC1X6vGxeic30JGOlX1aemoTu6sHYU6TUos4RMcxGbkutwd9nnh/AmxYbj7wF5PXbXWwCQF90u8fnoqCTql6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AipTD7R3; arc=none smtp.client-ip=209.85.128.170
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-80bab6cf5ebso39937457b3.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 03:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783247622; x=1783852422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knFj3lxdZDwXb0bBbKTG0atYKQi/dQjB9JSBw4jJN1Q=;
        b=AipTD7R3QgYhg0bnCRmy9wBmtkOD4eIIBwqDeYeqvCUFnSpD1PzET/t9RU+ZMWgVs7
         +yqExB+qRO8iLdrvXaw3THKdXQJcQ9JWH3Vc8uS11xav/8jZmvl83YrxVSDzPLWSYa04
         S2xW4D3UKVgen2J5Hgrt8/oZj7OP0uGcJEi1B14jLj0b9T0QabDiRMHWuChFrHkgfZgK
         WBeudsZ46NIs6k84h+iBvB9XS2zAd/SH1XDX6YrORX/RAMUdLMTxBxZ3cctx00sCswcf
         ltXoyyPU63xolyGAzPPJHiCu7gWYfiQl2cxStzzNMICSQXLoqLY9wQjmMKQcqyn+Xd9i
         spvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783247622; x=1783852422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=knFj3lxdZDwXb0bBbKTG0atYKQi/dQjB9JSBw4jJN1Q=;
        b=IoRTWmkRe+13uzTdWTPiCCiiB/URjf1TTsEzmXuoklsvNQX8t7qJmH4ViVpfZsgkGS
         MfO16+j9fVgKJv46tmsh6AoTAZJKyAfzigVKL6S/cU3j2fg011SG2BFmcxG++PqTlcVa
         BaE3zsXdUe59zbRDJeD0EFutOesvw1gMt93/FXvZk3AtwbVERonOt6Utn+YpkkLkcHbM
         dAe1pN1HdxgWILn+tM7jm5WoFWL8FnpUqKh+rbubSZTzemq4fc0xlO/bLSX/CCu+SG/m
         MDsjEYdQT/QFvuojYb/LIftitpXWoy4/76Zd7vUX8QGCTzOAmuV6DDTTb92NGW5AWs+h
         NugQ==
X-Gm-Message-State: AOJu0Yx+8+619Tv5lHmhEoaRXfwh48KVT3vIvZADKKO6++mmPOzDr8B0
	FsHckEfDJZRHPmwd6VI2yImWhWWXW0d9nr85ceJxRlRACO7akP1KBUTq
X-Gm-Gg: AfdE7cn8WSK/XNsmi1TkubDQJLNmMePR+uidCDr8D9WLJRKz7iYDd5em/MLlfV7H/vB
	LHiMl38ka3UNC+JLso8TjkaFlBjAnAS6HNfzmfKhg5nMc0jF4pvQ4qHmFFol0PFWNZketNg5Moc
	wFIriCHA9IPaFVD99c2JZqevfPDTcpv3OLSYXNZVBC1LyiKJCaxh4n/FZePR37WnS9n4N1QjOIb
	Bt19smMuCe/inAcKJze6dqMHNtwpGHvPjsOpnXRJebBmoqfuiI1/5kCVEuPDR1DFAtKQf9LIHKL
	EIZ4u1lTlqgKCXsXCyNO0DpqhnHpC5gQjyKb7+jw10nPLYZMq9Z49nB/QRUBi25jz+DqDA9bA6e
	fs96/CKtXQMpH2oG1KPAd70g+sQ0qCvdAKRXvVl3WllRx83XkLcB4Pix0eS2SJid7H5CfSvaajB
	wHnliPshIaIcMZ6D9h91KLUxbis/iw
X-Received: by 2002:a05:690c:998e:b0:80e:dc2:873b with SMTP id 00721157ae682-817424a4286mr66993537b3.16.1783247622061;
        Sun, 05 Jul 2026 03:33:42 -0700 (PDT)
Received: from crusty-box.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144ba2665dsm44421007b3.41.2026.07.05.03.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 03:33:41 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 05 Jul 2026 13:30:28 +0300
Subject: [PATCH v2 2/3] firmware: qcom: tzmem: disable SHM bridge for
 SM7125 platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-sm7125-samsung-v2-2-d3b17005ecb3@gmail.com>
References: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
In-Reply-To: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Vitalii Skorkin <nikroksm@mail.ru>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116542-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:newbyte@postmarketos.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:xerikasxx@gmail.com,m:nikroksm@mail.ru,m:dmitry.baryshkov@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,postmarketos.org,lists.sr.ht,ixit.cz,gmail.com,mail.ru,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7BFC2709C2C

From: Vitalii Skorkin <nikroksm@mail.ru>

Currently SHM bridge causes RCU stalls when booting. Disable it for
SM7125 until a fix is available.

Signed-off-by: Vitalii Skorkin <nikroksm@mail.ru>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/firmware/qcom/qcom_tzmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 0635cbeacfc8..50f500834758 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -81,6 +81,7 @@ static const char *const qcom_tzmem_blacklist[] = {
 	"qcom,sc8180x",
 	"qcom,sdm670", /* failure in GPU firmware loading */
 	"qcom,sdm845", /* reset in rmtfs memory assignment */
+	"qcom,sm7125", /* hang in rmtfs memory assignment */
 	"qcom,sm7150", /* reset in rmtfs memory assignment */
 	"qcom,sm8150", /* reset in rmtfs memory assignment */
 	NULL

-- 
2.55.0


