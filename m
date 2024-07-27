Return-Path: <linux-arm-msm+bounces-27119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B60F093DEDD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 12:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FE4BB21965
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 10:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADB24A05;
	Sat, 27 Jul 2024 10:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q1OqhUY1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6985854720
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 10:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077550; cv=none; b=UiJcCbAYwFDoPbDFKy45mYaDEs6cTok6fy6pFUrVVW5muMW0LHu17xRo+wlWSUQd871PZPOxIQAhMq0LjMmP/hbndMBmC5czc5BN/kx6dRX81QyAfgo2RZjfA/Gu4jOuOdDAtjW9COu7JTiFTwxrBKtdTbEMRfz9FJLYh/HhkhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077550; c=relaxed/simple;
	bh=Dq/S3mGmdRihp+JQyrTu5C6qBncgApK9D6D/aPhzwkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3JHz+9LKGndc9TtrEIIBQxppdEOpw0aeUdJlL0knOQ8k9JzIDd7SbSAtzyC/ESjSB+weOJ++mUBMiMH3BGOQkjozZDG2jQ7F2BB0771CQQcjSxtDriUEURBfKBcuww+W+F/lD+r+Ic/9w0KxCQF0Lc6iNPWfmPb9gWHOZW52HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q1OqhUY1; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52efaae7edfso2436506e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 03:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077547; x=1722682347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M39AnRc/yLkaurruReHwFcUb7PkkGNUB51pOqOiOq28=;
        b=Q1OqhUY1OsdAG/GB+5DwoDEll/g8sK2t4/KsYsFGuoD8ss7zrg6MkKbvmAF8N+VRyb
         S0I5xNOwYgwakU+P43+bz3RICHwZER/KZYmxnwuBKdkItPjNIRHgOIbIXmHeouAyoGzs
         /QiCPneSHCRm81HHdnlhak16/byGPJ56CtUk/xjrj/8SxZ19Uct0/YERo8soqQ4g4Ve6
         KP6QJVjz6f3Y1+JcMekJrOZZhUFjXutmqDBSXJxWxGUMlqtFUdWp1jm4ThqpfAleQ/7I
         NITEf48TBSrH1Kna/tV88gwH63gHW+q79WfHUUeCVEAJ1o6GPcJ6bLESZzeE2BIS1Aai
         OkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077547; x=1722682347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M39AnRc/yLkaurruReHwFcUb7PkkGNUB51pOqOiOq28=;
        b=W463yFQxqCicw/RYTkScyQKd5T6LcT95NMk2A5Fou8CcDOBotxqvAABKCL8zkTj4Nt
         Idvlgz5pc8LARRoZdyvI9PCCjSWk26YwtJ3cSVsPowgPo89g+aRrfUAc8kbOpj7HjpV5
         5j19ZnOziut4eFK7abthwYdDYaRbGThoCZ6CPl0I2ar2/4Zj4fjJXOO0K8UYwq2HeXeV
         Mbn/fEL1AZBvQPcD1vQQFoEBG8VBovy1pVKj2W7z31vZ/HhAXHHjdL3OLs2d8UQ5ocP7
         tMeqtGLXqLuyciW17lSeryQlSQYkRNtPi7744A4hp3hhqzyDfwtkf6DUsQQuzM2fJXLw
         ltAg==
X-Forwarded-Encrypted: i=1; AJvYcCVG2T0QIWVIXlrjTXOralnL+YSJqqkfCnZ2oyjINPQWxBhzdrICx4LQDc06qEIAls7js2ypFIj4rsQd1oP2mphNm16pMTIJQ3HDFD78rw==
X-Gm-Message-State: AOJu0YwAFQzGocdb+jDRQaSR9URwI0XqNvmqx2V7Fca+dV763q0k3haf
	mlf2w/yPJ2DkTf7y5M+iAma7RvHPE3g38dC4yCz9YVOizKbcrCj7rpdwSGRsywI=
X-Google-Smtp-Source: AGHT+IHEK+Ar+39CmHBEjPmZWaPhpcW/F/KwytZDZLq5IAKrn/S9+eIP36e2PYbbl90Ui4zs/Oh4GQ==
X-Received: by 2002:ac2:4c87:0:b0:52f:cea6:69db with SMTP id 2adb3069b0e04-5309b2ce8d1mr1305559e87.51.1722077546351;
        Sat, 27 Jul 2024 03:52:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bcfec0sm733378e87.64.2024.07.27.03.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:52:25 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:52:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: gcc-sc8180x: Fix the sdcc2 and sdcc4
 clocks freq table
Message-ID: <ezpxuw2eduh6i4lum2mb2627l7beoi6k4bchngustt6pyhuzmh@hpzfw3jiulud>
References: <20240725-gcc-sc8180x-fixes-v1-0-576a55fe4780@quicinc.com>
 <20240725-gcc-sc8180x-fixes-v1-4-576a55fe4780@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-gcc-sc8180x-fixes-v1-4-576a55fe4780@quicinc.com>

On Thu, Jul 25, 2024 at 05:03:14PM GMT, Satya Priya Kakitapalli wrote:
> Update the frequency tables of gcc_sdcc2_apps_clk and gcc_sdcc4_apps_clk
> as per the latest frequency plan.
> 
> Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>

Fixes should come first in the series. Also consider following stable
kernel process. If possible, describe the reason for the changes.


> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
> index f9f3e1254ce1..e85e75792ac3 100644
> --- a/drivers/clk/qcom/gcc-sc8180x.c
> +++ b/drivers/clk/qcom/gcc-sc8180x.c
> @@ -974,7 +974,7 @@ static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
>  	F(25000000, P_GPLL0_OUT_MAIN, 12, 1, 2),
>  	F(50000000, P_GPLL0_OUT_MAIN, 12, 0, 0),
>  	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
> -	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
> +	F(202000000, P_GPLL9_OUT_MAIN, 4, 0, 0),
>  	{ }
>  };
>  
> @@ -997,9 +997,8 @@ static const struct freq_tbl ftbl_gcc_sdcc4_apps_clk_src[] = {
>  	F(400000, P_BI_TCXO, 12, 1, 4),
>  	F(9600000, P_BI_TCXO, 2, 0, 0),
>  	F(19200000, P_BI_TCXO, 1, 0, 0),
> -	F(37500000, P_GPLL0_OUT_MAIN, 16, 0, 0),
>  	F(50000000, P_GPLL0_OUT_MAIN, 12, 0, 0),
> -	F(75000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
> +	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
>  	{ }
>  };
>  
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

