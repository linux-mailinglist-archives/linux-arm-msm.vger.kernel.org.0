Return-Path: <linux-arm-msm+bounces-99344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BOIANZ5wWkQTQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:35:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3542FA093
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA9BE3539FC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38733BD24A;
	Mon, 23 Mar 2026 16:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQ0RPdAc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAC13BD636
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281830; cv=pass; b=MoFfEEK5W93mITYXC3vqDyL3dg7Jon8FiB/rFb/duHCoO/B3phOPzpMSPC7nF85pC3I5m5ifGYP5ZGMeaYTNfUvTMyE7SKYROklzz2S4DvMtZnII/dk6Sycw51Rv3BGUwCEsZ2pfiu5EPstLP8J/UJrtQFOAu6PQFUIHDNzGJQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281830; c=relaxed/simple;
	bh=7irbY+9rOd+NW/fVb9Tr8rkZ1zlhu5ctJUZovL+hxRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKYg7Tgb3Gh3mskL833szvB2cpkn3mfGIb8H0tW4Ov89xKZ+IAM2jvjZximoX3rjFHl1gTTblO9JhzvnCTJzXDPvAzAjItqujso1bEUEjeCIQ+bw/yMKPU6VpbY9bo1BJX/GnNKGNJWachFQsP42FMb9bma91ex53f3dzE4+rxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQ0RPdAc; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a27a90a7b6so343618e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774281827; cv=none;
        d=google.com; s=arc-20240605;
        b=BiAKUnVg2GdLRuFqpF6OOEVvWua2QYQKCBLEIAsio5VsqpiKaZ3Og89LgxKthLa394
         NdiyhRHaC876hbQ40j9S5TzxcCE/S+/dFCZZHg7kZfHkqwtU76Lm5zRFnZML10I1UJxD
         9H0EKlTTFY3iHFo635YaSlAIRGDQ3zxVDnVKtQr4aNnYIOUlvUGZEoIbQM0rqOP21eNC
         Uk9Hbpt1dC0xnSPGdAsOcpazeLE0zj4qLWpoBFZCs7Cl26DwU1ifO113vvSnnKQv2J1r
         QPvtmHfpzy+Ierd+tz/t3X9vdY6tc2xjJxR5HnQmWYvgPyQ/AsC+kyG7iywGaEWULkV6
         jjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M9trgAufF2igj2vmokDZA9CQWTVpioAWY1V9rx3C8FU=;
        fh=J32qCiJoelqVdoynxCPjU9nfl73x4F5S2Q9zoEIrtnA=;
        b=hutJCVwngE9MrSUMyN4m3ZRgoDdPyygqQVItfJgCVswQ90i8S+aaQ021QSWxxzRxY5
         g67iA3fiSq1FyPmLehKkLH6jUat2b4UPsZoIrQsFRqbB0oCifP3RVZ9Jtuglc72GZQy3
         0pxFCAF/hiIcdzuwsg4F+JZsHegrQP1A9PkJAwnmIYIJCsHlzI20sD1aDSu6HyJXVogx
         M5ra/JWsuOny5ixgsMaEI6fB+tW5qP86DBUnUhMlKIOK7eTnvah/PCb9M1VZr2W0B9mq
         eUfkRehpzYQIS9aiDACZmwPFhNUrPofJe/fCHO/LxsWX4S1gTuDBzYYoZSTCXFBLM7pP
         JK+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774281827; x=1774886627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9trgAufF2igj2vmokDZA9CQWTVpioAWY1V9rx3C8FU=;
        b=dQ0RPdAc4HqNpJRB3XynuNYWgoZeu0Ap14wRj5yu4dwVgF7R9aX4ua29+6lkLc8q4N
         S77vD9WO3qBDEj5xL48frva8HFePhuCPCyLE4DnSMR6WE3X9YIPRxqyQescuCqIl/U4H
         VmR1m05fYUCdkP9NRvujM4NKQ3gwkNMeJElFrtzkUBTlbXMcwYF4odew5j8E8hdma2WL
         celEbxT1bvfOboy34GuqwFkNss/LJnYh8i9gNBS3VgNpiMKg/7El8bzDPEnMwJiFEkU4
         m3rtb+x7reV1GG2d4FJPBbCfO1mzROLQfiS/y9iUSvKQR4ufvreM79JF+Xy4F7XQeyFb
         USOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774281827; x=1774886627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M9trgAufF2igj2vmokDZA9CQWTVpioAWY1V9rx3C8FU=;
        b=S4+g4wlKfvz259e8flrWuhK/K+drNb2lj0ZNXvYvLACHvrb/JrZLJ90/XQYJLxKwkM
         mZzQgIAY6NpCU7ij55crG7uhAQNymsCZUD3lM5FHREGjuMcD9fFH9vmPLczjRVSvEbZ9
         RnK9fEANIv8QeZEe7xQo2mf6HsYEeIblAe6G+yLl9sauj+Pq8Ee7scw6+/qxyIiQ/gGv
         gv7D8pz+tu0eVFif0zq/4lvszBGMW9ACGEvMsvKEJ5qk2ahg6hMaAbR6rWO/2nXZ6fco
         yXXOm05aZnplrWyH9uXiwBbyGIygubL1WqjKTXaoBq9+ZEwbowKUhht/iJ8Lks06Ne48
         18Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWiBseyGqgq0X5YYMCUId54A0Rxo2KOWc5tVwxsOAXSENi2F+sJpx7kLfF5tKP7l9tLfiU3H/W4xGm2Q6aM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw704tIdTPJ8FEgVdoI7vx8m32fBlXsigJ+uHUSYz1AbWLm5OH4
	ef2O0olrJ/jrY5guMN5T1yAFFFENsUJ07CygtaibNVO65s0fYAjizhqJQMk5lIQky43DuR1DDuv
	ephJQYJwB/Ghqk7pA+KXVp0+zaYq98u6TPw==
X-Gm-Gg: ATEYQzyJz6gB6f1zaj9chHOXyXRYbJkIOFgFVG/2i9eLJ4RzgqhZonMp+BScNEzw1Es
	nfxllLte5uczHq7wIodpKKW2pFYxb/Umgmj4S5d5tR8ApeZ4YfTKOAFsVR8nnxsCYylAc8xCgBd
	iUbfkwAcuPG/pOH2YpurRAB/GEj5Vv8x3OkRSW5Gq1XQo5Pmlf/Cpwmd7+5GZpWNgL7mfxYmf4l
	Rh+7oc+1rvBx6SHkKF1jEhXL7ZsV5k4e6zEIHoTDr2gWEVV0siw8bKRROX/FFra2b76LNu2Lpgd
	M2TXG5BBA1EnssJUo57arusgoypHaFMrR1UPCO8c7hHQmAJprOlwzB0DzcjsX2BVlrWQ
X-Received: by 2002:a05:6512:6181:b0:5a2:889e:b20a with SMTP id
 2adb3069b0e04-5a2889eb350mr4104674e87.44.1774281826562; Mon, 23 Mar 2026
 09:03:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322-ayn-qcs8550-v3-0-4afa89c20888@gmail.com>
 <20260322-ayn-qcs8550-v3-1-4afa89c20888@gmail.com> <20260323-laughing-pumpkin-oarfish-99fafb@quoll>
 <CALHNRZ_2tUuiBBuH-QGi8VQbZSVhQg2KGd-dQVJMq+HKiGwpmg@mail.gmail.com>
 <2228bad7-b356-4274-a7b9-9065c9e35e9d@kernel.org> <70adc767-cf01-4498-b758-f221f0c81f11@kernel.org>
