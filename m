Return-Path: <linux-arm-msm+bounces-45172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB561A12E8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 23:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E72A161419
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 22:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD2615D5C5;
	Wed, 15 Jan 2025 22:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MAo3xNsQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BD81DB366
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 22:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981373; cv=none; b=t7UXgkQ1EGd9tMddtmACm0QjaYnRpOM5QzX/7VPS6bHWf8kEeqAIOokVvSYmkTLGCp8YxyMF78j7hTjlAAaonGbtt8NjxPBtidBzGI1r2e4CXSrai57oLgi6y4HWtpfr5X9Fl8gpkoML5e2ET0BKKdt88zs8MkfXx8k9YKrpNgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981373; c=relaxed/simple;
	bh=/TfjeoQzo2zuTZpq78LMOaZUSgVC2vcPAllANq0YrHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kWyUkY+vpZ+pJrXLPFIezQ3XS4wsygjNvXfQhW61dgTElCnqImH8N9Lk0RiRoVxPCymAaVIH3cqmvYz3zqyg3TjFQGGlIHPyESrwRAQEq7hLV5M6UfpUqagsgXCuECnSyJpW9MhuHU68geQVwzNZajMTpo/uLc+hdMcqbLQ99F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MAo3xNsQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so1357855e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 14:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736981370; x=1737586170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HuWplGB+wrct5bBd7crrAByZp9+yST316KmXl7zzjOM=;
        b=MAo3xNsQPI9jRx4VmUfgy11dIKm3yEcZVdKVcss6xnweOS0+PA56fxotYVQjoR33Uj
         FwQxBE+Aalj9INMZk1uKg6k6lzQJWew2Y1Y2KuA2ym03I+x7H5EVxErdu8u4yJU6PfGl
         Y2rMGg10lPuV9WQFkDrcXwTM15Xc3Lm8YctJkVR/TZJ+Eld49p4sSw5FmdAQnESVKIqG
         ZE2y5kxemfNn38AwjmL9pr8O24kUmMMyhy2At8bDHCIDt3+kr5YDTXVbM3CWdVyfM3BR
         nPZzAHUE0nOdKvyfpGd9q3zEQy9ZiAn5sCloX12r1drx2Bo19ZT8i7ahZIHbSz5B1VCd
         Q0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736981370; x=1737586170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HuWplGB+wrct5bBd7crrAByZp9+yST316KmXl7zzjOM=;
        b=hKg/FSy4AyLAupykIcaZdh7p2LlRZ5YlHQl8DwDR83dUvimvfBNp9yR4IrsfjoDYbr
         vdu+9dRnKzBAUjk12IcgdC/MUB5NiLoQmXCeFK+0VzOTrlX8CQYjqrICG1/JSQ6LD9GX
         WUoNUQk6U8p/p4DmXN3RbiqRi1/ORzw76YztGE76V4+cmnC788WdJ2D1PNckhbJMyX5D
         36PQ6qnvzujOWblb+/yjYIKG1thwxfmxYvo5hbwfyMHSVZTu86oDaG9x6dq/cJV+p6Ul
         k0fO7k7Ikp0ggMmSH7zAnrPDX+3T9Fw4hvv5IYPAGTecssYzMT+i7HI4ngBy0QihAllW
         Tggw==
X-Forwarded-Encrypted: i=1; AJvYcCUIP2HDFvpZWULCWJmrnhYkh4O0jPS+/0D9fC7y7bMZ0qy6r7rZEJTcSRE4qcfphbl5Boj/+Gslk/q+SHYv@vger.kernel.org
X-Gm-Message-State: AOJu0YzP5ftndUUYoxQ2HmEaTOzIXIuujAqzOg7PVA11bsj3SbvUfZrv
	I5ougZXH44BA9UdpO5luWkr08s+M+FKEWVuBvx0zBQa0BjZGuxrsV1TiQx7Td+U=
X-Gm-Gg: ASbGncuSfsPpsBce/Ln4JtzNc3ltfK56eu/y8yM0UMXG3gcrZIYXIRr8kP+PD9auet+
	qAyGRrx4FFDbuGIUl8rl6WEZCqTYprhmUrPqsTS2Vv5eamGNnRvrcB30ARLZ3XMf1wKd3Sszu6t
	73oaaihgJoH/P5IfiAdQ4bz0mB4KhWB+KksTNJaE/7jp9CrucJSWLOvs9zJIV9Jhit4fn2jbOz0
	FAX0cjvOa2W9ty9DtsQmCKZluo+k3KinSlqHBi0Hpy2eh8oXX05yrgtKEPnJ2bHqXoysQ==
X-Google-Smtp-Source: AGHT+IGsy127/8dfAMUXGbTZK/1HUBc3klItgVkx0JQhG7dSRKmXMxRFxdSipoUyZPkqJHYYkUB6mw==
X-Received: by 2002:a5d:5f85:0:b0:38a:518d:97b with SMTP id ffacd0b85a97d-38a872f684amr22328599f8f.11.1736981370008;
        Wed, 15 Jan 2025 14:49:30 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b8214sm18676342f8f.78.2025.01.15.14.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 14:49:29 -0800 (PST)
