Return-Path: <linux-arm-msm+bounces-90031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPt6Bu7mcGk+awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:47:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B54058A81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7196FA67BBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7AC481258;
	Wed, 21 Jan 2026 14:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u2GF+l0n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069B844D69A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004804; cv=pass; b=ERqHWYRebXwrLWsRSaKs9uCUyyUBcyLpoT5mj/NuS6AP2YisOPcMt8coVG1E8nwtcF5AgpXnbZhx0kF0yxAHdxN1CTsLtau3AIjRXNtvIO/650Q28vaAGRJTzF0j/gav4k3SxqyOiA9yWFZfAMWePkZbU4dWYA9IIyhgVOOT4S8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004804; c=relaxed/simple;
	bh=AG+0W9qVGwr38aOC3Ls4cByXNYR0b7a0ezY0mCq2/UU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g81DHMI7uDU3YcpUjU4MPqgcSPt67CotanzxKqEVX9x9BNNCNDFvIU3P1WCmH82aeMfOpp1mvY4gwoeiY2j9ek+9EwwR45N9/8dnfHSBzKiYcwC5XY6DJs7Pj13XIJwWaVo0bCpNGtvFQ9myRutetFBQI3eWHmvm8vKzQbA3whM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u2GF+l0n; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59b6df3d6b4so8309703e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 06:13:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769004800; cv=none;
        d=google.com; s=arc-20240605;
        b=eqHzkVnD4bMdC1rRyEdeBg9+sL0vf1/th/Oug1ZMNgmghY3T+cvPJ7ekqL2cNXbgOw
         UOkeFGOg0QQa02dprkRlOiqG4wkhu1ba+7hmDYjpRlI1bP+lY247F1hmzSbUsamdL4ET
         BlmtvlMPtg+yFzNOOjJ1CWRhVstbkPtaWXnRY3tj3ePNQAxgPWmDkOvOOFim/WkHdbWN
         KKnSg6HEYqfHB61WcNDl8YNrt3D/XNhWCJB87kY9kwBdJP8Ez/fjYYJQpFW7uzKSBrS5
         ginbsBUIQGttWdlShPou6J4wiML9vZjblKyp06aMCeYDwPf48NjJ97l8ji+TFZVRA0en
         bNgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mpQKvRgY7KyDBGILnk2A3cV//dp1xhTaStw0LEU0Drk=;
        fh=PRMhUMOCDRUBk7/+5z0zppetDk7riEsj6zO2db1D8jE=;
        b=YZEOfpmjob5nLa3QsORkQiC72rVnW3eGGR4KzXYhatnNR704W4O3mUKRgnmyovWclU
         Kwu3cqcQfxzF2o5scSHR2wwtXbwyWScjhHgMLvsQSeXhT50XYPXS0kYJty2imLyffQ4H
         8kxyLuSQ1NNeoIAXxXMHzpaw3j+5Wsx8/2U8eIajf8bpBBYT7IR5+2Q462PwcXwhjrwr
         JxstTP8wejlgCqSjexNN1jPn7Upw1ZZuqVzt7wKNhcmmbLDKoJlOLaAWDuEUGVLLRSAY
         gn30u3803XkY5mtIAXU3DbFIo7MUq5+RnKdg2PBCayUjCjUFOCQffvRaB3j6ikg0/hjg
         BuFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769004800; x=1769609600; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mpQKvRgY7KyDBGILnk2A3cV//dp1xhTaStw0LEU0Drk=;
        b=u2GF+l0nsUeW+1O8ZsCDS8mbWTjDrxkQJDl9WAPjl5DM67+bC+qclRhIMxV7PcYyxP
         K9CJdnJphiE8TKpUPc9XO5U09VhdqRpiYR31ouIz6uJJpMASE8AYVxeJzuvYj5UJWmjI
         /kk025UbIWuLpHUAwCYhx9SEwoEjiYDjT6eFk69FI6VBDWZVvsHSyLlcK1OysWkaFFx0
         fPgMHIs3/mLufjZqEwAaEvcD+MQSfYx06H1C5aMsTEYzyctTTCRrWsSAmG4HumRgJvER
         dW+vVkFS9Sw4UneyMOl6Vo5O33B3gdvMpANgvDr+2av8+tGkn4i1RFU/6zhuz5+VQgAo
         mZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769004800; x=1769609600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpQKvRgY7KyDBGILnk2A3cV//dp1xhTaStw0LEU0Drk=;
        b=pciVrlGrQpD0NtS1fgYUKUHN5OZXXMgtHI4oCwuNvN5j0JZZDxYMQU7Lexp/TZlhNu
         RFT5ULaV+Z7iFhK83P660oi/360xEV+w/R5VJjgDUp0ESysetJLleUlUHoeLyLl7HXip
         0oWvEhIBBFsB/fP+fpN+U0c69cmdIFLGl4Nf59RVY8wZ1PlAJJf3M5wT7CSrgugaN6MU
         WoLC8q9tzDCcRMEHFxg303HbV5NjD1Mrfv5gTluHpKpX/jX9iW+D3weuLeCCsMvyIbRV
         Os77rcyAbBZ1R2nL33fEeYlV5RzdtVvHqxG04+vkw1/BTLpZSBdjnVn3e4nbE/AwrSq+
         oBFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgoUtMAGrNKwjEwFsWx3ZqEKNu7QEA6UTbi5nnOdJIRMahi8gbCMYMklDTczDNmaOmJXjwZr2N2X6bRyn5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5PgsGOqzhlcdj5LJz17Hy3OaEIWJtjIq2r3YyIdQZQSdVWZdm
	NRRtz0aThPQWq546OHzvTQXsXX8nU1etySbvOFe21JxGwuaGoC5qp4+WiHHCQKCQS/BaYF6L+38
	BPb0ZxrBkyZADC3ELOQ59a8yav2QerLQwh3WvNTxjCA==
