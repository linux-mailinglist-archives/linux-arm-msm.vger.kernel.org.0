Return-Path: <linux-arm-msm+bounces-89987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALlnArGucGmKZAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:47:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEAD55767
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D81E566393B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D3B0477E28;
	Wed, 21 Jan 2026 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8Vhkaaf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD55313E19
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768991262; cv=pass; b=VtC5nWmAKXssoCOtrh7s6R3eL6ikRLqrocU7tT3+KO4sPvFsNj0uIG9a91UJmfZXfS+d4lm+qP/tyU8/n/fLRBWLNed2tDOFTaX5yOymY/tvSpZ9bLN3035a7Rdi44CWReROvqsRDIyrFcJYzWHgG6ikzYhizdk4d8elW3GzOsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768991262; c=relaxed/simple;
	bh=3R1TQbHE6RJd1s+x3cKEFsiw6rC1i3au5gWYm0ShFMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQEvuAbTr8WnncD4qbz+Mf63tJsyyZNWBy41olSr8BhjyMtdiR6MmhCV1J6L4BYtq9vA/RUJPAaD30TUlWUqa+uqd9Mqd5ru/rw8mOORoXMUwXDuB64e9X3gC5ZZ4zn9jTVcewJ2v7klK9wZDeRI/ttBLEwgw4d4anB3VwmqH4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8Vhkaaf; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59b672f8ec4so6923904e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 02:27:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768991256; cv=none;
        d=google.com; s=arc-20240605;
        b=H6VsLKbgLQOiRi4u8YeqWeAFHstTei1o9I+tqqAVb6ozY8qW9UWRO9/P5O4F2cSoBr
         cMbWO0J0FPWdFUQIoq9OXCurV5KV9WI4NNZiXyDqkOi9WxfJ28OThpA7meUIpKcZF/bs
         DpcDUO+ZVAKw1w2RtIA3u/QTx6rAWLA3ZkrrNTcCTv3kHMaUS2RxQQO4JbNfWUT+dQLL
         01Oae04s2jQJ58nF5/jiP0O/29I2BQJjxiaYHXgWQFu2eipALLZYxURSjeVFuDsLlpcq
         STotCrBkaN/fa7ZfT5mvV1ZXgnu4PeQ2qKnAVeR6mNHYxSMG6Sp1XCtCDUuc7hjYR5gQ
         a68w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3bSr7vQp3IbXCUSOkVvhrP+hhGp+0ZGPWYSogG0ufVs=;
        fh=z+dKHvt9RyZJhWHdO8nJaDaEECEk8OBpMK3z/hOsl+k=;
        b=SyLW5uuaDms1kqMCznHL546unZT9mWM9eFxEkyi60Kdpx/Zxx0YyJyfNuW2UYyoWk4
         9eCe6XJXMSmlrY9+pLL00cSTydWd8w4EEiw7LqZBtp7StFdpPT+OAPnSA8Fxk115hwNt
         ewRC6+YBgzaWheTwhotPc5puyzRllyfruGQ4G3WjsEyvuv1KtWaLCKoSOEco5ELkkWa3
         bbfvwa/QIpUePCD00avxttpKI0KPljefITZvBbhzalrHvC2Tn6zBw2EletJWjPYHXLsp
         KIZM6F1Puhbx3uVetf13S80WxktVdBj2JIDFFZxRhOhQ9/GQe/qtOWMBr0X8yfYEvfeb
         N8jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768991256; x=1769596056; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3bSr7vQp3IbXCUSOkVvhrP+hhGp+0ZGPWYSogG0ufVs=;
        b=B8VhkaafxNU8engkJErAdMKtojhIFPxliAnFbKYkiRZTwqZHD671D1rUu9EgtHeX1s
         kroPSDuNrklMaIPVvRtrNgsc1bQwNRv1My8EPjCoM45jFUYmirDe/yJCem+q0ojeqVaz
         mNxSPiA+/ALWfKoBtadR8bqVIIEyngCPlzehrpw4ghyCR27vePmRoo1Ij7cAURazRV9w
         TvwJol1nh/N83EWOYg2GvsgXOCHerAEJCjrHzdeLp4QVQHDYeJ5TJBSwRxIHmSqA3xIj
         N9yitnrgWn3WwdTGrB0PnB//G26GDjzxTc+y4UhJiHMrQEO7476+rZrVDUGSRVyrugdH
         +gTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768991256; x=1769596056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bSr7vQp3IbXCUSOkVvhrP+hhGp+0ZGPWYSogG0ufVs=;
        b=LwOBdic4oPZH5UJ2MF3/cq6jYVvQIal0fNVczJPgrUC/hiUlj8wAp5GXOWsOa+heN/
         n/JT6IFXjqiPVEGfhcPWPiqFWxJ5dfdV00vervS/9wWRbKz0jArnFiRYxxrmJqZvUd/I
         yyLcKjHLusVkKlztPVrx1u4oizaboJ2c4Pe+7qHE0k32DZuN6mDq3sreFJHZvQXiqXOg
         BEjCv44zTanb3/c2Trq5Sa9Ur+IMGzB31cs1MoKfy6bHsW1kMgzn5QvF7MkqWQRgpwV9
         zvdMotfS4VrZexRzYHqrzAGmf1QP0umQ9rLYFeHV5sCMHA4MozeN5Q4jmMD944Fb01iu
         o8rg==
