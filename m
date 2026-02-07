Return-Path: <linux-arm-msm+bounces-92121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIXILZoWh2nBTQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 11:40:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE75105914
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 11:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D4F0301CCE3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 10:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2A733DEF5;
	Sat,  7 Feb 2026 10:40:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B2732570A
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Feb 2026 10:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770460824; cv=none; b=nS4JCbgxFLvnscesvKiseAtHmdQvBPZzV39L629sfcBQ9AhxDKTUVKvBz2iON/dOApbOe67YCQpBQuG72k6JJlDqbjz6eEJ9gX4ZIyMTPxoqChiaVWH+TV7bWpwUqrKlNbNCuAe0koTla7Egqh6bjElpALOFVtL6j5BS99zawz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770460824; c=relaxed/simple;
	bh=j95+DucaINUxA44MqegX8LYsptW/wZHNfMj8f1jbno4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qp3K66O8El2sbpOIX4HFzVhVkesGCFkH2sJBHCt8NX8dLsDPjgIxvj2b6xB/v3GYKz1pOFyTSNsgEqtQbxrTGR85HUBDKbH9l2qLolHQeHh3z9fJhOy+lP6/iCr5qdyCZ7eCosVIzy4vY+HF/RYd66ikdBppFyT+uHDwVe1Jvxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-89549b2f538so10455106d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 02:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460823; x=1771065623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R7Y2cu7AzslvSBJEnBtJDOTsvONwUvJjzxIqlE7f53s=;
        b=qhmB1x3og4pbRPJaLQixcEMVtCu0Ly92C2nnwlL1P+8Qu8uzWj00FXn3JLwNCimi7V
         lxx3AXSNSpmfIiLpqPZh15SWhXEepTWOsEnyfdCsofMsDPUQjAyqa7IKzTtnjOGRvrou
         y1glQdcXMspb4iM8zrznG9J/l2uy8mPCbzTQb4ROVUDPW9ILzCqXRaP1CJGxc0Ms5apL
         CTjkALD49Aav2l/KEfb2wxkQ3BHsYrsOsE/j0EpZ3WK9NggOEfgupODSKwInFw/hNyyz
         SBHDCrXOw4Fl1XqOxaD6xMyM0ym+5x/7fvUsrm6Yo+Fr7PXVF5s/qk14y9YUq9ywvW2E
         IPRA==
X-Forwarded-Encrypted: i=1; AJvYcCVIjx4y1tPLr70oPNfXbycrdwLFIQ43rI9zKrWzT4f/59HWJAzLaYx2ySgLFrLOuMX3x/yCd5/IExWDItA2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyus8gzRcQc5J50XOG1V6S8f2lsewB5KLNbyWv9dyFLfPK3Hric
	AL3MOXOQHgvftV/kKScoIDHXEa2Qm8/hCLGqGFF+PEGoODL3ujc+i64QZwMkKA==
X-Gm-Gg: AZuq6aLO9CFuHqRKian3B2g6WzaQUVDMFoo5SrdiCS9IibmSd3Eitr1fkKfob5rgaQY
	UjUYXKok96e8RLPvrnPNAuwEdMyIby1mI8s5FlIrDSk3741G/sPP2q3YzakNaSMn9/RLLQgJOar
	nY4eIIAWfMefIo6lp1o9/IDDLHs5NDnhZSUjGkikhR/XU926hD/zZZfBqCAz3ONDob/GIo2lqU5
	wrBCMygLcWY2I6sni4HAMt4MekKkOzgYNiPXbd9lcjrKbHoF86iEUR+c5voN+KGjtE+TEr8bmpd
	q1BDZw2FsvOEvLdp5wK0L8GV+AwnLqxwyk/mus5mA7sFYVX1oEiT2DTxNM4/D/pHWXuvT/ZJtX9
	TI4Tq+ZMmOKEhruHpo/LI4J5B6mX5maY56PrYqwBze+QRnMcObG6B8Hfa390OcVLBkbj+LZhRwA
	hTGbSZN/G7EFHx2QLsrPgvJzmFrJ5ldOofiQCq9ZUWaBUyC+wuNJTW0EDs
X-Received: by 2002:ac8:5dc6:0:b0:4f1:ab79:fb18 with SMTP id d75a77b69052e-506398a1d6dmr76455191cf.25.1770460822720;
        Sat, 07 Feb 2026 02:40:22 -0800 (PST)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5064afde581sm11068441cf.25.2026.02.07.02.40.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 02:40:22 -0800 (PST)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c9f6b78ca4so219921385a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 02:40:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRxrPQ9vKjNv3DySJBFKFtIDy133q1doOm9zJhBRErt3hHgSfEGw6b21lr8vZgbvb/EgvJyjaZUVbkgIl8@vger.kernel.org
