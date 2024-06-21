Return-Path: <linux-arm-msm+bounces-23665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDE1912FBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 23:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35B3FB21A61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 21:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1B917994D;
	Fri, 21 Jun 2024 21:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIGB2P2O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06D729A1;
	Fri, 21 Jun 2024 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719006387; cv=none; b=WpUFRt5uwLQyMsF0F4xuzsRdldCmXz08C3YH9tmVmG0v/oBIOupIoG9oVWcImDF7ZrxPuNJAA/RzlH1xjhfBehFhRgMptfZtARgCB3zJQM0CvK7mOQPTzNOM1J3hYI+iC+GsvN1o/1fbzD87J2Cy9oF+uxOsrrLU2AlMRFKSZZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719006387; c=relaxed/simple;
	bh=oRCYv6mwHo+5KcdLp2II9wyrIJnpjGvRtcLWzgQVnUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oa358RuEov8Lgl6W9NhDgBASb/FM5jImgWr/omkxJsX6oSvQ4pUffZggoMYjvlVNYGIUkvCM0JpjaxVYNyZ88K9enPZvvY/qdrM1BsLqsY2lfqmv5QQLNh/7kCMzt0mp7X9q77iR4fnyiJSX8ekp+BCrEmo1aYX1w3J2bNcl7go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIGB2P2O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436D5C2BBFC;
	Fri, 21 Jun 2024 21:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719006386;
	bh=oRCYv6mwHo+5KcdLp2II9wyrIJnpjGvRtcLWzgQVnUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uIGB2P2OCMJfMNMpmnbXUzlFO2+bpdN4L8iOCoLfD6bUyWBk93X/a2/h8DUoap3So
	 24xVislbPFF9kvd1uJoXhTQ7GkWflLOu+DqOD+yMOu+RqZTW3sqZbuRnzwAS0COzUq
	 iWcTnneEtGBkdgwJ1vJIkbxiHp+Bx/pu3Evqk9BGkTM9Qp6X8CowOXBp/naVRYcfwa
	 wToWzfMEdv37ro3vLkDktZGhjSeSlvWADPLr9ewDl4QOUv9SbmtaarG/IMzH0Mxx1L
	 X0nqHPXVYm0u1ES17qrtMK9VVP94um400vem7Gdo3xiArVl4T11aU4yivdFFH7h1wa
	 bXO4W4V2csMIA==
Date: Fri, 21 Jun 2024 21:46:24 +0000
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
Message-ID: <20240621214624.GA3861295@google.com>
References: <20240621044747.GC4362@sol.localdomain>
 <CAA8EJppXsbpFCeGJOMGKOQddy0fF4uW3rt4RUuDTQq6mPunBkg@mail.gmail.com>
 <20240621153939.GA2081@sol.localdomain>
 <CAA8EJpqV4CW9kKLVUZgfo+hkSv+tn0t+k0McmHEyXNJUpsZF1w@mail.gmail.com>
 <20240621163127.GC2081@sol.localdomain>
 <CAA8EJpqytynwQrCAqqBsmx2XYgV5tsNeV4hpYzT6snqu+r8Wdg@mail.gmail.com>
 <20240621183645.GE2081@sol.localdomain>
 <CAA8EJprydVC6Sp8g9b1TOyxN8Awc33=MxKY8=Upi_zag=kDBHA@mail.gmail.com>
 <20240621201441.GA3850750@google.com>
 <mwc3zbfst4pnbmxcdmdkhdqgsbrv3vdz5faqc4viifjwk6olfd@gc4pga5huqlv>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mwc3zbfst4pnbmxcdmdkhdqgsbrv3vdz5faqc4viifjwk6olfd@gc4pga5huqlv>

