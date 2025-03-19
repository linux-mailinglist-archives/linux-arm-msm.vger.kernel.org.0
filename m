Return-Path: <linux-arm-msm+bounces-51948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD170A68BF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 12:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A16616F7CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 11:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F078725523A;
	Wed, 19 Mar 2025 11:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkm8xoUT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330B4253F21;
	Wed, 19 Mar 2025 11:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742384347; cv=none; b=OsTafWZoRnZjVDoI955dJQ5SH2Uvy8PXPgocK1Sn12JeGdQuaWNc52K6zagCas6tKBCLQrPUOtXhGAKppmGzJGDYWqArBE8HsiiLv3Jtl3+loOEE9m09hB8fpaPfwKw+csbCnYm7ysAwhbA8X4lFa5YH9EIgURkH4wF/SzavNTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742384347; c=relaxed/simple;
	bh=YgB8hf2iolWIUfIlPZLhZxKEx2ip6jdR/HD25QOJOYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1if+N5452vIC1l4xzFKzQJtuxigi+9RIDXtEFoh6qygSqq2/kaelHAhhBGKlv6YbLAn+aU1L679+uPqc87caNfpi5UfaZ6b7FnPQQUqu+Nh/gIr+qW4rlgxV2+JL03md7AIJs5omAgCVDPqwawD4JO5V5pYd4/NHdrAoh+V4SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkm8xoUT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso45738045e9.3;
        Wed, 19 Mar 2025 04:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742384343; x=1742989143; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=23Zzwx8dQ7ApD2OL+JFkf/rOuLI+b6JbK1FtVimJKeY=;
        b=lkm8xoUTCbcBk9YdbWCMNsRFqAsfAisBUhAjleFTET+HsXkqPopCDUzeQYi7Jfnosp
         VcxoWLGW5rljsYceH7DNaWpfh/QVl8MIEAy+08B1RIIUBGHe5gQmXbp8s6itW29cTyjA
         fa9b5B219HWvdH1chNkDlCpw41pySYOMpnJlY/ypcrcDyD7Wvw3zeEe/+1JtdVUW6kV3
         N7W1z0loHvlIT/irC3wmHVsHvmBZhVKAcOQgoZFNpbyfBMbNMf1zHl0VY8uUscDgoA9N
         te+0ZOdbgceI7X0kXig6yEf53Oa4dBVlWL7dsGXmifkb6bjU+U6cqIbPj5CIQdnefZh6
         e8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742384343; x=1742989143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=23Zzwx8dQ7ApD2OL+JFkf/rOuLI+b6JbK1FtVimJKeY=;
        b=kC/cCrgNycHKLby4Mh0poorVTLPVeD74lKy8ULvIn84vTEgzY7QV1xIXIf/fhlthLI
         GzG6kB4fLKnEzyvg7cTIDZ1TshMVUhB72T5ik2f/Nf+WEdKw8VpPIjDuqjK4mPULqdLY
         n2K5/gAwAWr8ZoYOBv2D42HejKyQhhbZlSMUUuuLL+79iCIavauszFSfIafEbu8H28eZ
         zBEtWv8xR201RKO1YipLR1hOF2pqW+5tyx11CeqlmOXO4Vu1wkT7Y+Jr1GXH/hWwWsVw
         rMu+UPWaXuPYACIubZBA6SaNLgYMrPfk+qEH+lr5QYbTU+f7i7aMoujVc5Zn90sTffRI
         kZrg==
X-Forwarded-Encrypted: i=1; AJvYcCUlf7Nn5wSQD7H4FbT4rpy0V0mQt+AInSn3Qh+9D/sCJHgbjXxh9D4flSSkRas1wNx9POyx50hESECwFE7THw==@vger.kernel.org, AJvYcCUrLXleo00692tSmNfFL6w5TI2hA+9ptF2Z67O+gWPkFQGxcaSEYQe1YEbazIRBWi59UOR5wPc/OFccF524@vger.kernel.org, AJvYcCX5y/6BBaNuKg2+l+ywcHkQkYEU1J9DA/bppo/oxpkM0u03J9tL1RXSQeUquIdxJZ7U/s0LYjJfSoiE@vger.kernel.org, AJvYcCXUDCD0jqoEkyQxUJhOKMV/tZHS1WSOp7KqChoBRPviVP0fnxMi+GuzWHGitk4NrWK6/A7wB5TN/A4e4v27UuTxdQk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4LIEWH8OWLT2bkSnDWgZhYpWmmkjtdKZH5AYfqJLJMrCXlEZv
	cbIK5Jpt3OQEqfWc04xH56Zv/WVXXcXSzly1p14trwwUgIXj/vvy
