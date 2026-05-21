Return-Path: <linux-arm-msm+bounces-108986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKg1LLnPDmrOCQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:26:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 344C95A24C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 377EC30F4261
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8715F36E48B;
	Thu, 21 May 2026 09:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZjKXkQZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CA4372B2B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355122; cv=none; b=NpND1Vgw6yMA1j8CvDz6m8aAUSD7FzRL0kGhO6ng6Xerp4FjlVhP609XmHeCD1spB6A0vE5ngb+5Z8TjO0Un8bg8GfOpLaaDdSMQYnXTb3xOXmKEtYavNJ9JB3wQyR52G9ZgSpceRkcwpgf6OOo2tfOsTVKOPC9ftrBj3qeSAGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355122; c=relaxed/simple;
	bh=azw12yvo1KzS4bOAY2lRlKmNg9Zna4MNvidgXEzteRo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dxP+x0eyJntLy6+ES57S79PMZFRYsR0OLse7Bk6NttriaqwWLFkVJLQoGVphNsTq8wMKnZuTbf6WcZIMXmqPEVZmU/GUzQMi3s3Yd3S2vlZRCD1b1/nYW9PPJpuS6cGH54eRCIJ1keT/bqk4OG64gs29SmQlVLIe4or+tXCzrCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZjKXkQZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37AB01F00ADF
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779355120;
	bh=azw12yvo1KzS4bOAY2lRlKmNg9Zna4MNvidgXEzteRo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=OZjKXkQZv5hnNqa14eYjTh92IdTWlvwfWTIj7QQ6zZkUx4SgYVrNqah27+wXDgjGC
	 gWwVAF16Zx+3ZNyDxS6R+5KspgS41D1YJfszZPUbt2Md0a0LqzG7ynooFeMF2V31I8
	 76cf66sJHbi5RPQcIc7DKra4Ji2OrLpqBOSTcDvYsrXUd2yw0e3ApjSrnJNYq6TT73
	 58761eq7Ho0Sqkpuy5VllINNeKqtQSUBUGMhZN3puywZnymXRkvzVdipe1CKKmvPww
	 ynhSv0XuKxAeDdeMgEcZavvEKxm7PRzgtkeJq5LP6jnjJG3BcpNij4gUdTpNghCnTH
	 usyNtekRbqhxw==
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1357c851a48so6614717c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:18:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ca0dTLhyZna79kvvg1HgZLbbhCKV/yApcpgq992tsP1SlsU2RyohbnAH1JfexQAP9yo2OmxkxEbMSgHsS@vger.kernel.org
X-Gm-Message-State: AOJu0YyTKuKtyt744n+wXCILzUnXgbRKSiekfeCF6vJa//wf6PT+wGxc
	8aif/+nyT6LbIJ2MJnK35NkDP8AB2vQCLFdUE6ve10UkOq2w67PoNCBGJMfZ4Cxv+fAj//RAeFy
	Y6MAsuJrTDGF1Hz/j1Jh95NxB/TdjEXgfLrfYEpgaiA==
X-Received: by 2002:a05:7023:b82:b0:135:a75e:7d93 with SMTP id
 a92af1059eb24-13632c2e98dmr919788c88.32.1779355119421; Thu, 21 May 2026
 02:18:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:18:35 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:18:35 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com>
Date: Thu, 21 May 2026 02:18:35 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdddNGkost=5XD9nvxwcCE4mRHQhAow9gS+Hap_b32mpA@mail.gmail.com>
X-Gm-Features: AVHnY4IBgnLNrnXiblCXaybZXjL6TZAv5y3zJhw560hCdBFpu5oS9qCU09vJltQ
Message-ID: <CAMRc=MdddNGkost=5XD9nvxwcCE4mRHQhAow9gS+Hap_b32mpA@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] Fixes/improvements for the PCI M.2 power
 sequencing driver
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108986-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,holtmann.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,manivannan.sadhasivam.oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 344C95A24C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026 10:55:55 +0200, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> Hi,
>
> This series has several key improvements and fixes to the M.2 power sequencing
> driver and also the BT HCI_QCA driver. Notably, this series allows the M.2 power
> sequencing driver to work with more M.2 cards, not just WCN7850. It also allows
> the BT HCI_QCA driver to detect whether it can control BT_EN (or W_DISABLE2#)
> signal on the connector and set the HCI_QUIRK_NON_PERSISTENT_SETUP quirk.
>
> Testing
> =======
>
> This series was tested on Lenovo Thinkpad T14s together with the below DTS
> patches:
> https://github.com/Mani-Sadhasivam/linux/commit/29534d15307551b2355eb254601dec511169f0aa
> https://github.com/Mani-Sadhasivam/linux/commit/f4eaacfe647674be200847092b43cdef2194fc55
>
> Merge Strategy
> ==============
>
> Since the BT HCI_QCA changes depend on the pwrseq changes, it would be good to
> merge the whole series through pwrseq tree or through an immutable branch.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Luiz, Augusto: this series looks good to me. Do you want me to queue the pwrseq
patches on an immutable branch or should I just take the entire thing?

Bart

