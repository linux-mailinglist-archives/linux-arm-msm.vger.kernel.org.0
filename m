Return-Path: <linux-arm-msm+bounces-39948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B36BA9E0CB0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 21:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22725283B4A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 20:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046571D95A2;
	Mon,  2 Dec 2024 20:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eLoILcxR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2A11DE4CC
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 20:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733169645; cv=none; b=tZ0sGRFB8LuYNOV7SLYmxWpexEYnJmmwTlqSHqruAxmGLZbaYYN8GuIi/7a7Kh3Dgs5IO00jiSw5msh0WyXmP6VMuS6XLehRgCAelbAWt7jBRRx3YPYTyJArLX4Kdc2MPCTeuvOtNiLxQMUpY3MpsmNOat+u19qXogoWcOnfgQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733169645; c=relaxed/simple;
	bh=ZwT9XETIGPRtoz06e9/Bz1xnjU0UUFwfd1/wc/ZJOT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljqEagcDJHFHi+t6UxmiTwqH3J/xT4p/lJN09+EtNEmRL6NLqCNlQ+GBjARaFFNkBQ1dfHdFjRmoeSGbLMrC2DgBi8hhjzWm0FF0b1u50yXeFU7KmAko3X7d/DAG6mh5pDG4/X7wMQdHbYSekZfqOV54pLW5/cVakQE68GYkhCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eLoILcxR; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53df1e063d8so6069317e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 12:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733169642; x=1733774442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uXAhtq60I6waVpW/O2JwlPsYrhNNVeFfaONkbV0wS/U=;
        b=eLoILcxRM3AmrUCxOGkNENSkBe1t/WhBa7Srj5s2SrXQoKOshUxRyDoap0Rmn9IuNk
         0RNMdwzGZkwbcPANhyF5bzB4a9dHHtE/Mb/VJh9a7ovFx7YmWrcHXxEQuUlrMxtK9gF5
         Fee6fVsy1niD5nt3VedUCT2slYSrdlLskoF5WTKJfO/YEQgnpYWrKV5PY3tr+PMu+/Uq
         VkYj4SerPwlc1jKuZ1QosIGA08QfQ6BlRiPKtahnopZQ3pAPbDW2vOCV8JVe8pE1KfoM
         K5Bfd9U3d4NB7w0nRUQVKyYrnnS5O8PMdtfKYsWOACxb2ad5y+4jUatNJSY8XP/KLlh7
         km2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733169642; x=1733774442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXAhtq60I6waVpW/O2JwlPsYrhNNVeFfaONkbV0wS/U=;
        b=KoKfwS78YqQHMAZ/tmDOdoyEtfCw4EmxMVIzNos0dDTL7Gb5oI3z3AFNtGKJBbhCqu
         1mivar4p5K/R+6F6NaHdS27pY/6fbMG0mFrCrtsSXYCqPiuFjtUKTDGI9CrHr3mQpl4V
         3pNjQOj5Ci8GUwiRRUNJwvHR3NdP/T70qPSfW/uObx+r6eI/fXoMT5VVBvZStihsPMt/
         ooY8p0pOqheYqDhLu8pWQ/hJW28lx6ThQwq+GDXOSf2FmGM6CcFqY0OMXUtnkZ3TD1zb
         0IzE572O4RkFbZSDLlp4JkjSIjBAyVV5kBn/rIDyt+t8k22w2KtkKZfq4WVyFOlIn3jZ
         9hlA==
X-Forwarded-Encrypted: i=1; AJvYcCU68BiSrTfYhLzBCPCdQ/1+lfaMZz7HdDc66mG6KxzMraP4kkGLNBVemnN1jx2lEa7YpDG4/jLmzL1SLETh@vger.kernel.org
X-Gm-Message-State: AOJu0YzO2wWM0DTtHgGWRtRqjCZLfIhJeAEXeAE+AVMdmZ0RAVQmtXZ2
	HRm4ixmclozH0u9gkas4MGZlty1XWmkKeKY6MtrwAlqHZpDuTETtowxuVeF0FhI=
X-Gm-Gg: ASbGnctS7U5CWtYkre+H+WzuyLhqm6EcvoOfB2n6JtfdualdCBhTznj0s6V61+tlwpf
	W9608NQxwIarbSfbhrmpsH5BLDYfu0IP3DjzVBCJ2ouxfEw62+UlG3vFKXlcGgNiXBnVvZGtb3F
	OR7RiVwW2z/IiOfcB+2Sq+ItvKR/cKTv+iQdRYkNN+yU6B5I4fayjv8ntJ8lHk6Z6xDwqRsLHPD
	MZESfBRWWowTbj93wuoF61YD9l2/DqyfMXq5Li25balu3e6Brde73pqgMLIoLRd/S/Za1LOKp6s
	Ok62d0442XCSspGTJ5TKYgrgRqDaxQ==
X-Google-Smtp-Source: AGHT+IHlBla2bkS939rzD6EaoiaSpmSshKV9IUflTjWZle/0CJSDrrxy8jwAJY6npjQNBvZiqQHQNA==
X-Received: by 2002:a05:6512:1286:b0:53d:e88b:eb4 with SMTP id 2adb3069b0e04-53df00d1ba7mr12812129e87.21.1733169642056;
        Mon, 02 Dec 2024 12:00:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f136sm1550171e87.166.2024.12.02.12.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 12:00:40 -0800 (PST)
Date: Mon, 2 Dec 2024 22:00:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: power: rpmpd: Fix comment for SM6375
Message-ID: <yo5cc3cvvwwdrqrrgwlquztj52sijip3ffyyqag55jrnztxi2m@hn75ylkhnxie>
References: <20241202-rpmpd-sm6375-v1-1-12a4f0182133@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-rpmpd-sm6375-v1-1-12a4f0182133@fairphone.com>

On Mon, Dec 02, 2024 at 04:45:02PM +0100, Luca Weiss wrote:
> During an earlier commit, the comment from SM6350 was copied without
> modifying. Adjust the comment to reflect the defines.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Fixes tag, please.

> ---
>  include/dt-bindings/power/qcom-rpmpd.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index df599bf462207267a412eac8e01634189a696a59..d9b7bac309537cbfd2488e7d4fe21d195c919ef5 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -65,7 +65,7 @@
>  #define SM6350_MSS	4
>  #define SM6350_MX	5
>  
> -/* SM6350 Power Domain Indexes */
> +/* SM6375 Power Domain Indexes */
>  #define SM6375_VDDCX		0
>  #define SM6375_VDDCX_AO	1
>  #define SM6375_VDDCX_VFL	2
> 
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20241202-rpmpd-sm6375-06582e126d7f
> 
> Best regards,
> -- 
> Luca Weiss <luca.weiss@fairphone.com>
> 

-- 
With best wishes
Dmitry

