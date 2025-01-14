Return-Path: <linux-arm-msm+bounces-45024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F07A10BAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 17:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80B8B1889E28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 16:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138C8172BA9;
	Tue, 14 Jan 2025 16:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fhbd4G75"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121A3189B8F
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 16:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736870509; cv=none; b=SNc/WjvpqRDsAJN5xCm9imdYgzUe8zss/H4PkFAHEOyBX4D0Q8z7eQrPGm9/njJQeY3mq+2IiZHAkCj0fBSpaod1MwtFxw0CglBW5VLuQrGznp4BixHsEGcZLyYGIQuN4ke3bCP6T7sw4RAN9XAG4t1bbFxRaPiAu1rqTca15Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736870509; c=relaxed/simple;
	bh=9BdltbDDHeFSXUWsnVc9OJqpzmurFQ6f/EuLikIG0m4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uz6CZD3B8BIki71Xkzq2Oewf0tg+hQxOERgpAVzktv8RCSA4DnjacINHml/CR9AYh4V3v0yAvGgoP87wix03eQsnNmiT1zvTuiOc7W0bzn89aeqiIA8mXpxoujBzvOVWp9+ogsho2jfuNyZQWcKcWJQceZMSnsi22pEuKWYZyMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fhbd4G75; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso5815344f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 08:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736870505; x=1737475305; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RMuk+UifsraxPn2X2KqUIxPaLF/bAyO14bSWUMchq6M=;
        b=fhbd4G75NBFu12SFRT+4ahF7Y8m1oLtKmf/lo8xvlHzR/DXgD3KDmt7bJ8BXXjlaV+
         rP34rNxjK8G5eXER/45eKp3rBuAipB8k+wc0M25jHWxTw7e/AoSyP8Zan+dMIj5IyIS3
         GT+OQwMC1Oe6TYnxuUNBgjRg+5mOvPEv83fT2AUOBEcrmTXR2PVcLw4H8lqGL3pCuT8f
         rixsqmMLmw+zrifBnI4RbLLEJ6EtckmIbi3VCq3L6b/yETcDpEjv62S1UiRiNLEBBqLn
         oocx3WleatTYhKnKw5LQok3tAALEe8mHmKWQKn0Yr+xwpHTdMMmKsVhr83dwoTTgBdgt
         mwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736870505; x=1737475305;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RMuk+UifsraxPn2X2KqUIxPaLF/bAyO14bSWUMchq6M=;
        b=jmk69R/vzvqTqPlp863qtuD5uACA/HImoNmuGo4Lm7f+S1J6fWLhg08y+vd2axbPWD
         34NOLWaNj6mCrqnjFxGVCu+D5fMpd7lrhhUc+KSYT+N5Lvrvp6BIizIEMj5iC5RFvXe7
         wbls8lCc5AUJBneAATMhMoz142A5FkUYVMRWdoCVbFi2kiPqY1zCx9AOYVS/MTSsKeEv
         EtGmR5Am9Xowxu+P0sfBKFeOtRbNYs+dcDsYIlzml28WN1sWqJyZcQFoEGz0J62sW02i
         d0XmlUYZ9+J0iAjRaKkmX9KAgzRHgDriKka5iZPIBdvTFJsBQt2ZufsDbUx4/rKCyeyb
         KpxA==
X-Forwarded-Encrypted: i=1; AJvYcCUOoH23VRHCpKq4Kod62oMEnNest8Xy9t/bNlM7Gjydp2O+vwklRL+NoJE65f4/BcX+t2E+ZSP4l1+a+Xx6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9xuKOGhxMmQQR6oQzPasZYQiXvNmpKaXSlhZLPAsFWbsxsCSr
	d1I+skFlC33u7eyn/PBoQc4Cvl1WgO7rOwWLyE8uCBjipA8dXs0n1gxqD9bNVGc=
X-Gm-Gg: ASbGncu/4WDXGBl46nfhki6jKlLMqVdRMXU5BCRNh09jKTD2TYd5g9Xz6RJpF2egiEH
	misGE99ydEQrQRLyQlVH30sR80FkLBzDxxKR52yt/OSC8TNm9XZLABvnp96RhfueqUmX5VSv/fE
	4u/kFtURaML+oBPz1Kw+F8hGPYkzdH/340ggnitNgF6z1EQ9X9W6NKbTiqSLiir0dNnJGARDFCU
	GO0Hw3QAxEWwYK/pHtQycztoPINR3f9umJljmmy9ovv2LSPN4E/EJ3JWB17hUNk3gU=
X-Google-Smtp-Source: AGHT+IF3J9KLkHSdxkhJLVphEdnFgZopbnshppEer6gQraM6YW4Ox7lnjy1tK1UMNKFQ1TSYcrtXkQ==
X-Received: by 2002:a05:6000:4024:b0:38b:d765:7039 with SMTP id ffacd0b85a97d-38bd765737cmr8157919f8f.17.1736870505207;
        Tue, 14 Jan 2025 08:01:45 -0800 (PST)
