Return-Path: <linux-arm-msm+bounces-105401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAN/M+qK82md4wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:01:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE334A6269
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69A9B300D454
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C7E3E314D;
	Thu, 30 Apr 2026 16:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4AoGdM7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94122E11C7
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777568306; cv=pass; b=HZsy72HCJSsIXqi1rBlqWbmrGLowyUCRFLEd5OThApPtiG2IH+lVBi+ONgwhQDsOx/GcqFUDfzY7PIftGct2qJslHnxxahlW8SIRIMTahPQcdqsQbn2Gyt/0+iviwqDWyhmO56VFA0Kt0nex05zuc9+hqxqsIwV76YyHl23bZ8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777568306; c=relaxed/simple;
	bh=nisUT47V1FVp0iHBXYyXaa3Y6j/WBUFvunEgUBCG2IA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VHfWhSi7jpM/GMcc45eqkyPWx4DM5kEKyNLpcpxAagvfrgm4TVTTqGBtJ3EFKfAJQBVDqyJ9qn+nF0A2lo9c5MD7KQMjcfaBZErHdF2pBK5chBebKPv8bpDgB1OzG4oEXoASi9vH/SgFWRGbxjHLrHhhmCmR+AyjAvNQC+mbtfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4AoGdM7; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a283c44478so1793313e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777568303; cv=none;
        d=google.com; s=arc-20240605;
        b=gTPj8z4sLTN7DYzPuamH2HmDSzwMyque9GURz69aNGPJWY+VYBOSvjGeLxb9I+CJe4
         fqbvSTW3uNOovGDNAinD4gzvsLMoTWwrni5mAUS7GHLWHti9exTNphtTd8+z+zRCFRnw
         BwlYJhIjb73alDC1Anke+jR/Ijt2/pIe14eJoATFG/U2uc5AsWZpjys29FxkwaQqEy/j
         YgAz9N1VYk6tNrK3QcOWbV7bia+McOw8Yp5Hv0zjs+fbp1RXotLRGhmcu4Dq0wG+TFqs
         a1o78Qc8FKKTf7ejt+oTBR0ksVPR9sXSIlYZ46FMH7pkUccc162PCXBT0s86Wr8FTDuQ
         nvAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nisUT47V1FVp0iHBXYyXaa3Y6j/WBUFvunEgUBCG2IA=;
        fh=ttxi0FGeUaq7B1RwLPUCn8NCEZEJGZFOS6zEOL25pt8=;
        b=lPeK4wEF+elj9g5bhOXICprEwB0wIYV9Yy3VU1GAdywuH7ZKmcwTAShC/18W1UDR6U
         Xqz006iT9cSbmm7Ggxn7cUGQD3mIVUK1nDOTUtWrds5auQ/6HazZFrHAn7EHiwRMolXd
         9kcrOL5Km/7gd3RoFZQWOoWbnCcNdZFD3QlQcv/rmZXgxzzKsg4Be/bA0F/d/NwiiuYo
         /zp6TpifEa0Z6SHf9zjMAeioCeLWgTMt2lvxPRNgb7wS56W4Qg96lTcMnLO1if2fHLj+
         UFz6qgK4xybTOmoTso6LvAHcIXv5gtJZSErp2CecZaqlQBVa321vQ2KPtTTEfx8sgERP
         xbqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777568303; x=1778173103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nisUT47V1FVp0iHBXYyXaa3Y6j/WBUFvunEgUBCG2IA=;
        b=e4AoGdM7picFSihMtmgwIU1q+jHZWWJdoskxyXtgXFrJJ6Bi0JuX6Tvx03trIlXejT
         pJCTBgWAQ7KObEDUGXMAGe2RJZJ7fTnYrOSyRoZK9ZtidItW1+bp8ApSOip8XwYj54p7
         /gkTM9esK3jp+gEgZAykeH37XeerAdH9WAUJ47wAkk9YJtWAfbogbd+/SOPkSXciyF5d
         Dj7nQ79bXWewxn1S34P8tEnKNv5YdkGtuXm7ala/63Tan6mk7yFAO757KbHURZNTs9MG
         aTRyM2EOrk3BsC695jLZGy+uXf8IJ7vMxsXyjr9Oe1ft2STZ3wFj7Q3pXrg0ZuMH1G3I
         W/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777568303; x=1778173103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nisUT47V1FVp0iHBXYyXaa3Y6j/WBUFvunEgUBCG2IA=;
        b=A0kQ5so5ofWxRYs7BsvHfBZheoxd8QZgA/CLTcyYlZ/AfTIqHcSr2ZQE9++mkQrYuD
         hwa78yXCNWTvT7JydJmRwtoVJa9xg9N5y8V6AA1DsRHaF2k5BMOIjXlhTXDFofofbaDn
         rF132iA9jh42jLcu3H2M3ahBGsPKtGegrTWHHBoZ7XlSf6SyYv19h1vT+zTbi1RXJdoW
         xAeY1M8dy2PXUdlaqqsE0wA6ncAmH9QRuCzORVHqzKMw3EdKLd0wrWO7w8HpYPtQmszr
         AIkdFAMwMD9NmjRGMo0sYJBh1VwwWvFGJ8OLRKrDapt/NpNsIloWZeTqQV/lJeyF5O0p
         PlvA==
