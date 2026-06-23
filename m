Return-Path: <linux-arm-msm+bounces-114115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MSShLLBJOmp+5QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:54:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0385A6B5715
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:54:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=E7BK99NB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114115-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114115-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 569C83059E3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B253CF208;
	Tue, 23 Jun 2026 08:51:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAEC3CF045
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:51:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204664; cv=none; b=FCorLgZoRPGATs1uvDdh/dAW9gbyLd4gFFwQeg7qfoRuFPkvNQqt8oDZbRea7TpzeXlgPoEkbISu4SmTQ6cBKGbChw/66Sci08nGBNaMTI0CUcxs2n0QhI8HsKVxDUKbaAevDG7GPYvPsBtNVNt3oMfSLvFHGt0DsceM64QkReU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204664; c=relaxed/simple;
	bh=7ZBFU3s+SJ4w03nt7VS5gUqwdF2fD94T1TmJ+ste/24=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnF0YmjNOYFjwHLLzgQ1EPQAjbo4fUYra+13RhgDQg7oUl+NbuJS9uw956b6ibFIX2cE7jx0MquRiWl/ezgakGWIMqF5CzmJzPJ/r2GP7WUHIva5VRqpw8FukR4iO/ROUv45w+tibYKnfybSa5Z0QczrkVqNUHBOnYpGl0WipNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7BK99NB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823A51F00AC4
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782204663;
	bh=7ZBFU3s+SJ4w03nt7VS5gUqwdF2fD94T1TmJ+ste/24=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=E7BK99NBSFfoDgEi0+E55/Ugq/nkSsLV8Xjm0ISBg1JrWBeR2qOexlHtrnpOv8HJh
	 5TurA1aAqcBA9C4dATWPFSGbQDF/IE8dgXjkIBqNG+0DfeZIW9jGg8qvBbR2gdiW3w
	 6QVb4A9CjJx7jOhPGY5KlCZOwDGZOD5OZttOKVXsPrPgx5LkGBNNT8QxQoCNUYJIrO
	 yqOopuNeJxF//C/8KtmWrnMjiwMX3qSMWfBeXtnH34YF/yr/j4bu6NVOsEQsABD8y4
	 t4a9c/SJztGpvT/qAOz1NqjPLVG5lCiCwXW0ClxQamomYEuPcLBUidskDPcF5zsrR1
	 OkvAX1zIhtybg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3966c0d5ac9so53695321fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 01:51:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Ah5hiqyJY1B9+pNUN5pz0//BiKSBbCk1J2Drsy/OckdCSA4Puqq0+7+WhSjRSpmytU1nPaG+nnnEz55ck@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh2zq7Bjlt9Hnw2vs4FnAGg6HHMPjrOk0wK8Qb62JdgPRclqgH
	flCYpkJygteDFw14rGAGcEzUgx8dPN2UGKk4RcpnG2P45ADPC1zDbHpMklm54O0NjwhpBx4tYKs
	J42IRhTgDGgP5f3VXn90e0DuNGDTtP/abWkq96qnj0g==
X-Received: by 2002:a2e:bd13:0:b0:399:775d:b249 with SMTP id
 38308e7fff4ca-3998bf1244fmr52245381fa.25.1782204662152; Tue, 23 Jun 2026
 01:51:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 04:51:00 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 04:51:00 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260622-bt_bugfix-v1-2-11f936d84e72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com> <20260622-bt_bugfix-v1-2-11f936d84e72@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 04:51:00 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdipmXHoY3eHF2dOJdV=vEqs4y+CZhY7-0mifHGpn3+8A@mail.gmail.com>
X-Gm-Features: AVVi8CeuJ05lk535AklqocMHC8EtaS5j47PFCbCdDRGTLtXXToW267cIszot7PY
Message-ID: <CAMRc=MdipmXHoY3eHF2dOJdV=vEqs4y+CZhY7-0mifHGpn3+8A@mail.gmail.com>
Subject: Re: [PATCH 02/13] Bluetooth: btusb: Use & instead of == to test
 bitflag BTUSB_IGNORE
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, linux-arm-msm@vger.kernel.org, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ben Young Tae Kim <ytkim@qca.qualcomm.com>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114115-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zijun.hu@oss.qualcomm.com,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0385A6B5715

On Mon, 22 Jun 2026 16:52:15 +0200, Zijun Hu <zijun.hu@oss.qualcomm.com> said:
> The driver_info field is a bitmask, so use & instead of == to test the
> BTUSB_IGNORE bitflag against it, which is consistent with how the other
> flags are tested.
>
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

