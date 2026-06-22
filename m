Return-Path: <linux-arm-msm+bounces-114046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7vfDJz5WOWouqwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:35:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 301CA6B0C6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:35:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BP8D5q7Q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114046-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114046-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E2933001FC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C09018D636;
	Mon, 22 Jun 2026 15:35:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB42375AC6
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:35:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782142523; cv=pass; b=UhnPoj+7jVbLrpkSMe4Mx3LhYG+aom4BCflqhfb2AJpr28lAaQ3pyP5sp3eBxKrGtZaXmpBYFAvEyhe7NqF66mAHRDLnxigMKs4o6/CJAaMueecKBZJTuKfsV8XAhlVcF+w/+GqGcrCt1Xtb3i+wThY+n/bIuZa4ZKQ5It1RE6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782142523; c=relaxed/simple;
	bh=5OCGKPyrQcnRpkWX0WedQu6uHAkVuPmEI/fEX9pGYvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6YxcPbhAB8NRNv2z7fPOzNB5lAZdQObyP+kOXegc7QflcpUj25Suun47jJWfX3UARphc2CoZSrYtaBTqiByb3WLkQxW8lrkDTS9/PNNdcCJFDd/jidZukMiqtd+CkCAPFUyZ/TeYGydeh+3GDY3/UnpGJBf596bYDqUS4QCcRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BP8D5q7Q; arc=pass smtp.client-ip=74.125.224.43
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-662ebb1329aso2075083d50.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782142521; cv=none;
        d=google.com; s=arc-20240605;
        b=BxKVC24HQ8L892EzBuF79Fq9SkjQJpCX9diXv/v3GDa7N9AyJw0FlQJjc1rGfRDyot
         av8HmOmc6DUe9je6dfMN4T5PKo2EpcebmdHAa3wCoERLwDqKGkuCIb6vxl4g5XYd9Xi+
         7MoQ56A48zRNJpLEyGoAI77ys+KOBpM7a7VOUdImXlIBvZbFHXMfVK6wv0uvJBqjsJkS
         O5CTY/E9QRpbxS6pCdeoEB+SQAqi2qHCC+ZoEhp0qoMFBAgCwY74CkTmyf838cdmE6UP
         4TeD1EVMLYTCCcgO/y3Sf4z81M7cIR1fqXH7KTeQk93Whmtp6OseP5YE0pPhWMi7qKVF
         m8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9lW9Qh0iORARavHIyVNPtLhkXeZSz2NoMcvEmgnoHpA=;
        fh=T6VWwWM0Qh7n39fYlmUe6AoN3haLRNWs36J2DDhZCME=;
        b=AMiRPdE/NWEmV1y6cQCZnjIKvWS42YSTRk92h7taqUHYFAIy4dAbRhhdC1XuCruDQ3
         nwXDy06IOXeYBjIIx2Go20XWkgMiZ+p3DSNadpsc8BDhagnsW8rkByITMa7wo4Xom5dU
         IDrB7T6zucUsACUYpUyJGa9cUMqeGOm1mS4NOvkjAexLMYx4286YgUgbnDCY30ifsK+3
         BQMzy57zbBVF9BH2ChSMRP2m/sFizZVVeb+MpXeWc976Nrp8ilBwfmHSvVqk69aTClMn
         2Tx8voqSKzRrIZtxyCRZzI20pgaOHKjrLduIwZPUGf1y0irAxbEaB0JVqabYDqI9GZvZ
         FM7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782142521; x=1782747321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lW9Qh0iORARavHIyVNPtLhkXeZSz2NoMcvEmgnoHpA=;
        b=BP8D5q7QAFXc2dU6kSAWX8FJpNws7BxjJmgj6Yugkgcqx6DHdc4/9j+cyF7kwgSlGO
         UunqtejmT8WCLSPXh2eWiV6kkn2b5sN6p1u2wlYorPcRUs/LAiQVlgWdvp6u0DZOFQVg
         KbC2eCi0ScEaevkhDKSMnfGbGHTRcWLOMf4pQPJsm0Tl33Z4zxf/SdKvlgOfBkZHzoo0
         cLX4395WZE3YSKscaHHshOVwjXYlzKQZA+YowMjq9jAA2QceNwtZZ2DEHMmSzIUGPAyQ
         UojP0XpgoJviHdryKy2kogdNJjrYnp3xYBIznvXcFk8rJJiCHCeBttswkAOcXD22NKcv
         +v7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782142521; x=1782747321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9lW9Qh0iORARavHIyVNPtLhkXeZSz2NoMcvEmgnoHpA=;
        b=goASYFifj5SzOzWJQkeAWP8kSR1ZkSMsRwS+uWL+pyY5HNWw7W176uItFH5PMgg5OA
         OAj2y8mjkDPZViCcAvgK1Tszd6jnwVUhUZVtSZUP2Lu4Oq/iKSs/tjPEDaV9n2AqUgQN
         tuDmKzk4AGNkAakHTWBC6g07Dbc0FTBLcQLtwa7XzG9bowZrDj45uRtY5XUU8spMLsEH
         9lDN2+SHcf1SNzOsqU26N7RdGViYdD2U97FrpHbUOsn9b2rSTfh9aVL/YL75dIEk6jDh
         WzNDPAOqdsy5UhKRObHs9+Zm8hP2kP7cOeMyLaNOTY1rMc+yt7NLFCAsD709mydEAffp
         BQNg==
