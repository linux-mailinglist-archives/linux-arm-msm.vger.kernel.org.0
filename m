Return-Path: <linux-arm-msm+bounces-99321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPTtIh1dwWlZSgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:32:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFF92F6737
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C30053118F9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B2F3C13E2;
	Mon, 23 Mar 2026 15:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xUign3uQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4536327FD6D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279006; cv=pass; b=b1XTXxMxBgzdCuG8FdQMhXGK4+dOQwK9kPpP3KenW1IU9mJW1MRvL6/6bE+WP0jjfPJYgb1n+wp0tKm4a+dRAZ82V7JD35eyFqydS3f2zLomtUZqviEI12n/uTsR8QleTs9mNhdkILktDG1VZQl4ILIRismVPeRo9gfyjY6R7XM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279006; c=relaxed/simple;
	bh=836gBfI+o/qQj9Wm80ZiXK2Z8hCWuoDNwqZBhWEi0ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jF5426ieTXoaegG7L8zraaqTIq1dpuP/utohDwu0wETQU0Hnj3XIW7Nnf2Eg329oAz8uvyfRy33XeTYb8+Qolpg334UivEFpapAkxuZo8s+wWhJ1e/puIOcVCDXC0xWSC3ZUx7iRDfZ0JKDj4pe/mnfkn6iZfwxIAu/n4IJ5dMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xUign3uQ; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a159c1e65aso2529130e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774279003; cv=none;
        d=google.com; s=arc-20240605;
        b=dHKu2sJfgOtJqrM857lgc0GEeN+5SF++17ycg8NGNbl67BAmU41tUYWWyI5O1Nna6J
         pYfeS7iAR2IpDWVhdSYiPGNveTGc2XO+0xnDR/Y5eG8pbZ4dR3wYqUClwC7iWn2s+2Fw
         sD+mpzTouz/miie+8jxOQMBfflj0Elve1Xiq820BGkFgPdBsyhxDWDDtZ1fbimSXIAYZ
         HFnQNrQ/DxShWRk8lc4hwrm3ZhWtRaHJOwoOjg152FLKoT0hkmtUJuyK5Fdf1o0uRSFX
         6W6CYtHYz7xyX+Z7lUNqwxmEyC2qW8TRRUpJ+lI2xwwE0CUdJNzNtpTikUOgHJX2ETiD
         FjSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PiJLdQFlhIlU3UWbgyoh9CEcw5ImMs6weAHGhpFVB4g=;
        fh=w/yyzW6yOfKBQey7MN5NjDdLQMGHT908Owhc+XyotGY=;
        b=eu+jZVm1FOAwwNmzBn+UaqNnsXWhYxI2iQ+4oIzxTdiv0ui/Ak5dcK3SNVKmifoNoW
         J2qvqF69R9JqiK5XSy/nu1dkShREHuOtm2NjAPq5EfNRPTZZQVe2HArWUDNPL14hsL+I
         G9Jvto37srgiTtfSXGnnwEut69cJxgoV84+Rx42baw/E1Zl5d8wG8eCrGz3SdnyiojSK
         5A28LpK6j1PA1JM8tzqyVYw6msbFFmZBxEQ74k3Tp3/uyfDVGxbnDTI++Tt3LEPAM3bL
         kg9wqdWUwKo1Izv7sKhSLuwbNGZU4OUpckVaCOhNcis8nhAdXcpMLgHleSKhxfpgxbmW
         675g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774279003; x=1774883803; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PiJLdQFlhIlU3UWbgyoh9CEcw5ImMs6weAHGhpFVB4g=;
        b=xUign3uQsneJLCtbdzdUiskjnLzlZTifP2G+Mg+7uM9suvKQBVU6Z8F9LP5htvB6aC
         LuujxyVSazHHp7EHcfaWXnJw87iKEFrOZR8Cb988nWgtVJnSWBB8Ta3xnUWNG9kXdSmn
         nKDzJ6p4DgfgrsZ5GJvri8HONqexZsSrkvwNgm9R7eNI24DG8a0wzjbM4vVBp1TAM10P
         viUxhwJaO4TRS3kxYrI9b19CHFmf7eKBhc8iuReIyTr5HoDfg7AgM4mMn5jxzY92LM5z
         ZMl61wiBWcVXwYco4HlAmxDDPz8bvG14aaz1KzfczEVL0ZExkdAF1m/B/ntnHDXepJ3c
         3HXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279003; x=1774883803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PiJLdQFlhIlU3UWbgyoh9CEcw5ImMs6weAHGhpFVB4g=;
        b=ONpAfHrwmnif1Wrm9hPrd8YMl9cWY2yuL5J8AxGRDOos+vi0PL8BkpR/ZYIFRa0/EV
         tHPndMggYWRuwCo3Q9MDRgaViKZ/1pJZfmYzpeOZ3AstJu+QjtGjnW64HfEOU2vDiTNz
         23Huy48ht8mKnlXDlLSEtWkUyswUinbDkmVzg3G9D/ZzZiqpQMH+kwOec1QlrmLh+EvD
         f2yV4LMJxGgg6rO0u8vKP5CmNqGk5AmrSbpzXNb40S/iUll7Y8oYmp8KrhA0kym0gXyn
         UhNxWljNY4SHHn5S27oycISkSxy50O+voNIKwGILAE+nJrEo1cZrBons6kXyjIxdTuLC
         znFA==
