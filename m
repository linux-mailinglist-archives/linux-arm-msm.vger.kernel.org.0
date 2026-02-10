Return-Path: <linux-arm-msm+bounces-92511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wN90NZM2i2nyRgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 14:45:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F7611B5ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 14:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A796302EE9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7CE32A3CC;
	Tue, 10 Feb 2026 13:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vw8WzPB0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6B6329E77
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770731074; cv=pass; b=fHaVz/ataRJ4BXf6qant2kt4Z9cD8HoKhqUxJa7jM7l9HNkSIrlP/+cSx3UXKK46U5W1Mm16qMtnjyhCmnsYjART0oOV8kHpLfLhFRyZApSEgeLLfUdWAtCbe84THmgdai3FrZVtz/yHOb5MBiKC1SF/3D5GmP0T+ygHuB/u1Dg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770731074; c=relaxed/simple;
	bh=My7H0zv9om6eGFOqwrY8WEQgO1PL3LXVOyrjI3ZQRjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g3JASjYJm9cbQBhaL3JwFscgZ+bnZVdgBzwxscACB3buvqeQaP3TeOJB7qb864DZYquwhz6YI96mIr1Nz8eOUT6QG7Eu3eTgP59Pd7ZZkluGN3rwUVdGQ1wBbnZJP8IO9RcsVHclb90m0OF9w6QUpy/A92Vb14LrqrLTDo2OMv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vw8WzPB0; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64ad8435f46so3372014d50.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 05:44:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770731072; cv=none;
        d=google.com; s=arc-20240605;
        b=GIgNNOp9Smwz2N8d5yi28SKEKtRqHgAxlockZFEoVo5FWj05pa7SHZEXl+6/1TIdZu
         Aa7lXQ02Bqcuugj1wSHk8ylv7jRsOQGFUiEAlK4QdTOojPX1i6Vv1M5kQlWZwCAEWH5k
         Qqo49rpbNroub1J/NUiuHBupaW2DGmEIDH0Fzpgz8VS1QdsZQknW+XyrZAeb9H+E1Muk
         p3aokFNhnSwHkQmPtykopRkNXXsXh6/mz+wknOs3FqFXbmfQh3UNn1zrrzA7NPa05mey
         mGamCmjnbHSKBeo64Hq81gnR/I+j2BKmJXa2K4izzaFg3M8m2s6loNKiGLIySq72nQAm
         KPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cO0B8QPhPo0Y3GlbKCDusifXNzaiAeSd4InIZCnguwY=;
        fh=KLoEGf5fAhWtnEk4MVCzHMRXOXh7bddlt4ZWvLwoL24=;
        b=Zitr15k59Edq95RVgbELNSzZJ1ad7B9tLn0R5LZDR01hjsvO4O2oNDEa5OpbhtgiDB
         zW+Nybx9UD+YA9Oo7Dh+NZGlSatnXLrq2WghqorfxpvIoNsIbHPGW6WPLhnOZgdY2DMd
         RYqu3T6anXQLopbLMSfr0YLt2WrzZ+CNfQg9uUrXRUBEFaZqL0oTuZnTUIHNdcQ3t7BN
         WHrzncv0bQEVCnl7ULxIaMHnMmwFaxuLyFk40bW32XCeUww+saWn/CKlvJAw4AsYzrgW
         Kl/Nf+yybyCO2WRkIU4gJD2zyipXEkdk/mVPQDBxz+qbQkR8v6Ku/pcF80HyoGBqbNXn
         Fc4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770731072; x=1771335872; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cO0B8QPhPo0Y3GlbKCDusifXNzaiAeSd4InIZCnguwY=;
        b=Vw8WzPB0oLcYWhtQSx/BjgeR0IIJffAqCy/AtF/PqSjkoeWAJ3MPMv1QGab0EKCEJp
         hYOrRYbpzrt0KLCPL8dv2ImW+w3GICWzj0n+MLSB8F4DaPx0w3X9pqcj/75b/SrDmK+0
         dS6JJILoKeKUQwgO44dPaUMEmOtfdsgxTXuM9w/SFYfhDEhVXbdIppsVZ474fE4EH5z8
         W5tQMD6yyOGACdGI2sBNuBPlvNFy1h5C8ojSZJ9FMMJx7l2OTuwjy/VDX4yB7L05G2NR
         AU1NqixA2Lis3AnkTkzixffUUqPnjIMvk9NfWEWDvDQciQRcfQzdH3t2uFPeYph0ihxZ
         tAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770731072; x=1771335872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cO0B8QPhPo0Y3GlbKCDusifXNzaiAeSd4InIZCnguwY=;
        b=GWXbBeFHJwArENU9qlqaoLIfqr294isMjyovAcMOs68/L8a1zorJENH0UqFyKksPWU
         xZi4+ZcBkxSd3BJt8qOdiQNn870/HlBz2Nou8Th1U5zP0Nr4t+DNihK9SrVD4ujjeC9S
         9CkDQjglPANP1xNkHZLVYNn7+NUI9rNyrCPOwq4R3Veim4nN94MCk2BYFsY3e1YGdvBV
         3Fks8HkRdajg7WBKq3ibLUeUHVccgYX4QJDfTpkuRHdcaffSf4XbyCuyA4O1Knh5ufG2
         D1XjMsGH+2bnQVeTDoxlicwwjtQMxNsdJ61P2e0LEo5VS/2HqcbDbiZ2wV14h5cVNuaX
         wO4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzI+9HsxExiqKvA8PV8bL4gXOjvCaqK2kWZ70WB1cXmuzhy/sjDt/Ruk0T59ATDcLwuAKSJclvIhEsVngF@vger.kernel.org