X-Forwarded-Encrypted: i=1; AHgh+RqfWSPvxHYhWGxOZv7fMQsh0RyAChD90JRpbF/XJlUU2IAqwxwLtfDiYP5G1w/bfNy0hhy7cjaj1fWLWPYt@vger.kernel.org
X-Gm-Message-State: AOJu0YxjKqANeUppSwCMZGw2Ga/buJK0GAQtenEFx9b5Vr9Ip/It3bR3
	X/S8fDOvKEjY5rL0QxK+JHtZYqxKyImA6nsGYc4MZ4FvjrUDtqD1yGqNmAh1cFE5qO/g2o3Esqs
	gXcfzHTXNA3HtBtCGkyTv5fEINxYiRI0=
X-Gm-Gg: AfdE7ckJV06i1Ngn5tfnjhbDCWn61gR+7W87E2zkI5EUHXaGca+ZTo/zGBrvQjxDGDE
	gO1rGMEqLpXQsN5QSp2lyjSDi1CZ5JdWVUWgzhcKMutAnH+5wl/53Wz5PrFF7+3D5+TsxMrKwaY
	0xNQe3rUTCpXPlI4n8Milpp3Jzlg5HxoZL/OPJW9cVqMWxyVz6uMhaCE/CDWLjVGICAiqF9YqBi
	Yv85wy07gvrzkbRgU5j52Vv8i09eWiY2EX35OnDFXK9z88w0YwtJ8ooY9oPXtTDlBfQpphtxbzi
	Adv+w5GGQjemgegwsHd4zOV7u/5g0KOdfYUgBDPaWA4sL2xetk1Xk+7n
X-Received: by 2002:a05:690e:e83:b0:663:9de:2049 with SMTP id
 956f58d0204a3-66309de20f0mr11680467d50.13.1782142520865; Mon, 22 Jun 2026
 08:35:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com> <20260622-bt_bugfix-v1-8-11f936d84e72@oss.qualcomm.com>
In-Reply-To: <20260622-bt_bugfix-v1-8-11f936d84e72@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 22 Jun 2026 11:35:08 -0400
X-Gm-Features: AVVi8CeOpIYHL5-TwNBim9QeQWw0S_IkyHa2Yq5HluoguIJRtBcH4I32gcuco4w
Message-ID: <CABBYNZ+z6XcZXejs18fbX-MSFBmaGC0Reoqn549N-8sn==z2Ug@mail.gmail.com>
Subject: Re: [PATCH 08/13] Bluetooth: hci_sync: Fix return value of hci_reset_sync()
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Ben Young Tae Kim <ytkim@qca.qualcomm.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Matthias Kaehlcke <mka@chromium.org>, 
	Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114046-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:zijun.hu@oss.qualcomm.com,m:marcel@holtmann.org,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[holtmann.org,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org,icloud.com,vger.kernel.org,intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 301CA6B0C6C

Hi Zijun,

On Mon, Jun 22, 2026 at 10:52=E2=80=AFAM Zijun Hu <zijun.hu@oss.qualcomm.co=
m> wrote:
>
> hci_reset_sync() may return positive HCI status byte as-is, but callers
> in the chain hci_reset_sync() -> hci_init0_sync() -> hci_unconf_init_sync=
()
> check errors with < 0, so a positive status is silently ignored.
>
> Fix by converting positive HCI status to a negative errno using
> bt_to_errno().
>
> Fixes: d0b137062b2d ("Bluetooth: hci_sync: Rework init stages")
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---
>  net/bluetooth/hci_sync.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index fce9f9526cb5..601d44ef975f 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -3678,8 +3678,10 @@ int hci_reset_sync(struct hci_dev *hdev)
>
>         err =3D __hci_cmd_sync_status(hdev, HCI_OP_RESET, 0, NULL,
>                                     HCI_CMD_TIMEOUT);
> +       if (err < 0)
> +               return err;
>
> -       return err;
> +       return -bt_to_errno(err);
>  }

There seem to be 2 consecutive changes to hci_reset_sync that conflict
with each other, also the expectation should be that positive errors
are HCI errors and negative errors are stack generated ones, so the
callers should really check `err` and not `err < 0`.

>  static int hci_init0_sync(struct hci_dev *hdev)
>
> --
> 2.34.1
>


--=20
Luiz Augusto von Dentz

