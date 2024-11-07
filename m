Return-Path: <linux-arm-msm+bounces-37219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2B59C01D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 11:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EC491C21D54
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 10:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AFC1E25ED;
	Thu,  7 Nov 2024 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CcmWDrCW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F0B1E5714
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Nov 2024 10:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730973892; cv=none; b=eHSPaKJ+g916uYX5GLd2flLnAHnLWV0A3XIfDLXmnP6c5gSllyaTA4PoV5vVUEgQQJYORe/3RM86AjyNZVD8I7Zb5J115+HPgDUnwSX3aXUfNG5qrKuofsIEzORfk+amhEkwQcVae3aONCl2LUOe/weODKqIWNCXk+EvrBeqzs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730973892; c=relaxed/simple;
	bh=FSD5q91Z5M97/KUQMP8P2AN+XSUMd5DKoahhKdY4m/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myCnw5/kXA7B/4BtuCHH3BR0QoBnjRPRL+1WkYgrvNPjZvd0a7jcqo6U59t4GDZ5nBwbUckyxXY7ZQEz/9KX7iDQVmB7gEHZQwYU2A2gigoHLty+ECWRdsQP4TYqVUwUi5WUc0xJCQnqyY62CzqnuWLBBu1bVoeBlhyNAHjfUx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CcmWDrCW; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f1292a9bso726193e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 02:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730973889; x=1731578689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RNrRvn+cAcwon+U+/CNcXQAra1a+3pdXa58qFXl6K4w=;
        b=CcmWDrCWnmGKbMxwal+CbK6EktpxS5demWchjiAyxM7tY8P1sWYx+uSx79RrTyoW4X
         JikpeVZVeLUkZuaoaUuKAI6mZba163fkI2WNgJBRWMiqYt3aH3lu3pRBRNGZZPDLgwOH
         cn3YGVkAmoAXMSZ8Ek16U//ZbK7oKEiH1zwoDm2zEesxKxeoDH4fC+dBLjUqBzaH6nhg
         lulrpIhUBdTimis4KCI7Srer8DrsnW1I28JiOwHvN9rc8DuoS8hxmu/6I4kirwfM+hyy
         9j4+sEBijh8rZ6amN2y8LMvylq2VOcsMVlRQETrjKgwidBLLoUl+P/BP/B0YqBLhwCFC
         it4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730973889; x=1731578689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNrRvn+cAcwon+U+/CNcXQAra1a+3pdXa58qFXl6K4w=;
        b=esRrjHNtapq0X8y/cfpPiUzF8yJ7eS2tyi+tZK9LtgS/EMJCWVNPRcl6xLDwBj3cNS
         XIPT3pnrZXUzWxhfjl5q+7sEpdGYV4+DDfgnSf2qMzr2seFYiRDFuOpa/Z9ZjU5mKe1V
         c1XvVLnrxTU1Y1FrizmR/iePsxPDQoIuFCIGuZCdYzcI4iBsnOx8OpVlNtabSBhiE9bk
         jGyMYwc438wHE/fVgRvkPKmjTSOsTKZDKITFkw/A8JigYlUzVZ4hUsiCzY4Iv1Er2lc5
         iHqcrEmE3wHMCwAWEBrFzF1RRHVBDoRB0gkwf6YhMdre1aSgUqszJa3Qpj1jWwuAXquw
         P8wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW7tWaR9BkoU2ob47PyBfCbJYfaCd6F17A5oNJQZdpy5dOTsvLEDmvwWDjr3tngZN1DJBI+1yab51q8fg7@vger.kernel.org
X-Gm-Message-State: AOJu0YyRPPmtRrcOkPsPL8JPlAZK7+iRNVe9/BEJA+y2n/jlmqOz55Jq
	1pJj0zzEf5D2DaAfXhPQmh/20yOa2qUkV0cKJcoUGyBlEWyeygog4wfoqzxaE2Y=
X-Google-Smtp-Source: AGHT+IGfQc/m8nvutNLjLulZId4wRz3gyPjE3WTSiXdeZ1GwLBnKgID+Ladwa+ZMi0aHaDpNN77JQw==
X-Received: by 2002:a05:6512:401f:b0:52c:9383:4c16 with SMTP id 2adb3069b0e04-53b348cea2amr22905811e87.22.1730973889174;
        Thu, 07 Nov 2024 02:04:49 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d82685739sm151588e87.61.2024.11.07.02.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 02:04:47 -0800 (PST)
Date: Thu, 7 Nov 2024 12:04:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Remove unused freq_tbl definitions
Message-ID: <xvkvhu3qvlsjnlkiinbm6wguttpozyvlyy5mbbjcpg7vnhrp7w@trjvrm2zpylk>
References: <20241106184949.801819-1-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106184949.801819-1-quic_srichara@quicinc.com>

On Thu, Nov 07, 2024 at 12:19:49AM +0530, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Q6 clocks are managed by Q6 itself, hence ftbl_gcc_q6_axi_clk_src
> is unused. ftbl_gcc_qpic_clk_src and ftbl_gcc_qupv3_2x_core_clk_src
> are unused. Hence removing all the three.
> 
> Fixes: 21b5d5a4a311 ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411061537.anSkNwoR-lkp@intel.com
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-ipq5424.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