Received: from [192.168.243.26] ([80.233.72.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d0fasm15516855f8f.19.2025.01.14.08.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 08:01:44 -0800 (PST)
Message-ID: <b97f6231496d2fb0323c9e51b5bfae7c635750e9.camel@linaro.org>
Subject: Re: [PATCH] scsi: ufs: pltfrm: fix use-after free in init error and
 remove paths
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>,  Bart Van Assche <bvanassche@acm.org>, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>,
 kernel-team@android.com,  linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-arm-msm@vger.kernel.org
Date: Tue, 14 Jan 2025 16:01:42 +0000
In-Reply-To: <20250113203136.GB1800842@google.com>
References: <20250113-ufshcd-fix-v1-1-ca63d1d4bd55@linaro.org>
	 <20250113192235.GA1800842@google.com>
	 <c4129ea9da39badb3a686f7f93c334ecbc6d83f6.camel@linaro.org>
	 <20250113203136.GB1800842@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-01-13 at 20:31 +0000, Eric Biggers wrote:
> On Mon, Jan 13, 2025 at 07:28:00PM +0000, Andr=C3=A9 Draszik wrote:
> > On Mon, 2025-01-13 at 19:22 +0000, Eric Biggers wrote:
> > > On Mon, Jan 13, 2025 at 07:13:45PM +0000, Andr=C3=A9 Draszik wrote:
> > > > [...]

> > > > ther approaches for solving this issue I see are the following, but=
 I
> > > > believe this one here is the cleanest:
> > > >=20
> > > > * turn 'struct ufs_hba::crypto_profile' into a dynamically allocate=
d
> > > > =C2=A0 pointer, in which case it doesn't matter if cleanup runs aft=
er
> > > > =C2=A0 scsi_host_put()
> > > > * add an explicit devm_blk_crypto_profile_deinit() to be called by =
API
> > > > =C2=A0 users when necessary, e.g. before ufshcd_dealloc_host() in t=
his case
> > >=20
> > > Thanks for catching this.
> > >=20
> > > There's also the option of using blk_crypto_profile_init() instead of
> > > devm_blk_crypto_profile_init(), and calling blk_crypto_profile_destro=
y()
> > > explicitly.=C2=A0 Would that be any easier here?
> >=20
> > Ah, yes, that was actually my initial fix for testing, but I dismissed
> > that due to needing more changes and potentially not knowing in all
> > situation if it needs to be called or not.
> >=20
> > TBH, my preferred fix would actually be the alternative 1 outlined
> > above (dynamic allocation). This way future drivers can not make this
> > same mistake.
> >=20
> > Any thoughts?
> >=20
>=20
> I assume you mean replacing devm_blk_crypto_profile_init() with a new fun=
ction
> devm_blk_crypto_profile_new() that dynamically allocates a struct
> blk_crypto_profile, and making struct ufs_hba store a pointer to struct
> blk_crypto_profile instead of embed it.=C2=A0 And likewise for struct mmc=
_host.

Yes, but I was only thinking of ufs_hba since I believe mmc_host
uses an approach similar to my patch, where the lifetime of the
crypto devm cleanup is bound to the underlying mmc device.

For consistency reasons, I guess both would have to be changed
indeed.

> I think that would avoid this bug, but it seems suboptimal to introduce t=
he
> extra level of indirection.=C2=A0 The blk_crypto_profile is not really an=
 independent
> object from struct ufs_hba; all its methods need to cast the blk_crypto_p=
rofile
> to the struct ufs_hba that contains it.=C2=A0 We could replace the contai=
ner_of()
> with a back-pointer, so technically it would work.=C2=A0 But the fact tha=
t both would
> be pointing to each other suggests that they really should be in the same
> struct.

Noted. Thanks for your thoughts.

> If it's possible, it would be nice to just make the destruction of the cr=
ypto
> profile happen at the right time, when the other resources owned by the u=
fs_hba
> are destroyed.

Just to clarify, are you saying you'd prefer to rather see something
like you mentioned above (calling blk_crypto_profile_destroy()
explicitly)?

I had a quick look, and it seems harder than this patch: one option
could be to make calling the destroy dependent on UFSHCD_CAP_CRYPTO,
but ufs-mediatek.c and ufs-sprd.c appear to clear that flag on
errors at runtime, so we might miss a necessary cleanup call.


I think the best alternative to keep devm-based crypto profile
destruction, and to make it happen while other ufs_hba-owned
resources are destroyed, and before SCSI destruction, is to
change ufshcd_alloc_host() to register a devres action to
automatically cleanup the underlying SCSI device on ufshcd
destruction, without requiring explicit calls to
ufshcd_dealloc_host(). I am not sure if this has wider implications
(in particular if there is any underlying assumption or requirement
for the Scsi_host device to clean up before the ufshcd device), but
this way:

* the crypto profile would be destroyed before SCSI (as it's
  registered after)
* a memleak would be plugged in tc-dwc-g210-pci.c
* EXPORT_SYMBOL_GPL(ufshcd_dealloc_host) could be removed fully
* no future drivers using ufshcd_alloc_host() could ever forget
  adding the cleanup


Something like the following in ufshcd.c:

static void ufshcd_scsi_host_put_callback(void *host)
{
	scsi_host_put(host);
}


and in ufshcd_alloc_host() just after scsi_host_alloc() in same file:

	err =3D devm_add_action_or_reset(dev, ufshcd_scsi_host_put_callback,
				       host);
	if (err)
		return dev_err_probe(dev, err,
				     "failed to add ufshcd dealloc action\n");


I'll change v2 to do just that.


Cheers,
Andre'


