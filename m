Return-Path: <linux-arm-msm+bounces-83248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 671C1C8509E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 13:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67B233B235C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 12:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D076320CC3;
	Tue, 25 Nov 2025 12:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vEYj685I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFD72D8363
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 12:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764075393; cv=none; b=VZK3GF306NoVn+64D5ioS3SJ1MvKlqe4DBd6QwGhjGvtMMID1Tpmzs/lHDvMjAMXDJ3JgiqW1HIO2zMd+Hjonj9KnY9Lepiv6uWOclihq2G5612O+nzxsbknPMKx3jGrGJrqHG2F48tojQp2Cf6bSGZetpq3U07E3KJzHs2CbZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764075393; c=relaxed/simple;
	bh=Sk8TWnE1F8njHDuPB8T3xn5YhJaDrvsH8twkDSYX9cs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RnGvlIiAZpdBfYiL0DKfgdtXelblaXewV89aEDaSKP1yH0Hu00Ss8usUiZLA9pbLEOeuPv++dNUM30yMV+vtmzXHmTAh8BLX0Qg2SIfbEF05/AwwDLL8ynO+x3bt86iD+4GcZ8I7EKM98fx4Yt3svNr7SvOrOJhdQq6zBBNbiWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vEYj685I; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-78aa49cde3dso22425417b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 04:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764075390; x=1764680190; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1nHAj4MBf6Hp5nlwpLkFtoHhFG7K6iNmZXaotwtFzZM=;
        b=vEYj685I7p9arzIuZRJ+yQGgt739jfUQzEIBUfKG1rI7uj3W02os6hi/cWEkPS8Qy3
         27sPnm9PHJyhSoh80ffamJUm/XLOtML/I8mlszUMzEeb4R2LRb0AzRHF/VLjNzQBprxw
         iyRp6CAykHfQTe8pyjmPR5+qPaZsdH6Bbse0nDreHFzDfc/iT8Cjso+F8s92oTrefJId
         8wPrXPCnw+YJal/qT+eZRhA6HGQ6l6AJcZgBclJVMH0Uw371CgXQhvrfiguXS/VFGMHi
         H2nXDMXf3HuUEm2Wj+KheirceE150ssGO/LYU0tUWYjWJu5RJZe/5wKcymFRDlqbfDyG
         IIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764075390; x=1764680190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nHAj4MBf6Hp5nlwpLkFtoHhFG7K6iNmZXaotwtFzZM=;
        b=CCEhKuEixGe7MLdm7j2KKchgsKit3yYvGxXa+z27DEtTghLZ+B4odPuCOGiFi9Ie4b
         0A4Su5GLUqFMZLl3hpgUwMn0cBcSHuGq+7D7a8da5L29mZHeS+1YteLOsuwmQxx7bbQh
         mfUWWgb2HcLakSSpSlF5Bbt2F5Ba8oPuQOCkwLKWoJ3F2j3jYQ/ptSIyVBqNbDDMY9gk
         q0l2/1Z2Qz7YCWIeGdEPHnWDOYIsTZyjkiRGMM8npHw89zDhCV0DcAvoWEOeBaq7cSHs
         lUM4a4NXkithpCpK1DDiCmSd66j/5jiN2s18pNSY4ha92pBmZEFUxqdPEgwhrUhiSgBJ
         nxwA==
X-Forwarded-Encrypted: i=1; AJvYcCVAA+E1DlMl7LTpXWsFax8USoOkQEUhdEp6mwAGnbWe4haVzjNyp+whD2jM8S4SUZqDZ3VrMshT64pXbgFu@vger.kernel.org
X-Gm-Message-State: AOJu0YxDkBf4eSixh0eJfHW63rcHdoi0z0LT4nNh4wB0OoXGno+n5jEC
	3tRTWYDtwO99Qw61TFkS93KJwbpPhsQsyB7ivnzR5GWc1kNu1Kv+ZVAZHo0NkNDsgxwtPZKXYH7
	0j4F6zd33ebr+KqkKNZU2UhJZD7/jX4DzdhgHuBWS6/h40H237bGh
X-Gm-Gg: ASbGncugFcIb0TyNafSRCgzKppReHv9S7QsILeyUI5FnHv41Sz3+JAqsGh4Igw4nsPu
	3nt+BnmEEgW7Y2BzsX9Yh6sgepSn106fh5fBqSjoWIJ4u4f91D15wvFBXTZLLkq5S4JzSMRvrLt
	yP1hXYsZyrsOUKegO+Hjg08Niu1MR5Y6k/om6hNZh1mvFaf771R5w4/LI9MoGBofDmYEarNxWxv
	/GHRIvN4VOXMGQ4w/WsSXfOGgV9/WT+WJYDIfW23e6ua88qQkCQ40XdJft9GWL+fYiF4XTjY4/e
	OA4GHcc=
X-Google-Smtp-Source: AGHT+IH/p+RtR6M/oxT287AHNkeQ1hbGCodsY5CHH3YFQPKesxn30gwm0wpRAVMXcD4lqQN/Zs5GZPeC84DFD074Hm4=
X-Received: by 2002:a05:690c:74c7:b0:786:5499:634f with SMTP id
 00721157ae682-78a8b525dcemr119304847b3.41.1764075390368; Tue, 25 Nov 2025
 04:56:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124112908.3193211-1-neeraj.soni@oss.qualcomm.com>
