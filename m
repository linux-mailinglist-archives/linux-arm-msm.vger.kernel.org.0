Return-Path: <linux-arm-msm+bounces-100675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF/FMzsgymmu5QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:03:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D30A356308
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 028D430053AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 07:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCFB3988FA;
	Mon, 30 Mar 2026 07:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3UftXprL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893EA1A6800
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 07:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774854194; cv=none; b=qqi3ohTqeACqLfSXcnOI/gTA5U/uD0gwtMGYdBNrXodvwh5mS8ECYQod5/qPYPYqzJL/FENogvT/XYd6sOIGMdzI7TKBM7TkEGKQ2lQKkm6F4m2JxaCVcBgeGP6AkcdsI3YZGDvqfDwSb79JU2fGoJkpRCNFzMfgISZB2IFHWvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774854194; c=relaxed/simple;
	bh=oTrAE51mK59LgWSLUSGVp5E6tFuOAo/TbU+pZVzgF/c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mjoo0Z717PRb4PDj7h7MY5oPdS1iy7EVXgtvBcIt8GHTlIsVpv4KH6G+mg4qwc1TgR5V1XhHeuHETlkL8V2MPLsyA6w0VzdMAdLiuNVZCB2XyYhEyGwlCSm2Nwrou25hPxYDCN3mnFwf6TmicXdNxViWfx+MPc1o59nHpWEygFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3UftXprL; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b98133bdc4bso496526866b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 00:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774854191; x=1775458991; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWosBDrmj8Wsu71M4ypLSluM1xAKCMFb6dnCW16nodk=;
        b=3UftXprLwWR4bCMC2zMJuGkxVCdtOCyLtR98CuOsqei5jFnS9EdGrwa70ED7gxKk7S
         oRFrJqkiUWHaTPapbw1NrxsifFXPlCKGGIVMl0JmGs8bNo5y+1dgdXAhFSre2wYJcEtP
         1H9HySAmE1MfJ6FHEmMv/doyXDZmLlkpRDKWTU2q4hIW2fyGAlPHiNexkZUMNI7U69Al
         4YNwUi3FA3LVWhPzQgJ1mzD1PlbsX3usRcom0TmE9KYlXbK/ijOo1Ajg39uvHOsrruO9
         himAV1Mq1PB5gvzCppR6qfW4y+A0UKcjItjk5u3nNqA8NQ0/GPlhl5xKz2r56UZV+MtI
         2tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774854191; x=1775458991;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bWosBDrmj8Wsu71M4ypLSluM1xAKCMFb6dnCW16nodk=;
        b=Oty5Hfvqbc64BTuzzruVAk46wDW3BlHtEqrFW6TwYLC+XcZ26HLWILWbXEOUi+js3p
         E8O7uy424I0QHgzOJO/Kxo0+vC9kpvPAHbox9QKnJpcZ/KJhIJFR06sM6ZJsfKFbe7ya
         AVJMlTxyVB7hp/tGnTFn2tBWmZmvmTIxKVbM7J5lWsovTQcARVUcQwFZkhYHleUrNyw/
         vuA9/zdbM+9LTcw2GoEkPd47VpMum1OjebsTzd6h1jOsTRnU5fdZ87jlV1yhs9le6jU4
         2UTgJQqOGsXl1jkAeOxs6CcSiOC+IU7ElSx+andNPKpCjN5JT8K25qMldGfc2I6incPU
         zFdQ==
X-Gm-Message-State: AOJu0Yy0CpQPuTFL+JrjgVrzEHx0d+ONjV/cELjfl3Pf3MxvACvdNIwA
	ntq3Kq4tLkBRkahpvL4qZQFcwb0/nxeMXXf4LfizrgTZyfUfElh2sRZfNbaZKgpetFk=
X-Gm-Gg: ATEYQzy/x2QrH+tlSXaZqAb7C5WBInLsHwzH9TWnm59CjFvNhB/GiiLhgERHV2LD3ay
	/X0VxVoB7a9byg81pLrjBh23uKsqDONG/acpaKh3m6uJHvObVOdriO5YyxarTp1QKjqKRw6LlZK
	EwQhHc3Zz2dwudsDVR1GS2I3b1NJQNXduynfR41xkRejukZ9MtPz1CaIZZa0p8lgeVZ9BSaoKUR
	cqYVl7UBM1lXjDkxmhSUT85mOqgupCMG+aEfLAw9ahj71fgVGLXMK5APr2jNSX0Vm4LS1fo7naR
	9x5EXFxjxRy6VQeaCOHRUBtB3VKVWSeQrxvvlr3ytsNBCdXToUfiQFiwtqV/VkgZwzDiCvDIswa
	fphG77K4CDmTwtchy90eQxQZjHI9BctiwYgMvr3MDVkQBGgypV+XyJ0f7SwSP3hf6OMEWv3XwO3
	4SQOaxXmKX9KBvPwtzq1ilx66+nivE7yLBlezxDfM/Lv7FuNoy3a/QKpcmRwvjB4TArCxX
X-Received: by 2002:a17:907:9411:b0:b96:e593:fd1e with SMTP id a640c23a62f3a-b9b4fa20b47mr665678666b.0.1774854190784;
        Mon, 30 Mar 2026 00:03:10 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225d4bsm251242466b.60.2026.03.30.00.03.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 00:03:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 09:03:10 +0200
Message-Id: <DHFXAUS2IMD6.38B0MDH2UNFLG@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Luca
 Weiss" <luca.weiss@fairphone.com>
Subject: Re: [PATCH] drm/msm/dpu: don't try using 2 LMs if only one DSC is
 available
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260317-fix-3d-dsc-v1-1-88b54f62f659@oss.qualcomm.com>
 <177463970794.3488980.5641186548018992630.b4-ty@b4>
In-Reply-To: <177463970794.3488980.5641186548018992630.b4-ty@b4>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100675-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:mid,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 2D30A356308
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri Mar 27, 2026 at 8:47 PM CET, Dmitry Baryshkov wrote:
> On Tue, 17 Mar 2026 17:30:05 +0200, Dmitry Baryshkov wrote:
>> Current topology code will try using 2 LMs with just one DSC, which
>> breaks cases like SC7280 / Fairphone5. Forbid using 2 LMs split in such
>> a case.
>
> Applied to msm-next, thanks!
>
> [1/1] drm/msm/dpu: don't try using 2 LMs if only one DSC is available
>       https://gitlab.freedesktop.org/lumag/msm/-/commit/b9699dd86276

Hi Dmitry,

I don't see this in -rc6 unfortunately. Will this still be sent for
inclusion in v7.0?

Regards
Luca

