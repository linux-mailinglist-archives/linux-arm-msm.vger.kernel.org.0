Return-Path: <linux-arm-msm+bounces-35973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E48A9B0F87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 22:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 290361C218E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 20:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0384B20EA2C;
	Fri, 25 Oct 2024 20:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkzqdeS3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EAC20D4FC;
	Fri, 25 Oct 2024 20:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729886819; cv=none; b=l4DN1K9l5w0zq54tweqOiGCTxFpuz2HCeeXu+wAoxaikE19xEwAkbP2R8mCifysht0IeV7VYUVlPD7NzZf6Dg84TFqlgkgf8Pnwp/F5ahs189xdGOtcBd1xvkYa2tBQ7MjHolRNv0R/lZsJOV1q9SD4QM0fkdKO7pArNrRBCYv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729886819; c=relaxed/simple;
	bh=020P98dsc4N0tP7zu2S4G3mBijoNQpr/6n/G2OA2H3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d0Xm3rq5YZLdZHHeg8GqQuI7HIflesrzCxZbv1WGQHCoKHO5X/0TLFMQklOSxXGsrhsOmoivm3j6cI3yZtAGc1eg5TKejW0ALtFieFGUNZ8HmKJbEVW8/N78zSf48k4ZseCXzvKu77mgMmVFxPuvKNDgzfP//xzvXgtLk/D89S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkzqdeS3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so24284395e9.1;
        Fri, 25 Oct 2024 13:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729886816; x=1730491616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8tYpjMCXr6pntg9hBGj3x7qZDtIrYXjEyugrTIEiVRk=;
        b=LkzqdeS3VLhJKD0NxYAIJjygyydFKAg9R0nT+sjj2KbKNWqeSZqaQcekEtiBuBhiIr
         89lW89LjG2/ClpqUoCI77Ud1oGvRsvKtp/xgzyNK5ri19jlNPlWJHKTvO6o4KXX4D6gI
         anQhHo/OSv+8vBjjM/8awfcmvTMoovrpq6qwGUYlMKxcf82akJdLYFsfBouAK9CYlefv
         rAcWld2aXQRENELyeuSmVsQLyXip1LvtE5nN6mENRdpmpEZMuu0SrJUAfmqRIODZGFxa
         5sTp6u2rdECswbEj3y9RS7S2jbMebhkZJGtC8ol/lCTJnM9ZY7l3v42WBUSmLyx1gs/V
         A0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729886816; x=1730491616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8tYpjMCXr6pntg9hBGj3x7qZDtIrYXjEyugrTIEiVRk=;
        b=j2H1d+fYrrKA0J2CxREsGxGOfPc0W6Pew0EUyg9TGENisrwnlf824oto5xlqNYg8Sq
         4Cknx9By8rP/eqyy1yhay0/HSyfmnFci/fFDtkRIW/gvEFQ32B2q//hgaxKM+ZLONgF/
         8r/96b4UQ8kpzXNI3zritEIl/LUbPiWoZgdU8ADeWOps0FH2VCE1WSeUEzMknfF4OJ8E
         N9U027xigNbI7f/3+DCPEeSOXzO3e+lfjWtdR0gR+Z1W3IW8pAKUvW7xhQ7QyE+9vxXF
         muurg8VH7FDlxO4RpAvhyBtD+Ig7PYzYG1hVY/n4q0o5o6oA7XkF5yhF69bXRhqdeLHh
         cTig==
X-Forwarded-Encrypted: i=1; AJvYcCVUyq8IAPH7fwfDoG5h6gJTGTXGyIFSHcwn2KZRGJ5+8+34aYgF50eGFSF1cPhQQ8Ci9g0xSb8DquXiC9z+@vger.kernel.org, AJvYcCWILg8m8bOuZ2mO9SieF2jgbFIQMuKfzrGgvYKU9xvj50FX5uUI9RtXT3DIMeic/8l3Ja34ThtMDNBC@vger.kernel.org, AJvYcCWsuv3VPpU5MFvmpM3ompdGkN3QLkjadifWgdmkdTxoAupqP6qbODRDeh63kSTcQUdix2lN45aB2tF7dDId@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3UFxmcQWl5jEYFgfMSgS00SJEewHrBm1yAZ/Yktw43T060esr
	YrRqn1LVQ1/9xb1wBmxoUePiCMfiO5W8jSZUMQMbJ3XN7m00/+cs
