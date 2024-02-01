Return-Path: <linux-arm-msm+bounces-9350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D123E845D12
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 17:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C77D284812
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 16:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0762515F310;
	Thu,  1 Feb 2024 16:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iq1SFFs8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B9C15DBDE
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Feb 2024 16:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706804235; cv=none; b=fNSYIffGe/43fjZejQy0sGEfVdkv6C7l+G/ZlOb6QhWQj40O9aQmutqlIpGNm3kESqzp7lHNHuJnIBkidpt5guWwozsJcKzTUjIr04BC0SKHbnoqiBpRuSHfzjjcU4A8bh9FbJqqlNkLzLvHZNHuAMgezQmheOeu29or8r7DXVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706804235; c=relaxed/simple;
	bh=TXpsGendg5lITFMjDZgS854BmYCcF2Vv43coE+JTz0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PROZiN1wGf7Ui9AANMkQgxKapUf7BsXpe2uVEKiqMsa4Dvx85R9T5dBxg16/tk5MLbTkF3qyxulRR2dPp+29HYIp0L+ZdFd6WU5LN0/LXsthHphrrFUOIOdEmQM+1HtCY0WBoNYXGgW+O5uD+uIyYKbdd8fjNQz8oOOJT9KjKuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iq1SFFs8; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a293f2280c7so148330066b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Feb 2024 08:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706804232; x=1707409032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nm/v8NNO4oQjE1vzCoMJHqqQ0GQHVfZsu5DfvjFP2EI=;
        b=Iq1SFFs86Xrl0M33JyniXQ2ensfwdT7ehFV9QAptdP9VEqqrAJmIggfoOSyi3BwbXm
         vJBbmLLwCDBoz84bbil971gUehirwdC4Fv8nCiCU4gndMfEwhpOtcgLAE+ziFhqjj13s
         wWDw248WrL84CvauOh7n3jbYpKLort1qPiGJ/l38by9HV66MFdC6nNATcX42bx4UnAbU
         hbNhizoVk2PFNpKUZJSsyJro2JEjL7N47H4TKxef4m69fpIPSIuk8DCCXZPa44aiP29E
         2KCbmuxZ+MiNyVyqvr/lFMn/7cIP/BPdKKwWTbzxj6Rj1I4ObTjkSe8Pbv9m6KW9K1PT
         eqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706804232; x=1707409032;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nm/v8NNO4oQjE1vzCoMJHqqQ0GQHVfZsu5DfvjFP2EI=;
        b=VFiGO1mVF5ZB3C0O2XektQz9C4xbz8ecq/XIoEk4lU7KSzBHXK6nrlhGjYxcrvIRVy
         +YWhqoiNrCwKuiubc2TrDLhwVPxYvBGNX5YBmH3J6vY+/ZS/tmeLXaQsx0K2qUQTCVF9
         Af0/g7FjGYzFhqbKu2L08h4OUTdliSHFAvlZoUgYfSKnj+MMIdINSe+tGktHHt7vTU05
         y7nzhxq2vgztkFDmhpTA1GnCCzZCpHQri7p9hxn3o2OnquGuAgTqeSDrQod002JtuYZb
         SCzzFNp6KMCEnbBT2TLnRVJVgcArzUYqUDM4Y1wXJ4jc/HOO6bUYQoEwp5n+t37Z2uz/
         L9uA==
X-Gm-Message-State: AOJu0YyYyLXJkKuzET0n2KsemOr9Lin7aGBi8w6mz+VW26HCajZWhjng
	tfIv3SIvg2+zgSfxd18YGnMccg4qpkkgagnuDYebC0LvwcAo1XsPIRtt5/NqG80=
X-Google-Smtp-Source: AGHT+IFU0tdQUHdfdDt2a/RGVlO6UDygSKGQintz4L6JBoQtvTJdg26kw2ZIonQCvchvBpXHAHxosA==
X-Received: by 2002:a17:907:1041:b0:a35:47fe:ed67 with SMTP id oy1-20020a170907104100b00a3547feed67mr204131ejb.77.1706804232620;
        Thu, 01 Feb 2024 08:17:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU3kSJ7yERcmTe9DyUBtML5fFZMBz90Vh11LI9OzGFWeFptpkOTI+/3TEqIJuRaZalsJKds3yKY/jb/kvTEMQwFgslEiYFs+GlbzHgrgRWnaZ/p7M296nRuJFf5hwehRMlJoDUU7E288kvui4n2nZiUBqffR0QTjIrH2O/ykwAk5f+9wea9hgfydIGP7UDzJyDodssGP4y7FcxNVQNK+dmd6HfFhXgZ4DrD5WCJABZ8CSTjvU9S/JJS9gQXMidHtuIvwheCbokOQpQ/4VtrNM7aaTqhmM7YdCIA8dsWO2Q1ppXHvBYlUcfiC0LXDM2vGX+yNWnozgIWWjYSSBmu1t0j3WqPSTyjF1TxCKSTxMz3DDxTnMSxnIGTKwvnhhgJ5iUEHSuMNN7P1e4khoegCWItzh4b72i1TUj5HFCQ/PfX6/Q=
Received: from [192.168.159.104] (178235179129.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.129])
        by smtp.gmail.com with ESMTPSA id e12-20020a170906044c00b00a35aaa70875sm4788419eja.42.2024.02.01.08.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 08:17:11 -0800 (PST)
Message-ID: <5c9bbdc6-1309-460e-9a39-62ab9fad42ae@linaro.org>
Date: Thu, 1 Feb 2024 17:17:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm4125: define USB-C related blocks
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org>
 <20240130-pm4125-typec-v1-3-e8d0097e2991@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240130-pm4125-typec-v1-3-e8d0097e2991@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 20:42, Dmitry Baryshkov wrote:
> Define VBUS regulator and the Type-C handling block as present on the
> Quacomm PM4125 PMIC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

