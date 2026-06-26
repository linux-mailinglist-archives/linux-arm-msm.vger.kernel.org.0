Return-Path: <linux-arm-msm+bounces-114603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u88HLH4QPmqp/QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:39:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2917D6CA6D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:39:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="I/f4P/dh";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114603-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114603-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34CF2300A7F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13158389E13;
	Fri, 26 Jun 2026 05:39:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DD63C6611
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:39:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452347; cv=none; b=h24GMqOOiwgW3SUEmsWQeQbvFF0cBeAurlm2lbtlwUEBM+lsnhbYHmCm8N+mrtj2SvejVNDs+xCK+mjh4ET9Ug2ANY6TS4nW0O7FCAXDwE7UaxOGSg/bV/LlJ2GA9S2kxa5Shz4yd3ss8HJWm+Y9yAIxr8mJDRXgZ4xq5RJ/6iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452347; c=relaxed/simple;
	bh=yg1iR2eX+aSwl1WeDbQ1iGJMeExq9sx+kGcLa1kbL6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7uTvYHjjnKjGRDgO7BrXcE/ghzMtq7kh22OfkHddfXvPMWXTtFwlCWcAVqjhTkExV0d3wQ8iIsR2mgyg1UEsCVj1myQrXGIk20RH0k5FoSGtcG3AXOqmm+Oiunwt+vjzl80iunia6zM2sE49yeDkS+8fLNNi0dH7MD0ZTs5DrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/f4P/dh; arc=none smtp.client-ip=74.125.82.173
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so904735eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782452343; x=1783057143; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PhqZPVerKLJBXebvWPDJC0C1pTu6QcXLOIWVjWqdOYk=;
        b=I/f4P/dh+jCMG5RpP6ArymqE1ISPTSS6gZIqambDTuSrDMh840Vd7CDU+vSkOqhait
         F4xA0y9ByvMN7QFYY6qhTT3zAcDFNtPQpTauM7bVo3YiUUIOWknhQs6/jwZPVPV1UHD9
         reAKweUqgyNuF/XsyxgCXgryMJQ9alWRmRDeBqFztGoX2Q8irPyKNS1/BtFy5Xz1I/3j
         TKOP/aKgx1qzPHX7vDHPSoSjvRDHdaBevRx2NurMxb2SkPKG7xmPwn0GdV27yroqo9kL
         h3rnGCcvHTVCiGklrOZs05xRaiqA5SRwStMMyLBmYhtni2HGUfSmPA0lbDXhUi1jKWpe
         2BFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782452343; x=1783057143;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhqZPVerKLJBXebvWPDJC0C1pTu6QcXLOIWVjWqdOYk=;
        b=oIruCkeVCK0AvEmcQqWPU0vvSzQifkIRVT2ImC0vZNA+9dG8zPzQ421YCI4iTdBi60
         pVYlYLSv1pdvJgdTMmFqMrzncIgndJHoMQB/rTFgGJ9urc3GNvQOeHZMQg2CIF0TuQ3s
         0kV4pcoiw267Zn6Xi+4num4wNxjIIVIxoF9UOHIV2yRLTtx0FMOvvxnq1pOsaYK2vS6h
         djtL52tJ1HZbDbRxrITBuDih3vL2raB10e01y9+dN+TyB+1FEHWFlsbIgm0mgRCMxMww
         fF1iJ4ya3B+VVZO8NQyRBI7RXGS49YazwBS4avLB9j5qO2z+ZX40KtrpnK4kjgZxrAbT
         MraA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1otNdHem1cElmR0Au2muiErrUUPBRhAtAZ1Mz/ZFepsgevoXKWhheOCtMe6iez9j46aS/x7rmJBNx4JCf@vger.kernel.org
X-Gm-Message-State: AOJu0YzKUNXApkvpwpE9kdsGFlBaasrkjIGqxbgXNj3XLdjHBxb4JbVR
	Kfhgbhih63D6akVF7qqJwtqtO08HhYduJRoNRypAXT3HANGeT42YefVM