X-Google-Smtp-Source: AGHT+IFiGzqBxksD/82z+OJPVV83zg02xnOjqqtBwYsGstCXjU2vNZ+Nxk+/KmqLrn5tNdVHl0926w==
X-Received: by 2002:a05:600c:5112:b0:431:5a0e:fa2e with SMTP id 5b1f17b1804b1-4319acc2befmr3153275e9.21.1729886815881;
        Fri, 25 Oct 2024 13:06:55 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4317d03b8b4sm105081105e9.0.2024.10.25.13.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 13:06:55 -0700 (PDT)
Message-ID: <23d59aa6-ef46-46bd-94c9-a298b4870e09@gmail.com>
Date: Fri, 25 Oct 2024 22:06:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: gcc-ipq6018: remove alpha values from NSS
 Crypto PLL's config
Content-Language: hu
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com>
 <20241021-alpha-mode-cleanup-v1-3-55df8ed73645@gmail.com>
 <f4ip6jde5ffs6nvpllqhjleeb4s3j6hok5decxrof3inexh7ut@esgcsblz7wcj>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <f4ip6jde5ffs6nvpllqhjleeb4s3j6hok5decxrof3inexh7ut@esgcsblz7wcj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2024. 10. 25. 8:18 keltezéssel, Dmitry Baryshkov írta:
> On Mon, Oct 21, 2024 at 10:21:59PM +0200, Gabor Juhos wrote:
>> Since both the 'alpha' and 'alpha_hi' members of the configuration is
>> initialized with zero values, the output rate of the PLL will be the
>> same whether alpha mode is enabled or not.
>>
>> Remove the initialization of the alpha* members to make it clear that
>> alpha mode is not required to get the desired output rate.
>>
>> While at it, also add a comment to indicate the frequency the PLL runs
>> at with the current configuration.
>>
>> No functional changes, the PLL runs at 1.2 GHz both before and after
>> the change.
>>
>> Tested on Xiaomi Mi Router AX1800 (IPQ6018, out-of-tree board).
>>
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
>> ---
>>  drivers/clk/qcom/gcc-ipq6018.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
>> index ab0f7fc665a9790dd8edba0cf4b86c5c672a337d..d861191b0c85ccc105ac0e62d7a68210c621fc13 100644
>> --- a/drivers/clk/qcom/gcc-ipq6018.c
>> +++ b/drivers/clk/qcom/gcc-ipq6018.c
>> @@ -4194,10 +4194,9 @@ static const struct alpha_pll_config ubi32_pll_config = {
>>  	.test_ctl_hi_val = 0x4000,
>>  };
>>  
>> +/* 1200 MHz configuration */
>>  static const struct alpha_pll_config nss_crypto_pll_config = {
>>  	.l = 0x32,
>> -	.alpha = 0x0,
>> -	.alpha_hi = 0x0,
> 
> I'd say this serves documentation purposes: zero alpha value

For me, setting 'alpha_en_mask' means that the alpha values will be used. If it
is not set, then it means that the alpha values are getting ignored. If those
will be ignored eventually, specifying even zero alpha values explicitly is
pointless in my opinion.

If we really need that for documentation purposes, the comment before the
configuration can be changed to indicate that alpha values are not needed.

> 
>>  	.config_ctl_val = 0x4001055b,
>>  	.main_output_mask = BIT(0),
>>  	.pre_div_val = 0x0,
>> @@ -4206,7 +4205,6 @@ static const struct alpha_pll_config nss_crypto_pll_config = {
>>  	.post_div_mask = GENMASK(11, 8),
>>  	.vco_mask = GENMASK(21, 20),
>>  	.vco_val = 0x0,
>> -	.alpha_en_mask = BIT(24),
> 
> This is okay

Regards,
Gabor

