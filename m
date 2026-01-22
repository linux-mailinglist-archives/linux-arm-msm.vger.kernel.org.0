Return-Path: <linux-arm-msm+bounces-90163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKptKUL6cWmvZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:21:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 591D16529B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 55DEB6687DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4993BB9EF;
	Thu, 22 Jan 2026 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X0ZNhErN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCED037FF5F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769076890; cv=pass; b=K5WbXwQ8bLNhAUQDvct/+Y/umW845OG2OCZpOqgLk4FQO3GJ3xitPDITVOGqOwlLqJ2n7j6lbOZr25ATnsCSAJ4eUqaFMQzBqslUBCx/X80SOGkd3fPCFMRNfIlEggYa+fjdkhidJg3vqHjQS0wgt1Dk3Zn8Wh1Ckg9iEOKbjnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769076890; c=relaxed/simple;
	bh=Cu3pdIVEfPdjTaeNYZyDRLhQfT3kIup9uEOtljEl9TM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lm67QrLezNUEC3mOFFqfOq5Zqojb2iqJCth/q+H0fISAEa+fBAYMcSdAPa8ULOdGE/ILuYMhM934QFzCvrF4wnOTwPM3IZU+bcf/uBDrVnUSkapAcwbcmGnFUpK2sRo+Nx5wl1QSTT6bhm30vIRtNoiBwhuUF85SZ4CCpkYcSDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X0ZNhErN; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59dcd9b89ecso974001e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:14:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769076885; cv=none;
        d=google.com; s=arc-20240605;
        b=OLlAPrGmcVIHIAmzGNt6XGLV5w7N6H3FroBgShgOjrGEIDL61NuLUn7Q9vQ20375C3
         Q3PNWO8eY/X7NxRINfsTWtibJ1KjCrsUwVfuKInBUcK48GmEVci/6v1Lq/kvzHM492UG
         YQFk/2sXW7NI4jNJmG4Lcz8HAQPwE9ExM4QPpNO27no5RC6WT+lgiq4Q+WlQkbJa2HA2
         aYUlB1m6RZx86EsnPd55HO+btig5bPZYySCUN/o9mamTpU4eJxg7yBQmAfckiHewmswg
         x8zi5bhbe321Zq7OwVpOhYV0Uo5ybgRgmyXHDTz4qefqecXwP1HTO5/Gmw3dCCm+Z0L+
         LwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iFxgYJSYl0l4H5knWMT36IYuoddICbrhUa++V+YA7GI=;
        fh=bmoVIzXhLqo+VUusH0tN/B7YEBxHAnoEf6fVia5emAw=;
        b=dJZ4c9tDq6vXVLsfNn1p/m1+7u25nwj6mm819OXv68hBBpfE4lihoZVjr9lRMDGCmo
         J+KpJaCX4fWrmxJwzuyNVVE5ymUgi01RUeiiH5WcMQWaGV8/esdombEAGib/BlMjb2Ui
         Uz7R8q3L4EJ83afm9Chl+SCgjIQW3/J4FiC35gywYh2EUFPdHQ3Ms0JT2QGUChQJ6PSq
         4MTIiiP584dPiAAFXc/41BySDkM5sypmooINfLx7rdpyccAZ1hXqiKN/DOMXECtntj+i
         X0GDKZgkhE1pbRZJJanD18frYEtfbbAVrYH1aPFT49G+hn594+KQeSHN6mA8Tj+zso16
         WtiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769076885; x=1769681685; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iFxgYJSYl0l4H5knWMT36IYuoddICbrhUa++V+YA7GI=;
        b=X0ZNhErNjENapoQqj+sT/QD4QA/GsdZGuE1eQnXIVKj4VKWrFtLaO8eVoeB8UxPJYu
         1Dy/d2/YimHx1LlQgBAI1D9ZpYROJhEIKi1MuPIPLitk8M1cmnnraJL5kRRka50JqN6/
         7EINMj5ckBYJWRbgdvPoQKjp+FhJLQbCQnHKtxbd7YpMR4f6UPXyMlcAo6dPz5gy5++n
         yOk+v/6ri5chW/4eCNkvyoeNMuMNTllaObficuF2O4qQFoROT79Iu2tgHXIS6689yCNO
         Bk9kxOf8aL9b8tqvuKa0NGReEAgocLH1zMRDTaPMgsrvEMD48uCSwmr7RkcR5K1d+17z
         9Snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769076885; x=1769681685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFxgYJSYl0l4H5knWMT36IYuoddICbrhUa++V+YA7GI=;
        b=w4FvUOXz7ndYCx3/DjlqZkH5cmgO1eC9W5Uh9zHRvJaEeVmK8GRi7UO3vO2EJf0qYL
         hijz97OkYqwIPRZvO8O417VL+r5uP2pMoQv2SiTsxHv4KfrGlpm1IFrjnnG0yobRE5Zs
         A74mKc5wNzIUNAPF2NHlXO4ZStt5VMYDyKTrxY2dve4Nc9jL+/jgyNtmK1UQtBw5saJI
         p3N3FuxcdcLuBfJPivkf7CF30Yk+WghtgQRv0r8Lo7eoc79iPh77rDEPPhO2joW5nMxk
         L1x9ZkxiiPPhTS4JUkQaV+QvxshSZX9B2KuYNwPrl+FPmbNjx1Em2k6mJz1OGpzrJoFg
         IRbg==
