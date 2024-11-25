Return-Path: <linux-arm-msm+bounces-39147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 345359D8E98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 23:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE929282A4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 22:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782D61CD219;
	Mon, 25 Nov 2024 22:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aVaqb8D6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD28156F3A
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 22:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732574127; cv=none; b=Rdzz5vScir6cJbyobMnTKwi3luG5+/CKb9QgOfrYPMa6nUgx6XI2vqPtdOOIXcU0Or/01gW2OkfVogfjtTWPNN8UNXGnsHOvwOOO2eC6gdWqSG3q3FR9j2WT2fPh/H3yPT8iVrZYGa8SvE+GlCZRnZFYzDxcMtoYLYzmmq9deZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732574127; c=relaxed/simple;
	bh=JUkdG3WwcK0sH53fkuhlZtdKYI9+pTrmnN1dDYT+QqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4lpYommBY9Yxc7ovoO1qB+jRMsiYVTSg5bmiX8vr9sEX/jLnh4uBQexxjSwhhvS6i7mUj4APp12q5C0HdQj+95BvDw+I3AEl24b6VdlGVkUnlPaE9E2Gn8MAE9zfyDeOAZIZoFo9IvKKRTaArl9Y/DbmnQwe02LiLJwxnWSDBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aVaqb8D6; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ff550d37a6so55028221fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 14:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732574124; x=1733178924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mK6iFRY7R3ULg/N72ZgFYW9FiXYFDV4de5/GQKQ+Iyk=;
        b=aVaqb8D6prIgG5MEdXWkfzc43qtRdoHDa6Ls6W37MpePuEWCo+myZ+XL11wIC78VgL
         vfaUtC/VuoNuJCbgmhMNW0Lf48LHnMQauOKEW0lKFfZ/+AePFGdJ7Suy9B2YtLkoKXTb
         qvonPL1gR0oeVh5GKgEoZ8/cThyTBdmWwsMNq9KaAgmHPfPXaYNin3Dc2/TyA5xX1TMw
         AY81k/QmFZlYmnulCkrppDbWRby7kaCo5nAjV/57YD7c1RE59z2qVa+O9Z4vZZKo8Gaw
         oBTV2SwpN951ndLFGBpqW7QqtfZpOc2kklU8uTTSSMcylORZYAny+1EAiyPY7txCTW1h
         OmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732574124; x=1733178924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mK6iFRY7R3ULg/N72ZgFYW9FiXYFDV4de5/GQKQ+Iyk=;
        b=CwSHvAGR5eTSSgWTiHkb13VfY2CkdDoAjeoZwa8ENaegv+dKQGeMt64sGMDfP64Xo9
         PRbcSgtlJZFqiPMSnpQjABO4JNjT18wfM3cUelJXQP/vIMMnmOT2MgtQb3v96xKvs7D+
         8fzrLrTJqOIMEX6/Heoj3WQ4VPbL3XbrVZj6LbPRzFgHx62yNvlfgzGdGFsSY+L31Mnc
         0vtrK1y3G1Bc9YKWZYco9SsndURZ+YXerHuZLNcDW+2plx2iKIuW+3UloYgNaNiuaI+M
         oQMD2X3WKDuOWtEPaE4cf1BZUDy7M6Pu6lYHdJhbAQG1EDDR6Jk4AbDhQeyZvTAIIkV1
         Km0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCPYury5s2Np+bX2x907KJAaR29bKjB1PUSu1+TcytL3265NdL2+vliqWTsiNbDgQTZUIj84gl1sYBWt5J@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7u7savxCTYAnzvZ5EaRxKX947kQLVx3jC7vHI1HjjIVVdCAyB
	o6qyKi28IhELwFYth/5sFCTgrpGLGvSWsGJhJe74M4ObQ4t9S6xvaf1NAO6hZH8=
X-Gm-Gg: ASbGncvaNv/htJiGNpK5f7xB267Z8L+hUMuGIgSMpdbWmrnnEzIEU7S4w9/VmZbzMJa
	iSbdqh8E40g8Wjx7StgaNu67Jhu1qQ554Dp56s/Phufu6OvhkBoJIaIwxVuPPbyhZqjfnFgFqhe
	HtiakKxENEdjX+3tzXztjyW0H2RjKsApKxyDPdybYaNwOJy9NrDSM7vONQHvuMIwG7v0mrmrztc
	gUzEBwFtsB/a5IDN1Bnzu15TP52TXHqY5tSJCXyV0xBnLmy+5+mVWC8MzYO45wMEJzVrwI6C1v4
	X2tcxLm2wQvs+vDzgWlb2nJ1eCVGbQ==
X-Google-Smtp-Source: AGHT+IFp5gx7OJlQrJ9dEw/b8xMYu3nZ67KYGmj3q6WZjvpLkJCPY9W/kriDd8ENfUXUXNo2Yfcwvg==
X-Received: by 2002:a05:651c:553:b0:2ff:991a:fb96 with SMTP id 38308e7fff4ca-2ffa716d0b6mr68581421fa.12.1732574123695;
        Mon, 25 Nov 2024 14:35:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa53760cbsm16580381fa.82.2024.11.25.14.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 14:35:22 -0800 (PST)
Date: Tue, 26 Nov 2024 00:35:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V4 2/2] arm64: dts: qcom: qcs8300: add TRNG node
Message-ID: <2vc6tg77qpi5vz7tmmlwgnlxjg62l6vsipjivygiapl4dhqupv@vrpbk3kcdrd3>
References: <20241122074346.4084606-1-quic_yrangana@quicinc.com>
 <20241122074346.4084606-3-quic_yrangana@quicinc.com>
 <40c49e6d-dbbd-49cf-b59b-10e10b24da22@kernel.org>
 <0bdaa2ef-3979-4963-be75-0a5a89728f44@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bdaa2ef-3979-4963-be75-0a5a89728f44@quicinc.com>

On Sun, Nov 24, 2024 at 09:17:40AM +0530, Yuvaraj Ranganathan wrote:
> Hi Krzysztof,
> 
> I sincerely apologize for the inconvenience. I added the "Reviewed-by"
> tag without fully understanding its implications. I will remove the tag
> in the next patch series.

First of all, please don't top-post. Put your text under the phrases
that you are responding to, not at the top of the message. Otherwise the
logic is a bit broken.

Second, may I ask, what made you add that tag at all? I went on and
checked. Krzysztof didn't repond at all to v3 and didn't respond to v2
of this patch. So why?

Third, if you are unsure about what you are doing and as you seem to be
using b4 tool, please just use `b4 trailers -u`. It has its own
drawbacks so in some cases one should be careful, but at least it
doesn't invent tags on its own.

> 
> Thanks,
> Yuvaraj.
> 
> On 11/22/2024 8:30 PM, Krzysztof Kozlowski wrote:
> > On 22/11/2024 08:43, Yuvaraj Ranganathan wrote:
> >> The qcs8300 SoC has a True Random Number Generator, add the node with
> >> the correct compatible set.
> >>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> Reviewed-by: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > 
> > NAK, stop adding fake tags. It is impossible to receive above tag from
> > me written that way.
> > 
> > Best regards,
> > Krzysztof
> 

-- 
With best wishes
Dmitry

