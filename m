Return-Path: <linux-arm-msm+bounces-30209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 061FE965D2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 11:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B199B1F25BC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 09:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D666C16DED6;
	Fri, 30 Aug 2024 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JHZ4A2rD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F317D1B813
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725010870; cv=none; b=EaY1msAbRTlHcnm8lVh49X9XrtQnielh/lgJBXb98YhnnJF4uSJ1BjT/HtvhERoe5cdZTXQZWPLFFvNQOJhSXdGARR2gli+P+dhNE07qBXVFmFiedP9hRukBU7s0gtnio3sBfgviGKy5Ia87FkeImwQaY8YaThT27REY7GjccO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725010870; c=relaxed/simple;
	bh=COuL6iLBN27aS3GwFVVyjvVjhlNmkAK9/WIujnPqLCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3ntybQStGQCJrQmcjbsbbcigm+HzpuhQoERdjIOY93VgB3JgdqU/tSEXuz6dTgf2nCByhOg+D5a53zvf/En+PguY1PX/ijPQx7oQvu/dpmrfoOH5xz3kv8LCZ7YbihUzn3RTxPtq4dmtagMOg2NYN4mDLWgAPUzIwvjIxXViww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JHZ4A2rD; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f40a1a2c1aso14628171fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725010867; x=1725615667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h2wAp3xJfvCQWFeQG2kIUuqsYSHGV2K2UZI9+s5ufnc=;
        b=JHZ4A2rDoL2WwW9fjzFCxx0JTSrmyP/wbKt6Dso3+JRgmBD0sGBcLEr8exXjDc4phL
         8bzBp9aoX/EFpE4uq3lrBYmS7GFtjVL0/XoI21J09LkBLw3IQFyeqlVIlO5HeAt5jSIa
         5PYWw3bycQ2U5+T1l7zjnHjPrBwNdFnHT4xMBQoCBzGiZItxwZjXh99CJBFGdU60V7bZ
         JkgIur5ndZTckUhQIGlYhnaZC4BiLzg0TOiTydLqItWfOKbpdZfc1GvuVip1JX/Unw9x
         i/aRxRUFyi/s+GEyq47l9Hty4vLLdYOIeipJOj7dNdymWNGb4cJrWO0K6eXK1p18mClO
         2ALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725010867; x=1725615667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2wAp3xJfvCQWFeQG2kIUuqsYSHGV2K2UZI9+s5ufnc=;
        b=JM/j/Yz91lRHxiKxDZPWPIBnPGxIchkvfKOhrxDJVsPPqjO7Det4s9F4VHc1mrMd18
         nw/Kaya91gdTrhT5YZryAVc3sb4Na4h3NKcAC0DF6Q2ZQTXhOmiwB30HLkVuJERqq5FK
         6Vpo+YGF/0pa7JYNJHQ/MqWH559hODCKzqnHPRHKWZIoTcpO3pX8jv6OPDqBjM4vUgvl
         rkyd4pNkVvvH34axrhHTe2yiT0osPNAHH+ts+hfMCpeU1u8eZN46y+J3DW2UvsbAAHTr
         9OQV3C0CeHaZ7exWewriGc/hHU3q7Hdj2+mImwB5PwfoPQT4snbBDnxX62GEQC+gvNZx
         w4yw==
X-Forwarded-Encrypted: i=1; AJvYcCWcZFzsM7OBRlcl5gMeXJYgYQuCzDyvG3SQwy7ri2ggviCWsXNtIfsgsUai1Jc8Orsl6BqxjvyB1eKsjQvs@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc1v93P1XcVzlbW5DR1F8wQJWSjfdUoYGodYw5couGZQH7qYJg
	yE2PRMlSHab+pm6pmje2uWujx9ZeUKNBRJOiCP20l424UrdIQdvd+of4De3xXw8=
X-Google-Smtp-Source: AGHT+IGT7LIpysnNQIzwddwIOLZDD+RA8Y+gOPOv5OU4BlFShN6qC8hstT9A24BItY5SGW0e6QECzQ==
X-Received: by 2002:a05:6512:1282:b0:533:d3e:16fe with SMTP id 2adb3069b0e04-53546b69245mr867822e87.38.1725010866552;
        Fri, 30 Aug 2024 02:41:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084cbfesm516128e87.247.2024.08.30.02.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 02:41:06 -0700 (PDT)
Date: Fri, 30 Aug 2024 12:41:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sm8650: Don't use shared clk_ops for QUPs
Message-ID: <mweaa33lovczlyc2v46lquuhuwkdtsfnhmqhwgapm7nhvyb5iq@264qcs2z4jem>
References: <20240829-topic-sm8650-upstream-fix-qup-clk-rcg-shared-v1-1-7ecdbc672187@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-topic-sm8650-upstream-fix-qup-clk-rcg-shared-v1-1-7ecdbc672187@linaro.org>

On Thu, Aug 29, 2024 at 10:44:30AM GMT, Neil Armstrong wrote:
> The QUPs aren't shared in a way that requires parking the RCG at an
> always on parent in case some other entity turns on the clk. The
> hardware is capable of setting a new frequency itself with the DFS mode,
> so parking is unnecessary. Furthermore, there aren't any GDSCs for these
> devices, so there isn't a possibility of the GDSC turning on the clks
> for housekeeping purposes.
> 
> Like for the SM8550 GCC QUP clocks at [1], do not use shared clk_ops for QUPs.
> 
> [1] https://lore.kernel.org/all/20240827231237.1014813-3-swboyd@chromium.org/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/qcom/gcc-sm8650.c | 56 +++++++++++++++++++++----------------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