X-Gm-Gg: AfdE7clIF0NkuZJ8KLfLFJABGa1B2x6AEYHmsJKbG+vq7PxtJaJEjOo3MkpXuxsAClA
	HYKIMaWL80I/bpuWRNNNoeLXwQuU6pDgnDX4eBsPsTVxacNC5HDQrL/OzM4xorlhp2xFm+UKmpy
	XweW9p38bFEct7wU20ygsa5iltf1ikGFQ7s8Y++UYQzefDEAsmvFnxZlcDubZWypNXZXUmBPsjF
	iqqV12u9tQKTdvbswg9n+bxKlU9w0rwqq7uekX+msUjD6cJmbaB7eJf5HxWOSRgj1QRvPvOu5a/
	mwVjjEqcbB/kX+qC6vvsFDpbPx8+0XH12vUOA5pXBiEA/L3tU3n4cxRNF0JzZsl43R+ZDBe3kaN
	zovo5wqADMzoB0kP6s1E+8m88maeedD93+kErVyIQdF1X33W7T+TGh3kuBpsclbOV3QYPo5sUPH
	lhw9cn9b3XqmvNfpm/ku+4njF/yt828UzK7IidyH3FTl5jTgXF2Qjx6A==
X-Received: by 2002:a05:693c:23c9:b0:30b:c6f0:1cd9 with SMTP id 5a478bee46e88-30c84d7f362mr5143316eec.26.1782452343350;
        Thu, 25 Jun 2026 22:39:03 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a474:bf4a:4966:8d97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c570b7bsm13347671eec.12.2026.06.25.22.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:39:02 -0700 (PDT)
Date: Thu, 25 Jun 2026 22:38:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Vincent Huang <vincent.huang@tw.synaptics.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-oneplus: Update
 compatible to include model
Message-ID: <aj4QUY5p7gqLplVT@google.com>
References: <20260523-synaptics-rmi4-dt-v2-2-0645122babdc@ixit.cz>
 <ahdoBl3qCTyvlYJf@google.com>
 <1d0e7e31-f808-4347-955a-7246dea208f5@ixit.cz>
 <742c7a13-9465-40e8-8990-e679712e9784@ixit.cz>
 <ajtaUb4YmyZTDLmQ@google.com>
 <52b7dd3a-3f6f-474c-8386-4fc2776b185b@ixit.cz>
 <ajxakXFuKAkhdZLN@google.com>
 <f81e4d83-90d9-47c8-aee9-319df3f8b0fb@kernel.org>
 <aj1OhZQjO5nNYlAo@google.com>
 <32affded-bae2-46c4-a702-2054fbfe46a8@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32affded-bae2-46c4-a702-2054fbfe46a8@ixit.cz>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-114603-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:krzk@kernel.org,m:krzk+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:Jason@zx2c4.com,m:matthias.schiffer@ew.tq-group.com,m:vincent.huang@tw.synaptics.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:phone-devel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ixit.cz:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2917D6CA6D5

