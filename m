Return-Path: <linux-arm-msm+bounces-43125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0DD9FADE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 12:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E97816471B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 11:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F28719E982;
	Mon, 23 Dec 2024 11:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LZbRvQnk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14F5192D73
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 11:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734954599; cv=none; b=IvrwdnUROPfEMdeMU0jEejQpwws4ouxeTx9cEiZ7IwqwBo2h7WXxqsh1N/KJwER0tP1eSXQMJHka+A/qq5imTb7/RRucmYKwxmqXDzEd0GNqoukHzYEsiLzeSE4qpc5d1wvfgOOGFb2lNQSoiIehWjeXlAZgf71dvwljKK5/rmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734954599; c=relaxed/simple;
	bh=6Yr21vDWuIkvsuZ47/NFrT8j3E23Ga5mNcpV2WGUrQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yy8IUQvO5Qf+HMW7cXtzOxOTj3WMOlo5yndLnj31/7m1M/eNxHFMa4vXDYTwb+TWMfmCXy0QcEUPqLiCbi0m5DSpA0q3VwXeRhwPOquoPJOt4DjS+UMDVYEBoU8kqywQo6BXnH3iMN5TIOkhrSwN5t0jYzC88fM/VJgUQ/e7E9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LZbRvQnk; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3023c51146cso41999951fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 03:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734954592; x=1735559392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=81jl/t+cSQKe+ACOcy5lOOjJcqHObJWTUdY8j6yLjT4=;
        b=LZbRvQnkBcIvLFWESdukXqB5GwfJMAXe7IxQN4kSr+tgZvgsn1QABAjIp5urX8koa+
         TyFrV6MUmY3vIZtWyiNjdmsuHsmXvVTw2fqAxtGE2KyJG/ZEuP26dv7NXNPAQYnxe1EC
         mKzqnnXDv5Yo77wOwKCK+2YPKpp6vf5wS0k1+dLPvOr3eOwntkPYMZRpziz2FYq8lCiz
         f1K2nKNT5iMjyrXh8yye7SHJlhNP+zOO0YG6MUOeN1Evc4GRSKtDe+7nx/RqI2iU1IMC
         62NqQWgIr7JuVV6YShK+ODvMy6K3j3ujJNr8gKW7CdeYBXb2I5ZxhjAHraWJCbk88rWw
         2yWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734954592; x=1735559392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81jl/t+cSQKe+ACOcy5lOOjJcqHObJWTUdY8j6yLjT4=;
        b=Dtyytg4RX/CFQ+Dj10chkgSNjLZ1jCRtDlUI+Ldy0mvUZCv3bcBRGnJz5ta/BXj5LY
         H08QTgpaIosDLDJksh4H0aJ1x5iBR/hohEHmhTBz+05jwiN160M4gkYoVp/7EUxsKJK3
         NTohZzDGoIc7lVF3dSICW6LiwKRZO9MoAPuqaEJCccBbDkwsypH6u0/vA9l1o7AEIHe3
         5vr/DovsIM43LXGLXsp7Ke7agj+XKcRdqF0836IGxayQdAzz0JLku3t9KETzRYMSw+tw
         ruzl0IXsoZOMWFuHoxI7bYWgpoLSsNWGl1obZgqXVe5nAwkAeJKXomCPUWtP1STWKGy+
         V3Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUaoxmld3lTewR+8Au53zcPTdRsGbFEhQviRfLSte9PrNOQKXE61jtY8rTtIAK+knkUHy+UBJaHLLKYB+KN@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb/HFnDZ6Frkyhg08LC7ybC+fmKWhT2Bhzrmma5Gt/FUBO5Vc6
	g0evkHgFJHSR8xPyfXHS6mSKbH28r7yr9xEE/gzXqlBlZ8je/8tFNGpAmTLomf4=
X-Gm-Gg: ASbGnct5LocqYNopMKj+xAtIl17JlDx+erv19MMfT5lMEV5UaFFQXCXL3uU7Yh7w+iu
	RhOzLF6oZw4itt7Ns0b+CpwYVDZa8etQXciQj7WYqH8OQ92iOeOSI2oUh0WhBn4nz70Yp6ukjSi
	FmFwcWDZ6XfttbdQyOF6O6E31lyHLw/OccV5kD9bla8i4b2W3qZ5MnWubGYtTfxcXcRNR1MGzk9
	lbR1eBow1wt9hAMCli3AD45B+9fuLVMbhxO0UzuZtntChX9O4/HNz31ou6dIXgC85JzAvj9HmTE
	B5TZDBMcowtDtAwzRW11pu1gZLq/ByOZGoFg
X-Google-Smtp-Source: AGHT+IHOzyQch22bff+q236NuBgW9EAlxYdWMJ7aLs2GLbKmy59AOI0ocsSlLrhAGSQfDmhwjLXuYA==
X-Received: by 2002:a05:651c:4ca:b0:302:1c96:858f with SMTP id 38308e7fff4ca-304583710a9mr38211651fa.12.1734954591742;
        Mon, 23 Dec 2024 03:49:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c5a0sm13023751fa.22.2024.12.23.03.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 03:49:50 -0800 (PST)
Date: Mon, 23 Dec 2024 13:49:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH v2 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
Message-ID: <tvfe4inkpz3zg7k3eo2nqhcujy5weozfroyf4cgftsyrgbutkm@olh7t3qsn4dd>
References: <20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com>
 <20241223-switch_gdsc_mode-v2-1-eb5c96aee662@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223-switch_gdsc_mode-v2-1-eb5c96aee662@quicinc.com>

On Mon, Dec 23, 2024 at 02:32:41PM +0530, Renjiang Han wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> The video driver will be using the newly introduced
> dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
> control modes at runtime.
> Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's for
> Qualcomm SoC SC7180, SDM845, SM7150, SM8150 and SM8450.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  drivers/clk/qcom/videocc-sc7180.c | 2 +-
>  drivers/clk/qcom/videocc-sdm845.c | 4 ++--
>  drivers/clk/qcom/videocc-sm7150.c | 4 ++--
>  drivers/clk/qcom/videocc-sm8150.c | 4 ++--
>  drivers/clk/qcom/videocc-sm8450.c | 4 ++--
>  5 files changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

