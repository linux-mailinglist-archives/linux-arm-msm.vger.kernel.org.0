Return-Path: <linux-arm-msm+bounces-85161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4479ACBB447
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 22:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C5BD30019F8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 21:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0397D285CAA;
	Sat, 13 Dec 2025 21:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tk22ue/E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79163280329
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 21:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765662761; cv=none; b=ihKN5hjkuNQa38O6vQZ/pGp7fOyvulFnZamgWaMn+oIsUnNinaAlrBGs39SHEgVScsMWwZpFLQ3o+Nr5r4YOZsoMswg+z0w9VWC09sKSY0GVVEVf5b53JBL/NY9REdX36unsy7hph1rlGExrohsimvAgbdw1f3+5g6QbRpMDyQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765662761; c=relaxed/simple;
	bh=MOrv8Z468pz42F7Vvd2hP+rc9j/1X54/GPGCIfRTwL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHt5WcAlASwgAavX29oD9StqEtj9+TbjMOztnrEF+NDknUO6PE+QWwnv2Ye3RjtAjAXjYZwTvrHa/z31GyPZ+ZToj3qA9gUmeg9BzFSsy0O+6e1SLM6zhxvSzSBRpV+YlA3FMfIfpmd/ew/E0IQL7v9tPQvB/ifBk4nzNbDLUU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tk22ue/E; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8a3eac7ca30so166711685a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Dec 2025 13:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765662759; x=1766267559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0vmpfVrhKRCeQv0RKMF2hPkD4G5WVFs8+IoJsGJYwCQ=;
        b=Tk22ue/EZPyVUX+ppacY8yOIiMdBQwT5vrLi6BbR+l2HyDp3K8OsXqTTvRq3W9HfWo
         rAIgeiJKdtVK2UsK2t5lwPPlTAInbJD2WIhcrJ45X7kKuwZBvvI1/85Q+f1g3sY2ijty
         NlPlXrbJgnakpEFHuhmF/GD7wF0pSNccpEdTPIGP+J5ldhHcafLAU9qY55MuptgIft2Z
         3p0gqZh9mnNbR8sEbDJEKhRt5KlHKzkEFREMLlFCMLeODDVXyoGN6APvmoIIhoeOcMzd
         Nomddglb4/NW0Kqdhqj3lYLP7SKJ7CcGCq5nA4gBYwXPlVLlyrqrgNCQBa+5Nc3wgQ+I
         QGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765662759; x=1766267559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vmpfVrhKRCeQv0RKMF2hPkD4G5WVFs8+IoJsGJYwCQ=;
        b=It+UHBT6oyPHYNkytWLLsuowyApUGyZ3iY9etkmULiIb3+JcR4BSYRZKJ8jmn8Chlg
         laH3bRpSEgLlVNZzr5Q8yB/MLwjz/UIt42v1JrYQLwOBMpZX/tB9Gxmos6yrLsHc7NwU
         6nBAcPnknmodqZfxlfdW0wXLe4/6wMTpnpBkMyOQbmVEL/tDf16kx4vPqJpVGzKVS7oX
         QKqCUDVp0IbSJGUHb/G3iU+GfS7R3EJIoMzzETBcB+9RN5nemJvboXr9x6cmfdvj/lJp
         GTnJ38yTgb2RJzlTn2diGlqwwm+QGmKBR4vSz/SkaBIZqQbubGW1A8XxCGrjaAkyxYkG
         ey7A==
X-Forwarded-Encrypted: i=1; AJvYcCX/I64xMUwtPakcxBjKTrlLwwTjtpTK8uFpVJhb7+x37VsYilx858dHvrO9jMtGE1hcKuyZqYduOvB0yJuk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5u5EeaoDeHiGU2NxyTddSMjWDidbplnlnVHonIyI1uFqpj2P0
	kmarXtMO4Zn4VCieJEfXvzlJd/v7yq/WZ3TMrE9hfSd5ZlgNAC3bKJPz
X-Gm-Gg: AY/fxX5BWkOA0pF8hr3fveyDgwwzvIHE2sc3nuNz5UTXv/OsoKGK3jMPZEVfd5QmQfN
	m3C2BC80BIyk9r0SbHskcJhN32VoUuGIFY4KeBI0ru6trt5+JjM+o+mdm9DmTks6cBQB1xyGN2Y
	VJl4YZw/3KYgRCDqM2SkIsoFVP6fISe+bx5pExFcdZzFHGtg4Zo2WoUt2fjQgNA7rpcEHc+if3t
	EwfTcN/Z0rd2RXfNkXZW1MjNFN7aHnuXFqLEUGVhVZMJSrdjD0j6vUVuFohJuZUZ8/pvyLWQRyi
	/bmAV45XOwkrzNjGcgwnjDfbSqlz398Otw8dpaMjr5pkRzA2c+YnaLGb2o612OEuF11AgiiT6hu
	r9MC9lyooaLSre33mbSA6D5S+N39Wu83Vx2tMR0GKt3SL17TrUrBvOqA9nDh0lPyqA6A6OcwhNl
	vZFlIoBS/bQ3v5dQ==
X-Google-Smtp-Source: AGHT+IHHh35U+sxh3+imqr2OZ78va01JS9YvuTHyoO2ahBYtY2IepXHUI8Y0tIiK43w8obVA7scckA==
X-Received: by 2002:a05:620a:4508:b0:8b2:e179:febd with SMTP id af79cd13be357-8bb398dfef4mr1038221585a.10.1765662759216;
        Sat, 13 Dec 2025 13:52:39 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5c3bd4bsm744693985a.32.2025.12.13.13.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 13:52:37 -0800 (PST)
Date: Sat, 13 Dec 2025 16:52:51 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: i2c: Add Sony IMX355
Message-ID: <aT3gM5eSxjNRDmRW@rdacayan>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-2-mailingradian@gmail.com>
 <25c8ad84-2a3f-4e09-a32f-8af68379858e@linaro.org>
 <aT3eUlQuwXptSFGD@rdacayan>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aT3eUlQuwXptSFGD@rdacayan>

On Sat, Dec 13, 2025 at 04:50:07PM -0500, Richard Acayan wrote:
> On Thu, Dec 11, 2025 at 01:02:49PM +0200, Vladimir Zapolskiy wrote:
> > On 12/11/25 03:48, Richard Acayan wrote:
> <snip>
> > > +  reset-gpios:
> > > +    maxItems: 1
> > 
> > Please explicitly document that the reset GPIO is active low, and make
> > the correspondent dts changes.
> 
> On my local copy, the DTS already specifies active low, and I haven't
> changed it since sending. I'll just change the dt-bindings.

Oh nevermind. It is still active high.

