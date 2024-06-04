Return-Path: <linux-arm-msm+bounces-21558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8278FAC58
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 09:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2D86B21FA9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 07:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C7713D60B;
	Tue,  4 Jun 2024 07:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/AQN3J0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DB0446CF
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 07:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717487093; cv=none; b=Im8qylAaeloBVg3I99UNjuRc2hWJprlLTOG0/8PK/40wtuz/gBjx8P2FVUFJ48KQjLxLVpY6p0dfNLLNTOIrr+364y2Tbg2cCEVqKzxY5qnjuixkaMBURJpM1SiPo/Q1ReRl+wFq/MgrhS4x14KUONRWLAl2RkMtSDTQ5Q4favw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717487093; c=relaxed/simple;
	bh=K3JztJJNDmxWgE8NZyb5e/BN4rv4y/pr6l7o7i2SxDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqK5LNoRampZVOLRoXJo9N8h73jnTeTNndxgVrQH/RGq1D3kX863My/LQNSBOvCSk9CAstjJfaGfQKqFPHJF882YFfTEZ9PtK3Q+ZIJjNmbeI9FpTb6UPwn8F29dP5puxcjtiNOQADrMEUtoh8hNelXFDixPEjuCNM2S4JxcVWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/AQN3J0; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaad2c670aso7874181fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 00:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717487090; x=1718091890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UcYWYntWAO2W3LAxMAaPVJr5Ylhpz9Mj9naAFGZsCvE=;
        b=q/AQN3J0lmuofO9t1KTBuJoY1vEKpZE7l6GNwd723NtJYXiYKedPfNx4wmd7W22vfl
         ++2GCQviMLJeO/o73zfTQkvhZsZYDUFuhDCxbmzVaCIfFg5LJJxLvQzwvKl3sQqYvB9m
         nD0m9IsQkxkY5s2Xlg/YDt4m2g5FgRh+BS9gjVl3jyDu1Ubxv/ADnJ7TC3YJxRiTCVvQ
         OZ4XMrDYVZL320PQJrZ2N59PRFbxQcvEi2qFH2dJb3dvcim5+oi5vTLUS5Qp/FztIhbV
         CYqHRBB88MZ+tuXCh9/LyoRiaY5EXvVkd5nA3y/ugrvwtt2y1R0MVutC4pQtbtI+jHG+
         Ug/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717487090; x=1718091890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcYWYntWAO2W3LAxMAaPVJr5Ylhpz9Mj9naAFGZsCvE=;
        b=cL9sIt7qB/sx2YeWTG11HakuayImbfAXXVCj09pAfOVYuqP68ChuQSBtlSEexF5RpW
         dFJLWNBehFYMwlRvJc1L8U8FZXEksDSdWG0Wsnm34wNl4GxOiyA6ZIc0JUHytAWEt85/
         d9JJTW8wVqBwb6T+gvXb7aF1SMzRHBBFNpEeqF+1QNdymHckFxiCn21h11H+B2uWn6de
         C8RaKAEcqbnD7wAuwU82tdKMej76Nua/lf6TayHGMH+eq7m8Fnxwp0IzGnED4MscHaNl
         hRKqBWzFWLGmGSv0qhSso2vCT14PA3s721kpvpcRTAVBhTurX+da+EfRp2t6AZ8Gp5Jd
         ofKg==
X-Forwarded-Encrypted: i=1; AJvYcCU7rSNQGvk4gyw+NB/dwA7xOw7B0jSdvWIMT773kTbJjtv+H119QOYKd9kEhETkALsQDlZGWhIibk4n9Eo/iGAFsmCEhYR9r3dK42m/SQ==
X-Gm-Message-State: AOJu0YyUKl0afmmxIjCahbT2lxHx4Fzua4ZbKUPVVo4J80X1tHGNU4b3
	FH3k/CCckcJ3t3QTxL2QinCcCuasWzJJV+5ZCvKD3668wMbz28aJKwUXGDbGCm8=
X-Google-Smtp-Source: AGHT+IHqZb9LYTpAH7wKglm6YhvwHz6YjOAKROkXHiyd6z8lsMM1DOFC6a++Wkm2gmrWAq+7DRwBww==
X-Received: by 2002:a2e:9d12:0:b0:2ea:7cca:31aa with SMTP id 38308e7fff4ca-2ea950e64ebmr74116151fa.16.1717487089638;
        Tue, 04 Jun 2024 00:44:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91b9d5f0sm14300931fa.21.2024.06.04.00.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 00:44:49 -0700 (PDT)
Date: Tue, 4 Jun 2024 10:44:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH] soc: qcom: spm: add missing MODULE_DESCRIPTION()
Message-ID: <wuozxhrtce5udbn5aqxb65e5ox6hqs7tncb6biutqoetlhtouj@rew5b25dc2tg>
References: <20240603-md-soc-qcom-spm-v1-1-617730f08d22@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603-md-soc-qcom-spm-v1-1-617730f08d22@quicinc.com>

On Mon, Jun 03, 2024 at 05:09:34PM -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 warns:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/qcom/spm.o
> 
> Add the missing MODULE_DESCRIPTION(), using the same description as
> the underlying QCOM_SPM Kconfig item.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/soc/qcom/spm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

