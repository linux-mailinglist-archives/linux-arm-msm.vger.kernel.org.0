Return-Path: <linux-arm-msm+bounces-98807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J05Dv06vGl3uwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:05:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F7F2D083A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 250F330048EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 18:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7626F37D108;
	Thu, 19 Mar 2026 18:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ig7Y/LMQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D823A34167B
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773943467; cv=pass; b=B4Rg7WsTcNA/6jNrXwe45L4XIyzSwmH4a0k5cuIL9t7NikLlOpn7cIyr5LNTMDW+jnmG/Ay+7qZWwJmOqAsDxz7LW1lhP3aPvowtpsgwggYnL5x0kk64025wtav6pZ/Lhdep0hGvf40JVB4+lMO5AZlJnwUalDFjNbkzxJ0/YYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773943467; c=relaxed/simple;
	bh=UZsBgzIMMXUPHaJ0vVvA9p7eAdLYHTa6nA3WW5sxuik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpG2xXRKaqE2kqijm7N0O2PiT+9O9Vj4g2eExKhGkClSCPyqoxfC4MjMRsqyEILFcGS7GkQp1tWFH/keRQwiYVSIDc0PbWrxAbEESMCRJDAtLXRryLePQnyPqD6P+Z2zpqy28HzFQ5t9uSpyfF/1ycUTXUQTJnS142lBkkks4xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ig7Y/LMQ; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so1365774e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773943464; cv=none;
        d=google.com; s=arc-20240605;
        b=LLKQdmtne16AvsOxW3SHRWSbQhxNRnHYEAhITz85T8s/JtTHi0VLOOm3K81bDT7WlL
         WkdlHJxcyhzyhzHczF+OGx5UvHeVRGZg5dnAKp35oASQ4GkKIrcWG0J7L70oKFX6h0SQ
         HMX0kyFAngIUg6VHCxb2EhKRe/LmeQNdh1BiEhpLDyKCYNwYXdCsmfnO1ob8ZNwtoja0
         9LgmCGmhp/zsDLOIBwgvRllvrMrFHDpZFHfVCpZRJGaYjj/9Hs4le4Ibum6iC/dj6SAt
         fjVZmIhWYwdFO6+z2Vk6vA/qfUyqRVQKKoeHV0sZWqfK45FqPcv+tHypLnoB5l1axd1z
         6BVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=egSQdqJank7GnU11HGBCHxRGl38gS7FGsg2P498OI9o=;
        fh=+bvBWa7jqDwM21SZpTRcZ3Momvz+1m8fZDhbVbNlpI0=;
        b=bNOcxDbzJsTUEdNNYUs4h/97ZVdq4x/bVe+Fb7rUdFKS84xfmng56EWTHMVci2l2Kq
         dXbgTzzKIB1FFwaY9C+4JWh5Vw4R/mlBDrUIfxizZBOEVjZCjvtHKeSnCIZRihvRIZHk
         10Hgw0KA3OKE6etpgucvK1jVUE2Bh/nzyhYA+q7GaZkx/jTr1pidnWq3SycXhKAaxCKk
         o1h0LQOprfWAAnGnGdKFUwUMNQ0ZsDWkK5+N2hGZE4JhY0kZMzbGFGQTdmQhx6lfPYFl
         YC945Mz0uVqG7OYa42uU+3fClrGGi2+WqZjyAsY0qi+oOPdEw6wQIKwmtCXp+sufY9oK
         iYRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773943464; x=1774548264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egSQdqJank7GnU11HGBCHxRGl38gS7FGsg2P498OI9o=;
        b=ig7Y/LMQERHxWJAiaYiAR+Rd6pFkaybexlHBUMBfIk745JPKH9vehg0oxt+1t+rF2R
         7tqJeZ+uqS8y8XSXfPicnuFJWef5JxCBLKl+NiBN8a3rUxDoSHCwjYrnrcMKkShn1c53
         c4oENoaSQICDEBACGxLM3nAcT5FgM0v1CSUTukjDITfVuKnhwPqEbW2LzzGie3rcApEo
         rxq6vGv1LSsSws/9MQs1Yun054zNKl8iydLsN4VHqn6h3H2t6813FxV49jxTMZPNsXDW
         THbY+JBbvi9nbVzEDOsEj/xWWq9B3reQpOZRLATTCLQvoJSfQbq98G1uOmIZODRHGV2z
         MkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773943464; x=1774548264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=egSQdqJank7GnU11HGBCHxRGl38gS7FGsg2P498OI9o=;
        b=rxxJ3NyUsj4mI2XQncLGhltIZT6ODejRGOsgIf5yBkeMGYOuOrXBhpegyDXU12QTC6
         m83DeGO4j/6Y1SdgWjxqiCNSQv+BgUKjOQC892JyBoHnKHHNOBfMAHljnq2zaOMi17Ew
         9n8b3Zkc5bpkrPavYdOlX5HmTPdBIaWi506hfzfr+OH7gp90LjZf+02alENSZXN7Xycf
         vXJ0CaUkNTOL0yKH8THJ5Q+bv3WN5k6LnQlevlzcj5pv/d/8Qk4TIvJ4i7jczNYfgOsL
         IJgeOUx6l72T7NhVoXl3/Sa5hsw/sXRNM+WB678mj24CF1iNCCuz0kswKJ5ODNgyMTe0
         W7/g==
X-Forwarded-Encrypted: i=1; AJvYcCWgKVrbX8S/bjzMgFf6bbjfuV5eXTfSweg5x1KUgZhJJen8y4j6t1Vh+feNy/KSDw++hbYY/57sOdv8XQ6N@vger.kernel.org
X-Gm-Message-State: AOJu0YxlESAFH1kxYVlDIDpihd+ZZpJwGN9JeC5BAVQp2B6qZzBhXZII
	FksoSgSyxxdKFmw7VbL2JtrJ0h26XrBIQ+LXCwYhIRSAcJ28l+tbLS/3p5kVXPERBO/ZRWOnGkg
	FphkHz5NDLvNhvJ5LX1A+ADWvjYSbRqE=
