Return-Path: <linux-arm-msm+bounces-94188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKNXDIJWn2mIaQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 21:07:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8450619D0C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 21:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D2173028EAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 20:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7B22D5A19;
	Wed, 25 Feb 2026 20:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQ3u6Q0l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD0014A8E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 20:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772050046; cv=pass; b=XTGt7bqmGctM5Kv8slYRVhOxsJNCr9W5vs4LIrqs3OFD0UTgoXq3HvvmLaHUaI2r1bEeeiTh0qyecr57mGmTWLwtx9qFiJFB+uJUzuAQlqy59UGvhYQksOs9cKVx0aeInwOuIDNwe1TnlGDj6oMD43KSrMR01IXMbkwur1AasVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772050046; c=relaxed/simple;
	bh=8b/vlFFpL7CJfKxCH6fo9uCkw3bN2kaYlhwt61QcN80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=czRb8dTRuTWDNFTTl//si6+F0O7OaY/7+MgAuh2267Sr3lBR5RQTtcgVe0t/8iJFGY/G9+RNa6LQrhwYs3bnROOUhA8woWFJSEsQ25jtTX2PemdcgMq8XYhXMR019TQBuuxRVVEsI/YzYwYxqv/VhbN8vJgC1lgQI/ongcfcFaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQ3u6Q0l; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b4520f6b32so59441eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772050045; cv=none;
        d=google.com; s=arc-20240605;
        b=A7PpJBPEXImb88M7ebkoXzrak/jFO9OW6ukmY4DbdAby6XPOfUdIdWjCIXnZs2HSul
         hAS0IEeDloLafmZviCweNf5SkaQJiVFKSe/RdMBDIEMJ7N1eGjgRUyE5Hg6K2Q6vNxn5
         +B+hpAL4ELKVEBmUec4dj8fPxMsR/X1Q0BvwC696UFId3HuHomoPanmQ7nc4+THIwN8L
         i2iosyWJqxqMADl3pc/VdGPxw7nVqN1ppFh16nv8A17yMkxn3db8MZyvGoOFp6KznC+0
         0ohqpzPnQ43Ic+G+dz2ioa8axaMcTHulQtHC7zqW2FcZPO+bjxgZSQDyLm92ljlMoEbZ
         wL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8b/vlFFpL7CJfKxCH6fo9uCkw3bN2kaYlhwt61QcN80=;
        fh=v94pw+ySzJBrNYeAS11BgDk3WMp3z3TPU0NApdjx7eY=;
        b=Q8dI4c4FlZOSxVc0WUMBv5Ny9lEXvgbujCW0892FqPbov+Ejid6FiQWkc8qHtOb7h3
         WiaxY0q7jnlTQ5etw/QMvFvN23bBgS2tCVYjbJcXJpf7i8iJVliSBqirf27g6wCHohnf
         zFfItZ+i9XjE0eU2ktR+wSwyXe7gS58j7rsg3nbapNfImGl4bmGkruKtssitFTgQtnV9
         8K6TpByiolzaa4aTnB8+KYTzAdwmd/fuo8CefEob29vL6iKnsuTqf+vFdLF6tPHyQFbQ
         IXQnNPrYhJObcgC44XI2c/Wp5aWo0C0OtPZXOGv3lShcGWd6VA0tjNpcH9odW6t9ZLTV
         mytA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772050045; x=1772654845; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8b/vlFFpL7CJfKxCH6fo9uCkw3bN2kaYlhwt61QcN80=;
        b=XQ3u6Q0lQ4L3rHuzOerncBsto547HY4xJ6iyiqvyssaP6lGg8L1/SJu+SKfjPEqgaM
         78mHFdkx9kGfZ4cGfaZEhqRE/S/Ws9xnR2bdm77ZINh8UlBajYwqIowlyzb2NU6iXxm5
         ZxucNelikyBhgA+GtF3aU4cyxzaUBhgmYMYH2RntjcU+2RPzhsAoSTzKCBeYcbxLsUrd
         8854k1OVH7zk7b7Pec1sSl0bueMYFYCrnfXddfRnLt5orq2DoFHc19nw/LKPXLceOgud
         uZSmPtmGoyaiJ5ShsVPZ5/YnJ5Cj+CHUWnzH1U+0dA6fa+63qxBkitOivmlhDy/D/FeK
         vBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772050045; x=1772654845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8b/vlFFpL7CJfKxCH6fo9uCkw3bN2kaYlhwt61QcN80=;
        b=njwrrm97AOfV8meGWjYt/aPtvxe1mDTzf1M6kESEVuVyiW69LMYOCr5lpiCElZeZKZ
         Z2qwNfsQ9DJnA7WJqEyKxwpMDN41yuBBYyM1vXrM4Tv37jxG36uwR6lr2lyp897MVxMh
         Hj/ZpprDIc4+CGqxRLTrrZ3LxNPYdCEGoeymQ3Klco4uo//vBJw0zgvKCJbn8zCA11XH
         Kscvxepy34WbW46uUPPTo/4vcfHLDYxXmsmL0j0rLLKl+gfLlppMWFo3XVQvkhafuapf
         csFg5C0QplGd0WJXhqNDSScl5PGy12jlxiAtRK79cy3mlXFGPnZ6pD4m2ixJ72/Roe8B
         +cfA==
