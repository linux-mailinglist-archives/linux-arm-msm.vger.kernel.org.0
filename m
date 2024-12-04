Return-Path: <linux-arm-msm+bounces-40179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DD39E35E5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 09:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 952A8B27AD1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 08:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5038D1946AA;
	Wed,  4 Dec 2024 08:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UKEAdfmq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AFD192D6B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733301196; cv=none; b=ui2xpmFMK0hDZRKO1zLtLYHZ0w+VaFQbr/8R9KCmlNzYg3kGUfEi+FypUeB/Il4YxuSSbliqMahtL1EhIACxaUfdkX4KOG3vZ5BAkpAatAmd24mADh7zmda//u2sl2GUrwi7ggiyy+BmfJpCWQ66hvo8ghaR96jzi+72fig2yDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733301196; c=relaxed/simple;
	bh=M2eKzihSk3zbwqoKclOvGsiEA5sAA8t8v+QDneKkB3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k93Zx1X4PTtySSmhX0s/lZhn28tylQDz1q6HKivFmiiIsIbyEtcjwXWJFw4BXwI4ZgnLIqwkhOef7DMU7B9JRJe7cGHh3NlOKT84k6lKr0oSVLaWmAMnksXIKRoKcU8/57iiHpOMt9PyYeLoU3Tu1q4hmGHih/KzTRYEN1hm7Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UKEAdfmq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a14d6bf4so58613315e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 00:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733301193; x=1733905993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U0QxTyPXrbU54XhvjWQfoHpd062jsI/RF0Hf0rs28i8=;
        b=UKEAdfmqSetK47Xx1WcUn7Yr2shYmfYvV+/JjXBF+f741WqDt3W4gmGSL8OkffN/hD
         3DISG9Kv8+nEGytaO0ztJ3UrRZqP2jeF8XL1V73J61YYmxJ/BhP+MzuegtjPKrpjkLIQ
         Ss/q0q9cQYVB9FYhoraigz7/ckWtSGoUGq4fnFFqESLQ05LwhGP2SSd3cDJTxn8YGDdA
         fvqx3Dej2wPsETbNM2KLSQGqspWpJgSVLfUDxcFgB742psW1vL2YWUwhe2GfMNWZbF+n
         oFcycxhVa3YhZGXIPEHkPpWItteqzAPE6Jn67SjGG6OjInXCeFC65TZWKLC8p6GYYz7W
         TpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733301193; x=1733905993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0QxTyPXrbU54XhvjWQfoHpd062jsI/RF0Hf0rs28i8=;
        b=Lkes2bW6lQumQ5OpVEvIBe/wy1LFCLYZfBqxIb18zfSPxcu5hQmhjEmSd68gSH6o53
         SRHkPWO1kphtLreRM0Cz8piNeno4WQcoSCHuZkVLHyxXVZnKqIBqY7VnQcd0pps0VWrr
         iLqQD+fbbDMI+pJm+aHYUCYcJpp1D0mrLXdmo4wfRJDLw1za1BHqTpXSSXxY6N9tayEM
         SPAN6V/qGJk8HrFgFNDwZKA4lKHOBdoeLNkA3IsfovqSApmnkyGVbecUpHlX/3qamdi/
         ooB5/PfS/SzVYz9I383y7jOYPruWr2koSVJE6rqvd5flmLfrAQvK2m1eg6JA6l8A4kVT
         nWyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh+vabWkQf/JsVpKytMQcLaIxu0Zh9L8NcGNj6qOwMGqIwdz1sXxclzpvk+kM5+U1WUD2aO3un8yVFNrhH@vger.kernel.org
X-Gm-Message-State: AOJu0YzclbMu6aTYws7dPcfuxqwApNgbg/XWXo5wRSc4Mq5PLTg14TkU
	PCJTCCak7irtOGAxhRQENHMxHi02vJqn9BRXSCU+bfFX8/fmau62Z8ti0k1igqU=
