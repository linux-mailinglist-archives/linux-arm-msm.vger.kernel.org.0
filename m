Return-Path: <linux-arm-msm+bounces-69107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43099B25BB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 08:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3272E5C47AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 06:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9C423B611;
	Thu, 14 Aug 2025 06:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IfRcDyDp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBF123C4E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755152367; cv=none; b=iH8UPMwNOxI2lXCqMeazeZHT/viCJwRs7m81sYtW0C1z9nHKdwEHluMDdHWXJCQTPOfgXgCJ/dKWUtHxVEfVE04huXfF7GTVZhBcQc0D9HsVGmH/PTZb63MGYB3Btot7Osd6j5vUwSvJxqfwv8cpaH73g5edgfhl95uzVrQZKxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755152367; c=relaxed/simple;
	bh=2bDAz3ojni7hFnSBL4wdKU8Jbd1KiZdtOm2MuPo0LNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bwr6mC5Ub6GLPzIg2jKWf0fuaep2MDuNclKZ5g3I68bcivzFfrMP4aJh7fVRyQYo5/1jDjEDj4YGrNJ2JsjxjEq6LGBUOgj84n+QFOLWWpimht1haHzPSZr+Vl/6UAeGB/hBqaCh/EDz2hsIDCT34EDJEmddpSX+EPM82v6gcx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IfRcDyDp; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcc96bb64eso1011966b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755152364; x=1755757164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PBeh64fGT0K40IrMXOx8O5VgtlJAYtto+iRRsdnhZT4=;
        b=IfRcDyDpHqnbVkWWA25FLNEi8gHcdAaun1KKkm3Ovgz9yLdJcogQJkUpmaYafonYan
         qlOGTtg0cJG1+zstRs7h4UWTifTPG1PTimb+FoWtpvwd4XOPh+R7XO+x0ZSLNM/R5ZIN
         aC+vLoHj7oXR2tvfzXvTtEYnSPfBXsoidxv5Zjyz25uCIClM8hgxbAGotm43Wk1kRoLs
         RmgHSjOwmboewNMdEnD5ChenfkLCgviUuzMp1b/BccXjpxQRoFVcMjGt+Jwrdy1yPWsy
         DBiw0afTI4ouFDueT3PmLT/fZclCP5v4qBBhofS+nqcl+rCIs8uaJfvbnrSzm1z1IcY4
         gRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755152364; x=1755757164;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBeh64fGT0K40IrMXOx8O5VgtlJAYtto+iRRsdnhZT4=;
        b=uBl/yAUO2mwajCz8covSHFnRiIEEovNFKNN2WKC5Z2AdgGsV5lW8vvMiQ8nzxVf/1t
         jWQT91ZXiOo5VAoLQoAESABSYrebDFfiKz7oPCRF4L1ZW+AG3l9JIib8ZqXhihX7CZwA
         n/tfByzR4GG08lH9minpVfhKjkjZd1h4qztWCGpebgyTInWpzZv+DIz0Xb/PRF5cANPD
         ue5JtRGoxdmzL+R+CMVggco2hnbDgd8OlvMx2MCHXPJt2RavtQ0yKF14J4RwM/CE3x6X
         68nnj2aMOHU9Z5FSpEbQeRwKHVB/2R/kPq8NpKCYLvtCDmfsCszJ/YPmt8VKjgBz+RgA
         27+A==
X-Gm-Message-State: AOJu0Yz2zUwx/RAowK7Ee2iBAo5HPgeJgVv/7+YeReuVmvT6vkiguGA4
	Zfz01dqdcRwhE5njIcj2zXtGsfhfuIfSxhOubFcY2PNI/dzPQLtSEVpn498pFraRn20=
X-Gm-Gg: ASbGncsaP6r7KmB/UuyWF3jj+HobBnvUIJh18Fnta40sdQHHfuCAkDsGtYQhhfdjipS
	5lCZX7LSim9fwXpmlxsiAHjeoRTeI93vdkQszg9a7bWF8kchgrcpZvMzCev1pl4bYdqtA2/VXQV
	hFt6I0NsgXwHDiCipozuhnRCIMa/kABjA9r7d3Z2d+ne5OeQK7YlLXiQkYXbGM+zYqpryFWBIDN
	daLq8YI/JVy1zcuy1F49yurzg39YtRmOuOXtVxHGQ6Er99K+RapAxZwexFV1znjA8BZ3XOmehOp
	M3R7DMzFtJunISm8ThqMHclM5Ccl6q4IfYH1OoIg/qQxotP/uOuvMgSHUDBugw5VJI5Y215WNuO
	rZ2FWddMmqklIw+9pEi/RVxNzh9H7PWbdOg9+MZd3BGc=
X-Google-Smtp-Source: AGHT+IHqyISADpB+ZBFeV6Ttv9MHTIWhGYnM2O52gM5Q7CkzyX2BWFzwNeNqTCDyKnq46pWItX1wNw==
X-Received: by 2002:a17:907:7ba8:b0:ae0:da2d:44bb with SMTP id a640c23a62f3a-afcb981f3b2mr68260066b.1.1755152364268;
        Wed, 13 Aug 2025 23:19:24 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a243619sm2533437566b.129.2025.08.13.23.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 23:19:23 -0700 (PDT)
Message-ID: <695a4459-c9fd-4073-bdf2-1339bc65b3c5@linaro.org>
Date: Thu, 14 Aug 2025 08:19:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] soc: qcom: icc-bwmon: Add bandwidth monitoring
 driver
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
References: <aJTNEQsRFjrFknG9@stanley.mountain>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aJTNEQsRFjrFknG9@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2025 17:58, Dan Carpenter wrote:
> Hello Krzysztof Kozlowski,
> 
> Commit b9c2ae6cac40 ("soc: qcom: icc-bwmon: Add bandwidth monitoring
> driver") from Jul 4, 2022 (linux-next), leads to the following Smatch
> static checker warning:
> 
> 	drivers/soc/qcom/icc-bwmon.c:693 bwmon_intr_thread()
> 	error: 'target_opp' dereferencing possible ERR_PTR()
> 
> drivers/soc/qcom/icc-bwmon.c
>     645 static irqreturn_t bwmon_intr_thread(int irq, void *dev_id)
>     646 {
>     647         struct icc_bwmon *bwmon = dev_id;
>     648         unsigned int irq_enable = 0;
>     649         struct dev_pm_opp *opp, *target_opp;
>     650         unsigned int bw_kbps, up_kbps, down_kbps, meas_kbps;
>     651 
>     652         bw_kbps = bwmon->target_kbps;
>     653         meas_kbps = bwmon->target_kbps;
>     654 
>     655         target_opp = dev_pm_opp_find_bw_ceil(bwmon->dev, &bw_kbps, 0);
>     656         if (IS_ERR(target_opp) && PTR_ERR(target_opp) == -ERANGE)
>     657                 target_opp = dev_pm_opp_find_bw_floor(bwmon->dev, &bw_kbps, 0);
> 
> Smatch thinks both dev_pm_opp_find_bw_ceil() and dev_pm_opp_find_bw_floor()
> can return error pointers.
Indeed, thanks. I'll fix it.

Best regards,
Krzysztof

