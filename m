Return-Path: <linux-arm-msm+bounces-103348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN/ALl+c4GnokAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:22:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1D240B78C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D95A31ABA47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 08:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695763806A4;
	Thu, 16 Apr 2026 08:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTAt2PIV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870E4390C88
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327476; cv=none; b=QRHtaM9vUf4cAL3DQ7TmTdZ7rYacd+RdQX+3gLx4EWVEQHg8f+VkCo+k3QxHYNGxt9Wj76XOGF2OCgxtvsZMwh8BwXTYgEjXAhEFXMihH1pitJ/WH9ZSN4hSx8PrH7aHgG0fzOeaEkj4IDioLi7C8sAXqirRuHAzzKKfogQa2GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327476; c=relaxed/simple;
	bh=lhKx86SAWyQDXPMvu/Dm6MZA48bUrd67Ya7+Q8UDXes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTeNq68ZgXOP35aVbVuJosJ45LJ3kMtoNTWh12el3q1si/Exx0AUV0ZkeBX50z/pk+Zd0HgA2GEKKHnZVjD5/K5vaDt5pA8c1luPOMVW70d8XzmXN1jQEhN/WA2Q4BZKqCMR2bspA+GakO2JfXnff8mVTepvr/jWlu5BWRd3Rgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTAt2PIV; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8d736211595so550282985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 01:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776327472; x=1776932272; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u2ZjfbInVFTY5PYo7jzcdvXUYZGYONUg3u6BG3gcFj4=;
        b=bTAt2PIVrk1eoZom4orivEzm7nHLeezZEBu9ab4HQ9VkNKVXAaZiQVBol8NXuAiPtR
         rER0Q+l+rJg6KgpgHkFcvF5dXdUhUPzb/dEoi79u7f+DXbV8JByIgGOvCxxD2EB9gjz6
         DaOIByge7JOP/hhazbBLT6T4/X4i4HXujQC19NpbY4vYFrFsiFTifS4qtUOGq6FnnI07
         ALLEJcgWm7FXquGqt/6YflA/PjV8IlZGVA+uDP+JpkJ1aurwwgp/Zhm8Iw4f5zhBSqT9
         W7F4VCDdi0Y8yDmo/BgpGE4D4FRgAdCTBaEaS+hi3pozGuZa+WjF324ZLC9rd0/GnD72
         YnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327472; x=1776932272;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u2ZjfbInVFTY5PYo7jzcdvXUYZGYONUg3u6BG3gcFj4=;
        b=SoTxX4A3RD2bJ+PBCIY1JyyxtayU03C7rZX82uHOGz2doA/blDgUaQl1xsioFN5iYz
         XG/EPnzTpKEzebgg0jqnXxVC+PWdVOUmqLi+fm4EY6W9jbRO6KVa1Eu2H1gBFZ0rmVPT
         ft8AeG/N2daTLle4aexcfuq5NC2gIzW0IbjFLuZ5mOOoRlBpFQ/TzkHX3gKHDokmnPP+
         RyXVDwzqrtaW00xnot9DNtEz3k1skqNZnum0IYQSnoHnrxYJDBVDeapUQIn3yNX431S/
         8Gs0VEF3kgd6Ibx48SHgmE1j6W0od/M9lN8HFnhru4SzOSGagh5cUn8epTQjGs6f/Ful
         2PZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8HfD382ACGp2JmBhu+CSs1CZdc9428OiFsaLs6JIDzLSjwb4SW2Dcyx8itAk/A9dNnoWl/TqjCWJGl2fyv@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ04HXby3tF+dSJRsAcvIgXRiRCyd/MukBBduEu6kUjXXKVph+
	kXYtjPIfRji8gdrA9w/CMpbvkXUC94hFf71fk67BfU6DkEjjuLfmJzU3
