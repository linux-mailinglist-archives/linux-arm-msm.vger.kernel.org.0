Return-Path: <linux-arm-msm+bounces-114441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w6ZeHUi0PGoYqwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 06:53:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E96236C2B1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 06:53:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=a530rYii;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114441-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114441-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB8E33018767
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 04:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CEFB2FF67E;
	Thu, 25 Jun 2026 04:53:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31262F60CC
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 04:53:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782363205; cv=none; b=Pb0xLPbtdeWcdpN3QvrXl/ITWugvUY8xnlkS2wxf7Wo6SfbOYfoBuFzafyiRKyiSZS195WIHBdiPJ3tO2XqCcEtwzufwLC6i7Rcdy2f8DYmtSBwcFnXuHA5g+0k1AJrUlh/au7dDjUA/5arY1dgLL1brcoh5aqVQC0eh1L8KQ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782363205; c=relaxed/simple;
	bh=+r5MShm5dJNFAt/vj3a1tzfA5ffFPEd9Xvw2aKOngkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3Xfy30AiAEvBUtBmAs6XMvdjKTPhD4z2Y88aHkP7TmVicCDJogXnQo4rXJhVoo9RXkfFMyJSDiyvAPgorhaO17cf/wWKAZ/LS4VXk+x9sVF/h/GUoBdZNkVcot46tw946C5ZOTniV449HAfupo0b+MU/B6H/A6B4leKg/BEOAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a530rYii; arc=none smtp.client-ip=74.125.82.181
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30b9e755555so3990038eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 21:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782363203; x=1782968003; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0tA1o79GF2y+eTYK/pnc5wl3lBb1SmYdnnZxK1L8M8Y=;
        b=a530rYiiunNyRg54L4rLhtnM3O1N0ers/nQHIZSEkoQOOoSukxFbXIcK5VHxaQC4up
         LJJ7JMIObMlVHtuczu+jKChhmqH6V+DpPz+gGM4VfdXNS+/KWCsCD3h0IAEKndOkmbTI
         Ubi2bZCctdLLjG/9l3c4dxcrtFRvx18O+TLdrqDETqAO0A1xdjnEPIkwCIBY+eh8+rfx
         gDrTspojTKizqtWSV/uxPZUA8FZM35sSyhl4GJNzBC+L2IBH5gsShlvr68nBjqWmo3P6
         i1BR81JYpX90UH8hxrmEVUVpB+f50be0ag/0IaMj+P9DiVtdjb22VVshaFxxl8YCF8C7
         Bn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782363203; x=1782968003;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0tA1o79GF2y+eTYK/pnc5wl3lBb1SmYdnnZxK1L8M8Y=;
        b=GIu61vFRcPoYEkt+UH7+0V+iXUaMkufeGihniDoQ/G/wo/1nqj6EotrfdHCmERK0EK
         6nSpQ9YH6XRB5GH2oV4tN5LzQB+NeIKgb1RV5cNytv/VRF3yEtvDFgNFhAvqUTb7IsoZ
         4b/frsYjVf2dKp64LQPYCVR80NhYzng6lEUB2Rz7eqN5qWIvCqN5V3vbp5tZV1ME+22W
         z1H0VCiD3hm5t+4nf0GCkiJaL0wTOkJnBB06r3Gg4qPIds0atPv5buHNhOen4z7gz7eV
         o7R37aDRNocGesKkbj1lS9FaJRU1F2NOhtHDd2eMZXnc+B3V9I3Jg6kjTb7hi8Ah8kgx
         dtKA==
X-Forwarded-Encrypted: i=1; AHgh+RqvIU+I6PwUXBcRlcocgezDPhKWSaVZpjECSVPOFFMrnhM/Mdpkrp8hFmv4WXJgKtO5LYbvxd/nVhjwTLv/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7P0MiIqrhpi9Koe60FRn72blVxjMpisKREmokOtKwX3fx48fg
	1RnUHn0tD/0VES0w5+kvCpMYWzjGwMhRuBMlNJ5IxXn/jNTU5a10/swU
