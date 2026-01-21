Return-Path: <linux-arm-msm+bounces-90014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHvSG0vMcGkOaAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:53:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A4D571D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0A7209E0775
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF54648A2D5;
	Wed, 21 Jan 2026 12:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N4W2dnj0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12525481FA8
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999488; cv=pass; b=qllVHsVIbOBk+1x084cqAqI8kHcbgC5OW0NL/KHQc65BYUf4TQqNAz6C3qAlYYwGopG4MGEqnAT0KeB/6VyYGJwVb/4LxDfd4kzOcQiFquV9PIUpCN5DhhPiNpk2dREsoDAI/DUMJSQyPqYOeXxD4wYb3uu2OOZFALIwNdHTSWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999488; c=relaxed/simple;
	bh=xc3mKastqq6iX8EeUiMcKk8mfGYIQiSwqYYU5vEapgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6KLxwhsFv99OGcI2gc/9wxdj6PPCCK42mbsG9QsQN8LVlVplFYVb90okMDMPvH+EZ6KnMgVTEdpH+m7HgUCtCo3GyUFeocwTUZJkf8DeeA4XJ+r2z6klwwl+UNTXy0s9EWq1oCGmr/ZWl6xXeI1w1yMLd0PytmCUYeAetNNSg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N4W2dnj0; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59dd3e979ceso481398e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 04:44:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768999480; cv=none;
        d=google.com; s=arc-20240605;
        b=fnPvuGMtOXzPoaZCjor7WLLMzBAtmAZ3Q6VVxlgvQQUU6xNP3XVBXUdrUkA/2idmFp
         +/2NCSOFX+ZI69m9RUbSvYr880A6iy/bbEOORllQyEwLirT+6FE1oxsTEUEK+tUWdNph
         GKgNuSUwTkV9pgYTFQ4nAK7DlO9MkE1HKOajkaNdwG10r18VSmP9oCay9uaLbvgTA7Oc
         hAKbZt94e9TYtlFDVwwGNb6WaVtIBJBYjHU/ZvVjgiz8+RFyIGC4JTBwDFEnWpYtbBzR
         YT86yE8CqI80tQkMxbqFPfkh/q4Pm7SbzcmpyWynn2LbwfQLgpJqVqAuZZ/BiFCcVyhX
         nqAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KX/gQRH8XWSQA+kVLrNMJ+xSKGOn45C/xodo0TsBA5M=;
        fh=2bHfaUd3A8g6vrWxJKsseM1waCJIdv2hmnnGk5Qzc9k=;
        b=IIqZqZ8M6zJ+6U1aBso3TsklUEcMyMjq4A3hxBMRM575h3g2itfAUAnvX6XV/7CEdc
         PiO5vI+Ld21rEg5onuu/vSRw0W3+b5xmkRNiAmOeG8rTeNTmg+4y1y3Qn85OfXoFSOrt
         56P50U2K7loDD2iB5mawA//5TC3zLmsnr7BBLnAaSyaWIagF5ox+cJySKnrxGo0Uw5pW
         4qaVblnEmhhxX59GitNkKKXydf9tyuguvQWK8NnurIURtG2NL7AlW6e4tOeG/tAtz6+I
         wdj2d5cNkE5DeQc0CBEaYqsm1iyGymoN3NABM+z0m0hKkzek2G+L6CBvnwUXH2Eep18w
         NTbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768999480; x=1769604280; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KX/gQRH8XWSQA+kVLrNMJ+xSKGOn45C/xodo0TsBA5M=;
        b=N4W2dnj0qEFHLVyJpX/zrmb/MJnWsxq6Qy/56NWn98C3AXk/HxDoAC2WPmzltDRw+z
         Xt2licdUFs/+cMfmWelQGvJ+E7L6Xdq/5pymIALDm6zmkAbDLL52iFuQUhPGWkoG4W4l
         HaiwIG+wnbsVbJVv9ciJjguOx1M5wf2BYVnY27umHO5rlhkeqz5/ib9mjY9Kt5+1GXmH
         FjrnU0MkGP8flJi23sXo0RLUEoUBl0kmEc98RNhzlAqHA0TVwrgh4EE9EuYd6A9PXyQ7
         H0glIliHKlr1qNnSu3+GPkQgY6QoBfnEzRaBRM5yc6ngDcJPvUyppoApBjD9+PIYU7J3
         C7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768999480; x=1769604280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KX/gQRH8XWSQA+kVLrNMJ+xSKGOn45C/xodo0TsBA5M=;
        b=crGSQ1AKeH5m0j8nDJ+Fnt9F8UVkHcS68Agg8QiHVWqym/ewg81NB4hqTalxjnYZRA
         EksR6NKThBSPl2jO/QZX5JPJnUSJlrWpG4b7SSsV9xLbfkssCl3f3aVtrT3/c6c6Ti5N
         0Ty8ioFrbX1WgOA6y7eWBGlnmC3zG2n92gCCdsRWztpDYih09FfV9jB3Ht+OfXfrY7K4
         asuD1zv6WCQGA5P7HaycqSuzt8nbw32puTFyHbc3UsUsog3efnwrjDfNKB/IscuBOh8s
         ZNZLhlVkyiJxKqZjtCQsNSUX2Pg+iE1WkkkX772yJSm9qkJoM1g7BVxZJa9/op2Ik8Nb
         ituQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaQqdAe/IZQqkhqPKQ1TR71rMVK+EiwdzaLShj4hjapIOgdIaKfr5LXty5jY8eJjOi2kQkR0ucGrO6GQnG@vger.kernel.org
