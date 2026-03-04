Return-Path: <linux-arm-msm+bounces-95358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKqVAqlMqGnUswAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 16:15:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F561202634
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 16:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92D1C314E3BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 15:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FF833985A;
	Wed,  4 Mar 2026 15:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXd9GKw6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2F53382C8
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 15:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772636766; cv=none; b=do8rFxZk2r/BykvEjxMnz0bn5bm6d2x12CCV3s3mNQ7m6EFWyjMZY2TIKhKVjrq9+uzBS6kX3hJElxWJVDArMLXX7Zit39MujWsVMe2xoXfQ3fxbFzG/PPtMTeKOnF779qk9PM+dAOmciqwFWNkFp7gebws4fs50CyxI8x0+HRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772636766; c=relaxed/simple;
	bh=gxAcEfjco4wGcd5mrryQitiaU7LNC8vhE9G14RTHDDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYl8Q8B8M7gH40WYNc+ooDNgRV8uL90zaXywjhsf9LkNqcPk/BDxgpqrRukG7Q5cYlXU4SkptDZ7LsfF0TqtKtdTXCruiSJQ1qde7VDndvgFbCrf6ZSX9NeEujB621HXLkqRpdTYdZ6WTwZI1K8EbVzi2XGLGbF1RCvxWMloYaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXd9GKw6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF18C2BCB1
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 15:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772636766;
	bh=gxAcEfjco4wGcd5mrryQitiaU7LNC8vhE9G14RTHDDo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GXd9GKw66/RCES5/LDmh94gtKijy68iTiVF7ojlM67lcaT22ypzTDzXcxsFJblQ6l
	 W6ejBD0MtWbJIHL5/oXbb7GeyJdKsNkyOPuHJwq2LJWBUs9Z+ZZgAxTMGZXyWG/y41
	 nmPiyrTkAoeQqffmxjP9IU0KCXecY75c2KMtDeZa5F/iGV1/irZ6HW6hSq8TcPwNfu
	 onqJ7QVaCLjNZsk8hiP4+IP/yJjKDCos9GqzS1n6rIz9/zcxFW1aYFm+ZLJ4za9yVE
	 cl17M7asN0sOHqdfifMeQ+Ym00xoTvAUxYPaWQmwQcDru+jF34WmDDtgbZskwy1WZV
	 FdgyxnC6U9+9Q==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a2f92fab4so9129251fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 07:06:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXIRNp1Aia44fMsw1Q8PURq+/hsL2hszPgh4yVK/tmNAKCQy8UuaeheHpmR02LrTZ2eRE8Bdb8jKWqwlOoO@vger.kernel.org
X-Gm-Message-State: AOJu0YxGF2I+JGO0l4aszfk85vgzqLtDaWd9H63FfsjHBEJ6gvsShoRe
	kehJOy9pz3OvIptbXH4RnCv9BvZLA3bzGoa4bjdX6xthWqSfe6SPW+gQapd7WI9iMPPMro4zgKx
	cpIGEyp/guRyLX7wfh8rbr0d3PF/WOIeeVanJ7pb+Wg==
X-Received: by 2002:a2e:8245:0:b0:386:1e28:4d72 with SMTP id
 38308e7fff4ca-38a2c7cf3f0mr16410411fa.30.1772636764859; Wed, 04 Mar 2026
 07:06:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
 <20260302-qcom-qce-cmd-descr-v11-7-4bf1f5db4802@oss.qualcomm.com> <aahEMjjBRINXL5zC@vaman>
In-Reply-To: <aahEMjjBRINXL5zC@vaman>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 4 Mar 2026 16:05:51 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md2G7k7DGMZv2Du75ososQtsAutw2WwwAQ3WL8pC_-LmQ@mail.gmail.com>
X-Gm-Features: AaiRm53H7_XeJS7KZNaUgV2GDd2SiLuqpmAUu8ZTp5xsf7mIRHhbSIEFXAiwXiE
Message-ID: <CAMRc=Md2G7k7DGMZv2Du75ososQtsAutw2WwwAQ3WL8pC_-LmQ@mail.gmail.com>
Subject: Re: [PATCH RFC v11 07/12] crypto: qce - Communicate the base physical
 address to the dmaengine
To: Vinod Koul <vkoul@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7F561202634
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95358-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,kernel.org,amd.com,vger.kernel.org,lists.infradead.org,linaro.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 3:39=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 02-03-26, 16:57, Bartosz Golaszewski wrote:
> > In order to let the BAM DMA engine know which address is used for
> > register I/O, call dmaengine_slave_config() after requesting the RX
> > channel and use the config structure to pass that information to the
> > dmaengine core. This is done ahead of extending the BAM driver with
> > support for pipe locking, which requires performing dummy writes when
> > passing the lock/unlock flags alongside the command descriptors.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >
> >       dma->txchan =3D devm_dma_request_chan(dev, "tx");
> >       if (IS_ERR(dma->txchan))
> > @@ -121,6 +123,12 @@ int devm_qce_dma_request(struct qce_device *qce)
> >               return dev_err_probe(dev, PTR_ERR(dma->rxchan),
> >                                    "Failed to get RX DMA channel\n");
> >
> > +     cfg.dst_addr =3D qce->base_phys;
> > +     cfg.direction =3D DMA_MEM_TO_DEV;
>
> So is this the address of crypto engine address where dma data is
> supposed to be pushed to..?
>

No. In case I wasn't clear enough in the cover letter: this is the
address of the *crypto engine* register which we use as a scratchpad
for the dummy write when issuing the lock/unlock command. Mani
suggested under the cover letter to use the descriptor metadata for
that.

Bart