X-Gm-Gg: AfdE7cmwT9o7YBmwzJMKMpo7Z/axOTNcfNFOcK49Ukj9W1qSyakGpEOBRni40BdKdQo
	EXLeI6843cB/aBb7Ao2LFjl6raaJi1mcIQhkvxVnzucWzRwnVqeKi1LpmoEv2GEJOYw7RXafOu9
	EGwg7TT37pQ6gghwhU/6qHEGAd8A4VL6wWNAL60tzjyWmAGgzrkZeKQHHiIqI8boOu45XwYPro/
	TFse24HD30GCIRlB9fw4nKB1YJBYssQyHjVxF5ZbL/bazOAdg6zzVvB6FKWzJsego5vDP+70K4A
	xmdOcwEvID05cptHL6edVVU41DuChBIvQxZFH4/Y6PTuwLgT7CdPeZ+G9EqalZ09ApTYG8X/njP
	vrDKA4gttDDa2OU0eG5vu9yVrJbNC6KfACakZ3oEGEPhWA6PerxObDz4Rl9cotxyyT/u1SflBQv
	ZvgHBt9oHLxurtSCYhrfvlWgaBlCXUsw+pa3RmGSCUWvF/5w8/3jLLug==
X-Received: by 2002:a05:7301:e04:b0:2ed:e15:c923 with SMTP id 5a478bee46e88-30c84e974dcmr1116849eec.31.1782363202622;
        Wed, 24 Jun 2026 21:53:22 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:c782:a4ca:fcbd:6ba7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c9dafsm5191149eec.1.2026.06.24.21.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 21:53:21 -0700 (PDT)
Date: Wed, 24 Jun 2026 21:53:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Vincent Huang <vincent.huang@tw.synaptics.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-oneplus: Update
 compatible to include model