On Fri, Jun 21, 2024 at 11:52:01PM +0300, Dmitry Baryshkov wrote:
> On Fri, Jun 21, 2024 at 08:14:41PM GMT, Eric Biggers wrote:
> > On Fri, Jun 21, 2024 at 10:24:07PM +0300, Dmitry Baryshkov wrote:
> > > >
> > > > (fscrypt used to use the keyring service a bit more: it looked up a key whenever
> > > > a file was opened, and it supported evicting per-file keys by revoking the
> > > > corresponding keyring key.  But this turned out to be totally broken.  E.g., it
> > > > didn't provide the correct semantics for filesystem encryption where the key
> > > > should either be present or absent filesystem-wide.)
> > > >
> > > > We do need the ability to create HW-wrapped keys in long-term wrapped form,
> > > > either via "generate" or "import", return those long-term wrapped keys to
> > > > userspace so that they can be stored on-disk, and convert them into
> > > > ephemerally-wrapped form so they can be used.  It probably would be possible to
> > > > support all of this through the keyrings service, but it would need a couple new
> > > > key types:
> > > >
> > > > - One key type that can be instantiated with a raw key (or NULL to request
> > > >   generation of a key) and that automagically creates a long-term wrapped key
> > > >   and supports userspace reading it back.  This would be vaguely similar to
> > > >   "trusted", but without any support for using the key directly.
> > > >
> > > > - One key type that can be instantiated using a long-term wrapped key which gets
> > > >   automagically converted to an ephemerally-wrapped key.  This would be what is
> > > >   passed to other kernel subsystems.  Functions specific to this key type would
> > > >   need to be provided for users to use.
> > > 
> > > I think having one key type should be enough. The userspace loads /
> > > generates&reads / wraps and reads back the 'exported' version wrapped
> > > using the platform-specific key. In kernel the key is unsealed and
> > > represented as binary key to be loaded to the hardware + a cookie for
> > > the ephemeral key and device that have been used to wrap it. When
> > > userspace asks the device to program the key, the cookie is verified
> > > to match the device / ephemeral key and then the binary is programmed
> > > to the hardware. Maybe it's enough to use the struct device as a
> > > cookie.
> > 
> > The long-term wrapped key has to be wiped from memory as soon as it's no longer
> > needed.  So it's hard to see how overloading a key type in this way can work, as
> > the kernel can't know if userspace intends to read back the long-term wrapped
> > key or not.
> 
> Why? It should be user's decision. Pretty much in the same way as it's
> done for all other keys.

Sorry, I don't understand what your point is supposed to be here.  It's
certainly not okay to leave the long-term wrapped key in memory, since that
destroys the security properties of hardware-wrapped keys.  So we need to
provide an API that makes it possible for the long-term wrapped key to be
zeroized.  The API you're proposing, as I understand it, wouldn't allow for that
because the long-term wrapped key would remain in memory as long as the keyring
service key exists, even when only the ephemerally-wrapped key is needed.

> 
> > > > I think it would be possible, but it feels like a bit of a shoehorned API.  The
> > > > ioctls are a more straightforward solution.
> > > 
> > > Are we going to have another set of IOCTLs for loading the encrypted
> > > keys? keys sealed by TPM?
> > 
> > Those features aren't compatible with hardware-wrapped inline encryption keys,
> > so they're not really relevant here.  BLKCRYPTOIMPORTKEY could support importing
> > a keyring service key as an alternative to a raw key, of course.  But this would
> > just work similarly to fscrypt and dm-crypt where they just extract the payload,
> > and the keyring service key plays no further role.
> 
> Yes, extracting the payload is fine. As you wrote, dm-crypt and fscrypt
> already do it in this way. But what I really don't like here is the idea
> of having two different kinds of API having pretty close functionality.
> In my opinion, all the keys should be handled via the existing keyrings
> API and then imported via the BLKCRYPTOIMPORTKEY IOCTL. This way all
> kinds of keys are handled in a similar way from user's point of view.

But in that case all the proposed new BLKCRYPTO* ioctls are still needed.  Your
suggestion would just make them harder to use by requiring users to copy their
key into a keyrings service key instead of just providing it directly in the
ioctl.

> 
> > > > > > Support for it will be added at some point, which will likely indeed take the
> > > > > > form of an ioctl to set a key on a block device.  But that would be the case
> > > > > > even without HW-wrapped keys.  And *requiring* the key to be given in a keyring
> > > > > > (instead of just in a byte array passed to the ioctl) isn't very helpful, as it
> > > > > > just makes the API harder to use.  We've learned this from the fscrypt API
> > > > > > already where we actually had to move away from the keyrings service in order to
> > > > > > fix all the issues caused by it (see FS_IOC_ADD_ENCRYPTION_KEY).
> > > > > >
> > > > > > > >
> > > > > > > > > Second part is the actual block interface. Gaurav wrote about
> > > > > > > > > targeting fscrypt, but there should be no actual difference between
> > > > > > > > > crypto targets. FDE or having a single partition encrypted should
> > > > > > > > > probably work in the same way. Convert the key into blk_crypto_key
> > > > > > > > > (including the cookie for the ephemeral key), program the key into the
> > > > > > > > > slot, use the slot to en/decrypt hardware blocks.
> > > > > > > > >
> > > > > > > > > My main point is that the decision on the key type should be coming
> > > > > > > > > from the user.
> > > > > > > >
> > > > > > > > That's exactly how it works.  There is a block interface for specifying an
> > > > > > > > inline encryption key along with each bio.  The submitter of the bio can specify
> > > > > > > > either a standard key or a HW-wrapped key.
> > > > > > >
> > > > > > > Not in this patchset. The ICE driver decides whether it can support
> > > > > > > HW-wrapped keys or not and then fails to support other type of keys.
> > > > > > >
> > > > > >
> > > > > > Sure, that's just a matter of hardware capabilities though, right?  The block
> > > > > > layer provides a way for drivers to declare which inline encryption capabilities
> > > > > > they support.  They can declare they support standard keys, HW-wrapped keys,
> > > > > > both, or neither.  If Qualcomm SoCs can't support both types of keys at the same
> > > > > > time, that's unfortunate, but I'm not sure what your poitnt is.  The user (e.g.
> > > > > > fscrypt) still has control over whether they use the functionality that the
> > > > > > hardware provides.
> > > > >
> > > > > It's a matter of policy. Harware / firmware doesn't support using both
> > > > > kinds of keys concurrently, if I understood Gaurav's explanations
> > > > > correctly. But the user should be able to make a judgement and use
> > > > > non-hw-wrapped keys if it fits their requirements. The driver should
> > > > > not make this kind of judgement. Note, this is not an issue of your
> > > > > original patchset, but it's a driver flaw in this patchset.
> > > >
> > > > If the driver has to make a decision about which type of keys to support (due to
> > > > the hardware and firmware supporting both but not at the same time), I think
> > > > this will need to be done via a module parameter, e.g.
> > > > qcom_ice.hw_wrapped_keys=1 to support HW-wrapped keys instead of standard keys.
> > > 
> > > No, the user can not set modparams on  e.g. Android device. In my
> > > opinion it should be first-come-first-serve. If the user wants
> > > hw-wrapped keys (and the platform is fine with that), then further
> > > attempts to use raw keys should fail. If the user loads a raw key,
> > > further attempts to set hw-wrapped key should fail (maybe until the
> > > last raw key has been evicted from the hw, if such thing is actually
> > > supported).
> > 
> > That's not going to work.  Upper layers need to know what the crypto
> > capabilities are before they decide to use them.  We can't randomly revoke
> > capabilities based on who happened to get there first, as a user might have
> > already checked the capabilities.  Yes, the module parameter is a litle
> > annoying, but it seems to be necessary here.
> 
> Hmm. This is typical to have resource-limited capabilities. So yes, the
> user checks the capabilities to identify whether the key type is
> supported at all. But then _using_ the key might fail. For example
> because all the hardware resources that are used by this key type are
> already taken.

That mustn't happen here, since finding out in the middle of an I/O request that
inline encryption isn't supported is too late.  That's what the crypto
capabilities in struct blk_crypto_profile are for -- to allow users to check
what is supported before trying to use it.

> 
> > It is not a problem for Android
> > because the type of encryption an Android device uses is set by the build
> > anyway, which makes it no easier to change than module parameters.
> 
> If AOSP misbehaves, it doesn't mean that we should follow the pattern.

It's not "misbehaving" -- it's just an example of a system that configures the
encryption centrally, which is common.  (And the reason I brought up that the
module parameter works for Android is because you claimed it wouldn't.)

Again, needing a module parameter is unfortunate but I don't see any realistic
way around it for these Qualcomm SoCs.

- Eric