X-Gm-Gg: ASbGncusOo7coZ74S5HiDGtWSSVmdTpAuP5GIwu2Y9RhSD0x1Np+d7DNpUh+2+HnxTK
	1nppHzD8DNLZXnK2UmgnBz7FPekrol679Jhwe6iFBZCpLWcFG7WI9QlDN4rxV9lTROAC2/UbUc0
	Ns6RbwoKH5xNid2t0T+IeVzwlU0iH4/kkdZrh3Fj7dir5Gx7tyhYldFpv+IH+Z/sjpgFx9MD5pc
	Z3V/YZjSIH/ncxyd2xjLLzyn5rCbdgNBzB5TB7WHK6ofiThA8TySVw+Cc3RuA==
X-Google-Smtp-Source: AGHT+IH/7NRyoCVatSSiPzY0lDOkM5NNriw1/JOeMDKXPeT6FeWVOrUY6eKDYQWOZSPdNThD4dF1gQ==
X-Received: by 2002:a05:600c:3509:b0:434:9c60:95a3 with SMTP id 5b1f17b1804b1-434d09b50b1mr47760175e9.11.1733301192760;
        Wed, 04 Dec 2024 00:33:12 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:9a15:2a41:210f:f75b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5281229sm16285055e9.26.2024.12.04.00.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 00:33:12 -0800 (PST)
Date: Wed, 4 Dec 2024 09:33:08 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-crd: Drop duplicate DMIC
 supplies
Message-ID: <Z1ATxAsXFhQraQwH@linaro.org>
References: <20241203-x1e80100-va-mic-bias-v1-0-0dfd4d9b492c@linaro.org>
 <20241203-x1e80100-va-mic-bias-v1-2-0dfd4d9b492c@linaro.org>
 <f65e1559-b409-4906-aabb-eb24b5b0fcf2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f65e1559-b409-4906-aabb-eb24b5b0fcf2@linaro.org>

On Wed, Dec 04, 2024 at 08:20:15AM +0100, Krzysztof Kozlowski wrote:
> On 03/12/2024 18:44, Stephan Gerhold wrote:
> > The WCD938x codec provides two controls for each of the MIC_BIASn outputs:
> > 
> >  - "MIC BIASn" enables an internal regulator to generate the output
> >    with a configurable voltage (qcom,micbiasN-microvolt).
> > 
> >  - "VA MIC BIASn" enables "pull-up mode" that bypasses the internal
> >    regulator and directly outputs fixed 1.8V from the VDD_PX pin.
> >    This is intended for low-power VA (voice activation) use cases.
> > 
> > The audio-routing setup for the X1E80100 CRD currently specifies both
> > as power supplies for the DMICs, but only one of them can be active
> > at the same time. In practice, only the internal regulator is used
> > with the current setup because the driver prefers it over pull-up mode.
> > 
> > Make this more clear by dropping the redundant routes to the pull-up
> > "VA MIC BIASn" supply. There is no functional difference except that we
> > skip briefly switching to pull-up mode when shutting down the microphone.
> > 
> > Fixes: 4442a67eedc1 ("arm64: dts: qcom: x1e80100-crd: add sound card")
> 
> If there is no functional difference and this is just redundant, then
> there is nothing to fix, so drop the tag. But the point is that users
> might want the low-power VA. You claim they don't want... sure, I am
> fine with that but there is nothing to fix in such case.
> 

The fix here is that two mutually exclusive power supplies for the DMIC
are specified in the device tree. You can only have one of them active
at the same time. The Linux driver handles that gracefully, but the
device tree is still wrong and IMO deserves a fixes tag.

The functional difference is that we skip briefly switching to pull-up
mode when shutting down the microphone. Users won't notice that, but
it's not the intended behavior.

I don't claim that users don't want to switch to the low-power pull-up
mode (VA MIC BIASn). However, we would need a different mechanism to
give them the option to switch at runtime. "audio-routing" just
specifies static routes, so the current description does not allow
switching between the two modes either.

Thanks,
Stephan

