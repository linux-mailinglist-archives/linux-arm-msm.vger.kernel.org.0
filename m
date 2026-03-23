Return-Path: <linux-arm-msm+bounces-99280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNFyHfFDwWnpRwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:45:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CE72F33A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CFFA3047E72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0B23AC0D0;
	Mon, 23 Mar 2026 13:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7zrVHz8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62613AC0CC
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273032; cv=none; b=NprMKY8QykE5Xd7Ol8dA6d7MIZcWL8JJ7O0vsVRcRhycze8AhmJD3KZPHExnpIB0E0d/BkmZEi8I4oBtFKeBDnei3pmr+XSrCzh8HacgjKA0sFT9orxzljkfDroEH2pU18758ndNiT4v7jbpkBss6ox+csHPxxHQcZo1HR0DSfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273032; c=relaxed/simple;
	bh=bv/SaUq1HdOMFnRKapZs5n44wqZCvMp+Q5Yg1ZUqQT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AbGn1c8UJCAN2PDZW96vogb2nBwAliJ1lwASjvFOPLh6g9iAHhn7QCwRU9WUHEPwRoFqd0qaEwHgdtybEwAUY5ZrCH/JnN0ZPDzfwvt/C1sL9hAw1ARpwk0idTfATgzwClF6Mi68NKpLouoT4vQ9HDAYUFk7L+rGmp/UC2hswaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7zrVHz8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F5BFC2BCB4
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774273032;
	bh=bv/SaUq1HdOMFnRKapZs5n44wqZCvMp+Q5Yg1ZUqQT4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m7zrVHz8jG70gOBJcuvGd9dQDhChoJnZeciGZMEwB53wUhOugKsxbQdtTrzaMLE3K
	 woO/Y0CCFVTtdfxh7PBN0MdrIo/XxqM+d1R6o95whzgIxItgVy1RiPKVlCgpnSYUJn
	 3rC/v/c6EyhgWN07TN5XFfJM0fHtI7fIJ6Ax7QK1CyvhBX6dJJqIycyep4Lr0vs/3K
	 5vf/eoZ90MF5eg1u1jFqhozl0yY8btTvkEWzPUtTccVnHiwkQN12MKkhvfz1G0OJkN
	 LEn9AaxmO+cngxDe3AgvKNSpPpZyP6KFlH3OLBIfRGoQYTmaZiRBHIvCCB3vbuQo1K
	 xrIdkAq1a9mqg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a13f6bcbf4so182556e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:37:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWar7btAyq8WPWBY2mxXfdtV5R2Hx5cnguac5xOMGK4AfBBJlp/qKbe1kU7ncx5iMJYTgLm/qctVgeL3i/W@vger.kernel.org
X-Gm-Message-State: AOJu0YxAZola8urMB7JTs3hotvqPnPAKRwV3JJyz0R5j69hdd+i4J1Ss
	BYcGUsMhQeoiwa22sE10ak36SBW7Siuq7pxuJXgV8chjeQkNoIrPjgnfrTFgx4zBidK7aBovJ+P
	8hD8XwdAWaV+HIWhvk9MuUvv03XWIMcYd2WamLDWdwA==
X-Received: by 2002:a05:6512:10d3:b0:5a1:7458:c17e with SMTP id
 2adb3069b0e04-5a285b55dd3mr3848196e87.37.1774273031248; Mon, 23 Mar 2026
 06:37:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
 <20260317-qcom-qce-cmd-descr-v13-5-0968eb4f8c40@oss.qualcomm.com> <hohx2judes5c6na4svpah254hqbaf4kbeyu7prwkprfv5dy7hj@26nxwlvb76yp>
In-Reply-To: <hohx2judes5c6na4svpah254hqbaf4kbeyu7prwkprfv5dy7hj@26nxwlvb76yp>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Mar 2026 14:36:59 +0100
X-Gmail-Original-Message-ID: <CAMRc=McostnmVjE=uV=2KA7-dqLvQ2BAJYTXzANacFpPGgS+Sw@mail.gmail.com>
X-Gm-Features: AaiRm52smHlzaZX3o3c7rJCXBkH0quFZvqCL-0liNookxclyfizWuRA5g5cCXoU
Message-ID: <CAMRc=McostnmVjE=uV=2KA7-dqLvQ2BAJYTXzANacFpPGgS+Sw@mail.gmail.com>
Subject: Re: [PATCH v13 05/12] dmaengine: qcom: bam_dma: add support for BAM locking
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Udit Tiwari <quic_utiwari@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99280-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D0CE72F33A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 10:35=E2=80=AFAM Manivannan Sadhasivam <mani@kernel=
.org> wrote:
>
> On Tue, Mar 17, 2026 at 03:02:12PM +0100, Bartosz Golaszewski wrote:
> > Add support for BAM pipe locking. To that end: when starting DMA on an =
RX
> > channel - prepend the existing queue of issued descriptors with an
> > additional "dummy" command descriptor with the LOCK bit set. Once the
> > transaction is done (no more issued descriptors), issue one more dummy
> > descriptor with the UNLOCK bit.
>
> I've left some comments in v12, but looks like you've missed them.

Sorry for that, as I explained in private, this email did not end up
in my inbox and I didn't see it on lore.

