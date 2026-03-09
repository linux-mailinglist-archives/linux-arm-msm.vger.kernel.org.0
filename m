Return-Path: <linux-arm-msm+bounces-96309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL+OKYz/rmkLLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 18:12:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D9923D72A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 18:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A65230465EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 17:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09AF53B8BDA;
	Mon,  9 Mar 2026 17:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="msJ9oAje"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E38B3B52F5
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 17:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075962; cv=none; b=CjmmyxS4qSle0qDwlipK/ntuBT5e86rF5zPibHRZhWFhKeW1uqyGT4zYp5q9oAwdJyKyMNJO7WgTT+W2At++alij+rF6+dc2DmDyAi8Mk9qiPPBp84GPLTnDZeP0M7h+aDADEGdTiyDuAc4u4YNkjY80sHQA+lOTdgxhwduLhVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075962; c=relaxed/simple;
	bh=Nl4HOblw010V5+pE2S/P/QX3P3lziK39Je/lLiEZbvE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gp5YTeeIfC3LmEwIhjs57KGejcvk7bIMYg9ODnPvn21P0YX3oEdB+lMJdkGABXWn/q6RANIQvhd/rLwvNIX09KMa94sjT2blaEklUykR6uxyMIR68XhbaSI++FE+a3PoYffe3erubxBopxdAKZYWZrXiWio3uJPzmuuMTj8Ud4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=msJ9oAje; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B0CC2BCB0
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 17:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773075961;
	bh=Nl4HOblw010V5+pE2S/P/QX3P3lziK39Je/lLiEZbvE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=msJ9oAje6XKRBiEcmRn6agM1ATb9XB+mU9szxDE5oy0CgM93IevTTJBgRvcMXGktR
	 qRT3Pxw4P5kUEjZChe6QDzxP8PTH8eKaLqCpxyQYCI+ws7OTREm8BMNwjGcw4ExGDk
	 qKwrcfrRcw2A+/EngBSaxms6bOiYHPLFyTpcxPHJbpwfy9gbbwPYY4BOEckGNpfUNT
	 Gt795UqTJev2IoROC4z4YjFkqF+3tZevrIHbaykSVpvMtH32+i3+g38B1KBxsvJwaq
	 Mtok5zno1dFBgDHxqDv0ni+cqE3lD5qb4aBQAEIMI6vrTqRRVdsl+f7eE+hzDy3rPv
	 Pq2uWLNYztldg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38a2a59baa6so48743831fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 10:06:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgTmJltxyDJ+JxIMQ6t8YGsBNK5LW/Ovr3bzgvXfZw8UQZNORHEZQfMssvYjGpfKMdNeyILqnHlapTzbAV@vger.kernel.org
X-Gm-Message-State: AOJu0YxNy7KVBoMJQpM8PwgLQYKrOlkPjcu68zs036f7VbYAm69hS9b0
	RhKPuXcqMLdXPRGJ4Bsrfecl6wc2ZFtKcHYweBy2ujImiaSfTq1CVOyYjNjzdqjblil6hSF40AB
	bVhFFDJQ0eWOJIPaG4c5FmUntpRZFPJjXURS2jTvY5A==
X-Received: by 2002:a05:651c:2212:b0:38a:42ec:9f84 with SMTP id
 38308e7fff4ca-38a42ec9ffcmr33518861fa.4.1773075960460; Mon, 09 Mar 2026
 10:06:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 10:05:59 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 10:05:59 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aayLkmDRLMuTzXZv@vaman>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
 <20260302-qcom-qce-cmd-descr-v11-12-4bf1f5db4802@oss.qualcomm.com>
 <aahHeR9j7q4_ynYK@vaman> <CAMRc=Mc48+NyMPkFRa8GPv-odCe=r9WXJWUZYkTsaY53Ev_stQ@mail.gmail.com>
 <aayLkmDRLMuTzXZv@vaman>
