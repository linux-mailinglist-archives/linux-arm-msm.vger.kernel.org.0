Return-Path: <linux-arm-msm+bounces-33242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 818DA991FDA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36C3B28205D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 17:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA79156677;
	Sun,  6 Oct 2024 17:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nEzAPBHA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8FF189F30
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 17:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728235134; cv=none; b=HoS/UULNB+dNGkD37YB4Rbve8da6aixvxQzitXF+sGV0B+RHZn5WSkONZCDsXmqFZNHw1MEllqn6e9YcNnLH6fYmrMLHP6ExKXEfS87UvbI68OLl3sgAE0aMeOzobKM7pueKZjtWZgbyJ2h5GJNB+0+A6tMmBF3BHrkfDv8OWgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728235134; c=relaxed/simple;
	bh=OLvWw2NBMBUNxK2VPZYC8Qku8L2s556/hM6PEU5EucQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKTgeBNjeUrB7r+CD6M1W8/iQr4Yt+y+q8Ys+UvhcPs19snhULqxKcolEHDsmmp7c3V+Sv9hTH/MCh1Hae8cNonJR6y61jxW/TJk0YPv+7zo6O5ZnDZZllVokhw9tWuJRYqo01Zzh8q2GG00Xefxa++WxhGzWLkGW5R1H+RaCYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nEzAPBHA; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fac9eaeafcso37810731fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 10:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728235131; x=1728839931; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3D4iiAvu48BbbMJdyIPgDeJKKpenMDlcp5ms+/X+BQY=;
        b=nEzAPBHA3bQudSen6PGucrIr6uCbt26Ry+m0kTMekUhtMPrZilffVHnAewL4Mv4oqx
         3kyvyp08LjfT9bwo6+BU79tZ9wNwj5SMp926q0UMe7kHuXBUIr6KPWvktFCDSxikBczK
         m9HqWaJ7EIi7WKx6JNC7quGwpZGoOBJS8xE9uovvVDpJR4TiCFTM9A64JCRRiUxopPyg
         CVq0vDzX7QBwzHValzs2d9zGsMOXTNNmoAmiIeKSO5SgWYIYiMNVhRKB4Q3HO82vgPTI
         hGmHXcqW6SzXMIpObqOMQp5Cu9+haCWxONFTB27EbxAWqmJOQs9CUhM0htc8S5yt/YjY
         CbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728235131; x=1728839931;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3D4iiAvu48BbbMJdyIPgDeJKKpenMDlcp5ms+/X+BQY=;
        b=fAAHpF911CaFnizYW2/EZr7KKqfUVSMRIsmCXQuw0uFj3frrxz2B/NjTLC4nJJdh1y
         aSbEHh8YxtcAOZkWmCgGUVGR9nJPSr5TM6N2GZNgcjZWzcaUpM5od/SMMqHqlrFjko7H
         aYOWjg+kbRNLfnSMvD8JWTTJxy9j8XUBtiujWPkZJUaH4yCZRrtZAmC7DxEu1epiJHv8
         2UOah/wbDGkdXP3dqSgKt29RaEUROmxtKxQqm0OgwSiRTkq8UufUi6rt8cMbZfsnZtQb
         pfr6pHVllmcaJ/q/utc5IjNJsIStN4c6BbmqdRyY58Eiahr308T4DUMGYA/ENoH565qc
         k6JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS2j0A6UfDuDWVG6/pEIH5kk6+mqMCwrOnutpZ/KKgq2KveOztqp3pgca8OlSep8O0q+DHg09jIgEOlSo6@vger.kernel.org
X-Gm-Message-State: AOJu0YzOb+X7jkF+ZQ3syPjhBoe/piOkpIZwsNLqDknkTOFE+EV6eVtl
	iz7mQbbebdHkALN/chvLGrBWUYw8NcL/fKBvjKlDhSGAGvg66/RXBpqGkbPbIeo=
X-Google-Smtp-Source: AGHT+IEcmM0dSr9ebBwphR8mlW0qEQpHUsVSoMUQHyu/rhEpukjAdBni/8mDJ7X4A9Q8Ckw0W1+ZMw==
X-Received: by 2002:a2e:4c11:0:b0:2f6:5f0a:9cf8 with SMTP id 38308e7fff4ca-2faf3d78c74mr31208611fa.39.1728235130705;
        Sun, 06 Oct 2024 10:18:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9b3b4aasm5470651fa.140.2024.10.06.10.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 10:18:49 -0700 (PDT)
Date: Sun, 6 Oct 2024 20:18:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] clk: qcom: clk-alpha-pll: Fix pll post div mask when
 width is not set
Message-ID: <r3tbqs2uma4m7e2bjuknck3xg2t6fs4zaw5xuslw4f7h6mi3tj@qf6lwseklb7b>
References: <20240925-fix-postdiv-mask-v2-1-b825048b828b@mainlining.org>
 <jlmnxzkferigmhh5akcr5uumrdychjxyy2flftx5u2sg2w62aa@566u2lqj5od2>
 <b9369ebfeae8bc1aad3f9da4a6453c3d@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9369ebfeae8bc1aad3f9da4a6453c3d@mainlining.org>

On Sat, Sep 28, 2024 at 07:05:39PM GMT, barnabas.czeman@mainlining.org wrote:
> On 2024-09-25 23:28, Dmitry Baryshkov wrote:
> > On Wed, Sep 25, 2024 at 08:33:20PM GMT, Barnabás Czémán wrote:
> > > Many qcom clock drivers do not have .width set. In that case value of
> > > (p)->width - 1 will be negative which breaks clock tree. Fix this
> > > by checking if width is zero, and pass 3 to GENMASK if that's the
> > > case.
> > > 
> > > Fixes: 1c3541145cbf ("clk: qcom: support for 2 bit PLL post divider")
> > > Fixes: 2c4553e6c485 ("clk: qcom: clk-alpha-pll: Fix the pll post div
> > > mask")
> > 
> > I think one Fixes tag should be enough.
> Should I send a v3 remove one of them or not needed?

Judging by the lack of the response, please resend, dropping the extra
tag.

> > 
> > Nevertheless,
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> > > ---
> > > Changes in v2:
> > > - Pass 3 to GENMASK instead of 0.
> > > - Add more Fixes tag for reference root cause.
> > > - Link to v1: https://lore.kernel.org/r/20240925-fix-postdiv-mask-v1-1-f70ba55f415e@mainlining.org
> > > ---
> > >  drivers/clk/qcom/clk-alpha-pll.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry

