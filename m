Return-Path: <linux-arm-msm+bounces-61209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D62CAAD87E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 11:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E19CD3B4540
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 09:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336B12C327C;
	Fri, 13 Jun 2025 09:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YntLhhaN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545652C15A6
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 09:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749807013; cv=none; b=q1KHP6i3h1CBpMTaGwnS73z2y62oL+rLD/E4hWLgTIafg4toV2tsmlS14tNmzE+JJwULYwdwwj+d2CE/sJlAvxIX1I1h0OeG2X8E+pYZ5EgSWonHqSQIRgB0IPa1Qiw9QZu8fsT9Uo4HrdEFL1g2bl84KXl0VYgoJToMPW2NyZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749807013; c=relaxed/simple;
	bh=FRZ3rS7LFwZ2xI4KimpSTvl9sqsf7mZbBaPZ9VjWWvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i0UoJtciahL8Q3xBuIMaE033mkJkpOnSZURt/yrg0CoH58caBE857i25sQLLr9fClpDFObvlnLwl4W1OM0lBPyWjypgQtvnyjU03WaSaplpd8YndEGAK5NhaaYCUEiUaFYDJkg8Qq5wbDhp/sfLt1/2yTC16VI14uz/xFfNSles=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YntLhhaN; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so1637647f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 02:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749807009; x=1750411809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UwvcWZQEHBYkJTZwM/Y4Xtbi7rS3sJ0Dr4zv7GYJPuQ=;
        b=YntLhhaNyZnlU2/1fORsSSvnz2QuDsOxn++UjY5t6Ft5g+TYK7wFkJ6nUTuxS61qca
         2oR7Zgtj7EJOSbWGmQCtw24Y8RS0uEQ3dgKl5r5EuE7u4ePIPgKBeCoGi55B+AVizREC
         +0Dav6NvTuEc7n+7W4tXkCYmF+KgHTXhbeEhf6fZEiSl89Ylypzy3bkzRFa4TQTs9/iT
         DxgSmtb6aqLYNmwCcYHDyIkAfx/29tP1q9iwbbAESkd7hxuamHMO4Fy0vHgZ07jHAp2c
         woCUA84HmRum5FCDjAHugbtz+8RqNl6NtXJVvnKMo1FSRJJ0dUAko2USh3cjxC5W6aEA
         EUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749807009; x=1750411809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UwvcWZQEHBYkJTZwM/Y4Xtbi7rS3sJ0Dr4zv7GYJPuQ=;
        b=Sgi0RyyMB+JcrbgAB8bVbWs4/IAxYoTAJspDsh4Hcw8qwBF0lXPcsAy+qeK2ed6b/b
         cRQVfzoWEvpMurAnc1zKV/RA6vXXuT/n3IeYRkx+JckALGxG/LC5JJPoi7K76JyDSBZo
         0+uZee6bQSVNzN0egM0JfBPGZkjDcp4zsOKgVp8WEsY7egcU2JEKPZXEWLtjzbdxzdBY
         MOqLbI2AFrbJe8kO59yIw8UpBKRudW9XNQJE0grTcmqGbPao3ud4c8oGO/RlmxcWVATE
         3jR11xyBlij8aVvVfK0nHCRtPPEsUWoC3W7kV3p2lp7zURrVIcSDnCcGpbRRiNrvxWLZ
         hnog==
X-Forwarded-Encrypted: i=1; AJvYcCXvuNl1N9g/W+YPzkKECBIlfP2x7oQyKMPsOYuWu0DSfayLcviN+0pJ93vt88dIolgCbk7exbCW2qX3KaaU@vger.kernel.org
X-Gm-Message-State: AOJu0YwvcR4uVo3ITdbq1ea8Fk9V++Qgps9ClAea5EUJyqXE+DC5HXaf
	HBdWDp2qGMVFcVFKtD2Snl/6Oy35f/tH5ThTjsHIft6lZNpIaYnePugF/0V5QfaT8xk=
X-Gm-Gg: ASbGncuZs4F/ubupHJoVtM67SiJaOiXaVUza5b/paGsdPDiam22CCZ/QPIvkz3Rxo2O
	NLyjjcKGNhpX9nN26jjGWd0ddX1nnzxWs6dExe0KZuvx5Tc63lc2pwiQaqI01FXnGXGjMFzr5PP
	OwuT/M8AJEJVkS8FOw4HULTOfF2kAGfo2beM36t1iWQ85sGGvs15jS/Qn/8Ir1bBVUv4p+Cw4nM
	L+BUBwa6NYkFsevEPl2LFW416ztGTJiV/twMbE6hT5HFaMLDhgH7XeF03VAmfDvYXY6Xt795LkO
	RR5sMpLgzk9uknyEFC7qy60FDYmN/JzyZYny2mgkO5Q8uGLVQqG7dJFaGddOiDeZSJEF3WT7XKc
	D87w19qSJmAhTBWxkWGX6doIIMm0=
X-Google-Smtp-Source: AGHT+IE/evSdF1O2XoiSxVtoqH/m0lvt0tKSaWlESLN+rlHBnBxxPbQT6n88ypcT/+WJKR2QdcWh5w==
X-Received: by 2002:a05:6000:40ce:b0:3a5:27ba:47c7 with SMTP id ffacd0b85a97d-3a56876e028mr1876417f8f.48.1749807009548;
        Fri, 13 Jun 2025 02:30:09 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a6389esm1774831f8f.27.2025.06.13.02.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:30:08 -0700 (PDT)
Message-ID: <69563c23-42cc-486d-9c01-3467859e7860@linaro.org>
Date: Fri, 13 Jun 2025 10:30:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] media: qcom: camss: change internals of endpoint
 parsing to fwnode handling
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <yzkDfU7Mw7hBOVlBNpZ3U-n5SK8AMuFq-cGYPxp-hdzeaGy5aLQdZ28j3eJldg_18hj0x0H1y6EV42d1e1Zlng==@protonmail.internalid>
 <20250513142353.2572563-8-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250513142353.2572563-8-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
> +	fwnode_graph_for_each_endpoint(fwnode, ep) {
>   		struct camss_async_subdev *csd;
> +		struct fwnode_handle *remote;
> 
> -		if (!of_device_is_available(node))
> -			continue;

The change to fwnode seems fine I think but, either leave the 
of_device_is_available() check as-is or move its removal to a separate 
patch.

Changes should be as granular as possible.

---
bod