Date: Mon, 9 Mar 2026 10:05:59 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeJNQq8AF9SrJYY=CNOF62UXpaX7Tzuk5VSfaXoWSCGRg@mail.gmail.com>
X-Gm-Features: AaiRm52AwUikzvApltwtSp3ZuI8KyckqNAj_xcMnQHdUmblkYlZhjv-tlMSJcGs
Message-ID: <CAMRc=MeJNQq8AF9SrJYY=CNOF62UXpaX7Tzuk5VSfaXoWSCGRg@mail.gmail.com>
Subject: Re: [PATCH RFC v11 12/12] dmaengine: qcom: bam_dma: add support for
 BAM locking
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 16D9923D72A
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
	TAGGED_FROM(0.00)[bounces-96309-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,kernel.org,amd.com,vger.kernel.org,lists.infradead.org,linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, 7 Mar 2026 21:33:22 +0100, Vinod Koul <vkoul@kernel.org> said:
> On 04-03-26, 16:27, Bartosz Golaszewski wrote:
>> On Wed, Mar 4, 2026 at 3:53=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wro=
te:
>> >
>> > On 02-03-26, 16:57, Bartosz Golaszewski wrote:
>> > > Add support for BAM pipe locking. To that end: when starting the DMA=
 on
>> > > an RX channel - wrap the already issued descriptors with additional
>> > > command descriptors performing dummy writes to the base register
>> > > supplied by the client via dmaengine_slave_config() (if any) alongsi=
de
>> > > the lock/unlock HW flags.
>> > >
>> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm=
.com>
>>
>> [snip]
>>
>> > > +static struct bam_async_desc *
>> > > +bam_make_lock_desc(struct bam_chan *bchan, struct scatterlist *sg,
>> > > +                struct bam_cmd_element *ce, unsigned int flag)
>> > > +{
>> > > +     struct dma_chan *chan =3D &bchan->vc.chan;
>> > > +     struct bam_async_desc *async_desc;
>> > > +     struct bam_desc_hw *desc;
>> > > +     struct virt_dma_desc *vd;
>> > > +     struct virt_dma_chan *vc;
>> > > +     unsigned int mapped;
>> > > +     dma_cookie_t cookie;
>> > > +     int ret;
>> > > +
>> > > +     async_desc =3D kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
>> > > +     if (!async_desc) {
>> > > +             dev_err(bchan->bdev->dev, "failed to allocate the BAM =
lock descriptor\n");
>> > > +             return NULL;
>> > > +     }
>> > > +
>> > > +     async_desc->num_desc =3D 1;
>> > > +     async_desc->curr_desc =3D async_desc->desc;
>> > > +     async_desc->dir =3D DMA_MEM_TO_DEV;
>> > > +
>> > > +     desc =3D async_desc->desc;
>> > > +
>> > > +     bam_prep_ce_le32(ce, bchan->slave.dst_addr, BAM_WRITE_COMMAND,=
 0);
>> > > +     sg_set_buf(sg, ce, sizeof(*ce));
>> > > +
>> > > +     mapped =3D dma_map_sg_attrs(chan->slave, sg, 1, DMA_TO_DEVICE,=
 DMA_PREP_CMD);
>> > > +     if (!mapped) {
>> > > +             kfree(async_desc);
>> > > +             return NULL;
>> > > +     }
>> > > +
>> > > +     desc->flags |=3D cpu_to_le16(DESC_FLAG_CMD | flag);
>> > > +     desc->addr =3D sg_dma_address(sg);
>> > > +     desc->size =3D sizeof(struct bam_cmd_element);
>> > > +
>> > > +     vc =3D &bchan->vc;
>> > > +     vd =3D &async_desc->vd;
>> > > +
>> > > +     dma_async_tx_descriptor_init(&vd->tx, &vc->chan);
>> > > +     vd->tx.flags =3D DMA_PREP_CMD;
>> > > +     vd->tx.desc_free =3D vchan_tx_desc_free;
>> > > +     vd->tx_result.result =3D DMA_TRANS_NOERROR;
>> > > +     vd->tx_result.residue =3D 0;
>> > > +
>> > > +     cookie =3D dma_cookie_assign(&vd->tx);
>> > > +     ret =3D dma_submit_error(cookie);
>> >
>> > I am not sure I understand this.
>> >
>> > At start you add a descriptor in the queue, ideally which should be
>> > queued after the existing descriptors are completed!
>> >
>> > Also I thought you want to append Pipe cmd to descriptors, why not do
>> > this while preparing the descriptors and add the pipe cmd and start an=
d
>> > end of the sequence when you prepare... This was you dont need to crea=
te
>> > a cookie like this
>> >
>>
>> Client (in this case - crypto engine) can call
>> dmaengine_prep_slave_sg() multiple times adding several logical
>> descriptors which themselves can have several hardware descriptors. We
>> want to lock the channel before issuing the first queued descriptor
>> (for crypto: typically data descriptor) and unlock it once the final
>> descriptor is processed (typically command descriptor). To that end:
>> we insert the dummy command descriptor with the lock flag at the head
>> of the queue and the one with the unlock flag at the tail - "wrapping"
>> the existing queue with lock/unlock operations.
>
> Why not do this per prep call submitted to the engine. It would be
> simpler to just add lock and unlock to the start and end of transaction.
>

Becuase then we'd have:

  [LOCK] [DATA] [UNLOCK] [LOCK] [CMD] [UNLOCK]

while what we want is:

  [LOCK] [DATA] [CMD] [UNLOCK]

Bartosz

