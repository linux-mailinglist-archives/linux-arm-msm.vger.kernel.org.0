Return-Path: <linux-arm-msm+bounces-47746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 286D6A32485
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 12:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 841A91692E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 11:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4668220AF87;
	Wed, 12 Feb 2025 11:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cQ4IutSq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D3620ADF4
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 11:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739358773; cv=none; b=cYk6bKbopJ5DpFsr5e0uE2N8J2e5BXwFpH3EXdF8XnXWtWLXQLKgLEcNlny7w1NWfBREqJjk0y65tA/TBmJgColLV48wSBJt06FpOPdePmIesRjOAzl0bXFDyAgjGF0u7I+Vxbwcpa1TyGGIw3hr6uj4zB99kQR0LvQVyrf7aVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739358773; c=relaxed/simple;
	bh=czDBhXds2774fwZNyEeYA03Jzlh2/wYesLkUERE8+UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7056ej9HGqzjVAaY7NyJihuYC0yl+phATS+SX8VyHpdq3Gp9+LC2t4YnNwAYtFxcy7Da0gUzwVlNZZYAeLgpuvx4fYZGrlqI8KMlQtB6BMIx3lmaDSuKAj+BH3xwehBMMZik8WOfCtI+Q/AYLTsLCZpc48wxxbQTBWZ5FKV2to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cQ4IutSq; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30761be8fcfso67824301fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 03:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739358769; x=1739963569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zi7NSGVlmdukYXP2xLDE0jItD13dYbVjBU6ou/KCEC8=;
        b=cQ4IutSqVBqRUrbXKbHaw/NNLr1RNmie25Y/MVG8IodnPJSqJa1cPFbqwN103Z0JrV
         oQD/xEU3XgRSarfKrcXiX1R6KEago3ox9oIBsnI0DjB9UJsWl5sDcNop4HlLguL/G1hu
         GxTT24uzp3zZ4xPySTjF/eTz1vun4CLeFjc33jlvNrBwu6cGZBt5hl0Rt8fbjQf+H/rZ
         eUaZpg1KGuoSAJWBY++4lRaSip9zdagPjDMryJPbVXhf7eYMR4rUviwCv5HHeZUxfMTw
         0myu+Z8dFmtj8OsLAL07GSg9YY4qwgAAg4x0xyfKZRR1n/bfa4Un0GDIw6/E2zW6vQa0
         gw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739358769; x=1739963569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zi7NSGVlmdukYXP2xLDE0jItD13dYbVjBU6ou/KCEC8=;
        b=M8xCcjP3EA2zitgVQfCPq7glLfRuRIpIMrVVWJmTMaAxKQL8kbUmtK296Ahr7opxZH
         bwpAuM5Fs12dViqYy3DMezEAU7N4RdoVLT2ZRtiOosysAjkhmiRkzvaqdAlyy6M+mYu3
         luM/L51o8Z8QXrgLcZ7xHyTPqwgsheSBWtq+3jRmATNSrDeGxzpvkikilS4a1g0yd1wq
         uZUInCaKXHrw1OYL7BxV3yFfqpk5VjEj2fUcJvNfN3BYaNAPeu23AvgLSvfAHUgfgQL/
         T+JlNY9fv1pqhVmmvpGWig4+UZXng/TWnk/Gn3IFlvnYmu+LKuGA6Pae9tJ/5LZg1bIF
         g4gw==
X-Forwarded-Encrypted: i=1; AJvYcCW3yQAP1RugF0ulED0uVlju7vlRAFSAlQO7n1yQCwg/a44CZ+7ws6vV8bTRBc5dyw5JeUVKYaY7gbSUZUaI@vger.kernel.org
X-Gm-Message-State: AOJu0YzwRd3NtsALApc4IBJt6CWbikQnRINzj4ToDSAngkSzjseZSc47
	JRBLD29lUzK9QYqYqrrrmOpo8fb9EewNIG9xs9qKQvkALfXdVq/uBRX+BiMMk9s=
X-Gm-Gg: ASbGnctDuo8G2z/9w+3dWlIwfkdpKBYZWaxY7Cjw8P3qf1j0t2qPwbe5mPA6VSCFPro
	4pLBJOJ3fdIzCFy7WwAKiTp5w/D4RvLnnukFnPBUE6AJPyZ+KG/b88s1aB1xfy+bQ8+7i9EAT3u
	0xEuwitztzXzWy8naKSqwAfBlfsDZAY9v9gSlsGZHRoSdL1vtRRk5TY9Au8xiByfDK49Yk91w3f
	rAmHur6qcwmErK2utDiUBJX9CrQUUuYoNPX+4zkYfa4wEd8E679TpTbBs4orutuCNU9HW2ZvOY0
	KYBk70JHv7JSy2mqcWqUiXO5l5XtqC/sEM41/2gKvo+Qn9ptTISayK0AAO8lDXLo0F9LrGc=
