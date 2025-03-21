Return-Path: <linux-arm-msm+bounces-52204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF08A6BCCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC6203ACC24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B552B1C3BEE;
	Fri, 21 Mar 2025 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IspHMRXE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ACC78F30;
	Fri, 21 Mar 2025 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742566651; cv=none; b=C/vvJQQpZ0X5qi09CLigDo6a7r46yKMldHU6q0veKzM1QREMPCQBnVhlfrSXuomIaImI9zWlDoLKQ1OvptJGut/JtXCsvcVquj3GCYszzlo4+117iyUXvRHwn1EzdamPrT/YBhTeRyvao7fswEbJtJpRrBtsxkfZ7Gxs6ZG6x9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742566651; c=relaxed/simple;
	bh=tHBXqjx0OUDIfknmMckM4pVAixWNPpvKKHM4XB+vUM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AqlhEQ5kLS5XiLmkKQTdug40+/c1PtgOT3YETYFgntA//4XS9i/yiwyFf0LGmStFHrH70gz/0uXyjwBFk+fPKwde+zjKxzuJk4MP+r8OnchJ5ziQCmfzPabESpMDbTOsYgYWo/uAY+CYHbE6fUtGeGy7XeQ+Mvk2G/wjwwPeaQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IspHMRXE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso15143635e9.3;
        Fri, 21 Mar 2025 07:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742566648; x=1743171448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ytG4OhmvAoifvIavHR89GwgHjeqU42K8UC/AJE3bg8s=;
        b=IspHMRXEiI3fJS7Pr0CSihX+7bLPpF/ulcZoXwGgbPf9bUyvDgxxOVIbryfTweN+nq
         FOnPaIGoKNqPG3a+HSLAKAmLXQFGvMY1U8aCYFv3hcMVpZSV6IAXQBtZp23EodT2mzsQ
         MMlUhmNK9RaC7wX24AjcoPqCps0GezPbKOh531RvN5iPBEfREfFg/rqWDRVxTAU2UHda
         vDl0f5YTbvjTtGGAHnWWk10pGmqO8juKrZHp+/eRWX8OTMIIk6dXLvpnjImhinuXap88
         qcUlbKFoKMcCtXlULKFiiI/q64zE2PV8vXj+D8KgmndnpblMP1YkOPSjLAu0EWLYVii+
         e5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742566648; x=1743171448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytG4OhmvAoifvIavHR89GwgHjeqU42K8UC/AJE3bg8s=;
        b=rgAdSlR4wQKjuhjxJB5BNYX1OEQwIhcGaqvCAwQiooLZOwkKVJyCuuUViokWGwUWLG
         1lDKcRQTd1wmSLsVwnFt4XMjiuYMSB7y211JAZ784l0HBTGzfPhkleDD2zl4Y7YPYZa+
         uArZQXLqmbl+S8FO9qrvt25F9Txkfukkblk753s1wUpbC0bL6oijR2CPM3/LK77Aw+W1
         H2U4Ht8zxTjPsnttgxkJEDnVMoZ0RW3amA7me5YNblm+yTwRCt/k8xIP5joOV9Ta3/rA
         AfDerL4aOyn0w/EfXl/dabE5J/1xXe86V46KMZsGm/qRN+x+xoZt63pkn79meWkp/dmi
         5HyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6e5XL5Drg2QdL4WLUv3kzpmAn8dm3DYenWkdV2gc2UYCwyUv3FeIUK6R0FePOam425lym6TM0LQROt2BE71et64E=@vger.kernel.org, AJvYcCULJKJSsZKDEQGWRztqo917y2om8bGW1Lx6Gi5cISrFZnapssYK16jyE75OvKdbtcXLVGgL2q1Ku/YcGe57@vger.kernel.org, AJvYcCV7Ojrul6KuPeR2bLlHT1S5uueY4u/8KqwWC3mi6fFLFdmoZQfoQGjGmGrBGqjekwmQcnE0XtFLURg821XBcQ==@vger.kernel.org, AJvYcCXT80RdO+xz3bWTka2sYjrwXXFe+xunkuLfy5TfqlAZvuEm3RSC2Fw0Z319Cw5L40HdiX0ScKeO6Pk/@vger.kernel.org