Message-ID: <1bcf0995-cb77-4e01-b3e0-14f88dc91140@linaro.org>
Date: Wed, 15 Jan 2025 22:49:28 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of SM8250
 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <Z3_nCPk_g8znto4A@hovoldconsulting.com>
 <te2nhzkl2mx3y7vknokzwtr7szfge7dum7sy37ndy6laot5yqn@urv7svjqgmk7>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <te2nhzkl2mx3y7vknokzwtr7szfge7dum7sy37ndy6laot5yqn@urv7svjqgmk7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2025 00:12, Dmitry Baryshkov wrote:
> On Thu, Jan 09, 2025 at 04:11:04PM +0100, Johan Hovold wrote:
>> On Thu, Dec 12, 2024 at 05:21:49PM +0530, Dikshita Agarwal wrote:
>>> Initialize the platform data and enable video driver probe of SM8250
>>> SoC. Add a kernel param to select between venus and iris drivers for
>>> platforms supported by both drivers, for ex: SM8250.
>>
>> Why do you want to use a module parameter for this? What would be the
>> default configuration? (Module parameters should generally be avoided.)
>>
>> Why not simply switch to the new driver (and make sure that the new
>> driver is selected if the old one was enabled in the kernel config)?
> 
> Because the new driver doesn't yet have feature parity with the venus
> driver. So it was agreed that developers provide upgrade path to allow
> users to gradually test and switch to the new driver. When the feature
> parity is achieved, the plan is to switch default to point to the Iris
> driver, then after a few releases start removing platforms from Venus.
> 
>>> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell
>>
>> Looks like something is missing from Stefan's Tested-by tag throughout
>> the series ("Dell XPS13"?)
>>
>>> Reviewed-by: Stefan Schmidt <stefan.schmidt@linaro.org>
>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>   
>>> +static bool prefer_venus = true;
>>> +MODULE_PARM_DESC(prefer_venus, "Select whether venus or iris driver should be preferred");
>>> +module_param(prefer_venus, bool, 0444);
>>> +
>>> +/* list all platforms supported by only iris driver */
>>> +static const char *const iris_only_platforms[] = {
>>> +	"qcom,sm8550-iris",
>>> +	NULL,
>>> +};
>>
>> Surely you don't want to have to add every new platform to two tables
>> (i.e. the id table and again here).
> 
> I'd agree here, this list should go. We should only list platforms under
> the migration.
> 
>>
>>> +
>>> +/* list all platforms supported by both venus and iris drivers */
>>> +static const char *const venus_to_iris_migration[] = {
>>> +	"qcom,sm8250-venus",
>>> +	NULL,
>>> +};
>>> +
>>> +static bool video_drv_should_bind(struct device *dev, bool is_iris_driver)
> 
> The name should follow other names in the driver.
> `video_drv_should_bind` doesn't have a common prefix.
> 
> Also export it and use it from the venus driver if Iris is enabled.
> 
>>> +{
>>> +	if (of_device_compatible_match(dev->of_node, iris_only_platforms))
>>> +		return is_iris_driver;
>>> +
>>> +	/* If it is not in the migration list, use venus */
>>> +	if (!of_device_compatible_match(dev->of_node, venus_to_iris_migration))
>>> +		return !is_iris_driver;
>>> +
>>> +	return prefer_venus ? !is_iris_driver : is_iris_driver;
>>> +}
>>> +
>>>   static int iris_probe(struct platform_device *pdev)
>>>   {
>>>   	struct device *dev = &pdev->dev;
>>> @@ -196,6 +224,9 @@ static int iris_probe(struct platform_device *pdev)
>>>   	u64 dma_mask;
>>>   	int ret;
>>>   
>>> +	if (!video_drv_should_bind(&pdev->dev, true))
>>> +		return -ENODEV;
>>
>> AFAICT nothing is preventing venus from binding even when 'prefer_venus'
>> is false.
>>
>>> +
>>>   	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
>>>   	if (!core)
>>>   		return -ENOMEM;
>>> @@ -324,6 +355,10 @@ static const struct of_device_id iris_dt_match[] = {
>>>   		.compatible = "qcom,sm8550-iris",
>>>   		.data = &sm8550_data,
>>>   	},
>>> +	{
>>> +		.compatible = "qcom,sm8250-venus",
>>> +		.data = &sm8250_data,
>>> +	},
>>>   	{ },
>>>   };
>>>   MODULE_DEVICE_TABLE(of, iris_dt_match);
>>
>> Johan
> 

One drawback to this approach is; if CONFIG_QCOM_VENUS=n and 
CONFIG_QCOM_IRIS=m you still need to-do

zcat /proc/config.gz | grep -e VENUS -e IRIS
CONFIG_VIDEO_QCOM_IRIS=m
# CONFIG_VIDEO_QCOM_VENUS is not set

rmmod iris
modprobe iris prefer_venus=0

which is awkward.

Certainly if venus is off the parameter should default to false.

Perhaps I've missed the resolution of this discussion but how exactly 
are we fixing the "racy" nature of binding here ?

Shouldn't there be a parallel venus patch which either has its own 
module parameter to quiesce binding in favour of iris ?

i.e if

CONFIG_QCOM_VENUS=m and CONFIG_QCOM_IRIS=m

rmmod iris
rmmod venus

(sleep $((RANDOM % 3600)); (modprobe iris prefer_venus=0) &> /dev/null & 
disown) &

(sleep $((RANDOM % 3600)); (modprobe venus) &> /dev/null & disown) &

Will do what exactly ?

---
bod


