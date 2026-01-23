Return-Path: <linux-arm-msm+bounces-90308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGNIAChDc2mWtwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:45:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 565BC73972
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DF64305749F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 09:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3582A37106E;
	Fri, 23 Jan 2026 09:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jOq3pRio"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A73733D518
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 09:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769161165; cv=pass; b=KJLyCTv8LYmSa/HEUYiXnBanJqFd5TkwZbX0MesdAsh699PaPWiyXQFvBkwncMOQFPt5pheotQA/jJt6Dyr+qsfLTyvyPqyGva11mrWcDrwpvZdJ+CDqCuCfpcMTE4JVQYxzqlZAmzZWJjgPbWQooYActjS3fKPswxT46tjR1yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769161165; c=relaxed/simple;
	bh=E9sY73mzI8WIkjfDsoZWnuIR2fVyge0FFmizubuNHXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SDtxVIn2X0F5e5YMaxYEC41b8Dr4z8An1Ygf0qFNxNi5RTdNb3p2qiQX1XeYhImFKhZH+F3NogUpZ2o5gotDWzI/LLNs7RiLjEz7DwhGmsrzMB16x6hIouUyBK5HIlLFHUARyXx+MfOcUCQ6e2cAxA3R7Rs/OCyARs1glKqWSjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jOq3pRio; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59dd490be5fso2684215e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 01:39:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769161150; cv=none;
        d=google.com; s=arc-20240605;
        b=gQkBUaSJrSWZQggjy5w8rVCcUSY0+j5OUAbGKIeziRnLGEqalDd2yMbQlIGJIOOGQY
         BsT+H5RH3XhMEk2gJ5JajIKZH5U80EglkqRKSvayG7NVK7kZuVWLPKXsvF/kRoEOd3lw
         3weQP5ETFywmXwq3Vy9cU4LwuchB/fifs5IVImPq5gctbWrwA2qLwsSxmG0PDv5a3kiA
         Tz5yr3LkMyqoKX3Yb6AqulzdCShYjHiZZWwcQEfHHSgaumqF6gtSuI27SPgKpaOXXrKb
         XKaFudpWX2ig9mslzqkp2qGPec6rX2MBSD+LyZ4wdqD0ddAChc9biVmTLEVLHhThgMBG
         bWHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rG52QXraaViSSSy0BOpcFpXuiB3xymU1NOmvEWWxI0g=;
        fh=WRacninWNjVuBBhFvxxJ2+H3nQBn3QHEzJBBsa1cLZQ=;
        b=hYk8HolSMj4f39Q7j9b37hjyalSH5MmcK54mE+yExAuo72K/qCBo77btAOQVkwIBqo
         sRzCMGwmtSBM9I2P4dMkW5v/4LASgf+FWomGNt3VNp+fGoWeJ0+ozyIEk0hHZRCGPJ5W
         7xmyrxdRyTicBS+h3Oguqcl5p3xdlVM+xnRMLBHsLVPrFCooHwdWBLNm1d1vW9TSGAHv
         5CywzyV7uF71A7UynSvKSvD2qd/na0m4FAz30sTfcNZsEX8vRUV0B/bkbN9j8pH6Bp8G
         K70V5Y8oipQg7FnKwqo1jHxjkH1+fxpOGdvRzVT9pcZWyV9WgG6MTzFI2UXLaVyoLp1L
         e8IA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769161150; x=1769765950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG52QXraaViSSSy0BOpcFpXuiB3xymU1NOmvEWWxI0g=;
        b=jOq3pRioWt9pVUiWulyxA+CNpHXtnKAoAL0ppF4VN7sPCybk7m9gew0c2Adp0rqVUR
         lijiw0lWA+byQBkz773d8e3pI5XH1MKkWVEjCuqKvzN4p/PPjhIVn9JKnpTPMQWubHXC
         3AM+9RAbCo5/Pjg21zUa9FrlF0DSxOcGUG6oHUk1BVcjiRwvaCwRqo+zVSleaKz+hmYk
         v7aJ01+H8tQ8tFQ53Q653T0TH3Q4IeBViHr0DhZGs+6U/8/GoxGsRLMbexKMqWyRV0oI
         vOo2h7DiTqNPsJbZdf8R8OezbWR7l1PZIPFsBZ1dRbQMigHaI2OELXG6pSoetg7JV6+q
         4M2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769161150; x=1769765950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rG52QXraaViSSSy0BOpcFpXuiB3xymU1NOmvEWWxI0g=;
        b=cJfdqV33CgZkCSY51O3oiHq5joztMVZLGxu7abUQ8k3L80uuG6UeXWEPOyxq7W59vI
         ggm9LqhXzfmaz6/0E9BZjnU+8SO+SO5UP6SvlMlWZaMtSrBiyLXji32FdKnfafcULK3D
         oRFiTpWP2JTMOxXq5RtFbuFe2xvwyogp5mv+8CLotfuCrRyE91l9t0nuXvqJwn0xDuhf
         YjhU3w6C4Sv9EbJWKJ1/V0YMmP6kYjcWCmglH4WiBbWTvI256GQRmBxFbyvzkOmhmaeO
         yttanYXKALSAkd3kDdDAdeB53U7J7e+e4I9N9u9SKIIH6MD+jjKQL+4P4ZYoy/D2LQDa
         lUbg==