X-Gm-Gg: ASbGncumDz8norpbGubEBBJa57/SpXRnGv8ELFoIWAjVm5IEb/eTZyc1tFwj0SmbAXy
	xiZtV7GHBz2G8/hqefy//AMKkQH1tQBKOour4I3a9dUu5T/mSaND+3BEf7+mNyNjwElbRtdpVFA
	/Cg+WcrfRpj9PjCfob8OYA7vymd6Stcu6dOJlko/AIGRO4b+ePM5MyAQxiWtmAv6Q9kZLXiWB3o
	ggCDaZJ/eXwU3YpMEeaZ0TQXKAgUDOy6jWeJpMXRYmjCSfzGkuGQLjyewrdwYLa1MPuv7ZWubVZ
	FtYvNSQeOxreyRpaUFf8Q+rMzVHZPfG4CZBZUUcRgGQhzU4w4sQTPLnxHOj/S/5lVwt8XW/hBeL
	70Jr++qS2fQovCoexIsnLW/w=
X-Google-Smtp-Source: AGHT+IG/uReUa1PFDrYRs3h2HIwVSGTu7IcnjWIZm5iEXhoFmvhyCo2Cbk7y/wuCyXozf5+5PQwOzQ==
X-Received: by 2002:a05:600c:a4c:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-43d4378163cmr13761135e9.1.1742384343101;
        Wed, 19 Mar 2025 04:39:03 -0700 (PDT)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d3ae04a94sm23904475e9.0.2025.03.19.04.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 04:39:02 -0700 (PDT)
Message-ID: <8e8bbcde-8ed4-4239-ad96-6cffd8b9d65c@gmail.com>
Date: Wed, 19 Mar 2025 13:39:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] phy: phy-snps-eusb2: make repeater optional
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
 <sxrae5pmykx6ul2y7uc24fss2kdeezkkom7ev7mavt3fbc6ckv@tghyp3whuxnu>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <sxrae5pmykx6ul2y7uc24fss2kdeezkkom7ev7mavt3fbc6ckv@tghyp3whuxnu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/19/25 13:08, Dmitry Baryshkov wrote:
> On Sun, Feb 23, 2025 at 02:22:24PM +0200, Ivaylo Ivanov wrote:
>> Some platforms initialize their eUSB2 to USB repeater in the previous
>> stage bootloader and leave it in a working state for linux. Make the
>> repeater optional in order to allow for reusing that state until
>> proper repeater drivers are introduced.
> Generally "works as it is setup by the bootloader" is a very invalid
> justification. Please don't do that. We should not be depending on the
> way the bootlader sets up the devices, unless that _really_ makes sense.

It does, doesn't it? We still don't even have i2c up on Exynos2200, so bringing up
the repeater before this patchset gets merged is a no-go. Either way, we should
follow what bindings say. I will change the commit description a bit.

Best regards,
Ivaylo

>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  drivers/phy/phy-snps-eusb2.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
>> index 4e5914a76..dcc69c00a 100644
>> --- a/drivers/phy/phy-snps-eusb2.c
>> +++ b/drivers/phy/phy-snps-eusb2.c
>> @@ -461,7 +461,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>>  		return dev_err_probe(dev, ret,
>>  				     "failed to get regulator supplies\n");
>>  
>> -	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
>> +	phy->repeater = devm_of_phy_optional_get(dev, np, 0);
>>  	if (IS_ERR(phy->repeater))
>>  		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>>  				     "failed to get repeater\n");
>> -- 
>> 2.43.0
>>


