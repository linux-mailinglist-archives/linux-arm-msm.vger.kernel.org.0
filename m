Return-Path: <linux-arm-msm+bounces-61067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D07AD690B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 09:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CA5A7A4086
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 07:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B4B153598;
	Thu, 12 Jun 2025 07:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z62n9Jbj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A6019F137
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 07:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749713474; cv=none; b=g9a0byC5I8crkwiiKp+TqNtgnQvKgrRxFxxcwpzQ1iPx+R56TkAs10eOwfrB2oPovEWZlYbNJoQn5RwwHwQqbWH6EJiXbDxtTjOQZUOdrNT2kikh2xFw5sWr6aY6SauWJh86sKKkMlKmSAh2rk28DZ6PQtWzAs0hJWDy7xochyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749713474; c=relaxed/simple;
	bh=DytnShO1ZkrY3YduQK7K2doyiHaoDr25jT842HjbEEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RvX5UEqo3PBELxwTjCxHx8xbbLNSiadGysjZZTRb8R4mGAjtx7T2b8vdM6wd6OO9cyZHttsEjIz1lT1u8yIjMZPAWblxUw79dSNfU5p6F8VNkPBiguQ3+lx+US0F3PSQGKMEgCaueLHn3gM5ZfJKU3J/FiuaUTyJRA3O/BKUf9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z62n9Jbj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-441ab63a415so6055135e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 00:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749713471; x=1750318271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U2K4poWn7VnmnFJZFCsrOToJAaR9lYt8Pscwy57oCLI=;
        b=z62n9JbjNj57lgNLTqHYDqUcA2E5hz1p0bT5pOlSMm/940JpYGui4QE/bKc3rxkR6C
         13A6chw561xUBlbJtMXfJXqjGAW2LiHHj2ohXARBogXEc5fyVjHqx5jGNWWF37D+8+w4
         ay5q8yj5JCUjXQOFwDgKFBBuPMWoM0v4Ae5MtfqX1I5YHxLBVwwVWrT9oSo+Z0TmWHSA
         M5j3k35SEa+cXFL39lJwvizD2inAKMYVwptytz1QzZUb15X82Ll4TQw6R1L+MJX9hXU0
         ZqXHNmTibf7GPmzzNgkOnp0675P2eqVRIubYM9oEmHaYzsMrEmIgbCxfdhQRXf5TPp+T
         PWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749713471; x=1750318271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U2K4poWn7VnmnFJZFCsrOToJAaR9lYt8Pscwy57oCLI=;
        b=M1ay3yECAd3xD3FX4X92oOHkwi34C7x0Sriuh0CMke1MS2u5fmqnH+g6MNmcwvbNFx
         XNhhpVOARFH0HzNVi7XYj/I97y1WL7ma6o3FVzeOnARI5Q1qSPRx5Ke32Qm8AkrGLjnW
         1A6ZaU+MD1VdzJPzS2pq9oQiTan0dqv//NzCj8K4g+HL8cgLtDkIkjWIv7avcinkHekT
         LQV844dgDYEKq1LZnUk1lUih9VjaP+23sIk5gBhM/wlEd3rWCtQpHtUyZcMDfLIZ/3wS
         XuHM3WBWzMUZWWMBdcWydLVT/bLi/yXgX5p0k3G3GyJKdNF6qBRh4+Epk6+STDiAl9lK
         ac/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU82s9c9dKOHa1r4DxhaqfeHgo3OaIKgqgvsJol0N4L9AT103FHjWzgkzFu3axf12OHXIduu2GJyZjU18+N@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg8fiau0SPVonxabwiToGlv52LydLZM87GDOxG5pBx3yoimi4J
	99kEfk1vXIr3Stb6MhIKAX4ZjgNxRE+ThPt2zNFwH9OAAaQ1dk3RcoeYM6kHwQV5LGk=
X-Gm-Gg: ASbGncvGIDHqJbkLnOBujZZtu9aHF+iuQ2fKzlZObhdKwF2N0qWjXZQMBRKWKZBWGuO
	8CE4ILSYf2wWCORe+YHQSzAnEyEIiZKdLI2Ky8I69/dDko8Bw2dn6WISlAkcT08IAcSo2bWOGUH
	TqZxQtxaI3hJ/o187PDpktwDyHDaNUKM7NZOgZzd4i+Mduo02UQVmJM7Mlq8cmiQ6DzbXFZwIMk
	fhHDgNlTftGjxfx26Ut0b7f5p2vBdK8cd2A+ehyIXOqsMhSM7yh7w2yOMezUbAKTPviY2PdGNe/
	EDvEr3C8ZbwBAoYr6JNd9OIGxYl845hQ4WVdfR06y/i5sbiRElCgkL88t4smlau0wXnvtK8ZAyO
	Kun5zKzQEQk3s/XiNdk2zEbO0Bje6WieehSIcJQ==
X-Google-Smtp-Source: AGHT+IEI6CTfuVgQmq+MagvljGcEFTlXdLUrVUXXbzliGf2KA96uAHVIrBshaqVZXl/+EEK0ruOf/A==
X-Received: by 2002:a05:600c:5394:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-453249a14f1mr54591875e9.6.1749713471293;
        Thu, 12 Jun 2025 00:31:11 -0700 (PDT)
Received: from [192.168.217.94] (31-187-2-249.dynamic.upc.ie. [31.187.2.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e176d30sm11614915e9.37.2025.06.12.00.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 00:31:10 -0700 (PDT)
Message-ID: <0944eab5-099c-40db-adeb-6bd80e9ebceb@linaro.org>
Date: Thu, 12 Jun 2025 08:31:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] media: qcom: camss: remove never used
 camss_vfe_get()/camss_vfe_put()
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250612011531.2923701-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2025 02:15, Vladimir Zapolskiy wrote:
> Two intended to be helpers camss_vfe_get()/camss_vfe_put() got their
> declarations in commit b1e6eef535df ("media: qcom: camss: Decouple VFE
> from CSID"), but the correspondent functions haven't beed even added.
> 
> Remove the unused declarations.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 1d0f83e4a2c9..99831846ebb5 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -160,8 +160,6 @@ s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>   int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
>   int camss_pm_domain_on(struct camss *camss, int id);
>   void camss_pm_domain_off(struct camss *camss, int id);
> -int camss_vfe_get(struct camss *camss, int id);
> -void camss_vfe_put(struct camss *camss, int id);
>   void camss_delete(struct camss *camss);
>   void camss_buf_done(struct camss *camss, int hw_id, int port_id);
>   void camss_reg_update(struct camss *camss, int hw_id,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