> >
> > +static int bam_metadata_attach(struct dma_async_tx_descriptor *desc, v=
oid *data, size_t len)
> > +{
> > +     struct bam_chan *bchan =3D to_bam_chan(desc->chan);
> > +     const struct bam_device_data *bdata =3D bchan->bdev->dev_data;
> > +     struct bam_desc_metadata *metadata =3D data;
> > +
> > +     if (!data)
> > +             return -EINVAL;
> > +
> > +     if (!bdata->pipe_lock_supported)
> > +             return -EOPNOTSUPP;
>
> As mentioned in v12, you should return 0 to avoid erroring out the client=
s if
> pipe lock is not supported.
>

If the client attaches the scratchpad register then it probably does
want to use locking, right? On the other hand, I assume you're
thinking about a situation where the client wants locking but BAM does
not support it. It's unlikely but ok, I'll change it.

> >
> > +static struct bam_async_desc *
> > +bam_make_lock_desc(struct bam_chan *bchan, struct scatterlist *sg,
> > +                struct bam_cmd_element *ce, unsigned long flag)
> > +{
> > +     struct dma_chan *chan =3D &bchan->vc.chan;
> > +     struct bam_async_desc *async_desc;
> > +     struct bam_desc_hw *desc;
> > +     struct virt_dma_desc *vd;
> > +     struct virt_dma_chan *vc;
> > +     unsigned int mapped;
> > +     dma_cookie_t cookie;
> > +     int ret;
> > +
> > +     sg_init_table(sg, 1);
> > +
> > +     async_desc =3D kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
> > +     if (!async_desc) {
> > +             dev_err(bchan->bdev->dev, "failed to allocate the BAM loc=
k descriptor\n");
> > +             return NULL;
> > +     }
> > +
> > +     async_desc->num_desc =3D 1;
> > +     async_desc->curr_desc =3D async_desc->desc;
> > +     async_desc->dir =3D DMA_MEM_TO_DEV;
> > +
> > +     desc =3D async_desc->desc;
> > +
> > +     bam_prep_ce_le32(ce, bchan->scratchpad_addr, BAM_WRITE_COMMAND, 0=
);
> > +     sg_set_buf(sg, ce, sizeof(*ce));
> > +
> > +     mapped =3D dma_map_sg_attrs(chan->slave, sg, 1, DMA_TO_DEVICE, DM=
A_PREP_CMD);
> > +     if (!mapped) {
> > +             kfree(async_desc);
> > +             return NULL;
> > +     }
> > +
> > +     desc->flags |=3D cpu_to_le16(DESC_FLAG_CMD | flag);
> > +     desc->addr =3D sg_dma_address(sg);
> > +     desc->size =3D sizeof(struct bam_cmd_element);
> > +
> > +     vc =3D &bchan->vc;
> > +     vd =3D &async_desc->vd;
> > +
> > +     dma_async_tx_descriptor_init(&vd->tx, &vc->chan);
> > +     vd->tx.flags =3D DMA_PREP_CMD;
> > +     vd->tx.desc_free =3D vchan_tx_desc_free;
> > +     vd->tx_result.result =3D DMA_TRANS_NOERROR;
> > +     vd->tx_result.residue =3D 0;
> > +
> > +     cookie =3D dma_cookie_assign(&vd->tx);
> > +     ret =3D dma_submit_error(cookie);
> > +     if (ret)
> > +             return NULL;
>
> You are leaking async_desc here.
>

Yeah, not only that but also should unmap the sg here too. Thanks.

> > +
> > +     return async_desc;
> > +}
> > +
> > +static int bam_do_setup_pipe_lock(struct bam_chan *bchan, bool lock)
> > +{
> > +     struct bam_device *bdev =3D bchan->bdev;
> > +     const struct bam_device_data *bdata =3D bdev->dev_data;
> > +     struct bam_async_desc *lock_desc;
> > +     struct bam_cmd_element *ce;
> > +     struct scatterlist *sgl;
> > +     unsigned long flag;
> > +
> > +     lockdep_assert_held(&bchan->vc.lock);
> > +
> > +     if (!bdata->pipe_lock_supported || !bchan->scratchpad_addr ||
> > +         bchan->slave.direction !=3D DMA_MEM_TO_DEV)
> > +             return 0;
> > +
> > +     if (lock) {
> > +             sgl =3D &bchan->lock_sg;
> > +             ce =3D &bchan->lock_ce;
> > +             flag =3D DESC_FLAG_LOCK;
> > +     } else {
> > +             sgl =3D &bchan->unlock_sg;
> > +             ce =3D &bchan->unlock_ce;
> > +             flag =3D DESC_FLAG_UNLOCK;
> > +     }
> > +
> > +     lock_desc =3D bam_make_lock_desc(bchan, sgl, ce, flag);
> > +     if (!lock_desc)
> > +             return -ENOMEM;
> > +
> > +     if (lock)
> > +             list_add(&lock_desc->vd.node, &bchan->vc.desc_issued);
> > +     else
> > +             list_add_tail(&lock_desc->vd.node, &bchan->vc.desc_issued=
);
> > +
> > +     bchan->locked =3D lock;
>
> What is this flag for?
>

Just a leftover. I'll drop it, thanks.

> >
> > +struct bam_desc_metadata {
> > +     phys_addr_t scratchpad_addr;
>
> I think it'd be worth adding a comment for this.
>

Will do.

Bart

