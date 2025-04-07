Return-Path: <linux-arm-msm+bounces-53346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B22A7D8F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 11:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FCCF1893859
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 09:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA64225A50;
	Mon,  7 Apr 2025 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F7MRokof"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541A92E62B0
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016660; cv=none; b=dDYf9+V6ksAZ85hiPlYT1aiN1UCsn1MGvTJZRXTwxHQbIG8ykELh9hIFftHiR4VzWYFH9ZE6ikb2DkpGaFGsNuK685PW8q+gtBEzKiZwn0Zt+4eS56dzFFhOABW9eckKqtxAItTWz8G51VMVVvBUKaG1x4AkyTbmIO8t8tH3iE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016660; c=relaxed/simple;
	bh=iqoN+wUuUnOuLAL2yag/p3e39+tGVOKR9kF12dHb6lM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VkKl+3GhoqA+NBY8oiyyHTkZRkzRyAS72gQ+E0fIgowdKZf8E+0NbCyxFzXzguub8pdNPcC9LbLikY4lLO7DMFQKq8l2IgU2FIl2YumOYj1a8HehNy9ZRUPxXpate5UBQ1RtWhL8YiZwFF3B6ePyd13+ZtrkHEQfBri8/zdoLHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F7MRokof; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-399737f4fa4so2153193f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 02:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744016656; x=1744621456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mjc1Y+yTBBrDmieRT6oEJnnJtw+qsXJp/dvlQ9n6z4A=;
        b=F7MRokofS7GOHOlEa2Y/IcRMQaLHA/mcZOzKjZZz9COPVbSo8MexKdCZT/Cb8rla0Z
         St66w17w+UU3O3py69hv6fYCDLUV2MBq9CDCsQKopVMWxi5pwzHOTWiaMG64ptXUSQjC
         2lCBLs4aCdLTy058gXTuylZPJ1fJ0sYvSLt+k3L8nxdOb2y7e9j53ffSTHvzgyef+Z0R
         tMfyoBE8i+cOKBw7xa0nOxPrTNeAN4jasfILZX7UxpptjSt5WKmGcOLhAXrP0SOqd8R+
         dcQKf6zEubqpDjXygknq5z0afp3SWyIyyzGTFEDXd5GYUgm6pcpNsFdc/jF1J/ZdJtpG
         lkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744016656; x=1744621456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mjc1Y+yTBBrDmieRT6oEJnnJtw+qsXJp/dvlQ9n6z4A=;
        b=j2aeJbbIueWcf22Q21gHD35lwtx+H2Voa/5VnawUpONDHx7anuh3mjhKScXTdPZ2FA
         bogblqvfEC7KlCDXgzrrKgpxVR6QvkqNa5DyjXYHk/EX3jYoI+0fuTGs1JDEmXRH3D6b
         4iceXQ5Yza2kv1HSAYexfdFxA1SMkFkN//qn7rOMgFIA8ElJgTAa8ZFKbGAfe/qGO5k8
         ptPXh/OwnuvFjOwzZE7mNpb5sgHufy451L5HVDCJAZBJYCba7p4b05HBe87rErvgziG8
         SOb6naDEgDYQ6stDtFFKdLurR93T8YXqNPXaFeAF6iGy0l6/NnBvOK+nA1PaYiQmC9tO
         mqnw==
X-Forwarded-Encrypted: i=1; AJvYcCUe3gL4WJXeNQftrLrt5WNVt5afVxgVyWjcssFLJcRHz/np9tB+vMaIpywq8nRaP95Abrde/1UCgnK0/Xst@vger.kernel.org
X-Gm-Message-State: AOJu0YwmvUmyFH4TXgBnz3dNngzX5WKpKA/LczkfhCEFYM7D9bH20BlX
	0SJZQ7ct+nJkxCKZzATr7zXrv0v5Fjjm+avR0NSJS5emIh8yaRPk/gZinZM0HkY=
X-Gm-Gg: ASbGncvPqhrBV19wM0XdvCzLTuJAPdebQGq0/tnlQfOHbfnkD0lM3pAZDGwWXIXn9xh
	KKD9j/T0dPdC0KJ9aVzpeCPjKjPWmKTzL1KDmk33HI7Uv2gyTsGmx+0nosfiB+Q9m/9v/RFhxDs
	qcGUrshT7IK7ReFFabqzBmdiYTVb8KZDZ3tiQWs8lc4gJK3WxGMQ89HZ9tYrEaufMlApPFS0may
	ApOSu7fYE8OPmTKPW2laUFHMIlNVW9dSCnLDdRfgGtj9MHB7FrcfcfCuQYl9gOpTQ/4VglmRgkz
	9O/hY7PsnBnk2aWsEMWMzMmn20TA/35oRIVoo7RnGjrPHfqZ/JIlQ68ZvfI2GgoEbOnaPabod8g
	FdKF8FVkZJw==
X-Google-Smtp-Source: AGHT+IHqiLtGTmRqnpWpvYCAC7ffTJvnLRZkBR4aIwuAQ3CmyK5RdU7aVIzfT+V2SRxkUVqIof16+Q==
X-Received: by 2002:a5d:6da7:0:b0:39c:141a:6c67 with SMTP id ffacd0b85a97d-39d0de66aacmr9192901f8f.45.1744016656623;
        Mon, 07 Apr 2025 02:04:16 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096ed7sm11148889f8f.8.2025.04.07.02.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 02:04:16 -0700 (PDT)
Message-ID: <22b1c835-b0d2-47d1-97ee-1976d31beaf9@linaro.org>
Date: Mon, 7 Apr 2025 10:04:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: csid: suppress CSID log spam
To: Johan Hovold <johan+linaro@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Depeng Shao <quic_depengs@quicinc.com>
References: <20250407085125.21325-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250407085125.21325-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2025 09:51, Johan Hovold wrote:
> A recent commit refactored the printing of the CSID hardware version, but
> (without it being mentioned) also changed the log level from debug to
> info.
> 
> This results in repeated log spam during use, for example, on the Lenovo
> ThinkPad X13s:
> 
> 	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
> 	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
> 	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
> 	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
> 	qcom-camss ac5a000.camss: CSID:0 HW Version = 1.0.0
> 
> Suppress the version logging by demoting to debug level again.
> 
> Fixes: f759b8fd3086 ("media: qcom: camss: csid: Move common code into csid core")
> Cc: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index d08117f46f3b..5284b5857368 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -613,8 +613,8 @@ u32 csid_hw_version(struct csid_device *csid)
>   	hw_gen = (hw_version >> HW_VERSION_GENERATION) & 0xF;
>   	hw_rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
>   	hw_step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
> -	dev_info(csid->camss->dev, "CSID:%d HW Version = %u.%u.%u\n",
> -		 csid->id, hw_gen, hw_rev, hw_step);
> +	dev_dbg(csid->camss->dev, "CSID:%d HW Version = %u.%u.%u\n",
> +		csid->id, hw_gen, hw_rev, hw_step);
>   
>   	return hw_version;
>   }
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