X-Gm-Message-State: AOJu0YzlRa5b/3Dsn7OtJZKUrrv4UKHXLInhR8zECqDNMyv12n0gDyM4
	QbYiyY4t01aKgpvAGxR2ye5T4oVW1sOy/JGEMyXSyclOqrwBdYys8O9Pu3u3wqhKjmlEtHvqF50
	Ts1SkLR9a9RtjyIxT06mCpVyWEcAk4mMhZNn+w0+9rg==
X-Gm-Gg: AZuq6aKtBNV6W2jdothHXEW9Wia2Z3x275kwe/9QKICKFanWRpAuJ9e+Qo+rzJC5sWm
	aK0j98wbPdS1YYMDxVqv46GBfyxUlfs69TvBHtEb2xoQNtPyx94zTXVw9HirABdtA8nlglQKiJe
	Vvdd8YAUWDVEiY/d5kUxyQINQotNDcUoA1k9h767qkFZ0nVq+TwcVQT4kse+fi+NWSVL4RwlTq4
	K93vQJiXnPAnv+beAehmYN4niLHnJg12up9jcTK+3Awo7S3ZPBQhYq1HxQBTx/cXdye8WvZC760
	L8xqPb/l
X-Received: by 2002:a05:690e:b4e:b0:64a:f188:976f with SMTP id
 956f58d0204a3-64af1889b6fmr1730648d50.45.1770731072184; Tue, 10 Feb 2026
 05:44:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210-qcom-ice-fix-v2-0-9c1ab5d6502c@oss.qualcomm.com>
In-Reply-To: <20260210-qcom-ice-fix-v2-0-9c1ab5d6502c@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Feb 2026 14:43:53 +0100
X-Gm-Features: AZwV_QhTZ9KRaRA5GTHx4N22K6Lp6hSICHstQ6937DBI5S-nFi13iuFlfu6mtC8
Message-ID: <CAPDyKFocm3yRTG0TJJRxfDvJMjvvvri5fzi_HoNY4YSd-41oKA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] soc: qcom: ice: Remove platform_driver support and
 expose as a pure library
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>, 
	stable@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92511-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Queue-Id: 33F7611B5ED
X-Rspamd-Action: no action

On Tue, 10 Feb 2026 at 07:56, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> Hi,
>
> This series removes the platform_driver support from Qcom ICE driver and
> exposes it as a pure library to the clients to avoid race conditions with ICE
> SCM call availability.
>
> Merge Strategy
> ==============
>
> ICE patches (1,2) through Qcom tree and MMC/UFS patches (3,4) through respective
> subsystem trees as there is no dependency.

Just wanted to double check that this is really correct....

The propagated error codes (or NULL) are changed in patch1/patch2, so
is it really okay to pick the mmc/ufs patches (patch3 and patch4)
independently?

Kind regards
Uffe

>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> Changes in v2:
>
> * Added MODULE_* macros back
> * Removed spurious platform_device_put()
> * Added patches to remove NULL return
>
> ---
> Manivannan Sadhasivam (4):
>       soc: qcom: ice: Remove platform_driver support and expose as a pure library
>       soc: qcom: ice: Return proper error codes from devm_of_qcom_ice_get() instead of NULL
>       mmc: sdhci-msm: Remove NULL check from devm_of_qcom_ice_get()
>       scsi: ufs: ufs-qcom: Remove NULL check from devm_of_qcom_ice_get()
>
>  drivers/mmc/host/sdhci-msm.c |  10 ++--
>  drivers/soc/qcom/ice.c       | 127 ++++++++++++++++---------------------------
>  drivers/ufs/host/ufs-qcom.c  |  10 ++--
>  3 files changed, 58 insertions(+), 89 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260210-qcom-ice-fix-d2a3a045b32d
>
> Best regards,
> --
> Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
>

