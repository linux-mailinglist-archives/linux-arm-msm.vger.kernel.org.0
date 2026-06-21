Return-Path: <linux-arm-msm+bounces-113911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K1TNG8VhOGoJbwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 00:12:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C95E26ABB74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 00:12:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=dEmhp7Im;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113911-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113911-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E2E3302453B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 22:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B3337475E;
	Sun, 21 Jun 2026 22:12:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45298372046
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 22:12:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782079935; cv=none; b=EoyFFEPP1ywUTOCAZI37UIryhw0ih7Fvlq43yuaHqj/c0zZci2QdkyThewtsYBxDcTUXs9cqYILy7ceOL3cxBLFgeeLGsoM+SsNqgk+bGfJ4qOYD5hMKa/QS/tHsYUrTU2IzT9cOS2ysfzJJBooJdxuBtxn1gyAr10IJAHgtsIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782079935; c=relaxed/simple;
	bh=pRqEZo/jVAgqejstxN/UwBgCjSpApW9UxkJ0EoPl6Yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKQICAhdFXEUJ9pt/i114w3F9HDN20W8xMk4hPQ4LCmx5Biss3N38cnHo5r3V9wyC6VLOIDpaJPguTjEOjSlWd43wAbhpWXOOPlxjmQI2xbMfwrjghqZrT1yZDN3AyUIn0JjigkUqbzZCT8jQgu2yaw6TSfjBx2MTZlpKEJqxaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dEmhp7Im; arc=none smtp.client-ip=209.85.217.46
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-72686746814so2193553137.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 15:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782079933; x=1782684733; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRqEZo/jVAgqejstxN/UwBgCjSpApW9UxkJ0EoPl6Yw=;
        b=dEmhp7ImfilT45/1oXAZwYfSkTI+GaWxZALp7yyCWysiAyHHvmKglfHYHRAitexYDD
         TshbhZ+V3IY36te28QSh//myB0lE3jZ7zaIfVj4816n5G7b2o4kRJqBCf/ZIVjp5BuUr
         oY+rrNixeXeSzZUCLzvRXEKxET9LCkk/bW/f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782079933; x=1782684733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pRqEZo/jVAgqejstxN/UwBgCjSpApW9UxkJ0EoPl6Yw=;
        b=Qt3EwULxiIlAqtr3yeUAh5REyDokwUlsXvYvbQ82QUTR6KxV3i3/2tdaijnr/0jta8
         6hzPxkJkU3+PrB1qvIu/Vp7qDfDqpT5xpVqnmsEBTTa/jNMtgpLTbXAIRGxGGfO0M4qI
         wSmy27FOMAiGSDkPlUxP+z75n2l9JcdFZqIz7h+rs1Jl1W4meiPYaTp8dYnVNM/dpqlG
         hEF7Lk4tKk7uQTnjFw1ZrzcfaUzVSqr796CuInOeKyU/+pXoxLhlyZQGvDcXzCtIiUC3
         QZ9JTgYxHJ0r7Qw4B7O4qtlIveft8RB/MW2gpdlRRBhm0FkCks0qFqyqvwNiGJL3ewTO
         +Yeg==
X-Forwarded-Encrypted: i=1; AFNElJ9q2gukzGdzHCC4/i1t+DAA38kYB/hC++WdFXySVGC80wZo/OW0OGVAsqa8k3W2N/NTAeTVQBEptKCwXfFY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvg7eLtkDJrFyebyoUEXWilBj4W14uG0Jq+80IfFveKdnJJ5MY
	sdWx/VZZX2ZsZQsLmpPJ/B3hatfmMjx8zgL0TEvpiOztpOAQRzt0VaRaovXQWvREl0CBf4Nhgr9
	JOPk=
X-Gm-Gg: AfdE7ckp5VuCmlouH1BinJVYAG6t6yQXYED6CClbB9aIQ6UwotOfCCUz3S6nnhEUAYK
	8l5xKCWXRRbGdafXhOrdBGVZxn/u6BReoAmsgzZJA0ZGJB/DyBrM0xZyYOwwuVuNe9mBPi28JI5
	2PC9WUd77oFNiDOrLW3GIY5LnAz8hUSZhqDY653AXvzNlmnJgxahxv6RKRFEtUpPRJl13zpgvJs
	7Y5YPPaeCDdsQ6ocXYoNpXsB1FHjciSMoDokhF5N+sWEm/sGCR9DPvlb5LTwjlKxQdb7lOJz8RN
	x0UmmEon37jVR+YkrG/ZNigP5JpzmbXARnAIdjgWOTR0pOSlXPD1rW0e/wAF5mZ5gYIxjdJxLy1
	XEVubrOYzYo8AyKQXfwT6WbnncHMLWOiV2wTEvNnbBAakx3njCwCKCMZnrc+B6mvdOeVrlatZah
	bb/s/M5qAGA+9nje3UTXk2STxMPR3ym0cV2Mspo9YpeycS9OcMs9xnbxdnRRwlKA==