In-Reply-To: <70adc767-cf01-4498-b758-f221f0c81f11@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 23 Mar 2026 11:03:34 -0500
X-Gm-Features: AaiRm53L5Q4rOWiROqkyJg0La9E6e4uOYoPppMT9VXimIJsFCPa-A-du26CGdOk
Message-ID: <CALHNRZ8+sRm5VnBOtsOCp1t0Pih_tPYCZB1=wu4qBFSXdtGg1Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: arm: qcom: Add AYN QCS8550 Devices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-99344-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5A3542FA093
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 4:04=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/03/2026 10:00, Krzysztof Kozlowski wrote:
> > On 23/03/2026 09:39, Aaron Kling wrote:
> >> On Mon, Mar 23, 2026 at 2:51=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>>
> >>> On Sun, Mar 22, 2026 at 09:05:18PM -0500, Aaron Kling wrote:
> >>>> Namely:
> >>>> * Odin 2
> >>>> * Odin 2 Mini
> >>>> * Odin 2 Portal
> >>>> * Thor
> >>>>
> >>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>>> ---
> >>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
> >>>>  1 file changed, 9 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Docum=
entation/devicetree/bindings/arm/qcom.yaml
> >>>> index d054a8f5632d853509b7cd37f07f02473cf6bf71..ee68963c30eae10fd3b3=
a5e21bda63ab941893fa 100644
> >>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> @@ -1075,6 +1075,15 @@ properties:
> >>>>            - const: qcom,qcs8550
> >>>>            - const: qcom,sm8550
> >>>>
> >>>> +      - items:
> >>>> +          - enum:
> >>>> +              - ayntec,odin2
> >>>> +              - ayntec,odin2mini
> >>>> +              - ayntec,odin2portal
> >>>> +              - ayntec,thor
> >>>
> >>> I already commented on vendor prefix patch, that you incorrectly move=
d
> >>> it out from this set. This only stalls your patchsets, because none o=
f
> >>> the trees will have it thus none will pass any checks.
> >>
> >> You mean the checks that passed just fine on v2? This is documented in
> >> the cover letter, which apparently no one ever reads so I wonder why
> >> we even write them; and listed as a dep, which said checks pick up
> >> just fine.
> >
> > Checks will not be fine, imagine this scenario: Bjorn will pick up this
> > patchset and next will have failures, because there is no vendor prefix
> > documented in the next.
>
> There are also more subtle problems here.
>
> Because you included it as b4 deps, multiple maintainers might pull the
> same patchset if they are not careful and do not notice the pull of
> dependency. If that happens, you achieved nothing by decoupling it and
> it is the same as it was included in every patchset.
>
> I, for example, do not take patches with dependencies, so that would be
> a blocker, so again you achieved nothing. I don't know about Bjorn, thoug=
h.
>
> OTOH, since you have a b4 dep here and bot checks supposedly pass,
> maintainer might just pull this patchset (without dependency in cherry
> pick mode of b4) and not notice the failures.
>
> >
> >>
> >> As I have mentioned multiple times, the vendor patch is separate
> >
> > And as I answered to you already twice...
> >
> >> because I have multiple open series that depend on the vendor and
> >> there's no telling which one will be picked up first.
> >
> > ...no one will pick up vendor prefix thus your goal will not be
> > achieved. Nothing in vendor prefix patch explains how should take it to
> > solve it. People do not take random patches, so if you wanted Rob to
> > take it, you should have been explicit.

You told me on multiple tegra series to split things and list merge
dependencies in the cover letter. I have listed in this cover letter
that the vendor patch must be merged before anything from this series
is picked up. Why is this any different from what you kept telling me
before? Whichever binding patch gets cleared for merge first will
trigger the dependency of merging the vendor patch. And as long as a
message is generated on that patch that it has been picked up, other
series with that dependency would not cause a duplicate.

What would the alternative be? Say the vendor patch gets added to this
series. Then I would have a driver series that would have to list this
as a b4 dep for checks to continue to pass. Making a dt series that is
otherwise unrelated a requirement for that driver to be merged. That
seems even worse. Or much worse, I would be unable to submit such
drivers at all until this has been picked up.

Aaron

