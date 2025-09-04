Return-Path: <linux-arm-msm+bounces-72086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A18DB43FA2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 047A4162ABE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 14:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A521EEA55;
	Thu,  4 Sep 2025 14:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fM/TL1Cg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C8920B1F5
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756997531; cv=none; b=KkVDVT3g8XugXe6YAxt8+vZo6ZhCgD8E9Iv3j2/sq+Rt8/xwVXe83twR/b8uQtkj5qbPBsAYg3MvqnMUGUI1MdM7jS4qd/UTarIRuW9Qx+bhvRvQHFDQ+0lsDsTA8VnYtpSQbouwX4stjZj2+KIqnpQlWbiaNtV5QIG0nMyvoTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756997531; c=relaxed/simple;
	bh=Regk9837D3NO2JyFL4e0NWX9lDCfumsQhNU5GH68Kzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lp9HRkUQAiVc8IOGGiftnV7gtu0Ui+EFHP7hc6eRI1jcX/mhCt9wa6+mn6KiCtNfBh1N0MPXnSgnONB16sQH+49zMqnZmjlqda2kLxqtAmf3Zujrj3MB3jPkGZzsQCMuA9Ztjep+vBN8c+hybnmQGzDC7zbL4JUzEB9BZMn2JKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fM/TL1Cg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b8b1a104cso10939945e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 07:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756997528; x=1757602328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e/ycGZnds+z/QHl/WDFajxaBGcjIl8uT9DspiT23BE4=;
        b=fM/TL1Cg3qcEeTClA3zrqQ9iBkqtIB+IZPoRRppM0R+QGNgz6hVfcSZ/5zua1t/Hql
         l4brfekWvXY04CAZvkcae6TNrFul7nXKu9R/ac8dD1ncHyKHi4LMeiI1yTZjccVRfqRC
         wSrsoHqv0dJLOl2e06wiRbNhXTgkCFNS2LuEFkzU8rlVOlH2G3sv7VcJ5dS9L5sVN7Py
         zrpOqPcrVPo+VWBd4sdEXsy+4nzBbltElhcnW2tKictvpt9nzi6ykmTLQvB2H9ZxaTzG
         IqeFe63/mkvCUqf7oFzFQ9UqEfN1JU6vZSo5Z3VENfYz8M2d2Ak5yq/fhZ6xCkDSig21
         I4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756997528; x=1757602328;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e/ycGZnds+z/QHl/WDFajxaBGcjIl8uT9DspiT23BE4=;
        b=CvZMG4FN5lirFcIUwh11W0YaQKxzeLDoUYOgP9GtcQqL4k0HaN1w62/g1uhzE1rnyI
         vs1RUpFtEmMqXM1aBJ2I8srY1sJPwDt8pq9w8XH3kxRMsoMK1Mh8fzUhOjBKo97M0QsU
         cUTJRkjujKkWYHLdNmebOXEw8OD1V+i40qQH0NzqhBPc4YBxz3TKNrhERK2j7zocCLh9
         ULIimv2IK5nEyNpSHSJAuj+oaaeLu9hkVDM2y3oPsjJ/QFemlu+kVwxaDii3xUZJxQNz
         W1h3ugK3fhtpiIWgLpcdQZPdUQ6fpRp6mmIvnEp/62pZMAqT7P6tjphmvS42sx70E0Si
         vMjA==
X-Forwarded-Encrypted: i=1; AJvYcCUTnUxlQa+JiQS/JD23BA60ThvrjP0QjanHEbI71RJjMgB9G6TrNbNJH6c+OoAsse2/8xtkPBi5p7rBauMF@vger.kernel.org
X-Gm-Message-State: AOJu0YyR88MkRtTOdlx7KHcWGXsN7IUyNu6VTU4CcLDbZnaysYUMdeP7
	YD4oeRGJ/CFv1bh+tJiEAeAeovwJ5k4lpZatXHnEY+6uR3Vp0DHiXYfnu9EPT6EOoZI=
