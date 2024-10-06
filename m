Return-Path: <linux-arm-msm+bounces-33298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D96F992184
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 23:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA3F51F211C6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3283318A6D9;
	Sun,  6 Oct 2024 21:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oijagKcS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5714B15D5C1
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 21:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728248627; cv=none; b=NrGYnsW18bayNd2eFH3o8UkSa/UaBPhpogFeBnC++aS+C9h2dukzCtxeeOA+Eas7ULaunmjtiOTgtGZiC8YrvMQfDKaJqlePpbfK7OHV8+rcsnRpo7jbXI5Ou1N8Y/YVfsKu2drHlicY+0idtQ9VF04mhZvWAcUeoAPXrP93WL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728248627; c=relaxed/simple;
	bh=3H49pcBVPVHGqfhIW8jHEw+XYpXGnm889OB9D0Eo1Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XV+XD35ym60hgrtrVw/4G4q+zNL0ztSIDN9xGlZDL64ZtdifxbiKpDOea5vp3yogYq2ZzCT01+yy6jqsha23XiHUg5yOfedT5tPw0Hg5X4XcKPmPCDW9/yCwwq+Br1i+AeoJ7HqHXImgb1sL5C6D7BEak/msMnsuF6nOOucQI2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oijagKcS; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5398b2f43b9so4476188e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 14:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728248623; x=1728853423; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2PmXTB9KbHRH15SWXd6BBgKFdgftbTaL4ejOb5/3Tps=;
        b=oijagKcSosOLvUdmlVO4fczXSTl1LZaYT2lKzWqrH3ZdKiyHpIQj4D4rPHVtXY9f8K
         ZME673oGaebxr4H30uwd0UwjMJNPFO2bSbYC3x6sBKO3eVFAzZW+Oq8Jkac534S/bdcY
         6jTZqBX/vlzjaRWJP0DIu456dvXn6fIe3xYw+7g5D7dz7KvX6M201uO9BENpEuXRWDRW
         6eN8BX6+TwcRasreHbIBkg4qkKTMu3LRHQtTtcB1qQMpr77sU1emQHIROWb8bX6PPiCW
         c0kp+OoOVLFCEZQcEXDG4MZ/MM11TW2ShM+WqFK/ZSumnCdFXKtVPtNRHx39qBvjrbH6
         fJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728248623; x=1728853423;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PmXTB9KbHRH15SWXd6BBgKFdgftbTaL4ejOb5/3Tps=;
        b=UxGn66NEcQ81kFL47+2DF9pSudA4oOfR0QolRkci5YYP5nHoN814u8zQlMZoMp68Oa
         +cxU3SAUpe46RsOiPh4nHIow2Lnydhc4H4M4V5jfWfHNC7pT3nyuK/Myji2AdOXVp6MO
         nGQ4RVgaAxXqdPi7ij3dx4qj/2LqPoYkWBdndSva7fldq3INurpKMq+TRkkvqNPDvABX
         yxw1gJwBCAXQtGJ+AYkMh/ROAhd/EyWazNE8CJEmqG0f2ODq6PNpRRYWjHZv926Kmk8s
         ig+8ZiqJQKb8ihkC3f/8TAinSgwtAh2Fb/czsZoM6AhvMV65BSIRFvWzFrh2Z07qNl/i
         s57g==
X-Forwarded-Encrypted: i=1; AJvYcCVcjnbjJqyUFm7KE+Htgx/RXYmQ8izkcspQnu676LCMC9Q88HFhVTCmySFKkBs5sKjLt8lRpa26l7hwnQLc@vger.kernel.org
X-Gm-Message-State: AOJu0YwcTDqPTy8NEOS/txRJMkaHJ47t2NEpYwbdc27zCL7yr9/J7S3S
	+0jbU5nT0QHqMEr16DXHzRmYStfG0cigHRuNGqA8MxZzrbcyVl2DwEkrxVfclRU=
X-Google-Smtp-Source: AGHT+IE/TGvBqc3pWkxdu5goo+/KwS8+0cYK6C3rp4J81+RSj/7IrypUYpmkiCoDSLCQt/xpNC6sSQ==
X-Received: by 2002:a05:6512:31d1:b0:52e:fef4:2cab with SMTP id 2adb3069b0e04-539ac12cbf0mr2606684e87.2.1728248623406;
        Sun, 06 Oct 2024 14:03:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec80b8sm599524e87.73.2024.10.06.14.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 14:03:43 -0700 (PDT)
Date: Mon, 7 Oct 2024 00:03:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3] clk: qcom: clk-alpha-pll: Fix pll post div mask when
 width is not set
Message-ID: <vkfy47q3glm2gehs3rmunerslvzrfyz4wa4egdb6k26ucim7iu@ad24jwkdybeg>
References: <20241006-fix-postdiv-mask-v3-1-160354980433@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241006-fix-postdiv-mask-v3-1-160354980433@mainlining.org>

On Sun, Oct 06, 2024 at 10:51:58PM GMT, Barnabás Czémán wrote:
> Many qcom clock drivers do not have .width set. In that case value of
> (p)->width - 1 will be negative which breaks clock tree. Fix this
> by checking if width is zero, and pass 3 to GENMASK if that's the case.
> 
> Fixes: 1c3541145cbf ("clk: qcom: support for 2 bit PLL post divider")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
> Changes in v3:
> - Remove one of the fixes tag.
> - Link to v2: https://lore.kernel.org/r/20240925-fix-postdiv-mask-v2-1-b825048b828b@mainlining.org
> 
> Changes in v2:
> - Pass 3 to GENMASK instead of 0.
> - Add more Fixes tag for reference root cause.
> - Link to v1: https://lore.kernel.org/r/20240925-fix-postdiv-mask-v1-1-f70ba55f415e@mainlining.org
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