X-Gm-Gg: AZuq6aI48tmIN6lgmlXqAie+rEJaiyVUkdJuEoyBBI20ffP48jvCgV49Yxg2yeFOh8y
	Ruf4WF9RtHncjnidKDvNeW04x9kzwXB6zOioLNRaB1QkUZKSXCeJxsUJ/Czqk2r/yHHvfch8ALs
	DI+p8hqG9iMDGXkyaVVFLqeP4qiPF8yJAfRgUQOlHSOPdWBNOJ543vmZZ4MSuvXJdSvTAJxHq6k
	M+udiKt+CSTLgRUA1jZYxirZJWsRRo+hxYRBjshtbY+9zt9qQqMaE3liM+OWCi531Bakpo0
X-Received: by 2002:ac2:4c4b:0:b0:59d:cda0:8b5a with SMTP id
 2adb3069b0e04-59dcda08d1bmr1088455e87.38.1769004799968; Wed, 21 Jan 2026
 06:13:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116121004.1829223-1-neeraj.soni@oss.qualcomm.com>
In-Reply-To: <20260116121004.1829223-1-neeraj.soni@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 21 Jan 2026 15:12:43 +0100
X-Gm-Features: AZwV_QiQKYRr91kx9TDXIAwOBKhi5R2aJ_dWKO8ZHrK0VedTIMBYuurr7hT9wL8
Message-ID: <CAPDyKFrOHqStZbsye9Quk71UGkzUxOkwG9yAGYFVvt+=nMJSyw@mail.gmail.com>
Subject: Re: [PATCH v4] mmc: Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: ebiggers@kernel.org, adrian.hunter@intel.com, quic_dmukhopa@quicinc.com, 
	quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com, 
	quic_gaurkash@quicinc.com, quic_sartgarg@quicinc.com, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90031-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,quicinc.com:email,linaro.org:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 9B54058A81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 16 Jan 2026 at 13:10, Neeraj Soni <neeraj.soni@oss.qualcomm.com> wrote:
>
> From: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
>
> Crypto reprogram all keys is called for each MMC runtime
> suspend/resume in current upstream design. If this is implemented
> as a non-interruptible call to TEE for security, the cpu core is
> blocked for execution while this call executes although the crypto
> engine already has the keys. For example, glitches in audio/video
> streaming applications have been observed due to this. Add the flag
> MMC_CAP2_CRYPTO_NO_REPROG as part of host->caps2 to control reprogramming
> keys to crypto engine for socs which dont require this feature.
>
> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>
> ---
> Changes in v4:
> - Removed the "CONFIG_MMC_CRYPTO" encapsulation for "MMC_CAP2_CRYPTO" and
>   "MMC_CAP2_CRYPTO_NO_REPROG".
>
> Changes in v3:
> - Renamed MMC_CAP2_DONT_REPROGRAM to MMC_CAP2_CRYPTO_NO_REPROG
>   in the commit message for clarity.
> - Added parentheses around the condition: (host->caps2 & MMC_CAP2_CRYPTO)
>   to improve readability and correctness.
> - Updated the comment associated with MMC_CAP2_CRYPTO_NO_REPROG
>   to better reflect its purpose.
>
> Changes in v2:
> - Renamed MMC_CAP2_DONT_REPROGRAM to MMC_CAP2_CRYPTO_NO_REPROG for
>   improved clarity.
> - Defined MMC_CAP2_CRYPTO_NO_REPROG for MMC targets that do not support
>   a Crypto Engine.
> - Restricted the usage of struct crypto_profile to MMC devices that
>   support a Crypto Engine.
>
> Changes in v1:
> - Addressed the comments from:
>   https://lore.kernel.org/lkml/20241006135530.17363-3-
>   quic_spuppala@quicinc.com/T/#m69c9ab538bd9efd54515646952d0d7d1d7c17690
> - Avoided reprogram of keys for Qualcomm SOCs only.
> - Ensured reprogram of all keys on host controller reset.
> ---
>  drivers/mmc/core/crypto.c    | 2 +-
>  drivers/mmc/host/sdhci-msm.c | 6 ++++++
>  include/linux/mmc/host.h     | 5 +----
>  3 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
> index fec4fbf16a5b..a5a90bfc634e 100644
> --- a/drivers/mmc/core/crypto.c
> +++ b/drivers/mmc/core/crypto.c
> @@ -15,7 +15,7 @@
>  void mmc_crypto_set_initial_state(struct mmc_host *host)
>  {
>         /* Reset might clear all keys, so reprogram all the keys. */
> -       if (host->caps2 & MMC_CAP2_CRYPTO)
> +       if ((host->caps2 & MMC_CAP2_CRYPTO) && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
>                 blk_crypto_reprogram_all_keys(&host->crypto_profile);

As far as I understand, calling blk_crypto_reprogram_all_keys() would
only be needed for those mmc hosts that lose their corresponding ICE
context during runtime+system suspend, reset and possibly during
->probe().

In other words, calling mmc_crypto_set_initial_state() from
mmc_set_initial_state() looks like it's a mistake, as it has really
nothing to do with the card's initialization, unless I have understood
this wrong!?

That said, I would rather make the mtk-sd and sdhci-msm drivers to
handle this themselves, by explicitly calling
blk_crypto_reprogram_all_keys() when needed - and drop
mmc_crypto_set_initial_state() altogether.

For the sdhci-msm case, it seems like the only case we need to care
about is for the reset.

For mtk-sd I don't know what is needed, but possibly Eric can help out here?

>  }
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 4e5edbf2fc9b..2ccb63dde9c1 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1949,6 +1949,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>         }
>
>         mmc->caps2 |= MMC_CAP2_CRYPTO;
> +       mmc->caps2 |= MMC_CAP2_CRYPTO_NO_REPROG;
>         return 0;
>  }
>
> @@ -2526,6 +2527,11 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
>         usleep_range(200, 210);
>         reset_control_put(reset);
>
> +#ifdef CONFIG_MMC_CRYPTO
> +       if (host->mmc->caps2 & MMC_CAP2_CRYPTO)
> +               blk_crypto_reprogram_all_keys(&host->mmc->crypto_profile);
> +#endif
> +
>         return ret;
>  }
>
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index e0e2c265e5d1..2fd76f966e24 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -457,12 +457,9 @@ struct mmc_host {
>  #define MMC_CAP2_CQE_DCMD      (1 << 24)       /* CQE can issue a direct command */
>  #define MMC_CAP2_AVOID_3_3V    (1 << 25)       /* Host must negotiate down from 3.3V */
>  #define MMC_CAP2_MERGE_CAPABLE (1 << 26)       /* Host can merge a segment over the segment size */
> -#ifdef CONFIG_MMC_CRYPTO
>  #define MMC_CAP2_CRYPTO                (1 << 27)       /* Host supports inline encryption */
> -#else
> -#define MMC_CAP2_CRYPTO                0
> -#endif
>  #define MMC_CAP2_ALT_GPT_TEGRA (1 << 28)       /* Host with eMMC that has GPT entry at a non-standard location */
> +#define MMC_CAP2_CRYPTO_NO_REPROG (1 << 29)    /* Host handles inline crypto key reprogramming */
>
>         bool                    uhs2_sd_tran;   /* UHS-II flag for SD_TRAN state */
>         bool                    uhs2_app_cmd;   /* UHS-II flag for APP command */
> --
> 2.34.1
>

Kind regards
Uffe

