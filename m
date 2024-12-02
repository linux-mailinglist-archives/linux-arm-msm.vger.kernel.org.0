Return-Path: <linux-arm-msm+bounces-39873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46B9E01E4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 13:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DF8F284D63
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 12:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EF5209F30;
	Mon,  2 Dec 2024 12:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BvhJpLxO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763BC209692
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 12:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733141468; cv=none; b=dULMIIXdhLE+k77JKsZO9ZLT1pNIbNniiQo7hVkO+AuS19E0hLJ+UFtjG7lFEEacAMJ+oLvsCziUKwHbvpsRfKetrGXP0xC1Q9DdKpi0a80AAekaMdprEmoNhGWAPs0tKRvSZzQPxVyDOijxWDqFqZVLJEGaJ+HV5SLHEw5AExk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733141468; c=relaxed/simple;
	bh=h6VpcuSndvt5gb/Lu3I7A7ng3nwMLL1ZD7IPVdwY++s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHLMBedshvouWldrea7i8TWqc0nsZLveQv48FhOo86NXtStO5iGPenrKZZtD528M/akf/m2q9QL44QfZ5zQzeCVj1E8J/UL+Hh/fizrmm1KA6VJpKk0s1dE/cJN4D3aVP+3qr/ar95Spw9E4K/+24xDFs+GSz0oUMfsQZDQsz+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BvhJpLxO; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53de579f775so5662746e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 04:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733141465; x=1733746265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yQXENZQVJNQwnHrGpO9XimeeddczjCL8gDUobO6Gaic=;
        b=BvhJpLxOWGf4z5LOJu1sLGJhk7b7mAU0wz2VVtmyrflK28Be8nX9jWEishs4RSSvEh
         y9ZhnI4D5D8xSo4A+K/sZxrtaV0lwMeKpRnMkHN7rxwZt+dZukd59uj1Ou3m+YllaFC1
         s2TpnZd+CCPmmSD/4QG4tn94qfjgw5U5CvzdjvPM2YYHBVJSNfY7GnuViEqx2nIEKRhy
         DLopHQ3fu3aknKtwk0nSO9dzv7ZIy+A0RarB0Y0P2HydFFtI0rQc/dOxxHigxj7tE9gU
         csAlkcXihu8R/dsOrk4P0kbHFI2GYueABRf1rQ2s2GQKqLZmrW9tEiHhY2lPC532nMhp
         MeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733141465; x=1733746265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQXENZQVJNQwnHrGpO9XimeeddczjCL8gDUobO6Gaic=;
        b=OUYUYPRruuX5V0e/e0+JifU2U8VY1791QB8ZMWqE43kLkotAaglnsuKhihcVALWOWX
         8c51Nv/+m5ogSrhcp31TNOjszuCUtpLj8UA7hUe8DTWnAC6/Ar5c9wrBpWmNkFI+8K5J
         ma3/x+SJKfaiFEo+++Jkjv2NBMAyl0OtSjvjKq7A/OFZL0UegiWcwaGRYCm5SmAnh9qS
         VmjOpiKI7cGkMfCMETQnG6P/hQyV9RR7YF/x+2UjCps0jU+6rnNBRkr+o/8gq5sKZufC
         1dJc8lslJpzHVMZeOCoQeulfauW6sS3UnKteISawr6n13INu+lWlCeTrQd4fQ7YH2lgi
         vtyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq7ABBp44cBOlF5ysccdQbz5Ler/+u7ha6ycaYxptZ8ZCUfP3K4gfQIqNGv27247qRFvcp/QdcsgEH87qb@vger.kernel.org
X-Gm-Message-State: AOJu0YzY2DDu8XTMwiY56XvbXXPe0ULQXpMpWT5zJ/bi58P5Q9V6kqk7
	ykhuIaz/MVn9SjVm6m1D0qoK7tVtdzGI/xha8zn/8YlNwtw1MSgAj5TZ8r90QnU=
X-Gm-Gg: ASbGncvhBKa3SnwuI5jvK0h9D/WfgjzCzBJaN5Uk2Sfu6OEc0f82fSOgzOMet/WxOBs
	0RkrV58e18cf8XLmOe2UBVlYhgGDhnw/0JXV/KyyOKTmNButN8HAr1fZjHbXzaGL9Yv4OzPITv2
	/ZbSrafcRo0u/AogoKKl5BlhHF0aZyinC/BvrMPxj+/+kv4EOHFpXpUTex3TeXviTTuso5weeX5
	RfPJSyJIzX1eCBMsOXKSPcbF+Km+1v+FjmV2i6FZSCUbOqllGA4oK+TME2cFcC09HE3GXfO6k0t
	B9SZ4ysd7MUw8vrccQO+MDNYR5i3hw==
X-Google-Smtp-Source: AGHT+IEzRcIhzwnknvixHamvE9vlf/Jqh7zUcscNKtxe89RF9mRI+5Y0+FdqdzWwutifP0uXEZ5FAQ==
X-Received: by 2002:a05:6512:1247:b0:53d:deb5:3376 with SMTP id 2adb3069b0e04-53df010b17bmr16440685e87.40.1733141464583;
        Mon, 02 Dec 2024 04:11:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64968d6sm1416507e87.200.2024.12.02.04.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 04:11:03 -0800 (PST)
Date: Mon, 2 Dec 2024 14:11:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Gabor Juhos <j4g8y7@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 00/11] Add support for videocc, camcc, dispcc and
 gpucc on Qualcomm QCS615 platform
Message-ID: <urlb2pn3cezyx7e6fxxf4j7psmf37amshnlzu7buixp6sxkrgy@mg4zljxn5s3v>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <a4f6ojknv3hats4rwmdg5mw2rxhx7kq4u6axybdawak54crn5s@xnjbl7zno42s>
 <bfabfba2-6688-4461-83d6-b6f4c86b08ab@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfabfba2-6688-4461-83d6-b6f4c86b08ab@quicinc.com>

On Mon, Dec 02, 2024 at 01:09:12PM +0530, Taniya Das wrote:
> 
> 
> On 12/2/2024 9:55 AM, Bjorn Andersson wrote:
> > On Fri, Nov 08, 2024 at 09:39:17AM +0530, Taniya Das wrote:
> > > Add support for multimedia clock controllers on Qualcomm QCS615 platform.
> > > Update the defconfig to enable these clock controllers.
> > > 
> > > Global clock controller support
> > > https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/
> > > 
> > > Signed-off-by: Taniya Das<quic_tdas@quicinc.com>
> > Dropping this series from my queue, due to lack of response from author.
> > 
> > Taniya, please answer questions/feedback from Dmitry, Vladimir and
> > Bryan, and repose as necessary.
> 
> Sure, Bjorn, I had a dependency on the GCC patch.
> 
> https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/
> 
> I will fix the comments once the Global clock controller patch is picked.

I think this makes a good generic feedback (I observe the antipattern in
other engineer's behaviour too): please try responding to the comment
after receiving it, not just before getting back to the series.

For this particular case: there is no need to wait on GCC. Please stop
using the external dt-bindings header and use <&gcc_foo_clock> instead.
This is just an example, not a c&p from the platform's DT.


-- 
With best wishes
Dmitry

