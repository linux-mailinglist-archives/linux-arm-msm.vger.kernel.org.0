Return-Path: <linux-arm-msm+bounces-105837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4wnpNdiQ+Wme9wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 08:40:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 209BC4C7462
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 08:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96BEA3012251
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 06:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F853AF664;
	Tue,  5 May 2026 06:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QYBWBLdT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544DF214813
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 06:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777963221; cv=none; b=KGfcYGbzIp/p3CbXNVQZKy+T5oGM9O6C3R/T8v34cXzoXc5zS7XUyY68TGbxDWAG7FghdQXpYSDzVRJ7su/98LX+p9e0PEulspAMcldr+7JIZtVKWWRTsWX4MZB0VJqdBRaMoFnIhc3I1oCMO9EE6zMs9Ru3+k/UvIBPsHNXDhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777963221; c=relaxed/simple;
	bh=Oisny6SnkrUNZeLcjZJ1jSrF2FlNzVUV1uHu+sxvunw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=deLRkYKYJQDP32EBWkwZEDTZZaOgzcdBEFXu98mSOUtiYf6dU61SXMckI2hHxNXERaen3UkBACyz7eJwsASbNvuJhgEY89qDrj+Q7p6eHjQ/K79nWl3aNQM/0F3HlmMF2VwQ+vypfGKa9MquKHVnxVOuWwwHECR3gqPLKPapxsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QYBWBLdT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-449de065cb3so2446409f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 23:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777963219; x=1778568019; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6FO20EYGAs2fwB6e1zerXDAb7NyQnTU9vNFbNdbR+I=;
        b=QYBWBLdTfedPzOyEpb+4TsW561mAJnZ5UzZ5i4FuxC6CgwddN3Qmx0ot+cQEw1R4Qo
         8k9VeoQz6CPIGqwwzGwk7fMrNzANKz0Plffrx/np+Wkq7xXFCVIPhX9SC+WrflrhHgog
         hjyz6D/i4loWZn02h3APfjl7nQ69lchXmP5XAwAiwbLQBZQpOCXvEkh8+zU+mYmx8Nhf
         d5MA4fbgUTkyhbpgLQUDgOnb0LzBacDGVTBmTMbSyo5qhBHhhpR9rs/06YgXOiM3s4ZE
         c4GuKHzp1RGacN9/c7ryfyd9jVreRFqnK8pSRB7Y3wtxoE07my5gqi6k59nYP9T8hdMr
         mv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777963219; x=1778568019;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W6FO20EYGAs2fwB6e1zerXDAb7NyQnTU9vNFbNdbR+I=;
        b=bMvcUgLFoKFWIZor+ukyjgaBeXy/NjDEnHjqHlsm32/xGb/fCr2v0xWzFakJogoNpe
         uwio5grUPWLNgqDZE78PxbTyjdId4DowE2MwL9gN8JCx0GDgoSzBeM2FPVjCHlCD5GjL
         dxZNsSuB65YoRdZiVSJ8Api2qDXEGX1uVpf9e59A0AOr1uYXHrgPH7Z7YxYLCg1bP3iF
         JFcTeqb85CRFC9ywuRy/k8sUrbUNbJ4y2Ptn4Jh18G3zYJUZ8SGvLWPcpO9wHt31V2KG
         26Soe7vRSFfACpe4VkqZpSAEtYeZs68QxxiRTjYTcXf8GdmHATwdF94JfNRDGLkanJiO
         B6Uw==
X-Forwarded-Encrypted: i=1; AFNElJ+XrREoGobrhyLoSpz9Lo0yYtJV57FRvy11XX2omsgL2eYfZrFORt4V5ZCrxQJOau2A3elc4iqaFjC6fXUz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/hZe3DbojT8i1r8HeOFikajjlv+Oo+RB1dJ7zTRkvS0xfuvqy
	BfYdiF1qZrtK3y3D0UXMCOi5fl9YKIJqejWP8HjSQapdaA4cwCid6oG1myCwYf8Q8DE=
