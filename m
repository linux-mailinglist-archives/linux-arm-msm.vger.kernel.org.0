Return-Path: <linux-arm-msm+bounces-72880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D67B50981
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 02:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 123BE5E5C70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 00:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17ED4A23;
	Wed, 10 Sep 2025 00:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zwOlaM6G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FD117D2
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 00:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757462639; cv=none; b=uq0HalLZc8lWJrUb4wPkCwf0tBMw7bZe5RRXzUnX1MDtShNZvbCo511GbLW6/636R8N/CRbEEgcQVufDkjnYCgtthU04DL1hcA6FEU6UBgUeWbz7jyxVMJpJSfgR/M/6HJOlaZ+StnsIbAVDdPIDVBtwzD3f4xTYfc1MQO3iwZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757462639; c=relaxed/simple;
	bh=aM0f+GLpVC3RdUBNG53qY+EWXbzr1kR/wdH90UTSUcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c7GPjxE2/rFvwhTvnU30yTsEM42mAJUxlz0PWQRCyjG1Eu1TcS+JqcTmP+3m3dRN1U/q1s/KxGTZgp3vJAJIpJkcil72pvsrSi7fppEZhCI2/4irwHWUpstkIQkyEwXf5sH/7EMI3gb5vFVhHLO8ULMD6KIQmGk2g1O0U7hHHEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zwOlaM6G; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f75e85dfeso758519e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 17:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757462636; x=1758067436; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOWfAUqBearDduvZwNuqD1QST50/2mEcaT/mHs7RZ7s=;
        b=zwOlaM6G+mUAMDW8T2C9inM30YLkRJxUUiMA6zThfH0g1GWjGkeUuflT6k6dwZIvQ/
         iQGks6h29lPSKL8LtHGxIcCo43Iyz/13wVSmN9EE4bbHAbJDwP4yuMxTknUnFT+ZsNg/
         dFMyl8Oss91Chj91hM1LBNW9qaKKQ+z76RUcUFQk+EO+iaO9nFv8qWe6YsFX7P/oDf2r
         HyzTXa33L6+IoImVqA7nD3+iY26NEIIuvSDU6Dy5UYFF4R02nWeRDDSkq9VYarfkTU73
         qNJ+uIEHYYdLs/HMi795C305Wbw20Z5ClbMCtVBduatxyOpOD1FXNw9yt/kGJeIktPFv
         QL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757462636; x=1758067436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dOWfAUqBearDduvZwNuqD1QST50/2mEcaT/mHs7RZ7s=;
        b=NgtcziTg97SDLwRqH1P+Sj8P6D2Uq+4Rb+3uWAAmquXNbNR1e7j1jeDOXkkUBuCxgS
         L17cwXl5sUaZWDqqpKOP1aj2Bq/LI3bzIMfyAC1GEYkeCRkaadD+zHWJUUQJPZ296eB5
         LL0RStHRckW7xt6JiXjeyYU73rSSzPax5piiq2EHpJJ4MHLJ7cZka4F3E+Slgixc4/SF
         HvOp8/OqiYqnu06dgsVYy83uPMoek4hlEd8ZXvlMVwH69yJR3HIL5u+GnjdLRl0oPc9j
         ocpo//fMQH3Brno9W2bArAhaXe6GONWiIObtvo8cUlRMtMMPzFBvsfNKzisCstrlFdWu
         cJPg==
X-Forwarded-Encrypted: i=1; AJvYcCXaOOlQf1+5L2VG5op/9qzRf/l6DMMqyQLLu2UPiibXURqxWAtMGtc3FU2AuVWjaHvLmobFhT8EweoApZvp@vger.kernel.org
X-Gm-Message-State: AOJu0YyiNq6UHCFyqkBZRLqM+Bg1T8Tl236VjyQlP87NKXbYquSNPzT3
	3Av4b8RVzBbegzalMOrcnc3RcZcJWVZMMfM5aLrcQfmu1l2TCLf1rsv7P2T/M9ajxQQ=
X-Gm-Gg: ASbGncs4YORwLlequbaYEOcJn/LgEF5681jo45m9+/KDzhzVGiTYCLBWcBbiLoq3X3K
	BFoP6+yu2ZcdRTxg6M/vwgLZGnwq5e4YDmoS6uBD/mjWBYBxYmJ3seFFmSc8N/44vE4HevJZPbV
	GEqXR8HU7xngo+MJuARImKyWua9aU6vfnEtxCTKqTnIMiReGB3v9v5EBY1CWDOwh/5SSN7dh0pv
	JKs6MxdekH/hdzYsucJI1VTvyCAORhbbCyIpf/6FL/HMyfmzEA9ugVUT2QKc0trP4b4ijtpfJiw
	cEBr1ZBPF3X3aaUcfm6dnSoIfNPrxrskKuzSQ8Byfxl/SyWIwc1fW5oUvWhGrjKhAhCwIkazxfx
	ZNzDkWrE3IP+MHnigX/I99vCcCzvmp+BMJ5duy8tqJQvapgOKFfODsuiVamRDsf76Unv6axz9qR
	MA
X-Google-Smtp-Source: AGHT+IGi4WCm9ZDYvvM0pG7h9K4bW/FAXAlAlGeXUYm8D3ijw8/ibjgsoLmCo1Mv6kNjk+5aQ+ldew==
X-Received: by 2002:a19:6417:0:b0:564:7824:7771 with SMTP id 2adb3069b0e04-56478247976mr1245873e87.11.1757462636067;
        Tue, 09 Sep 2025 17:03:56 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56817f72e64sm836274e87.104.2025.09.09.17.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 17:03:54 -0700 (PDT)
Message-ID: <22e585f9-fdf4-49b0-8d08-37c3dad94551@linaro.org>
Date: Wed, 10 Sep 2025 03:03:53 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Add missing header bitfield.h
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 hans@jjverkuil.nl, kernel test robot <lkp@intel.com>
References: <20250909194636.2243539-1-loic.poulain@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250909194636.2243539-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/25 22:46, Loic Poulain wrote:
> Add the <linux/bitfield.h> header to prevent erros:
>>> drivers/media/platform/qcom/camss/camss-vfe-340.c:186:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       186 |                         if (bus_status & TFE_BUS_IRQ_MASK_RUP_DONE(i))
>           |                                          ^
>     drivers/media/platform/qcom/camss/camss-vfe-340.c:36:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_RUP_DONE'
>        36 | #define         TFE_BUS_IRQ_MASK_RUP_DONE(sc)   FIELD_PREP(TFE_BUS_IRQ_MASK_RUP_DONE_MASK, BIT(sc))
>           |                                                 ^
>     drivers/media/platform/qcom/camss/camss-vfe-340.c:191:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       191 |                         if (bus_status & TFE_BUS_IRQ_MASK_BUF_DONE(i))
>           |                                          ^
>     drivers/media/platform/qcom/camss/camss-vfe-340.c:38:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_BUF_DONE'
>        38 | #define         TFE_BUS_IRQ_MASK_BUF_DONE(sg)   FIELD_PREP(TFE_BUS_IRQ_MASK_BUF_DONE_MASK, BIT(sg))
>           |                                                 ^
>     2 errors generated.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202509100228.xLeeYzpG-lkp@intel.com/
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

