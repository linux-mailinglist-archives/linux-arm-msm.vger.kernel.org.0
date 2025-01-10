Return-Path: <linux-arm-msm+bounces-44714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EADE7A08A9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 09:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16B5A3A8BC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 08:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1222207E19;
	Fri, 10 Jan 2025 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oqhdcaDh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82E42080DB
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 08:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736498663; cv=none; b=YmguxPC61+1JH/hXb9mIK+zuTDcc4XkabR1ArH8eGYid7ki8aGlMmTG+DSSw1pUrAO6ej5R4ju/B1U37iMQHJ+D/0X+sr7IoQuKd+wjOJdx5gzMms91zudanIC8R+H9aiimqX6gOZ2OrT8/5Rn77Pqd7oHe/AEMippliEKCRpX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736498663; c=relaxed/simple;
	bh=bcs5XrixjJuICcKrOi0QLiwMCzGybnpSV1jIYpcaEdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQKa9wsV9S/us7F+c2UZ2mGkGbGP3ioCRNP4liEQLnxZITNRQzaKK9RdJrwJ2uk0K9E2S7WAP4BUIL++H0+YpT7x5ebBVCSErK75NdPKksW5YGwkaVl/RFNdqvnHEv/sD77POS0583OinEG9RQa3aCa9CO12aWvevfZCCtnE7TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oqhdcaDh; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-540215984f0so2005894e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 00:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736498659; x=1737103459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3J6ybie5MZTohAU5zO4AHtHmlS6SVT///Z6RnwOTF0I=;
        b=oqhdcaDhpg7uKVN/GIznd4jiSK2ORwiXk9h/zpw9FR245bEuGdgGwuv+iH7nlP+B8m
         9zSJy/VKhvJMc6ppvhGlbHo0DpM4g+sUf+393Z8NQE5l644lXXhX/hc02MoRYreuPbqy
         1r7QVc8llQBVdCfRPVAL+k/Y9s9TGUl8HgbN9u680Qy4aSKB90ejT4XD+RT9i7blL+NE
         cGP+WYt29uNl4d9Gw2WB4t37qzpLJXDzmBUYGtIqQZ/70PnLzFAUzfmBXAjKu9Q09iGx
         +l7IMfhAkeuAw4F38csY9kRhSxRMk/6yUGsObLAkdEDRMnEffvi9RyOJf1veWr4qfHlw
         KPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736498659; x=1737103459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3J6ybie5MZTohAU5zO4AHtHmlS6SVT///Z6RnwOTF0I=;
        b=e087bLqNH5r+G1A8EVbq16sdVCT44x+dPrDZeUN/YyO5yoOkL9oSGovuwpxrHuVIGi
         KuIcvf5hi+QgVH4KWyepSaa5Q3Gez1JqS/vBAhZdhL7Uv/V8lEUO5aEDpri2pa6WEmaJ
         hXSm5KFmIVGaw4Z9ZOEbPE5SBU3mxt4eFKlvTbBnR0o6myH/GMhuF+CExq8Rc9UjJwSq
         jsbe1PvRqlqum/YLsyJHyUaQd6iRsRDpLyv5QSx/baumiF3LTkjZAwgnLbFT0SAh0PTV
         0sq8OMYa+LfoF2v2bZnn/fgCt6y/4tvWqS6ihrOllHleZ2RA938QgtU4wJRtBAv85gMS
         LMKw==
X-Forwarded-Encrypted: i=1; AJvYcCXPYgeOjba7OvUxc4nR5i4M+TneEH6+FOJtcj00mP6y0F0pEZlVoITyLMcJZhbNEYQg7Ysou5vxnTwnAtEg@vger.kernel.org
X-Gm-Message-State: AOJu0YyFCUEjr53UZnazbZkdMN6zrWt3EZUVsnDKKr29xNwgKfTCQGfk
	Vjhxd0/hYab2DB0/V1q8udPTmD45sHPcW34vo3dR2QFIKVLvDDeYTTu6hCL5fqtN9zpnI+ZLs2x
	8Ho5SbvVRL1Qm7DVJ/z1O6C5VbZMl6LUAKe/PGA==
