Return-Path: <linux-arm-msm+bounces-95299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAbkOCUeqGnyoAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:57:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A372B1FF69B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94E993034799
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 11:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65253A453C;
	Wed,  4 Mar 2026 11:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPFbQx4N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1033B3AE1AB
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 11:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772625282; cv=pass; b=JNSQvyQNRcyS2yH9DrHMpgHnQEVYlELRTtKzWtvinDqhnsSaXALBXnXi+KjskiWaml25BSaCF9keIxb1IqlWrRgeTqcswsQCwcGm3tu2j7HxHQHAaC/xS0nOi+QisYTR910yrhV7iHf12lGG83Bofit8f6IHTTuQccU7QkenDC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772625282; c=relaxed/simple;
	bh=DeZ6Ygfqs/heAUrJFlxVUi2dKLAHlgjAvV7UVsRLntw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmOgKdTgxgFzssEqiT+4yG6EiGF3AzCGWuQ8JyKejpkER3eVvkxUqPUa+GU2wkl6bXIAjFLfsknst5OI2+5IsMkR20RzhS3bJ7qEJQSSLBLYv+Gu0q3gjZ1rzYhxfOWMTgThCt6LLeMJ29zx8xW4rzOC9gxujsmSD+K69vF3D1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPFbQx4N; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ff125cba0fso1842550137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 03:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772625279; cv=none;
        d=google.com; s=arc-20240605;
        b=K6I4EmOITp1EvPk8DvIsjJS5i/nx80j0rrBC5kGye9q+13TE0ytr2zCy3bTF8g5K6W
         X2x5e64Cc+zGXJXF+n7kb/Xi7BnoqEWxFofb/6uYeEtaijwX36wHeuXeBM6HXqDBJvwq
         gnj5PuIfoDwAXTR8Nyl1Jnm+CaQR0dHc7b9rEjGwhM2dIIhBtS5L+RHHwQQC9iR7kBzR
         WSENZAy/pBRRQG5LRYZHrnUS5ZpTWW+85qwjeBNbzhVZgQvo9N9AnDv0RI+RPQwOA4rX
         xZnJmcmBNKMA7WXQ6it/OD5n7+2W4LJm/nLe+oj8OqbYnx2uh4wacD/ptP7KJiYUufy2
         4JKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DeZ6Ygfqs/heAUrJFlxVUi2dKLAHlgjAvV7UVsRLntw=;
        fh=7ZJif6jC3ppIWtPh+gjNFmbVxHfjKT8HTwj39rYZHG4=;
        b=ltRDlk11TlRJce1D9HzyGzf6jU/0w9DB4AGnbYzrIAEkBr6Guy0hYuLKeD7SZkKMQe
         3SEBqmmhkZJg2AcIOY+1ictAPE00PShj7XnGvLOgviyqMoWhAgVxUtBxNx+87MJxpbea
         mBD2cBfcL0NhaRRVS0kOly1cLXIoyrdsmD8mHRtbwc1pUAIkvxBPjecsWy3fr8qETK2n
         BeazX6y3w90ATUYJAQdwZRkxTKddYoTkaNTcuw19b8wgbErrzdeBhw0eg4ClcwU9tja/
         9j9MSY6Hl6SOmvFEU7CCJJ9ihKyYYIZi1vV8hYYt7AgLFzUFOfj1ccqND1rZse4/ucCn
         OumA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772625279; x=1773230079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeZ6Ygfqs/heAUrJFlxVUi2dKLAHlgjAvV7UVsRLntw=;
        b=YPFbQx4N/XWgf6Yz6FpgYv/LATnO/9u++MFaKGQWKHZJuYnHkZO4mPwKlxN5zd1TYi
         VL2E9jpT2oCzN/DCzOlG7q6nB25jgoGrezdBbbrvQsi+uQyWwL1bNvNsh3mJ4a+opnKw
         L96E5rus0mBowgBEsIvgKJieniM142Es3gSdwBurQ5TgUXr1CT4VZalPJqGC+NaHKxrb
         Tgbig7FJSJf6rCsjzvrg9Jxwqt2b1I9w7xjSVlpenIESKhnFadgB8Zh7D6qSM28YtH1C
         uejgCyj0FYqv8MZU05mYhhkvhihnES3jqHRhhewP3csMaZG7qMaPZa2BRtsZ5LkdYV6K
         Q9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772625279; x=1773230079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DeZ6Ygfqs/heAUrJFlxVUi2dKLAHlgjAvV7UVsRLntw=;
        b=jium4zXPM1zMDpnyM/GmDxZmv+y1WmanupZrOO27Qu5kL0fwYo7Nwik37c4PwCHmL8
         tBgYIxoDaanjYTOesY+5Lcw+NERs/Uh81f3399ft11Zm90G8t+21cF/pZUzTJr9NJHai
         xfMjRPDHtgMyCD9RyZbN3Em0YKG+7Ij52n4pB6FAtvGdZzKfXP7sj5cLVHFPDYj8JFjI
         Brtn+qHKInL0j6sP9QLbtjkPOExXiaLgK3dVDgeLYiatc3aJgqGzckRQWpjHsdslYUlA
         3gVy81wHqy4iVbf+lYcSmZjw5i9spenY9oI+c8K5zSA2727sOfSxQvaNLBhD/vjdErJ0
         almg==