X-Gm-Gg: AeBDietL9ToDEvcKrXteGpqUvIJgr7yVP0Eaq9M1diZUauZbY7e4Pug4fns39JnwPkw
	OEHxSisro8AuuV1gCg2l99PlTTFDif7iUNbiBDCzum2F/pWQbUW/6BDBuGf8A0eJaGWv6teqOFp
	fk1BittOdVf53TtqQdhlIrWsbfmJuacTFHJz4V6lJpUleCZVN1K4bUoVgVJ+1DazOLjRiOwVvYg
	CeWLXJLFBRqvDS12FtSVVKkNFT80iUF6go3tHNhkanP6hMQbZGUFDLrztWRJoaYAM2t3WbVtjlJ
	PBFm8ykF7tQsGmOOyNCGTZ6JkiqpzPu5C0ksltKDcZ6Ca64T8Zu8dziuZuth+0g6TrgYt5/f1Tt
	9/yiJMsVlpseEGmLHIH76ZI59aFBZ94Yu8Ii9Ksiln6rZpSh9BPdY59OJRrOwNKyOvO/W1FFatu
	aI21KzYDzNz/fSRK2/jAesZB0rlb9yWzf2NAB8YA==
X-Received: by 2002:a05:620a:d8a:b0:8d6:874c:a762 with SMTP id af79cd13be357-8ddd03973ffmr3928880885a.54.1776327472259;
        Thu, 16 Apr 2026 01:17:52 -0700 (PDT)
Received: from [192.168.2.25] ([184.146.175.99])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e4ef33afd3sm312406885a.17.2026.04.16.01.17.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:17:51 -0700 (PDT)
Message-ID: <8dc8c094-63ab-4f9c-867a-96b615dff2cf@gmail.com>
Date: Thu, 16 Apr 2026 04:17:40 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:136.0) Gecko/20100101
 Thunderbird/136.0
