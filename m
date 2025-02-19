Return-Path: <linux-arm-msm+bounces-48529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A32A3C4E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 17:23:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E83BB189BF95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 16:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5EA1FDA9D;
	Wed, 19 Feb 2025 16:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bHwMpgY8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0AC1FE460
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739982173; cv=none; b=RkegoNBiztk/vfRLjUruuVFwRlD4Eof+qGZlofoEjwtATPB20c+Z4iTNMrXCwH4Bkwm4CCe/sghIvVZ6GyOzYOUkNybTIh4xpZC0v8JDeRKjCp/EiFiN4WXN7tyLh4OPhTNSk6jOy5qn98d09ogoLVEPrZXFoUe1+VnrIbjddGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739982173; c=relaxed/simple;
	bh=BfUU3tj0y61ulsrpxN8DkNxpVjymHHmrTW8yGNh/Ipo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4GJXPi8/32jeluzm9xyv0X3BiDZP3JkUXNCCzmVoZW1p8g155D9gtXCuO+yVYsOFOsTB7GeDBd7CkiuCUGVpUDceudZfb2ZKOJlMwHz49I27X3L4i5Uk5Biq1djUVyGi0b+Fa/u6c3P9iTHsNT1oc2iQuphhQk8jZ2nCaakQSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bHwMpgY8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4396424d173so71485875e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 08:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739982169; x=1740586969; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xZxkylCpxcKqeTMhEvFKzvh12lirSDj2kbldlCMXfnk=;
        b=bHwMpgY8CYkFr/NxvgVROGYx68K5HXtW/2KMZxqpIYrFdvvAKjkOg3z1Qlk2MvRvBQ
         S7bgRAZhmPXvR6gmU/0WoeHnFEb/MAdUnkEIjOenpsMHKz6TtkvTBk/9Ar8TzNz9BKHr
         iIa9FIo+8xNMC5ur0Jdn9Uv2pFqRc9Dj9QH35F7K4cy8NKKsIWvt/hu9Q1ScZus2pEvx
         CGm5m4zJTPOq0ppUdaobZ1402Q/VmJkfF/e1FMc6oNQvI1N7UhtIJes6CtWWEpkaybMp
         kmocCzr+aQneHOhcsclbahfYzv6hT/K9TCrE6EeO7KQNg1UXLF7hp4pT/YN4gc5t72lI
         lMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739982169; x=1740586969;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZxkylCpxcKqeTMhEvFKzvh12lirSDj2kbldlCMXfnk=;
        b=oO2J1fFURWPrDEhSEVkAvJl02/llsESv2G9FGtT0uDDhzSWu59LZ6tE0kXHSbmbmBA
         D8kbnYUwToHUB0UO6UWhHLIW5QJZ4B7pGScF+xCqq0EwtRmFsFmh6mxV6FKSQbb+BUqr
         2gGnZbFBghWvPS0Gow4vENxYrXppzFuicav9YuA3WtPqRM/N7ivhyViVS9wCgU8uW5vT
         odhYb9m8BwbU0+RqARJqimegsNU7Gkfn9k0KMjjsrYiIC7toHkiLud4fga2GHx9GAvLS
         kfByfYoEwH/4qfDFBBxYFdz5ab1bldys3RGkHTxWnVIKuE5VmYnydxEcVNE88y1FDw3K
         GrAA==
X-Forwarded-Encrypted: i=1; AJvYcCWjPvTR9Co1mG9OesRD5i9hoiXKVNyek04XWkdG5/1Lg54ioQ0lES+7Jq/u568YLECtFBgJsK/NFgSj8o0E@vger.kernel.org
X-Gm-Message-State: AOJu0YxERL+09Q0P90S3tw7AXaiQgM7Ya0TN3VI3BfJDIiv49BZYdiYK
	1jM4jb8jb7EunYVLlr9Zm3PigNAn1ijdeukdEJCvGEjGvOskzPeAi4XelTz4RGQ=
X-Gm-Gg: ASbGnctDc8LqI6s9ZJEM45LGqWfY/v+fPt0AU8g85Tl/Xl7FdG0/oxHmki5RL/hGY/+
	lj2hMx6Q3dbxBQTTBjGX15BVXcvOj51Nwzbo275tDHbYCkQ676wV5gfBwswxrtzfxDQTyPjgFZv
	rX4mP40rn4Sd6o7Ez6eW+HS4Zu2ypk75YRv6fd551e516P5VOo3VaM2pul7e4NwnV/Fw23GC0+O
	LQIu8wXlmMRQkdZi6IpU+YP8iXE21MptqtHoA9EpL/c73vZMXkwfi3H4UXtjd4HtpzUu0jhUHlV
	0riGd5nch33vLrDNkqSFrAoeCtA=
X-Google-Smtp-Source: AGHT+IFrg3yf4JcqaRp6NZLS1mkHW305I0jkYCCmmdyg3hiS2qC7EOcbCl06hDkIssNpoO94V+nypg==
X-Received: by 2002:a05:600c:4e87:b0:439:9274:81cd with SMTP id 5b1f17b1804b1-439927484b2mr86162505e9.4.1739982169458;
        Wed, 19 Feb 2025 08:22:49 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:c59a:9aec:ce42:c01f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d8dd6sm18476087f8f.62.2025.02.19.08.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:22:49 -0800 (PST)
Date: Wed, 19 Feb 2025 17:22:45 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: x1e80100: Fix video thermal zone
Message-ID: <Z7YFVZ5usWjrjabg@linaro.org>
References: <20250219-x1e80100-thermal-fixes-v1-0-d110e44ac3f9@linaro.org>
 <20250219-x1e80100-thermal-fixes-v1-1-d110e44ac3f9@linaro.org>
 <Z7X4niv6g89LyBP1@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7X4niv6g89LyBP1@hovoldconsulting.com>

On Wed, Feb 19, 2025 at 04:28:30PM +0100, Johan Hovold wrote:
> On Wed, Feb 19, 2025 at 12:36:18PM +0100, Stephan Gerhold wrote:
> > A passive trip point at 125°C is pretty high, this is usually the
> > temperature for the critical shutdown trip point. Also, we don't have any
> > passive cooling devices attached to the video thermal zone.
> > 
> > Change this to be a critical trip point, and add a "hot" trip point at
> > 90°C for consistency with the other thermal zones.
> > 
> > Cc: stable@vger.kernel.org
> 
> Perhaps not needed since we don't have a video driver enabled yet.
> 

It will be needed to backport the next patch (and reordering the patches
wouldn't have made sense).

> > Fixes: 4e915987ff5b ("arm64: dts: qcom: x1e80100: Enable tsens and thermal zone nodes")
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> 
> Looks to good to me either way:
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> 

Thanks!
Stephan

