Return-Path: <linux-arm-msm+bounces-102611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMkoHOq22GnnhAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:38:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C872E3D4315
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96FDE3081A08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 08:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB23318ED6;
	Fri, 10 Apr 2026 08:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="COoctWWO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295613AB267
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809891; cv=pass; b=Og+/HcANIe1VPF6jZunyhxDVekHfcPOTz2S1DRrsh7VHaaCqsSje/hLKKppPXNIdzfQA45aPFkMBEwWAfTwoJrwCtEaPy431LUSWv1B/CmMXYRqjlHVi6pFJyi3e59+pfoxZcgwxx01a1w/wD520nKLgKycJYTrLouWtkVmPCmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809891; c=relaxed/simple;
	bh=402Q/LEjsil+pHuLqlPEUXJ3L6aFG5rDH+20SRXqqw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/meaa+Qg2WAyWxAUVBrzHeaQuoJfe/SkXEIBO0GfqOON8AWPRzyqdfnRi/sKtMFHCr3HAhlF0PAJfWRaIgoYRfogijfgnq9FOZX+dJjIi+Y2xyinHKcfmwccfWDmRrNP7YCF2e1ImpRhsSE23rL+yHIO7IqWryeOlTyTl/1igk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=COoctWWO; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so1924586e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 01:31:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775809887; cv=none;
        d=google.com; s=arc-20240605;
        b=Wszo3n0VgVSXBKmtNK6yZg7Wr/N0nYrk8lLC7A9L48xPgGQDZLEK5z9oDGN4/NRUI+
         c1NZAZyBvEEf3w4wM0RQRy9cdlSD3+8x9NWnKlmU1XE15roM94Pyz1jgYa/MvCHl0Drz
         dkpYoQT6RcbJ/o0ePc8zaR4+QQ6TRjFmJ7pUo8wr2Stgm2nwkgKVWK1ikJiusxbkf411
         ScKJa0ipF7DDLsVSmnXDQRP866ZZM6DMTHLdwZFJkgjjx5VHf+HZ0gSRevwbYBgTeBP8
         o2QWWF5a90Aw6/CBRfbMy9xKPpRuGonDsvWS4tic07X5OX4MMUfrlxFG6uYtkN7i0+r5
         Vpiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KEJjrIfQId/h77djj7M4y4n3Tb/7Xj1HxO0kKsRBFF0=;
        fh=XGxob8f30nuNa/BMJqHH6AR1Koi6ylrdvdtcbZ7MbuQ=;
        b=jphFkkFnhu0hIzER4ga4gn2U8wz0qdJ0WNviam4Uu0/WwCb5w0rnRVtngCNiXtph82
         ZmbHhN3jaLnXYEG1BdKV0f7YEk571OOECTxEihRz9du+uYf5UGKArHXVUIzVIqquV2Pt
         5CJRmFk3MfkWOF7VnQ6vqrkg2TfoiumpphRXbQTFaenb/hqNZQEvcTtzX9bzNrJOZe7V
         sg99bsnDOlUGSAtihNafsmjm5ER9BCKiJZteEM6k4a53X0OW5R06gW8/bg2z2S2YpRF4
         mWmCEvj6gt5LtpU2iCrDqoLvGyh0O/VAsshNXHO7jGMZSTO05WoEtjtxI/mT6UNlQn+C
         9MnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775809887; x=1776414687; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KEJjrIfQId/h77djj7M4y4n3Tb/7Xj1HxO0kKsRBFF0=;
        b=COoctWWOZZwmFLtqj5+KD0CT6B6aGMz7AmqwWAESsU9puJSkNLECLPd6GRzpIaw/Ls
         IlHqwYQarriTXWp0eb4KJ43uCbQZAJT5KPy3auZ7AgjMBkNDCDI+4slG6KLa972Ev5Sz
         k4rsrfE4sqNYFU1HKDHw18I8FRZHfJaH6NUowozoFyyXb+aXh9dfzr6FoG/f08a/Ltk6
         +ASiczmOoOa3FtASR7B7BgY0bc8iANsBTY8+cm25esXloyPI2+Qmf/loJbX/NODCydRm
         63qZdMPFrsKz60ahEF0tYZFKvlzeMPlMVOz3uVTuE+g+xRnlg3cUPuXhDluHez7daODS
         S5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775809887; x=1776414687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEJjrIfQId/h77djj7M4y4n3Tb/7Xj1HxO0kKsRBFF0=;
        b=VVepcllO+PgvowIYMqQeJFfGktIILXrWxtfKtkIoaUfPHYTDLZggKAuLSaF6BjsPIj
         p7SEISn3/lg3ttr9ny7FtHXspr1kCAQZtdPwx78blPMIWeeFfVww7F+Jvo5xieYaKndn
         pK9iGIwOe8/tPzr7QI7AMMQtmxqqEwOzg8RcYSC4gqXJAnaMyjemeY1b15EDF4VPGBbX
         tPU1nmkBm4YyOtW6vz2qoC0wvUQN5b6pk6bulAc/UO5Zx3uXOvYXR/lqXiWj/zyQBxp/
         y9mU4RH7Diqfmn4MjLwmcyO93Nm057HurlgJux7/QMx42CzT7SCmUkq6FFBJNnA/Vh1r
         vgrg==