X-Gm-Gg: ASbGncvVUNKyXj5sGztZOfGV3gkhgaCYgBihypx8cAvtQAbEwNwQ2YIoA8mHJTT2NC1
	PI924bfHCXn3TO6xO3KiOLtkxeL9LWREoQO4+2TLHkwgOgu1y7+YzgdXyUvJ5hBTkGo7SZNExCT
	J4wMN0GvfanSIw/G+dZhVhHMlZ7jvpiKWytCvkOmFZmpPgff4EmUCGUDJt7MBoucPvhvMPo3NYB
	BfsuYqg2NnQQj207TG0d76jkDwdVEN1OLo0mHkW5uw0f0NNPPEWdrXfue69sc7f85Q1zpR4zsS5
	LO3bUaKRdSOstfEgLaPHw7IxaiL+LVrjh/gq2egEdQ23HnIY0AlNw6lPv9zlQnYFgJ91fXDqNw4
	GfxzqH27CZcyRidPycVJ73xE9MRGh6P3JabYUD3VX3uXPtjyw4sc7aMMTnmzEXSBir4rc5lP8pd
	vlqHkvUZt3vejKOiS8sw6pgEUut7oEyg==
X-Google-Smtp-Source: AGHT+IHTsoxoB4HNlhL82k9H9mr9S0iDNSTkAjB8ilh2KdQhFDsFlKoFFZI/S3sZrW3O7oQ+6PlwTA==
X-Received: by 2002:a05:600c:1c92:b0:45c:b540:763d with SMTP id 5b1f17b1804b1-45cb5407993mr60253385e9.33.1756997528266;
        Thu, 04 Sep 2025 07:52:08 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dcfd000dasm19823545e9.5.2025.09.04.07.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 07:52:07 -0700 (PDT)
Message-ID: <8657e44a-9c3e-492d-8485-44ff92c3bd74@linaro.org>
Date: Thu, 4 Sep 2025 15:52:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] i2c: qcom-cci: Drop single-line wrappers
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-3-d38559692703@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250904-topic-cci_updates-v1-3-d38559692703@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2025 15:31, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The CCI clock en/disable functions simply call bulk_ops, remove them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-cci.c | 20 ++++++--------------
>   1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index a3afa11a71a10dbb720ee9acb566991fe55b98a0..74fedfdec3ae4e034ec4d946179e963c783b5923 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -466,21 +466,12 @@ static const struct i2c_algorithm cci_algo = {
>   	.functionality = cci_func,
>   };
>   
> -static int cci_enable_clocks(struct cci *cci)
> -{
> -	return clk_bulk_prepare_enable(cci->nclocks, cci->clocks);
> -}
> -
> -static void cci_disable_clocks(struct cci *cci)
> -{
> -	clk_bulk_disable_unprepare(cci->nclocks, cci->clocks);
> -}
> -
>   static int __maybe_unused cci_suspend_runtime(struct device *dev)
>   {
>   	struct cci *cci = dev_get_drvdata(dev);
>   
> -	cci_disable_clocks(cci);
> +	clk_bulk_disable_unprepare(cci->nclocks, cci->clocks);
> +
>   	return 0;
>   }
>   
> @@ -489,11 +480,12 @@ static int __maybe_unused cci_resume_runtime(struct device *dev)
>   	struct cci *cci = dev_get_drvdata(dev);
>   	int ret;
>   
> -	ret = cci_enable_clocks(cci);
> +	ret = clk_bulk_prepare_enable(cci->nclocks, cci->clocks);
>   	if (ret)
>   		return ret;
>   
>   	cci_init(cci);
> +
>   	return 0;
>   }
>   
> @@ -592,7 +584,7 @@ static int cci_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, -EINVAL, "not enough clocks in DT\n");
>   	cci->nclocks = ret;
>   
> -	ret = cci_enable_clocks(cci);
> +	ret = clk_bulk_prepare_enable(cci->nclocks, cci->clocks);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -651,7 +643,7 @@ static int cci_probe(struct platform_device *pdev)
>   error:
>   	disable_irq(cci->irq);
>   disable_clocks:
> -	cci_disable_clocks(cci);
> +	clk_bulk_disable_unprepare(cci->nclocks, cci->clocks);
>   
>   	return ret;
>   }
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

