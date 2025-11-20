Return-Path: <linux-arm-msm+bounces-82694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC4AC74BF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 16:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 300E135A036
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 15:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BF42E62C4;
	Thu, 20 Nov 2025 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KwcJ34sb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5BC2D6E6B
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763650817; cv=none; b=mzDCI0XWhis2eT7qc3prJ98K2YXHbcgplkptj3qTjZ4Rxvc8YlzdhcZVugq/gbpKXuhAR3LTC9xtag7Pa9FdNasJnFGxClEh4u2QGYKaVgdA3opbUl1ctlUszeQna8ShfSPIYFdI7G+SSoJGXMg+kG0aOoTaVaBWbkxtyMP6SaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763650817; c=relaxed/simple;
	bh=xgjesNCRh05U41XtZs4CNpAsHg3mkNPSmnZ/h+qOQrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ode2Eei35FSFoD1rlCSBzyE68lICUvrZPlkA0XbcmC0O1z8R7UVmruNENLyonPNI8VSVytxUJwRTtJ1qg95oKdh6DGCd2Gb+Rxvevbe7MAnRpdTDM9wuzzvpfdpXV17PwmtQ0vwOhGTz3OOntWYNja7qNI0Qin0aPtBaiLOfwf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KwcJ34sb; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b9a98b751eso828070b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763650814; x=1764255614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=guN3/A9RDKesdWeSExyBOWXz8WsrEM+zBWVUbp5CDDo=;
        b=KwcJ34sbx0BuqevuLuo1gEH5WoPRecJEJYIs7WbBIGcflf6Nojs7CgFsUBr63UhZEm
         3APA3jhUDr+klFkLV7+hEeh8upVvFblLgbuRYZmzffUIsgVbdG3f9wZM0gvemOh2A/es
         MSBeIeeN8W+qN1sHsEOiH87uo+nneP3ZJ30Dm/TOxhmpFcXg71vS02TdmccDuvmcbgd6
         ehGKYJnIZbsltAKwgI9bondFnP7gd665ZEcifTjq1RVwygOcACY33h7YV5V9eFvx8xZZ
         78+5HcHaJt+8X+7rGlTcu9gBbx0ZQq2vqwKNiVSV3g+HBQSZGKAr1yqv+Kh1i1zdm0Gg
         cioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763650814; x=1764255614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guN3/A9RDKesdWeSExyBOWXz8WsrEM+zBWVUbp5CDDo=;
        b=k231ILldXVnSt/GNudd2AkgN7zTB2HWy29cziXVSKBYV5Mhz6yOr13sxjQMZWoRAZO
         HBwyUVL7uH5tzMLLK/gZqx0yOtn1HD0Gph5LQvwaQCcDuNsBV33+ajqL/Je/cC2fBXif
         OwSz1jpUcHuJTyx+Mae0QxjNDVQGdYO49pLZhjwMFdCG0iMzOvxQcCzby9bIGtFCJjOe
         P+3hGIAHbxSyJmGgkfR17xihMcIJcYa9U4O4ntYPewsKAcfVjkeKA22AJhBvTUE3Goub
         efurMsIC/kkLWSYyVKXe3/FSDaK68O3rWv5qOIIRBGZ9TxRR51ji5qx3g/TT9AvQdBTG
         9w3A==
X-Forwarded-Encrypted: i=1; AJvYcCXjecmFRr3DWnj3eeaHeYQTAQwZIMiS8KkmSkV5emQDeVq2GM5kKpOVuSP261bhD40hgK6KjkxhPozDCMr9@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ5Uij5CsgrOpRQKPpI0VbrTCacFekI6PLgHTdInINkYHMpz6u
	GBUoKlnXs0jmNZ0MYolM90Fld6qw9cpBhMXnk8UDuM5E8Fwf1uNdKkxBggQQYf1UQpw=
X-Gm-Gg: ASbGnctb58/3yQ3QClK3mXKzG+7VqINBg76+VALn2LfFj/CrSBScV0CsVNtVkKgSOxI
	fp6Q+RVZxi85E1xyIDxJEYD9GUcwPr4IGz2qIZ9OmQcG5t9MZGBqVOK+/wJGjpQVzNJygaP3gu1
	5j0dwaav2A+3LCpJDMTLv31QLNUe5fQe5/aeTyDGE/aSxtWPno1Gx14AF2D5J8r2f/E0wfFR+vK
	4JJBqrQYlQgzu3HtLqO3NODjjHhCOcg4+Fa7Ib3ELXnICXi3gHndcyzjmd2d3IqtOBZz6newjDG
	4y2t/ZajPWoZxZ2jixobe9Je/spov0cW+NDQBZDmDFW8biY1QkYT2Z9OgWrp7C3DilVVpsrAnGh
	gYfQP3+iU+uwM7AK8T7/nRU7ytsHiAmSgWSThWWP64TS7v3MgL+DxZiYTtG54hou2p3gotKxmsa
	9+VeA7CxFg90yrin9UsmPC9CyeE+/N/kQc
X-Google-Smtp-Source: AGHT+IFQUlIetO8So3GJH/GYIL89TsemkOodGy6g+HZcCYNwqLeei6RZkHpwINCTUqkre5rA/o3bJA==
X-Received: by 2002:a05:6a00:1a86:b0:781:261b:7524 with SMTP id d2e1a72fcca58-7c3eef7de45mr4122134b3a.14.1763650812076;
        Thu, 20 Nov 2025 07:00:12 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed37b0c7sm3093109b3a.20.2025.11.20.07.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 07:00:11 -0800 (PST)
Date: Thu, 20 Nov 2025 20:30:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ilia Lin <ilia.lin@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] cpufreq: qcom-nvmem: fix compilation warning for
 qcom_cpufreq_ipq806x_match_list
Message-ID: <632sxqm4vxqg2e5aetuoakl5kkjb5x4zsyrdzqes7ylutiokxy@6tejdqp5x6ko>
References: <20251120133508.4237-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120133508.4237-1-ansuelsmth@gmail.com>

On 20-11-25, 14:35, Christian Marangi wrote:
> If CONFIG_OF is not enabled, of_match_node() is set as NULL and
> qcom_cpufreq_ipq806x_match_list won't be used causing a compilation
> warning.
> 
> Flag qcom_cpufreq_ipq806x_match_list as __maybe_unused to fix the
> compilation warning.
> 
> While at it also flag as __initconst as it's used only in probe contest
> and can be freed after probe.
> 
> This follows the pattern of the usual of_device_id variables.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202511202119.6zvvFMup-lkp@intel.com/
> Fixes: 58f5d39d5ed8 ("cpufreq: qcom-nvmem: add compatible fallback for ipq806x for no SMEM")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh

