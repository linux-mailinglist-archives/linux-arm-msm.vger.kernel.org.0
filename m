Return-Path: <linux-arm-msm+bounces-114567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RbM3L6FfPWqI2AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 19:04:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 231966C7AF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 19:04:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rPZD0Nez;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114567-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114567-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3333E31835DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 16:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F00830D414;
	Thu, 25 Jun 2026 16:57:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A723EB0EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 16:57:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782406634; cv=none; b=ZeOfptfUVkc7drNBxlDy5DOX8bJnwCj9u0iKDoR6usSxWmnNJX8RL8Q4rhTA7mSZ9UqLFy8TexjEuyHOwudv2mfEbdSI5AIaASlZqFAZIX4XuUtgUs3y5u04R8dcJ9N65OahfSkwDrFIMuG+4a17yp6brmlGxr1qaQfychYh3bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782406634; c=relaxed/simple;
	bh=5uLM2t1OK9gV1VxaAFLmOfm0nFQOJErrRtB3jxbGggU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUMzO0QIUQcb2aJpOSkp/0i+QYdstm5oAF/YTrwxSRTkOjXEVdOdJ5cmMeseu1P7/6yTpaT5ibNt848MdNmrQVb4GICM2b+EvvN07mwKOCVONP4BuYa3lKtFBm6xsSjd/L0fkyaIPakQ4vBM2iQ5MeTEyfDGD1HwPAx00V/Ra6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rPZD0Nez; arc=none smtp.client-ip=209.85.210.182
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so11204b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782406632; x=1783011432; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GBrVOyTAenBaFj8eYAWNpvmiXRoSIrh2l/x5bH7lDzM=;
        b=rPZD0Nezvo01mmRYBoXVeSx/+N/CgR0dr3F5Qp/mncCL+VWiICcDZ1DnaBK+LTcBFq
         Z62A+CpSKFz+RQs+9u+1QnjEe1Zu6ZRuRY+MgDoNBEz8upAF2G2cI+M3cmVeWuPrZ3eA
         tnD4cIWnn+e+zePKiGhc6rby+QgWkME72Xod+npHE4th2HLkX2dB839/1Y6RqIAGt6VT
         qG+T0eZGxi5jb8O4OJv3BzbUgjIDAoZUOIypbQRTxwZb7fNe/5Jcn5LPJ+gGaseGqEEL
         m1E8BjsEJh0awBcAYPbv6xxsGBCfvFNJU/CQ9xrR+L+RFmPhTlsMngVeTyV2NdslWUpr
         ik4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782406632; x=1783011432;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GBrVOyTAenBaFj8eYAWNpvmiXRoSIrh2l/x5bH7lDzM=;
        b=T3ZvrXtxe+erda8pJj5yepZLxgWdlRUTo99ejNHHESBxQriEe59MmeDMlXjqYKdjhN
         YTg8c7wV0ARV7PWx3+7L6UCiZHc4VyFFv1nTIR4mZqeGZdAFKb5GPNFhiFGTDZDccCsZ
         1ES45EUIjnSjvy/TaFimsYk2jkOI8k3MwYsk2e0GaiCL3XofdCBQAtvnMK6GnkkeKMCr
         EUPZJHiyVVOpxHUk1mhHPwGZa7x32BNjeHquphaw6YSuKn2RIaM7xJzE1XaHuE6dLtsF
         AsxJDF2WQWp28/RWvj5K41lrSLz45TKaHeOA79qIx3LmFHdqWIIMFXlb8/1Q5H4ZOre3
         ac6Q==
X-Forwarded-Encrypted: i=1; AHgh+RrG4NyTlq+LIv276fSr05p2QK085kA/ckhcvgL/3J/JAjN49tefEmTZXGuy8Ym5vAQDOdNmhUZeZ9skf419@vger.kernel.org
X-Gm-Message-State: AOJu0YynOaM/VYtvjAM3cKncYm2IxmUJNwpch+5sttLswWceEKIc89mM
	AtdVgVyE1d9RU9vi0vyGP36UzKTwfLIw4J2EOR2tLI+iLXV/f6wsPTHc
