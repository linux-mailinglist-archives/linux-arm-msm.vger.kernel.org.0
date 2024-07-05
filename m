Return-Path: <linux-arm-msm+bounces-25388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7E9928B91
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 17:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C72D71F212E4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 15:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F088816B389;
	Fri,  5 Jul 2024 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o95CgpEL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6A714A62E
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 15:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720192962; cv=none; b=NyZ3HQ7zYZONmD2sD2Z32zINOyVchnls4oKiSzLWgJA9+vHrrPPKg6jao7pnIqhRgs3KU1amhXG3uIsiYlxDCD7ltjrzzWIdH+6m5z0Q2ezFZ010fYxhm3xuBztqLjCA8Wi7lAK7X+3PosTJAn5T1Jkbbizp0UzWY6VwUwyOyKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720192962; c=relaxed/simple;
	bh=trJVAE+RoP6EF8CN/xKUOAM8YNg3UOFcO1h7+fE37nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCdx+AVzWid6X96JmG1acbVYn3jApAg60HAnzxxI83eURFalrade3wmbM1/IWMTvioNLgEJ/3cI7a3Pf9iiSDyiviujw1iIWoXropopVYhDLGdC3mVkeZ3WEwkk9DBw65cdU+csXOVfLJZabBDCoH+qlYhmJ8AeRlTTYJENPL0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o95CgpEL; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52e96d4986bso1958690e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 08:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720192959; x=1720797759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kmz4n3surT4p/OHHh6hdGsaM434nVMtYZWz8qb8y2SQ=;
        b=o95CgpELKoEDhtNHxvAsAQuDSpccE1y2pGTOr3mIckfDfGWtdMadf6sTMelf7wDeJ6
         VTY+bCgjAspUSHwl1WNLCv8VwN7qx39MKa6ZVgHB+L+hab9PIzzgtOcCRiLdhTtoroYf
         nehamwYDHxwI0tj8Ueu0j9au7KsWmt1be82c8WLPB2IEaAeoX1hdZHXj5pW0QlL9A07l
         AkQxCFCKsx2GrFgVPZBWPqV1txlURW1v2WHKuLbQXEuj8cJ77zC0Pm/ppMthaeepxLJA
         jfJLb8Xx1VfKnGsghu+/eIgO76Bu4DWx+4pqMKhXSxsycPjLyhTGOn59aC8GtZTalnL+
         E2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720192959; x=1720797759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kmz4n3surT4p/OHHh6hdGsaM434nVMtYZWz8qb8y2SQ=;
        b=pu0p6u0uDvtpsr09R4jYMxeNA5tSZ3CdttBRKGp3ivmfGQjpVIsJ2mBeyRa0lOWQ1Q
         U88O5ELyTW7k1Bn7YHFgPd6h5oNmNaxSvnWWoIKWJ2JEFkZTfOyYMdtgzG0/dp7pDebq
         gsq49IwmyV5EduzHuvXjcJlixvK6sjX993uzO/SM6eOmAXKtw9HsjS3r4IwJqmjBLI3r
         plfjqz3aOJR8WDtVA9VhEYpGNYRHz2nWbQGdqP0kW84Sj2ZKCCJZC70jTLw2uW3YVZmV
         1yfa9aJuIIrTJAWB4CwhKz837hhFEPVoDKil7hBHLd8YaxJ9LDzlGM5kalo2Yb66svE6
         46QA==
X-Forwarded-Encrypted: i=1; AJvYcCU0XdclZGiO/g2a6oFhLsYL+Mww0McJSkPCCgOyutn3HyjX4F3UxFFz+kAt57llIm3iWZZqGv3A3SskdHJIPXgei5g6SePK/ejDP1m7yA==
X-Gm-Message-State: AOJu0YyyRwyQe7vl6k5LRFFzZotM3OxVIrRlGfVvKcypCaEhTD3x56Xp
	QkpKEmIumGar0WQnLC94X70yMHWUPU4BUQs97gRxnqB2+75EbLuyMeyga47GDaY=
X-Google-Smtp-Source: AGHT+IFsOPop7NoEBw9W62eV4h2oCjhPQSgPNuUyP622wEHU5yauItIykX1Sp7uujTy9ASdfeCs+YA==
X-Received: by 2002:ac2:424a:0:b0:52e:9ecd:3465 with SMTP id 2adb3069b0e04-52ea06e3b9dmr3233467e87.57.1720192959393;
        Fri, 05 Jul 2024 08:22:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ea268bf31sm497432e87.110.2024.07.05.08.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 08:22:38 -0700 (PDT)
Date: Fri, 5 Jul 2024 18:22:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ansuelsmth@gmail.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: kpss-xcc: Return of_clk_add_hw_provider to
 transfer the error
Message-ID: <eeekgt77qzq2hgh4xes2gnsuwjftt2movz75uosllhqtir3xyl@zcpx35q6zvpe>
References: <20240704073606.1976936-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704073606.1976936-1-nichen@iscas.ac.cn>

On Thu, Jul 04, 2024 at 03:36:06PM GMT, Chen Ni wrote:
> Return of_clk_add_hw_provider() in order to transfer the error if it
> fails.
> 
> Fixes: 09be1a39e685 ("clk: qcom: kpss-xcc: register it as clk provider")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/clk/qcom/kpss-xcc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