X-Forwarded-Encrypted: i=1; AJvYcCXgItOqy6UZCPkTm+/MCnwQ26OQOnKB0/IsfRRDBSWVZFtpnKDJTgBKMJgnpv/UGgsgzQrqVjtTuyAdRtsV@vger.kernel.org
X-Gm-Message-State: AOJu0YyEyRrqetteKySDT2WEhlGmc1ZLRmb+dp4kikHFu7cyA9DiOrww
	rpMh3mYBU2dFuzlaRYGjrVV2UGc25hMIlI7xp1JJf15LNDbU3QIrJmqoWEYiXVPV1w4Z1gmuvXg
	3DbWtwPefidrzyULxVK1e/LWa+wdrJmbAr48hNRUIMw==
X-Gm-Gg: AZuq6aIWfA5KxDlVOdAdKNIIH6t1CX/3bTzdatHk7nBpPdSCJ3Z9qB8fL6LHOmtCUj9
	eFF/W1PPt3hc/Qp/9SfqYd8ZYhPaqd940clug1j1yq9vxmwCrAGbU1DgBErzjRfTrLIS4/2lt4+
	HY3soBIV1/xsrbuZX9VYXwjLNGC2B+QsYOLHlpIcILwbE8vuSMAFZ4RXcFxSylG5UIBcwK2N11H
	4/25SLZleMCZHuaeUDjfgUGRS4hU+Ja6Y/YwjRDUQY3vTYKFoZYqoBLOaukMJZfXanvpnUq
X-Received: by 2002:a05:6512:61a6:b0:59b:b0f9:53ee with SMTP id
 2adb3069b0e04-59de48f39b4mr696019e87.7.1769161150160; Fri, 23 Jan 2026
 01:39:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126064251.1928529-1-quic_mdalam@quicinc.com>
 <CAPDyKFppNgYvHJDqfvyQ0DTYCwgcSR12D+-=04NGEDtbM8FmTA@mail.gmail.com> <3df0ad20-61c0-73c4-be8f-aea43f70cb69@quicinc.com>
In-Reply-To: <3df0ad20-61c0-73c4-be8f-aea43f70cb69@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 23 Jan 2026 10:38:33 +0100
X-Gm-Features: AZwV_Qj-fRTlNB7M0mC81wCnKPw6IPYxZZexdPMmRUIdx1ZRPaLvBhXQXt4TZrg
Message-ID: <CAPDyKFpcGvhp82MTcN3wTeLrxErQC6Cficva341VVLWBf6zL9w@mail.gmail.com>
Subject: Re: [PATCH v6] mmc: sdhci-msm: Enable ICE for CQE-capable controllers
 with non-CQE cards
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: adrian.hunter@intel.com, linux-arm-msm@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, abel.vesa@linaro.org, 
	ebiggers@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90308-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,linaro.org:dkim]
X-Rspamd-Queue-Id: 565BC73972
X-Rspamd-Action: no action

