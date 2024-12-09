Return-Path: <linux-arm-msm+bounces-41118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8909E99DE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 16:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14F4D1674F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 15:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005041798F;
	Mon,  9 Dec 2024 15:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aoXCH3sx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E981C5CB8
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733756434; cv=none; b=oxWMvbTEBG0Pa5zFGKxuXBAeMJzeTEiTrqt2XyGgcbgVn4hfbQjt7kcaoANKw5eow0uf/BliLAb2/uKmFOdkjq0+tn8dTMnZ3jShHSzIY2/kM9uiWWYsfGHWLJIU5QiZ94qCWaDFTpWIyocqmhukqjqkrxX21Sq0uKj57HKNRWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733756434; c=relaxed/simple;
	bh=gInSWd5MMgRSUDhcccm5xbE2Hvza006RfXp+2PMcT7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UP2rMAY/oKxt/w2Kd7nK4EcmaqVzi9B+khlxfblR4UBFM9+fiALXYjQXzhhfSS2Uf9JYQa21OIAna1Xs7jibr0aNBV9s1bGl3pZj/9uARjkkrU699THIEoya5vm0JXWuILBgTCr8UA20+jJsdrXnRrbgUv31aHE0RYZK7C+ASkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aoXCH3sx; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30039432861so27717301fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 07:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733756430; x=1734361230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViivlbqXyCtIkKHXArGajb/AAWt9vADZPoV9+phTFlo=;
        b=aoXCH3sxRISaxVLkB0NYkY2oPKmKDvGsDSvJGFupR3cllSb0XJenYVHF/Ef2xVfobB
         29OTF25OceH8nH3iPbveAXe78xJsSVt6mcpECQh8FNRJtDANUItmpgQECc1ny5TvdpyE
         b2usxrlPWDOJijVpVMbIwMgSezImRBXBzgSUCEcn+YMySVdOyflwibnoef1oRIupypNs
         J4n2rsuO2gT1VhTwOKZytD4DK0vxg/4QOVXLORHn8w2kBS+YPEfYJ3IpN24vHLK8BAAr
         9wmPJ7wspM2vqkDJS+vwyYoOAsG+/w2K85YtX9V5abLH7Dlq9UhAM6sKBfI8eaIuyd2S
         CssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733756430; x=1734361230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViivlbqXyCtIkKHXArGajb/AAWt9vADZPoV9+phTFlo=;
        b=ZGvjFUj3qkpAiE9W74Fw3Df5WQH25gXgnbo7JvDusi3XU8Kv+IXXNFhT/Dzh9809T5
         aYjm7HQCfNSecPUSQLXp3bg4bhYVAaX15Dxh2kyrK5Q9C2QeHFMx6akV4BJmWsFvhBqx
         LWsVVM7lVX7Cv8s1RUjoGfOrs7675ZvSTZk0kJQrmugJvlGxPmTgtcjzxi1v/w/lUB9U
         iZ4eo05wTXLUvHbgKlSfzz8rtNfGD9YBaCqTR/3FzjZWD7g0xT/uVXHVGQIvWr7tVeJJ
         yfu73hZHTgI2u7+JQpFtN4RDWXEtBc9Udl979C+R7s4nOY2u3QTVK64qKDWNlZDpMBYS
         MzaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfaLu/ARvPHmiQ9rRubWtVpEwAT5LHtEIN0SFGA3DzTSaBwpKggl3PSqZ85OAShs69wXk+r/IHXmD/jI27@vger.kernel.org
X-Gm-Message-State: AOJu0YzM7ZW2Y8xsfEtkfoSLlkEm7aTXk8JhR9kMN51SJCcw+V+A9eog
	6pQoNTprvPoVl7T5E4+Y/YwOvqCEGDcwcQrs2/Yt9ZSWnBad4aUAjknBTwhWvKRIxDbFWt7DD6h
	9Oxwz1VABUaJwBHv/xP+Li2/be+1K8nNd307gQw==
