Return-Path: <linux-arm-msm+bounces-114276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id klmJE/BcO2r9WggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 06:28:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F47B6BB3F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 06:28:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qYhKUN2J;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114276-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114276-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7060E3024C91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 04:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210523812C7;
	Wed, 24 Jun 2026 04:28:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2D9366562
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 04:28:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782275295; cv=none; b=t8RsUl5MGoMjslCGnF/nvKR8/yftVv2xVAQQvisQzm81MIxFGVZYKrcUfsFEoLbX3WWz01mzWvu5jA4cMD03vJgFbgW0MNguftF6a4d7qgeuStcOM+MQo/keFU1SDkPMiEmoBkhWfknCuQeUpTn6uRVtrOFQdx11s3fl6TjNIRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782275295; c=relaxed/simple;
	bh=CatfsTP8wXiX+fsqwI5MUAVJoIpCzIOidq0t0/coTaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pp6ynRNUEEW0VdL9gjaEBuonSccj0JvaIgH7WQqocFXOK9U0H20Bu/XCvr9gWvcVijpg0SjLbFsxQ08iJ4GeUE4i85dE1W0/JyNFw92Im4NRNRJeYqvo62F9ux+Ducw41cJF9N5xDgptMuF2K20CYJ3K0x/s6f5rTJW1zlxmzmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYhKUN2J; arc=none smtp.client-ip=74.125.82.175
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30bf132969bso770271eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 21:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782275292; x=1782880092; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EEdnK3yMj7vaMPJob7ZvZ1mk4WeNg/B5FxtgUQVR5Lw=;
        b=qYhKUN2JvsDeCQcXG2CFYYYHESi3M4W9NrqLLmN0s4K5e/6fumhDEwdAIa8weo7sNJ
         cTRw4u34s2QV1nP95cqA00iKK0rCYKBLwsbvIYJxQ+HkYzQLXpC9Tgj8A1SUhk2XSftu
         n+73V0qDaWHErvlo2PwDVVdDf1vuw4ceFaaGd1MmpjcmcGYmow7GfDYIYluy4fYzN3cu
         QLi5B5El+xhe34yu8zpIdDx2W8f6pJrNX6ta6XDAb2kRo8tIhU0QLRFiyvIfQqQapifL
         CtGAPc2wNo4vwMxsHgV9L4ahVyjQFTcNKbFjVvO5EGXUWOLB29zlpsUaUI0W+bi41i3m
         s+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782275292; x=1782880092;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EEdnK3yMj7vaMPJob7ZvZ1mk4WeNg/B5FxtgUQVR5Lw=;
        b=RBrXXhzUQ/kjXVTi+00tQ/zYchXQCJ9Uz4QlpHliD4j2q26V+VfdBRJFdAveVVGpjE
         KmyoHzmn+UcTil0VhnxqW8ZS6wcfEpguiqwPbM7J7WNjP0dGdGOJgJ9fm35MFsFj3G1Y
         JtXHCNXWxUGDerx1kXAGBuGnyNPy/ms5LsF5/bTrWbObe/KEN/aZSjbfhE1oFDbW5Urh
         R+z+hmUzT+ej5Ui1yB/YOJ8Dl/7/2IiGt6fBWQMOehW8XorNVGENvstA7YHlqMo4xyaH
         /noyhAlAfCdTCGLxOLYL6e+q9+CRGTIYs0SUHuBk8Msbmb2sLg3VejcUuvR+JNjfBlER
         nq6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrt5xmcMslX3i7Dh0QjFmTWmNjVNzzpN9yG9WUevfwVbULcnD1JgoWaNP8Vp3b+tGNvcMSNO/urZUURQLRc@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ6g5aAdXir9pK8MQr5RaCfYsaNknD48mnVTh8kQh3lLYJA1v+
	fLWIcAZJSKLcXfxx36KLJpkhiVpkkDul41dquzMAIRDXkKyBhBNSKCEs
X-Gm-Gg: AfdE7cmcCbcsOai2ZPGCXj4iT7X/P0MCSEXgJhUBdoeJn7sUrEEqFbSn22DtU4f9M2Y
	yjkQkkZuMCaafgS5S4OcMPEOFgoDZ/03UMazrOtmOydbcUhlPqqtE5ATeBHgiBgxVPJVoC1r71q
	+vQgXI5ZeHMIN4/FQDhtlAIafllLDnVsv4AGxOiJc5Af4Dw86LK9YmRauzUY+LCWZmk+ZwF2Fh3
	F6F8nd9U91NAPRyNmnuxrl5pvbK/JNxHXfSFajdkwvIH8m+lflS72S72W8bM4lSttCfjJk253TH
	MosfZBclAYHW1bt7L4WM4uLfhmpHUX3BzLmGcb+oxkAm0lQfyQiNes4Jxgefn4Li5nQzdTkANKb
	BSiTXHlBN4Ame4/Ono3ASrq9kq3PNV4/1X3H8t6n5nGu25CA18i/mEsoGmpbEF5JVc7+jse2S1G
	h2mGxMisHXTLX8LE8g+tlIalWhu9pUbLMDbkp/6xyrpPr23jOyUkn+Zg==
