Return-Path: <linux-arm-msm+bounces-90695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JrnB5uReGmirAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:21:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEB992AD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20E20304CB5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682BF2FD1D6;
	Tue, 27 Jan 2026 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2S2PUCV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438582FC893
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508934; cv=none; b=RIz7lHKC4Z23qVwQQAe6536yx6v7m85ptfCr0vyxtQBL2i7+umIwy2zj/UnAcyNV3PgDlcSQ+Frjgm4+zSHInLRF6WmyNqyw6LimTSEd3s7npt271cF6GLO3ZYUm/9kPlSyA5qQFB9ESvhgzqoZRhbXv1FEqiaUNXGfTjghx0C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508934; c=relaxed/simple;
	bh=f861WMf6x3EGeQLcb4tN7R9Q08uVtHa5s5P80mEJZcM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TVwdJBhFqJV2uQxz7iKl5g5hoZyPY0LNHQCxzKgAzyMPL6UGH2bDSVKXc9rcjADLMT9deIM8N5srB0QevIrHU5WbTHrDuOT5/XKXztnFLXIeUMSt3mSyicr8l8FESyOZvYea6ViV2VsHo8sIqBGzRxv6yoTUgQCeQqMF/7dGues=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2S2PUCV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFAEC2BC86
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508934;
	bh=f861WMf6x3EGeQLcb4tN7R9Q08uVtHa5s5P80mEJZcM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Z2S2PUCVb7ut84Pki1UWeX5GOYFoy7Wtw9g+FcVgknjpjnD/vu6hKDB85U6kuFxGX
	 vPmc/Zm4YbsVTZ0r+EwpOIbc5QxRo/J1TVv75V+Gg4GALlxjdm58pK6DsGzhXCIwxh
	 jumwIJlAukI3eNMcTV9mhBVQblcVTb6y7uddEZCIqFS3llGB5RmrHk33IZS5AzT+DR
	 x6qNfaSwJLZZ7akFTO66sXfy5tiA5iHJ/zUdQJiKiF7g94TevqauTgKQpzWHCkcV/Q
	 vLwAM25UTr/z4OcprpjGTWcBFbiOFeQHHQ5vZMNEbb8v+z1cu1+zE+eU9mZY+N6bgM
	 FzgIBh9vpZolg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59dea2f2ef2so4229580e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:15:33 -0800 (PST)
X-Gm-Message-State: AOJu0YwBE+/nSzkAp6A2LFzMWerv33tgoMGjbw+u9Cbc7/MYGpTJsmB4
	bhLO0EQ+FBLecTVTKWTOy1HR53RolU2SSS74B9QJYXweejyyRbBrYIe3kBS5L/KEtUCvr1FTf7J
	4BkiBYof1cWYxa3oScTNVRuCCh8nFU7epscdPnYF/3w==
X-Received: by 2002:a05:6512:b94:b0:59b:6f3a:9c80 with SMTP id
 2adb3069b0e04-59e0401a127mr536383e87.23.1769508932668; Tue, 27 Jan 2026
 02:15:32 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 02:15:31 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 02:15:31 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260127025423.1418207-3-mengshi.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127025423.1418207-1-mengshi.wu@oss.qualcomm.com> <20260127025423.1418207-3-mengshi.wu@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 02:15:31 -0800
X-Gmail-Original-Message-ID: <CAMRc=McK16Y6M2D9XJUpRupBRqQL3Nt4v-=5_5uw9bQT1+tL8w@mail.gmail.com>
X-Gm-Features: AZwV_QjYlzWOjL9VKWTGFfyWO89wpZBwwhRCMbyGFRad3NMQqu_5uoVCPTLaF2I
Message-ID: <CAMRc=McK16Y6M2D9XJUpRupBRqQL3Nt4v-=5_5uw9bQT1+tL8w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Bluetooth: hci_qca: Enable HFP hardware offload
 for WCN6855 and WCN7850
To: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com, 
	cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com, 
	wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90695-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com,kernel.org,holtmann.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BAEB992AD2
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 03:54:23 +0100, Mengshi Wu
<mengshi.wu@oss.qualcomm.com> said:
> Add QCA_CAP_HFP_HW_OFFLOAD capability flag to WCN6855 and WCN7850
> device data structures to enable Hands-Free Profile (HFP) hardware
> offload support on these Qualcomm Bluetooth chipsets.
>
> Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index b99fdda88..6b4784dee 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -2155,7 +2155,8 @@ static const struct qca_device_data qca_soc_data_wcn6855 __maybe_unused = {
>  		{ "vddrfa1p2", 257000 },
>  	},
>  	.num_vregs = 6,
> -	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
> +	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES |
> +			QCA_CAP_HFP_HW_OFFLOAD,
>  };
>
>  static const struct qca_device_data qca_soc_data_wcn7850 __maybe_unused = {
> @@ -2169,7 +2170,8 @@ static const struct qca_device_data qca_soc_data_wcn7850 __maybe_unused = {
>  		{ "vddrfa1p9", 302000 },
>  	},
>  	.num_vregs = 6,
> -	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
> +	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES |
> +			QCA_CAP_HFP_HW_OFFLOAD,
>  };
>
>  static void qca_power_shutdown(struct hci_uart *hu)
> --
> 2.34.1
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

