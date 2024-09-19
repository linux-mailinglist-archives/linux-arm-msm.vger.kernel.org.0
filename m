Return-Path: <linux-arm-msm+bounces-32035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BFB97CE53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 21:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E6451F2388C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 19:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647F31386DF;
	Thu, 19 Sep 2024 19:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d4YSoGC7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9178C73440
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2024 19:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726775905; cv=none; b=sSWMSr847rQ/EqPDbKL9tfSiAK2jmNIh7IkLXSmCsEHCukSJ7OzajmjaXp4FOEaP8s5IiWgxgJbF40/8bHqqg7vIiusvAk3deBAEgY7cBCoKp1WYmuSYHyz6WBfaUg4ih/LkW0jqqsoN3MOfHnImsBXsgP9dgEEJf0n+iWwjaSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726775905; c=relaxed/simple;
	bh=aI7ClF1DwMBcWkQTFOuFWUi2ar++4bwigfoB5y/OgFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6iRMzyPuGGrmheLThrCzKN/0itVyzsMHLhnPyNQHj+epyeIDEYPdE6WWkJdWQThxeh5rViix0EUm/DSlhHX1TgOxuvXxOB0eNdLHRHWJCDXypmebmPxlufwMh+CbapBNtrTLu8jRNVsog12VsI1y2K+pHsai7UTD3o10f7l3a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d4YSoGC7; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f75de9a503so11941301fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2024 12:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726775902; x=1727380702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3T6VG4XZ1eVpUOvChP/8TFuvY3C5TZIY9Pixa3iMraw=;
        b=d4YSoGC722pcKxQ1SRPU7SQFBF4lMk4aSufXM1WownEY4GNInRUt/4QZwqDP/nZyT5
         a9G4q/b7QslJuON8Qxe3LYfM8LLP1UVfKxyjw0xfJF4sbJMsYYzul8ADA3H1WGcMP82X
         mnzQtJgdkgEO9XxrL6p64T3oscX0zTZtv13HiAjRQiOKDxFww1NQzCQonQLlA+JKeerh
         3SPDrKF4qWXW6bj7SvffDttTLi226bzYeyU/7Q1SPaO4TZoCr4h0dHvOV9C1bPgVn5oF
         +wWDgmcMbJNX6S2fbMCoVy+EOpe6la9ZDo629t4QhKVfCaR4qdjeRpVzwv++dWbyTOQR
         q0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726775902; x=1727380702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3T6VG4XZ1eVpUOvChP/8TFuvY3C5TZIY9Pixa3iMraw=;
        b=LJfKRMsi6PrssMwHJ+luPf9WtzwKas87ea63XSIWqTD8UXAHivw/XU097h8iYTikH7
         0wL2QkDd4UvWFdZF5RPyEfvvgdWmpUs1APUhGzq6OssnWwi03N7QJ9u2vYxt31PuzL43
         1jT6dP0CVv7/MOa1SLgmjM3u+xZ3JI/7+zPh8oKVLUZ7ZaYlBrflHZDBHk/9A4njw2o6
         r6ENAbhsJ0i/XkkMqWlKfL8WDTIS7XWwJypgiWDcFg3wJzKBcts4SO81ShiTTKGKMIlY
         mffLRzfJJpBvVVXONJEWbBqc/LDpZ3vkMOuhlKO6Sc7T6rcAXPSIF3De6RclvAfDfl2T
         xLqA==
X-Forwarded-Encrypted: i=1; AJvYcCViffzvBc9tmjHO/waTWIBL6Q1IGtUbigqMl6YsZZAJlcmEUT+rMSGEOCyVO41j1wC5xkI1y9jPUKeKPUcc@vger.kernel.org
X-Gm-Message-State: AOJu0YyGvoHxjFCq6t6gJBl+3gRz0eA0t+3FXQJ55Hoq/+EReeJd7ALE
	/Ysoftnsu8RX6Wx08sf3xBhf6wm+Gjw4L5LVPC69WV5XUnBAue5McvppEOt7d0k=
X-Google-Smtp-Source: AGHT+IGGqyOMIVYAeKYZz4EQw1D3YuqXoDUEoNQl2L/Xv/bG3uOuEYCOKU5H2YjX2daigmABvXadTA==
X-Received: by 2002:a2e:83c4:0:b0:2ec:637a:c212 with SMTP id 38308e7fff4ca-2f7cb348cd7mr4137061fa.39.1726775901683;
        Thu, 19 Sep 2024 12:58:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d37fb73sm17030821fa.78.2024.09.19.12.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 12:58:20 -0700 (PDT)
Date: Thu, 19 Sep 2024 22:58:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: enable qseecom on Lenovo Yoga Slim 7x
Message-ID: <6qcffqabpvfycrapicd5g7dnjwneqzdodx6hkzx3ybd3jxu74k@7kh3crxjrbal>
References: <20240919134421.112643-2-maccraft123mc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919134421.112643-2-maccraft123mc@gmail.com>

On Thu, Sep 19, 2024 at 03:44:21PM GMT, Maya Matuszczyk wrote:
> I'm not sure how to test it beyond checking if efivars work fine, and
> reading and writing them works, persisting after reboot - adding a new
> boot option with efibootmgr works perfectly.
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

