Return-Path: <linux-arm-msm+bounces-23704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7ED91347A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 16:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B27C4B2325B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 14:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF1B16F0DF;
	Sat, 22 Jun 2024 14:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZWEn+u6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4DF1E4AB;
	Sat, 22 Jun 2024 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719066987; cv=none; b=Da8qE+WDkmLNTwaNvfAEHiv5DQW/r2Wrl2/9CeDkVWg+qegNN9yIyQm0DMYFRmRsMAYyx3uG/gEgOGnXWs9/ZmyGVrOV4p9CvCHdAEzijLwFN0K3Sa//3g3ABOgDE9PkZT5+yXV6eVwjHtbbRdkgi1Z+JiARkdreTK/EuJApOQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719066987; c=relaxed/simple;
	bh=fFfsg+f4AU+eql/TtMeYZLXfrroZ/Pgt+D3BjAS+LAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j9pAMWdfYxQAPS8wo6R1RCc32izHH05a9bm3+99f9uwKTPXe/uyJ3E+z9GF6gqF9oriw35Eqld0m8lv4E4FZ7dtFh78WxF1nFBxXpESJZ0KJN4dnxBVMx1IlR4XUEHJF+dlL3BunNYIzW7yoh/kNe8FyUzAePTt5TXvzlNN4swM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZWEn+u6; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ce0140416so240929e87.0;
        Sat, 22 Jun 2024 07:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719066982; x=1719671782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WNYrUl2YGsngqImjAyk/vT9l6tF/5D7wdDvB58mdJRs=;
        b=WZWEn+u6CrCFS9Xfk3XqyJf8Jn+t2cNcxfzw8H6OJb4KFRneUBI1Nu8ysJnfrb5xUp
         Uc9vKzOi/aDavjFT4frZadZmeC8Xmjj+7Ha4MeskaPbBROqcDhKHHvrvK2NbBLh0kORp
         IYLkM42m+NhXGer8Jw5e1sKl+OrVns212chvybUcwRdD6Tlily8eXTugIqr8UVwz2QzB
         K00qeE6VMClg+dzvu6/ID6ZotkHSp1wZ0WPJnFmqC+nzW4JU/p9K3Dm67SoCLuEibGCA
         gvUHyRm1nxO+LpYP5YjdyCeeQdJCDRWDfgqZ4oRSdF+qgAgH/r5/1tawH6sHb+EEKpQP
         YXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719066982; x=1719671782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WNYrUl2YGsngqImjAyk/vT9l6tF/5D7wdDvB58mdJRs=;
        b=jUXqwVNOZiqZBDBNj3Z/xKitjVlJ3jge1Gp98qKXS6udW4EZVNK0saAH1MJqHUp6R0
         zUrungdjeRlZ5F1RLNGtnKsYubjc/mfw8+NI+H43YphpkdXlkdfo07UAk9yRYfxWzkU9
         yfZmCC/0J3k1LozinSqCxKhBk3kx3PUJd8qaH5TKehR05tEFzt10oktVprrVYBsa3eno
         cnZkeda4OYaIwKWhHxmhDGs1zr4XavO6DqOc2REXi/vROdf09l0C10Rf4eg81yfSfi6X
         wf3x/dkswColJamvVgC+Oo89XI38Dg3Zl4UbXr6xgK65uw2fHx9Xrl9OftqGOwOTa0da
         qSSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVptDECskTG8W0i7NvXVO/Mmxa/n2iK7n23+6Sogir2yZI6hB7WV0P2FIFpcucIxJpKV8V581UWUxIOithVHEhDSGisrxxNOf5LUGiW+Hq2FUb0NLfvzWCruULAHFjPl+3tUnntqAzoA5r+QU3D2pPKStM81tM0B3n5/9onyBO9IAXBFP2t2aM+cmEITdP3T7nMMH9UTjlMCU4TeuNyzV3olv8=
X-Gm-Message-State: AOJu0Ywu6XT/jbIeqjXHFRpTnDTBt+Q83W+EZW61sB54JoGDowhQ56Y2
	lff3PsBqhBWwatMlWyUpWsVSSPDDUyJsjAML+ISlAKvZ8R/CulD1h2wyZg==
X-Google-Smtp-Source: AGHT+IE/2Zw69mZ5Nmp2bq2yaB2+Cfu8PQ8xGCyORiNbD89YhAvnnSPpUdCwEvydqxU9tqFqOif9Jg==
X-Received: by 2002:a19:2d18:0:b0:52c:dbc6:8eb0 with SMTP id 2adb3069b0e04-52ce061a287mr405838e87.21.1719066981895;
        Sat, 22 Jun 2024 07:36:21 -0700 (PDT)
Received: from [192.168.3.32] (d-zg2-226.globalnet.hr. [213.149.37.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36638e90cbesm4711184f8f.58.2024.06.22.07.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 07:36:21 -0700 (PDT)
Message-ID: <e3ad7b57-65dc-4262-b523-8bb81b60892b@gmail.com>
Date: Sat, 22 Jun 2024 16:36:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] clk: qcom: gcc-ipq6018: update sdcc max clock
 frequency
To: Chukun Pan <amadeus@jmu.edu.cn>, Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20240620150122.1406631-1-amadeus@jmu.edu.cn>
 <20240620150122.1406631-2-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Robert Marko <robimarko@gmail.com>
In-Reply-To: <20240620150122.1406631-2-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 20. 06. 2024. 17:01, Chukun Pan wrote:
> The mmc controller of the IPQ6018 does not support HS400 mode.
> So adjust the maximum clock frequency of sdcc to 200 MHz (HS200).
>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>   drivers/clk/qcom/gcc-ipq6018.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
> index 7e69de34c310..6c764e3e2665 100644
> --- a/drivers/clk/qcom/gcc-ipq6018.c
> +++ b/drivers/clk/qcom/gcc-ipq6018.c
> @@ -1617,7 +1617,7 @@ static const struct freq_tbl ftbl_sdcc_apps_clk_src[] = {
>   	F(96000000, P_GPLL2, 12, 0, 0),
>   	F(177777778, P_GPLL0, 4.5, 0, 0),
>   	F(192000000, P_GPLL2, 6, 0, 0),
> -	F(384000000, P_GPLL2, 3, 0, 0),
> +	F(200000000, P_GPLL0, 4, 0, 0),

Hi,
Are you sure that 200MHz is even valid of a frequency, cause all IPQ SoC-s
use 192MHz for the HS200 mode instead.

I would just drop the 384MHz frequency as datasheet clearly states that 
HS400
is not supported.

Regards,
Robert

>   	{ }
>   };
>   