X-Forwarded-Encrypted: i=1; AJvYcCWq000flQDtek+Xt1aGHUt3turbqoIY/7EGkslI3AfMpzjdAowHrNOyy5ZL2LFHYg21mMyvCO9sOV5skU2d@vger.kernel.org
X-Gm-Message-State: AOJu0YwcpC2mccZ9JxUAhhgE4Zn280CwQdi8JYoZOrpXuOOeTfRVhg3r
	qmWrZnxwY7bw6zvqVJ4OUV7UhDhhOvkrh5FfA1cZfJvEsZwStK9US1ao69lCSwhkYckisJ0KXQB
	KG72GSX6sG5FOULMA6eEjAemSFGmX/5FSFSMVBp7leg==
X-Gm-Gg: AeBDievfyuYA0i0kuDvwHh2P6qITxrzR9ddm7UL2TGiZXhU2hmdwgaY/09famKP5Tuf
	gL+OxGH2+VEIaUmSb6O74D3ODBKdIzk5DvFUVskJPr12CLmYp7SVK2XAHPGHHdhOsvMYHKBZN26
	47v5eTpwHFchFJ3BkA9jnSoA7Og8K2Mo+113KFD3PdlfDX6XWyY78qTl9OYe3Km3IKqVhn8XGP0
	cDCHVF5DyhXps/i4jn3+bAOZI2escAM+4VRyAweRskCod3rJw5r8S/FEoFxIlZj/XH/enwmhnyD
	vhVvKMKa
X-Received: by 2002:a05:6512:3d88:b0:5a2:a5a5:5247 with SMTP id
 2adb3069b0e04-5a3efb41a66mr856670e87.32.1775809887115; Fri, 10 Apr 2026
 01:31:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410065833.3189808-1-neeraj.soni@oss.qualcomm.com>
In-Reply-To: <20260410065833.3189808-1-neeraj.soni@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 10 Apr 2026 10:30:51 +0200
X-Gm-Features: AQROBzDrswIC_zPTfU0VV8YKa_B7tyiyd0t06DcGC-OIk4-kF9hovQfVfSbQBB0
Message-ID: <CAPDyKFqRUnijc3zdGszukUw9HHwfbJw+F+WxuE+vj9qpMgu=ow@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: host: sdhci-msm: Fix the wrapped key handling
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: adrian.hunter@intel.com, ebiggers@kernel.org, abel.vesa@linaro.org, 
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102611-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linaro.org:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: C872E3D4315
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 10 Apr 2026 at 08:58, Neeraj Soni <neeraj.soni@oss.qualcomm.com> wrote:
>
> Inline Crypto Engine (ICE) supports wrapped key generation.
> While registering crypto profile the supported key types are queried
> from ICE driver. So the explicit check for RAW key is not needed.
>
> Fixes: fd78e2b582a0 ("mmc: sdhci-msm: Add support for wrapped keys")
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


>
> ---
> The patch series "mmc: host: sdhci-msm: Add support for wrapped keys"
> was originally discussed here: https://lore.kernel.org/all/CAPDyKFqRG1_1aYavfrA0Ss85B0kcTnjVBeqLgq8PUJUcSx5LUg@mail.gmail.com/
>
> Changes in v2:
> - Updated the commit message.
> - Added the "Fixes:" tag.
>
> Changes in v1:
> - Initial changes to fix wrapped key support.
> - Link to v1 https://lore.kernel.org/all/20260403105949.1007447-1-neeraj.soni@oss.qualcomm.com/
> ---
>  drivers/mmc/host/sdhci-msm.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index da356627d9de..df0a038269d4 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1926,11 +1926,6 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
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
> --
> 2.34.1
>