X-Forwarded-Encrypted: i=1; AJvYcCXda4GePXU+YQZIoIEFqRok7r2Lwt+T1D3asPyHEnWiKwIhY9E5Q1t8KJo/Q+tzouxGAmyGhY7c4nHy/LPm@vger.kernel.org
X-Gm-Message-State: AOJu0YxeXkuf3pKTpcOZ/Lw1+9BrDbQVbBzyMPqroDZWfC5dHRbF+QPj
	vwwejS1YcnygBdv6Q95eKJSUj+U7uZPaBqmKxa52JOg/ERXcZ3R2KlF727ewAQ5S956NkOK3/1v
	CtOsk8dLQsciIVQpDtZIsqtr3qpDmaIECDwBsnMxyyG46pwlXLHmZ
X-Gm-Gg: AZuq6aIiJO8Vkhvyq5b+wLKC/E9bChY0qmLfLAyjCAMXSBLicpZDvW8hJ7byh1L7rnb
	vvlabgiBeo3CsLwf+d71X4au002QIc1PuwCy8mtQJ4BZ2oQ64zISnCEa1gli1vuB0dkcH3xgHQs
	jY35Ygd34BuCCn2Nig4eAPfJCeZqiOqr+rk/gNCpIg3QdbHwrn4yknfrkqCuiRd18Ug267hGKPd
	yvfJdXTP6qpFc+umOKP+rd7QRYyc4QC3YTXFX2uh8mhu2idNBCMbOdbhmONtwYNiDQ7E43A
X-Received: by 2002:a05:6512:3e0b:b0:598:f1a7:c70a with SMTP id
 2adb3069b0e04-59dc933e9b1mr2001468e87.30.1768991255615; Wed, 21 Jan 2026
 02:27:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260102124018.3643243-1-neeraj.soni@oss.qualcomm.com>
 <3a93822a-6ca1-4cc1-be12-38b2b04704da@intel.com> <23c9f3b9-f575-5bc6-e7f0-46238c26a7e5@oss.qualcomm.com>
In-Reply-To: <23c9f3b9-f575-5bc6-e7f0-46238c26a7e5@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 21 Jan 2026 11:26:58 +0100
X-Gm-Features: AZwV_QheuuaNG7s2ODMLCCV94bf8faghA30RCgdfwiXtKRbSXLgwugxR8oU6i5s
Message-ID: <CAPDyKFqJXQ1dYhgfO7bV2ha+GgyOtOtGcm0e-knYCRZCMteu5g@mail.gmail.com>
Subject: Re: [PATCH v4] mmc: host: sdhci-msm: Add support for wrapped keys
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, ebiggers@kernel.org, abel.vesa@linaro.org, 
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	TAGGED_FROM(0.00)[bounces-89987-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,linaro.org:dkim,intel.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: AFEAD55767
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 19 Jan 2026 at 11:19, Neeraj Soni <neeraj.soni@oss.qualcomm.com> wrote:
>
> Hi,
>
> On 1/12/2026 12:35 PM, Adrian Hunter wrote:
> > On 02/01/2026 14:40, Neeraj Soni wrote:
> >> Add the wrapped key support for sdhci-msm by implementing the needed
> >> methods in struct blk_crypto_ll_ops and setting the appropriate flag in
> >> blk_crypto_profile::key_types_supported.
> >>
> >> Tested on SC7280 eMMC variant.
> >>
> >> How to test:
> >>
> >> Use the "v1.3.0" tag from https://github.com/google/fscryptctl and build
> >> fscryptctl that supports generating wrapped keys.
> >>
> >> Enable the following config options:
> >> CONFIG_BLK_INLINE_ENCRYPTION=y
> >> CONFIG_QCOM_INLINE_CRYPTO_ENGINE=y
> >> CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
> >> CONFIG_MMC_CRYPTO=y
> >>
> >> Enable "qcom_ice.use_wrapped_keys" via kernel command line.
> >>
> >> $ mkfs.ext4 -F -O encrypt,stable_inodes /dev/disk/by-partlabel/vm-data
> >> $ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
> >> $ fscryptctl generate_hw_wrapped_key /dev/disk/by-partlabel/vm-data > /mnt/key.longterm
> >> $ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
> >> $ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
> >> $ rm -rf /mnt/dir
> >> $ mkdir /mnt/dir
> >> $ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
> >> $ dmesg > /mnt/dir/test.txt
> >> $ sync
> >>
> >> Reboot the board
> >>
> >> $ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
> >> $ ls /mnt/dir # File should be encrypted
> >> $ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
> >> $ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
> >> $ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
> >> $ cat /mnt/dir/test.txt # File should now be decrypted
> >>
> >> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> >> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> >
> > Doesn't apply cleanly to mmc next.  Otherwise:
> >
> > Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> >
> Is this a blocker for the patch to get merged? I will anyway see why it is not applying cleanly on mmc next
> but wanted to know if this is necessary to resolve for these chagnes to get merged in Linux-next?
>

In some cases I decide to resolve the conflict when applying, but
there is no guarantee that I do that, especially during busy periods.

In this case, I prefer that you re-base and send a v5 please.

[...]

Kind regards
Uffe

