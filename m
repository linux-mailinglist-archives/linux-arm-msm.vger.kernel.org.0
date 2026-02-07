Return-Path: <linux-arm-msm+bounces-92105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +wjlIpLMhmnpQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 06:24:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B05105031
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 06:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60E1F301BCD3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 05:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CEE2E040D;
	Sat,  7 Feb 2026 05:24:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3C42DF156
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Feb 2026 05:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770441871; cv=none; b=AtUIzer4mAxyf3WZry/FsGEIMCxRTJurOog9igLaaKMY0tmAIjfVYDCE1pDTy8XBUNfm58Ipr+QgdYCN3GlUQypqSKutmiuxwOgyljYGl/dvKOd4kHwYCmsOyeu6yhp/yCU8wKCAj+zICtrISG00kCJK8417ENuYYrIyYDIuEx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770441871; c=relaxed/simple;
	bh=krDiaFFyS6239XZlJf6eTMcTjCZxo7YCdKbQY2cFgFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BI4LkqVPr3JKnLWYlXtQD78lU1RPV1hNoSmah8oj7Hi9G9juDXT5QPglFTFz4RToTPzHZLuMsLf+e4Yo8DdVp1zkAcxdvmU0/tuR4RU+8cXA6dLUvl2yNdeZA5jykgWzWpYo7gLxNUCD39DJAVRRGtMWOnETub8F4IyYklmWKBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-795176156b1so16473577b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 21:24:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770441870; x=1771046670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=krDiaFFyS6239XZlJf6eTMcTjCZxo7YCdKbQY2cFgFs=;
        b=AVuEhTCsHycIu5Z56jR27ZBBAJFH9DSgDcIMAk2bbZGpbF/AxzPczoibwAZCQ/lc2L
         CkKrZaAiqKqi49ty3EzRe5tiuW5aA9xm0WrszDy939RyuOAnsYlCqP3CmH7UuIY0HjcZ
         xf+MzDeIFvkhjau+eYKvoW1QF88Ox0rfuIFg1+THu/Ok+ztsKAsWNP1vE6Zokt3raqFG
         JPbSud2UzqzFN9H0A3wV6UN4xj2gnTsXg/JnsOwwKt4XYKthIEwL8hwhExwUHWKBqlE8
         NVaKpW1PzhrObdBCAl7R7TkAtuCXxNuz9oDuwbzrKDurLXkzAjSsgCKO4Mw9iL9gjlhO
         32cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm25KmpVSk6hrzSqUAUM6yGJMAFJsDbqdPzLuWBoKNPamRhjC/UBhaubLscGBMEHv/S/lM9ZgS7gCtTKqK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5/yOhULJSKzJcBvhpYQc4DYpy4Gmp7Q0OGxoPZjZpaLe6oUh7
	JThpizWpfSGnXZ02Gono+i4eb4AomdbM0Eyjli5WIbux0IjocVjPlQxS+xNpjA==
X-Gm-Gg: AZuq6aIReyx+aHJmopnPyl7FTu2pR5OS6JkIkc3UWNky5xXjLbre7UwRNKak7h6vujF
	0ZIzJveovDD9U+DlMiyIXjEI5jnJVvh61Lb2TJleszCOmt1QtBAVR5/vCF9MSS2Nb+RRbzrblN0
	On+RsNSu2tl8SVrWLyevnEnppk9isQlUyeR9TKOcOTIHxYQZ33kjyjvuVS5S7koCsOJU2qRZ7nP
	DWlcL7tJsn9vvUiEtTK04JdpP/8USJDOQ5i6Iy22ZTgkBT3KS6mzYa4MztFTCXZzwOgHcA6MM5X
	VfVPWupL9SzIyIZ4bNClVc6uVUdfk/hWVTzIBxXY1b8wtzHrtidk7kMcZh+lTmd1bRitvTJC+M5
	qxeDqUpmODk2wAY/MjiE/wZqaLcuVkzB/AzM9E0FsvTUI7pSunEhgPxYzwrTpBB4FTt4g23izd6
	e7UOSvdPWOPacuxzZfA1mFMSV8I1QDVNNxDBA/jQicww==
X-Received: by 2002:a05:690c:b87:b0:787:e9bc:facf with SMTP id 00721157ae682-7952ab44f06mr49004057b3.50.1770441870192;
        Fri, 06 Feb 2026 21:24:30 -0800 (PST)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com. [74.125.224.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7952a013704sm39704187b3.11.2026.02.06.21.24.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 21:24:29 -0800 (PST)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ad8435f46so219574d50.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 21:24:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVb/fqKcV7QoNUBb7z19BOd0vPqgVJKbYJqolYE3otVQDvVuBUlFALO9/bcII7dQfIK1cgcf4ezO2pintLa@vger.kernel.org
X-Received: by 2002:a05:690e:d8c:b0:64a:d9f2:ad6c with SMTP id
 956f58d0204a3-64ad9f2b2ffmr102741d50.35.1770441868920; Fri, 06 Feb 2026
 21:24:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-3-ba51ce8d2bd2@thundersoft.com>
 <20260205-calm-aboriginal-mastiff-b07eb3@quoll> <CAEQ9gEm-A8mDS=6V3h=2gHOhtM39q+bR79sSFhDTvbEJbDJRWA@mail.gmail.com>
 <7c6ebf5f-ed13-46f3-88c8-a33205388d74@kernel.org>
In-Reply-To: <7c6ebf5f-ed13-46f3-88c8-a33205388d74@kernel.org>
From: Roger Shimizu <rosh@debian.org>
Date: Fri, 6 Feb 2026 21:24:17 -0800
X-Gmail-Original-Message-ID: <CAEQ9gEm=6kLFz5bdY9wtVd2ZLtmPape-GUrY_dJT8OYhzBB-nw@mail.gmail.com>
X-Gm-Features: AZwV_Qgf0EMQyeIKx49_m9UW5WfF6Aam9IpQCMPUe92xYzVqHTDk6dw3j6f9MCM
Message-ID: <CAEQ9gEm=6kLFz5bdY9wtVd2ZLtmPape-GUrY_dJT8OYhzBB-nw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rubikpi3: Use lt9611 DSI
 Port B
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[thundersoft.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92105-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[debian.org];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.948];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D5B05105031
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 11:08=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/02/2026 20:36, Roger Shimizu wrote:
> > On Thu, Feb 5, 2026 at 5:09=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On Wed, Jan 28, 2026 at 07:15:47PM +0800, Hongyang Zhao wrote:
> >>> The LT9611 HDMI bridge on RubikPi3 has DSI physically connected to
> >>> Port B. Update the devicetree to use port@1 which corresponds to
> >>> Port B input on the LT9611.
> >>>
> >>> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> >>> Reviewed-by: Roger Shimizu <rosh@debian.org>
> >>
> >> Where did this happen?
> >>
> >> https://lore.kernel.org/all/?q=3Df%3Arosh%40debian.org
> >>
> >> And again, v1 was completely different so how pre-v1-internal-review
> >> could be applied to this v2?
> >>
> >> Honestly, initial guidance is useful but continuous development behind
> >> the closed doors is not.
> >
> > FYI. v2 was updated per review feedback, which is public:
> > https://lore.kernel.org/all/7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@linaro=
.org/
>
> What? I asked about the tag. Do you understand how kernel review process
> works?

Yes, v2 was reviewed in private.
I'll inform Hongyang to remove the tag when he sends the next series.

-Roger

