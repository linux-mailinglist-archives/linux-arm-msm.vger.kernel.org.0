Return-Path: <linux-arm-msm+bounces-23175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 268E090E32F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 08:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2B1B283AF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 06:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D5C33080;
	Wed, 19 Jun 2024 06:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oWsXm6zx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF6263D0
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 06:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718777790; cv=none; b=houT3kgpwwNFOM9OSgNAwGHsgxq/vFzvSoreaNdRZxDn8tSGY4zFkywLjFoEPTUXJPafTK8XnwhKDpdRHjw6SD9//WyL0c7KX0GdQmmRto/IwLpxZeGTgRI3XJpMXd3+OyYCUK6XciXFNXnaBiIpgsv3w3arYv179i0VNOai+Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718777790; c=relaxed/simple;
	bh=HmALoiOZXD8RmuBlLWFa9XW7kpD9+YUbF6c3+pBJ1NA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H4zUwhcV7AqTjFfzGBpDjoQIVUO3MqFiK9EdcDDYqa07WoPcMZD97lixg7x0qsuwa0FWAxqa+B2/pPbMbQvL0SPag8nkisNskI/FVishZBng8UStH5p10Ojx0/AFoGzKDMU8r58w+h815Okcv7bK8WQgwXbo3sTy6ZxAdLx0lPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oWsXm6zx; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52bc274f438so6648080e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 23:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718777787; x=1719382587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kw7mI8ZZ9ryljDx1iXt4/P0lnrwZ2kbFwklwwXXoBL0=;
        b=oWsXm6zxJu6RvbDXoxbz5sRa/Kz6YmKjItFFfgkqKstZ0KA/fog22dG9mIu9OlS6wG
         t2ZhbB75QnPBxxSL16gIhB77Jkckbgc6HAPexfDDGPSWgWiPIwd+l14kCW2LDl2WerNS
         Up5+CcDnyfUqbJsOk+yqmjfNerSAy021PUVj9gKeYVBu+Z4eCCXbJW4f1D0pTFSeBy10
         djyNma6Of2oUphOlEvsw+xf0zXbzUE9HhsxSIVlhQKHXok8oOpYk/NZ5/X+rgKcNp44H
         W/ke7TsgXZpsXXSzlJj63/9jt9tnaiVhSuSr5T9Y7mPApvz6mRQAZbaVy81CVCLe6Ek5
         pEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718777787; x=1719382587;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kw7mI8ZZ9ryljDx1iXt4/P0lnrwZ2kbFwklwwXXoBL0=;
        b=qSnwI7yuDiyabZ65ZIu9oCy3zB+ZReKhaXS1Uqx4QPU8qTX9WnnVgxlInWasY0nDn+
         5XCGSFf6qlVhgZPgPxdk176W3uHgtAoZBfXj9ztBAbnH/LUvBkEtcJl/kHzgx1TvJg0R
         1vN+cCduNAcuuGfut4R1AAVufiaYLL7wjOfDOTHcHY/Q6EHmONlv8H54MK6svBjT7gbg
         33/V3CrkPhrq0llAhrZqp6BeULi3IEpP5Z1FMCk/5WpmOlmO9bdKws72gu4RstWO9ZM1
         O8VWkOgat58wbFRqoHXeXCjvGwju5knOGHN/ZUuvgXUaU0wLeYEgUZ8GyJgrWlsawjEa
         pETg==
X-Forwarded-Encrypted: i=1; AJvYcCWe7KhWKzOdQMEI/lkpOkthQAX3IjWQG28RSfz1i9HYs+DbYSPVwPgCM9gPfB4fDeeC8KHmQ9nl8eeSYrhrTEXj0bpjmcvqQpzRaNqE0w==
X-Gm-Message-State: AOJu0Yzk5F2FOV3D6juMfiXkWMuv2UywRpsfU7TYYzPDfLfqd5EVSe30
	gvroy2LPFfmHdjLuGO8I2CcHo9XgKN6Ij+qBOl3VYBl0EfdjqC2C8FSUkmZYDgA=
X-Google-Smtp-Source: AGHT+IHGQclRSNRutPS/KbJ3xsp7bZH4jdxQ4yXIF4VyoP/1csyD85UXN5aradU513i57pv87BSV4g==
X-Received: by 2002:a05:6512:208c:b0:52c:af5d:75be with SMTP id 2adb3069b0e04-52ccaa627f5mr963042e87.30.1718777786395;
        Tue, 18 Jun 2024 23:16:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-423034f4129sm208470515e9.14.2024.06.18.23.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 23:16:25 -0700 (PDT)
Message-ID: <24276cd6-df21-4592-85df-2779c6c30d51@linaro.org>
Date: Wed, 19 Jun 2024 08:16:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/15] soc: qcom: ice: add hwkm support in ice
To: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "ebiggers@google.com" <ebiggers@google.com>,
 "srinivas.kandagatla" <srinivas.kandagatla@linaro.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 kernel <kernel@quicinc.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Om Prakash Singh (QUIC)" <quic_omprsing@quicinc.com>,
 "Bao D. Nguyen (QUIC)" <quic_nguyenb@quicinc.com>,
 "bartosz.golaszewski" <bartosz.golaszewski@linaro.org>,
 "konrad.dybcio@linaro.org" <konrad.dybcio@linaro.org>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "mani@kernel.org" <mani@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 Prasad Sodagudi <psodagud@quicinc.com>, Sonal Gupta <sonalg@quicinc.com>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-5-quic_gaurkash@quicinc.com>
 <ad7f22f5-21e4-4411-88f3-7daa448d2c83@linaro.org>
 <51a930fdf83146cb8a3e420a11f1252b@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <51a930fdf83146cb8a3e420a11f1252b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/06/2024 00:08, Gaurav Kashyap (QUIC) wrote:
>>
>> You may perhaps only call qcom_scm_derive_sw_secret_available() for
>> some ICE versions.
>>
>> Neil
> 
> The issue here is that for the same ICE version, based on the chipset,
> there might be different configurations.

That's not what your DTS said. To remind: your DTS said that all SM8550
and all SM8650 have it. Choice is obvious then: it's deducible from
compatible.

I still do not understand why your call cannot return you correct
"configuration".

> 
> Is it acceptable to use the addressable size from DTSI instead?
> Meaning, if it 0x8000, it would take the legacy route, and only when it has been
> updated to 0x10000, we would use HWKM and wrapped keys.

No.

Best regards,
Krzysztof


