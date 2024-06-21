Return-Path: <linux-arm-msm+bounces-23642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 924D7912E55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 22:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CC371F26995
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 20:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B79F16D4F5;
	Fri, 21 Jun 2024 20:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9O5yaMM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1A116D4CD;
	Fri, 21 Jun 2024 20:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719000884; cv=none; b=XK+rBIuJLSYlscFDxrxMHUFqgsPBf2alF6apn2FvQ1HqmpJ9wM24ANa01h+uPq5F8uur8Wnt8Gps5t95g8ClHNjfnFC03ZamL/28kuErNZ9pLYPMf3bVyGSwHuANwRsyPY48YdDHMwTYZQVAwT2M/DUPANmti704duVqaclV3m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719000884; c=relaxed/simple;
	bh=vHNxcU9s9MR4LOyWyYM6sc5OyVItOebWsy9TgzJ3F2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IURa71P1h6TYbXaZR1zrffRItSblMDrLCdawgK+gkfBmK1hp71ENGLqZlOWdsGX8fpnVhfMR+uE7qWV5k91SiotJn0cDDvps/h5UH7R3d0JP3VogMUk3kVxqUSU9ky/mMcjt/YPpwEECiDKY6Nytx4z56ZnfNtgL3FcSineiKQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9O5yaMM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D20DC2BBFC;
	Fri, 21 Jun 2024 20:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719000883;
	bh=vHNxcU9s9MR4LOyWyYM6sc5OyVItOebWsy9TgzJ3F2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9O5yaMMi65WQBjGVtTi7z0837mF1Gm9iTUq9ReB718yxqMgk0cF1wK4zefwfRrJD
	 Jv9TGV0av+2VOzqdlXXoY4X7Y4zEoS7ggbw7xcfBTpiGv/VvHLNy1If3o8z2fD5S/k
	 GrPLrJTVTOZ7bLMyYSSUF0Jer/6EvjIBTz5GI0DtTjQtL73k/ITRYhpzvzlYW3+0kz
	 HTQOjI2jr+qQkN76/4T+pd44WqNMTYQS0QTx80ftof5673kw0M1OoOPWrtGKk0OOvF
	 YpOyGc6uvC1qyNxeyFeWaLX47t4fSp5lQTHdY9m9jNx5fzZ9LtDbmxvdMqTE3vFNBo
	 JWXxSkBF11hVg==
Date: Fri, 21 Jun 2024 20:14:41 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"andersson@kernel.org" <andersson@kernel.org>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"srinivas.kandagatla" <srinivas.kandagatla@linaro.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	kernel <kernel@quicinc.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Om Prakash Singh (QUIC)" <quic_omprsing@quicinc.com>,
	"Bao D. Nguyen (QUIC)" <quic_nguyenb@quicinc.com>,
	"bartosz.golaszewski" <bartosz.golaszewski@linaro.org>,
	"konrad.dybcio@linaro.org" <konrad.dybcio@linaro.org>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"mani@kernel.org" <mani@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	Prasad Sodagudi <psodagud@quicinc.com>,
	Sonal Gupta <sonalg@quicinc.com>
Subject: Re: [PATCH v5 04/15] soc: qcom: ice: add hwkm support in ice
Message-ID: <20240621201441.GA3850750@google.com>
References: <3a15df00a2714b40aba4ebc43011a7b6@quicinc.com>
 <CAA8EJpoZ0RR035QwzMLguJZvdYb-C6aqudp1BgHgn_DH2ffsoQ@mail.gmail.com>
 <20240621044747.GC4362@sol.localdomain>
 <CAA8EJppXsbpFCeGJOMGKOQddy0fF4uW3rt4RUuDTQq6mPunBkg@mail.gmail.com>
 <20240621153939.GA2081@sol.localdomain>
 <CAA8EJpqV4CW9kKLVUZgfo+hkSv+tn0t+k0McmHEyXNJUpsZF1w@mail.gmail.com>
 <20240621163127.GC2081@sol.localdomain>
 <CAA8EJpqytynwQrCAqqBsmx2XYgV5tsNeV4hpYzT6snqu+r8Wdg@mail.gmail.com>
 <20240621183645.GE2081@sol.localdomain>
 <CAA8EJprydVC6Sp8g9b1TOyxN8Awc33=MxKY8=Upi_zag=kDBHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprydVC6Sp8g9b1TOyxN8Awc33=MxKY8=Upi_zag=kDBHA@mail.gmail.com>