X-Google-Smtp-Source: AGHT+IGWDa45dg3xRQlPrBCB2RykQBWQjwcAddvmjkqC+H/VzwhKqUGo6U53A3FTwTYDMQ62clov2A==
X-Received: by 2002:a05:651c:220c:b0:307:e0c3:5293 with SMTP id 38308e7fff4ca-309036ea829mr7444151fa.36.1739358769271;
        Wed, 12 Feb 2025 03:12:49 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308fe555e5dsm4932671fa.72.2025.02.12.03.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:12:48 -0800 (PST)
Date: Wed, 12 Feb 2025 13:12:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, quic_kamalw@quicinc.com, quic_jprakash@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/5] dt-bindings: thermal: Add MBG thermal monitor
 support
Message-ID: <iuzhsmcfmc5kxpxirqdacxgaqqufs3hdhlvhw2mds2wq3rb6si@pcsvops5yd6h>
References: <20241212-mbg-v2-support-v2-0-3249a4339b6e@quicinc.com>
 <20241212-mbg-v2-support-v2-1-3249a4339b6e@quicinc.com>
 <ojukpywkhu72cimujmijzidf26654g5vkjaj477imcf4suz2o6@cmow62jcqsfz>
 <7a5db383-914c-4c1e-846e-5d68cc6a7765@quicinc.com>
 <fcd718be-fe8a-466f-bd2b-7b75d5f8dd6c@kernel.org>
 <c85903c6-6a89-4382-bfa2-2fed95f0cbc0@kernel.org>
 <sybrfmrpegq7fcqykgsfhm56wjyx5vp6zafqw2d73tiral64aw@hg4di55fzdle>
 <9a61e73d-29d1-4189-89eb-1299b8934af9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a61e73d-29d1-4189-89eb-1299b8934af9@kernel.org>

On Wed, Feb 12, 2025 at 07:06:56AM +0100, Krzysztof Kozlowski wrote:
> On 12/02/2025 00:57, Dmitry Baryshkov wrote:
> > On Tue, Feb 11, 2025 at 12:50:12PM +0100, Krzysztof Kozlowski wrote:
> >> On 11/02/2025 12:46, Krzysztof Kozlowski wrote:
> >>> On 11/02/2025 12:15, Satya Priya Kakitapalli wrote:
> >>>>
> >>>> On 12/13/2024 2:08 PM, Krzysztof Kozlowski wrote:
> >>>>> On Thu, Dec 12, 2024 at 09:41:20PM +0530, Satya Priya Kakitapalli wrote:
> >>>>>> +
> >>>>>> +required:
> >>>>>> +  - compatible
> >>>>>> +  - reg
> >>>>>> +  - interrupts
> >>>>>> +  - io-channels
> >>>>>> +  - io-channel-names
> >>>>> Binding looks ok, but this wasn't tested due to unneeded dependency.
> >>>>> Please decouple from dependency, so automation can properly test it.
> >>>>
> >>>>
> >>>> The dependency is needed because this mbg peripheral is present on only 
> >>>> targets which have GEN3 ADC5, for which the bindings support is added in 
> >>>> the series [1]
> >>>>
> >>>>
> >>>> [1] 
> >>>> https://lore.kernel.org/linux-arm-msm/c4ca0a4c-e421-4cf6-b073-8e9019400f4c@quicinc.com/
> >>>
> >>> Sure. Then this cannot be merged due to resulting test failure.
> >>>
> >>> Please don't post new versions before this can be actually tested and
> >>> applied.
> >>
> >> Heh, you responded *after two months*, to an old email so even previous
> >> discussion is gone from my inbox.
> > 
> > Are you responding to your own email?
> 
> Look at the timeline of these emails. Satya responded after two months
> with some comment. I responded now. Then I noticed that it is talk about
> something two months old, so I responded again. Two responses from me,
> that's correct.

I see, Satya's email didn't get to lore.kernel.org, so it wasn't fetched
by lei.

> I recently got way too many such 2-month old clarifications.
> 
> That's indeed right of the contributor to respond in their own pace, I
> am also sometimes slow, but really there should be some limit. It's
> putting unnecessary burden on reviewers as now I should dig some old
> discussion.

-- 
With best wishes
Dmitry