Subject: Re: [PATCH v8 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 andersson@kernel.org
References: <20260415112530.4083240-1-ekansh.gupta@oss.qualcomm.com>
 <20260415112530.4083240-5-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-CA, en-US
From: Luben Tuikov <ltuikov89@gmail.com>
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <20260415112530.4083240-5-ekansh.gupta@oss.qualcomm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xN0t5LhGw6YuTD2O0ja123f4"
X-Spamd-Result: default: False [-4.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103348-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:server fail];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltuikov89@gmail.com,linux-arm-msm@vger.kernel.org];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0B1D240B78C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xN0t5LhGw6YuTD2O0ja123f4
Content-Type: multipart/mixed; boundary="------------AQKjfm64Py2xRSpCXKO1GqWn";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 andersson@kernel.org
Message-ID: <8dc8c094-63ab-4f9c-867a-96b615dff2cf@gmail.com>
Subject: Re: [PATCH v8 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
References: <20260415112530.4083240-1-ekansh.gupta@oss.qualcomm.com>
 <20260415112530.4083240-5-ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260415112530.4083240-5-ekansh.gupta@oss.qualcomm.com>

--------------AQKjfm64Py2xRSpCXKO1GqWn
Content-Type: multipart/mixed; boundary="------------S05zGcNgK51jtBwXIQA5K08D"

--------------S05zGcNgK51jtBwXIQA5K08D
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Ekansh,

Good work. A couple of notes below:

On 2026-04-15 07:25, Ekansh Gupta wrote:
> For any remote call to DSP, after sending an invocation message,
> fastRPC driver waits for glink response and during this time the
> CPU can go into low power modes. This adds latency to overall fastrpc
> call as CPU wakeup and scheduling latencies are included. Add polling
> mode support with which fastRPC driver will poll continuously on a
> memory after sending a message to remote subsystem which will eliminate=

> CPU wakeup and scheduling latencies and reduce fastRPC overhead. In cas=
e
> poll timeout happens, the call will fallback to normal RPC mode.  Poll
> mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
> request with FASTRPC_POLL_MODE request id.
>=20
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c      | 137 ++++++++++++++++++++++++++++++++++--=

>  include/uapi/misc/fastrpc.h |  25 +++++++
>  2 files changed, 155 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index c4a3547a5c7f..5311a4ba4bb7 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -24,6 +24,8 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/bits.h>
>  #include <linux/bitops.h>
> +#include <linux/compiler.h>
> +#include <linux/iopoll.h>
> =20
>  #define ADSP_DOMAIN_ID (0)
>  #define MDSP_DOMAIN_ID (1)
> @@ -38,6 +40,12 @@
>  #define FASTRPC_CTX_MAX (256)
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> +/*
> + * Maximum handle value for static handles.
> + * Static handles are pre-defined, fixed numeric values statically ass=
igned
> + * in the IDL file or FastRPC framework.
> + */
> +#define FASTRPC_MAX_STATIC_HANDLE (20)
>  #define FASTRPC_CTXID_MASK GENMASK(15, 8)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
> @@ -106,6 +114,12 @@
> =20
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, m=
iscdev)
> =20
> +/* Poll response number from remote processor for call completion */
> +#define FASTRPC_POLL_RESPONSE (0xdecaf)
> +
> +/* Polling mode timeout limit */
> +#define FASTRPC_POLL_MAX_TIMEOUT_US (10000)
> +
>  struct fastrpc_phy_page {
>  	dma_addr_t addr;	/* dma address */
>  	u64 size;		/* size of contiguous region */
> @@ -236,8 +250,14 @@ struct fastrpc_invoke_ctx {
>  	u32 sc;
>  	u64 *fdlist;
>  	u32 *crc;
> +	/* Poll memory that DSP updates */
> +	u32 *poll;

Perhaps "poll_addr"? "poll" seems just too generic.

>  	u64 ctxid;
>  	u64 msg_sz;
> +	/* work done status flag */
> +	bool is_work_done;
> +	/* process updates poll memory instead of glink response */
> +	bool is_polled;
>  	struct kref refcount;
>  	struct list_head node; /* list of ctxs */
>  	struct completion work;
> @@ -308,6 +328,8 @@ struct fastrpc_user {
>  	int client_id;
>  	int pd;
>  	bool is_secure_dev;
> +	/* Flags poll mode state */
> +	bool poll_mode;
>  	/* Lock for lists */
>  	spinlock_t lock;
>  	/* lock for allocations */
> @@ -923,7 +945,8 @@ static int fastrpc_get_meta_size(struct fastrpc_inv=
oke_ctx *ctx)
>  		sizeof(struct fastrpc_invoke_buf) +
>  		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
>  		sizeof(u64) * FASTRPC_MAX_FDLIST +
> -		sizeof(u32) * FASTRPC_MAX_CRCLIST;
> +		sizeof(u32) * FASTRPC_MAX_CRCLIST +
> +		sizeof(u32);
> =20
>  	return size;
>  }
> @@ -1019,6 +1042,9 @@ static int fastrpc_get_args(u32 kernel, struct fa=
strpc_invoke_ctx *ctx)
>  	list =3D fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>  	pages =3D fastrpc_phy_page_start(list, ctx->nscalars);
>  	ctx->fdlist =3D (u64 *)(pages + ctx->nscalars);
> +	ctx->poll =3D (u32 *)((uintptr_t)ctx->fdlist + sizeof(u64) * FASTRPC_=
MAX_FDLIST +
> +			     sizeof(u32) * FASTRPC_MAX_CRCLIST);
> +
>  	args =3D (uintptr_t)ctx->buf->virt + metalen;
>  	rlen =3D pkt_size - metalen;
>  	ctx->rpra =3D rpra;
> @@ -1188,6 +1214,74 @@ static int fastrpc_invoke_send(struct fastrpc_se=
ssion_ctx *sctx,
> =20
>  }
> =20
> +static inline u32 fastrpc_poll_op(void *p)
> +{
> +	struct fastrpc_invoke_ctx *ctx =3D p;
> +
> +	dma_rmb();
> +	return READ_ONCE(*ctx->poll);

I think you're better off using readl() here, but see my comment below, w=
hich obviates this function.

> +}
> +
> +static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx)
> +{
> +	u32 val;
> +	int ret;
> +
> +	/*
> +	 * Poll until DSP writes FASTRPC_POLL_RESPONSE into *ctx->poll
> +	 * or until another path marks the work done.
> +	 */
> +	ret =3D read_poll_timeout_atomic(fastrpc_poll_op, val,
> +				       (val =3D=3D FASTRPC_POLL_RESPONSE) || ctx->is_work_done, 1,=

> +				       FASTRPC_POLL_MAX_TIMEOUT_US, false, ctx);

Is there any reason you're not using readl_poll_timeout_atomic() as docum=
ented in linux/iopoll.h?
Does readl() not satisfy the read operation in fastrpc_poll_op()?

How can ctx->is_work_done be updated here? Perhaps you just want to use "=
val =3D=3D FASTRPC_POLL_RESPONSE" as a condition here...

> +
> +	if (!ret && val =3D=3D FASTRPC_POLL_RESPONSE) {
> +		ctx->is_work_done =3D true;
> +		ctx->retval =3D 0;
> +	}
> +
> +	if (ret =3D=3D -ETIMEDOUT)
> +		ret =3D -EIO;
> +
> +	return ret;
> +}
> +
> +static inline int fastrpc_wait_for_response(struct fastrpc_invoke_ctx =
*ctx,
> +					    u32 kernel)

What is "kernel" and why is it a u32 when it is used as a "bool"? Perhaps=
 a better name can be had?

> +{
> +	int err =3D 0;
> +
> +	if (kernel) {
> +		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
> +			err =3D -ETIMEDOUT;
> +	} else {
> +		err =3D wait_for_completion_interruptible(&ctx->work);
> +	}
> +
> +	return err;
> +}
> +
> +static int fastrpc_wait_for_completion(struct fastrpc_invoke_ctx *ctx,=

> +				       u32 kernel)
> +{
> +	int err;
> +
> +	do {
> +		if (ctx->is_polled) {
> +			err =3D poll_for_remote_response(ctx);
> +			/* If polling timed out, move to normal response mode */
> +			if (err)
> +				ctx->is_polled =3D false;
> +		} else {
> +			err =3D fastrpc_wait_for_response(ctx, kernel);
> +			if (err)
> +				return err;
> +		}
> +	} while (!ctx->is_work_done);

Perhaps you want to also check "err" here to make the exit condition more=
 explicit. (The invariant in do-while loops is generally directly determi=
ned by something within the loop and generally not implicit.)

Is it possible that in poll_for_remote_response() you get 0 as a poll res=
ult and val is not equal to FASTRCPC_POLL_RESPONSE? In such a case, this =
may hang. (Is a hang desired here?)

Is it possible that if polling is enabled, then you want to poll only onc=
e, and if unsuccessful, or successful but "!work_done", then transition t=
o fastrpc_wait_for_response() and return, without looping? (since polling=
 is looping after all...)

> +
> +	return 0;

"err" is always initialized so you can return "err" here if you exit with=
 "err" as part of the exit condition. (And if you add "!err &&" in the lo=
op invariant, then you don't need (if (err) return err;) after "fastrpc_w=
ait_for_response()").

--=20
Regards,
Luben
--------------S05zGcNgK51jtBwXIQA5K08D
Content-Type: application/pgp-keys; name="OpenPGP_0x4C15479431A334AF.asc"
Content-Disposition: attachment; filename="OpenPGP_0x4C15479431A334AF.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1A
PnbnnRHNIkx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoA
QRYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiIC
BhUKCQgLAgQWAgMBAh4HAheAAAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlT
MqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfyJwktF7REl1yt7IU2Sye1qmQMfJxdt9JM
bMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSPcCE8uGe7FWo8C+nTSyWPXKTx
9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJl
OiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKoaMDzO9eG
z69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA=3D=3D
=3DqCaZ
-----END PGP PUBLIC KEY BLOCK-----

--------------S05zGcNgK51jtBwXIQA5K08D--

--------------AQKjfm64Py2xRSpCXKO1GqWn--

--------------xN0t5LhGw6YuTD2O0ja123f4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCaeCbJAUDAAAAAAAKCRBMFUeUMaM0r8Vo
AP9WJmN4Q2hEUkOxLBryVAF2pXe//FmJ8gPI7CjyCV15BAEAgSG5h3/wdSlwchwof952csqUEnNy
zRf038thQ2HcUQw=
=tPQ1
-----END PGP SIGNATURE-----

--------------xN0t5LhGw6YuTD2O0ja123f4--

