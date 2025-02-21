Return-Path: <linux-arm-msm+bounces-48896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC900A3F742
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F37A177785
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 14:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1702E20FA86;
	Fri, 21 Feb 2025 14:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jkb3lJf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4666320F09A
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 14:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740148160; cv=none; b=TqaKrCnbmDS+paf2p1NAI+jYGZHN07mVHWsuwBqQTbea5q42wkmz98FIPDqvXvNaUG4lp4ue+owLepewQaUCZqUdZCwGt+YtYT2SqNd5xdbC7di4Ns6k4AOQkBTDqjdmV6+6SEVCzC1xhmS3Ve98V+9+zlbNBlYspAVy2kUSgO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740148160; c=relaxed/simple;
	bh=SMB7Oulg94+Z2MBXQkXTAnaPYqD3Nq0hNq1RuWs5tLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xfw5Ugci0Bf7qSx7HZrEyEOcpg9SC5h+409MTo4/x//wZYmlltY2es9Sif1qZP+d8hqmvqj/t6ApJ5/M55ionwIjHP2TGFHxq9DbGlc05IOd0rD0Kz3lzX94vnsIeVH4P7kuJvd4XsRvQygkTeYpAWXLUffJo7GbbnPZ9W8IymQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jkb3lJf0; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54622e97753so2006092e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 06:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740148156; x=1740752956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ddnou9M8kk7fCYmjkasHAfLTYCVLBdDBekbF0GdJqMI=;
        b=jkb3lJf034Vj64vkiINw0tnOwUbAhoNxu2vpPyyoqypkbkLp99lqA0jagH+e2rRBnu
         T+RLJcH0QfKMmCgcYrG9vI/ClOpJY1kvojrkR/ZEkovITtsNOLl9uZbmu+/luZy9p3Em
         rGCAKH1CWAoXZw1IFdYZajuam6XdN0HGduWxCarOUQMJhhEi6VNCE9mRo2gnT9mGKfVE
         v31sF2EelGyJDz05AwxJCZOEJEVV59ZARS4FLrkRTVZfdCP9/ACRkspN999jsHfzkG4T
         6H0kOWDgFHWKnLvoXhy33M+cahmvL++iCUroVGsEORKw5UpxlwASjaGszbQLp/LHRlOq
         Y3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740148156; x=1740752956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ddnou9M8kk7fCYmjkasHAfLTYCVLBdDBekbF0GdJqMI=;
        b=XNodmZdBy2KhDy8rKAgq/EiCH3x3VP5eD9BMBhrN/EmWjABcZfZSpGpUdbnOTUaj1I
         GhRy4mhZXLz2/NHxGQBLimcld1EgeBfAHA7jOiGCMRfPC6HeENyZa/ErAdt7kFx1POLi
         fJWV8DQ0bOgeNgG/ajaUXw6erEusT+/V5/yC3DmQ4DtYVX2wUagOxpgp8tYnbYKYi0hw
         SG3lopOYK/+WWRly+J4kyhigCI2Y3PQZVt+uNPHJS1DEpIGj8xQcXxym9dMppuLlGIsr
         bbvxXnJxIUfVMMg+xW3Uhx+kVRsPo9fM/lcJgy9DxGygQZaDSgG81irgOksHcT9vUrWT
         rniQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf519ylod6xZe/KmvYMWfxVg0+kB6Jakz2zqiaTO7+dadRG4hj0S8Eo7HFQwd1k2zqbIZ392Of5jhnlkfX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2C700g0qr7xeg0Eu5Y+AnbUGHvF6o87AzfU7YGXtQNTC8/uZK
	3hg34JWJXL0BzhvwEZda3/uzPMuOXneiWZldCOPC1V1NB4N6/KgesHKwbvHSHv6wvMoT9Ff8kGf
	1
X-Gm-Gg: ASbGncv7+zaXEFl6Ar4b4C0QzYm9twKkBOT/K8ebx1vD+AXjti+zl4Skga59vW00wQZ
	Hh8HwBDvg7zTUpJGlfTBgZ9JubChEv7uwYvZse1t2dq4IAJDlbj9Y3x0G4dzxDq7WuqV8G3Jmmh
	tE8HgWZoY0e5Fhnv89phFw/OGb2miclNpyTd5hfIJuKUCg3zjGIfKTdRFW0mJcsw54zujXIQnsO
	m2/nAb4K4moJkwdGn7w9yjlo9nLwIWrrahb3RCrYzi1oR1SL5DqWiJIgm6B648/aV+1ovsI0Rb2
	nGOlw7LPxyq4ApXDcDaVKt22OK/xQ0vyDqDXPwjsPKLugxgAkM+N9uF7Z7FdOb/MC4M8rU7jNcb
	+pK1+AA==
X-Google-Smtp-Source: AGHT+IE7b8g0z8/f55VUJfFuqsgXzs5AvZYpknnwAYynQLfST/ypxBMEs0bl4MIebB9oZLpkqp9CMA==
X-Received: by 2002:a05:6512:2212:b0:546:259b:9a99 with SMTP id 2adb3069b0e04-546e0dfc180mr2925902e87.0.1740148156301;
        Fri, 21 Feb 2025 06:29:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a25e60982sm19678111fa.83.2025.02.21.06.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:29:15 -0800 (PST)
Date: Fri, 21 Feb 2025 16:29:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: amitk@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, quic_srichara@quicinc.com, 
	robh@kernel.org, thara.gopinath@gmail.com
Subject: Re: [PATCH v4 4/5] thermal: qcom: tsens: Add support for IPQ5018
 tsens
Message-ID: <hmhagxzvumlmzvnbw533ebzilbvknexarsnxjfwi4djq3eabkc@efferfxbxkt3>
References: <zesif5ehsoho3725k4xjqhb3tizj6fj6ufocdlzd3facj5hrrt@r4t5hthvyp2p>
 <DS7PR19MB888370DA2FE2AE936C47C13E9DC72@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB888370DA2FE2AE936C47C13E9DC72@DS7PR19MB8883.namprd19.prod.outlook.com>

On Fri, Feb 21, 2025 at 06:13:12PM +0400, George Moussalem wrote:
> Good catch, thanks! Will fix and send a v5 after a quick test.
> Also found that the addresses in the tsens and qfprom nodes in patch 5 need
> padding.

Well... DT suggests that there are 5 sensors. So maybe the code is
correct, but the commit message isn't.

-- 
With best wishes
Dmitry