Message-ID: <ajxakXFuKAkhdZLN@google.com>
References: <20260523-synaptics-rmi4-dt-v2-0-0645122babdc@ixit.cz>
 <20260523-synaptics-rmi4-dt-v2-2-0645122babdc@ixit.cz>
 <ahdoBl3qCTyvlYJf@google.com>
 <1d0e7e31-f808-4347-955a-7246dea208f5@ixit.cz>
 <742c7a13-9465-40e8-8990-e679712e9784@ixit.cz>
 <ajtaUb4YmyZTDLmQ@google.com>
 <52b7dd3a-3f6f-474c-8386-4fc2776b185b@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52b7dd3a-3f6f-474c-8386-4fc2776b185b@ixit.cz>
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
	TAGGED_FROM(0.00)[bounces-114441-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:krzk+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:Jason@zx2c4.com,m:matthias.schiffer@ew.tq-group.com,m:vincent.huang@tw.synaptics.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E96236C2B1F

On Wed, Jun 24, 2026 at 04:37:25PM +0200, David Heidelberg wrote:
> On 24/06/2026 06:28, Dmitry Torokhov wrote:
> > Hi David,
> > 
> > On Sun, Jun 21, 2026 at 07:11:45PM +0200, David Heidelberg wrote:
> > > On 28/05/2026 00:13, David Heidelberg wrote:
> > > > On 27/05/2026 23:56, Dmitry Torokhov wrote:
> > > > > Hi David,
> > > > > 
> > > > > On Sat, May 23, 2026 at 11:45:35AM +0200, David Heidelberg via B4 Relay wrote:
> > > > > > From: David Heidelberg <david@ixit.cz>
> > > > > > 
> > > > > > We know the driver is reporting s3706b, introduce the compatible so we
> > > > > > can more easily introduce quirks for weird touchscreen replacements in
> > > > > > followup series.
> > > > > > 
> > > > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > > > > ---
> > > > > >    arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 +-
> > > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > > > > b/arch/ arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > > > > index 6b7378cf4d493..148164d456a5a 100644
> > > > > > --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > > > > @@ -475,17 +475,17 @@ bq27441_fg: bq27441-battery@55 {
> > > > > >        };
> > > > > >    };
> > > > > >    &i2c12 {
> > > > > >        status = "okay";
> > > > > >        clock-frequency = <400000>;
> > > > > >        synaptics-rmi4-i2c@20 {
> > > > > > -        compatible = "syna,rmi4-i2c";
> > > > > > +        compatible = "syna,rmi4-s3706b", "syna,rmi4-i2c";
> > > > > 
> > > > > So I believe we established that this device (s3706b) does not in fact
> > > > > implement rmi4 protocol properly. Why do we have "syna,rmi4-i2c" as a
> > > > > fallback? Shouldn't it be just "syna,rmi4-s3706b"?
> > > > 
> > > > The vendor supplies s3706b which does implement the RMI4 properly.
> > > > 
> > > > The 3rd party replacement impersonating original parts may not implement
> > > > it properly, but I don't address this issue in this initial submission.
> > > > 
> > > > With this compatible we know which original part is used by the vendor
> > > > and installed in the phones, so later we can deduct specific sequences
> > > > for the replacement aftermarket parts to keep phone touchscreen working
> > > > same as they do on Android without affecting other devices.
> > > 
> > > Hello Dmitry.
> > > 
> > > May I ask what is currently preventing this series from moving forward?
> > > 
> > > The first version was posted in 2023 [1]. I picked it up again in 2025 [2]
> > > and am now on the 9th iteration (this patchset). At this point, the series
> > > has been under discussion for well over a year, with relatively little
> > > feedback and increasingly long gaps between review rounds.
> > > 
> > > The current approach is based on the guidance I have received so far,
> > > including suggestions from the device-tree maintainers. When concerns were
> > > raised, I tried to address them and rework the series accordingly.
> > > 
> > > What I am struggling with is understanding what specific issue still needs
> > > to be resolved before these patches can be accepted. If there are remaining
> > > requirements, objections to the approach, or technical concerns that I have
> > > not addressed, I would appreciate having them stated explicitly so I can
> > > work on them.
> > > 
> > > I also split out the straightforward, self-contained changes in the hope
> > > that at least those could progress independently while I continued working
> > > on any follow-up requirements. However, even those patches do not appear to
> > > be moving forward.
> > > 
> > > Could you please clarify what outcome you would like to see from this
> > > series, and what concrete changes would be required to get it accepted?
> > 
> > I am still confused about how you want to differentiate between the full
> > RMI4 support vs the OnePlus flavor. The "syna,rmi4-s3706b", as you
> > mentioned, implements RMI4 protocol properly, so we do not need to
> > actually have it documented neither in binding nor in DTS.
> 
> --- part 1 ---
> 
> This series addresses identification within device-tree. It's normal
> recommended practice.
> 
> If we know, the device ships specific, but **compliant** variant, we just
> put it as compatible = "more-specific", "less-specific"; in this case
> "syna,rmi4-s3706b", "syna,rmi4-i2c"
> 
> This approach is used everywhere. This has nothing to do with after-market parts.

We do this in many cases, sometimes when a part has different timings or
maybe additional functionality compared to the base model.

How does this new compatible for controller that fully implements RMI4
protocol help here? 

> 
> --- part 2 (irrelevant for this series) ---
> 
> > 
> > The issue you have with after-market parts that are not compliant and we
> > need to figure out how to deal with them. Inside the driver I
> 
> As was suggested by device-tree folks, this is the first step, there isn't
> better one available. If there is, please suggest one, and I'll apply it.

Was it clearly communicated to DT folks that the compatible you are
adding is fully compatible with the base "syna,rmi4-i2c" but other ones
will not be compatible?

> 
> > essentially need a"incomplete protocol" flag that we can use to
> > implement additional checks or skip known to be not implemented
> > functions/queries. In DT we could introduce something like
> > "oneplus,rmi4-i2c" that is decidedly not compatible with "syna,rmi4-i2c"
> > and neither one should be a fallback for the other.
> > 
> > This of course needs buy-in from DT maintainers.
> 
> As you can see, this still holds Acked-by and Reviewed-by from the relevant
> people - Krzysztof and Konrad.

I see that but the commit does not explain how exactly you are planning
to deal with knockoffs.

> 
> > 
> > Does this make sense?
> 
> For the scope we're discussing it doesn't seems so.
> 
> This discussion should be associated with the last revision of the full
> series I sent 3 months ago. We're in very unflattering state, where:
> 
>   2018 - these aftermarket touchscreen worked on Android well enough for
> people to have working touch (let's say with slightly worse experience then
> the original).
> 
>   2026 in the mainline, we cannot even more forward and report to user-space
> there is aftermarket non-compliant piece of hardware installed.
> 
> Actionable steps I suggest after this series lands:
> 
> 1. don't do any changes, but since we know what 3rd party touchscreen do
> incorrectly deviating from the standard, REPORT it to the userspace, so USER
> know, their device (phone/tablet) doesn't have original part.
> 
> 2. then figure out, IF we can reasonably well workaround it and HOW to do it
> 
> These two steps present some progress which could be discussed and could
> lead us somewhere, what do you think?

So since we know that these devices can come with controllers that do
not implement RMI4 fully, can we:

1. Establish a new compatible that is separate from syna,rmi4-i2c? As I
mentioned, it could be oneplus,rmi4-i2c or event a concrete controller
vendor,id combo. The point that it should be completely separate from
the current compatible and not use the current compatible as a fallback.

2. Make modifications to RMI4 implementation to handle these controllers
in a reasonable manner, but not mess up the full RMI4 support

3. Update DTS for the affected headsets to switch them to this new
implementation.2. Make modifications to RMI4 implementation to handle
these controllers in a reasonable manner, but not mess up the full RMI4
support

3. Update DTS for the affected headsets to switch them to this new
implementation.

Thanks.

-- 
Dmitry

