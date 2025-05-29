Return-Path: <linux-arm-msm+bounces-59813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8DDAC7C38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 12:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1010A1C041BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 10:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E353B290097;
	Thu, 29 May 2025 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JiQMx2df"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE5B28F95E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 10:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515698; cv=none; b=X9yTrBmJyj85jJ9syyVrOoCX8VnvblE3lTmo3MlC3Us7Ca0xf370LQBhQ0vzZ09p/0tTGu9phuzLaNvdtV8EJsR7I5rNqLU7Us2z2+vMQ5hlFxLT7yb9IiN1E9pwK7HuEA/Dy99FX9S3SWToaaS97UKWBD98RPD4vSj1mo3hS2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515698; c=relaxed/simple;
	bh=9ImJHzLH0jL2vdmxV+OYOyql4HTnk5Je5y1Xr/m0mRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pH6SM4g/4DcdMRgX/e7AxDbElMxyaw2o7QxukuGuNW4Vpj2xgy9d96z/i2ctciGKhMe8e9ErFdQFSW4DIfGpzLyH7ebT0TilaY/HyH9b7Ef7XrV/3QgF4eMR9S1KR1TxRCN0cdCFMMa7ALGAlyhG7afQrye+Qp4pzR6fH4VDZtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JiQMx2df; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a36e950e41so510858f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 03:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748515694; x=1749120494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fltj2Psgn3UlDM+u8Y4W8Qy2aMJ2qUEBMZ88hSUWHB0=;
        b=JiQMx2dffy9X6XTN2tbkOfEqRXznebpTuZowF0R5TVOk7EbNxDZCCQyVmoodklPb9O
         xDV6+rmorNlmv66Ka/a57PP4iF2yhVHSPJ6rJC/FmOJEfsBKeJxzlFnnaj2F/DnvylpT
         4dWcwNW/NA3+jaJJ9Y912LcuWQrc8OuL7TQpDhNWzzsKMwox6kw4sihJn2PJ+o1081bn
         8HhAgCRrjMymhlAaNwUDSEYq0LsP4ImS0WAcUmeUxM74Pz3YZUnZ9KB0deW4VikXS1VR
         l/Q7Ur8JVSNFrMz55uP4e2j6lfnOQ+3BeKj7MoZk67XthxbeR7hnE4P3orU4ZRcXG/v6
         mUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515694; x=1749120494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fltj2Psgn3UlDM+u8Y4W8Qy2aMJ2qUEBMZ88hSUWHB0=;
        b=bSQSEtkXWiezjNHTj6SyCkQRqHDO0dkV9xxzEjAyRtk7MGRVNI7h8AZNLXfsnr1teS
         FRuHoKCu7JsZDibkW8ee4cb3TsmzQYM8RPT5VU9pxQ+AO/KZK0GJsn7pb99jQdfdCboO
         3VQhB2Vfz1cDU0SRj538T9KwUSUC1y0jWnSLym1e+rIWrYhqkGGz1q0GPCmKbtWfrICy
         iOrWv4D9b4+c7JY7yx3fAfOlFYm9FCV7/gJ04/Z/YV7Kg8cmTu3tF5smJoy1ADYKaZDU
         pU/AFS6+T3fqdwmRELOCY3XFlAHsrsFvKpwoI2iYzaCrp3g/QcKE+HwHRFukI3/A8ANx
         gzTA==
X-Forwarded-Encrypted: i=1; AJvYcCU217MTEiFrT9LiQOCWfvlKCfXHp5LxMDbF5lboReh5ArnFOVsjCPnJne7iD2g8XyBFeK8vDYMuLhOtlSQW@vger.kernel.org
X-Gm-Message-State: AOJu0YwBtqRguiPINE/KbISaMp/fPxDBukhHLG8VtSCh+Bm0N2YHN6Ml
	8VyCvL4vLBNhDnnsrD/c+onp7f+Cbigb9qBWshTxKAxzJd/JyQtACnV1x0zxibYsv10=
X-Gm-Gg: ASbGncvPcRmtYKH94sMk0t5Mdq7VISplatmxzfEb94vNUNbuVdLgjbjHZd7na1/9zAH
	m+iUkAWZ1Kh0xQ3SdVLoP4YbF45SPxis+LpFbB+F7aCDipGstLipPWK760Royd5XGAgNtNTBFw6
	OusKqwC2wxG8IPChNhz6xKoiRebUXE28OKLvimU9BvCcufndpxD93VWZhhoQCoIKHYLAz3AqDLN
	8TZCwuGKeQTf60Lu7Ti7+eMBFobRFr3F75oWfaFyh07I2xw41dqJIPudXCYW3O7VOBWO6O32fGe
	0yB9CdKDIjAokMvUkoAbUVPtMP50yXSsxbFUz89Oo/Ln1XJ72EMFiJvUQWgJbmLmNfo9y0e0xc/
	x2i6JnKDuxqRunUEg
X-Google-Smtp-Source: AGHT+IHo7KwNlZm+YUU+4y9qfkwD0vC7HRbv21RQgV9il9zHrHE5PzF+Ny11DkPWVA0mfReGd2bGgA==
X-Received: by 2002:a05:6000:2c12:b0:3a0:b308:8427 with SMTP id ffacd0b85a97d-3a4f35e1bc7mr1175259f8f.37.1748515693825;
        Thu, 29 May 2025 03:48:13 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe7440asm1664853f8f.58.2025.05.29.03.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 03:48:13 -0700 (PDT)
Message-ID: <4bb5cec9-2c3c-44de-af55-158fadb97acc@linaro.org>
Date: Thu, 29 May 2025 11:48:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] thermal: qcom-spmi-temp-alarm: Prepare to support
 additional Temp Alarm subtypes
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
 amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
 daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
 srinivas.kandagatla@linaro.org, stefan.schmidt@linaro.org,
 quic_tsoni@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250528235026.4171109-1-anjelique.melendez@oss.qualcomm.com>
 <KRWImQTV1yspNfrTQL6APj8mfVUU3rve6Qewj0N5Ayq8QTgHbEK9puHPsML1OlJuFq2eoIKGGh8akuoPv-VseQ==@protonmail.internalid>
 <20250528235026.4171109-4-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250528235026.4171109-4-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/05/2025 00:50, Anjelique Melendez wrote:
> @@ -356,16 +378,12 @@ static int qpnp_tm_init(struct qpnp_tm_chip *chip)
> 
>   	mutex_unlock(&chip->lock);
> 
> -	ret = thermal_zone_get_crit_temp(chip->tz_dev, &crit_temp);
> -	if (ret)
> -		crit_temp = THERMAL_TEMP_INVALID;
> +	ret = chip->data->configure_trip_temps(chip);
> +	if (ret < 0)
> +		return ret;
> 
>   	mutex_lock(&chip->lock);

Could we just drop the mutex lock in tm_init ();

probe()
   tm_init();
     mutex_lock();
     do stuff;
     mutex_unlock();
     ->configure_trip_temps();
         mutex_lock();
         do other stuff
         mutex_unlock();
     mutex_lock();
     back to doing stuff in tm_init();
     mutex_unlock();

There's little rationality to tm_init() being a critical section but 
also doing lock/unlock three times inside of that critical section.

Since tm_init() is only called during probe() what exactly is the 
parallel context we are premepting with the lock ?

If we can't answer that question the tm_init() mutex should be dropped.

---
bod

