Return-Path: <linux-arm-msm+bounces-92104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPVBKxDMhmnGQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 06:22:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2495E105020
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 06:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED2C03017064
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 05:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A69C2D7DF8;
	Sat,  7 Feb 2026 05:22:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5772212D7C
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Feb 2026 05:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770441742; cv=none; b=V5ouY7RKwn7iFmgXMWjLv7xJC0oEnC/60A+TMM4B8rHrkcjR0VLA8tJ9DF5u04I8XvRvqniyQRfesvbcCuaivMkw8B7QV6oynySDhWzGcSx2PNhtbVG3deZuBM9hxAo1LqossQtDBcuaKzia6QmgMa9yjjXB3ipF/fyTAdKKqUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770441742; c=relaxed/simple;
	bh=E5WS1EMk4WOA9/NiAFSXPnIITqHBHquNATRdykjjDnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=awe1bz72Fug8ptWCvRCw/Tx6gXKYNk67XOgFZ7gmKUhcrlDOmCpTu/B0eMfjVZGc2PC244+dHzsASckIvHPcXbKZVrAbyTk8opIxrhTSDmg8QXTcWQSdI3U3pcqbInldEdXKTgiN7mfkpscUTeF/f8G3cRr8jHAFDG3NmYQfmGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7945838691aso51294177b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 21:22:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770441741; x=1771046541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=17OCwG6i1wi5ke5GRpB0Eh3X9L8aGMj6rgAo4LSUjdE=;
        b=jlSn1PeGNxaXQ8JFDTSTUIQT0F7gKm1kHVnpHOg29lqTqnDLtq6n6195s4YfDo5GYH
         Tcw3amSXNVCScyVj4O1MXdOlT+uMG4uga4wgowM0sT8DNrnrUHFap2AnoO3dyeLFRDjj
         veqjqFEzOnIIvC+AQ2s+Hrj3DNgYzSosNr3GzVAJ9sksW8PcifJjO2FvC15s7BHf0y4p
         P3cVYdpsKSH2vOLRvueewHINAPWasFf9XB21zIDpB8uY4PONDEv7ckL5xwinqi/UFRqN
         ULapUHUCf64Z6Xl+fi7M/03gl6JVxHC29nPYZgbZLe61vA4AMPEaNoikG9fRzonoyXDr
         7KDA==
X-Forwarded-Encrypted: i=1; AJvYcCXB1dksaxsK3H8L5qFeW3CMld9rWG9Szn6BhSJ4BExIQNQumS9h2Zxy+HvNwVpYVmpjBFNuI/H7znxVzv9A@vger.kernel.org
X-Gm-Message-State: AOJu0YxBuxFs791vaT9WczRPsPvhOIXpoEh4AQmLgMVI6nphlomUunZp
	imGcnpNgD0wpa+/kYhB6MvpQSuapMMUgnQ86Tu6lGwZxG6zdHbxtEasvLdT8BQ==
X-Gm-Gg: AZuq6aIeebWYKvBURfexDaD7QH4gRJNXpIjHbhjBUdij7pSvxKKsiv6SFKYzrWBDJhe
	lrepokzswFlIgG8eXfOs4AGml1fEAC4Y82mxnGPNBIx2hnyJOTafL3EDJB3wFnU2JGQtRzryaKs
	YPEI9Fgarrdx6/zSbkjS6alT/hodSAx+xn5yMuXJ2leyAThlPfkgDRcKagz+a89hhMKY4Jea+d/
	alwx4vp8efFwdjaRq6ht6uUnwq+31T6EmWm9GGUwiWbodcX9nx0MdRsrTgJsnPOgdlzwcLINBPU
	PAqj4JKbt9VpKlVBCIEB4FcrbmweqAfk1r5hDhEEDzH2Ssfyk+ZXrjy7+9LJSrDNnRODwLVzn9F
	GOT8fqJ3GeS6QQgsMsEfl87HsR630B3QF3hoCA5k1+FgcV6gTWpRCr4drV7xiDJi6YsYtqrmQjT
	RRMhHIcHfVmx/6LX/+zyBX1X5+T1kW+63pAMbaCLXW1FDhiOxPaiYXZX7d
