Return-Path: <linux-arm-msm+bounces-105752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEuBAyOh+GlExQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:37:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E98E4BDF98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2BEB301E950
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 13:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587C83793D5;
	Mon,  4 May 2026 13:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vIdT+Ttd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C0A3D410E
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 13:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777901795; cv=none; b=Xc48rTXSf8s4xrglb/e1bAmroRdwQDDNpdTojUooqYQ+HrhZLQYLUunpTU1ycli/oq3GxT04/cw1/h+zWhMCdJf0084uvmJeFDM1Q1JMmBUqn80Gnqygz0grmwBiQSZEe1lmull/B7pTWUcL59BsBHMD2qQCCqSa/ENo1xoZnrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777901795; c=relaxed/simple;
	bh=VzGeyGQbSF70bdcGHoU4CptP9q5WGSOi8Lk1b8r4k/A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sCh7zQ0HSEoZ37Wj20tlOAyqwUl/qvXKiI/Tgve8Sx7dyVjy09o70jvNZgX972QjsFXRe/DEasMEL9/BUGi9vq0uIYnFMbWyX6h1VuGr/iQ8ULliOaZSU2XU5gIHqk8wY8mFnKvywhsyC4sNVvIujV4/569a5njTvhP7cFmmriw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vIdT+Ttd; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67b32c695efso6641139a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 06:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777901791; x=1778506591; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxl8aaXII9jrd89JJtrtzoxkaO727e2zu5aa5KJCGNY=;
        b=vIdT+Ttdt5EYlT8ppELuFyQ2sl/9vxh6NMwRBSGDTQvQMPN8YXCspgPbv9Zq0zCt/t
         fPOSaDFjhlM6R/PJd1V0vXGmflgdXOv4j7rJW+cCXdpm0mSvuq77mfsG6CDSy2QG/ixQ
         TVP7Z4lAKkdtzETLL7J2lQCZvrXj4gTzTMiz8sbQsbiIRjgIkVKiZAaPRO0HajWil65i
         +CAxpeqmB7mqv0fZOzNZMxcMPry85un+WwkkOyktEOz2hegL+6hRyYrB6Ju/FexfbI10
         2drf5HrQ6ccMfbMsj3nr/VmX5UAfD7pYm3nh1LT+5Q/QpdgA9XnkUQ/EqGBzj5rIif9l
         bkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777901791; x=1778506591;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zxl8aaXII9jrd89JJtrtzoxkaO727e2zu5aa5KJCGNY=;
        b=aFI0kwSkv7vSAI6JLxeX3xH/7nFAMQl3pL4OkMyF987QIbBtskeiO85ocsSbASRyaA
         YkEkvoSQ1pKvQ84covwUFW+EP9NPS09fbwUCVA5q6lHBIL5JXR9h1H7FHIBDkh+poq2q
         whvW1XVaRR6Rd3slLHLXOC33BjxcrdTQwE83i1HO73ja4/v/xsZDLqK80aWr/F9vGRkQ
         o+lHzQcydinUU1HZyb3YUyII7FccnDoT1ctEsP5XfM1CNpwodJWXWQYyAdzJ5QmMmfRf
         37Nykn6ZhA0S8mGJ1mAs98j5O1+FP+CVIFXjb6GNtSYaCpW3so38IAg0wXi8ZhvsQBgf
         UcEw==
X-Forwarded-Encrypted: i=1; AFNElJ+5oVTEGswUi/UAjmD+LsyQy46XFhxeiTPh+vXhw1moAUxmL8DY6BNPdqGv+MGQ38nSN55kBEH0RscbQdiC@vger.kernel.org
X-Gm-Message-State: AOJu0YxybgA3UDxL4qwJ4WqTgmFw2i8HoImtH60Wls2NEzkolqt87kQC
	jCO+gI+FPpcaHg29DFP3SceWIPBdFKAdFzIwPLL4SxMuEVcoj5tc20LwSSMMBA6tjp4=
