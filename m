Return-Path: <linux-arm-msm+bounces-33882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 599C099893E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 16:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E00A1F28AEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB45F1CC8A4;
	Thu, 10 Oct 2024 14:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d3hur5hv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB931CB337
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 14:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728569637; cv=none; b=YQgczNp/xfw8A8+EFrSUTRKOj6yuMvO3L0AjXr4ymI/Z6AQruHfCGT3A20Xdx4VQU/EZ3EtVrcplAsaAIrWiK91FvVVBpmTK+tjBlEU6bYAzAtOndyki+tfQgKdiigAPuxZJkvUGKpF/o4vynUuU1FlG60xD2CVHiihSBft7zSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728569637; c=relaxed/simple;
	bh=v96PNN4MVU8BpK8vBy975YovAlUghAh49thgBno3qUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dalW5CV4eb+/+U9bfE8+fYKyKJMCXNw08voxXLcfGDa3ApcUQLJrl8BWiywaUi2IEU8mIiiq9s4lMgzyygjTrDu6ZasUXRFU1f17gc/jDAfV23C+Ytty8jHud5k/zmZLC+CNH/x76+g+6Seltfw7tgbmfBYFwbzsZmeWHMKgBJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d3hur5hv; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20c767a9c50so7755435ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 07:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728569636; x=1729174436; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DawD8n4X/r4xaXiJGTeAEfpBOv40vnqoSHm9Owz94ss=;
        b=d3hur5hv1thiqZSsoRIMsQMLoCkZXZxD2HiqwJBpMnV6inODcclIdF7x5/rLYARt4M
         q8YaFwp9QwcPwD8tTbr9lTwrp1SkkdGOLuWQhu69CLFGbsrDXWuN2huYDUsC6YZEymsv
         Gsadx+BlNXzCtZu4klo3FtJG6Dqr/s5mEAKlkIhJf5wldNuvMklBTmNu4oxOHlybCQhH
         wOoBGnq+nuMeunJQzZLyfr3HEE0xVUX8kWXFci+lq0/E7S+vblo5EjvWpYpt2mIRxhx0
         OtPAYFIoUvN/lX2609kVdsuSOpvhvhpqxoDJwRmNqQBVt/1/QY48r+xpZaghUvMgmvWl
         QAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728569636; x=1729174436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DawD8n4X/r4xaXiJGTeAEfpBOv40vnqoSHm9Owz94ss=;
        b=f3YmktmRONtH3B8pcne2bewJFXDUq+sxoWiECPyDknhFOIG6K4KpzDxojPUwZOlIiU
         XnQVbzuMH/PCUxw+2u2UVOwXEKn33Deg2dDkAJPbvLdOrYBwyTs3xPUxUfAaiEKOCNtV
         jSU63RaPzFpFjKCph+khVoVGePTk7ibd51tzCWgjxCN33XqwQJK5gGuXLL6v1lyZc238
         CMUOqHguNJG7kykX9lvd7KyhYgGgzfxxQh5sfp/MC3e5TDtA/KKxlJB6gm3y6etU9rlV
         tmsdFqfMUZhLP95heVQ6qUf3bz3H6aAtaPLE2yUUjN3rn84hhgwy69TQvT/G6PhaMRWN
         AH/A==
X-Forwarded-Encrypted: i=1; AJvYcCVc6KQBU/ToS9F+Cks1/0dmBgJGMWWRL/A9Qljck00bbfDwtCUhf/PboLZ5T2JJsRsWUWsWVbu/BpXIkzqM@vger.kernel.org
X-Gm-Message-State: AOJu0YyVYoEzTtzdnxgRu/L5YBgCf7wcb2gAFFi7Dv4OapoSvlqRRZql
	iFQFBXDQNCrusY5eWHfFWKyvIQt3IRHqX/Dv2btmxLceNNxSnycF8Qzi8IGZe5O+wDgmbJnfYrA
	EKDdtdysn0N3wHw58emqsq54GK4Ck/UxRjt8VtA==
X-Google-Smtp-Source: AGHT+IH99waZBuY+BmuZLoXnqUMIgsfr9Dg8xvuA8Cec2W/RAxuOqyAufJdeE6Cmv/k4m+tI9LwHTSeCcz7iXHTzNXA=
X-Received: by 2002:a17:902:e811:b0:20b:b75d:e8c0 with SMTP id
 d9443c01a7336-20c6377c836mr102102855ad.45.1728569635812; Thu, 10 Oct 2024
 07:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010074246.15725-1-johan+linaro@kernel.org>
 <CAA8EJpoiu2hwKWGMTeA=Kr+ZaPL=JJFq1qQOJhUnYz6-uTmHWw@mail.gmail.com>
 <ZweoZwz73GaVlnLB@hovoldconsulting.com> <CAA8EJprg0ip=ejFOzBe3iisKHX14w0BnAQUDPqzuPRX6d8fvRA@mail.gmail.com>
 <Zwe-DYZKQpLJgUtp@hovoldconsulting.com> <c84dd670-d417-4df7-b95f-c0fbc1703c2d@linaro.org>
 <ZwfVg89DAIE74KGB@hovoldconsulting.com> <jtxci47paynh3uuulwempryixgbdvcnx3fhtkru733s6rkip7l@jxoaaxdxvp3d>
 <Zwffi40TyaMZruHj@hovoldconsulting.com>
In-Reply-To: <Zwffi40TyaMZruHj@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 17:13:44 +0300
Message-ID: <CAA8EJppWgcyzS14rY2TfX2UNR1iqKBo1=qxHAbwkbeXLrZ2MPw@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
To: Johan Hovold <johan@kernel.org>
Cc: neil.armstrong@linaro.org, Johan Hovold <johan+linaro@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Chris Lew <quic_clew@quicinc.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Oct 2024 at 17:07, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Oct 10, 2024 at 04:45:57PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Oct 10, 2024 at 03:24:19PM GMT, Johan Hovold wrote:
>
> > > Again, you may just be lucky, we have x1e users that also don't hit
> > > these issues due to how things are timed during boot in their setups.
> > >
> > > If there's some actual evidence that suggests that this is limited to
> > > x1e, then that would of course be a different matter, but I'm not aware
> > > of anything like that currently.
> >
> > Is there an evidence that it is broken on other platforms? I have been
> > daily driving the pd-mapper in my testing kernels for a long period of
> > time.
>
> Yes, Chris's analysis of the ECANCELED issue suggests that this is not
> SoC specific.

"When the firmware implements the glink channel this way...", etc.
Yes, it doesn't sound like being SoC-specific, but we don't know which
SoC use this implementation.

>
> Johan



-- 
With best wishes
Dmitry