X-Gm-Message-State: AOJu0YyClndt9/1KmuVFeApWKgf4vam3N8bfWAuuZUcuIfz9odkXGtmZ
	IXpUlRziJXVyhqAg3nM3XBIS6nS7hnzFlZM/vEMrkVze+KvaiPM5
X-Gm-Gg: ASbGnctMgI8dSjzLDgxgVBiqOdXidlrIlEWHVnxqmLxn8hH+mvJ/oymltKvpuMBAoHj
	A/hV4UTZFSYA5tl+uo/Q7eZ3lzqEzKLa2mG7nhq3Chx9DJlThS/Y7n6ZtFV/MVVDMGBzvzAFzM7
	qUaNyWFR+q3uCFGEvPK3RQotGjPQfZCTPO2X511xbx6gIdYaBGDG9edntFP4uMPuO54c4XsJV34
	0k9pSla6vVEbSGUD9B7k/ihevkvppRL7mt3uDiij93nnmr4rCb0P2c+tyyUmDHVfz0/5fDSYmmS
	/3I+j3qUQJa0absVgBxd2NEiq4D8iUr8AxtVJbyXc4cI/jAVhsnd7cmoZAK/iAiKxbtZYyOWYJT
	rEnrGiAcYw4rdvGBPPc0dEF8=
X-Google-Smtp-Source: AGHT+IHhU4LPTyHnNGvQrOFARSFPEWbuV6vlNsGOFbI3T/MO3rQl7YpluNrCNXFAx8Jyi8/qc5iipw==
X-Received: by 2002:a05:600c:1d87:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-43d509e6544mr37272295e9.3.1742566647738;
        Fri, 21 Mar 2025 07:17:27 -0700 (PDT)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3428sm2517405f8f.26.2025.03.21.07.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 07:17:27 -0700 (PDT)
Message-ID: <782c2211-aa75-43b1-995a-2c93d75d75e7@gmail.com>
Date: Fri, 21 Mar 2025 16:17:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] phy: move phy-qcom-snps-eusb2 out of its vendor
 sub-directory
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Abel Vesa
 <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-4-ivo.ivanov.ivanov1@gmail.com>
 <vzlylhf5r5xy4ip4hkcolt3iye4stiabzxc4jwdzenbhll45ct@hx5gwpzrd33y>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <vzlylhf5r5xy4ip4hkcolt3iye4stiabzxc4jwdzenbhll45ct@hx5gwpzrd33y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/21/25 16:15, Dmitry Baryshkov wrote:
> On Fri, Mar 21, 2025 at 03:58:47PM +0200, Ivaylo Ivanov wrote:
>> As not only Qualcomm, but also Samsung is using the Synopsys eUSB2 IP
>> (albeit with a different register layout) in their newer SoCs, move the
>> driver out of its vendor sub-directory and rename it to phy-snps-eusb2.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Please fix the order of the tags. SoB should come after Suggested-by
> (and usually it is the last one).

Hm? I haven't had issues with SoB at the top in the past.

>
>> ---
>>  drivers/phy/Kconfig                                      | 8 ++++++++
>>  drivers/phy/Makefile                                     | 1 +
>>  .../{qualcomm/phy-qcom-snps-eusb2.c => phy-snps-eusb2.c} | 0
>>  drivers/phy/qualcomm/Kconfig                             | 9 ---------
>>  drivers/phy/qualcomm/Makefile                            | 1 -
>>  5 files changed, 9 insertions(+), 10 deletions(-)
>>  rename drivers/phy/{qualcomm/phy-qcom-snps-eusb2.c => phy-snps-eusb2.c} (100%)
> With that fixed:
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Thanks!

Best regards,
Ivaylo

>
>