X-Gm-Gg: ASbGncsvsdNPsc/tszlHGUiGJ9d5jtRkCg1wq9GmXZ3qn+45Q98BeX4mjh3U7f3p0Oi
	/fR5/mcB/uSHDra4a7kA/QY9qvYbrLWaxrFKDO/yFusZayuV/Em20HBIDjKwga4SMf3sV
X-Google-Smtp-Source: AGHT+IEyB2cuChMeX1r+nZtaJdP6Mzdmo0n9PGPsFhkwAW7ukTnXjzzz9a+MUocObbefl6A9T2AxU0IqAEz7Wjzjkhg=
X-Received: by 2002:a05:6512:2399:b0:540:1ea7:44db with SMTP id
 2adb3069b0e04-542845b1aedmr3480546e87.4.1736498658964; Fri, 10 Jan 2025
 00:44:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213041958.202565-1-ebiggers@kernel.org>
In-Reply-To: <20241213041958.202565-1-ebiggers@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 10 Jan 2025 09:44:07 +0100
X-Gm-Features: AbW1kvYIJl4nVvnVQIFwQlGZKMe8mAAA_MH2MqnfAcbAm7yp2J-zmj2cn1w9I5U
Message-ID: <CAMRc=MdeZ_k9z+ZKW1ub0m9ymh3eABUU7ZRPY9TYHM_fc+D+qQ@mail.gmail.com>
Subject: Re: [PATCH v10 00/15] Support for hardware-wrapped inline encryption keys
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Gaurav Kashyap <quic_gaurkash@quicinc.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Jens Axboe <axboe@kernel.dk>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 5:20=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> This patchset is based on next-20241212 and is also available in git via:
>
>     git fetch https://git.kernel.org/pub/scm/fs/fscrypt/linux.git wrapped=
-keys-v10
>
> This patchset adds support for hardware-wrapped inline encryption keys, a
> security feature supported by some SoCs.  It adds the block and fscrypt
> framework for the feature as well as support for it with UFS on Qualcomm =
SoCs.
>
> This feature is described in full detail in the included Documentation ch=
anges.
> But to summarize, hardware-wrapped keys are inline encryption keys that a=
re
> wrapped (encrypted) by a key internal to the hardware so that they can on=
ly be
> unwrapped (decrypted) by the hardware.  Initially keys are wrapped with a
> permanent hardware key, but during actual use they are re-wrapped with a
> per-boot ephemeral key for improved security.  The hardware supports impo=
rting
> keys as well as generating keys itself.
>
> This differs from the existing support for hardware-wrapped keys in the k=
ernel
> crypto API (also called "hardware-bound keys" in some places) in the same=
 way
> that the crypto API differs from blk-crypto: the crypto API is for genera=
l
> crypto operations, whereas blk-crypto is for inline storage encryption.
>
> This feature is already being used by Android downstream for several year=
s
> (https://source.android.com/docs/security/features/encryption/hw-wrapped-=
keys),
> but on other platforms userspace support will be provided via fscryptctl =
and
> tests via xfstests (I have some old patches for this that need to be upda=
ted).
>
> Maintainers, please consider merging the following preparatory patches fo=
r 6.14:
>
>   - UFS / SCSI tree: patches 1-4
>   - MMC tree: patches 5-7
>   - Qualcomm / MSM tree: patch 8
>

IIUC The following patches will have to wait for the v6.15 cycle?

[PATCH v10 9/15] soc: qcom: ice: make qcom_ice_program_key() take
struct blk_crypto_key
[PATCH v10 10/15] blk-crypto: add basic hardware-wrapped key support
[PATCH v10 11/15] blk-crypto: show supported key types in sysfs
[PATCH v10 12/15] blk-crypto: add ioctls to create and prepare
hardware-wrapped keys
[PATCH v10 13/15] fscrypt: add support for hardware-wrapped keys
[PATCH v10 14/15] soc: qcom: ice: add HWKM support to the ICE driver
[PATCH v10 15/15] ufs: qcom: add support for wrapped keys

Bartosz