On Thu, Jun 25, 2026 at 08:39:15PM +0200, David Heidelberg wrote:
> On 25/06/2026 18:57, Dmitry Torokhov wrote:
> > Hi Krzysztof,
> > 
> > On Thu, Jun 25, 2026 at 10:23:54AM +0200, Krzysztof Kozlowski wrote:
> > > On 25/06/2026 06:53, Dmitry Torokhov wrote:
> > > > On Wed, Jun 24, 2026 at 04:37:25PM +0200, David Heidelberg wrote:
> > > > > On 24/06/2026 06:28, Dmitry Torokhov wrote:
> > > > > > Hi David,
> > > > > > 
> > > > > > On Sun, Jun 21, 2026 at 07:11:45PM +0200, David Heidelberg wrote:
> > > > > > > On 28/05/2026 00:13, David Heidelberg wrote:
> > > > > > > > On 27/05/2026 23:56, Dmitry Torokhov wrote:
> > > > > > > > > Hi David,
> > > > > > > > > 
> > > > > > > > > On Sat, May 23, 2026 at 11:45:35AM +0200, David Heidelberg via B4 Relay wrote:
> > > > > > > > > > From: David Heidelberg <david@ixit.cz>
> > > > > > > > > > 
> > > > > > > > > > We know the driver is reporting s3706b, introduce the compatible so we
> > > > > > > > > > can more easily introduce quirks for weird touchscreen replacements in
> > > > > > > > > > followup series.
> > > > > > > > > > 
> > > > > > > > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > > > > > > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > > > > > > > > ---
> > > > > > > > > >     arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 +-
> > > > > > > > > >     1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > > > > > > > > b/arch/ arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > > > > > > > > index 6b7378cf4d493..148164d456a5a 100644
> > > > > > > > > > --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > > > > > > > > +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > > > > > > > > @@ -475,17 +475,17 @@ bq27441_fg: bq27441-battery@55 {
> > > > > > > > > >         };
> > > > > > > > > >     };
> > > > > > > > > >     &i2c12 {
> > > > > > > > > >         status = "okay";
> > > > > > > > > >         clock-frequency = <400000>;
> > > > > > > > > >         synaptics-rmi4-i2c@20 {
> > > > > > > > > > -        compatible = "syna,rmi4-i2c";
> > > > > > > > > > +        compatible = "syna,rmi4-s3706b", "syna,rmi4-i2c";
> > > > > > > > > 
> > > > > > > > > So I believe we established that this device (s3706b) does not in fact
> > > > > > > > > implement rmi4 protocol properly. Why do we have "syna,rmi4-i2c" as a
> > > > > > > > > fallback? Shouldn't it be just "syna,rmi4-s3706b"?
> > > > > > > > 
> > > > > > > > The vendor supplies s3706b which does implement the RMI4 properly.
> > > > > > > > 
> > > > > > > > The 3rd party replacement impersonating original parts may not implement
> > > > > > > > it properly, but I don't address this issue in this initial submission.
> > > > > > > > 
> > > > > > > > With this compatible we know which original part is used by the vendor
> > > > > > > > and installed in the phones, so later we can deduct specific sequences
> > > > > > > > for the replacement aftermarket parts to keep phone touchscreen working
> > > > > > > > same as they do on Android without affecting other devices.
> > > > > > > 
> > > > > > > Hello Dmitry.
> > > > > > > 
> > > > > > > May I ask what is currently preventing this series from moving forward?
> > > > > > > 
> > > > > > > The first version was posted in 2023 [1]. I picked it up again in 2025 [2]
> > > > > > > and am now on the 9th iteration (this patchset). At this point, the series
> > > > > > > has been under discussion for well over a year, with relatively little
> > > > > > > feedback and increasingly long gaps between review rounds.
> > > > > > > 
> > > > > > > The current approach is based on the guidance I have received so far,
> > > > > > > including suggestions from the device-tree maintainers. When concerns were
> > > > > > > raised, I tried to address them and rework the series accordingly.
> > > > > > > 
> > > > > > > What I am struggling with is understanding what specific issue still needs
> > > > > > > to be resolved before these patches can be accepted. If there are remaining
> > > > > > > requirements, objections to the approach, or technical concerns that I have
> > > > > > > not addressed, I would appreciate having them stated explicitly so I can
> > > > > > > work on them.
> > > > > > > 
> > > > > > > I also split out the straightforward, self-contained changes in the hope
> > > > > > > that at least those could progress independently while I continued working
> > > > > > > on any follow-up requirements. However, even those patches do not appear to
> > > > > > > be moving forward.
> > > > > > > 
> > > > > > > Could you please clarify what outcome you would like to see from this
> > > > > > > series, and what concrete changes would be required to get it accepted?
> > > > > > 
> > > > > > I am still confused about how you want to differentiate between the full
> > > > > > RMI4 support vs the OnePlus flavor. The "syna,rmi4-s3706b", as you
> > > > > > mentioned, implements RMI4 protocol properly, so we do not need to
> > > > > > actually have it documented neither in binding nor in DTS.
> > > > > 
> > > > > --- part 1 ---
> > > > > 
> > > > > This series addresses identification within device-tree. It's normal
> > > > > recommended practice.
> > > > > 
> > > > > If we know, the device ships specific, but **compliant** variant, we just
> > > > > put it as compatible = "more-specific", "less-specific"; in this case
> > > > > "syna,rmi4-s3706b", "syna,rmi4-i2c"
> > > > > 
> > > > > This approach is used everywhere. This has nothing to do with after-market parts.
> > > > 
> > > > We do this in many cases, sometimes when a part has different timings or
> > > > maybe additional functionality compared to the base model.
> > > 
> > > Generic expectation is to have always dedicated front compatible for
> > > every device. rmi4-i2c is not really specific enough, more like a
> > > family, thus a specific device compatible is essential by the DT rules.
> > 
> > Essential in what way? What will break if such compatible is not there?
> > We have lived without it for many years and will continue live happily
> > without it for years to come.
> 
> Hi Dmitry, Krzystof,
> 
> Device tree should describe the hardware, rmi4-i2c isn't the exact model of
> hardware used, the real hardware is Synaptics S3706B. Device-tree should,
> where possible, describe the actual hardware used.
> 
> > 
> > We keep having this conversation each time there is self-describing
> > protocol that does not require knowledge of a specific part number:
> > i2c-hid, rmi4, spi-hid coming over soon.
> 
> While the protocol doesn't require this knowledge, where is the issue
> provide the model, at least in the places where we know it?
> 
> Does it making things worse to describe hardware in more detail?

OK, I applied the binding change, the dts change should go through some
other tree.

Thanks.

-- 
Dmitry

