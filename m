Return-Path: <linux-arm-msm+bounces-35731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDFF9AEF2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 20:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68C5D1C223A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 18:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF3A2003BC;
	Thu, 24 Oct 2024 18:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5og7cI2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9593E1FF05E;
	Thu, 24 Oct 2024 18:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729793187; cv=none; b=bizJ/p/gR75mDprGjVqhGDbNdHQ2n8mBBJLMwiiQCk8ivPI67YwX631UQp7cE5S5VVN6ugbdN+h+rdCfoQD3ZatNSCJEIs+MRee9pzekM3k5CN90VpZhDScipWhF+vkJh6SPOmRD36QcyiGTjcly6aEoI7wlc5XRTIdn+OEQGns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729793187; c=relaxed/simple;
	bh=vOtfYpYAZcfPD3kzNtXenwXoxBDyVzXhYwbQuTZbIVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iv2QAoWLdfIfJQrhd6GQuoPOn8cj18AExPOrXUXA0SxDRgCZxDvf6P/oa8aLHNBTOHfUuVDsNCj4n7fvoofBlSoBAtpYwvzjuV1loFbgXeDJ3TgzfqhhI30XVkZZ2eCCFT20nDpEuqh8ZMY2F4Eo4BFXbPH/0PeXz1TTAlI2/JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5og7cI2; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3e5fcf464ecso862799b6e.0;
        Thu, 24 Oct 2024 11:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729793184; x=1730397984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9UaViCTVHeE4554625O7z0qmjZeB3yLuwP4tPJC9Occ=;
        b=R5og7cI26bYgfLuadV0w8l8jC7IFnNnBKGGhaR+WClt7Izm/VSv7Kv9apjwPJYxmFH
         bPrLJJa8TJC1/hFitV3ILfzvLGxH70Q/G0OxDzT3ia/QBwt0tRQdlT2XXtp1EpHaxyIr
         T9saigkZKekDoXAch9kzVjNduDP+57PrritC8BNo5oc8pgPZoOqvo9ySTIlAT7gTVcjf
         H46vTtfsdbGPNqW2F+WdnN/SZLP/KooCPLIoQslAmbBRY7DSg6dZSUjOYyBWJhFdWoOj
         aBmFlAXV6ncfhcdPCyorkU47yB6GH+3VaPKWNs9r8I8GM8pzGFmfgC9ERScQ5oBPBPUV
         5efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729793184; x=1730397984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9UaViCTVHeE4554625O7z0qmjZeB3yLuwP4tPJC9Occ=;
        b=gBWX+gkEE1SmdFUOXfTbHzQnD9EdkwRHMp92UYEt7Ee/NkJUQz1IaH5LMFYECpOdCc
         4cghK/axlH+A94ZkbpFJqkc/70+guyuNtNmdTOA4/LtH7Y2wkQQw+E2O0U8o5XIkVXQX
         tQ0n03Yd67knVxomMO67ryDdQKiDaKoAuiFyDLRppqdVp2Sq9xswuYSL5EHXmKSNwME6
         FHzCt7AQBz1ItuMmWAkEzRBK1AsAfmtpas2A5RvuHuVEHwVwEPdPPwFDe0nadWWfvh5D
         R+/cbDLtprxDcWEaVtyd/iLHWqZI4mAp66rh9ESR1p9ij3DbjLmtkFfkUYXd0lEzT3ym
         NH9g==
X-Forwarded-Encrypted: i=1; AJvYcCVfaurzhHAWjlyQ96EX/pspJLfYP45DcAkosGuPQqpN8mNFEIlS2oHi4T3ok9qghEOKReFTl/DA@vger.kernel.org, AJvYcCWLT7pKkQRYm9GyFvOhCmWIPUHeFA/g6sNsbHUtmkCslD6dUPYP9RL1Jj7hbGU6miH0LgYQjz5LIFVm91tI@vger.kernel.org, AJvYcCXkDrz1/nzp5HOAT+zBRuCMOu9NInMbK/C54J4kCtZhm7t/H9Ie0FVKNOgGrWiOG/4C4UxK2TpTvyvrXI2J@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1z/H/lkjpilBFDTewSPyN8C5ndl95xZg2ymJKeIS92cSI+xl8
	uMArussDy7NFvpMvc4RlnrACnRhnb8NCA784bgbx0FGOkJkg9lLs
X-Google-Smtp-Source: AGHT+IGRgDjaOVRo4RzC8Gl7ibseB03w21ZI0dmvnwrOI7OKAXZTah2SVc2E7tRapN9D+omZhczv6A==
X-Received: by 2002:a05:6808:1309:b0:3e6:1dcc:e1fa with SMTP id 5614622812f47-3e62cbfd427mr2713134b6e.47.1729793184598;
        Thu, 24 Oct 2024 11:06:24 -0700 (PDT)
Received: from [192.168.1.22] (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-3e61035f185sm2319032b6e.48.2024.10.24.11.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 11:06:24 -0700 (PDT)
Message-ID: <e178ef4d-3234-4c11-84f5-0a454d198f15@gmail.com>
Date: Thu, 24 Oct 2024 13:06:22 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 10/10] net: qrtr: mhi: Report endpoint id in sysfs
To: Chris Lew <quic_clew@quicinc.com>, netdev@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>, Andy Gross <agross@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241018181842.1368394-1-denkenz@gmail.com>
 <20241018181842.1368394-11-denkenz@gmail.com>
 <479ef16f-1711-4b16-8cad-c06fc5b42da0@quicinc.com>
Content-Language: en-US
From: Denis Kenzior <denkenz@gmail.com>
In-Reply-To: <479ef16f-1711-4b16-8cad-c06fc5b42da0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chris,

>> @@ -72,6 +72,16 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, 
>> struct sk_buff *skb)
>>       return rc;
>>   }
>> +static ssize_t endpoint_show(struct device *dev,
>> +                 struct device_attribute *attr, char *buf)
>> +{
>> +    struct qrtr_mhi_dev *qdev = dev_get_drvdata(dev);
>> +
>> +    return sprintf(buf, "%d\n", qdev->ep.id);
> 
> %u might be more appropriate because the endpoint id is stored as a u32

Nice catch.  I'll fix it for the next version.

Regards,
-Denis

