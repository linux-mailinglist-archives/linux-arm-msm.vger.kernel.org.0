Return-Path: <linux-arm-msm+bounces-23661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2440B912F9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 23:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF30F1F23D60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 21:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2D417C218;
	Fri, 21 Jun 2024 21:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UwIadPYT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786D6208C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 21:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719005724; cv=none; b=c3HQimhgYldHM+KjDKz6bHNcImRd1atgrOebmet+7j9UJCvpCv7gJ3QmjC1rtcp1tuuq0YG79U+hw1ctJQ6sSynv7ZnjVVaoijwYGCtufZQofLmAVIRXlmEjHEOLGfWap+GxMjqA9qRqGk7rkWraebgztOh4eqH6DVTMCHXolMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719005724; c=relaxed/simple;
	bh=qTMEby76e+phzeqNSFga3ZWYraPCTO0fmLO7nBbtIFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avUncfBkAD1d4B1ZTrFJmgKOYDZHWy3X7sVDfDXozlRqppUDGW0wqIigndXJel4wo4qw+ZiMqu7f/IczuqGqrL7aOx3qCv1J+qE1BhdvhTz2U8oDIEOBB+zVVB8f0zWtnjDNyn4MPHdqSQeVbOWBvU5b4x3k2xYiD0AeD3ot9gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UwIadPYT; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52c7f7fdd24so2997088e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 14:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719005721; x=1719610521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p7QzofDMIJnox4m27cbx2yoWL76uSEp1G3gfH6bMGlo=;
        b=UwIadPYTXnfrJfPIYo0729ZpMZCawESKyQ7vgeufxAhb4GutOU64L+cDuYQRlSqj7o
         6I/mp2yJEJH5ZxlXd2GM+bama0iHy/qbsW9x1WEkmvqkFda0HPjHprmQpvnfisVIKIOi
         VMqQpqYW2qtFOZvUXeBRU7IPW1zKJZctX2gshliVGLtDcdprKy2xsoofAJZh5HN7UmeW
         YeZrgMJATDFRCDfKa5uimT2fFqc6Rqnn1k4tgbU64vjOOQdTgL+gT5alnbKO3JrSUKSL
         64lV8ebOF+Eg7sA1ZJ/Hhfwgc2XFLCI23xGm5AU2+wGbodJ12T88kYv70p5LymvckiRE
         n52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719005721; x=1719610521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7QzofDMIJnox4m27cbx2yoWL76uSEp1G3gfH6bMGlo=;
        b=c+L3iq7leFY7Eekf+GW/VcCQmAuL4pVMiN/lXKHI0kb0gHr+1B5mKx4LyxaEDKq859
         DLq3Vh0AarrfHO2C8XBBrl36PIQX6gotBwE/Ii5KexLSo0YkTaKc1bgFV+qF9TleygiA
         9XefKeJ9i+XBUs5RfKvVH/RAqH9DsXGYs+gfpgNp19ZMmifG6vZVV+f5c/b86d//HL6i
         W6spyxAlMU2IHuRwXzPx74KUcaxCJjgEmSTZhXgxBxWpBslgHKtYC5KOjUXX2iw5EkwR
         VnKYry/5gc0Zee44PHd0EX3XyQaJkzgxasKM0oAXdIsk09iJfslnIT0GiI++2mMjagn4
         u+cw==
X-Forwarded-Encrypted: i=1; AJvYcCVmCzqBVnqe2K3ygmWVPnAKhu+toVQ5qwFxmtT90/yJq132qnRSlacbpdN3K4O8DcXSgiwlcN+jMvzNS5nuQFoYtaALp3cA8RmiDmlkYA==
X-Gm-Message-State: AOJu0YyegLKAj7q9w0cNci6EKXnmb3TXmG5O3CnorLh7Pur7heWshNmA
	w0LJ3BMC0UHo43uZ/LlGrFLLWi1KIgwtLmiwF7xVAguEdvzMcjgiOOii438oI1I=
X-Google-Smtp-Source: AGHT+IE3I1OW3tps/gbJ7JLgMTs4va9JJcfWhFkgP0GEwspZ6da7/hcUMk7cMNq1x48Qb2faeRouvg==
X-Received: by 2002:ac2:4c01:0:b0:52b:c14d:733c with SMTP id 2adb3069b0e04-52ccaaa2947mr5347391e87.68.1719005720668;
        Fri, 21 Jun 2024 14:35:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63bcf2asm314624e87.74.2024.06.21.14.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 14:35:20 -0700 (PDT)
Date: Sat, 22 Jun 2024 00:35:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jonathan Marek <jonathan@marek.ca>, Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, quic_jkona@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gpucc-sm8350: Park RCG's clk source at XO
 during disable
Message-ID: <cehpfdrqxcz6azrbswscsp5xubqey3ogmsyxw6y6n7lphvrfez@nep3r2nua23i>
References: <20240621-sm8350-gpucc-fixes-v1-1-22db60c7c5d3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621-sm8350-gpucc-fixes-v1-1-22db60c7c5d3@quicinc.com>

On Fri, Jun 21, 2024 at 05:34:23PM GMT, Taniya Das wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> 
> Fixes: 160758b05ab1 ("clk: qcom: add support for SM8350 GPUCC")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/gpucc-sm8350.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8350-HDK

Thank you!


-- 
With best wishes
Dmitry