X-Gm-Gg: AfdE7ckwvOLFmbHCMH7Ilp62NNhwBDhjCEdluxy08FTMqm2yWR9YKrmZmEar7nB6u61
	O/dMhFP/YliuXiuE8t3o1fLWKbQjQV/9uX5Umsazd+x1PQT5WwHwJQ7ktKw7M1VQtM/nS5WcOYi
	tgtLefiQ48NeyuHM285wfRtbtCLED/N+IPXYO4MuDdaaY4F3R0pMfslw20PFcgiaOMTE0fXmswh
	kWD+BCOMJgev8UP8ntJs3ONfZ3fpRZUO0Z47ULNrwJBCdyusXqd07/kGS3+TUaEu7O1AUb0bF8Q
	NBi0CF1gv2mH/G6dak047Lla3VO0BCTaIBQkeuR56lmRx+B7q8zVAxy6B9Eswvf0Hy4BXGCuedx
	OXhbOzl809GrCySO/RDM+4K//Q3NiE0niZfnx9Kaqn+CMu9BGiSCjMxa2AURJANJPfArh2LN8Yi
	giFL804LoNqKUC9REbJUO2VcFyiuJmxMJF+kFiywcW5cTtVdv7E9L6ew==
X-Received: by 2002:a05:6a00:8598:b0:845:b735:5a7 with SMTP id d2e1a72fcca58-845b73509c4mr1975057b3a.25.1782406632431;
        Thu, 25 Jun 2026 09:57:12 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:c782:a4ca:fcbd:6ba7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a413f604sm4927524b3a.60.2026.06.25.09.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 09:57:11 -0700 (PDT)
Date: Thu, 25 Jun 2026 09:57:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Vincent Huang <vincent.huang@tw.synaptics.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-oneplus: Update
 compatible to include model
Message-ID: <aj1OhZQjO5nNYlAo@google.com>
References: <20260523-synaptics-rmi4-dt-v2-0-0645122babdc@ixit.cz>
 <20260523-synaptics-rmi4-dt-v2-2-0645122babdc@ixit.cz>
 <ahdoBl3qCTyvlYJf@google.com>
 <1d0e7e31-f808-4347-955a-7246dea208f5@ixit.cz>
 <742c7a13-9465-40e8-8990-e679712e9784@ixit.cz>
 <ajtaUb4YmyZTDLmQ@google.com>
 <52b7dd3a-3f6f-474c-8386-4fc2776b185b@ixit.cz>
 <ajxakXFuKAkhdZLN@google.com>
 <f81e4d83-90d9-47c8-aee9-319df3f8b0fb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f81e4d83-90d9-47c8-aee9-319df3f8b0fb@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-114567-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:david@ixit.cz,m:krzk+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:Jason@zx2c4.com,m:matthias.schiffer@ew.tq-group.com,m:vincent.huang@tw.synaptics.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:phone-devel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ixit.cz:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 231966C7AF5

Hi Krzysztof,