X-Gm-Gg: ASbGncvZwgVc/X6M9LJrhC67wVjVlQKamV8qBRQmK174KqpzAHKkvuf9p78EINtW8/7
	+Bhcl6YkPvROhAAVp2+NFaoFfiETH8X4zHx/4nlSybD6M9qDfBlf6rg7Ta6WYhmM=
X-Google-Smtp-Source: AGHT+IGGxxX04Cbn5rlonlQPpTX4R1IKg0lQHDiZvcFPtN+IOQ1z4+qoEWIFalB4udM1M5wmHyTfRxBaDGcpotYHS/0=
X-Received: by 2002:a05:651c:887:b0:302:2baf:6d14 with SMTP id
 38308e7fff4ca-3022ff81a70mr2237501fa.40.1733756429625; Mon, 09 Dec 2024
 07:00:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209045530.507833-1-ebiggers@kernel.org>
In-Reply-To: <20241209045530.507833-1-ebiggers@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 9 Dec 2024 16:00:18 +0100
Message-ID: <CAMRc=MfLzuNjRqURpVwLzVTsdr8OmtK+NQZ6XU4hUsawKWTcqQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] Support for hardware-wrapped inline encryption keys
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

On Mon, Dec 9, 2024 at 5:56=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> w=
rote:
>
> This patchset is also available in git via:
>
>     git fetch https://git.kernel.org/pub/scm/fs/fscrypt/linux.git wrapped=
-keys-v9
>
> This is a reworked version of the patchset
> https://lore.kernel.org/linux-fscrypt/20241202-wrapped-keys-v7-0-67c3ca3f=
3282@linaro.org/T/#u
> that was recently sent by Bartosz Golaszewski.  It turned out there were =
a lot
> of things I wanted to fix, and it would have taken much too long to addre=
ss them
> in a code review.  For now this is build-tested only; I've errored on the=
 side
> of sending this out early since others are working on this too.  Besides =
many
> miscellaneous fixes and cleanups, I've made the following notable changes=
:
>
> - ufs-qcom and sdhci-msm now just initialize the blk_crypto_profile thems=
elves,
>   like what ufs-exynos was doing.  This avoids needing to add all the
>   host-specific hooks for wrapped key support to the MMC and UFS core dri=
vers.
>
> - When passing the blk_crypto_key further down the stack, it now replaces
>   parameters like the algorithm ID, to avoid creating two sources of trut=
h.
>
> - The module parameter qcom_ice.use_wrapped_keys should work correctly no=
w.
>
> - The fscrypt support no longer uses a policy flag to indicate when a fil=
e is
>   protected by a HW-wrapped key, since it was already implied by the file=
's key
>   identifier being that of a HW-wrapped key.  Originally there was an iss=
ue
>   where raw and HW-wrapped keys could share key identifiers, but I had fi=
xed
>   that earlier by introducing a new HKDF context byte.
>
> - The term "standard keys" is no longer used.  Now "raw keys" is consiste=
ntly
>   used instead.  I've found that people find the term "raw keys" to be mo=
re
>   intuitive.  Also HW-wrapped keys could in principle be standardized.
>
> - I've reordered the patchset to place preparatory patches that don't dep=
end on
>   the actual HW-wrapped key support first.
>
> My current thinking is that for 6.14 we should just aim to get the prepar=
atory
> patches 1-5 merged via the ufs and mmc trees, while the actual HW-wrapped=
 key
