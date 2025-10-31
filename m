Return-Path: <linux-arm-msm+bounces-79772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E61C22CBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 01:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5EEB14F2DF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 00:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946AA1C3BFC;
	Fri, 31 Oct 2025 00:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ftCtbTX2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E8E1A0BD6
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 00:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761870770; cv=none; b=PInfiGYeKZykukgUAeIWyWkgxhS4lehJdXmyo118Jn3cWnaogMFjFwG9P3W3zoYHaCFBX7B+ljWWohDhhKLS81aGuTCCDkd4QQ0WKfOB1EdIuPGz1QvfBIcuASOVKm1TCuGWTdST8qMTx8rA7ktA6qLz+DJxIoMyunHU12426CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761870770; c=relaxed/simple;
	bh=h1TLH+nEjFU2KXBp2iIuzuSAxG5eFA8Sa6aoePIEORk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XIodrl/rTzeU3hbkzQKHVihOq6b6YGslE3jV4kR179Qded3aRS8EKTN2V5xiU/UHDKJ6hdFYD8gwtytgCnOM5xLkNwbcI6ZFGNlKfNwYgzUzLrmtgR/F5O95TW2NNDIfVFuo34aS30j6+a0TULV/nN+SSH/TwqRYig+mKXh+gBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ftCtbTX2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47710acf715so8712895e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761870767; x=1762475567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4WS+57LRAe2z3W3iH5ZoI+GUsCAS2zPS5JkdO3F1cjY=;
        b=ftCtbTX2hjWDOlZjUkKp/iQfqDg0UJ+QC5uAjzU6PCOwbjXRiYYxENCmDA6akQ1QW6
         /oCL1U4hIZJRmHmuyRIIuCy/1WhV/tKzPLHrvrJQyRAGeVhhwsyIldQHcH6HmMToh2Mk
         fZ4yHJV6GAnSgvGWJjYxUeQJJbc04nuMqmfDOthgHP2AmjnltSE7leBh/l6d5DwaRCYA
         Me8l22AmNyaMOk6tsAeiVmDJiYglFmC4RTerIALbUFsF5S7oiw6fOYeRz54jKjyPxCqh
         LpfvGxPq6K/u0AawEscsxbVohKlcdKiHvzcO3KH8bN2wUZZjiBploUJm8uYrfUqR5DW2
         mUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761870767; x=1762475567;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4WS+57LRAe2z3W3iH5ZoI+GUsCAS2zPS5JkdO3F1cjY=;
        b=qIEgiGVfWVHjgmPaJt6vUAlB4HbXJkN7WkJ113ZOkFHUIeuu935WH7DP9O97PHirqC
         2lnQJDuhC7NlbfA3WUvcV7D69tDQUsGOpFMhYMFwdXBu76DwavYBE4jvrJB14L9bNbN1
         47m1/xh0skALXbFQ8L0b8+GDXVwZHREeniz+1PWtgLqRxnt8lewlYKnydL2SeIZf4HhI
         Hwj2sONV1L+aqrJ1n7xTv+4zewzc/NuZOzmtJb+9ovyhvrgWxb5s9n5UmN58Tt/pB8T2
         ywBZXIqbYYBK0//GBifVMh9i36grg+jp3cEujlLF9puKvzp/HRhfL549d0F/a2YGvHF7
         dk6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAyYXoRSVTD+qyi6XDqeQ4zLzneitELAMz4EHLmptcqR+C83+oRs4strBQQo1fVSsXlE5XkPw19K2/OASK@vger.kernel.org
X-Gm-Message-State: AOJu0YxyBH+B6lziZvXAdxbd7w0+erywaoBezY67/t1bXlawdKliUbKi
	aMMPGZwUQ3bPUbz9eFbo4JMEX4Y3FtaMBSD1TBG3CEL8om5ddQ6JWMPQAefZPNdqFmw=
X-Gm-Gg: ASbGncsb6uMLSqr+AMUybLrUqKeOsfHN22g+yrCOwMLPuMq/59kGr8HUXvqG/Vz+Kni
	U3MNle38wjN5xsUjdc2pZ9WdSsnj9/pnOeDdh3kF5SNDvvOl6AS0KSSYhZcofxGFW0tLTX5J7pg
	GhSAsspGdAHmEPjNjkCW4pLFVzQJY54nyC/YVkBUVfRNOLDajwo3sU8faw4nej7ziI6dQow5VLA
	Yr+od4FQYcIlihfyQEIaGmaNCyqUg3pD5jeynKubiNrUCtL8RHGY5JwmP6F+GTh2dNkYr604RxT
	xSk8Lfv93bFn7PqR4NDE0OvDEdezkpaOzvDnGnoIFIibnebgmY4kiqUN8SVI8VJ1uR8IKoVA8ig
	2K8VrKrcnOvaZY0yb5sbU2W7qsQEQzLqDSs9Q8eTiPrlGTGG2fljiO12CuS3R8DgyhN/dZZl6/Y
	+NDU1dakf5eo8ST1P3D/ondO73XHS9L26ht/O0JrNoKBpt7R27KkWu
X-Google-Smtp-Source: AGHT+IH6S0BGPSLesVEJyyjn1HKh+/PSEyTQZTdOC1ozQ38rp8QkhnHJnaRNW4UulaFZCitT1zs0IA==
X-Received: by 2002:a05:600c:1d9b:b0:46d:996b:826a with SMTP id 5b1f17b1804b1-477308c8b64mr14997905e9.36.1761870766940;
        Thu, 30 Oct 2025 17:32:46 -0700 (PDT)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47728ab375asm65700185e9.17.2025.10.30.17.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 17:32:45 -0700 (PDT)
Message-ID: <536dd549-739d-4c79-a46a-e373b233aa4c@linaro.org>
Date: Fri, 31 Oct 2025 00:32:44 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com>
 <2RL0oNzhGU62slpUlEImZNc7UKB19dBLEtchBiwHw8taKSKcKabsuC9iZIV3dWKfXF4UyIdNmspnQ3YpX4pk8g==@protonmail.internalid>
 <20251030-av1d_stateful_v3-v3-2-a1184de52fc4@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251030-av1d_stateful_v3-v3-2-a1184de52fc4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2025 07:00, Deepa Guthyappa Madivalara wrote:
> Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
> enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>   drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..bdfdf45c5de2f2ce885f219007718a54b5c86251 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>   		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
>   		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
>   		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
> +		case V4L2_PIX_FMT_AV1:		descr = "AV1 OBU stream"; break;
>   		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
>   		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
>   		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;
> 
> --
> 2.34.1
> 

You've missed accumulating Nicholas' RB btw.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