X-Forwarded-Encrypted: i=1; AFNElJ+lt5M1QexF+pce35chcKKiTqtEZTqHLsc5UodtneiHFen5IlxQBMjLkIHkNRXZ8gdl4p5Gu95BADdkaTwr@vger.kernel.org
X-Gm-Message-State: AOJu0YzUmnVgi1Yui3qN6H2wuYETgJAOehVsNbfRJwuWon3QRTCsIlaf
	oQORjsW2pdN3tiyJus5/8AxD91B30/ATmOlRc1vPs4+zlNmeydhape/JnBA0SY6lTUlVymQACd3
	Xbd/aUu2oX4xBJGZgO0r7doeBJCWw/M8=
X-Gm-Gg: AeBDiet74ojORtCBpP+AHt1g0XRksRJbANcVmWGs7W509uDoTHvPAf5lU1L++my4Rav
	jUORvuU5iAoT79CFnnGGhdxTz1cuNBAkQp6gH1mwM4XG1BcY4IzwiZo+ka2IvEGUyliY+P+khLg
	RQ+DAQwDhwQ0uusWaE1v1KiWNKHhDOLPiZ+0W2qUM9z4n3GhCG8iEiqXyXM1wR31Wv7ifPut3Qz
	Jp1AGqbt5TK+tBTzS1uM5Ix73YKfQTSFKUDye9m54UWV+TBttAWbuZ27X7PaogEtiqqlIFCSifq
	Y4sExwdbsnpvL0cbnt63/urhT1MWpTDW2hO2b9043MAeQugk7cdBfVkel33MIuPHVb5f+Y/Zfgm
	BSSI=
X-Received: by 2002:a05:6512:308f:b0:5a7:42d6:529b with SMTP id
 2adb3069b0e04-5a8522dc224mr1428269e87.34.1777568302856; Thu, 30 Apr 2026
 09:58:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-ayn-qcs8550-v6-0-06a7e7b54aaa@gmail.com> <937db5d1-f5d4-4de4-879d-e6f4d51e9ff4@oss.qualcomm.com>
In-Reply-To: <937db5d1-f5d4-4de4-879d-e6f4d51e9ff4@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 30 Apr 2026 11:58:11 -0500
X-Gm-Features: AVHnY4JWkHZ20Y-U_RZaj-Yl5ComMNiIZbxrscpuaLfRBxPzEEQ62ta7CaIdPk0
Message-ID: <CALHNRZ9e7cbs2e9-4df42HqXtyk4Q16CFi-GEQUYcwvyp7Zysw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] arm64: dts: qcom: Support AYN QCS8550 Devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4BE334A6269
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105401-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,oss.qualcomm.com,sobir.in];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]

On Thu, Apr 30, 2026 at 11:38=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/30/26 6:03 PM, Aaron Kling via B4 Relay wrote:
> > This specifically includes:
> > * Odin 2 Mini
> > * Odin 2 Portal
> > * Thor
> >
> > The original Odin 2 dts is not currently included as it has not yet
> > been verified.
> >
> > The initial port was done by Teguh Sobirin for ROCKNIX and was made
> > available on the AYN github [0].
> >
> > Support has been removed for things not yet supported by the upstream
> > kernel, these will be added later when the related drivers are submitte=
d
> > and picked up. Such includes:
> >
> > * All panels
> > * The Odin 2 Mini backlight and touch
> > * All rgb leds
> > * The built-in uart gamepad
> >
> > [0] https://github.com/AYNTechnologies/linux/commits/sm8550/v6.17.5/
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Changes in v6:
> > - Fix comment style in patch 3
> > - Drop a pair of unnecessary pinmuxes in patch 3
>
> It seems like we've had a bit of a misunderstnading.. I was referencing
> the output-low property within some nodes specifically, not the whole
> nodes

Oh. Yep, I misunderstood. I will add back and send another revision.

Aaron