X-Gm-Gg: ATEYQzwrB4zuJW3tO97zuPcRKeyUqfWds1EnQ9VvOVbZIBA6Vf6Come88kTpHSsiDa8
	LUHopKExe6x9TuORY0jf5S/1CIRmGCh4sa8xcVJdpgvTw7ItrChIhKvdyTLjoMLlv0xlqYn0J/W
	gjGxpi+LeHJoqZZWn2n/wKyVbNK8t62NhUptESxP/5QoC+orjsSqldbdjqRy92RLIAO/6wsVMEc
	WB3vJLFSM5tQuUckHwJGW9Ajf5K1fWnaL/GqyCKtmNM/9oNAC8+g1UhvWPWT81+9zl1f4VygJ38
	5lSUDfHcOlvZmWWldeAbxiEbXVuL1iPi9yQbclxHAPjjwuNFTvLuaH086kD/U8Eb2j8K
X-Received: by 2002:a05:6512:1253:b0:5a2:7845:edf0 with SMTP id
 2adb3069b0e04-5a285aefb65mr11300e87.9.1773943463675; Thu, 19 Mar 2026
 11:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com> <4757fd22-fe9f-4228-a0a5-11d9309549ac@packett.cool>
 <CALHNRZ_RU+uHXfUtSO+8pKOYfBuK9jbYgqWE70WMQ=5Qz2MvvQ@mail.gmail.com> <quybzbqxlohu6kiqmno2wzyltwejnc2vebxdgvdl3fdib7zg7u@wz3bkop7psu6>
In-Reply-To: <quybzbqxlohu6kiqmno2wzyltwejnc2vebxdgvdl3fdib7zg7u@wz3bkop7psu6>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 19 Mar 2026 13:04:12 -0500
X-Gm-Features: AaiRm51kg4TIvnntPBX3e6M7A651_LBTi1jXd-VrrNoMSelN0fLJA0d2wgB6F64
Message-ID: <CALHNRZ9uA+xMnDg2fH3cCWVneJ6ZsBFq9y4x58JeQ_V0P7bv1g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add AYN QCS8550 Common
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98807-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.797];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,packett.cool:email,sobir.in:email,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A2F7F2D083A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 10:19=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Mar 11, 2026 at 08:39:37PM -0500, Aaron Kling wrote:
> > On Wed, Mar 11, 2026 at 7:49=E2=80=AFPM Val Packett <val@packett.cool> =
wrote:
> > >
> > > On 3/11/26 2:44 PM, Aaron Kling wrote:
> > >
> > > > From: Teguh Sobirin <teguh@sobir.in>
> > > >
> > > > This adds a base dtb of everything common between the AYN QCS8550
> > > > devices. It is intended to be extended by device specific overlays.
> > > >
> > > > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > > > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
> > > >   arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dts | 1777 +++++++=
+++++++++++++
> > > >   2 files changed, 1778 insertions(+)
> > > > [=E2=80=A6]
> > > > +/ {
> > > > +     model =3D "AYN QCS8550 Common";
> > > > +     compatible =3D "ayntec,qcs8550-common", "qcom,qcs8550", "qcom=
,sm8550";
> > >
> > > Huh?.. All existing -common files are .dtsi includes without their ow=
n
> > > model/compatible, and the compile-time "dtbo" support is only used fo=
r
> > > EL2 where we want to apply the same thing to many many devices withou=
t
> > > polluting the tree with extra glue files. I don't see why this should=
 be
> > > a "common device" with its own compatible string, and not just a dtsi=
.
> >
> > My use case for these devices is Android, using a single base dtb and
> > variant dtbo's in a single software build. Given the aosp boot image
> > v4 setup, using individual dtb's would require different vendor_boot
> > images, which would require multiple build targets. This setup allows
> > for my use case, while also having individual dtb targets for a
> > standard Linux use case. To my knowledge, the final device specific
> > dtb from this is the same as a dtb using a common dtsi.
>
> This needs to be explained in the commit message. But do you need then a
> model/compatible in the default dtb?
>
> >
> > > > [=E2=80=A6]
> > > > +&i2c0 {
> > > > +     clock-frequency =3D <400000>;
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&i2c4 {
> > > > +     clock-frequency =3D <400000>;
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&i2c12 {
> > > > +     clock-frequency =3D <400000>;
> > > > +     status =3D "okay";
> > > > +};
> > > If the individual devices actually use these busses, better to enable
> > > them inside of their .dts as well I think?
> >
> > I can move them. I think the idea was that all variants do use these,
> > but for different hardware, so might as well commonize this part. This
> > part existed before I started working on the devices, so I can't say
> > for sure.
>
> Well, the only common part is the frequency & status, so not so much.
>
> BTW: could you please uniformly add an empty line before the status
> properties?
>
> >
> > > > +&iris {
> > > > +     status =3D "okay";
> > > > +};
> > > Works with generic firmware?
> >
> > I have not been able to verify this. Unfortunately, there is not an
> > aidl v4l2 c2 hal for aosp. If the expectation is that device specific
> > firmware is needed, even for unfused devices, I can drop this section
> > until I am able to use it. Or maybe Teguh could chime in if this works
> > on ROCKNIX.
>
> You can use ffmpeg to verify the unit. It has v4l2m2m codecs.

I did get a static ffmpeg binary to run and transcoding using v4l2m2m
hw codecs were working. So the generic firmware is fine.

Aaron

