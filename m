Return-Path: <linux-arm-msm+bounces-33893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A214B998A7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 16:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1C141C249EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12B81E47C2;
	Thu, 10 Oct 2024 14:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sFwvTDLR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298931CEAD8
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728571333; cv=none; b=pz11IPnvAU5rOJbo1QFRJh0IoMkW5L5br0AFn3mUBYG5dZ992SstxFsGxtqCgM79wCXeNe5Swpz/HuPNaIYI9m1wwljNCTDLyI8RWhM0w5QV27s6JaSxbxBJg4G4e18Eo1jpqUdNtXlbeDCBOkhYH88yDpw6+2KFsNxjkoF1xow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728571333; c=relaxed/simple;
	bh=J8h7ZogSRVYi3JZp242VuIB8P5Hx5C5R4FBhWsIGOgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Npqm0cNYlAo1WN2Ip8SXCzXkk7WIbwgqSTUtVQGbVwBbSJ9o0Bv5X9v4NPtD1bd45WDGb+y0cW5fDdKGjMRI62e67lgQ9lMcU4bsXTkoqjnOK7XpCOpSh+WKn00rM2h9sZF2/MqDhjz1ol6mxXGAS4SG1hAL0lWZqL5x8kRWEBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sFwvTDLR; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso14790461fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 07:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728571330; x=1729176130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TSCYi8JcMLXDaF73CrzXwPeVuGXfVTJYUL9WPyu/FF4=;
        b=sFwvTDLRAUoUFyGMt2lhgs0iOLJL8JKxM/29HP3LIkkwC1lvLo4hcExukLDQqOVAuf
         GfnINho++2kGxZwwAWCLLEDZAGPARBdPetTTsz7BL479RaJHfeG/KT1RmQ95av20eQgf
         D4xG/XXcw6QZQhwaYJmZJ64d5D8LSsOGe0KiHBYR2KCIp7nsttZ3OKaFeekT6QvOQ6tr
         DMCp1idfFO2mrqYFwazzrOft5p3CBxvXhA7eTNXpOdCSakU6D7+h5Gh8gAA5Lbfrgs36
         WugVMPPXgXcLGA+oY2dm4V3476VvctmoUYpQghM4VoR5hrTfHFSE3oqcKWzyfuZl1jEY
         Otvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728571330; x=1729176130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSCYi8JcMLXDaF73CrzXwPeVuGXfVTJYUL9WPyu/FF4=;
        b=DjYqPBaMwmt0hKnDq2bbKbdrvLwW3V+eKH91GKsdYmjfCnceZrSxAnhO42N5KKJmHS
         szxnmePw9gZvzcbSLZ+W8iZdHTCdvNttpPN1XDb9OFnqCgnAC48xfAGGPKYEk18y2DJR
         XQIoJ9jGGFqUylge2E9DbraNXJ04p3fepq+533dcG/hdyQq/FOPQ3Dz7WNF2SQAZTfHG
         G7BFAihzw0De6XPrf3Gb9YyfuHp9xUED3npplwLnvuUQq1WfZO4lW0R6qMOBV/kVr7ok
         7QpmhWmkV/smL3t6sJnMMm7elakOIwhIBZ3+2aaCGnYW7liLPJrYw0wOp3WY/Q4OCks5
         sOJA==
X-Forwarded-Encrypted: i=1; AJvYcCWMJiA8/X8SPLh37bzRkL4O10D29kT8Yym4e0dPhPMeBfWl/QcKAXRKATFHolww7XF1M42ScQXExesX6FXV@vger.kernel.org
X-Gm-Message-State: AOJu0YxCnXVnjMJoMUCnErV09NponJNRfB/z/q+WeWevOiraCsO1hoIz
	uOUlHwjNa3HxvAQKHo9SJ0N4+89YjD0aa7KKt+UrcIbqS5GyIIoXRueLlf8+94E=
X-Google-Smtp-Source: AGHT+IHTXbpgPQx1CNya5s++GATNvkC8R0h710vIpZWBj7Fxa5x0RbTR+gUaQHMlnVb3y0lAfmds6g==
X-Received: by 2002:a2e:be23:0:b0:2ef:1b1b:7f42 with SMTP id 38308e7fff4ca-2fb187e7de2mr63367001fa.36.1728571330142;
        Thu, 10 Oct 2024 07:42:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb2459c93esm2249621fa.55.2024.10.10.07.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 07:42:08 -0700 (PDT)
Date: Thu, 10 Oct 2024 17:42:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: neil.armstrong@linaro.org, Johan Hovold <johan+linaro@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Chris Lew <quic_clew@quicinc.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
Message-ID: <2fqd3hkj7j2lppxzfl2fjfzrik3jql2gk7chexaajeybcrz3kc@rvx565zzmlmp>
References: <CAA8EJpoiu2hwKWGMTeA=Kr+ZaPL=JJFq1qQOJhUnYz6-uTmHWw@mail.gmail.com>
 <ZweoZwz73GaVlnLB@hovoldconsulting.com>
 <CAA8EJprg0ip=ejFOzBe3iisKHX14w0BnAQUDPqzuPRX6d8fvRA@mail.gmail.com>
 <Zwe-DYZKQpLJgUtp@hovoldconsulting.com>
 <c84dd670-d417-4df7-b95f-c0fbc1703c2d@linaro.org>
 <ZwfVg89DAIE74KGB@hovoldconsulting.com>
 <jtxci47paynh3uuulwempryixgbdvcnx3fhtkru733s6rkip7l@jxoaaxdxvp3d>
 <Zwffi40TyaMZruHj@hovoldconsulting.com>
 <CAA8EJppWgcyzS14rY2TfX2UNR1iqKBo1=qxHAbwkbeXLrZ2MPw@mail.gmail.com>
 <ZwfiuJW1gkYPFic1@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwfiuJW1gkYPFic1@hovoldconsulting.com>

On Thu, Oct 10, 2024 at 04:20:40PM GMT, Johan Hovold wrote:
> On Thu, Oct 10, 2024 at 05:13:44PM +0300, Dmitry Baryshkov wrote:
> > On Thu, 10 Oct 2024 at 17:07, Johan Hovold <johan@kernel.org> wrote:
> 
> > > Yes, Chris's analysis of the ECANCELED issue suggests that this is not
> > > SoC specific.
> > 
> > "When the firmware implements the glink channel this way...", etc.
> > Yes, it doesn't sound like being SoC-specific, but we don't know which
> > SoC use this implementation.
> 
> So let's err on the safe side until we have more information and avoid
> having distros drop the user-space daemon until these known bugs exposed
> by the in-kernel pd-mapper have been fixed.

Then default n + revert X1E sounds like a better approach?

> 
> Johan

-- 
With best wishes
Dmitry