X-Gm-Message-State: AOJu0YxjSOyPPA2ZC/Dbcajg/aO8+O7gOtDkTu5n2uchPy8aVnXl8s8P
	HO8zsw5JYDPRf8uzoI0DQAzxJ+N2pAbHM2FJBUTXRXdHdbgivoGQwsESGCuj48Of1DVyV0Srmgn
	uXeyt11psElIR1HhRi93xH6QvoiOFpG5Dv+1+AWEpUw==
X-Gm-Gg: AZuq6aL/iVdVEaJWLjv5zkZ+5ZiNHlh6xCvJU2Tp70YTPUiIuJVf3Owxc0TvNRcNKzW
	uXOfY9DsWysP5d6cpXtGmXhRSpnRrq2z+TKuyvHbqH9Ctg9vnCSJPXFssw7AEPFXrQpUW4ihgF7
	cfZVbgYTeWCZO3olLMEuc08K5U7uHbzKPqQs8lrfHCRb16m4iwqcnddZMgEr/JrT+s3TA55WUHs
	m+P4DXf9p1FlBwXL7sgcEz1X8dS1dU2oycdrOfiYJ5Thu9+tTG3e0zWGcChewfFMwBlE/qy
X-Received: by 2002:a05:6512:3a94:b0:595:91dc:72a5 with SMTP id
 2adb3069b0e04-59baffcb9d7mr5264864e87.40.1768999479872; Wed, 21 Jan 2026
 04:44:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126064251.1928529-1-quic_mdalam@quicinc.com>