X-Forwarded-Encrypted: i=1; AJvYcCVmgOE7V+mciVzeY0I0anhPUm9ijgLynSCOV7t4nhw7m/NLH2/xBeg6fkySBh85oITsejSP9E/IRFGruRQa@vger.kernel.org
X-Gm-Message-State: AOJu0YwUuDxObBDSrJL3UQdZ4dbDf7QaUFb+aR+uVmPTQB4P3EjQMADx
	4uQd7Sl0VJqdunM/Fyn5VuzyQZE6/pSE1f0/LiX6t2jJrR3kxODwN7nM53HEu/oAbeUa4MiyyLX
	QPtZ6JTV+s03SogbLlNoHlPwiLS9R61vDItFhAtE/3w==
X-Gm-Gg: ATEYQzyVPk502cvJmaLuXU8fdm9OIIDiCurY7Axl5h8YA2hjn0bT4ELdC+MS/Q7kBr3
	O4vk3sHZsHswIzCfcm6uWBmpPjVfJWZEVXCKMx6uikf9FfW6enOx1LolnRxlRJnOA+A9t7ze5aW
	nf5LNkCHGXzGHsG/i9pWrfMWGVJJtdZP9RmWTp3CgnBf+k/eFbED7poiCQ1az+0+2BY2ZHcErWs
	w3M3P6kbRJqiYStXpGM9V++YAzmdPbfTQD85hD3rymaB3Y4CqOqZT7tqq0DGJzDTLqi5ufShCq1
	5X+lr3Si6bF0/HW/wss=
X-Received: by 2002:a05:6512:1388:b0:5a2:8513:8a98 with SMTP id
 2adb3069b0e04-5a285b03660mr3907173e87.5.1774279003114; Mon, 23 Mar 2026
 08:16:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313081548.3556577-1-neeraj.soni@oss.qualcomm.com>
In-Reply-To: <20260313081548.3556577-1-neeraj.soni@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Mar 2026 16:16:07 +0100
X-Gm-Features: AQROBzBFsi259UlzFHDI-rrUpPXTS-yTjb65_nNw5jK2htXtPesNWqWkUT8UrHA
Message-ID: <CAPDyKFqRG1_1aYavfrA0Ss85B0kcTnjVBeqLgq8PUJUcSx5LUg@mail.gmail.com>
Subject: Re: [PATCH v5] mmc: host: sdhci-msm: Add support for wrapped keys
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: adrian.hunter@intel.com, ebiggers@kernel.org, abel.vesa@linaro.org, 
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, wenjia.zhang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-99321-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Queue-Id: 2BFF92F6737
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 13 Mar 2026 at 09:15, Neeraj Soni <neeraj.soni@oss.qualcomm.com> wrote:
>
> Add the wrapped key support for sdhci-msm by implementing the needed
> methods in struct blk_crypto_ll_ops and setting the appropriate flag in
> blk_crypto_profile::key_types_supported.
>
> Tested on SC7280 eMMC variant.
>
> How to test:
>
> Use the "v1.3.0" tag from https://github.com/google/fscryptctl and build
> fscryptctl that supports generating wrapped keys.
>
> Enable the following config options:
> CONFIG_BLK_INLINE_ENCRYPTION=y
> CONFIG_QCOM_INLINE_CRYPTO_ENGINE=y
> CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
> CONFIG_MMC_CRYPTO=y
>
> Enable "qcom_ice.use_wrapped_keys" via kernel command line.
>
> $ mkfs.ext4 -F -O encrypt,stable_inodes /dev/disk/by-partlabel/vm-data
> $ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
> $ fscryptctl generate_hw_wrapped_key /dev/disk/by-partlabel/vm-data > /mnt/key.longterm
> $ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
> $ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
> $ rm -rf /mnt/dir
> $ mkdir /mnt/dir
> $ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
> $ dmesg > /mnt/dir/test.txt
> $ sync
>
> Reboot the board
>
> $ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
> $ ls /mnt/dir # File should be encrypted
> $ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
> $ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
> $ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
> $ cat /mnt/dir/test.txt # File should now be decrypted
>
> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Reviewed-by: Eric Biggers <ebiggers@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


