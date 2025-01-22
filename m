Return-Path: <linux-arm-msm+bounces-45871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B54A19AB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 23:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4B0116565A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 22:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866131C4A0E;
	Wed, 22 Jan 2025 22:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zL+NHhjJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDBB1C5F23
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 22:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737583974; cv=none; b=rkV0EfWLUoMe37p1i/IwRx4ZNSoLcvG6iJtN+BuuFvbrRsc7xGx3iLPET1qQuICxuN0Swf5voo98zfPj41DOvMH0v/zgcs2Z2+51nbma4L+Mr4Nd1MQnoeeaNtIDyZLuJn0qL3/LlOlj0p25ktkOGXUWSLaf8al2Lc0rFZ7L5y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737583974; c=relaxed/simple;
	bh=zx6nlq4TdF0oc0AA2sY4ngyfD1Q7bR2PjwPmdky7ar8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/YWe+hQWs6d8uf42FFTX+gZ0++aKW/b+fRsI7pkLjGwQCxbMtgULwO5xZBVDQk3bDyRpDMdrxhSSvtVKYJGKeEyfKlc4MUu/PYX8rq0SJ6iHVs8tHn+/jvZwgbkiquTPLOiuXKZcTdh5Z80QzpO7Axa7Cnq3FeG/wqxtbEOum4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zL+NHhjJ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so304734e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 14:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737583970; x=1738188770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ftW+4Yw00+JFJ6rlbyJpHGoVvPKx//uXTQZgt05Kuj8=;
        b=zL+NHhjJvWHLux1KEZsClkqjZBrZ5iGKr1f8/ttdVjvoTb+oBGZ2gp9kypL6rHyI0W
         MJ6di82rsjXxFJWywJRcUrs7SxQqiCUHHb5JHdk59FNmY+FRJxB/IuQRCoUXTTNLAYvY
         y3fxzuZi/MsuDreqaH2YW7CWBVEzTiAmcQO0KvnDQuawYGkv3dh7jW4WbrSXjEXcHp+o
         WBflquknzc3u+luM8AK4Vi0eA4X8pUC8XX3Kq9qfEDcIMmPDsYaPPw1iqgTlOg2Wfv9+
         W6VAgTrttZVJTmUXU7gOpMYiqQPUjfxZOTlC4JP4xyVXffnKf/VFb+hG6kQfkWsSs5vw
         CA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737583970; x=1738188770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftW+4Yw00+JFJ6rlbyJpHGoVvPKx//uXTQZgt05Kuj8=;
        b=oKB40RbjFXcXRDiVAlyEEwSA+IMrVTcYVmdfH0E8I9sA5pg/q2YdtiYUeIHgEHVJp7
         +O39IiYKvg+EY4tMYKeZgvYPbwVJes7Xat9SRO+l9TR4W6kqsU2PsJQNi6E9hkrWPM2Y
         5Bwb5kY3kqULbt+DyACUkhTSJaM+F7yXrnAiXovt2NTCMbN407fuwmmdP4GAS4LSFT18
         9jwJHQgip7m+9bTAWp42udFf/JFBJpCob1DXcIO4d1mFBrxDnyYmYDf7rjouECZ5vAZF
         p9L9AhFqb2YLNjGK07hQ00TTW76FAOPHircyOFaKVFQh6AttYbEIc2cHV+MIUnh4RM2u
         347g==
X-Gm-Message-State: AOJu0YwH1Y0bFMav29J0q5chJMVVEoanhnsSNQgZ99HD3VBtzDAHsmC6
	Yi1lEorq5A/hxp5by77pkHSmumXAd8BRxUleWakij78PMKembAr7/5SBcS0szAdGX6uaI6qPEhH
	xo5I=
X-Gm-Gg: ASbGncu8l90eO0F1lM8eH+tiuLVURyMQYKJqWdWjNbqe5J9tehU2qrTTzR82K+4m1/m
	fatYfL9uHvCOihqkSfwJWuVfKUqmWIwxRWz/3l5FY9lGlvdj20ayIrgYgad6Yx+YCU/qES4OOPv
	2MDmMZKj/Yd4v402pqp11MWWfmLmXzRgZKeLwvGr3a/DE8352YmxT44EO3w0t0KHVCf4JULY7A4
	g7TwzrbW5HKZH34ggPeQ5SpMZoDgSkIp47Wrtw8MlniYNRJnFDZq1w7P+vlUaOLfcsSI1xo7WMy
	FO4YmyRwUu4lbQ+G21deQGzN/X7j0idECrThWETtlOEy4VuZSw==
X-Google-Smtp-Source: AGHT+IEKgozzQWCaRMcmqnr6uwOlEaioHrS4zp6iyVTx4JgfzDbdyzNfJ4Vpq0ndepnddZS8lGCd4A==
X-Received: by 2002:a05:6512:1312:b0:542:1b63:141b with SMTP id 2adb3069b0e04-5439c2674d3mr9341377e87.32.1737583970287;
        Wed, 22 Jan 2025 14:12:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af78683sm2366610e87.242.2025.01.22.14.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:12:48 -0800 (PST)
Date: Thu, 23 Jan 2025 00:12:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jordan Crouse <jorcrous@amazon.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: camcc-sm8250: Use clk_rcg2_shared_ops for
 some RCGs
Message-ID: <fye2hzgb7pbd7mc7txdl6c57uohrs224ivicgwy3xxqzximard@gvwsey2yqgin>
References: <20250122213427.28169-1-jorcrous@amazon.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122213427.28169-1-jorcrous@amazon.com>

On Wed, Jan 22, 2025 at 09:34:27PM +0000, Jordan Crouse wrote:
> Update some RCGs on the sm8250 camera clock controller to use
> clk_rcg2_shared_ops. The shared_ops ensure the RCGs get parked
> to the XO during clock disable to prevent the clocks from locking up
> when the GDSC is enabled. These mirror similar fixes for other controllers
> such as commit 8d4025943e13 ("clk: qcom: camcc-sc7180: Use runtime PM ops
> instead of clk ones").

I'm not sure, how the mentioned commit is relevant to this fix.
Did you mean e5c359f70e4b ("clk: qcom: camcc: Update the clock ops for the SC7180")?

> 
> Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
> ---
> 
>  drivers/clk/qcom/camcc-sm8250.c | 56 ++++++++++++++++-----------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
> index 34d2f17520dc..450ddbebd35f 100644
> --- a/drivers/clk/qcom/camcc-sm8250.c
> +++ b/drivers/clk/qcom/camcc-sm8250.c
> @@ -411,7 +411,7 @@ static struct clk_rcg2 cam_cc_bps_clk_src = {
>  		.parent_data = cam_cc_parent_data_0,
>  		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
>  

-- 
With best wishes
Dmitry