> support continues to be finalized and properly tested.  But let me know i=
f
> anyone has any other thoughts.
>
> A quick intro to the patchset for anyone who hasn't been following along:
>
> This patchset adds support for hardware-wrapped inline encryption keys, a
> security feature supported by some SoCs and that has already seen a lot o=
f
> real-world use downstream.  It adds the block and fscrypt framework for t=
he
> feature as well as support for it with UFS on Qualcomm SoCs.
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
> crypto API (which also goes by names such as "hardware-bound keys", depen=
ding on
> the driver) in the same way that the crypto API differs from blk-crypto: =
the
> crypto API is for general crypto operations, whereas blk-crypto is for in=
line
> storage encryption.
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
> Eric Biggers (10):
>   ufs: crypto: add ufs_hba_from_crypto_profile()
>   ufs: qcom: convert to use UFSHCD_QUIRK_CUSTOM_CRYPTO_PROFILE
>   mmc: crypto: add mmc_from_crypto_profile()
>   mmc: sdhci-msm: convert to use custom crypto profile
>   soc: qcom: ice: make qcom_ice_program_key() take struct blk_crypto_key
>   blk-crypto: add basic hardware-wrapped key support
>   blk-crypto: show supported key types in sysfs
>   blk-crypto: add ioctls to create and prepare hardware-wrapped keys
>   fscrypt: add support for hardware-wrapped keys
>   ufs: qcom: add support for wrapped keys
>
> Gaurav Kashyap (2):
>   firmware: qcom: scm: add calls for wrapped key support
>   soc: qcom: ice: add HWKM support to the ICE driver
>
>  Documentation/ABI/stable/sysfs-block          |  18 +
>  Documentation/block/inline-encryption.rst     | 251 +++++++++++-
>  Documentation/filesystems/fscrypt.rst         | 201 +++++++--
>  .../userspace-api/ioctl/ioctl-number.rst      |   2 +
>  block/blk-crypto-fallback.c                   |   7 +-
>  block/blk-crypto-internal.h                   |  10 +
>  block/blk-crypto-profile.c                    | 103 +++++
>  block/blk-crypto-sysfs.c                      |  35 ++
>  block/blk-crypto.c                            | 196 ++++++++-
>  block/ioctl.c                                 |   5 +
>  drivers/firmware/qcom/qcom_scm.c              | 214 ++++++++++
>  drivers/firmware/qcom/qcom_scm.h              |   4 +
>  drivers/md/dm-table.c                         |   1 +
>  drivers/mmc/host/cqhci-crypto.c               |  38 +-
>  drivers/mmc/host/cqhci.h                      |   8 +-
>  drivers/mmc/host/sdhci-msm.c                  | 102 +++--
>  drivers/soc/qcom/ice.c                        | 383 +++++++++++++++++-
>  drivers/ufs/core/ufshcd-crypto.c              |  33 +-
>  drivers/ufs/host/ufs-exynos.c                 |   3 +-
>  drivers/ufs/host/ufs-qcom.c                   | 137 +++++--
>  fs/crypto/fscrypt_private.h                   |  75 +++-
>  fs/crypto/hkdf.c                              |   4 +-
>  fs/crypto/inline_crypt.c                      |  42 +-
>  fs/crypto/keyring.c                           | 157 +++++--
>  fs/crypto/keysetup.c                          |  63 ++-
>  fs/crypto/keysetup_v1.c                       |   4 +-
>  include/linux/blk-crypto-profile.h            |  73 ++++
>  include/linux/blk-crypto.h                    |  73 +++-
>  include/linux/firmware/qcom/qcom_scm.h        |   8 +
>  include/linux/mmc/host.h                      |   8 +
>  include/soc/qcom/ice.h                        |  34 +-
>  include/uapi/linux/blk-crypto.h               |  44 ++
>  include/uapi/linux/fs.h                       |   6 +-
>  include/uapi/linux/fscrypt.h                  |   7 +-
>  include/ufs/ufshcd.h                          |  11 +-
>  35 files changed, 2091 insertions(+), 269 deletions(-)
>  create mode 100644 include/uapi/linux/blk-crypto.h
>
>
> base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
> --
> 2.47.1
>

I haven't gotten to the bottom of this yet but the
FS_IOC_ADD_ENCRYPTION_KEY ioctl doesn't work due to the SCM call
returning EINVAL. Just FYI. I'm still figuring out what's wrong.

Bart

