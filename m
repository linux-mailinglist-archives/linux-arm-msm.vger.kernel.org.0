Return-Path: <linux-arm-msm+bounces-35430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE019AB0BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 16:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFBEC283817
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 14:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE611A08B1;
	Tue, 22 Oct 2024 14:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmGD1Ybx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845C619DFB5;
	Tue, 22 Oct 2024 14:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729607019; cv=none; b=JMwQ9Hg4beu22jO0Fc+W21QdL8YCP4pn24dIONNz1BG5q5DaRSdLIAm432NjOwPGURt/v00MrDaEAB/lveAU7/njUQhA64us1WyzulOfwk3tygp8Aio4g37SiXGS4C9Yr8VwOERBW2XAh3/IX+cRERcjjcwlJmtxzxzJhDDY69M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729607019; c=relaxed/simple;
	bh=9izoLQvL9+XeDFGAZpzQi842u8VFnvbtKis5N4G1O44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YeRo6mmTYoR9Jk+Mp0qDRqASqWOz3WnuOxGw0TKkWxWcQfrTNqx27klzfkw1OafHXi7UjzViGYzxOCg6tk/RaUlC4yhFcaU9qcygGsRENomakVB+Ob9D6FcgSYc27urSEhg50zUToWFBH80qt/omDa0evnbSr5Yrvplv+8U3q+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmGD1Ybx; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-288d74b3a91so3176757fac.0;
        Tue, 22 Oct 2024 07:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729607017; x=1730211817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vB05a1h1HYduhrKYbkuyyOCoaOP+I+DevYClOEMl/5Q=;
        b=WmGD1Ybxg1/uWoA8Js0gyhwADknxAZnRyogC2edK6QdbYYR0w9m0x7peJZseDUjXJh
         B2615QIdUxfW6vlFYS9XxOR6q0jGxJDjOnmZ0Z6xM9PkH4fdK7E31VMbkgxSsWB1Fs4Y
         gywx7L9wPrWEUTOaRI08mqT8dYx5g0rFSfEJZeucoGYnc607/A2w19PhZfN0XLkOcegk
         QB7elTuYUOqCQVSd7kwyEF43u+DFp1njjpZJ0Qf6BRn8vu6ueRcrH/yZhZheheWMwbIh
         mhWm7svizeLsu4BYS3LQLvNIvq6BpDtFbx8s17A6Xtqss2vGMXFtiLeri+pykqXywqgT
         1UYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729607017; x=1730211817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vB05a1h1HYduhrKYbkuyyOCoaOP+I+DevYClOEMl/5Q=;
        b=t4SixBkr2D4GuqTvMoQgBJWCrwtfxV8m+LtXdCvCY2HDK6kI8uQF3Qf98ZjwU8KlbW
         NZmMlaiTP+m6rYbWbb6rwKCAPjNuXGMq3trDCOkT5hDtdU4rj2Lrd1rC2Ym12I8EzpmQ
         xbboUVCntNVA1E1yJGcZPHEPMOe2SfOyhpqQOdre4rohVvEHO5sVzXHCXXupF5U3ASHU
         sD3ur8LQGEFL8d+6GHRvzOK7kJaGgSNHytet7baZjqKjCMPhK4EUTGUreECIIAr7MIXx
         Bs+3088E3d2j4L0YNUpQ0/PZvw+4LPhB3WgCznutqs8KzMRWdNyZfe0MZj7okrrG9nXw
         QC9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsFtVYUKNiS0qmtNcBdRfLsGSEhcIApnxssP7AalObJLSMFmRbUf7UpZ5Hzy/128rbER/WvnFyhRMkWqX8@vger.kernel.org, AJvYcCWGC/ePUphcxypgg//T4GskTpnmQ/d6WB0wL7qRB2xixbT5ad28SAbUDD3DL1sWBQgrnHsUBXo9EvlXcjVm@vger.kernel.org, AJvYcCXAAGKGKDagnil8vCaUeLqXC7ovwxCcmJlD8S0/TPCzneTET5+FFNsSyoZd0Ny/vrLexcSCgmuO@vger.kernel.org
X-Gm-Message-State: AOJu0YzBFWDJq5sHun1l9DhGukKEdtcNIDf3Fp02bNqw6Eth8O9Y0bQd
	HvRoN7Y4c9fW6qY/fdKTaVVqhRbt+PKVoLiOl4jOo/Jy8kFQ0Eyh
X-Google-Smtp-Source: AGHT+IF4WhscBrGUKTc6WqwPclP/DimY/FTSznyFF8tD0zUVANTbzOwj3pZ3UuRn+IRVfyA1U/ZQvg==
X-Received: by 2002:a05:6870:9126:b0:268:9f88:18ef with SMTP id 586e51a60fabf-2892c2cb210mr12817941fac.13.1729607017583;
        Tue, 22 Oct 2024 07:23:37 -0700 (PDT)
Received: from [192.168.1.22] (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-28c79257f45sm1783857fac.20.2024.10.22.07.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 07:23:37 -0700 (PDT)
Message-ID: <85e7b4cb-58da-4277-b822-742179ee8cbd@gmail.com>
Date: Tue, 22 Oct 2024 09:23:35 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 01/10] net: qrtr: ns: validate msglen before
 ctrl_pkt use
To: Chris Lew <quic_clew@quicinc.com>, netdev@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>, Andy Gross <agross@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241018181842.1368394-1-denkenz@gmail.com>
 <20241018181842.1368394-2-denkenz@gmail.com>
 <82f296f8-9538-4c89-952f-ff8768c5a0b7@quicinc.com>
Content-Language: en-US
From: Denis Kenzior <denkenz@gmail.com>
In-Reply-To: <82f296f8-9538-4c89-952f-ff8768c5a0b7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chris,

>> +        if ((size_t)msglen < sizeof(pkt))
> 
> sizeof(*pkt)?
> 

Indeed.  Thank you for catching that, will fix in the next version.

Regards,
-Denis