X-Received: by 2002:a05:690e:e8b:b0:649:e94d:ea2f with SMTP id
 956f58d0204a3-649f1eb0c01mr4470518d50.39.1770460517932; Sat, 07 Feb 2026
 02:35:17 -0800 (PST)
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
 <1fee1990-f525-4559-b121-46fd1e1c9fef@kernel.org> <CAEQ9gE=L3gsnyMtbVDbvHo-jhTSPw-8DJ7L2n9c=SKc6jOAHrg@mail.gmail.com>
 <f1e0d724-4d71-4003-b690-9bbab3a01cd0@kernel.org>
In-Reply-To: <f1e0d724-4d71-4003-b690-9bbab3a01cd0@kernel.org>
From: Roger Shimizu <rosh@debian.org>
Date: Sat, 7 Feb 2026 02:35:06 -0800
X-Gmail-Original-Message-ID: <CAEQ9gEkEiNS83b4ptogzXZH8FsoUWHSZ8NabNHMRjJ0LegxXig@mail.gmail.com>
X-Gm-Features: AZwV_QiOhcyuj2SxtwX--Sp5p_XHyxG-dX_Ewq7SdNxOcGflxqe5mw5T5S_JqvM
Message-ID: <CAEQ9gEkEiNS83b4ptogzXZH8FsoUWHSZ8NabNHMRjJ0LegxXig@mail.gmail.com>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92121-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[debian.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.952];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0FE75105914
X-Rspamd-Action: no action

On Sat, Feb 7, 2026 at 1:35=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/02/2026 06:22, Roger Shimizu wrote:
> > On Fri, Feb 6, 2026 at 2:56=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 06/02/2026 10:49, Roger Shimizu wrote:
> >>> On Thu, Feb 5, 2026 at 11:08=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> >>>>
> >>>> On 05/02/2026 21:31, Roger Shimizu wrote:
> >>>>> On Thu, Feb 5, 2026 at 5:07=E2=80=AFAM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> >>>>>>
> >>>>>> On Wed, Jan 28, 2026 at 07:15:45PM +0800, Hongyang Zhao wrote:
> >>>>>>> The LT9611 has two DSI input ports (Port A and Port B). Update th=
e
> >>>>>>> binding to clearly document the port mapping and allow using Port=
 B
> >>>>>>> alone when DSI is physically connected to Port B only.
> >>>>>>>
> >>>>>>> Changes:
> >>>>>>> - Clarify port@0 corresponds to DSI Port A input
> >>>>>>> - Clarify port@1 corresponds to DSI Port B input
> >>>>>>> - Change port requirement from mandatory port@0 to anyOf port@0/p=
ort@1,
> >>>>>>>   allowing either port to be used independently
> >>>>>>>
> >>>>>>> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> >>>>>>> Reviewed-by: Roger Shimizu <rosh@debian.org>
> >>>>>>
> >>>>>> Where did this review happen? V1 had this tag, but the patch was
> >>>>>> completely different, which means you were supposed to drop the ta=
g.
> >>>>>> Please perform review in public.
> >>>>>
> >>>>> FYI. v2 was updated per review feedback, which is public:
> >>>>> https://lore.kernel.org/all/7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@li=
naro.org/
> >>>>
> >>>> Link above is not from Roger, so again - where did the review leadin=
g to
> >>>> above tag happen?
> >>>
> >>> Per feedback of v1, v2 was quite different than v1.
> >>> For v2, it's close to initial review, because it looks like a new pat=
ch.
> >>
> >> Where was the review of v2 given?
> >>
> >> The patch is entirely different. I already said it. I also said what i=
s
> >> expected in such case. It is also documented:
> >>
> >> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/proces=
s/submitting-patches.rst#L577
> >
> > Thanks for the guide!
> > Yes, v2 was reviewed in private. I'll inform Hongyang to remove the
> > tag when he sends the next series.
>
> I am repeating myself but only because you really avoid answering.

Because I just didn't have the time to check when exactly it happened.
I agree with you that if it's public, then it's easier to check the
mailing list.

> I understand v1 was reviewed in private, before posting, but why are you
> developing in private also v2? After v1 was posted, this should be all
> done in public.

Hongyang wrote the patch. Credit to him.
I just helped to check.
v2 was a rewrite since feedback of v1, so we think it's like new
patch, which was reviewed in private.

> I have no trust in private reviews happening between versions.
> Especially if v1 is send on 27th Jan and next day v2 is sent supposedly
> reviewed in private. Really?

This patch is not huge amount of work, in spite of rewriting from v1.
I understand that it's not good to resend a series too quickly, but
for this specific case, the feedback was very convincing, so v2 was
sent out without much waiting.
If you insist on some more waiting period, we can follow it next time.

-Roger