X-Forwarded-Encrypted: i=1; AJvYcCX0qzWJFEWLi+TQBOCeSsUaxU3ED1j4aoTPEhGHL02XHV5iPX2qs+1tnthar4IjlqqaA4XWotuGIVjREIhc@vger.kernel.org
X-Gm-Message-State: AOJu0YwhfKG0g1Y6HKiNS+IUHDVuqntHAfFITU1UT/ClKGfDykVNG/56
	YfNljg6LSkEUPuBmlUySUWEN8YPx1Gh1bI3FwRjX+GhtHl9TQWyO7y7r6YVqlH/SidjIxBVxgb8
	TcA0wp3OgfpYIap5+NdD/4peKJ8YbDpk=
X-Gm-Gg: ATEYQzw/cjTEiGU6ysTzM2enbkI/+wmmDfJ0UCXPCZCFsn1Hm/K5ngL5Gy/J8x5eK5r
	g3EkfCMGMHFKgQokxTERztAtHa2/Wp06dKzgJC0KXCRaL0xBvqmD098zedZSXbNoPd9hWUwRgU9
	SHAm86siWSdxc8xH0CUXCzALx+cKE2HyGqLNGBZWAB6/MX9E+JkcAm+lZGT7FlSNynq5Zcnt3Vs
	QZ/ecE2TTq9wKWPh30DYxmj9dv5U+j3tomkT4cLb5WBLv/6ioGcMWa3qNkFkLKZaM9uXj/ASm83
	12Xq7i8=
X-Received: by 2002:a05:6102:3053:b0:5f5:3ba4:312f with SMTP id
 ada2fe7eead31-5ffaaf09f99mr661974137.20.1772625278684; Wed, 04 Mar 2026
 03:54:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303150152.90685-1-mitltlatltl@gmail.com> <d90cd589-8a0d-4e72-82ae-7e78dec2320e@oss.qualcomm.com>
In-Reply-To: <d90cd589-8a0d-4e72-82ae-7e78dec2320e@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Wed, 4 Mar 2026 19:54:20 +0800
X-Gm-Features: AaiRm51JUjTWLPopUm59SQ2DGOPsTEwAW4-AC3meern5RDrKecAF8z0xKR7p4Lg
Message-ID: <CAH2e8h77bpWvSdYu2guC1muz2A99+cPtWZyUGNKVOeh3J+eygQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at
 registration time
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A372B1FF69B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-95299-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 7:20=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/3/26 4:01 PM, Pengyu Luo wrote:
> > Parking disp{0,1}_cc_mdss_mdp_clk_src clk broke simplefb on HUAWEI
> > Gaokun3, the image will stuck at grey for seconds until msm takes
> > over framebuffer. Use clk_rcg2_shared_no_init_park_ops to skip it.
>
> Do you have clk_ignore_unused/pd_ignore_unused in your cmdline?
>

Yes, always.

> The sc8280xp-huawei-gaokun3.dts references no clocks in the simplefb
> node, so if you're unlucky with timing, this is ""expected behavior""
>

On gaokun, if simplefb holds the mdp clk, there will not be the early
framebuffer, I can't see it. After seconds, msm initialized, the
display would show logs.

Once I owned another sc8280xp device(Ntmer TW220 aka robo & kala), dsi
didn't work at that time, to bring up the simplefb, the clk must be
held and no parking. gaokun3 always requires no parking only.

BTW, I can see this grey flash without simplefb too. On x13s, if
building msm as a module and not putting the module into the initial
ramdisk, what happens?

Best wishes,
Pengyu

