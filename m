Return-Path: <linux-arm-msm+bounces-92998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAcgALY/k2kg2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 17:03:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB988145E12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 17:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93F7E30056EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 16:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C92623D7FB;
	Mon, 16 Feb 2026 16:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lgsAn2zF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E953D544
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 16:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771257779; cv=none; b=rihn74onghuAyKynENm8otyDLApNQ9MW4kpFnoPxSN5UTT7IcuC/nlsc0UmO8W9Z58Aroqe6aPXenxStzJ4ff6o4je0tgZ3eab7WCZIeFGSgAQvarGxAnO6KiFVttxKt3DVkuLQViNaouxq5jDxkfTrDwZXZga1Z6gxj86JqgAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771257779; c=relaxed/simple;
	bh=v+Xm4hz8UQFQCCoWjiJZ1qnBQX/DEMOj+dum6T/tWPI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdI3MksbRWTmGUgPt59VhPT8zeS5Fsj3YOC+zlJts855McZNsapos04tQSIXch8vk5HIKPcGsOgw55KJ18W5I3IN3sGZodkh/AkmiWkK698e8C4NSeI7qKkbn3scr12IX8Htt006JnS8F1popKhEPIQfNIA2pqRvUnVX97NiTFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lgsAn2zF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5044C19424
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 16:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771257778;
	bh=v+Xm4hz8UQFQCCoWjiJZ1qnBQX/DEMOj+dum6T/tWPI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=lgsAn2zFZ4+ASzlNnPXB0knrzGb0bRfMeeNzCsKV2FPaw/C6r6JRPreswSLJXvJZw
	 SWPrykQAZiXPW6wNWcieabfYwcm6gGx1bsL2x029H+JZ3S2UCMy1QdW+7iINP7mJFA
	 Ov6IDQ2CUOCsSY6JjxaVwRysxrfvE+IgjSEksJol/OEH9kjZvsU97LEh4IwdQLsOLt
	 q1Hp3uAZIDN6JrTP6pnROv6eI4+sjtsKgUeVmWSVDR8HWPgVpj7Cizt5HA7SwfKnde
	 26zZhmKQwKr2Vzk/qghwaNlCrn+kcIPYs0R6OqkQApJPp3tMAbkB4fmki0mUL4o4Rg
	 ShRyANAX9DvsA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-388126f79bcso21716521fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:02:58 -0800 (PST)
X-Gm-Message-State: AOJu0YwUlYAGD7xs+VMO2OzE2/gubH5whirs3AfeQaehepj3QAWIaFqx
	LUJLlIjsNkuXP0danjzf54nbs+geKIqp5ooopxy1eL9MWg4kkpmvD9pLHlrg2i1hX1M9lvHxblz
	WiqMccU63mXuThTd6UVfT7kofD6lMt9fHjbL9Fk2mPg==
X-Received: by 2002:a2e:a913:0:b0:387:c42:f6c2 with SMTP id
 38308e7fff4ca-3881052574fmr34595291fa.16.1771257777426; Mon, 16 Feb 2026
 08:02:57 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Feb 2026 08:02:56 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Feb 2026 08:02:56 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260212141721.69961-2-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212141721.69961-1-johannes.goede@oss.qualcomm.com> <20260212141721.69961-2-johannes.goede@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 08:02:56 -0800
X-Gmail-Original-Message-ID: <CAMRc=Md0gdOVOzwaVZNf52ZgQ9uw1Vn+e05Fvc44ZdLtrKezLg@mail.gmail.com>
X-Gm-Features: AaiRm52OOfO2fZk9Ikgj3W8D7regZzNn9lCNsLVvm_J-4u9S2Ct1iCvGIHfI_mo
Message-ID: <CAMRc=Md0gdOVOzwaVZNf52ZgQ9uw1Vn+e05Fvc44ZdLtrKezLg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Bluetooth: hci_qca: Fix BT not getting powered-off on rmmod
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92998-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,holtmann.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB988145E12
X-Rspamd-Action: no action

On Thu, 12 Feb 2026 15:17:21 +0100, Hans de Goede
<johannes.goede@oss.qualcomm.com> said:
> The BT core skips calling the hci_dev's shutdown method when the HCI
> is unregistered. This means that qca_power_off() was not getting called
> leaving BT powered on.
>
> This causes regulators / pwrseq providers to not get disabled which also
> causes problem when re-loading the module because regulators and pwrseq
> providers have an enablecount which now has never dropped to 0, causing
> the BT to not get properly reset between rmmod and re-load which causes
> initialization failure on the re-load.
>
> Fix this by calling qca_power_off() from qca_close() when BT has not
> already been powered off through a qca_hci_shutdown() call.
>
> hci_ldisc.c will call qca_close() after freeing the hdev, so this
> means that qca_power_off() can now no longer deref hu->hdev, change
> the logging in qca_power_off() to no longer use hu->hdev.
>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index fa7ab4272771..9993e748b56c 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -721,6 +721,10 @@ static int qca_close(struct hci_uart *hu)
>
>  	BT_DBG("hu %p qca close", hu);
>
> +	/* BT core skips qca_hci_shutdown() which calls qca_power_off() on rmmod */
> +	if (!test_bit(QCA_BT_OFF, &qca->flags))
> +		qca_power_off(hu);
> +
>  	serial_clock_vote(HCI_IBS_VOTE_STATS_UPDATE, hu);
>
>  	skb_queue_purge(&qca->tx_wait_q);
> @@ -2220,7 +2224,7 @@ static void qca_power_off(struct hci_uart *hu)
>  		qca_regulator_disable(qcadev);
>  		if (qcadev->sw_ctrl) {
>  			sw_ctrl_state = gpiod_get_value_cansleep(qcadev->sw_ctrl);
> -			bt_dev_dbg(hu->hdev, "SW_CTRL is %d", sw_ctrl_state);
> +			BT_DBG("SW_CTRL is %d", sw_ctrl_state);
>  		}
>  		break;
>
> --
> 2.52.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

