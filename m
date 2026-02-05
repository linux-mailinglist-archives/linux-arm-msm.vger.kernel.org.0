Return-Path: <linux-arm-msm+bounces-91965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFYdJ0v+hGl47QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 21:32:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F31C6F72B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 21:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AACDA300AB3E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 20:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB22E3242A9;
	Thu,  5 Feb 2026 20:32:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F69301708
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 20:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770323528; cv=none; b=CWwLqDvHZdyfGqVJ9aux1FbqGhLyViG1mqjK6eOwKwKv5FNSFkDLBiL2wQuWIR6eirCRWgCx4MRW8upXzzzK0W9u0YfoePJdP6Djpr9nvtZcTYwbZ6En/13Qla6vYfdjOx4H3Go/Dlxzn+yTGbH3TZLjZ5J9rsNvfhRVciDW4Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770323528; c=relaxed/simple;
	bh=hHRM1hG5u64AI+78FHy2jBXvmx8Dnw4TMlLI/0c55EM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fOotT8cBIYd4/RgZnHwrgDDIeKs0kEeKppnhnoytT4sK/5AAb14w6/jJaX2/rTPqQlfvZ5kyT3rrBDDAVDoGFIgps6IWovw3nxNKbTyR0m07kBeybYt5llMoai8f3zUONJYzX6SwFhKUTUVcAqOWnyn3Zp594DVB8A550kERaZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78fc4425b6bso13890427b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 12:32:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770323527; x=1770928327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uw9NFSYymdF9cfh8JgFLbLxokKprMEjCgsdfjzfGOUA=;
        b=pPLnSL0MVRwjM2/GgxErvDALfoZ6ZCGQQP8FWOE1gxOje83ePBv5Fd28pPKezdNwmb
         Oz+s1f2LxDzIa8yE9L0Zm3d8Xp3iBPOhQfQvbTQ25kVH+pnGzzTLNDOC9dpLnPktTcu8
         d37l4u5/zjViYMKn2B6aI34omz+7xviIviKJM41pGqIakBhxM6uZKbN1JEH5T7kTL4EW
         j3EGfTNAGQwrobXuHI8qZg3H2trANahbio2409tGoQTdWJUOM5BusD4c5dmaE3XpNCYR
         GFiW4PYQzavecGARcjBNIEa9yAXF14ETnr13SFCN+HwfhGIH6r8A9XdWvycrfGKUzC9N
         tWFg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ3A14QhGVSfd/B+cTr94v4BQkAJMqBvKzMwYC5Qj1mIlV/0ykSHoF3PvxQ4pOo9gqnmhchliKhCDaYxhT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+OrbQ/33GojeWzxTtYqoGwjdftsoJcielheF8+DGD8mvz6tHw
	77IrGaRSivZuaHTBuaU1nAMj4RK9nVM6kejZLlNqInY4GVVO3gaAsog6U7VS2w==
X-Gm-Gg: AZuq6aK2zhheXaxpBBUeCm0ZErF0FAuuaEl6RwPbxeRiIiP3Qp9BREmBzFNvnTJ3TuP
	UO/0PDuJRSk8xkoaZ+8EDCt2ZBl0hxCf1Co25wRqQ6WUMMYSUSTUaDIf9aXfbcGps2DRBzc2h2y
	F1TUSF1vNuD4aly44UU4jGb6ycaZXtuF6uFDrQZrKZ/NOcgKg+XZuLDOXI5bhz+23ExLrAnXXxg
	cW4Xel3HXZuNbnunHfthHA5ZkG4nlJSxkR27KGuOhovfXAfhcEOdIOW/QoG4lgd/Fqa1I9Cu5E1
	o+7Tcw7CVbR79rr3QpcS+OUvcAAalheT9H+wcAiJ09MOWyBiRBZ+CV049HeDpWZkpCZgxwIQqGY
	jpWrgJjbz7EJ7RR+JvXbQWppruUpSFG3O9Tp6PTMygbkANwnC1HgP1l2RbfUVkfRq+ppTLg8pyn
	hVKMz7Afvq9UvhGI5qwH5j6CLgPG7qY6kM1/ZsUdedHg==
X-Received: by 2002:a05:690c:39c:b0:792:7c6e:35fa with SMTP id 00721157ae682-7952ab20eedmr4570377b3.37.1770323527649;
        Thu, 05 Feb 2026 12:32:07 -0800 (PST)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com. [74.125.224.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7952a234924sm4985747b3.39.2026.02.05.12.32.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 12:32:07 -0800 (PST)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64938fce805so1491345d50.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 12:32:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWM/xV86gnw/MHYQ16jh6nnN6naTFbYdoAYxD1TrePILzsNZ9ATAvc4wdm8G90oPA9LBJkx8Cmp2ez36tH@vger.kernel.org
X-Received: by 2002:a05:690e:4259:b0:649:d5ca:7988 with SMTP id
 956f58d0204a3-649f1f53982mr512491d50.48.1770323527220; Thu, 05 Feb 2026
 12:32:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-1-ba51ce8d2bd2@thundersoft.com> <20260205-winged-alligator-of-sorcery-aada21@quoll>
In-Reply-To: <20260205-winged-alligator-of-sorcery-aada21@quoll>
From: Roger Shimizu <rosh@debian.org>
Date: Thu, 5 Feb 2026 12:31:56 -0800
X-Gmail-Original-Message-ID: <CAEQ9gEkkK_qBCq__oSJb1D5J=gLyw-kVDx1OD4SMPry6z-F7nA@mail.gmail.com>
X-Gm-Features: AZwV_QiroKm7vTG3Gj0nXKqwrJ2f1hhd_XI_tJeNywGoynyWCjVs8fpCZhr8ft8
Message-ID: <CAEQ9gEkkK_qBCq__oSJb1D5J=gLyw-kVDx1OD4SMPry6z-F7nA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: lt9611: Support single Port
 B input
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hongyang Zhao <hongyang.zhao@thundersoft.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[thundersoft.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91965-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[debian.org];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,thundersoft.com:email]
X-Rspamd-Queue-Id: F31C6F72B5
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 5:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Wed, Jan 28, 2026 at 07:15:45PM +0800, Hongyang Zhao wrote:
> > The LT9611 has two DSI input ports (Port A and Port B). Update the
> > binding to clearly document the port mapping and allow using Port B
> > alone when DSI is physically connected to Port B only.
> >
> > Changes:
> > - Clarify port@0 corresponds to DSI Port A input
> > - Clarify port@1 corresponds to DSI Port B input
> > - Change port requirement from mandatory port@0 to anyOf port@0/port@1,
> >   allowing either port to be used independently
> >
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > Reviewed-by: Roger Shimizu <rosh@debian.org>
>
> Where did this review happen? V1 had this tag, but the patch was
> completely different, which means you were supposed to drop the tag.
> Please perform review in public.

FYI. v2 was updated per review feedback, which is public:
https://lore.kernel.org/all/7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@linaro.org=
/

Maybe it's better to add this info to v2 cover letter / trailer for
easier reading.

-Roger

