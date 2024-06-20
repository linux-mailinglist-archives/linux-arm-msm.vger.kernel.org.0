Return-Path: <linux-arm-msm+bounces-23444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7465911363
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 22:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1244D1C211D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 20:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF2A55889;
	Thu, 20 Jun 2024 20:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TuDoqGLx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2DE3C6AC
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 20:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718915934; cv=none; b=SR0EvzUt4h8NNuYTWeV9Pzl0eW6IVEtgQ2r8+mSd4UPdZtSQVd4fstElOUUYcY7aP/3FQ5lxTiDpa67FOAFn5G0kB+yyXQ8XnMBn86ypTpMzzONWJLaFdpJ79pm+kHVD6kwvROVM4VuHk1/3iCZ6A6ZcklVseNIN7hJdoBlq8bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718915934; c=relaxed/simple;
	bh=oGap+EuOGFC5B/6eNk2XEyAmiNddzucnVXUXSsR1hmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgnRNObwiG7Ov4Rvl7iXA9wvT7VDkfscIY+r4d7sejA614wknKvyx23PV8sZZ6s0L3P56/Zc32gg8VSRHBgIYvbKjJrJEnurIEq0Ni/WEUYv/7YdTr7hcDKEpKOzF7KCZhhssx5X+l0SmxsBv91Y85/MtC7OWHeYbUHSWZkYWUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TuDoqGLx; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec4a11a297so7628511fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 13:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718915931; x=1719520731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=njLEEuZyMxfG5FyNtjads2hMdYAWqv6cZs0xVoAuq6U=;
        b=TuDoqGLx5g6T2gGcw/SiBxukVf+ffuEn4XSmqfVx3FWCMd4/3bFUS5xQgknv2L9KK5
         z/DaMqVQ4brImS8RmgNjm9skZRQcCGIbnsmNS5Hzl9cJ9FkXVzhIl6b3vofiXJmd2uYL
         7u/cxSdp3R6SQBUAU1HDtGKxyIDGUpQ6v8JetYShJmalQEaMb2gbXN1jb2TUHk0s+fFL
         dFjo8mPyD9lfZ/3p/eaD9ygMGpG0ChiMKOCBzTvbKLmAudx4+e8QGIueXpPdhPduqCQO
         pnv0+R1l8PrDk9WUcmjAy8gP3hoh91sy4j+oNzNtgcecJ8Oh1qiK6QNyEOTatmLalKFd
         rRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718915931; x=1719520731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njLEEuZyMxfG5FyNtjads2hMdYAWqv6cZs0xVoAuq6U=;
        b=xKaNYG0ivJDt6tgF2C8eOxVaeIc2fsdFeLpfBK9VUHU2OxjlIQmdfQfDLOawVRoFve
         J3uE0T9OX4UVK2GbZSmGGbzvojUsoe1eUlVdXbkCPU9WfGYiFMr4TtCxItB8DwctE7jW
         CPWLdYL5I2E73ZjOZcFei/yBGl7BxjTZQLZNC+F8YseKSvx/po94VFMO5bJJhPD58PZB
         gTUYQ4Ss/7YShL/C2dvB1Ijv6NGHIFHHycesoXmiylnLAewkdulB+RbRGxOgElR9boys
         wRCZ0fRZy0+4zH1IK4V23fgYhjhlrS4S6+COv7cxcZH24btBEywtKpIc20svztH9ySqp
         B3fg==
X-Forwarded-Encrypted: i=1; AJvYcCXEzV7gXnKd//ay2VTPQXUKas2a3xv0TDw1hytEImCkArQk/jRXD6ClhUUusl3oATmZczERtKmYbr6MwjCK7e5fiPmAUViPD7ejPl3P1g==
X-Gm-Message-State: AOJu0Yx93VS1qBj48whpXWzJn3oZmJjnZK862AfzcFji7rTYbeExtWXH
	yCQ1CgX7FW/p6lO8gBRnkToKzparesfS9uIiqzTh0QAHDqb2dxHxKpfdZLBKz1PTskOghadxpN7
	SPpg=
X-Google-Smtp-Source: AGHT+IGoVlJFt1tcSG+42UB1lS0RFqpVYqmcQIHJmbgcYNlgSAK09MN3gK92Kpdt1cLgQa/CDhV5Ow==
X-Received: by 2002:a2e:9241:0:b0:2ec:2a7:af46 with SMTP id 38308e7fff4ca-2ec3cffc600mr41397251fa.45.1718915931328;
        Thu, 20 Jun 2024 13:38:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d7090a3sm154351fa.46.2024.06.20.13.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:38:50 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:38:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] ARM: dts: qcom: msm8974: Use mboxes in smsm node
Message-ID: <7irayxs62grsgimv4764ujmrgbj6fepvj3nqa2sjglcozcjasq@yv6b7rn7lyvc>
References: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
 <20240619-smsm-mbox-dts-v1-1-268ab7eef779@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-smsm-mbox-dts-v1-1-268ab7eef779@lucaweiss.eu>

On Wed, Jun 19, 2024 at 06:42:27PM GMT, Luca Weiss wrote:
> With the smsm bindings and driver finally supporting mboxes, switch to
> that and stop using apcs as syscon.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