On Fri, Jun 21, 2024 at 10:24:07PM +0300, Dmitry Baryshkov wrote:
> >
> > (fscrypt used to use the keyring service a bit more: it looked up a key whenever
> > a file was opened, and it supported evicting per-file keys by revoking the
> > corresponding keyring key.  But this turned out to be totally broken.  E.g., it
> > didn't provide the correct semantics for filesystem encryption where the key
> > should either be present or absent filesystem-wide.)
> >
> > We do need the ability to create HW-wrapped keys in long-term wrapped form,
> > either via "generate" or "import", return those long-term wrapped keys to
> > userspace so that they can be stored on-disk, and convert them into
> > ephemerally-wrapped form so they can be used.  It probably would be possible to
> > support all of this through the keyrings service, but it would need a couple new
> > key types:
> >
> > - One key type that can be instantiated with a raw key (or NULL to request
> >   generation of a key) and that automagically creates a long-term wrapped key
> >   and supports userspace reading it back.  This would be vaguely similar to
> >   "trusted", but without any support for using the key directly.
> >
> > - One key type that can be instantiated using a long-term wrapped key which gets
> >   automagically converted to an ephemerally-wrapped key.  This would be what is
> >   passed to other kernel subsystems.  Functions specific to this key type would
> >   need to be provided for users to use.
> 
> I think having one key type should be enough. The userspace loads /
> generates&reads / wraps and reads back the 'exported' version wrapped
> using the platform-specific key. In kernel the key is unsealed and
> represented as binary key to be loaded to the hardware + a cookie for
> the ephemeral key and device that have been used to wrap it. When
> userspace asks the device to program the key, the cookie is verified
> to match the device / ephemeral key and then the binary is programmed
> to the hardware. Maybe it's enough to use the struct device as a
> cookie.

The long-term wrapped key has to be wiped from memory as soon as it's no longer
needed.  So it's hard to see how overloading a key type in this way can work, as
the kernel can't know if userspace intends to read back the long-term wrapped
key or not.

> 
> > I think it would be possible, but it feels like a bit of a shoehorned API.  The
> > ioctls are a more straightforward solution.
> 
> Are we going to have another set of IOCTLs for loading the encrypted
> keys? keys sealed by TPM?

Those features aren't compatible with hardware-wrapped inline encryption keys,
so they're not really relevant here.  BLKCRYPTOIMPORTKEY could support importing
a keyring service key as an alternative to a raw key, of course.  But this would
just work similarly to fscrypt and dm-crypt where they just extract the payload,
and the keyring service key plays no further role.

> > > > Support for it will be added at some point, which will likely indeed take the
> > > > form of an ioctl to set a key on a block device.  But that would be the case
> > > > even without HW-wrapped keys.  And *requiring* the key to be given in a keyring
> > > > (instead of just in a byte array passed to the ioctl) isn't very helpful, as it
> > > > just makes the API harder to use.  We've learned this from the fscrypt API
> > > > already where we actually had to move away from the keyrings service in order to
> > > > fix all the issues caused by it (see FS_IOC_ADD_ENCRYPTION_KEY).
> > > >
> > > > > >
> > > > > > > Second part is the actual block interface. Gaurav wrote about
> > > > > > > targeting fscrypt, but there should be no actual difference between
> > > > > > > crypto targets. FDE or having a single partition encrypted should
> > > > > > > probably work in the same way. Convert the key into blk_crypto_key
> > > > > > > (including the cookie for the ephemeral key), program the key into the
> > > > > > > slot, use the slot to en/decrypt hardware blocks.
> > > > > > >
> > > > > > > My main point is that the decision on the key type should be coming
> > > > > > > from the user.
> > > > > >
> > > > > > That's exactly how it works.  There is a block interface for specifying an
> > > > > > inline encryption key along with each bio.  The submitter of the bio can specify
> > > > > > either a standard key or a HW-wrapped key.
> > > > >
> > > > > Not in this patchset. The ICE driver decides whether it can support
> > > > > HW-wrapped keys or not and then fails to support other type of keys.
> > > > >
> > > >
> > > > Sure, that's just a matter of hardware capabilities though, right?  The block
> > > > layer provides a way for drivers to declare which inline encryption capabilities
> > > > they support.  They can declare they support standard keys, HW-wrapped keys,
> > > > both, or neither.  If Qualcomm SoCs can't support both types of keys at the same
> > > > time, that's unfortunate, but I'm not sure what your poitnt is.  The user (e.g.
> > > > fscrypt) still has control over whether they use the functionality that the
> > > > hardware provides.
> > >
> > > It's a matter of policy. Harware / firmware doesn't support using both
> > > kinds of keys concurrently, if I understood Gaurav's explanations
> > > correctly. But the user should be able to make a judgement and use
> > > non-hw-wrapped keys if it fits their requirements. The driver should
> > > not make this kind of judgement. Note, this is not an issue of your
> > > original patchset, but it's a driver flaw in this patchset.
> >
> > If the driver has to make a decision about which type of keys to support (due to
> > the hardware and firmware supporting both but not at the same time), I think
> > this will need to be done via a module parameter, e.g.
> > qcom_ice.hw_wrapped_keys=1 to support HW-wrapped keys instead of standard keys.
> 
> No, the user can not set modparams on  e.g. Android device. In my
> opinion it should be first-come-first-serve. If the user wants
> hw-wrapped keys (and the platform is fine with that), then further
> attempts to use raw keys should fail. If the user loads a raw key,
> further attempts to set hw-wrapped key should fail (maybe until the
> last raw key has been evicted from the hw, if such thing is actually
> supported).

That's not going to work.  Upper layers need to know what the crypto
capabilities are before they decide to use them.  We can't randomly revoke
capabilities based on who happened to get there first, as a user might have
already checked the capabilities.  Yes, the module parameter is a litle
annoying, but it seems to be necessary here.  It is not a problem for Android
because the type of encryption an Android device uses is set by the build
anyway, which makes it no easier to change than module parameters.

- Eric

