Return-Path: <linux-arm-msm+bounces-78739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 04650C06B78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 16:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A61BC35C53C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 14:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C362DAFC0;
	Fri, 24 Oct 2025 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qkdy/p+g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D402FB092
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 14:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761316481; cv=none; b=pirj8D4+GYZyiosATEYK9y0QWTh5RR3WySj3ZMCD0TKljzJZ5ufpPQmdFdzMugSRbmW8BuYjCA5bWlFHNH1GP4k4V3U6ZyMVM/9p1P6p6RWoiTpIZbEDsOLJRPMK42uNyr8iOvZxfblbPZy7C7P17nBzP6EeUtxl4ingGmI61RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761316481; c=relaxed/simple;
	bh=BOUy0rvH3jbf8d/DXxXFfpRisYIWyoXuZ7y0GHPEMRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CKsuith1bGOTt1ezTAQTsBMZ45x0BdIUVZtPYBqAkVY8U/H8/nk0eI2ShVFpZpDEiYbftIMm5J0DxwcTpnpP+StdY/2U5q3Aj6Jz6nQjv3aH6EOm4tMnWhmDz9fUV8DTCKhFh0ydFeNnCXzMYaJX6YCMKSVqNWppzWlSM5rvcYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qkdy/p+g; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47107a9928cso1136615e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761316477; x=1761921277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b+PpqXeugL7pGMhk358BvYaCrtr5g/cABDlByYsLEG8=;
        b=Qkdy/p+gj9MaYd9pmEM3SF2wDfBpsbnJchM7vnP8oplt1ND6H4Ds2w9FIG+WNn9MHg
         DSf4IswJrkb/DBbmKfQh9q7KHXDWRFIjKNkTAU6Kkmp58QkyyF21XsnvmQGSf9/GSEo6
         2CuYnzvPUVf+GaopwLQYIWhhlxhc9jI+7fi05D2XoLesKrbXQVScO+2abQTKzWu21wMj
         Q+WXufvXpmYjCiHLDVgeJ6fdx+VPOv9XGfZ35Mc51F2LmGWDwydyZB7pFQFE66+qOCx9
         +ZnUIraWVB//0E+Not4izatnnNVG+JN8MVxiGTeQytY43pwetYsfiK+Vo1rbUzxhLi4I
         psWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761316477; x=1761921277;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b+PpqXeugL7pGMhk358BvYaCrtr5g/cABDlByYsLEG8=;
        b=hpqHRWkDZH+KuqF9tGVKHn2VdWqx1Sa9ZxHrZ2+ckNjXVMHRJ/81xluCIWfkGAvy80
         5xl5ztu2SKGUwwWMhUPWEaNexkrUpXfZqXKJjMT7BIM9Sjjcu0PZIvG3JYkNlZVsXlOn
         rsm0HO3fH0pj7otRFtRoiA8T31LG4ZrTCVGSgIMBHTJICLxFnc8Ax3es7i5IOOHpd1Fd
         XKTkAV3zdDeNaW3Ac5cGAMHY3PgDrByxAHP08fW6cwQcS/q2+IFbs/QhEZPdT0yAnyv8
         qLK/8JpG1hY6Mh8UDQr141ziNQw39CdXGKgeorC4eFtUYX6KZrpEQRZ+Dx3ZKms7SBBe
         f9Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVnY1m9ZBXu/H1CZ2vOewG8DZ2b8u6DUbHQTXuMKKqzIS1o+EuTk19ZcCOABWR/WM0I08VkNaRNuFsYydsc@vger.kernel.org
X-Gm-Message-State: AOJu0YyQlw2skfP1KyF8uy/eRE4f3ukaGmmrl0PIsir5sVg6zP6bIny/
	ZpiF8DVISHBzvRtTY+Q4uNECZruT/hq+SuSHW0CoxR1CGh9SHfHdE+3GYyoYt650Vok=
X-Gm-Gg: ASbGnctn1BdflsZ4GcTMX350tYNVNHMKqLecgnfdEac775Ujk23OQn2Yd+utWiPfHK9
	ReKEf9ZXBVkGJ2g7vm9g738uI74vbBAjFb0x0Xdl/dd28IlutUWUCrJE5WLqYbGO6/qE0gQN2ov
	95qOxvrjMDRe1r1Sal1uKxUIk6U2v7dnHsDPMqTHpAMz8TzwQ5Ib6jmbv+nctWveB7zJRrVVZkq
	9YXyUuaoG9g/oEeOth39opWg72wWV9eLzCzo0zL46loqn4nA0hXcZeDa62GMMjl0dW9npqXdWDL
	WAYbW2EFSXbLMdVTA1rZXRVMl8JxDQPbtszZ00qSGAY3wsACGxa9nCg3rBK1KrBSmq0m9FOmgEH
	+TNc40pQuosVIDa9R0xWmZtlfGJo5szi6UXR3pbWF+Q/b+pU8qlEyqV33vexs5+7jzajK8IhiFB
	yq82kb8QpGdQRRI9S0z1YO/djucJbjqi0=
X-Google-Smtp-Source: AGHT+IFFTQfSJUbQ0wn4q5TWxlpKn0xxmu9BkVKhs+IavSaSdLdyRW7kc5mVPKE2XVpCiAho/KSkJQ==
X-Received: by 2002:a05:600c:4fcb:b0:471:c4c:5ef with SMTP id 5b1f17b1804b1-4749437b584mr63585875e9.4.1761316477486;
        Fri, 24 Oct 2025 07:34:37 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4369b33sm151500975e9.14.2025.10.24.07.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 07:34:36 -0700 (PDT)