X-Forwarded-Encrypted: i=1; AJvYcCXkxYDm+zjUfPROFiT2MtBaxGrefpBzB/jDnQtIIg1dk9S4oS0ImfyuPSCBwSpCJVs7NwLBECuPSGCyZmun@vger.kernel.org
X-Gm-Message-State: AOJu0YxCAPw8At9Ln5YVZWt4Q5knz7bbELiDLGdooImM8+w+/0b2lpwr
	WHbIEeRHsZwIjfUyKVnzJibwBlwa45c53BeVdlAKCAoqcwQd8D17Tio0CpFyuOBOog8HxjECyWo
	8XuokzdFMknnaYNH2SIycNlcEnAj20DJEtLM8IqDr7C1GbcROHsL7DDU=
X-Gm-Gg: AZuq6aI1gFZED0gxPsLKdt0m3uaaF5cEtCt0+y7DTMm5nqYKQpgc7PSWt1VdoRatgRk
	yhtiGuc8MznVLQgSQPny6VQumj5Deu+jpjzb1PaH7GP0DAHDn1Ajvl8cv4CywErjilFrQ7NdBlC
	lx9ihjpw8sWNuv1eL6Lw5jaRqWQGHNIGejEDn8xetfOR0IiSc6X01HcgcX+7BeMtK2cZVILR2tM
	PELho1JAvMerJVinOzwU5uqI2bQdQRLJoIu0WZgoUVnJMnjj/BjyhTAVvl1HGxk7eaAeA4g
X-Received: by 2002:a05:6512:104e:b0:59b:afeb:fcbc with SMTP id
 2adb3069b0e04-59dd7bdd715mr794653e87.2.1769076884744; Thu, 22 Jan 2026
 02:14:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116121004.1829223-1-neeraj.soni@oss.qualcomm.com>
 <CAPDyKFrOHqStZbsye9Quk71UGkzUxOkwG9yAGYFVvt+=nMJSyw@mail.gmail.com> <20260122011417.GB946159@google.com>
In-Reply-To: <20260122011417.GB946159@google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 22 Jan 2026 11:14:08 +0100
X-Gm-Features: AZwV_Qhr-RztpM_calQdXu3awF0X3dzGBOat8oVtDLbE6D7-FrCI4oiiBe5LWnc
Message-ID: <CAPDyKFoPVeu3xe7ZAxBTNFfHmf=f7OZ3iUG=pRG8mD=UOGNVPA@mail.gmail.com>
Subject: Re: [PATCH v4] mmc: Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
To: Eric Biggers <ebiggers@kernel.org>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>, adrian.hunter@intel.com, 
	quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com, 
	quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com, 
	quic_sartgarg@quicinc.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90163-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 591D16529B
X-Rspamd-Action: no action

On Thu, 22 Jan 2026 at 02:14, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Jan 21, 2026 at 03:12:43PM +0100, Ulf Hansson wrote:
> > > diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
> > > index fec4fbf16a5b..a5a90bfc634e 100644
> > > --- a/drivers/mmc/core/crypto.c
> > > +++ b/drivers/mmc/core/crypto.c
> > > @@ -15,7 +15,7 @@
> > >  void mmc_crypto_set_initial_state(struct mmc_host *host)
> > >  {
> > >         /* Reset might clear all keys, so reprogram all the keys. */
> > > -       if (host->caps2 & MMC_CAP2_CRYPTO)
> > > +       if ((host->caps2 & MMC_CAP2_CRYPTO) && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
> > >                 blk_crypto_reprogram_all_keys(&host->crypto_profile);
> >
> > As far as I understand, calling blk_crypto_reprogram_all_keys() would
> > only be needed for those mmc hosts that lose their corresponding ICE
> > context during runtime+system suspend, reset and possibly during
> > ->probe().
> >
> > In other words, calling mmc_crypto_set_initial_state() from
> > mmc_set_initial_state() looks like it's a mistake, as it has really
> > nothing to do with the card's initialization, unless I have understood
> > this wrong!?
> >
> > That said, I would rather make the mtk-sd and sdhci-msm drivers to
> > handle this themselves, by explicitly calling
> > blk_crypto_reprogram_all_keys() when needed - and drop
> > mmc_crypto_set_initial_state() altogether.
> >
> > For the sdhci-msm case, it seems like the only case we need to care
> > about is for the reset.
> >
> > For mtk-sd I don't know what is needed, but possibly Eric can help out here?
>
> The comment for mmc_set_initial_state() says "Set initial state after a
> power cycle or a hw_reset."  I relied on that when I added the call to
> mmc_crypto_set_initial_state() back in 2020.  In the following thread it
> was also discussed that the code was intended to reprogram the keys on
> reset, not runtime suspend as that shouldn't be needed:
> https://lore.kernel.org/linux-mmc/X7gQ9Y44iIgkiM64@sol.localdomain/T/#u

The comment in the mmc_set_initial_state() is referring to the card
and not the host controller. There have been some similar
misunderstandings in the past for other functions in the core, sorry.

In any case, I have been trying to understand where the ICE context
really belongs and recently Neeraj answered that question [1].

>
> If that is not what it actually does, it probably would be appropriate
> to replace it with something else.

I agree, the comment(s) could deserve some clarifications.

>
> - Eric

Kind regards
Uffe

[1]
https://lore.kernel.org/all/e1f689d0-523b-5842-3a6e-10b431d617ce@oss.qualcomm.com/