In-Reply-To: <20251124112908.3193211-1-neeraj.soni@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 25 Nov 2025 13:55:54 +0100
X-Gm-Features: AWmQ_bkNGbp0sdGlVhqlYzK6csz9kqff9YvYTFYI-n19jTeHRLOi7kIWRZck88c
Message-ID: <CAPDyKFpOuwofFGTEqkCUDXLRJ90vEypkrtg+f01KY5S=cW03Wg@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: sdhci-msm: Add support for wrapped keys
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: adrian.hunter@intel.com, linux-mmc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Nov 2025 at 12:29, Neeraj Soni <neeraj.soni@oss.qualcomm.com> wrote:
>
> Add the wrapped key support for sdhci-msm by implementing the needed
> methods in struct blk_crypto_ll_ops and setting the appropriate flag in
> blk_crypto_profile::key_types_supported.
>
> This is a reworked version of the patchset
> https://lore.kernel.org/all/20241101031539.13285-1-quic_spuppala@quicinc.com/
> that was sent by Seshu Madhavi Puppala.
>
> My changes rebase it to use the custom crypto profile support.

Part of the above is good information but doesn't belong in the commit
message. Instead make them part of the patch-information below "---".

>
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

Please add Eric Biggers and Abel Vesa for any changes related to ICE.
At least, if they have the time we would appreciate their input to
these kind of changes.

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-msm.c | 51 +++++++++++++++++++++++++++++++-----
>  1 file changed, 45 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 4e5edbf2fc9b..351f2a77068b 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1911,11 +1911,6 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>         if (IS_ERR_OR_NULL(ice))
>                 return PTR_ERR_OR_ZERO(ice);
>
> -       if (qcom_ice_get_supported_key_type(ice) != BLK_CRYPTO_KEY_TYPE_RAW) {
> -               dev_warn(dev, "Wrapped keys not supported. Disabling inline encryption support.\n");
> -               return 0;
> -       }
> -
>         msm_host->ice = ice;
>
>         /* Initialize the blk_crypto_profile */
> @@ -1929,7 +1924,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>
>         profile->ll_ops = sdhci_msm_crypto_ops;
>         profile->max_dun_bytes_supported = 4;
> -       profile->key_types_supported = BLK_CRYPTO_KEY_TYPE_RAW;
> +       profile->key_types_supported = qcom_ice_get_supported_key_type(ice);
>         profile->dev = dev;
>
>         /*
> @@ -2009,9 +2004,53 @@ static int sdhci_msm_ice_keyslot_evict(struct blk_crypto_profile *profile,
>         return qcom_ice_evict_key(msm_host->ice, slot);
>  }
>
> +static int sdhci_msm_ice_derive_sw_secret(struct blk_crypto_profile *profile,
> +                                         const u8 *eph_key, size_t eph_key_size,
> +                                         u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
> +{
> +       struct sdhci_msm_host *msm_host =
> +               sdhci_msm_host_from_crypto_profile(profile);
> +
> +       return qcom_ice_derive_sw_secret(msm_host->ice, eph_key, eph_key_size,
> +                                       sw_secret);
> +}
> +
> +static int sdhci_msm_ice_import_key(struct blk_crypto_profile *profile,
> +                                   const u8 *raw_key, size_t raw_key_size,
> +                                   u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
> +{
> +       struct sdhci_msm_host *msm_host =
> +               sdhci_msm_host_from_crypto_profile(profile);
> +
> +       return qcom_ice_import_key(msm_host->ice, raw_key, raw_key_size, lt_key);
> +}
> +
> +static int sdhci_msm_ice_generate_key(struct blk_crypto_profile *profile,
> +                                     u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
> +{
> +       struct sdhci_msm_host *msm_host =
> +               sdhci_msm_host_from_crypto_profile(profile);
> +
> +       return qcom_ice_generate_key(msm_host->ice, lt_key);
> +}
> +
> +static int sdhci_msm_ice_prepare_key(struct blk_crypto_profile *profile,
> +                                    const u8 *lt_key, size_t lt_key_size,
> +                                    u8 eph_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
> +{
> +       struct sdhci_msm_host *msm_host =
> +               sdhci_msm_host_from_crypto_profile(profile);
> +
> +       return qcom_ice_prepare_key(msm_host->ice, lt_key, lt_key_size, eph_key);
> +}
> +
>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops = {
>         .keyslot_program        = sdhci_msm_ice_keyslot_program,
>         .keyslot_evict          = sdhci_msm_ice_keyslot_evict,
> +       .derive_sw_secret       = sdhci_msm_ice_derive_sw_secret,
> +       .import_key             = sdhci_msm_ice_import_key,
> +       .generate_key           = sdhci_msm_ice_generate_key,
> +       .prepare_key            = sdhci_msm_ice_prepare_key,
>  };
>
>  #else /* CONFIG_MMC_CRYPTO */
> --
> 2.34.1
>

