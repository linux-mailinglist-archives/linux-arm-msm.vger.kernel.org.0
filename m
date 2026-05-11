Return-Path: <linux-arm-msm+bounces-106911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEqkOHPCAWrKjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:50:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C8050D0F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7235F3009FBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A79377550;
	Mon, 11 May 2026 11:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKCaDER+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FF637701C
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499921; cv=none; b=rC1cFbVVkOp0KpdmaMDpjcCJbXyUZhDTBAHkSI/k1DOeP8rt4m4ilRq9zAw1WMU2zbkD4b/AvVNtgLznF+K30yf7Od3ToImHnp89336EDXs6DEaviFR2CA4gAmrNM248TXAgVJBvUFHgTarxAGwiahpVJOKPgIK8xgrqoMuDZFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499921; c=relaxed/simple;
	bh=fz0jSbfuRK5dOsz4ATrwWYd/2Dc+G//arFfjMY262K8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXx3yLgp9cnpP2qvLVu0s5pX+CIm7GUYNaJip1T8ZpmbFvVE5elAAH4cg7rEsVEkiUpws6ZSVckiPoTMpLFvtdyYwZn2evoWna12TD1k9qvO+DEJxAZU3IxIfGFrcyqYQyXsoaUJehq3dEdAeYTcWZUQo3jJL3y+jOEP8P7zbK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKCaDER+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3832C2BCB0
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778499920;
	bh=fz0jSbfuRK5dOsz4ATrwWYd/2Dc+G//arFfjMY262K8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=ZKCaDER+DJme5wJWTQafzm+Y12dF5K0zl7V3ReqTTQVyxvz33OWYZcxNRgun06EEf
	 OYWldwHN63zniJfSIUY2YVs75IOX15KiyVhH7H1nTyCKFifeXwA6AuF7FvUdi0aaLw
	 bsYFfeZtax/SV6gZNYUUjTu+fFhAxeMtXvcte30VZaxip4KgrPkh4iBsmFP8a3QZq3
	 4r82xjf57xQlAEcmVCKJ/eER8hFHN0XwH4U9IL1VxywzLjMZbIlShUcKgpS953Ljra
	 H+B3fInPwWo2RYnQWKJCkwhz0kbVnjOwaQbg6LCtpRzM39sKH663EHN5T0B/X0POP+
	 KsLO3e9ja/KTA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a87782588cso4779706e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 04:45:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8caNuTd1cQ+CHE/EaoTFr5PdAF0nZRgophua7DvA0UL8yWWRu6S3UCyxxW2kfGKNDDh4Um3TEPliMsyJtl@vger.kernel.org
X-Gm-Message-State: AOJu0YzXgbTOqmEQfBADue2pEpxhkbaHLJw2Pp1OAA0ePLwnpuLhUpD2
	bzIGSHMkfEpRv2HRuGwtQR05gKxkP+hxE+PdPnSdvx3ElSRfgujwAnYOvQEji/chYNnzGJ5CdZu
	bHcp5JNy/l3Cdon6eVcu7hXbT8oww99cC1mUGyRvmUQ==
X-Received: by 2002:a05:6512:2247:b0:5a8:9bb6:230a with SMTP id
 2adb3069b0e04-5a8b6e9020fmr2575074e87.18.1778499919417; Mon, 11 May 2026
 04:45:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 04:45:17 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 04:45:17 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260507-pwrseq-m2-bt-v2-4-1740bd478539@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-pwrseq-m2-bt-v2-0-1740bd478539@oss.qualcomm.com> <20260507-pwrseq-m2-bt-v2-4-1740bd478539@oss.qualcomm.com>
Date: Mon, 11 May 2026 04:45:17 -0700
X-Gmail-Original-Message-ID: <CAMRc=McJj1Wp_h5ReTJ68ddmgCg3RDuo4Hqar71O8MBtqT5ryQ@mail.gmail.com>
X-Gm-Features: AVHnY4LSPzVLt5LgdyZOlSqyDWYcSbRKhI4C6lR7JUAJAnXf0Vx4688SEvTLvXg
Message-ID: <CAMRc=McJj1Wp_h5ReTJ68ddmgCg3RDuo4Hqar71O8MBtqT5ryQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] power: sequencing: pcie-m2: Create serdev for PCI
 devices present before probe
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Shuai Zhang <quic_shuaz@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 91C8050D0F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106911-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,intel.com,holtmann.org,gmail.com,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,manivannan.sadhasivam.oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, 7 May 2026 18:06:12 +0200, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> So far, the driver is registering a notifier to create serdev for the PCI
> devices that are going to be attached after probe. But it doesn't handle
> the devices present before probe. Due to this, serdev is not getting
> created for those existing devices.
>
> Hence, create serdev for PCI devices available before probe as well.
>
> Note that the serdev for available devices are created before
> registering the notifier. There is a small window where a device could
> appear after pwrseq_pcie_m2_create_serdev(), before notifier registration.
> But since M.2 cards are fixed to a slot, they are mostly added either
> before booting the host or after using hotplug. So this window is mostly
> theoretical.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/power/sequencing/pwrseq-pcie-m2.c | 83 ++++++++++++++++++++++++++-----
>  1 file changed, 70 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
> index 038271207a27..0a37a375a89d 100644
> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
> @@ -236,7 +236,7 @@ static int pwrseq_pcie_m2_create_bt_node(struct pwrseq_pcie_m2_ctx *ctx,
>  	return ret;
>  }
>
> -static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx,
> +static int __pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx,
>  					struct pci_dev *pdev)

It may just be a personal preference but I dislike the __ prefix that doesn't
really indicate how the function is different from the one without it. I prefer
the name to reflect that - if it's because the function expects a mutex to be
already taken then it should be called something_something_unlocked() etc.

Maybe call it pwrseq_pcie_m2_create_serdev_for_pci()? Or at least:
pwrseq_pcie_m2_do_create_serdev()?

>  {
>  	struct serdev_controller *serdev_ctrl;
> @@ -259,6 +259,16 @@ static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx,
>  		return 0;
>  	}
>
> +	/* Bail out if the serdev device was already created for the PCI dev */
> +	mutex_lock(&ctx->list_lock);
> +	list_for_each_entry(pci_dev, &ctx->pci_devices, list) {
> +		if (pci_dev->pdev == pdev) {
> +			mutex_unlock(&ctx->list_lock);
> +			return 0;
> +		}
> +	}
> +	mutex_unlock(&ctx->list_lock);

Is there any reason to not use guard() here?

Bart

