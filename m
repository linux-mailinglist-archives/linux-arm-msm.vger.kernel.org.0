Return-Path: <linux-arm-msm+bounces-29809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 766D7962E1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 19:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C5041F24C46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 17:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0702D1A3BD0;
	Wed, 28 Aug 2024 17:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n/3I1wkM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B55196C9C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724864623; cv=none; b=T7zjn5BqQanFyS/j9EFh0e7Iwv4yeiRr2fR5oFy5bOYGne/c2DOyyN2sB9mDnB/FRCMwebfMRNdXT0JH/1/MowuHN8WBelqt9NKLaUkpMKTSnSVkMgjP9uixI2fbOpuhKLSqeYAaGIbwLDASBXhDjzDCCF90UTugI7JLb+RBIlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724864623; c=relaxed/simple;
	bh=QasJiYQ1cDw/pStQicO3S8JcebgaLLR56R+OjX3L02Q=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTrRKY8quIm4sJMArdnTHIMlAyiUFTDLq9ffdQTR03UbEOKRvZitF5WPmLkx1sWi1wch84aFfR0EpRwBCGFrGiTcg/robHnbhR9+46k6PMm6iWfMUsNmPWtdf5fcJyB5DVwcocFP2Jvs11QmK1KtIexnccPf5ySch62qiACFn6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n/3I1wkM; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7a1da036d35so441960485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 10:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724864621; x=1725469421; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QasJiYQ1cDw/pStQicO3S8JcebgaLLR56R+OjX3L02Q=;
        b=n/3I1wkMOKH+bGMxL+yQlzYfp6qROm3K4v+wypIb2F2NGydGx7NvkwnFFoECDVTYPm
         vDoA97XRSHkf9PaWXySsakpKfQbooUxWJHeNLg/veERRbwVvR0Bs3REW/8wglLdHHV5d
         b38bqXOLIpis1bpZC9cMiuA/maV5T3pWaE4Eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724864621; x=1725469421;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QasJiYQ1cDw/pStQicO3S8JcebgaLLR56R+OjX3L02Q=;
        b=k+urA7UhQzghcU8+MkA6xUApUbk7I7J2bLgiQgh9xketQFGxpkX7wUitFj8elDkc43
         WikLbOuKW7YLnwySV+gYBFLLIGi8whc1ym+K3VqBKqJu9FswEzW1YmnHsFzkZehWIkSc
         IsRKN2JLv6VDHnqlp/+K7sr26bTE2WwJKD47OGpf+IK4TYi9vY4mpJ98S1xVaWIcRdIc
         oRwhyIsC8lPDlB3UlVq7PKTjmR7uA6ojE804dxpDihoBiw8vIZGH4dGqAHDl+uRJVmsA
         0zsG12J8ZZsmY3jD4M6JKojEFt4oOqLD0ttuU1ie/L0f+Mx7sPikIDHuU+iIs5VcDNJs
         hPng==
X-Forwarded-Encrypted: i=1; AJvYcCXZxCoT5F5492xQURNoKIRxhsoz20sLD5ZpDkWLqOJeRoWNwlZP4ueBRgpdQHNBCJ8Lgzw49rYR7PZHV4/s@vger.kernel.org
X-Gm-Message-State: AOJu0YwhVB0UT9Q5h/1wbHd202xMoJm5CbHK/MNrBbrRUyP/J32bMNyk
	npfN0iNr4vX/nvaThr+v8V6qwjmwz+Dfm3XUe1a9CH0HCab5+RRrgKgFRdexXjRrg5Stdf+yh89
	nw1aneeQjgsNc3dtZRC4mbrWONfF9xUfRngdC
X-Google-Smtp-Source: AGHT+IEVO9KZmNWSFybfc7A1nURst7111SB2+UOWqLJ8aG+gb/58BS72acni8VLoQAEGgDW7MBt6MwGtixuxjlVQbiw=
X-Received: by 2002:a05:620a:2496:b0:7a4:f480:c315 with SMTP id
 af79cd13be357-7a804182b1fmr3651685a.3.1724864621186; Wed, 28 Aug 2024
 10:03:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Aug 2024 13:03:40 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <8597375d-6c15-4d20-96fd-2598805c09d5@linaro.org>
References: <20240827231237.1014813-1-swboyd@chromium.org> <20240827231237.1014813-2-swboyd@chromium.org>
 <8597375d-6c15-4d20-96fd-2598805c09d5@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 28 Aug 2024 13:03:40 -0400
Message-ID: <CAE-0n50_+ci9H4M74FC1xVF5szE7kULFifEEnE+-DxaivGG-Bw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: qcom: dispcc-sc7180: Only park display clks
 at init
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, linux-clk@vger.kernel.org, 
	Taniya Das <quic_tdas@quicinc.com>, Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Neil Armstrong (2024-08-28 05:22:25)
> On 28/08/2024 01:12, Stephen Boyd wrote:
> > Amit Pundir reports that audio and USB-C host mode stops working on
> > sm8550 if the gcc_usb30_prim_master_clk_src clk is registered and
> > clk_rcg2_shared_init() parks it on XO.
>
> Why does it change the dispcc-sc7180 in this case ?
>

The patch that broke it affected all RCGs. Let me add that detail and
resend.

