Return-Path: <linux-arm-msm+bounces-111042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8dBBGeJlIGrQ2gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 19:35:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A2F63A326
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 19:35:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=C0ykJXsu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111042-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111042-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 293A5304350F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 17:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9759B40B6DC;
	Wed,  3 Jun 2026 17:23:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0213DCD92
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 17:23:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780507422; cv=none; b=Y2zd6Z6lZiWf9VjbK84r3Vi7DIt0P6f0OgJyDCnXtNoxLOtHSONMp3s7vabaH02q1TX9XLaMyAHjopVlKClGF6dk2eRd+NWjL1Y7ddS6d2vz0J00vq1wfoyhC8RAuQAjSM7Htk7nka1hSQvXKiF1BVRhh+WDNjVdmdjRpIh3lrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780507422; c=relaxed/simple;
	bh=ZHGFNjdms5o72NHG5mqWdI+YKiAUtQqIG0qM2Nu/sBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVadXrKa8hc5ACY5ajrm6EBO1dx1db/J20cNE9GSVJAlELF9Tm64WUl7sjq0j/TNnSCHXogsQ+nu6+1gAPx5xJmO2yVJhDPCO4I3JeKnuEyOdlaLt0slP8IqTmU6uhqwA7k+aXOkdPD/qrROhGXiO7ZnbHaK4gY9LnRRPNjxgpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C0ykJXsu; arc=none smtp.client-ip=74.125.82.171
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304f0039c02so52073eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 10:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780507420; x=1781112220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SrzBV/CHeC4K43UCwv6a0kN1Tfy/GhWE6NmP1fIYMXI=;
        b=C0ykJXsu5pCDhL4JYW9V3w8b+ODbcDuvR1uaRaQ15dbWtStGSY2mczSaS9yDaW9ANS
         JP9QhtfQkVmMazvuBi6bsvEsVTXoRxnDYsUWq+rTxcfh4paNMa3tFVbZsEh0+PJf+tph
         eMdY0tgDWJmZr20KEVYJ9pxHb9/nXhj5VRgEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780507420; x=1781112220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SrzBV/CHeC4K43UCwv6a0kN1Tfy/GhWE6NmP1fIYMXI=;
        b=fLEndAX3MGGNiK5z04TaYy4kLG9kU4nl//IZ8TC3fRGVyCYECK3ct6cY9TeGUupUlb
         sLSHUF3A9vvVHIkAXu8bR4oznhw2GqBL711qpsAdKT3Dbyf4RBA/xyLoUP47MypNP8RH
         j/lNd/i6orytLIluXJfXoOBG3LnpAioWI9t63zuJfePB5wA/VfCrB2Zwi/p5DFf8rqXk
         pyuAFI2m020bAFPY3XqloJUtschPzGttvxazgqcgvn51g5U4E6y8jacL/K2/4EmvAesZ
         NMr9zM2Pmr2RvahH0dl7f7AVvaudTZZdqBABrfWXToiFUrkg7ly7oauaIawrPbdt6lxk
         UDUA==
X-Forwarded-Encrypted: i=1; AFNElJ/PYI1bNGmjhOwkLKrFWjteQEqY3+tHHicWOQ4e+JJ/BvK6141d6vTD5BOX1TngD05pLzaNsL/1P5rJ6vav@vger.kernel.org
X-Gm-Message-State: AOJu0YyUc/ETuYJOusRZMIssEnRDo139Xi8UNoMrMwLNnQglKGL9H/7u
	8C6z8BC2+9LeiX/OwwOHcioDFfHCduOw9EdaDxYuY2G3xoXCSuOeq0GM+75cDzwatw==
X-Gm-Gg: Acq92OFL2gOKJhgS5GbZUQO1Nsi2KuNebBLD9ELpLbS5lmfjFtnTCkrRsEyY1pW7wKS
	PQkn0NTMFZjvYO0LVq299hw7F4fkX9hXee7021gu6iVFGOnFtpvhcACoLU38bxT7/dRFTt+npUz
	Bn5ZtoH7sCoi+TUygCDqFlFVapbc0BQTihSGY82/iWIniDzZWQ2aoGt3xEQgt0DoDiC+WGlhrtP
	E4Eohb00/fGQ4clQGv3J7XpCzhTBXE3XIh9XmzfEj5815BCPh/2+9zqbj8vnop2laRF/KFALvKI
	TYnLLPGraxKaufjvJ99xKtS7opxT+o62RlQdkQdZAfm+3PWoPfS9J25cOUuw5Wa8RWaFQZJTVn3
	CsZRghZGvxqoQA0SZ0bg9qq1IALgZeNCRcEBco54D70Y/Hrg3qKhIUVdHnrO9nFXREwIeIc43Zv
	nUeY+539oiHFYUC5pLWz2CkM5rHnK7M2/mxFgyyIGYvlte48jXdPOZSj69iCHA6rBiijt+Tdqn
X-Received: by 2002:a05:7301:128b:b0:2ea:b7a9:580d with SMTP id 5a478bee46e88-3074fa80739mr2310951eec.9.1780507420313;
        Wed, 03 Jun 2026 10:23:40 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:c444:80f4:5ace:a65c])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3074d9fde90sm4323779eec.0.2026.06.03.10.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 10:23:39 -0700 (PDT)
Date: Wed, 3 Jun 2026 10:23:37 -0700
From: Brian Norris <briannorris@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	Julius Werner <jwerner@chromium.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to
 Chromium-based DTs
Message-ID: <aiBjGekXkr2nIf-w@google.com>
References: <20260428200712.2660635-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111042-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,collabora.com,kernel.org];
	FORGED_SENDER(0.00)[briannorris@chromium.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:andersson@kernel.org,m:devicetree@vger.kernel.org,m:dianders@chromium.org,m:linux-arm-kernel@lists.infradead.org,m:tzungbi@kernel.org,m:chrome-platform@lists.linux.dev,m:jwerner@chromium.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:wens@kernel.org,m:matthiasbgg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briannorris@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:from_mime,chromium.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9A2F63A326

(Trim address list)

Hi Bjorn, AngeloGioacchino,

On Tue, Apr 28, 2026 at 01:06:52PM -0700, Brian Norris wrote:
...
> The /firmware node has an empty 'ranges', but does not have
> address/size-cells.
> 
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
> 
> [    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22
> 
> This series adds appropriate #{address,size}-cells to the device trees
> used on Arm Chromebooks to work around the problem.
...

> Brian Norris (7):
>   arm64: dts: rockchip: Add #{address,size}-cells to Chromium-based
>     /firmware
>   ARM: dts: rockchip: Add #{address,size}-cells to Chromium-based
>     /firmware
>   ARM: dts: nvidia: Add #{address,size}-cells to Chromium-based
>     /firmware
>   ARM: dts: samsung: Add #{address,size}-cells to Chromium-based
>     /firmware
>   arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based
>     /firmware
>   arm64: dts: nvidia: Add #{address,size}-cells to Chromium-based
>     /firmware
>   arm64: dts: qcom: Add #{address,size}-cells to Chromium-based
>     /firmware

Patch 1 and 2 (Rockchip) and 3 and 6 (Nvidia) are applied to linux-next.
Patch 4 is obsolete / unnecessary. That leaves patch 5 (Mediatek) and 7
(Qualcomm).

Bjorn (Qualcomm) and AngeloGioacchino (Mediatek), any thoughts? I can
resend them separately if that helps somehow.

Regards,
Brian

