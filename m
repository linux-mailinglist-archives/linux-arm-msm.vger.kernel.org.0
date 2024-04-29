Return-Path: <linux-arm-msm+bounces-18775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E918B55DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 12:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE0CB1F22D0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 10:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65B13987C;
	Mon, 29 Apr 2024 10:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="GNODwKgZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5224139AF1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 10:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714387971; cv=none; b=p+v1/O2YHm9gOUUxfKmpK4AdLNj7+beX899L+6Du0obpJrHLZ81u3QZ7IeRe4oRgGIb4mIt1K/6bin4d+MLLJETSoypK+02bFrNy675KpNx2ICz+Cq1UBl2zy62wbf+FXVtxkQXyiLPL9VVv3gufsVqc6jbN9JrKrv8ceofx+aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714387971; c=relaxed/simple;
	bh=o8wOtjyB4H1XLEyLHIcG4C34RaapqzbqcWqjwmC6atY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIDGlISfIgltNc+AHIN0GGf1YDwVSAPuw/B3j3ciyKKu+dKuHw70mZen8xyPYAy7+y2s1gywxUSL8CgcUo6lqp404M2wf1JLUialdF/iEGRRnlsjM+rI0DV5FFgHuJlh/O/TOLtazLzPxqvbcyJLuQ41pYKqhKTc0iwexng4A+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=GNODwKgZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41adf155cffso31666135e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 03:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1714387967; x=1714992767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/fgJIL5pu/9arRZ3qBAu3NHtnfRP0VZyCjshY2QEahY=;
        b=GNODwKgZ8qxgDyBjqNpbV6crvy/5yO6L5GzuaBGENOTv19bIbGLeGmhR87AOaHmvKM
         dd1/YKV71GmPeKRwXSI6nF4VMWw5CBmuf3j9N9oCNCNvf1f8SP7WVx3rCbRDTQbQtUs2
         1lbT5/t1+DIUFO5oUv/KKX8GkiHFUDP8hEYMEyr+tE8KkLBpglCMkCpKXgA5ZXOO5/og
         9mofVD9Un0J28W0xHP5k76qkXjA9+ad6j+KmaPBwEongRrrhdq5fgIEHYoiwpAxobhkb
         PfdWwWHiYB/8idL8GyaJOZ335lU/CIW+115Dxq5MODWSd6WOO3Nc/ko42nSzZ2gAWLPV
         LuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714387967; x=1714992767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fgJIL5pu/9arRZ3qBAu3NHtnfRP0VZyCjshY2QEahY=;
        b=KUwB4rURLEaVwYqSs7CXXniADQ1LNG3ygS5cuJ7QR5OGbrqpSVpxjvMDJ3Sx7my78T
         lRpdqPo+r2z5aEf2KXk8NA2FW22Muns+sQOSh34WdyO4qe/sBsbqOiZ8dpcHmSSGJ8K1
         isKOgQw2tfg0PSy7R4s/Zn34wzP0LC0AqZoHco6RMoldEk5wNAIxfpgo8S4Nr4S2bakX
         AsXjGBZoXkvdt9ZVDQfqdEliLrSAPm86YKeWQKYcaVB1GTedb7l4KZ3WSF+g+7lZ5UCo
         HQ2Ux3rotxAIsVZom30Bk5/yYXVBUeNZ0C95utqNa5o1d8aJakYg0X5QNvhdNWmHm/US
         rG+w==
X-Forwarded-Encrypted: i=1; AJvYcCXNPEWlJS6qm5JzogipsE1sSV7T3lqNUDMVsYYFnG7VmwQ851pG//0HZGn2i47d8nSyP8JG1BURO4g1xTlzWeIni7S6FkSdxdqpcGYbWA==
X-Gm-Message-State: AOJu0Ywcj10VRqv4YzQwYNVCGHmcHlQPwdQyDOgwllCEcxMTofXad5Mu
	zhvFWWUsC0iTrQ95V2na8WixoR+SonIynhIxYetlIipOPI6EZUNeiWQ5dBZ1lFY=
X-Google-Smtp-Source: AGHT+IHr/wzLkphA1zzTirAeTnU83OYcBlmoMRkY4gcRgafVZK8SRhnGsx09GRSLiXv2nSUK4zoAbA==
X-Received: by 2002:a05:600c:1f94:b0:41b:83bc:e9ba with SMTP id je20-20020a05600c1f9400b0041b83bce9bamr7105320wmb.23.1714387967438;
        Mon, 29 Apr 2024 03:52:47 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id e8-20020a05600c4e4800b0041bf7da4200sm7095641wmq.33.2024.04.29.03.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 03:52:46 -0700 (PDT)
Message-ID: <0703c962-727f-439c-ba56-ff70288f7224@nexus-software.ie>
Date: Mon, 29 Apr 2024 11:52:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] i2c: qcom-geni: use 'time_left' variable with
 wait_for_completion_timeout()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andi Shyti
 <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
 <20240427203611.3750-13-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20240427203611.3750-13-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/04/2024 21:36, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_completion_timeout() causing patterns like:
> 
> 	timeout = wait_for_completion_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
> 
> Fix to the proper variable type 'unsigned long' while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 090b4846ed62..0a8b95ce35f7 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -586,7 +586,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>   {
>   	struct dma_slave_config config = {};
>   	struct gpi_i2c_config peripheral = {};
> -	int i, ret = 0, timeout;
> +	int i, ret = 0;
> +	unsigned long time_left;
>   	dma_addr_t tx_addr, rx_addr;
>   	void *tx_buf = NULL, *rx_buf = NULL;
>   	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
> @@ -629,8 +630,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>   
>   		dma_async_issue_pending(gi2c->tx_c);
>   
> -		timeout = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> -		if (!timeout)
> +		time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> +		if (!time_left)
>   			gi2c->err = -ETIMEDOUT;
>   
>   		if (gi2c->err) {
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