X-Received: by 2002:a05:6102:b14:b0:6d8:f538:f01e with SMTP id ada2fe7eead31-72a1fbf95f2mr6751446137.24.1782079933237;
        Sun, 21 Jun 2026 15:12:13 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba543e440sm4751049137.10.2026.06.21.15.12.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 15:12:11 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6c3154fa47fso3178619137.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 15:12:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9LhfdDu+z2Swikz4VG0+PVJ5X/m20WdPIDp4HlxttxIb+8pszDakc2Nk+eAmnieMow0WIlDxvF/vUwEWP1@vger.kernel.org
X-Received: by 2002:a05:6102:3710:b0:6f0:3999:b378 with SMTP id
 ada2fe7eead31-72a1f0bbe0fmr6441389137.13.1782079929560; Sun, 21 Jun 2026
 15:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <ag_QL5DIo7MxsdYU@baldur> <84ed2c32-16d0-4c29-a06a-9242eeb8e86e@oss.qualcomm.com>
In-Reply-To: <84ed2c32-16d0-4c29-a06a-9242eeb8e86e@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 21 Jun 2026 15:11:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQH3kng7MV=Jr=HmZQc4TEUCq+V3TsLNChr5vUHUtXAg@mail.gmail.com>
X-Gm-Features: AVVi8CdsJ9dr4hnltaNTYTTF0jzeSz-qJJrPJ-GY5G_cdzHr7Jfp7FT56KvCLXo
Message-ID: <CAD=FV=XQH3kng7MV=Jr=HmZQc4TEUCq+V3TsLNChr5vUHUtXAg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: kodiak: Enable 4-lane DP via QMP
 Combo PHY
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mahadevan P <mahadevan.p@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mahadevan P <mahap@qti.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113911-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mahadevan.p@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mahap@qti.qualcomm.com,m:sboyd@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C95E26ABB74

Hi,

On Fri, Jun 19, 2026 at 8:34=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/22/26 5:41 AM, Bjorn Andersson wrote:
> > On Wed, Apr 29, 2026 at 12:10:39PM +0530, Mahadevan P wrote:
> >> This series enables full 4-lane DisplayPort operation on SC7280/kodiak
> >> platforms by wiring up the QMP Combo PHY correctly and consolidating
> >> the DP endpoint configuration in the SoC dtsi.
> >>
> >> Patch 1 adds mode-switch to the QMP Combo PHY node in kodiak.dtsi,
> >> which is required for the PHY to respond to USB-C Alternate Mode
> >> negotiation and switch into 4-lane DP configuration.
> >>
> >> Patch 2 moves the data-lanes property from individual board files into
> >> kodiak.dtsi since the PHY-to-controller wiring is fixed in silicon.
> >> It also removes redundant remote-endpoint and orientation-switch
> >> overrides from qcs6490-rb3gen2 and qcs6490-thundercomm-rubikpi3 that
> >> are already covered by the SoC dtsi.
> >>
> >> Patch 3 updates data-lanes from <0 1> to <0 1 2 3> in kodiak.dtsi now
> >> that mode-switch is in place, enabling the full 4-lane DP link.
> >
> > Are you sure that herobrine has 4 lanes routed on the PCB?
>
> +Doug any chance you still have schematics for that old boy?
>
> Bjorn, perhaps we could switch to a model where we define the max
> capabilities (i.e. 4-lane 8.1 GHz link) in the SoC DTs and only limit
> them as necessary? Not meeting these is borderline a board defect anyway

Bleh, I'd forgotten what a pain it was to look at herobrine schematics
with the whole qcard "abstraction".

My memory and a quick glance at schematics makes me say that herobrine
only has 2 lanes of DP. The problem is that this SoC really wasn't
designed with a laptop in mind. I seem to remember there only being
one USB 3 port and it is muxed with two of the DP lanes (since the SoC
is designed to drive a single Type-C port). In order to support all of
the ports that a laptop should have, you pretty much need to feed that
one USB 3 port into a USB hub and hardcode the DP to always use two
lanes.

The two DP lanes then go to a mux where they can be routed either
towards the left Type C port or the right Type C port.

In terms of whether we can support the 8.1 GHz link speed, I remember
much debate during the project, but I don't recall all the details. I
think the discussion was that we were supposed to support the higher
speeds, but we had to disable them because they weren't working. From
my fuzzy memory, it was unclear whether the problem was known to be
hardware or software related. I can try to dig deeper if it's
relevant.

-Doug

