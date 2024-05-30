Return-Path: <linux-arm-msm+bounces-21121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 834288D4E0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 16:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AE1D1F21B2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 14:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3CA17C9F2;
	Thu, 30 May 2024 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bc6FuVwV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F04169AC6
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717079671; cv=none; b=pKkITpztCKdv1cCDDGu/eTXupD29s6jSbPLxwKvBqPv3QybqUOg8PgOauRyKq4fXwSA4TP/80eJiG6SHPUCtInduhOyYt8WHfKFsTpt/CPwl2+ER5DoNmwstmaHUofIhfUwY3EORzO7o0BLWNFQ2Y5DMxlBMBsUdN6xkKS46vds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717079671; c=relaxed/simple;
	bh=Lwga7v9P8IhYm9C+t/qXY4lKZ6jl1JNqRADDxFAQ/SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XeZkcMGJqBi5EwAui/WRFfl705LNGD3UKBCM3OBMwJNp/C05mgdyNEPcUZ5MR0xFFp7WeduhEWU0II3m3kWo977vg/zb48xlYMOiS8kc7YppxYOeZ14Wt/HZw+xYKJSUp+UgYnhUJ37cd8pTyfV4XJW5U5ct5nQDTB/0IrlAhvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bc6FuVwV; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-794e5e77ca2so66755985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 07:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717079667; x=1717684467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hX/wC7qXXog0qac360LVKqW+SM9R51AMBt2HpIW0OBk=;
        b=Bc6FuVwVgiLqPE14Sa5vCiTBbos1mgQtriWfQL1f4EDQRLpnywNpzCjucYYZTT4T7C
         V0O3Ijg8qDjY8OM7Yqrtb3y/WW+1Nu43B4XioVWgki0/ZOLj+f3wVoQN9rjoe6aPVRtq
         hAP9I83Wqw0CL1408RbEWUNH6PKCcXjbLQCII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717079667; x=1717684467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hX/wC7qXXog0qac360LVKqW+SM9R51AMBt2HpIW0OBk=;
        b=LnxndmekTgeRaHFthDr6wGy9+pxTl5Zkt+3Sb07/hI/HyQp2DAChpPga2/JBYCguZR
         j4LBs46iG2lFTuhQLtvJ7QBueZog6p+OLMR3A6lXH0Oy9YzP3XXkbvqM3ozheeHJS8zl
         VfwQKN80S0CJhioMhtYVADoIWxsqY2BpSdJrL7DXWQHvg2mgxSN82awppBHIIcCsf4nb
         swuVK+3hs/bvvjZ0xKMm2ROuySBtj9Ns2VxAfNi4BAXAsAKPwLA6bUvq2xcl188ftAxb
         wppQekIktFOjq/dNJMDYgnipCbFVZ084kPpYSsNefvqSvSUKzfoB/SrqlyytxJ4b1CMa
         dRVg==
X-Forwarded-Encrypted: i=1; AJvYcCUavzYlRUizIiF8r0Yv52W8P+UVx0at+/NmxvhxsSsepeuI7c1iWWzwicJOjiU6d2ryP05awET7cnbge5sGn/jbno+/0OKed6CaCPeZ2g==
X-Gm-Message-State: AOJu0Ywa/4Mo6tlF4GJ4ZfwYRVl96Ry5JA13WLWfpcRBpNglhbg51nRy
	owZFJntZeM1JWu1oeF1x+x5ZYxwLJvGr993uVqZC/AE+2CUxF0SvRREVRl8yLWJCZWD6/ht5Pq4
	=
X-Google-Smtp-Source: AGHT+IH3vkwVcYp1OEC5dk1FDb4etjeve2HpKimXKzZj0RtQ7eRh/aUneLKoilQ5GoCfCRkE9dfJMQ==
X-Received: by 2002:a05:620a:934c:b0:793:1b3e:dd19 with SMTP id af79cd13be357-794e9e32c8emr233148285a.76.1717079667576;
        Thu, 30 May 2024 07:34:27 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abca58e6sm558746085a.18.2024.05.30.07.34.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 07:34:26 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-43f87dd6866so386681cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 07:34:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX8O7+NJPtSo1pCBvM+I26PI5GEF6G3ln4c/Gh9BGWe5mSuYQdy5esyjQJNsiBYWAI5wvnqVn1iIKyWSMOV5cGRQ/yeEmJ0oyj4wZQmeQ==
X-Received: by 2002:a05:622a:260c:b0:43f:f0e9:5f25 with SMTP id
 d75a77b69052e-43ff0e96040mr383391cf.25.1717079665507; Thu, 30 May 2024
 07:34:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529-edp-panel-drop-v2-0-fcfc457fc8dd@linaro.org> <20240529-edp-panel-drop-v2-2-fcfc457fc8dd@linaro.org>
In-Reply-To: <20240529-edp-panel-drop-v2-2-fcfc457fc8dd@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 May 2024 07:34:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XjkuRQ_bPYiNi2Jab2vDpegUBA2PesFfix5NgvF-pF+A@mail.gmail.com>
Message-ID: <CAD=FV=XjkuRQ_bPYiNi2Jab2vDpegUBA2PesFfix5NgvF-pF+A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel-simple: drop several
 eDP panels
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 28, 2024 at 4:53=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The panel-simple.yaml includes legacy bindings for several eDP panels
> which were never used in DT files present in Linux tree and most likely
> have never been used with the upstream kernel. Drop compatibles for
> these panels in favour of using a generic "edp-panel" device on the AUX
> bus.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml        | 10 ----=
------
>  1 file changed, 10 deletions(-)

All of these are fine as per my research [1].

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/CAD=3DFV=3DXz1VsF8jG0q-Ldk+p=3DNY-ChJkTk0iW8f=
q2bO=3DoRFvXRA@mail.gmail.com