X-Forwarded-Encrypted: i=1; AJvYcCX73ZcUeS+SSuvu5KwfjAVoaZXEuEJwZ/KirHG7BLrGhGpOgu5xj1TySI6VxX6ugUOWztZZJcaHqUYFcnMn@vger.kernel.org
X-Gm-Message-State: AOJu0YzRVt/t0VlNaJ04Yz1vlZLqHppbRBcr6vgApa6XLB0RNnwg2KxU
	yFyxZHbIl9z6IuL5HrUYrn9z2Xi2RIOe25e2KEDOoKzyJaGpAYfmlniIT1zo0hHqnvzqwa01MzQ
	ohUIqacEFRPmf6FrFw8LcQW2Le237QOU=
X-Gm-Gg: ATEYQzwviIRdp1sA+I7GdzgAHkMPMzLT4cJome+sQkeyEM+v7LhtHErwZGDjsvg3fr/
	4c7s46eHgQYqA04DyFUIo/A+83Mez6YfCOzV0Wav1pZTauMJLRPVisyE1Qn7AQ7E/m0iUIlO9MK
	DYBlSob401X3dLsVfBigIFFa8JTPV8ZFrE6ckjLCwcDmFcqNze2UQxJSChZa2bw62Ptw1jAshV0
	QUp3ne7mrNj4e4W4EuV8KU/up5P9CJrJJGNo5JxYz2fRZrkIfBhHd7hD3yhcGaRzT5ji5cXorFI
	93H83Gs=
X-Received: by 2002:a05:7300:134a:b0:2a4:3593:466c with SMTP id
 5a478bee46e88-2bd7b9d9839mr7568138eec.8.1772050044982; Wed, 25 Feb 2026
 12:07:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com> <872fddf3-959a-4fd4-8f93-cafdf8414ef7@oss.qualcomm.com>
In-Reply-To: <872fddf3-959a-4fd4-8f93-cafdf8414ef7@oss.qualcomm.com>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 25 Feb 2026 22:07:13 +0200
X-Gm-Features: AaiRm50iTeIljUJY3zqhpqdL0DmyOHNEXBH71A5lwURdxPgX0-EwH6M5va7Oca4
Message-ID: <CAHuF_ZosFSDRk6Spsw1hnFea2+Zx=c0M0STvKTvhFC+85yV7Sg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add support for the Samsung S6E8FCO display panel
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94188-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 8450619D0C1
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 at 13:50, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/23/26 9:26 PM, Yedaya Katsman wrote:
> > This adds a driver to support the Samsung S6E8FCO display panel found in Xiaomi
> > Mi A3 (xiaomi-laurel). The driver is generated using
> > linux-mdss-dsi-panel-driver-generator[0].
> >
> > The mdss reset dependency makes the screen work more reliably.
> >
> > [0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> > Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel
> >
> > Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> > ---
> > Changes in v2:
> > - Changed commit title like Dmitry asked
>
> You got more comments for patch 3 from Dmitry
>
> https://lore.kernel.org/linux-arm-msm/dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme/
Thanks for pointing it out, I missed it. Responded to that

> Konrad

