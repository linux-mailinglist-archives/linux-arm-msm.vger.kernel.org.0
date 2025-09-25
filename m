Return-Path: <linux-arm-msm+bounces-74921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7DFB9D7CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 07:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 721E31BC0918
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 05:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9D02DF13B;
	Thu, 25 Sep 2025 05:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2g+S9br"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D588A1A23A0
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 05:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758779143; cv=none; b=lYX86M9Aw3Bh9AUsgFg5szCs0YcXDVU0zH/jXaMU5qq0JOVZ/OT7VVFYBSpMMJtLBDCZ9kPcGyToNfBavIOV7+AypBWoKLLMnbfA7qPPHdHgisNor3Noiz2wVLwS6a3heQRVH6Hkbe6mEgJWoEXjmlDsLCZr/kE1QHhV3Dy/+wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758779143; c=relaxed/simple;
	bh=y91CveNU8o61qRzBPIlmeKWPSA+K8ejO5zowlYxLNPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhhCuog3SAK83c0AFlwFR4NGociW6uANTKImBcghB3b6YfDH6Kdi5oG3UDaO+AozH4ckHScuv64FsKefjOJ+bZKEfoQ9xuydgmkzEQE7/1dpSUr+xS/5evIYEJvFfM8onoMY9guFoum8fO9n4VUC7bWCNJ4DNk5uH/ty1R+LT3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2g+S9br; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2445805aa2eso5798075ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758779141; x=1759383941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Q6VyKRbOn4TYUtmAcOT7qWbJ+MHx1s5wBeVwgJ07ek=;
        b=D2g+S9brKnGuc3tx2zqhfvgvLwLrlqIElr36sUgjOi2lXYO9iKupEG061yyBgpjEXE
         iYYfg+Q04QFqAWqG0Seev3IcbNtm0hp2ePi3TIQX40lTVixf8M5ehqbHhpst28B+j6NF
         ddfvCOIxD3dsbmiaR8L4D8h7Wc3smbzXwJ4V7uX6zj5g5QqbFzwE2Qjs3PqjiDIuWdH8
         ygrxPsn7tMn/0l/yfSItt2BBEEW0WEO9D3pqG1Hzz38x4SLn/WATbRCvGJVIUCdNNjNn
         OKIugOdp8wcnEEaWzl+WpECE0KTR2vu59zqiPn+V4UpaFEilHMKxnMosXUd2OTaE6EPk
         BgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758779141; x=1759383941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Q6VyKRbOn4TYUtmAcOT7qWbJ+MHx1s5wBeVwgJ07ek=;
        b=qpJXUtfcjjT9FBeTp6c+Hw4LwzSfIWTY4Am5lw68g1kGqKNiCv7mAQ/aqubtVo7zZ5
         1nA15ilxH6R7Gr5lK0IBp32gHM6+B3daY8nLNvIBbmCHOUliEVh0N7NZEFfKtN2g1SfT
         qw2U53w4A21joN3nzrgQxTjUw8DhcUWRj7oOogze2qmOim0NIVW79mJFrRKizydx1f0s
         +5JGvYjTwnS7mP3oaXRCe6zjdErNscUOxTTkaqgPkmgzVbLPvL0liiqzJ8v7ldvXHvcj
         nXo/teLy1ABEGYtKlpHj3ujhTKKS6bpXZf3cm8dEUGS1uLcCVqUyPgNYs62GsRW5mkKg
         v5Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXkRKsw8jn4Cazi1hfbEzmhXPRrNYcpP5MWzWtBKl/4hjM8n4xp+2I17L/iilyTsG8Rfip+IPg/BpaVuPya@vger.kernel.org
X-Gm-Message-State: AOJu0YzRkCvKHHBiwbichWjtIuVIncKdT5fVKPhcBdx9AoK1nsa0lwfy
	CnnFaL2R85hs8OpWW7dLBfq8T4bJZ7emyAw2JbOta07hrCYZlVZ6RlmB
