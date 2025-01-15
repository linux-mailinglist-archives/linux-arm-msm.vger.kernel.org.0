Return-Path: <linux-arm-msm+bounces-45163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA367A12D16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 22:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34A9D1887E6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 21:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7F61D6DB9;
	Wed, 15 Jan 2025 21:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b8rogVbZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17091DAC9A
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 21:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736974869; cv=none; b=s8vbaZF7xJHdS4upBR+FKlw3dfJO+/WiIH8z9pYB6jhppkUJXiccY2+BiyMBQvIWvpJ/hzknrGpNt925yfVXJuby/vIMehqvCL00cVs3nsUaqEY914MzONjXHL6GTDVt6r96CRSnvWRTcKOaqBLQknGllPMeb1zC6AFvXVNSCe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736974869; c=relaxed/simple;
	bh=Yru/S4SXBY9NO29A74t0YcdN+foUcuveHw4jgqMb01M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZnU1SXYgZEPQucqs5NhTJO9lOy6lZQWPi+PxVoedpEFemIq+y5SRHjylxgK7SEVSi0/IQWfSvP9006d8tXbKapbPETP7deQAsbcTLZNjpltCmBDL3sJh6l4AUT5sCDZPRVHlULZUCnHp4Z1W7eEv5FYp8nZcoxZdoDUCIUFikbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b8rogVbZ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso131146f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 13:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736974865; x=1737579665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xzLGGAQlqPStmsjhVya2d8yxZkJH7fx5YrloQvwS7X4=;
        b=b8rogVbZujdxeDJjqYY2JrCwxgIHs63Lsj1U8AtO386vHUn+pbNsh8Yx+uChQySA1H
         A8vjmwf1uQqcNHYEjyTS7DKUK4VJFVQu62ESJV+JhXUqwiBlRLy3XcmV3uHWVPI5QeER
         MA/OstJWBT2Gx17UCX3xHjyMCvOjyEYT5Zcnev1KA0mHDpjgawCa+tpa/6EU1nA7MLAP
         7kRnPRl/TIx1CBnk6e/OScYZc2CTndaYQkCjP25QWnC7kDweCRbFUP1XnMiV5MnHxHGt
         qku1rH3q5YG1IrjATd530fFlnRcbOnyr30L9bOFH8pH0zrVgzk/mQmqqfCRBMaLGMWbg
         gZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736974865; x=1737579665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xzLGGAQlqPStmsjhVya2d8yxZkJH7fx5YrloQvwS7X4=;
        b=QWz1Dj+FqE7Zg55/mQ2sRwJ0BzaqemTGOvzIzqKnHaGzfBYsrHnk9AB5NLe6M2Io7N
         JKui9RZVeyMxw47jo9z/CCfIaufquWVQbkFGIthc8y8ZdG5IusUPMNJYfTZvneAhk3yC
         ocvPSz8YvPev7TXXjoAvdSwotodvFh8vUt4PLMJoTUl5WzMdzi906YNIgm9ZIlA2DIdC
         kpVbruUXbrJSXDz4meiYEEye1tdFHGNDr9tVCRXDTHM/VVB4RqY/m060sXHvDmJjksQH
         oS7rNaYEQDnMCmgpMg/qulmLHnBID4RPMgVKRVl1cHmQjt0oizPK1xjDC6AAldKfXDMx
         k1uw==
X-Forwarded-Encrypted: i=1; AJvYcCU75I7y36HUzWEZcFRbM+jvwKClIRVg39vvKWlQkw/TgUCJbl4YmwlF3/8Pz9sCPOg1u3cZaSSt57thIoDp@vger.kernel.org
X-Gm-Message-State: AOJu0YygwUq+Ox4E2MMINdiTiJBmUfSvrDK07n6kyMDL/yssyn/qzyf7
	dTD8SNy8tDO0A5FRCEWBOcn6ELW6sdxYNJEBA9bZgJLlFRW/m8L3OLHHLJdJD70=
X-Gm-Gg: ASbGncsrJUHmJo/1OcNaA8pukQpDEZ4fgSMXvNT3pRqHFOuTdD5jQzcPvis1uHkwUgd
	e210zHfpltyoZZa0T4192/jnCVl6rHmVkX+VQoS++xDdd9zr61ZG6grke2qngY01/ywI2ou8KoH
	DSIsHljmJVurQmuskVyl+9FqNr0myWeqaKTRr7RtGSA0JHR2mm2aBRX5tUCjLtBu+t0V6aZR0Bj
	BvWnCI8CLkoYcOw1Ku5uxASMiLOtrsmQEBwgyk2JTqLnATKmz+6yrjHrp0mTQQE5PXLXA==
X-Google-Smtp-Source: AGHT+IHTg22Q+fG9klizKomPZryDwOzxB/InrEh50EdlHpVQwJM10Smqg7fSX+Z4+PMIk0to3OjhDQ==
X-Received: by 2002:adf:c007:0:b0:385:eb8b:3ec6 with SMTP id ffacd0b85a97d-38a872e9356mr18598719f8f.29.1736974864869;
        Wed, 15 Jan 2025 13:01:04 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7528076sm36591545e9.25.2025.01.15.13.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 13:01:03 -0800 (PST)
Message-ID: <238411cd-1bcc-496a-9077-07bb6c4892ec@linaro.org>
Date: Wed, 15 Jan 2025 21:01:01 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/16] media: qcom: camss: csiphy-3ph: Move CSIPHY
 variables to data field inside csiphy struct
To: Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
 hverkuil@xs4all.nl
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250108143733.2761200-1-quic_depengs@quicinc.com>
 <20250108143733.2761200-6-quic_depengs@quicinc.com>
 <79b3e4d6-becf-4bcd-91fa-768b4098d01d@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <79b3e4d6-becf-4bcd-91fa-768b4098d01d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/01/2025 18:01, Laurentiu Tudor wrote:
>> Reviewed-by: default avatarVladimir Zapolskiy 
>> <vladimir.zapolskiy@linaro.org>
> 
> Nit: Something's not right with this tag.
> 
> ---
> Best Regards, Laurentiu

Doh.

@Hans could you possibly drop the "default avatar" when applying ?

---
bod