X-Gm-Gg: AeBDieuaf41FUWc9jJTz3O3/OHj6fCgaGSEOydf84RnxAhgzjX+ncDwqaCo1K253pBh
	iJ/rxC0AvGWidQAJJltAre/sLxkVkrsa72EMFjV53CdHPiPjzn+r1wOMqU8dD3IdzvArd/wx05g
	p7aKXam4L9wDaS5Kn/kbrCxlSC/fHDLugTNs4167WI7osSPdGtBJEZVyEZAGWMFeoM0WqtQBJg1
	gw09x6AYViHsSkYJCHVVlwWNhAedBSFlhpipALJONOsuYrCZ2yz9/5O5C72VJSEZwUwVUdHRbni
	+4rByuGnA16jWLNBqiQHiUi8jW4NQe/nC1S1056tQbH4mT3IyqIJwIvFFOUj7EoVznUZSjf9O6E
	L+kpR1/Tr63cpxIvJvDDG3PHqnAEH85OY5lV3Jp+h1lS+w0msw7IdTKqC+aG8+Ay9Q0H6FVaqqb
	vC9UzrhMadGG8lgBmhxXorRDHygNk7DZ/XIgScQV3d2EGu18R5mjsY1unpD8Pa6aqkR0KPLKPxW
	LOZ0dA=
X-Received: by 2002:a17:907:1c9c:b0:bc3:5f51:7a3 with SMTP id a640c23a62f3a-bc35f5107f2mr72609466b.16.1777901790709;
        Mon, 04 May 2026 06:36:30 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1ad2d59fcsm151369766b.45.2026.05.04.06.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 15:36:27 +0200
Message-Id: <DI9XL1VYYTY7.19IRSM8VIDO53@fairphone.com>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: Add Novatek NT37705
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Conor Dooley" <conor@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-1-e09cb05651cc@fairphone.com>
 <20260501-yogurt-wise-2a2884e3ec59@spud>
In-Reply-To: <20260501-yogurt-wise-2a2884e3ec59@spud>
X-Rspamd-Queue-Id: 9E98E4BDF98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105752-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.sr.ht,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Conor,

On Fri May 1, 2026 at 5:51 PM CEST, Conor Dooley wrote:
> On Fri, May 01, 2026 at 03:52:45PM +0200, Luca Weiss wrote:
>> Novatek NT37705 is a display driver IC used to drive AMOLED DSI panels.
>>=20
>> Describe it and the panel in the Fairphone (Gen. 6) (BJ631JHM-T71-D900
>> from BOE) using it.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  .../bindings/display/panel/novatek,nt37705.yaml    | 72 +++++++++++++++=
+++++++
>>  1 file changed, 72 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt3=
7705.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37705=
.yaml
>> new file mode 100644
>> index 000000000000..1c796599f6fc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.ya=
ml
>> @@ -0,0 +1,72 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/novatek,nt37705.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Novatek NT37705-based DSI display panels
>> +
>> +maintainers:
>> +  - Luca Weiss <luca.weiss@fairphone.com>
>> +
>> +description:
>> +  The Novatek NT37705 is a generic DSI Panel IC used to control AMOLED =
panels.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    contains:
>> +      const: boe,bj631jhm-t71-d900
>
> Compatible doesn't match the filename, nor does the commit message match
> what you've got here. Sounds like you're missing a fallback to
> $filename.

The last times I was upstreaming panel drivers (Feb 2024 and June 2025),
this was the requested way of doing things.

Compatible being the company and model number making the actual panel
assembly (driver IC + touchscreen + glass etc), while the rest being
named after the driver IC manufacturer & number.

As seen in
* himax,hx83112b + djn,98-03057-6598b-i (Fairphone 3)
* himax,hx83112a + djn,9a-3r063-1102b (Fairphone 4)

Fairphone 5 panel (raydium,rm692e5) was upstreamed earlier and follows
different naming.

Has the way of doing things changed since then?

Regards
Luca

