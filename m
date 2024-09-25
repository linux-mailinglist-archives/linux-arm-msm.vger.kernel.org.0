Return-Path: <linux-arm-msm+bounces-32522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D176A986852
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 23:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9632028519C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 21:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFA1155733;
	Wed, 25 Sep 2024 21:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M6P9byp+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72F4147C79
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 21:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727299727; cv=none; b=k4rZKHNu34fDjDI5Pd3VnWB5ZGfUTtYqT/CQQbM6pYWsMcH/v0AROqOI0QoVgKFnh6S3ycHr8zpnj+15AhAYi6UowSz/0riKe5jrBfPf10al/Hrqf8pp9HpqqiQYJc0y/ifIxhHafMhfs06EUQmm2E4QSD2HfBxNZJMy2/ZPp+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727299727; c=relaxed/simple;
	bh=WucR+djirwpM6STmHdVUy4UR5ERz2gZtg/GRT0C4+GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYGvCwM6LwUOZSK5mjYaIwMTsI9XqsQ+QcTv6YE2PviP8VRYmyc40s1yJK6m2pXnFutIq3S0JM92OIT5tS5wdscaBf21OIIG7rV4m4Q8NaW/jFMFYU/cSMRc6H8EqGcGpgm9LpU0ZVzNlfzArLVyb6NddfbItsJ6eN91I+ldfMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M6P9byp+; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f762de00e5so2929021fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 14:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727299724; x=1727904524; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gwTr0ZjzKHD8edFYUSKF8PBtaT++xT7YsKjfFnre+JY=;
        b=M6P9byp+++VgGzj3JjemOtwY976DKBqxqAII/DgM4aNnkiS1sYNXCw+EUwxQTkvLAT
         GG7TQdk5sgipr9UPMLraayYGIG5oki9x9QDgJeuoWeh29mCugfrLacEm05apNh35PD1l
         vvfE0QgUQEOfNwNh28+LSn/BxBGuhIINM55223ygPTzZvEwy6QeM4uC55l4iJB5AGkcV
         xtTW+eH4E6Dvli43X0wilQ/PLPUDEBPkpguG86UC5pyIDb9Mnp/DyGG5jL7TQ6kFzVVZ
         GEPd/g+OQ8TG8j1w3asTDgbMMmHBxkK9QS0glr4yk76+TF3MFli6Oec8clg6+rUdwMaK
         5hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727299724; x=1727904524;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gwTr0ZjzKHD8edFYUSKF8PBtaT++xT7YsKjfFnre+JY=;
        b=lpeQ0rixmTPmwEv0nkkVtBI/p+6gMMAWORTWXiCBKmx1E1N6DDSDL65pHchNXLzRem
         gIZWLMUxGdR+M/nH6ImwsJ8Syxp4e666tSqH3306u2PzLVlynNpfFsWeF3hePM7qK4Ye
         3hSwDjJ4jkgU6QuyGS7jAFLzGPldwsX+DgwCQEY9EWFpUxau4vlf27bnyujWoi0Fyp9T
         B2h2O3TIjXwJHa9xQVKvN6HXUdGsd4ES4WGElS0+PLb2BadDFmFoNqGV5MLl0w371CLW
         iULUyldKWlCD6kgLRZ270M3iup4siwpJyGY/Gn0XIuDmSe1A+DDTw3CvCs8c0ABraKRX
         p8kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhwRHYfwl29b3sFEbD/w6/zRyJj+dY2pu7IbtJzgbcTGPvywyrROwPfGMf5oTV4MU3ZR8aiXXva2r1XZug@vger.kernel.org
X-Gm-Message-State: AOJu0YxkaBSTeH3J8RVwkfrzZ/8NZnpKq353YXTZhnwyzrUGNIwsChpt
	Y3UtX+6LulrD0wa2ym8r5zgGe9l3VNesj/iDD5L4s0pDDuX0J4HU+elCAOkjPTU=
X-Google-Smtp-Source: AGHT+IFr4Ny4+GpZtXRbkLD1/XaxRB6oYcW6d6Gw9eijaSV1QXJ3oFhYYiPUQKPns6/AJEWKpEWAAA==
X-Received: by 2002:a05:651c:2117:b0:2f7:4f84:50a2 with SMTP id 38308e7fff4ca-2f91ca426ffmr26443491fa.31.1727299723711;
        Wed, 25 Sep 2024 14:28:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d283bfd0sm6173091fa.42.2024.09.25.14.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 14:28:42 -0700 (PDT)
Date: Thu, 26 Sep 2024 00:28:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] clk: qcom: clk-alpha-pll: Fix pll post div mask when
 width is not set
Message-ID: <jlmnxzkferigmhh5akcr5uumrdychjxyy2flftx5u2sg2w62aa@566u2lqj5od2>
References: <20240925-fix-postdiv-mask-v2-1-b825048b828b@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240925-fix-postdiv-mask-v2-1-b825048b828b@mainlining.org>

On Wed, Sep 25, 2024 at 08:33:20PM GMT, Barnabás Czémán wrote:
> Many qcom clock drivers do not have .width set. In that case value of
> (p)->width - 1 will be negative which breaks clock tree. Fix this
> by checking if width is zero, and pass 3 to GENMASK if that's the case.
> 
> Fixes: 1c3541145cbf ("clk: qcom: support for 2 bit PLL post divider")
> Fixes: 2c4553e6c485 ("clk: qcom: clk-alpha-pll: Fix the pll post div mask")

I think one Fixes tag should be enough.

Nevertheless,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
> Changes in v2:
> - Pass 3 to GENMASK instead of 0.
> - Add more Fixes tag for reference root cause.
> - Link to v1: https://lore.kernel.org/r/20240925-fix-postdiv-mask-v1-1-f70ba55f415e@mainlining.org
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry

