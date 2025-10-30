Return-Path: <linux-arm-msm+bounces-79570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3503C1E9C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 07:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCEEE3A6504
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 06:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249233161AA;
	Thu, 30 Oct 2025 06:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tabvp9PK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F302D6621
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 06:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761806538; cv=none; b=prujJKEPerhqasFzMba2uv9LDf3U4cyn/zYh/m/oMPdxSLM7hDUTrWdzWvFqiyBDYUKchWysN6ZveOYzaczUInb1jvyc4y9LhIsELSt2H+TlePa833tlO7K4xXPHdmEFr/IyBEf7pONGiwspj/UauV/qQ/FSzOoENDmIhFrF6+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761806538; c=relaxed/simple;
	bh=KFL6e2ujHzlwRceia8Vws/XVx5/XFIOpDBRlOGYMYe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NUzf1mc/NDDtuClmvK+asTYbSBrBcUMkllGYkwkZbYYpfNq8OzAR9DeJ9JovZxGIvBzJGtGULdKFCb1mAqxQke096DjBHL1oZSPi4mVgmCHcGIct8m9S/tECPD2LesXfbtdTFXm5iFwVkNm78JcG5tJmtfNdTYQNJK/XFlgLeoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tabvp9PK; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7a1603a098eso472011b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 23:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761806535; x=1762411335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XRjmjhwgFo6DAjuANvJLlsLw1oA4anFVQb7lf99MW8g=;
        b=Tabvp9PKtWQvryaOGEEYvBaI90/gC6E87uEb5y2HZWeqdnDrsFIgpTv5LoyB+i9/qb
         0JIJDtkO+VIP7pEnSA6jRdfrXkt5dHPZxXgDH1MVn6YivNdc/c2yK2kFmf3YmNANIW54
         0AI7N2JLBgOiqGDnY4JTdtzvoW25TG7nUAHSdRN2eb8HnQpxcBwddycMxcBYUeViy0rY
         Jknf6mlXgbkOlyMgOT/MuiG6oYvg/IxIk0nqeII3t40BRk5XC2HqqZHxrwZBbwJBysd9
         GUxmz5cPpLY8FHOhgy/z4mlhav0uolUW6N2CX+aeaTwatmSROCUqwmwgmthpxEJYhA+9
         wJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761806535; x=1762411335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XRjmjhwgFo6DAjuANvJLlsLw1oA4anFVQb7lf99MW8g=;
        b=WBZqZgFw7ryUJOTJWPZvwpBOl1rvyO0kxFpsnnJp/WI9aqMLHinYTwlmvaPAVU9i3Y
         RRZauv+4r9png1n2Xw9QQi6m8LbP4SgN1JPf0zT69j1YKyXmgpAtt3G9hb81kdsHRbtx
         c/E/HzIu1h5YKE/HwzsoycNnlTBA2D526JhQEgD5pUwsTTL8ygtOBXt/CitLUQQgbH9a
         fQJDuhu6w5OLcj2b9kLoQzgKElyao0wuNDCBbW9zyOayyPYJ87hu541SU7qnRwJ7yBnH
         uaWyaScsEse21MgeQ6A3CzNtaTOIu4Ne7XHlQ0IRCV0cuaNIiF+Q8lEcO+1f7OILp4NX
         CqpA==
X-Forwarded-Encrypted: i=1; AJvYcCVe12LxbALHV8GdtL0NS7OrKat+fkJCsf3lPHjJXYXWxj5wVa9fAtjgfVvpYz3jpzhhFShjzkYy4vO76WTi@vger.kernel.org
X-Gm-Message-State: AOJu0YxoTBCwWg5eZK6QXE6XPKd4q05nJpGqVvi5xSlg57llMVxIJITD
	C/u4m4hgFHSPdH2xedKBg1NOJkBiI24i1ef/IIAJZBsicUT93TOF8xmX
X-Gm-Gg: ASbGncttrcVnfflLZWrHvWhPg7Kph6iYALDPkOEyFrqsKE/xWKfLd98aBTjYjXBGb9z
	4pUBYVpsT21XE6QmoGhVgfs5A32CTdjyORMl0u48S5PhcwcKGS2WhHR021zc+eOWxi2YWiKAYrd
	FRs+UiLgBNGxwYUG4URT39sd3KVuvl04T31miXagc2h8EgJN8/eV1QE8+xedlQOxxEJbBAh4fBL
	5s6DvXLuMOeH4K1vLEJ1yp/OK735Qaq/uqaLIJHyXiRs7Y+8terih0VZtlz+RBxSEFI/IyP9kCz
	f2t/TSv3HjSQDWN0UnpwnfuHSo9FbqSE5MT6c0zF9rZlkm0sBGWzPmyVV5TZhgfTrN5Ugr+/ALD
	NXIKjTNDN3bYa5/6SUAVpVtyRUZlyZRw9n9enp9ZGXhuD9/U4XTUrUxnjqGbALUoVZAwD6CXbPp
	ALhOnknUr6TJIENtLCkDnvj6dPUQcxaBjB4o60NdeCiUBh7c872tHPmw==
X-Google-Smtp-Source: AGHT+IHhNxsrwPO8GFNjwbeDLO66xSVyMs6+J042HgogOYR3N9tX6avqO0/30+zi499pUFsIKhHa2g==
X-Received: by 2002:a05:6a21:3287:b0:334:9649:4754 with SMTP id adf61e73a8af0-3465293bf63mr7104225637.13.1761806534844;
        Wed, 29 Oct 2025 23:42:14 -0700 (PDT)
Received: from ?IPV6:2600:8802:702:7400:90ae:1623:a8e:9839? ([2600:8802:702:7400:90ae:1623:a8e:9839])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140168f7sm17329517b3a.11.2025.10.29.23.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 23:42:14 -0700 (PDT)
Message-ID: <89dbc85f-631e-4402-aca6-128e2cce399b@gmail.com>
Date: Wed, 29 Oct 2025 23:42:13 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
 <6eedef19-5473-4c09-bae5-04490f711d9e@linaro.org>
Content-Language: en-US
From: Jessica Zhang <jesszhan0024@gmail.com>
In-Reply-To: <6eedef19-5473-4c09-bae5-04490f711d9e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/15/2025 12:26 AM, Neil Armstrong wrote:
> Hi,
> 
> On 10/3/25 01:57, Jessica Zhang wrote:
>> My current email will stop working soon. Update my email address to
>> jesszhan0024@gmail.com
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   MAINTAINERS | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7e7515a412e9..7a712ded8f9f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7652,7 +7652,7 @@ DRM DRIVER for Qualcomm display hardware
>>   M:    Rob Clark <robin.clark@oss.qualcomm.com>
>>   M:    Dmitry Baryshkov <lumag@kernel.org>
>>   R:    Abhinav Kumar <abhinav.kumar@linux.dev>
>> -R:    Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> +R:    Jessica Zhang <jesszhan0024@gmail.com>
>>   R:    Sean Paul <sean@poorly.run>
>>   R:    Marijn Suijten <marijn.suijten@somainline.org>
>>   L:    linux-arm-msm@vger.kernel.org
>> @@ -8325,7 +8325,7 @@ F:    drivers/gpu/drm/clients/drm_log.c
>>   DRM PANEL DRIVERS
>>   M:    Neil Armstrong <neil.armstrong@linaro.org>
>> -R:    Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> +R:    Jessica Zhang <jesszhan0024@gmail.com>
>>   L:    dri-devel@lists.freedesktop.org
>>   S:    Maintained
>>   T:    git https://gitlab.freedesktop.org/drm/misc/kernel.git
> 
> Could you also update .mailmap in a follow-up patch ?

Hey Neil,

Sorry for missing this earlier -- I've posted the follow-up here [1].

Thanks,

Jessica Zhang

[1] 
https://lists.freedesktop.org/archives/freedreno/2025-October/041998.html

> 
> Thanks,
> Neil
> 
>>
>> ---
>> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
>> change-id: 20251002-quit-qcom-5125b64a86aa
>>
>> Best regards,
>> -- 
>> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>
> 


