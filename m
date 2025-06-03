Return-Path: <linux-arm-msm+bounces-60163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30619ACCCB5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 20:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2ACAE7A4AB0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 18:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A201B288C35;
	Tue,  3 Jun 2025 18:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="WgeGMCfW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294FE2853E0;
	Tue,  3 Jun 2025 18:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748974608; cv=none; b=V+7AtKE2RInpMxGJClQidwzkgUTGUuxkCztiu2pzqHiXcg0/wwCJhP+QrgqERU+We2lwhCEfiXZ/BW8ULsN+AS6YsBiRHCQ54I4T3zJEgG8uwJu8cFqEpaoaVGvGIanNVXY253vG0UBSwgvLrPeYjCGzMiVBp4FOEvXKcFUVTiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748974608; c=relaxed/simple;
	bh=p1oikR6A7CSugoR4HjSUuEWBgK7rKrZS/huPT73PKfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M+ws9QJ/5A6SldDYUUs//LnnT8L1nsNitNDAhU1arqQb7lqqB/iMs/9HV5GkuRF3uFc6OvYxTQjDI2p7ZDKklbFrErG41i+4oJVG4muncq9YXo2nm2d5lchTwxiswJhh6+dwn6ym27MvekCyr5b6856zWl12tq3f2bZiv9tGeW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=WgeGMCfW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2351ffb669cso48200625ad.2;
        Tue, 03 Jun 2025 11:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1748974606; x=1749579406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muedraecWG3k6sC4BkfWIIfP1Qhn6jm5riTVBMIqDbo=;
        b=WgeGMCfWNsQgQbH6s3AziOcGfKJSpfd7SrXjfU9HrVE7iu887hNpQ71Okfzf2Ng83S
         OZsfmOR/4oLCF6/m2yjhZGpGxhrq/ensB3Fj6drWUtD4BsnDw3B3nOH8k7oiGqXFmQST
         zY1RJLky5G6t2/01It32qE3VgwpM24EFKyH5K7+vHiPJ/9Sq0HNLO+kB2CKSACaA3XCl
         BJIGuIKQZsERRU41RlxRtINrhU6WGGL3Z4JEkRRKnDqVltmTVhecqfU3s2QWcAOoKHvJ
         XuoMj4YmnVMQEItztLayKDU7k+HZeClyBZwXCQV0O676aXbUPGinfHUP5kKVRYVqgvbq
         MRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748974606; x=1749579406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muedraecWG3k6sC4BkfWIIfP1Qhn6jm5riTVBMIqDbo=;
        b=QL6kxppAW0DxhVlkEr8XexzWe0jGsUijNBgITYEoim7JMHH8gHJNuLyLqJ0mkKo3jG
         0CVwrfqgvrLie6pG8Zuy12ZHAV3LPOXRzH77KKsoRfR/VglgpksGg0lkzd3wFOkvR9br
         dmJTymRt7tGwr/qEVJXGX+Hm8ycxixRBTJtUNAhXo2ZTNCMq5Ia/tKcEAxTbrg31qpL3
         PL4f7UE07h4RECHSpgnsJAd1a67mI0PtL7OEVra0Ko7EEU/N5T4bSfWk3uf082vF0Zjv
         ZGzYWHfIOs1iYBTBPcxYVTAcCPw57nbEyAk18BCsfp8CsPxZSS/Id19dOUTvjWmwKvp9
         rjuA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ1HnrAe+yF7J0jXH/3e3vFa9pn7TPaotvRPyZGZcPs0NYl+jWLViOECwru0C7ZWtmDzNOMJthPq02YB38@vger.kernel.org, AJvYcCUSqScBygIcSlUQJaXb/2jUp//Py4DPrwjLhV8EGDJXe30yTkH5GXDEUsQ1S/nNzcR2jM9hChp0bXUu/iuJEA==@vger.kernel.org, AJvYcCV5sY+XrZyCnsZWHPopkpqFG8XFf1rVHEiCKwgQ6zIK/sI70AQmcK1EYvOviwjOAjHSc1UbJAB803uj2b4=@vger.kernel.org, AJvYcCVynmWObn4HlH5ry5nwFSoPcgQ39yoCzRZL9Bp3b36yx6pJdnYlO5kb35gmTMGmWyyNzX39Ehdt3Ld6@vger.kernel.org
X-Gm-Message-State: AOJu0YwdGwBDVxyIdxR5Ar1nbzvolwvndizW5qZ7luO4IAkKb3rBRlbC
	MbuxZk9LtY+Ek365LFnMFoG+9qyjmnnb6yoeQB5louzbks/WMaH/yDK5kSvLd4YfMWPf8paMpte
	AXodhOONcpAPpaD1sEpuUJg15dG/1/Po=
X-Gm-Gg: ASbGncvpIOrOLjWhirG6S1vJC4E1M45eClxemcgKACHYj5DCuBeF2nb0sGTUgRbeP5b
	VrVPpIuCBrJGQizTuZJzhw4a9QEmesKJAWEibhR0nZx6C2y+AEcd67EWYe6O9LZaJhZBXDLrAPa
	ycPedmxyamyQp/KGiwJ/sxQ++MdWFyLTcspZ820ILFSdq9MGv0pcZ9v6YtRnrYp6tkL0pvYppJB
	oKX
X-Google-Smtp-Source: AGHT+IHr9J8+h+AZ8STPC1y2/qEM2ZZcXzahpAeXjwcKczY154NqfHQ6m3ty2wKy8w/H9uZv/VxmB7VQvs3K1RzoMLk=
X-Received: by 2002:a17:903:234c:b0:235:779:edfd with SMTP id
 d9443c01a7336-2355f76c215mr179533115ad.39.1748974606365; Tue, 03 Jun 2025
 11:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-1-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-1-724407563997@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 3 Jun 2025 20:16:35 +0200
X-Gm-Features: AX0GCFsq34ioWPbcIqxTayHSRdJ5z4uSRbOfAewoz0GwtzdI-PxfH0Fpo31M6tA
Message-ID: <CAFBinCBSyniWtR5T3XdgohG+n0Ae=6tgmdASSxsnsmoQV4yhQQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: mailbox: amlogic,meson-gxbb-mhu: Add
 missing interrupts maxItems
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 1:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Lists should have fixed constraint, so add missing maxItems to the
> "interrupts" property.  Since minItems=3DmaxItems, the minItems is implie=
d
> by dtschema so can be dropped.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