Message-ID: <05d6ea2a-c1ae-422d-b178-5d2a306f3669@linaro.org>
Date: Fri, 24 Oct 2025 16:34:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/msm/dsi/phy: Fix reading zero as PLL rates when
 unprepared
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908094950.72877-2-krzysztof.kozlowski@linaro.org>
 <50a49d72-2b1e-471d-b0c4-d5a0b38b2a21@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+AhsD
 BQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmgXUEoF
 CRaWdJoACgkQG5NDfTtBYpudig/+Inb3Kjx1B7w2IpPKmpCT20QQQstx14Wi+rh2FcnV6+/9
 tyHtYwdirraBGGerrNY1c14MX0Tsmzqu9NyZ43heQB2uJuQb35rmI4dn1G+ZH0BD7cwR+M9m
 lSV9YlF7z3Ycz2zHjxL1QXBVvwJRyE0sCIoe+0O9AW9Xj8L/dmvmRfDdtRhYVGyU7fze+lsH
 1pXaq9fdef8QsAETCg5q0zxD+VS+OoZFx4ZtFqvzmhCs0eFvM7gNqiyczeVGUciVlO3+1ZUn
 eqQnxTXnqfJHptZTtK05uXGBwxjTHJrlSKnDslhZNkzv4JfTQhmERyx8BPHDkzpuPjfZ5Jp3
 INcYsxgttyeDS4prv+XWlT7DUjIzcKih0tFDoW5/k6OZeFPba5PATHO78rcWFcduN8xB23B4
 WFQAt5jpsP7/ngKQR9drMXfQGcEmqBq+aoVHobwOfEJTErdku05zjFmm1VnD55CzFJvG7Ll9
 OsRfZD/1MKbl0k39NiRuf8IYFOxVCKrMSgnqED1eacLgj3AWnmfPlyB3Xka0FimVu5Q7r1H/
 9CCfHiOjjPsTAjE+Woh+/8Q0IyHzr+2sCe4g9w2tlsMQJhixykXC1KvzqMdUYKuE00CT+wdK
 nXj0hlNnThRfcA9VPYzKlx3W6GLlyB6umd6WBGGKyiOmOcPqUK3GIvnLzfTXR5DOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92Vcmzn/jaEBcq
 yT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbThLsSN1AuyP8wF
 KChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH5lSCjhP4VXiG
 q5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpFc1D/9NV/zIWB
 G1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzePt/SvC0RhQXNj
 XKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60RtThnhKc2kLI
 zd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7qVT41xdJ6KqQM
 NGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZv+PKIVf+zFKu
 h0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1qwom6QbU06ltb
 vJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHpcwzYbmi/Et7T
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <50a49d72-2b1e-471d-b0c4-d5a0b38b2a21@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/10/2025 14:43, Neil Armstrong wrote:
> Hi,
> 
> On 9/8/25 11:49, Krzysztof Kozlowski wrote:
>> Hardware Programming Guide for DSI PHY says that PLL_SHUTDOWNB and
>> DIGTOP_PWRDN_B have to be asserted for any PLL register access.
>> Whenever dsi_pll_7nm_vco_recalc_rate() or dsi_pll_7nm_vco_set_rate()
>> were called on unprepared PLL, driver read values of zero leading to all
>> sort of further troubles, like failing to set pixel and byte clock
>> rates.
>>
>> Asserting the PLL shutdown bit is done by dsi_pll_enable_pll_bias() (and
>> corresponding dsi_pll_disable_pll_bias()) which are called through the
>> code, including from PLL .prepare() and .unprepare() callbacks.
>>
>> The .set_rate() and .recalc_rate() can be called almost anytime from
>> external users including times when PLL is or is not prepared, thus
>> driver should not interfere with the prepare status.
>>
>> Implement simple reference counting for the PLL bias, so
>> set_rate/recalc_rate will not change the status of prepared PLL.
>>
>> Issue of reading 0 in .recalc_rate() did not show up on existing
>> devices, but only after re-ordering the code for SM8750.
> 
> It happens this breaks the bonded DSI use-case, mainly because both PHYs
> uses the same PLL, and trying to enable the DSI0 PHY PLL from the DSI1
> PHY fails because the DSI0 PHY enable_count == 0.


If it is ==0, the check you removed would not be hit and enable would
work. I don't quite get the analysis.

> 
> Reverting part the the patch makes the bonded work again:
> ===================><===============================
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 32f06edd21a9..24811c52d34c 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -426,11 +426,8 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>   	u32 data;
> 
>   	spin_lock_irqsave(&pll->pll_enable_lock, flags);
> -	if (pll->pll_enable_cnt++) {
> -		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> -		WARN_ON(pll->pll_enable_cnt == INT_MAX);
> -		return;
> -	}
> +	pll->pll_enable_cnt++;
> +	WARN_ON(pll->pll_enable_cnt == INT_MAX);
> 
>   	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>   	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
> @@ -965,10 +962,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>   	u32 const delay_us = 5;
>   	u32 const timeout_us = 1000;
>   	struct msm_dsi_dphy_timing *timing = &phy->timing;
> -	struct dsi_pll_7nm *pll = phy->pll_data;
>   	void __iomem *base = phy->base;
>   	bool less_than_1500_mhz;
> -	unsigned long flags;
>   	u32 vreg_ctrl_0, vreg_ctrl_1, lane_ctrl0;
>   	u32 glbl_pemph_ctrl_0;
>   	u32 glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
> @@ -1090,13 +1085,10 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>   		glbl_rescode_bot_ctrl = 0x3c;
>   	}
> 
> -	spin_lock_irqsave(&pll->pll_enable_lock, flags);

This should not be removed.

> -	pll->pll_enable_cnt = 1;

So you basically remoevd pll_enable_cnt everywhere and reverted entirely
my commit. How is this patch different than revert?

Best regards,
Krzysztof