X-Received: by 2002:a05:7300:5415:b0:2ed:e14:7f5c with SMTP id 5a478bee46e88-30c68e42cfcmr2209522eec.32.1782275291490;
        Tue, 23 Jun 2026 21:28:11 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:6026:1e6d:4a80:9bd0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c6f4993a1sm640193eec.17.2026.06.23.21.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 21:28:10 -0700 (PDT)
Date: Tue, 23 Jun 2026 21:28:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Vincent Huang <vincent.huang@tw.synaptics.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-oneplus: Update
 compatible to include model
Message-ID: <ajtaUb4YmyZTDLmQ@google.com>
References: <20260523-synaptics-rmi4-dt-v2-0-0645122babdc@ixit.cz>
 <20260523-synaptics-rmi4-dt-v2-2-0645122babdc@ixit.cz>
 <ahdoBl3qCTyvlYJf@google.com>
 <1d0e7e31-f808-4347-955a-7246dea208f5@ixit.cz>
 <742c7a13-9465-40e8-8990-e679712e9784@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <742c7a13-9465-40e8-8990-e679712e9784@ixit.cz>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-114276-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Jason@zx2c4.com,m:matthias.schiffer@ew.tq-group.com,m:vincent.huang@tw.synaptics.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ixit.cz:email,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F47B6BB3F7

Hi David,

On Sun, Jun 21, 2026 at 07:11:45PM +0200, David Heidelberg wrote:
> On 28/05/2026 00:13, David Heidelberg wrote:
> > On 27/05/2026 23:56, Dmitry Torokhov wrote:
> > > Hi David,
> > > 
> > > On Sat, May 23, 2026 at 11:45:35AM +0200, David Heidelberg via B4 Relay wrote:
> > > > From: David Heidelberg <david@ixit.cz>
> > > > 
> > > > We know the driver is reporting s3706b, introduce the compatible so we
> > > > can more easily introduce quirks for weird touchscreen replacements in
> > > > followup series.
> > > > 
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > > b/arch/ arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > > index 6b7378cf4d493..148164d456a5a 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > > @@ -475,17 +475,17 @@ bq27441_fg: bq27441-battery@55 {
> > > >       };
> > > >   };
> > > >   &i2c12 {
> > > >       status = "okay";
> > > >       clock-frequency = <400000>;
> > > >       synaptics-rmi4-i2c@20 {
> > > > -        compatible = "syna,rmi4-i2c";
> > > > +        compatible = "syna,rmi4-s3706b", "syna,rmi4-i2c";
> > > 
> > > So I believe we established that this device (s3706b) does not in fact
> > > implement rmi4 protocol properly. Why do we have "syna,rmi4-i2c" as a
> > > fallback? Shouldn't it be just "syna,rmi4-s3706b"?
> > 
> > The vendor supplies s3706b which does implement the RMI4 properly.
> > 
> > The 3rd party replacement impersonating original parts may not implement
> > it properly, but I don't address this issue in this initial submission.
> > 
> > With this compatible we know which original part is used by the vendor
> > and installed in the phones, so later we can deduct specific sequences
> > for the replacement aftermarket parts to keep phone touchscreen working
> > same as they do on Android without affecting other devices.
> 
> Hello Dmitry.
> 
> May I ask what is currently preventing this series from moving forward?
> 
> The first version was posted in 2023 [1]. I picked it up again in 2025 [2]
> and am now on the 9th iteration (this patchset). At this point, the series
> has been under discussion for well over a year, with relatively little
> feedback and increasingly long gaps between review rounds.
> 
> The current approach is based on the guidance I have received so far,
> including suggestions from the device-tree maintainers. When concerns were
> raised, I tried to address them and rework the series accordingly.
> 
> What I am struggling with is understanding what specific issue still needs
> to be resolved before these patches can be accepted. If there are remaining
> requirements, objections to the approach, or technical concerns that I have
> not addressed, I would appreciate having them stated explicitly so I can
> work on them.
> 
> I also split out the straightforward, self-contained changes in the hope
> that at least those could progress independently while I continued working
> on any follow-up requirements. However, even those patches do not appear to
> be moving forward.
> 
> Could you please clarify what outcome you would like to see from this
> series, and what concrete changes would be required to get it accepted?

I am still confused about how you want to differentiate between the full
RMI4 support vs the OnePlus flavor. The "syna,rmi4-s3706b", as you
mentioned, implements RMI4 protocol properly, so we do not need to
actually have it documented neither in binding nor in DTS.

The issue you have with after-market parts that are not compliant and we
need to figure out how to deal with them. Inside the driver I
essentially need a"incomplete protocol" flag that we can use to
implement additional checks or skip known to be not implemented
functions/queries. In DT we could introduce something like
"oneplus,rmi4-i2c" that is decidedly not compatible with "syna,rmi4-i2c"
and neither one should be a fallback for the other.

This of course needs buy-in from DT maintainers.

Does this make sense?

Thanks.

-- 
Dmitry