>
> ---
> This is a reworked version of the patchset
> https://lore.kernel.org/all/20241101031539.13285-1-quic_spuppala@quicinc.com/
> that was sent by Seshu Madhavi Puppala.
>
> My changes rebase it to use the custom crypto profile support.
>
> Changes in v5:
> - Rebased on mmc-next.
>
> Changes in v4:
> - Updated the link for fscryptctl tool in commit message to "https://github.com/google/fscryptctl".
> - Aligned the indentation at few places.
> - Unwrapped few lines of code.
>
> Changes in v3:
> - Updated commit message with test details and moved "Signed-off-by" above the
>   scissors line.
>
> Changes in v2:
> - Updated commit message for clarity.
>
> Changes in v1:
> - Added initial support for wrapped keys.
> ---
>  drivers/mmc/host/sdhci-msm.c | 42 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index da356627d9de..b4131b12df56 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1944,7 +1944,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>
>         profile->ll_ops = sdhci_msm_crypto_ops;
>         profile->max_dun_bytes_supported = 4;
> -       profile->key_types_supported = BLK_CRYPTO_KEY_TYPE_RAW;
> +       profile->key_types_supported = qcom_ice_get_supported_key_type(ice);
>         profile->dev = dev;
>
>         /*
> @@ -2024,6 +2024,42 @@ static int sdhci_msm_ice_keyslot_evict(struct blk_crypto_profile *profile,
>         return qcom_ice_evict_key(msm_host->ice, slot);
>  }
>
> +static int sdhci_msm_ice_derive_sw_secret(struct blk_crypto_profile *profile,
> +                                         const u8 *eph_key, size_t eph_key_size,
> +                                         u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
> +{
> +       struct sdhci_msm_host *msm_host = sdhci_msm_host_from_crypto_profile(profile);
> +
> +       return qcom_ice_derive_sw_secret(msm_host->ice, eph_key, eph_key_size,
> +                                        sw_secret);
> +}
> +
> +static int sdhci_msm_ice_import_key(struct blk_crypto_profile *profile,
> +                                   const u8 *raw_key, size_t raw_key_size,
> +                                   u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
> +{
> +       struct sdhci_msm_host *msm_host = sdhci_msm_host_from_crypto_profile(profile);
> +
> +       return qcom_ice_import_key(msm_host->ice, raw_key, raw_key_size, lt_key);
> +}
> +
> +static int sdhci_msm_ice_generate_key(struct blk_crypto_profile *profile,
> +                                     u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
> +{
> +       struct sdhci_msm_host *msm_host = sdhci_msm_host_from_crypto_profile(profile);
> +
> +       return qcom_ice_generate_key(msm_host->ice, lt_key);
> +}
> +
> +static int sdhci_msm_ice_prepare_key(struct blk_crypto_profile *profile,
> +                                    const u8 *lt_key, size_t lt_key_size,
> +                                    u8 eph_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
> +{
> +       struct sdhci_msm_host *msm_host = sdhci_msm_host_from_crypto_profile(profile);
> +
> +       return qcom_ice_prepare_key(msm_host->ice, lt_key, lt_key_size, eph_key);
> +}
> +
>  static void sdhci_msm_non_cqe_ice_init(struct sdhci_host *host)
>  {
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -2089,6 +2125,10 @@ static void sdhci_msm_request(struct mmc_host *mmc, struct mmc_request *mrq)
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

