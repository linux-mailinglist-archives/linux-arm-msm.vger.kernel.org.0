Return-Path: <linux-arm-msm+bounces-27987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FBA949006
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 15:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D47C91C20A68
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 13:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9871BE233;
	Tue,  6 Aug 2024 13:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p+sxBmg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73721C37A5
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Aug 2024 13:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722949544; cv=none; b=aa0+z7uehPp1/Nj7lyPseNqx8FyyDlq5JgZ/0SXLQ1y5UzqW7rsi/Jjy0EusomH35pgK8un5CKVlbDkZ7tVIR7cclF68JW/cr66Ps8w6jposCXEFQPvQfUJhX/Emig6R4v+opJPHa7EUB7OFvHdFPPjscbx+WunHTwHHRH0LPvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722949544; c=relaxed/simple;
	bh=5xHO28RgwE+3Wyj1hop53WiOCG5gh1OY3ob1B5NF6UI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BNgO4oRn6xTY4GuQvNnqidTkKKLsqcj9/++qN8K9kslCB0t3o2a6o/VDBWXopyysIM8/Wkyuooetz2NfgiXxRbN4h0oaCK98J16yHdfFCM9mG80zjA/DuYQi41AFCEyEeWuNI0RjpBMRfz98XnCGJUWmUqs5B3j/fFlprTfNcFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p+sxBmg6; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52efa98b11eso90728e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2024 06:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722949541; x=1723554341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U3tjEHzI6vFcFefvKAUB9C3zJO79T9ISYwRwdzZDMPo=;
        b=p+sxBmg6T3L0uP+Pmaof31vxW80U8ymeFQ3qOop61Q717dCx4oZuRA3iNpA/jQ6FfI
         icq28X1Z1672M1vgu3T92iU68q1DRnjX4/qYNuQEOqbgZ1ZGAs8PjIqm4tvHixftpcRT
         uTh5AUnX5oe7DYyJ5jiI9J7c5PuqlM5+DR3ssC4nyDkdpQWbvxyxMscU+6H91I1GBGyb
         StmhyprDYARK2C0P+pNaMS7TGe5jNbcOOmUbVDuVTZrJKMWenmHaY7F3vlKBMCWBZcLa
         cqfMDxU9PtjOjZ7S62yy3HyZXVAdujY4gspF/HBZIMxs7ysBCJs97P28xOaycVQ0Yd+/
         ysiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722949541; x=1723554341;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3tjEHzI6vFcFefvKAUB9C3zJO79T9ISYwRwdzZDMPo=;
        b=gORZjJn3xcni5TuY08g9nxq4ixvD/FVG2qX6M3b+QZX16aRl7dNhWaUoI7VxHqo5ji
         tfS1zWCZ+hJaCo4WcJGDRxktwth8DNh+yFAiCeRI2ci+ntDy5mLDJyYMecNMHnhoW4yZ
         S2tok1ynxFGyt3YLPwc2TDj3+k3Sklni7khs/UiE/c/eyFJLiV3aQGlw9mMV8PpbmLnW
         HdIVD+hdCbV7GBBGcflJHSsM59jnkHuqFxTctCTMVD0d7iLYCVVW9wqInNz1icuvtRiv
         r608dLArxeBNWu7iDKNWbDI+sW8gsCMidogc9YBpTqO+NzlSFuQ5JPR/t4aoqnaGB0tT
         i1Iw==
X-Gm-Message-State: AOJu0Yzz1MTnlzBA1flu0CqBGuB5/R8AKSc7jE+xaIRSYrYQd323vdmG
	7Fwf+lJNy756PYfu6qo6wvTTCiMG6XRGOBH187uqDaqJbgr6fxGnt8V3Q9ko4CE=
X-Google-Smtp-Source: AGHT+IFUa5J/+kOkIYUURoo4FxbRJUyi+/bxaQpFZTdwfiTt7ERcDbaJXATBQnJIb5Wd7curx3Bd0g==
X-Received: by 2002:a05:6512:b2a:b0:52f:e5:3765 with SMTP id 2adb3069b0e04-530bb39dc4fmr5973599e87.6.1722949540729;
        Tue, 06 Aug 2024 06:05:40 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba29f6asm1480694e87.120.2024.08.06.06.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 06:05:40 -0700 (PDT)
Message-ID: <95681260-2d61-4d76-951a-720e94c76c79@linaro.org>
Date: Tue, 6 Aug 2024 16:05:39 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] i2c: qcom-geni: Add missing geni_icc_disable in
 geni_i2c_runtime_resume
Content-Language: en-US
To: Gaosheng Cui <cuigaosheng1@huawei.com>, andi.shyti@kernel.org,
 mka@chromium.org, akashast@codeaurora.org, andersson@kernel.org,
 wsa@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240806125331.3170546-1-cuigaosheng1@huawei.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240806125331.3170546-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/24 15:53, Gaosheng Cui wrote:
> Add the missing geni_icc_disable() before return in
> geni_i2c_runtime_resume().
> 
> Fixes: bf225ed357c6 ("i2c: i2c-qcom-geni: Add interconnect support")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 8bc4040ba8be..2deaf502e6ff 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -992,6 +992,7 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>   	ret = geni_se_resources_on(&gi2c->se);
>   	if (ret) {
>   		clk_disable_unprepare(gi2c->core_clk);
> +		geni_icc_disable(&gi2c->se);
>   		return ret;
>   	}
>   

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

