Return-Path: <linux-arm-msm+bounces-93285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHncKs6/lWlYUgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 14:34:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E22156B9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 14:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B109B300C5B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 13:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847D33271E4;
	Wed, 18 Feb 2026 13:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1rqW9D1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2490D30CDB0
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 13:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421547; cv=none; b=IkGYMVTb/qEPyWyMkJ+yNiTQhaXxUBAMnxMDBTbxCYd0BnpwyYMcuJ5sswv8WWB5xZpW6OiiVl3WEFtMbp881JZUPqM8Ys7unJqrFeetcVA9DA2SqbD4d62g7oUE6mcWaq25N7EvlYyon+eD2yuYkW4v3kLh3PqJ8RMNkxk7sU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421547; c=relaxed/simple;
	bh=OjsOVKKkecxrDuJK35sJC8GLlFfWYkzW0WWUdrjxNms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V77KIq6u6kRAkX+xdumGlrD1ItDu5LbB4Wtsq91sCnevTbOxYL3y7SxaIYr8A9C7ae+DQDFss3xqkjcPOj56H/xXqeXAgdsaIZjIq5111wf5ctMnszxRbELJd7eaNGFfK22hEaUvKRR3DTjca+ttplGN8vRJurhOp4pMlCmrdAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1rqW9D1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48068127f00so56776565e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 05:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771421544; x=1772026344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03+WHqXS0uXZVxR2wEZ9W9ki9OCzcDYn5L0WMe95atw=;
        b=Y1rqW9D1496cF5ypCs7cp/iINy4GKv063cXMo7vkTbIAxOKlOuM7kLztJEFpzxazGR
         Ik2YQ4panmveG4YoS/qy65PscJsNNtucDv++mwhaWYYHiJMFSE+oXtY/jCzuWn16SuWe
         UFH2Mk+71wMJFctN5W3/z82GrC9cTtw1f9D4mXDQnF38v4CqnWl6AVIAGgdZ0F7+xIR4
         yrpoWTwIJTnTlVpd+PHBQYoXslzql2slqk+KiRW3BpdEV2bEwsRFUwkwDD51mOdm33AZ
         ya9lDC5RBLYw5EWlTkgL+znGRvZvIsv7KPgy9DmZcwGHTF1OnMy8Yn/HOOhAG0Hb3YxS
         8/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771421544; x=1772026344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03+WHqXS0uXZVxR2wEZ9W9ki9OCzcDYn5L0WMe95atw=;
        b=tw8yz6zbYHbc1gkhMJr9nP6xvUdWiO4tsTm321ojH5gSSAPbYBKvqzNKTNfa81qHw5
         e/ROB5PP8ojHHWuPmjIhfDRjctzy5Yen9q9yiBnvQRwoJ1HMH95rfaODI8T6dizq4cFq
         KpKOiZRz8FOL/u9Dbcz/T2si5iZK0Mkf9PsHPBNpcaW6ufMroX0SiO+Rk1LQw3hpX0UK
         FUKoSZySCZhOVW3vjVLE98rRugStXjQ1GOGrlyVy0jaOCtS1KOC5SdLh8CiCySJyvRWE
         G7XDLI2ptPMzShCIuQWIO0Ga3Du+Ic/8U1sztIghD0ESawZMSbP8tnU7e+uNIvXriLxZ
         WFaA==
X-Forwarded-Encrypted: i=1; AJvYcCUXVyuGz/JETiNbD26+zGuU078qlC7zLwDgoErCzmtO5ZFZNYBwlqdzH4ErO0CIuyEu6X046WQ9jkJAtc/4@vger.kernel.org
X-Gm-Message-State: AOJu0YznBmzfPGbCF0hilH1XCBI4HQm5RjjH3irkx8TNJ4Ls9No1p1T6
	LNMRl+EMAqySK7XD6hw9rP9/nJ/h2e0TqKirYz7JGEc9JCYQTnmI2IkS
X-Gm-Gg: AZuq6aKdZTkNyijNO+dx1dS8PYb2zMuKseLy3weElV3+sjVG/nXWZEvInlvLgLqznvQ
	Mr5eR5gr0fHg1m/93/P8ouCTszo3L3TErvNmtwo6ZEugmXeIMwQlYVHTkjP70PtKnl+4nPYKAGN
	1d4ar38+Tc1HjwDpM/2BNxUiLwAClTNY1GsoqI0G3r4LwlP/8VGdTj0A9LobKOPXmB/AUtaj0el
	LW4QhIRBR1rPDNfI73Gl/tkeIVVEfTm3zKanls4cJjINbJ5rPv5bdFfJbgJi41JJ0kQci2LYIx2
	ydqpgtNVjVigLLxPpODhOwz5PTyoNdGzwTJgFhvsSE7PkIb/7K19H3nm6rb6Y2YlQkp7eGCyRq2
	uYg3jBEj3YgGRkwM7jwTgWTVhSVNgjAKiHmiYQowYS5EnxrZLmMW6MLAmgf/88o/gDFWGWj6N5K
	zvwvDzje+gqaou/5qO6iZwODJRLIfVGDLEL5bcIQgfH69ClBNE
X-Received: by 2002:a05:600c:c4a5:b0:480:699c:abe9 with SMTP id 5b1f17b1804b1-48398b879c4mr30727945e9.37.1771421544245;
        Wed, 18 Feb 2026 05:32:24 -0800 (PST)
Received: from fedora (89-139-55-36.bb.netvision.net.il. [89.139.55.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74918sm41939520f8f.17.2026.02.18.05.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 05:32:23 -0800 (PST)
From: Yedaya Katsman <yedaya.ka@gmail.com>
To: val@packett.cool
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lumag@kernel.org,
	marijn.suijten@somainline.org,
	phone-devel@vger.kernel.org,
	robh@kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Yedaya Katsman <yedaya.ka@gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm6125: Add missing MDSS core reset
Date: Wed, 18 Feb 2026 15:31:18 +0200
Message-ID: <20260218133117.1584696-2-yedaya.ka@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216233600.13098-8-val@packett.cool>
References: <20260216233600.13098-8-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-93285-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,somainline.org,lists.sr.ht,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 11E22156B9A
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 20:25:24 -0300, Val Packett wrote:
> To make sure the display subsystem starts in a predictable state, we
> need to reset it. On closely related SoC (sm6115) this has caused
> DSI displays to not work.
> 
> Wire up the reset to fix.
> 
> Fixes: 0865d23a0226 ("arm64: dts: qcom: sm6125: Add display hardware nodes")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
Tested-By: Yedaya Katsman <yedaya.ka@gmail.com>

This makes a panel driver I'm testing work more reliably, right after boot
instead of some random time later.

Regards, Yedaya

