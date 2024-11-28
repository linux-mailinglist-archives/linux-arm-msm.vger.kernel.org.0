Return-Path: <linux-arm-msm+bounces-39502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C998C9DBDA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 23:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F7432818A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 22:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934DB1C57AD;
	Thu, 28 Nov 2024 22:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="WBw7x/8M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B42C1C6886
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 22:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732833113; cv=none; b=hjlY9+OFUzGBlAYeXI5WTvce3wHpxE4L9l6FUHaMcoN8RrZ6As6EIHGXV+CtC8+AO9lJIXgvc9sPQsYKcTIgc4Y6XagRmgSLIkgEcVpu9HbH80j0XvZOn1IYW1PoEJ1Yczw/dQ1Vk7JtSWdPZFYtsCsFVrulVsMZEqXegJyKrGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732833113; c=relaxed/simple;
	bh=vSBgqREdabS/n09oBGSsyVKJgzrWW8gMM+XuvFh8jGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1/THaCH3PjnP3t0DLHfvH8aekBEHufAIUonzVYFDM9CkdJ1gORkZUtZlAo81gEqo70kwlp3NBgQNqOYERkBJqDCjb6tA9yV7ES+qi2i6AaC/g8hEKL0Y3t6cEICLTodjgwyOTklv6kzVNak7faeFedNCB/F/MOBIEsH3UBd3X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=WBw7x/8M; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d071f70b51so1497562a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 14:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1732833109; x=1733437909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhEu1O8tP+5SOvMxJ5NzUYLjAfFINMkgnefleOw9LAo=;
        b=WBw7x/8MyxeOYA35C1drkYvwbmGeO4FR5l2nNU6fJHvRM1qoyCHGsAv+XHBcX7CSgS
         kZzVQ4seYlS/9DDpIZfWfLa1hPRbBWoxFL69gT7gxVvc7OdVA5Nb2/SAVdTYk/+tt1JY
         fKHnC1WJsTNWaddqounV/z7vb1KtRS94MGLv+CzVZp/9SZzPqfb+k3tZOw56C6jV5lwD
         p9ZZEy41vl386is+dJELTtcCJTV5jtvrV+0X1be2iJ0HdLMKgnkavT8cQ8wJw70lU4R2
         ZR0r+wQ0AzQ9HMKOG+3k5KfalhYadA6xN+RMlK6fpiWH54YC40aXrohS6YbbGs3OKEbX
         7XFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732833109; x=1733437909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhEu1O8tP+5SOvMxJ5NzUYLjAfFINMkgnefleOw9LAo=;
        b=UE7/V5oV/lDXm2eVnnbWgAsFnyQKDwZeXmS3OD5ndqUXqoknTXkj3vcwRuxtH9ZP4V
         H7bN1qneHd0nu3X7Fk5Nf9jPTpDvt4eOjky6sVx4YgZyDpB4g9Njm/YbVGJK0UowrGxZ
         bzbG41bWnupK/rEdk76HLlLg4XF1pqHOVDvCK+ohr4skugN9/e1lOpjcntOiqLQ1OZXb
         PxSnpwpQYINRclw2BuUSLUNHsR3xKzeT6J8XB+Sg7yAzd5jireb/obm+i2LvNzM8sfFp
         0cMLqI6xmTAWRKRR+2NhIG6HMr9rpPgFgbCWwuY5RzG2CDz4t/QLZgTYmVv7xrAPVUX6
         /bqQ==
X-Forwarded-Encrypted: i=1; AJvYcCULJk/j6qQfZ95Lbx6U5XoJl75veo05060vYeCljmjHtKlF2Wd43AlmSIuoRDIx4hm2lxvaTl6GAqCDj2SG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp6yGSoDZ/5BFrQgyaJ2QH67srbqv3c3wnaCtPw3Qd+bhnGKdB
	e1kU1rLadRu/mlYdfcSdHFuFXdc0OyCTVMayW1ii1V3TOS28Q/pyGcR+FWIKBpw=
X-Gm-Gg: ASbGncvNGBtF84bFWutOepZKcjIZfu5Rpbq8XYgg6ABp70ZXy0U9IpTyuVpEJCWhFWE
	kPUTgOKiAoAl9YJwmk/uoI47OHbw0APgjSQyxzioWofNCjlyiTzK+cjfGfmBu1J54iRQ9tcrXWq
	Guw5xC162T/y4iIfa4RiEC4pKu4tnE3ljCGsAbrz4KJlsioqor08HsjKttlFHssj8cUrMnstQkN
	OtCKGx4hORL+Wt2yNEMosJ4vTy3meRE8cNr0PMfvYk0wId1KXT1O4pHxBO8spAV0w==
X-Google-Smtp-Source: AGHT+IF9dnpn+7M0c6EI2JeDjVFOmRxhuBpL/4iDLEvFEuP8URE+Rh0/zEacF8TcZBK3JG2szgyFfw==
X-Received: by 2002:a05:6402:3546:b0:5cf:de89:9364 with SMTP id 4fb4d7f45d1cf-5d080bb2f99mr8554599a12.10.1732833109274;
        Thu, 28 Nov 2024 14:31:49 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097e8db19sm1133180a12.61.2024.11.28.14.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 14:31:48 -0800 (PST)
Message-ID: <73fffc4f-f8a8-4011-8d69-cab4c29223c3@nexus-software.ie>
Date: Thu, 28 Nov 2024 22:31:47 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: document csiphy_lanes_cfg structure
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241128200142.602264-1-david@ixit.cz>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20241128200142.602264-1-david@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/11/2024 20:01, David Heidelberg wrote:
> From: Caleb Connolly <caleb.connolly@linaro.org>
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git ./drivers/media/platform/qcom/camss/camss-csiphy.h ./drivers/media/platform/qcom/camss/camss-csiphy.h
> index eebc1ff1cfab..e3b9e8f12806 100644
> --- ./drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ ./drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -26,6 +26,12 @@ struct csiphy_lane {
>   	u8 pol;
>   };
>   
> +/**
> + * struct csiphy_lanes_cfg - CSIPHY lanes configuration
> + * @num_data: number of data lanes
> + * @data:     data lanes configuration
> + * @clk:      clock lane configuration (only for D-PHY)
> + */
>   struct csiphy_lanes_cfg {
>   	int num_data;
>   	struct csiphy_lane *data;

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