X-Gm-Gg: ASbGncsnHRq63veBhVBMS3GLyuIGi9XYol5s9Dkx9trm1qkhCRhu5y/E9a6xquFZ0nC
	gcprxIch5yhUjicVZFZKvqjuoW9ixPmOMI/CoeTsbkLeCKXtn7k+2gnY+2bN9ZYF61Nn+33ds3B
	n37TbvpfVHgB/BeyfU2vHK1Z5Y/TkDkCdAHR3T/Y2lbgXmz8c60+gOlqrdsC7WDBEdbKHBGli6D
	IhFZVAGcrwqsiXdjVCdnRPM29cVrlJSUV45q0lB+cioAODq2otNtgkA8NhRGtvS2fruRBq/U/h1
	q+zeeHz4WTMtn9mI1DZRgLBnLSe4Wu3t/bGArfBWe8UhjIqzrnEGBE7ul/g5/B0bWPdPLbeWSx9
	FQ9uatKGXf0Yz70i4NfTdaukFaF0w7tNE
X-Google-Smtp-Source: AGHT+IFHyxcxK4Vd8sIGKGdSk7wQBBMmiacmoNUDPi5/Fxp6WTX1EZgpGu3p+r4H5CbHYpbKWFBz3w==
X-Received: by 2002:a17:902:cf0d:b0:27d:69bd:cc65 with SMTP id d9443c01a7336-27ed4a96a83mr23489065ad.45.1758779141061;
        Wed, 24 Sep 2025 22:45:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5a97:14cb:a5e:6c78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671d8bbsm11739105ad.59.2025.09.24.22.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 22:45:40 -0700 (PDT)
Date: Wed, 24 Sep 2025 22:45:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Courtney Cavin <courtney.cavin@sonymobile.com>, Vinod Koul <vkoul@kernel.org>, Bhushan Shah <bshah@kde.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: pm8941-pwrkey: Document
 wakeup-source property
Message-ID: <3kww5et2q2mqddpvtqzuj3jqzvfds66qrufawcmumamrqoaugk@tiq6zoe5psom>
References: <20250909-resin-wakeup-v1-0-46159940e02b@lucaweiss.eu>
 <20250909-resin-wakeup-v1-1-46159940e02b@lucaweiss.eu>
 <efb03993-0481-45ed-8f7e-8b65519a55cb@kernel.org>
 <phctwoxml7hscwcgaipl233lotnrkgcpe7rxvhm5syoiadu3lv@ibgeib4kjyhs>
 <9e39f1b4-63b2-4c6a-8b31-6360be1952e6@kernel.org>
 <dcdbc6424db6953dfc39fc05e0e050ab@lucaweiss.eu>
 <kxgvebizxvlflu4qen3cb5v4lcuydmdixvi7624hrggo7f5u5f@zbengtjkekfj>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kxgvebizxvlflu4qen3cb5v4lcuydmdixvi7624hrggo7f5u5f@zbengtjkekfj>

On Tue, Sep 09, 2025 at 07:54:33AM -0700, Dmitry Torokhov wrote:
> On Tue, Sep 09, 2025 at 04:41:26PM +0200, Luca Weiss wrote:
> > On 2025-09-09 16:33, Krzysztof Kozlowski wrote:
> > > On 09/09/2025 16:08, Dmitry Torokhov wrote:
> > > > > >    compatible:
> > > > > >      enum:
> > > > > > @@ -36,6 +33,11 @@ properties:
> > > > > >             pin should be configured for pull up.
> > > > > >      $ref: /schemas/types.yaml#/definitions/flag
> > > > > > 
> > > > > > +  wakeup-source:
> > > > > > +    description: |
> > > > > > +           Button can wake-up the system. Only applicable
> > > > > > for 'resin',
> > > > > > +           'pwrkey' always wakes the system by default.
> > > > > 
> > > > > 
> > > > > I'll fix existing code, so don't repeat that style.
> > > > 
> > > > If you ack I can reformat on my side to match the patch you just sent.
> > > 
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > Thanks for fixing that up Krzysztof! I noticed but didn't want to deviate
> > from the style just for this description. Of course better to fix the
> > formatting in the first place.
> > 
> > @Dmitry: Maybe give this patch some time (1-2 weeks?) to gather more
> > feedback,
> > given the reasons outlined in the cover letter. Also on the driver patch.
> 
> OK, I'll hold on to this for a couple of weeks.

Nobody voiced any objections so far, so applied both.

-- 
Dmitry