On Fri, 23 Jan 2026 at 07:10, Md Sadre Alam <quic_mdalam@quicinc.com> wrote=
:
>
> Hi,
>
> On 1/21/2026 6:14 PM, Ulf Hansson wrote:
> > On Wed, 26 Nov 2025 at 07:43, Md Sadre Alam <quic_mdalam@quicinc.com> w=
rote:
> >>
> >> Enable Inline Crypto Engine (ICE) support for CQE-capable sdhci-msm
> >> controllers when used with eMMC cards that do not support CQE.
> >>
> >> This addresses the scenario where:
> >> - The host controller supports CQE (and has CQHCI crypto infrastructur=
e)
> >> - The eMMC card does not support CQE
> >> - Standard (non-CMDQ) requests need crypto support
> >>
> >> This allows hardware-accelerated encryption and decryption for standar=
d
> >> requests on CQE-capable hardware by utilizing the existing CQHCI crypt=
o
> >> register space even when CQE functionality is not available due to car=
d
> >> limitations.
> >>
> >> The implementation:
> >> - Adds ICE register definitions for non-CQE crypto configuration
> >> - Implements per-request crypto setup via sdhci_msm_ice_cfg()
> >> - Hooks into the request path via mmc_host_ops.request for non-CQE req=
uests
> >> - Uses CQHCI register space (NONCQ_CRYPTO_PARM/DUN) for crypto configu=
ration
> >>
> >> With this, CQE-capable controllers can benefit from inline encryption
> >> when paired with non-CQE cards, improving performance for encrypted I/=
O
> >> while maintaining compatibility with existing CQE crypto support.
> >>
> >> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> >> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> >
> > This has been applied for next since a few weeks, but I have a
> > question. See more below.
> >
> > [...]
> >
> >>
> >>   drivers/mmc/host/sdhci-msm.c | 77 ++++++++++++++++++++++++++++++++++=
++
> >>   1 file changed, 77 insertions(+)
> >>
> >> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm=
.c
> >> index 3b85233131b3..da356627d9de 100644
> >> --- a/drivers/mmc/host/sdhci-msm.c
> >> +++ b/drivers/mmc/host/sdhci-msm.c
> >> @@ -157,6 +157,17 @@
> >>   #define CQHCI_VENDOR_CFG1      0xA00
> >>   #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN  (0x3 << 13)
> >>
> >> +/* non command queue crypto enable register*/
> >> +#define NONCQ_CRYPTO_PARM              0x70
> >> +#define NONCQ_CRYPTO_DUN               0x74
> >> +
> >> +#define DISABLE_CRYPTO                 BIT(15)
> >> +#define CRYPTO_GENERAL_ENABLE          BIT(1)
> >> +#define HC_VENDOR_SPECIFIC_FUNC4       0x260
> >> +
> >> +#define ICE_HCI_PARAM_CCI      GENMASK(7, 0)
> >> +#define ICE_HCI_PARAM_CE       GENMASK(8, 8)
> >> +
> >>   struct sdhci_msm_offset {
> >>          u32 core_hc_mode;
> >>          u32 core_mci_data_cnt;
> >> @@ -300,6 +311,7 @@ struct sdhci_msm_host {
> >>          u32 dll_config;
> >>          u32 ddr_config;
> >>          bool vqmmc_enabled;
> >> +       bool non_cqe_ice_init_done;
> >>   };
> >>
> >>   static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct s=
dhci_host *host)
> >> @@ -2012,6 +2024,68 @@ static int sdhci_msm_ice_keyslot_evict(struct b=
lk_crypto_profile *profile,
> >>          return qcom_ice_evict_key(msm_host->ice, slot);
> >>   }
> >>
> >> +static void sdhci_msm_non_cqe_ice_init(struct sdhci_host *host)
> >> +{
> >> +       struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> >> +       struct sdhci_msm_host *msm_host =3D sdhci_pltfm_priv(pltfm_hos=
t);
> >> +       struct mmc_host *mmc =3D msm_host->mmc;
> >> +       struct cqhci_host *cq_host =3D mmc->cqe_private;
> >> +       u32 config;
> >> +
> >> +       config =3D sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
> >> +       config &=3D ~DISABLE_CRYPTO;
> >> +       sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
> >> +       config =3D cqhci_readl(cq_host, CQHCI_CFG);
> >> +       config |=3D CRYPTO_GENERAL_ENABLE;
> >> +       cqhci_writel(cq_host, config, CQHCI_CFG);
> >> +}
> >> +
> >> +static void sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_req=
uest *mrq)
> >> +{
> >> +       struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> >> +       struct sdhci_msm_host *msm_host =3D sdhci_pltfm_priv(pltfm_hos=
t);
> >> +       struct mmc_host *mmc =3D msm_host->mmc;
> >> +       struct cqhci_host *cq_host =3D mmc->cqe_private;
> >> +       unsigned int crypto_params =3D 0;
> >> +       int key_index;
> >> +
> >> +       if (mrq->crypto_ctx) {
> >> +               if (!msm_host->non_cqe_ice_init_done) {
> >> +                       sdhci_msm_non_cqe_ice_init(host);
> >> +                       msm_host->non_cqe_ice_init_done =3D true;
> >> +               }
> >> +
> >> +               key_index =3D mrq->crypto_key_slot;
> >> +               crypto_params =3D FIELD_PREP(ICE_HCI_PARAM_CE, 1) |
> >> +                               FIELD_PREP(ICE_HCI_PARAM_CCI, key_inde=
x);
> >> +
> >> +               cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM=
);
> >> +               cqhci_writel(cq_host, lower_32_bits(mrq->crypto_ctx->b=
c_dun[0]),
> >> +                            NONCQ_CRYPTO_DUN);
> >> +       } else {
> >> +               cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM=
);
> >
> > Should we really call cqhci_writel() here, even if
> > sdhci_msm_non_cqe_ice_init() has not been called yet?
> >
> Thanks for the pointing this. The else branch is intentional.
> for plain requests we must clear the crypto registers, otherwise
> the ICE hardware would continue using the previous encryption context.
> ICE initialization is only required when programming an encryption
> context, so we don=E2=80=99t call sdhci_msm_non_cqe_ice_init() in the pla=
in
> path. Writing 0 to NONCQ_CRYPTO_PARM is safe without ICE init and
> ensures that subsequent plain requests are handled correctly

Thanks for clarifying!

Kind regards
Uffe

