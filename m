Return-Path: <linux-arm-msm+bounces-43560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 398C69FDC5E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 23:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B432E3A17EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 22:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07360198822;
	Sat, 28 Dec 2024 22:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n6iuqJsF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B09B16F288
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Dec 2024 22:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735424002; cv=none; b=hPMnbstnKDEa1XWqPWbCtttdnwaVfWAHEOcDpA/aG7IvIBKt4pCPDAAxs+xfk9KNvQ3LDW9bN37pt3SK97hqu/IU36FtXiXJepqW70bDwK/92IghTh9cc26MqCFHB5kVTif3M9DRvkhuON0+ow/pIo7Lu3e5TrowSEAtIN4aYk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735424002; c=relaxed/simple;
	bh=dsumvKcsY6ZUPbUCkKvNLbAtCIW/62UblHiMJ6YMLwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IXiG5rixTcHMPrSa3QASTPH5bDGqHknU8tGHrFtSuZ9Y5lLgXQ2Jop5koRrl9tI5rHxzz6GkX0TFquSsLixQsrYQBpbmURrmKt084aBxWOGqLFueohXe46d9sN+WUg5VDIewWBMuFLq73pyXI0fkoDVCiuO30coP4EoUXaq9xkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n6iuqJsF; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa67773ffd4so132493766b.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Dec 2024 14:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735423999; x=1736028799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=37sW265JYbkPT5Cnsf6QtI0/jWmrH8Gz4iZapa/U1c8=;
        b=n6iuqJsFgMjkwHcQaTIVMD7hNWYLNC/JyoeLGbiaSft3BERKYIAy1HQTcGW5yj1vEq
         KzZGgbXr7YxR3rsnkSDi95a4DU5nkR1emt4ZsFn4CeSVraypHsUTkdYEkLeCuIeuQUDH
         eQRIn6sEPUEPsvIJCLl2H+tGff7paUOezXjpd9G6VEA9YEMXCbMi8nEMtVqAlmbsaB09
         xbtTeoxV2h0f6+4Xf7rdCaF816l9G9xTyRDt6MI6vQdtcNRBfWJ3W5FS/suCKRZ3XYtb
         V2UQ0EtNaCxeGGaSEi754c3w3p132OVNkyHHQOrLkwa3RbWnhLF2ZsKETt0mr0yS9hLz
         RRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735423999; x=1736028799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37sW265JYbkPT5Cnsf6QtI0/jWmrH8Gz4iZapa/U1c8=;
        b=HYOSvCj1GlXx/NtOYrGy69MNwrSY7sKd7njpqlSCzRJudQmzTq9q3rKVXV1z5NHZOc
         6M2iUTVpDyWrrHepMm/ySbp8TTxT4pGrM7y8NPye5No/tIzlPmDwNm0wB3zP+Js62H+d
         f24E5sBd9A/NNzwFWlnwoYx5YHoGgOZSNtjiuBjIMHlTdDBrnSK0lCBy8w3PdawdcrjO
         mfxy3WGWtOC3gFFCVq/Z2SHZnMC+NANw9eArJlaAMUpu0wFn7YofRIc4LSerIcs/gdaf
         SzuMs/j9DCHLsbW53uO2oaom4PBaMD4IAJvNBIF7dCpcOXsK6ASVi1IIjEGdr6WFBJZl
         IilQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPXcMA1mGY/Lw63JBnX5ukpwNcIpVLqCQhnG7bPW+dpm4ao259gq0fzvApAzhImJ0qJYMtVQKnrqqyMz4q@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhi+a5eCKUsLpCH/bfNl1dWa1ob9BzZZfoHTdqHoXYCqwh+ID7
	vXQFikMr+fcSEACFZ+LIpJzU4jcbdsqtIgfgKftrMSdur0r2AIhMaAxZwakSTiE=
X-Gm-Gg: ASbGnctfrYIvdSF65pNgt8h74jEicHoJPo8g76MihvNYTvf+52oh9T3yZ5fuz3Yd8dl
	25OF0E+MqyoaQnfJ5hOjMG/JnfdAPRvYCx5AUblp083CkpMKeHi68jUqXJv/KEltNUXpitfT5Za
	XWM0gV80NnCUHXxVI5Ud0Ik/j/obhGO12Lx24KE3NBpBXfIYzp8U9kEdstEEgcxCZgeDkqgWAK1
	QWzCO/Jbn+Ph0Nx4hZ0OeuMGgrejf0L3o38GsYZkJJhmXqyB9tRTpqpBWLTLRVT04hLZwsPR5c3
	noVHdETyzimP8GuqoC35
X-Google-Smtp-Source: AGHT+IGpNguWAQeRbFI6dFrSCqOA0Pp456sa4j2fkmtImrN1tPWCLAtiP2dkwScNWGBd2TDEdR5lDQ==
X-Received: by 2002:a05:6402:3550:b0:5d4:35c7:cd70 with SMTP id 4fb4d7f45d1cf-5d81dd9cbebmr11089599a12.4.1735423998983;
        Sat, 28 Dec 2024 14:13:18 -0800 (PST)
Received: from [192.168.178.85] (i5E866BC4.versanet.de. [94.134.107.196])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f3f9sm12668026a12.23.2024.12.28.14.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Dec 2024 14:13:17 -0800 (PST)
Message-ID: <d1254705-6ad7-4e2b-8cfa-57644b32114e@linaro.org>
Date: Sun, 29 Dec 2024 00:13:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] i2c: qcom-geni: Simplify error handling in probe
 function
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
References: <20241227223230.462395-1-andi.shyti@kernel.org>
 <20241227223230.462395-3-andi.shyti@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241227223230.462395-3-andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/28/24 00:32, Andi Shyti wrote:
> Avoid repeating the error handling pattern:
> 
>          geni_se_resources_off(&gi2c->se);
>          clk_disable_unprepare(gi2c->core_clk);
>          return;
> 
> Introduce a single 'goto' exit label for cleanup in case of
> errors. While there are currently two distinct exit points, there
> is no overlap in their handling, allowing both branches to
> coexist cleanly.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