X-Gm-Gg: AeBDietw0lnshtHvf2vrgaPDX5c+VGGLbRV3rh/vID/LNIZi4dL8TdFmxmPrL3w4Lj9
	ntYQMh6bC0P1OzGFE71uz0JTPpAPLH29diGA4J+9DRQTzHVQtLmF5F9kW6R3g9QrvOlBHBAkhi3
	E+YD07zOHWvEE8vk2REZwe9m/iwSeOizXnGbbVY2CxDS4rR9fFeHkITfhaxL9G8Cs7uQqBGC2oJ
	tYU0ipuSymD0NFvDKCoqLYIpsQ0FpbJuAC0+A75U+GEr6QcWX+Ke18oI51HRUH7lVhe/qXa7qBj
	D83O2WMVzaZGi/GOFf3cktZaWaradkdb14HM1xW2KqthREDW2E99iDRprQpNc8gzGz9FsdPxFjw
	qYdwwuyXG6MyLtTUZZM/1tWB1Nd3EixFnPDRBjdvCTq/m7Nqjo/zKzJdR7E4DXK+3kdwMIz0hW2
	b1FLeEWuAZZfoouSVF7zruneZHpfEfI/+E8fNd8jM=
X-Received: by 2002:a05:6000:2001:b0:441:377f:82a7 with SMTP id ffacd0b85a97d-44bb6d95a09mr22079695f8f.32.1777963218742;
        Mon, 04 May 2026 23:40:18 -0700 (PDT)
Received: from localhost ([213.208.155.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm2083055f8f.32.2026.05.04.23.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 23:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 08:40:09 +0200
Message-Id: <DIAJCURQ37FA.1CNEKX6QM6ZO8@fairphone.com>
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
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Conor Dooley" <conor@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-1-e09cb05651cc@fairphone.com>
 <20260501-yogurt-wise-2a2884e3ec59@spud>
 <DI9XL1VYYTY7.19IRSM8VIDO53@fairphone.com>
 <a2444df4-abf1-4b56-8556-7efb238bc677@kernel.org>
In-Reply-To: <a2444df4-abf1-4b56-8556-7efb238bc677@kernel.org>
X-Rspamd-Queue-Id: 209BC4C7462
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105837-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.sr.ht,vger.kernel.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]

Hi Krzysztof,

On Mon May 4, 2026 at 10:45 PM CEST, Krzysztof Kozlowski wrote:
> On 04/05/2026 15:36, Luca Weiss wrote:
>> Hi Conor,
>>=20
>> On Fri May 1, 2026 at 5:51 PM CEST, Conor Dooley wrote:
>>> On Fri, May 01, 2026 at 03:52:45PM +0200, Luca Weiss wrote:
>>>> Novatek NT37705 is a display driver IC used to drive AMOLED DSI panels=
.
>>>>
>>>> Describe it and the panel in the Fairphone (Gen. 6) (BJ631JHM-T71-D900
>>>> from BOE) using it.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  .../bindings/display/panel/novatek,nt37705.yaml    | 72 +++++++++++++=
+++++++++
>>>>  1 file changed, 72 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,n=
t37705.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt377=
05.yaml
>>>> new file mode 100644
>>>> index 000000000000..1c796599f6fc
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.=
yaml
>>>> @@ -0,0 +1,72 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/display/panel/novatek,nt37705.yaml=
#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Novatek NT37705-based DSI display panels
>>>> +
>>>> +maintainers:
>>>> +  - Luca Weiss <luca.weiss@fairphone.com>
>>>> +
>>>> +description:
>>>> +  The Novatek NT37705 is a generic DSI Panel IC used to control AMOLE=
D panels.
>>>> +
>>>> +allOf:
>>>> +  - $ref: panel-common.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    contains:
>>>> +      const: boe,bj631jhm-t71-d900
>>>
>>> Compatible doesn't match the filename, nor does the commit message matc=
h
>>> what you've got here. Sounds like you're missing a fallback to
>>> $filename.
>>=20
>> The last times I was upstreaming panel drivers (Feb 2024 and June 2025),
>> this was the requested way of doing things.
>
> So this was requested that time and is requested now. What is here
> uncertain?
>
>>=20
>> Compatible being the company and model number making the actual panel
>> assembly (driver IC + touchscreen + glass etc), while the rest being
>> named after the driver IC manufacturer & number.
>
> So exactly what was asked for...

I don't quite understand what is asked for now, that's my issue.

1. Change the filename to boe,bj631jhm-t71-d900.yaml and leave the rest
   as-is.

2. Add a fallback compatible for novatek,nt37705. IIRC last time it was
   argued that a "generic" nt37705 driver will never be correct for a
   specific panel since it's missing a bunch of panel-specific init. So
   that's why there should not be a fallback to nt37705.

Either way, it's different to what I was working on with the two
examples I gave. Please help to clarify.

Regards
Luca

>> As seen in
>> * himax,hx83112b + djn,98-03057-6598b-i (Fairphone 3)
>> * himax,hx83112a + djn,9a-3r063-1102b (Fairphone 4)
>>=20
>> Fairphone 5 panel (raydium,rm692e5) was upstreamed earlier and follows
>> different naming.

