Return-Path: <linux-arm-msm+bounces-35799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B499AF9B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EECF1F2484D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 06:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDBDA18CC0C;
	Fri, 25 Oct 2024 06:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sz4/wsCm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE07918C030
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729836965; cv=none; b=lVaX3sAS9jjQGJIypn3MZAJ/3U2ctPRp6zO49JAjYV5BfLYVSVcvnMAU2meugI9pC/3aodPWDgcBrhLMWqPo3Ji45GS+Va1LUwH+2knoGzPRpgNggKu6dGvk3yEYPsw7OTlc1Ftkivs1teX3mlNhbSK5rokBRZd++tuoYkVP0n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729836965; c=relaxed/simple;
	bh=jwVXq0sXiqmFlXsfxWjGRVzJcwpWFkSN+Aop/9DUACA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIqVgi7bV2rVDl30Rbs0sOWm2NF1aLKOzbBvHNunKOKngaHAdS1IjwCgou0gg74mSERWHCdkX/czn7UaW/cBEEaVGJaFai+iD6kJxuniTdq/eTWm71dEvmVSh5AF854QqEd+0YxJERiahqXeIooOUkEKQQ3enJZuvTGWgCWQaOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sz4/wsCm; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so16687461fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 23:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729836962; x=1730441762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fW4m5+Alc5+U/bpiXfBbEwyDvB1oVdKKXqHaL1Wh1jQ=;
        b=sz4/wsCmjphY0ddRcp39wS/134k7H0qoCurrQonwi9ElyYefxuteyOLYKZk8HN3RMu
         RMjnjpZxwuoAKL2grFu6ZIWj7xm35MxD+zWjv0mJ0Z77hZRk0rPOeEZgDgqKolRLf1er
         CPVD8A5VeJciYUz8IwxCdiLmf3TrjhmSjnqJ7nLIl+SX9qf2Bft4NLHZRIGbrTcv9tHt
         RADWprCHmHr7gl61tKOcokTIlWM8HJza2Lzo10Z7mv2c1qgIa8E0AN/yHxvo0KYh9jjA
         W2geNE2jzK9HJ9/jZla/6MBWE4rZJq86KWGCJFlHXZ2r6p984h9+NpN892DuWoci/1h+
         RbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729836962; x=1730441762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fW4m5+Alc5+U/bpiXfBbEwyDvB1oVdKKXqHaL1Wh1jQ=;
        b=R/PsmSX2ovo5a3VOUc1Y5qm2eFn+RM3gWrFK+cOwVk2Z5xgX/gwbo31CFD4/ts7th6
         8zTM+fo/KtvX5aZw0XMpYLjveYQcYkFBoDtFCCXbyXOKuMPeJSpEt2rQdBP/JUVXQPwi
         m1OoBr5nrHfMomQsR/dXSq/bXnxH0Ev6p7YjdMwvhwnYAK0F3X4b/Jc18bSuSU2BPQzH
         NjWOrNNd4i5xK+UOiQ/KgSd4hCCOyCPtrqhLU8Tyk8CpT2mdRePzJRZ0cVYAgNQA3Tnm
         CN5bYnoDSiF30TeOgH36zt3Aj9r3hS/IjdqdNnRBJ8N9iGfAp94eoQT4YV/+WA4dFQ6W
         jdyw==
X-Forwarded-Encrypted: i=1; AJvYcCV0SI8xgXwgAyMp5N4E1CTGXz5LDFsG2z9m9tHdCt4Ggi4mhrnMLUhd2LKH2Io9VCyu66wh8dKv7qrBr0J0@vger.kernel.org
X-Gm-Message-State: AOJu0YxDl7/lEWcM4ER7S5lq6R3iLGALCII++GBmyqupUee+EXGn90tu
	lMHvGEN80udYijB1/MCNTJKehgi04/lqa1pT6gbhh50/BKzlZZXlyijjp03dOCc=
X-Google-Smtp-Source: AGHT+IH1R1a5paHiMJuZWc2VC76niPOAzN1UkvOY+GuCu2Vas+9MsuU8FAL2cFI+5QVsPyLimIOW9g==
X-Received: by 2002:a2e:b816:0:b0:2fb:5060:7037 with SMTP id 38308e7fff4ca-2fca828bd24mr21472121fa.41.1729836961690;
        Thu, 24 Oct 2024 23:16:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb453ea75sm662871fa.67.2024.10.24.23.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 23:16:00 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:15:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: shaojiedong <quic_shaojied@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] um: Remove double zero check
Message-ID: <qstfwrz6kvjfldw2lisgcrtvlhi7ltuyc32ygsqtoqfykwxmae@irofaqfjjg3a>
References: <20241025-upstream_branch-v2-1-072009bfa7d0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025-upstream_branch-v2-1-072009bfa7d0@quicinc.com>

On Fri, Oct 25, 2024 at 02:03:32PM +0800, shaojiedong wrote:
> free_pages() performs a parameter null check inside
> previous code also does zero check as following
>     if (stack == 0)
>         goto out;
> 
>     to_mm->id.stack = stack;
> 
> therefore remove double zero check here.
> 
> Signed-off-by: shaojiedong <quic_shaojied@quicinc.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

Clearly NAK

> - Link to v1: https://lore.kernel.org/r/20241025-upstream_branch-v1-1-4829506c7cdb@quicinc.com
> ---
>  arch/um/kernel/skas/mmu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/um/kernel/skas/mmu.c b/arch/um/kernel/skas/mmu.c
> index d3fb506d5bd6084046cf5903c629432cd42b5ab3..0eb5a1d3ba70134f75d9b2af18544fca7248c6d6 100644
> --- a/arch/um/kernel/skas/mmu.c
> +++ b/arch/um/kernel/skas/mmu.c
> @@ -46,8 +46,7 @@ int init_new_context(struct task_struct *task, struct mm_struct *mm)
>  	return 0;
>  
>   out_free:
> -	if (new_id->stack != 0)
> -		free_pages(new_id->stack, ilog2(STUB_DATA_PAGES));
> +	free_pages(new_id->stack, ilog2(STUB_DATA_PAGES));
>   out:
>  	return ret;
>  }
> 
> ---
> base-commit: fd21fa4a912ebbf8a6a341c31d8456f61e7d4170
> change-id: 20241025-upstream_branch-06a9ea92948d
> 
> Best regards,
> -- 
> shaojiedong <quic_shaojied@quicinc.com>
> 

-- 
With best wishes
Dmitry