On Thu, Jun 25, 2026 at 10:23:54AM +0200, Krzysztof Kozlowski wrote:
> On 25/06/2026 06:53, Dmitry Torokhov wrote:
> > On Wed, Jun 24, 2026 at 04:37:25PM +0200, David Heidelberg wrote:
> >> On 24/06/2026 06:28, Dmitry Torokhov wrote:
> >>> Hi David,
> >>>
> >>> On Sun, Jun 21, 2026 at 07:11:45PM +0200, David Heidelberg wrote:
> >>>> On 28/05/2026 00:13, David Heidelberg wrote:
> >>>>> On 27/05/2026 23:56, Dmitry Torokhov wrote:
> >>>>>> Hi David,
> >>>>>>
> >>>>>> On Sat, May 23, 2026 at 11:45:35AM +0200, David Heidelberg via B4 Relay wrote:
> >>>>>>> From: David Heidelberg <david@ixit.cz>
> >>>>>>>
> >>>>>>> We know the driver is reporting s3706b, introduce the compatible so we
> >>>>>>> can more easily introduce quirks for weird touchscreen replacements in
> >>>>>>> followup series.
> >>>>>>>
> >>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>> Signed-off-by: David Heidelberg <david@ixit.cz>
> >>>>>>> ---
> >>>>>>>    arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 +-
> >>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>
> >>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> >>>>>>> b/arch/ arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> >>>>>>> index 6b7378cf4d493..148164d456a5a 100644
> >>>>>>> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> >>>>>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> >>>>>>> @@ -475,17 +475,17 @@ bq27441_fg: bq27441-battery@55 {
> >>>>>>>        };
> >>>>>>>    };
> >>>>>>>    &i2c12 {
> >>>>>>>        status = "okay";
> >>>>>>>        clock-frequency = <400000>;
> >>>>>>>        synaptics-rmi4-i2c@20 {
> >>>>>>> -        compatible = "syna,rmi4-i2c";
> >>>>>>> +        compatible = "syna,rmi4-s3706b", "syna,rmi4-i2c";
> >>>>>>
> >>>>>> So I believe we established that this device (s3706b) does not in fact
> >>>>>> implement rmi4 protocol properly. Why do we have "syna,rmi4-i2c" as a
> >>>>>> fallback? Shouldn't it be just "syna,rmi4-s3706b"?
> >>>>>
> >>>>> The vendor supplies s3706b which does implement the RMI4 properly.
> >>>>>
> >>>>> The 3rd party replacement impersonating original parts may not implement
> >>>>> it properly, but I don't address this issue in this initial submission.
> >>>>>
> >>>>> With this compatible we know which original part is used by the vendor
> >>>>> and installed in the phones, so later we can deduct specific sequences
> >>>>> for the replacement aftermarket parts to keep phone touchscreen working
> >>>>> same as they do on Android without affecting other devices.
> >>>>
> >>>> Hello Dmitry.
> >>>>
> >>>> May I ask what is currently preventing this series from moving forward?
> >>>>
> >>>> The first version was posted in 2023 [1]. I picked it up again in 2025 [2]
> >>>> and am now on the 9th iteration (this patchset). At this point, the series
> >>>> has been under discussion for well over a year, with relatively little
> >>>> feedback and increasingly long gaps between review rounds.
> >>>>
> >>>> The current approach is based on the guidance I have received so far,
> >>>> including suggestions from the device-tree maintainers. When concerns were
> >>>> raised, I tried to address them and rework the series accordingly.
> >>>>
> >>>> What I am struggling with is understanding what specific issue still needs
> >>>> to be resolved before these patches can be accepted. If there are remaining
> >>>> requirements, objections to the approach, or technical concerns that I have
> >>>> not addressed, I would appreciate having them stated explicitly so I can
> >>>> work on them.
> >>>>
> >>>> I also split out the straightforward, self-contained changes in the hope
> >>>> that at least those could progress independently while I continued working
> >>>> on any follow-up requirements. However, even those patches do not appear to
> >>>> be moving forward.
> >>>>
> >>>> Could you please clarify what outcome you would like to see from this
> >>>> series, and what concrete changes would be required to get it accepted?
> >>>
> >>> I am still confused about how you want to differentiate between the full
> >>> RMI4 support vs the OnePlus flavor. The "syna,rmi4-s3706b", as you
> >>> mentioned, implements RMI4 protocol properly, so we do not need to
> >>> actually have it documented neither in binding nor in DTS.
> >>
> >> --- part 1 ---
> >>
> >> This series addresses identification within device-tree. It's normal
> >> recommended practice.
> >>
> >> If we know, the device ships specific, but **compliant** variant, we just
> >> put it as compatible = "more-specific", "less-specific"; in this case
> >> "syna,rmi4-s3706b", "syna,rmi4-i2c"
> >>
> >> This approach is used everywhere. This has nothing to do with after-market parts.
> > 
> > We do this in many cases, sometimes when a part has different timings or
> > maybe additional functionality compared to the base model.
> 
> Generic expectation is to have always dedicated front compatible for
> every device. rmi4-i2c is not really specific enough, more like a
> family, thus a specific device compatible is essential by the DT rules.

Essential in what way? What will break if such compatible is not there?
We have lived without it for many years and will continue live happily
without it for years to come.

We keep having this conversation each time there is self-describing
protocol that does not require knowledge of a specific part number:
i2c-hid, rmi4, spi-hid coming over soon.

We might need a device-specific compatible if we need to implement
particular power on sequence/adjust timings, and that's when it starts
making sense to introduce one.

> 
> It does not matter if that specific compatible is ever used.
> 
> > 
> > How does this new compatible for controller that fully implements RMI4
> > protocol help here? 
> 
> It does not matter. This is a different device, thus it needs
> front-specific compatible.

Different from what?

$ git grep syna,rmi4 -- arch/ | wc -l
43

Do you have plans to list each and every chip currently covered by
syna,rmi4* ?

> 
> Also, the commit msg actually did mention how this helps: allowing
> further quirks (I did not verify that in practice, but explanation is
> plausible).

Well, the devil is in the details. And that is what I am trying to
understand.

> 
> > 
> >>
> >> --- part 2 (irrelevant for this series) ---
> >>
> >>>
> >>> The issue you have with after-market parts that are not compliant and we
> >>> need to figure out how to deal with them. Inside the driver I
> >>
> >> As was suggested by device-tree folks, this is the first step, there isn't
> >> better one available. If there is, please suggest one, and I'll apply it.
> > 
> > Was it clearly communicated to DT folks that the compatible you are
> > adding is fully compatible with the base "syna,rmi4-i2c" but other ones
> > will not be compatible?
> 
> That was not communicated but also did not have to. You can install in
> your board whatever you wish, e.g. replacing foo device with bar being
> something completely different and incompatible. Does not matter really
> if this is after-market or a person just swapped things.
> 
> DT does not solve that problem simply, because we describe static
> hardware configuration.

But the core issue that David is trying to solve is the fact that these
headsets do not work well with aftermarket parts with the upstream
kernels. It is not a theoretical problem for him, it is something that
he's been trying to solve for a while.

However from my POV I need to make sure the changes to the driver do not
affect or limit well-behaved devices implementing RMI4 protocol
properly.

> 
> > 
> >>
> >>> essentially need a"incomplete protocol" flag that we can use to
> >>> implement additional checks or skip known to be not implemented
> >>> functions/queries. In DT we could introduce something like
> >>> "oneplus,rmi4-i2c" that is decidedly not compatible with "syna,rmi4-i2c"
> >>> and neither one should be a fallback for the other.
> >>>
> >>> This of course needs buy-in from DT maintainers.
> >>
> >> As you can see, this still holds Acked-by and Reviewed-by from the relevant
> >> people - Krzysztof and Konrad.
> > 
> > I see that but the commit does not explain how exactly you are planning
> > to deal with knockoffs.
> 
> I think it does not have to. David does not need to solve all possible
> problems. He is solving his problems and not preventing the other
> problems to be solved in the future. Unless you expect that the second
> part - future problems - will be blocked by this code.

Well, as I mentioned above my understanding is that David really wants
to solve the issue with after market parts not working properly.

> 
> But then I think no one ever solved in DT a problem of replacement of
> valid parts with after-market incompatible parts. Therefore I do not
> even know what solution I could suggest to David.
> 
> > 
> >>
> >>>
> >>> Does this make sense?
> >>
> >> For the scope we're discussing it doesn't seems so.
> >>
> >> This discussion should be associated with the last revision of the full
> >> series I sent 3 months ago. We're in very unflattering state, where:
> >>
> >>   2018 - these aftermarket touchscreen worked on Android well enough for
> >> people to have working touch (let's say with slightly worse experience then
> >> the original).
> >>
> >>   2026 in the mainline, we cannot even more forward and report to user-space
> >> there is aftermarket non-compliant piece of hardware installed.
> >>
> >> Actionable steps I suggest after this series lands:
> >>
> >> 1. don't do any changes, but since we know what 3rd party touchscreen do
> >> incorrectly deviating from the standard, REPORT it to the userspace, so USER
> >> know, their device (phone/tablet) doesn't have original part.
> >>
> >> 2. then figure out, IF we can reasonably well workaround it and HOW to do it
> >>
> >> These two steps present some progress which could be discussed and could
> >> lead us somewhere, what do you think?
> > 
> > So since we know that these devices can come with controllers that do
> > not implement RMI4 fully, can we:
> > 
> > 1. Establish a new compatible that is separate from syna,rmi4-i2c? As I
> > mentioned, it could be oneplus,rmi4-i2c or event a concrete controller
> > vendor,id combo. The point that it should be completely separate from
> > the current compatible and not use the current compatible as a fallback.
> 
> Board/machine level compatible already gives you that.
> after-market-incompatible-parts is not a problem of this s3706b, if I
> understood correctly. It feels to me more of a problem of the board:
> people install into this board some incompatible replacement parts.

So is the suggestion to check if the board matches "oneplus,enchilada",
"oneplus,fajitas" with of_machine_compatible_match()? 

> 
> I would understand that this is not a board/machine level problem, if
> multiple different boards with s3706b were affected. Is this the case?

David?


Thanks.

-- 
Dmitry