In-Reply-To: <20251126064251.1928529-1-quic_mdalam@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 21 Jan 2026 13:44:04 +0100
X-Gm-Features: AZwV_Qg1yN2uwKr4_1VyyUheg-q9reeNrvQ_fOzzUfFGEjx4fYB9jzMsn5Vxrv0
Message-ID: <CAPDyKFppNgYvHJDqfvyQ0DTYCwgcSR12D+-=04NGEDtbM8FmTA@mail.gmail.com>
Subject: Re: [PATCH v6] mmc: sdhci-msm: Enable ICE for CQE-capable controllers
 with non-CQE cards
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: adrian.hunter@intel.com, linux-arm-msm@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, abel.vesa@linaro.org, 
	ebiggers@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	TAGGED_FROM(0.00)[bounces-90014-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: F1A4D571D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 26 Nov 2025 at 07:43, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
>
> Enable Inline Crypto Engine (ICE) support for CQE-capable sdhci-msm
> controllers when used with eMMC cards that do not support CQE.
>
> This addresses the scenario where:
> - The host controller supports CQE (and has CQHCI crypto infrastructure)
> - The eMMC card does not support CQE
> - Standard (non-CMDQ) requests need crypto support
>
> This allows hardware-accelerated encryption and decryption for standard
> requests on CQE-capable hardware by utilizing the existing CQHCI crypto
> register space even when CQE functionality is not available due to card
> limitations.
>
> The implementation:
> - Adds ICE register definitions for non-CQE crypto configuration
> - Implements per-request crypto setup via sdhci_msm_ice_cfg()
> - Hooks into the request path via mmc_host_ops.request for non-CQE requests
> - Uses CQHCI register space (NONCQ_CRYPTO_PARM/DUN) for crypto configuration
>
> With this, CQE-capable controllers can benefit from inline encryption
> when paired with non-CQE cards, improving performance for encrypted I/O
> while maintaining compatibility with existing CQE crypto support.
>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

This has been applied for next since a few weeks, but I have a
question. See more below.

[...]

>
>  drivers/mmc/host/sdhci-msm.c | 77 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 3b85233131b3..da356627d9de 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -157,6 +157,17 @@
>  #define CQHCI_VENDOR_CFG1      0xA00
>  #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN  (0x3 << 13)
>
> +/* non command queue crypto enable register*/
> +#define NONCQ_CRYPTO_PARM              0x70
> +#define NONCQ_CRYPTO_DUN               0x74
> +
> +#define DISABLE_CRYPTO                 BIT(15)
> +#define CRYPTO_GENERAL_ENABLE          BIT(1)
> +#define HC_VENDOR_SPECIFIC_FUNC4       0x260
> +
> +#define ICE_HCI_PARAM_CCI      GENMASK(7, 0)
> +#define ICE_HCI_PARAM_CE       GENMASK(8, 8)
> +
>  struct sdhci_msm_offset {
>         u32 core_hc_mode;
>         u32 core_mci_data_cnt;
> @@ -300,6 +311,7 @@ struct sdhci_msm_host {
>         u32 dll_config;
>         u32 ddr_config;
>         bool vqmmc_enabled;
> +       bool non_cqe_ice_init_done;
>  };
>
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> @@ -2012,6 +2024,68 @@ static int sdhci_msm_ice_keyslot_evict(struct blk_crypto_profile *profile,
>         return qcom_ice_evict_key(msm_host->ice, slot);
>  }
>
> +static void sdhci_msm_non_cqe_ice_init(struct sdhci_host *host)
> +{
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +       struct mmc_host *mmc = msm_host->mmc;
> +       struct cqhci_host *cq_host = mmc->cqe_private;
> +       u32 config;
> +
> +       config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
> +       config &= ~DISABLE_CRYPTO;
> +       sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
> +       config = cqhci_readl(cq_host, CQHCI_CFG);
> +       config |= CRYPTO_GENERAL_ENABLE;
> +       cqhci_writel(cq_host, config, CQHCI_CFG);
> +}
> +
> +static void sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq)
> +{
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +       struct mmc_host *mmc = msm_host->mmc;
> +       struct cqhci_host *cq_host = mmc->cqe_private;
> +       unsigned int crypto_params = 0;
> +       int key_index;
> +
> +       if (mrq->crypto_ctx) {
> +               if (!msm_host->non_cqe_ice_init_done) {
> +                       sdhci_msm_non_cqe_ice_init(host);
> +                       msm_host->non_cqe_ice_init_done = true;
> +               }
> +
> +               key_index = mrq->crypto_key_slot;
> +               crypto_params = FIELD_PREP(ICE_HCI_PARAM_CE, 1) |
> +                               FIELD_PREP(ICE_HCI_PARAM_CCI, key_index);
> +
> +               cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
> +               cqhci_writel(cq_host, lower_32_bits(mrq->crypto_ctx->bc_dun[0]),
> +                            NONCQ_CRYPTO_DUN);
> +       } else {
> +               cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);

Should we really call cqhci_writel() here, even if
sdhci_msm_non_cqe_ice_init() has not been called yet?

> +       }
> +
> +       /* Ensure crypto configuration is written before proceeding */
> +       wmb();
> +}
> +
> +/*
> + * Handle non-CQE MMC requests with ICE crypto support.
> + * Configures ICE registers before passing the request to
> + * the standard SDHCI handler.
> + */
> +static void sdhci_msm_request(struct mmc_host *mmc, struct mmc_request *mrq)
> +{
> +       struct sdhci_host *host = mmc_priv(mmc);
> +
> +       /* Only need to handle non-CQE crypto requests in this path */
> +       if (mmc->caps2 & MMC_CAP2_CRYPTO)
> +               sdhci_msm_ice_cfg(host, mrq);
> +
> +       sdhci_request(mmc, mrq);
> +}
> +
>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops = {
>         .keyslot_program        = sdhci_msm_ice_keyslot_program,
>         .keyslot_evict          = sdhci_msm_ice_keyslot_evict,
> @@ -2762,6 +2836,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>
>         msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
>
> +#ifdef CONFIG_MMC_CRYPTO
> +       host->mmc_host_ops.request = sdhci_msm_request;
> +#endif
>         /* Set the timeout value to max possible */
>         host->max_timeout_count = 0xF;
>
> --
> 2.34.1
>

Kind regards
Uffe

