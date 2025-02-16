Return-Path: <linux-arm-msm+bounces-48125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E37FA373A2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Feb 2025 10:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 148F916D26E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Feb 2025 09:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBDD8172A;
	Sun, 16 Feb 2025 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t3On8y7q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F642030A
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 09:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739699211; cv=none; b=Is//VxvbTlSPyQS2Tu9w5ZkhONUcDwcRbjmuHYbsvbT2UEXsqG8MaGH87uIUQGkXtLTGaLfJH0AHLH1Cw1tNxdFGZQF0jLcnDdFnlqT+rxJ98+K5o7EOEBXb+X89RiGdRny31nTJUWW2NbOu1UfwU96HQ7yZi+lDQAXOPcqbwWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739699211; c=relaxed/simple;
	bh=k97yzTngzG1jtC9Re1Ktb1Dk13Z04vY9OlmPo2l/dho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQpaswrT828brR07ZKH7+YotDUlUR+lSH2pU0nM1nC57AsOjEJM7kC8colsIik9pdJvQZTVqxFzhS2P/4LB0qPvSt4eekNTK1+PunFrrCMpp0dc5FLxOIJMhpTV7KlckFSXq61qhS8/OtxsvViLnwY3cX54pL4Q5InrKoGwFhHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t3On8y7q; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e02e77ea3cso234597a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 01:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739699207; x=1740304007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iBwmAM1bqoGKM8ObYOzeB2TB7JgWvPAFUX2t35OVQaQ=;
        b=t3On8y7q0/wLNyXVrPWJ2cj6TSnRAputY8FACk6IZSQzIruPtfFGd3XSKm1UWjg41g
         yjOfW101SygGhL62Xy1dfIS/ckhPr6RjzOoEczAMOf/f6HJBOt7mSHm6bhbRzhvjJ6F1
         76+eJK0u7dMyKT84zpRPNPeRlpYVsdZ1u1qT68JsOS2vpWRCdrfs6piFrsGt8PaYxqw4
         52WhjsnCLGD1/CxmkrZ8x6hKCy2JNEb2BMTJoIpaiLF5aCPm0/442rgqIAJBDThaILgc
         xxGMDlux5YwDiM++3qgIiUaCsIK3RXDivvMVIi5AlAdF0hxeOoibeA9KaUtL+iFbd3y/
         f/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739699207; x=1740304007;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBwmAM1bqoGKM8ObYOzeB2TB7JgWvPAFUX2t35OVQaQ=;
        b=VpgNJicDzMVZT9ABEujFE58ywciIutJZuEGt3lFMSoPj/0VqnhX0gXyh9sP8g2GvdZ
         93CDSJ0L4emRJZ3jJwD59/tgI+YTnZ654Ls+ZOZc7hClSzLeHtAsSKosy+nJ/xk2btim
         T+THJwf6yU+o6CNYdn+Y7/y533SAIylxETwP1aPHKrRPOS+VTr+6xhO4t7fWY1VsbEil
         h3HKA0MDjo2GYtlERIQ8X7x/CeRB1b9d0E6XUXwwxenJ43J/s3H0ALv30KYZ11h7k4Rw
         2lXvmzsufvAt2lFZa3TbDoj2/0btT1/3nwzhkMUuP4SkcTJQzDYi8ltNhneZdLzyt485
         9X+w==
X-Gm-Message-State: AOJu0YxKVdQmeBF89UD8uqjWQ3BpaeYbnxwLh2tX2pf/gFz9eVONvP76
	eyDHewGpmil+1ZBVaSCJ6x4RuOl0ExCZsRjhzyyI+TKa+LZZba5S3OlXhiqCVSCQub2hDEsgX3D
	Kajk=
X-Gm-Gg: ASbGncs2PjngLgnuhpm31Gx/4RtvHf91wRHHPDWXw3DCSJ8XVyqj4JC4Gg2MWC/21Qo
	QhZ/3DWEG/w3vWpBXO7BqGFAYfau5OzwJh0ScdavsoSWCp2iCBCxp/jndyeMrH20NaDuidkDDg+
	jqjf9O3R2/oq8lqKcBXBZR5vU7hv7BglAGA1eXfWkWRtaizy0zqTf7Bqbb7OMEfl+DUVUFms99D
	rRDd7EQ0qwBEDPJLLINpYvtxrhSaUcjjA3Drv0z6V0s8i75n+t+9FhuqNnfPXIobG5kg92MtdBF
	LAUr4BTkCNm8cfUdqYpZ1Fkaj+/nSCWZGfw=
X-Google-Smtp-Source: AGHT+IH/YKXADFiBu6FbTGcilwtif1SrJBL3sTYqxc/Y+L0YsKY4TqDk7b17Epk1VV/TF72nZB3fXQ==
X-Received: by 2002:a05:6402:22e2:b0:5e0:36c6:2169 with SMTP id 4fb4d7f45d1cf-5e036c622bbmr1764024a12.0.1739699207317;
        Sun, 16 Feb 2025 01:46:47 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm5652890a12.6.2025.02.16.01.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 01:46:45 -0800 (PST)
Message-ID: <fb610a26-aafe-4a76-a577-9e659ae54930@linaro.org>
Date: Sun, 16 Feb 2025 10:46:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>
References: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
 <20250214-drm-msm-phy-pll-cfg-reg-v3-4-0943b850722c@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250214-drm-msm-phy-pll-cfg-reg-v3-4-0943b850722c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2025 16:08, Krzysztof Kozlowski wrote:
> Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
> avoid hard-coding bit masks and shifts and make the code a bit more
> readable.  While touching the lines in dsi_7nm_pll_save_state()
> resulting cached->pix_clk_div assignment would be too big, so just
> combine pix_clk_div and bit_clk_div into one cached state to make
> everything simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. Use FIELD_GET


I have LKP build reports here, so this or some earlier patches need
bitfield.h header.


Best regards,
Krzysztof