X-Received: by 2002:a05:690e:408c:b0:649:373f:a1b9 with SMTP id 956f58d0204a3-649f251463fmr4025707d50.23.1770441740739;
        Fri, 06 Feb 2026 21:22:20 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649f248d184sm4244545d50.10.2026.02.06.21.22.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 21:22:20 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7945838691aso51293977b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 21:22:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKwsUBSYGop2JupD+VuCuy4xNjX/kVkgCiIU/TR0zAl8DvrHh6S2P9zsgBZ+9CR/FZu1gWgX3thVkdERCe@vger.kernel.org
X-Received: by 2002:a05:690e:1508:b0:649:61b6:8a97 with SMTP id
 956f58d0204a3-649e87e21f8mr6826337d50.42.1770441740068; Fri, 06 Feb 2026
 21:22:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-1-ba51ce8d2bd2@thundersoft.com>
 <20260205-winged-alligator-of-sorcery-aada21@quoll> <CAEQ9gEkkK_qBCq__oSJb1D5J=gLyw-kVDx1OD4SMPry6z-F7nA@mail.gmail.com>
 <0bcd3cb0-9231-4cb0-a726-c439d01f63e5@kernel.org> <CAEQ9gEnvM1x9zP2RDPpEs3TMZ2Jcah7OU6s0y9zJY-7qFUJJTw@mail.gmail.com>
 <1fee1990-f525-4559-b121-46fd1e1c9fef@kernel.org>
In-Reply-To: <1fee1990-f525-4559-b121-46fd1e1c9fef@kernel.org>
From: Roger Shimizu <rosh@debian.org>
Date: Fri, 6 Feb 2026 21:22:08 -0800
X-Gmail-Original-Message-ID: <CAEQ9gE=L3gsnyMtbVDbvHo-jhTSPw-8DJ7L2n9c=SKc6jOAHrg@mail.gmail.com>
X-Gm-Features: AZwV_QieKd_ZP4aFD5f_DxifB_sLkcMLB0SwbwiEzLFTZaXP5WcquLwWVuCYe7k
Message-ID: <CAEQ9gE=L3gsnyMtbVDbvHo-jhTSPw-8DJ7L2n9c=SKc6jOAHrg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[thundersoft.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92104-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[debian.org];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.953];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,bootlin.com:url]
X-Rspamd-Queue-Id: 2495E105020
X-Rspamd-Action: no action

On Fri, Feb 6, 2026 at 2:56=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 06/02/2026 10:49, Roger Shimizu wrote:
> > On Thu, Feb 5, 2026 at 11:08=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 05/02/2026 21:31, Roger Shimizu wrote:
> >>> On Thu, Feb 5, 2026 at 5:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>>>
> >>>> On Wed, Jan 28, 2026 at 07:15:45PM +0800, Hongyang Zhao wrote:
> >>>>> The LT9611 has two DSI input ports (Port A and Port B). Update the
> >>>>> binding to clearly document the port mapping and allow using Port B
> >>>>> alone when DSI is physically connected to Port B only.
> >>>>>
> >>>>> Changes:
> >>>>> - Clarify port@0 corresponds to DSI Port A input
> >>>>> - Clarify port@1 corresponds to DSI Port B input
> >>>>> - Change port requirement from mandatory port@0 to anyOf port@0/por=
t@1,
> >>>>>   allowing either port to be used independently
> >>>>>
> >>>>> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> >>>>> Reviewed-by: Roger Shimizu <rosh@debian.org>
> >>>>
> >>>> Where did this review happen? V1 had this tag, but the patch was
> >>>> completely different, which means you were supposed to drop the tag.
> >>>> Please perform review in public.
> >>>
> >>> FYI. v2 was updated per review feedback, which is public:
> >>> https://lore.kernel.org/all/7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@lina=
ro.org/
> >>
> >> Link above is not from Roger, so again - where did the review leading =
to
> >> above tag happen?
> >
> > Per feedback of v1, v2 was quite different than v1.
> > For v2, it's close to initial review, because it looks like a new patch=
.
>
> Where was the review of v2 given?
>
> The patch is entirely different. I already said it. I also said what is
> expected in such case. It is also documented:
>
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/s=
ubmitting-patches.rst#L577

Thanks for the guide!
Yes, v2 was reviewed in private. I'll inform Hongyang to remove the
tag when he sends the next series.

-Roger

