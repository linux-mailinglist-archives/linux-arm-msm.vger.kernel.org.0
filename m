Return-Path: <linux-arm-msm+bounces-40099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8B19E1E72
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 14:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4E82164B89
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 13:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E210A1F1310;
	Tue,  3 Dec 2024 13:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fl+HyxFY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AD11F12FC
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 13:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234268; cv=none; b=Zrd7xLXKWBemb3axMZOEe3bkQSr2ZEP4SQsRI3Q+nPCr7+ITbhtLBteiT0LGVCauvt8s6iW26tt4V1juwIGnWyQ+5xmwp8JDkLhHklj9kCj3JFzx/4D7HfN8UVykXgbRyMJkL89x7pnWKsyJqn6Wnx8ImsKhQzEQR3W17MQUMCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234268; c=relaxed/simple;
	bh=rYvvBdg8fi4Xr/3R+nVFs7fW312NlcNLWvE6GK67uZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MynMegf+wnM7amjF258RCGrNY/bgP9qQdwtd/Ef/VmO48MTi0YZbplwtyTlbOI9C1pvyi+z+0aovWPu1YTRhYwBC5eqT95aLiAEta+PICkhBo9RWn0yhPQsRQCE5A7MD2OU3ssjm+qN5CNiIEHgmGu6Dnjul9oPwV0KQhkUeR7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fl+HyxFY; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53de771c5ebso6539289e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 05:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733234265; x=1733839065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vma/aVgOijobBlFAdjamC8x1tA3Lu2jI5+iEG7pb/Rs=;
        b=Fl+HyxFYW+x4I5aqYjjuCRfwZjrlx5AD52TR86fq15vcJGuthMvY0T5nbjIxdgek32
         xqQXEEOi9YZte0gnhnDQGK7EUPruhor8bp4WZpX3+3Ib5bDTo9s7jC1xmnN5eQr2QPlq
         bNZeCdmTyJKycEofHFFGuqnN2XcmTrVKGZq8kf7lTZYpsfCPKt/LdOx1sgjri/QsyirK
         Z+R7NFqjgNoBFUDRJV8tb13T8z2ignlBD2r4FytBTiHTpjgcFfGKytV75jweJ3+Hq0T5
         3ZlGFx0f5R7RiJskcxFrIFeAJQnpniQpgBPl3bUdrzXcFdzzYmpsiYwFi1LPa1bPIA3j
         lEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733234265; x=1733839065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vma/aVgOijobBlFAdjamC8x1tA3Lu2jI5+iEG7pb/Rs=;
        b=S1FZnZdbrrHTLhrgoz3WP7AgYgvx9KWNzwBpcn4vdjUbyMwrFvWEHNCRBX8+AVcYj7
         ri5JR5gc898jIdiZHE+KDE7YvZSSwVhlRqzyh97q8Wud9eJQN8eUXfyIgIdMsAP95sS2
         Be2tPkmfQ5EUoxY1decEbKamUe7jzJETBbXdxj5wkNNoeDpDBq3DaWiB8e7mAnf3FVM+
         vYpVkdM/pB+rVF+ADjybBmTlAKzkSqq7GnE6hnXtGZfvoUrdKkpDZ9NGt6AfKX9grUPZ
         wlYzqELfEjjNLa2MBNoUZ7SSuNoJOa1G/MYnFOmkzmQeDgltk/vO2DRxGFpJarl8z3os
         pPCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKVPmT7H4w2tu5HCuhY+MRPq8zrphGCPqrzdDLT2sFRZ7nIR3pi6Zp5cGI/M7b00+wuNpZHh7NlZPghAsQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxsmDmcCjEXhHAVZYPfKKblv41V4hEhBO/rYWKIa1EyVtTHCrG1
	6XJgLndm7T7X9ulgC5FacPow1CywYZFn1/OogYQTD+WOqeV7F+KhjQvYau2xQFg=
X-Gm-Gg: ASbGncu0QOKH9zTm7RFQyr98Ynx7VKRrEwiNrgS9R3eszNnPu58iaML/2phMynhsCWj
	E2648dmSHp9ujKsEuvwgBuRJ4Z2416JtoP9BtcKsO/mGS/zXvTZrvfYy0u6q3K5YQQS628pVl8x
	g4822c0a/GGwZsLWEksXRYFFgvoRhCsGw/e5AstyKJdkJCM6rsY/uGEZCz7e3K6WGVWWp3o9VoP
	qTZCSW3rvwEvSL6SFcvvgOGNfyLGS765eCeYDkYvlWbIy38+itRdJ/J9OXRoAGnA8sWWalhWRl/
	SH8G4cBWzs+QYi0gjdaQSDg4Fhidhw==
X-Google-Smtp-Source: AGHT+IEWu4ApKaC7Ta4KrqQTWekPko59agvuRUFXVxJooAszNQZ064G9g5fn/NzI3dsNUT1RD2yGnA==
X-Received: by 2002:a05:6512:3b2c:b0:53d:ef6a:17f4 with SMTP id 2adb3069b0e04-53e129cc3d9mr1370082e87.1.1733234265135;
        Tue, 03 Dec 2024 05:57:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64432b8sm1845404e87.90.2024.12.03.05.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:57:43 -0800 (PST)
Date: Tue, 3 Dec 2024 15:57:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: power: rpmpd: Fix comment for SM6375
Message-ID: <rcoo6p56lowzbkgci5umhg3xd2hnp6ledk74ys3hw2t2il22nw@bcbs4zmcbzgn>
References: <20241202-rpmpd-sm6375-v1-1-12a4f0182133@fairphone.com>
 <yo5cc3cvvwwdrqrrgwlquztj52sijip3ffyyqag55jrnztxi2m@hn75ylkhnxie>
 <D61WIF2XWKL8.MWU6PK2XGX4F@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D61WIF2XWKL8.MWU6PK2XGX4F@fairphone.com>

On Tue, Dec 03, 2024 at 08:52:59AM +0100, Luca Weiss wrote:
> On Mon Dec 2, 2024 at 9:00 PM CET, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 04:45:02PM +0100, Luca Weiss wrote:
> > > During an earlier commit, the comment from SM6350 was copied without
> > > modifying. Adjust the comment to reflect the defines.
> > > 
> > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >
> > Fixes tag, please.
> 
> I thought for just a comment fix it's not necessary / desired.
> 
> Anyways:
> 
> Fixes: 2d48e6ea3080 ("dt-bindings: power: rpmpd: Add SM6375 power domains")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

