Return-Path: <linux-arm-msm+bounces-45078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8631A11ACE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 08:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDEF11887A38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 07:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BD51DB124;
	Wed, 15 Jan 2025 07:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtMcDbhe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1858C1DB120;
	Wed, 15 Jan 2025 07:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736925720; cv=none; b=ZayYKCCwa0aVreU3rcd2nc7INSeSMNSO7yPxMMMG1qFIFwsUGNQZqRKi0KsDcPBk9akFJP0Tupgb8Kthad80erS5Kyf9EquWmn0YCaH+RpuQQykeILe5BIZpIshW/26Pl91u9eg8kLIsLcZdo7yDvStQbA96ZPYL5z/3XTLAlTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736925720; c=relaxed/simple;
	bh=v3dJ11Ku/1ifs1WYwNNMtv6M6waHee+WaoC65BW/rdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pcq7F9B32nvtJWABp0VphBbeIaGe72AXYlDBZyoSzpl+F8XLlt+jmVD7XZ7SR8qQZUtD/lsd+Tl8UvzBH7JKbNJfHvBFZtohWgnUC9u0OpvHPdzBEMbeeS3NXs+yRx8M2AKHCSpUYfrEML0HSWSYm4DOL641dmuVmdpBZ8BV2v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtMcDbhe; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so1355230166b.3;
        Tue, 14 Jan 2025 23:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736925717; x=1737530517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jJOZ8iSprIsgYBR6gktJkwTdtpdLQhJkgJrSkbc8Vag=;
        b=dtMcDbhejJHgdUD0JH1DSFVEDhm4hF5BhJzgBVnCtpOH4hwKMlgPIxZKw1sj864R3Y
         xvFJsrmSbh/wCI+h06CXnIBx3Tn2e8OXO0hTkH19lvoGs51SSj5Ck9ohfELY6s1sYz+M
         ggfbVNIUf5pGivFVosoYvkgR/Eh0uRi+z+oTV1T2YMjn3Qm9uWzvR/mjJkk+4VY1bZst
         FkJ5tovsJvYJtqy5JJqkQPY4MlfIt7hWedCVuR6Cm9ltJeHDGaM7nWy6bO//WADCmhIP
         im9VdmrA/rn8xDMMNAH7JUtNipfa/fryW3YOmCkcTEeXMKXjkIM4d9EYGESa0NE0UDzj
         XwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736925717; x=1737530517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJOZ8iSprIsgYBR6gktJkwTdtpdLQhJkgJrSkbc8Vag=;
        b=XaEWLvLdw2Ps46J7Pmrwxq0rvNAkHVCPpRc7AzWZUGXmW+Wk5LWSWb1UOqpd2/ZMBI
         9k6v/rtTFv521A4qTGjSJD6oGseCm/7yOcXqIyqtO3pChFAiGQiMTiCbW4izNaw2e6vM
         LzEhOA4BMLszsPcB+kXcpDR1strK3oCcFmmwOBi7LiTKtuPeR+BkPxijt0K/kXS/04KY
         M9xVlg+waURk5sSFiyQgmrR1WUCsVx4ORkaMsNMf6YCRxwmiQ1x3hUJGaM+9AOY6zZg9
         J62C40GA/bPVhR8i86OMOzzphbnWnOX6Id7w0L7v3KGzyROTqs5NPw122qRlwdgCU92X
         J5Zw==
X-Forwarded-Encrypted: i=1; AJvYcCU5iZ05j6JQwpQd4lIlcdKbbGXZU8b3t0KrhswpVhc5Nowe05S1f+vBt+TFF8gheBZjkvKy9LhB2Yg+ISjY@vger.kernel.org, AJvYcCVEYxExM84ISWggDXA6vxcnpELKe3bSNwuCDj/oMklZXZPaAz7k1CONLO94+V9uIceHX0TbOolPjbiBF4RN@vger.kernel.org, AJvYcCWGWDnQtC3c5AE8HSMT7G77s3fWrUH9FAEiKUo6UC37ayDuJwhVSQogv7zDdpJ8eo/0QlVVRN4m/HCs@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwzy1apzzVTApVhO2MH+fw+VLfiI+sBYmQuQb8ytsHkgOalob6
	GD8ptscwXkkKMYmq1ZovVrgiufa4j7XVm6A02uNec0/vQer/g0DP
X-Gm-Gg: ASbGncsbqI9SNg3qoRDNgrQDY0EDFPQQ3C5wdP10zQxtfcculG9uSY9AcMh6yVZM36s
	FkB8EGYX3wBSUjZ8dYE6TQtkmNdsvftv2gv1fyu21aRfMH4IxlQ9DM46YrjDAoS+riXwjVC0h49
	iaDhDbNJLQ7fRsLxgSJMSJDQ8zLrao30vyj8D2DJ+OU0tB8IRITNLwkumTPKG6p+kHw9UNlJRVQ
	QPeJDFmP3x7qW+eOnLf54epl/2XoQHuvxzGHIIpu4K+qZ9pRorT/n+LSgUecL30imPrt8rBk8WZ
	lvtD0p70YZvBInmxNL45
X-Google-Smtp-Source: AGHT+IEo1jzvdjSj4rUavMi44j/cz7y7Xxsd1KUIMl5S9cj4ZW7fgVD52s71mpMGjJigjjX+CyoeUQ==
X-Received: by 2002:a17:907:d89:b0:ab3:3aa6:7d69 with SMTP id a640c23a62f3a-ab33aa681a2mr637798866b.41.1736925716928;
        Tue, 14 Jan 2025 23:21:56 -0800 (PST)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9563b11sm724880766b.128.2025.01.14.23.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:21:56 -0800 (PST)
Date: Wed, 15 Jan 2025 08:21:54 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] clk: Use str_enable_disable-like helpers
Message-ID: <Z4diEj__bbQl4ULS@standask-GA-A55M-S2HP>
References: <20250114190612.846696-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114190612.846696-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof, 1 note below.

On Tue, Jan 14, 2025 at 08:06:12PM +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:

[snip]

> diff --git a/drivers/clk/clk-nomadik.c b/drivers/clk/clk-nomadik.c
> index 06245681dac7..f3a73ac5a1b9 100644
> --- a/drivers/clk/clk-nomadik.c
> +++ b/drivers/clk/clk-nomadik.c
> @@ -17,6 +17,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/seq_file.h>
>  #include <linux/spinlock.h>
> +#include <linux/string_choices.h>
>  #include <linux/reboot.h>
>  
>  /*
> @@ -116,9 +117,9 @@ static void __init nomadik_src_init(void)
>  
>  	val = readl(src_base + SRC_XTALCR);
>  	pr_info("SXTALO is %s\n",
> -		(val & SRC_XTALCR_SXTALDIS) ? "disabled" : "enabled");
> +		str_enabled_disabled(val & SRC_XTALCR_SXTALDIS));

It seems like you flipped the logic here. Was this intentional?

Regards,
Stanislav

