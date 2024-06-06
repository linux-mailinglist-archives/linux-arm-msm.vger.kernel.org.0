Return-Path: <linux-arm-msm+bounces-21876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE178FE41C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 12:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FC811F271F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 10:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB1A194C70;
	Thu,  6 Jun 2024 10:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QOpY2U9o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44403194AE3
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717669136; cv=none; b=BiVKOdYzRj2AHptEJ8Qw/aMd6EFjAcYl18c2h7QpRBeI5JNvLGgSOxbFZYEvEuR2FWNGb/MWqLi0O+WhndA4QfRNHHHUJnbXGtMiA1Umx8EJgqsUdB+jYD5LVw+vNLuSoW4K5IbOaLJFnvs6KOgtnli0aAJ5mPeuTIWh6PLk9Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717669136; c=relaxed/simple;
	bh=s9U2yn7tGTs41JRHl8E3IDPxF/wbqH/25Wi0iemeLQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lhb0tVR6iyrZPOCiY96r9g5G6hywBiZYzxMS82AfwEG7eC6ho94RaKAcGxsuuzyUt0SAWApUCvGFKrUwevepkyvZEhhnPElItIC8xn6vWJtqCTO9l4Ri3QIGfDP3EFaKf4EdyvAiCWKk/hD6aPvtIjrJXeUMex+0XovcY/uR7Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QOpY2U9o; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57a50ac2ca1so931073a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 03:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717669132; x=1718273932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UXddTHSlpNjJNv0PuvtfILGwEDtWQQdWR/jxfT4xiWI=;
        b=QOpY2U9oD92yYkNhzbpjDT3iO/+wWTsBSZFxS1nRUcQxzytVrqLP7Np1NNzzp1wY01
         BYCSJeCCwtK8b6i62jjOCpbJaFBgDaurr+miHL64q2bKSqeciiUXQtFHGgV9MNFS7RQv
         xbhUgghC2ekqXMQfJNa1yJbdG6kh/bwdi5UhBZkMCixba6RGkATok7n/k39/ujYeQhvF
         LphSIIR5Uo3ez2KfnQ9tVGXXWcjAsrVfw2nwYXaeexdx078CRiO55CbZPjOCHaqpVBEZ
         h9IAy1thxlveTDyIerM1xxYzKXdDG0Pxajzwje7pjNi4LbD82tUVIQpslx1CqpFBrIiE
         fZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717669132; x=1718273932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXddTHSlpNjJNv0PuvtfILGwEDtWQQdWR/jxfT4xiWI=;
        b=md5DSpVSbsleVKRzEOsiVPZOpuLMU3kTuJyDbZMrIsDPPNX+Vzei9lAnuaQ3SAQ93y
         QPs9QnW+L5/Lk8q8RTYtKkyErny3d9ZuufICCPf02BHSIGjNzrBKdtEc8wL0TN9Y1clp
         NDwFvG2ajE//uGiI16gk1DSs2OhSVsNf9w0l/eIYIc66JUWHwdKoaZGHJc7Y8idgCTb7
         IFKb6Pf5S94/MqEgcJniToJWJp5tJlOFkg5mGyz8LKGo1Upb+Blnh1SUYgqpoQ5HM0Yf
         ni+6xgAo4RmHPfe+OVi88flKn9k9YcD+b6fbnrihaSH6MXUbCZqa+X6ddtFIPcz8+//l
         b0bw==
X-Forwarded-Encrypted: i=1; AJvYcCVGS1ziLXwuerqqM16rBu/vCSkUKv3qtE2yHa6iSrpWaw4dnkvdM2rHB5ea0zOyZIaaD1zpDUHUDW0VudrtBFwC7sTL7bRLkDS1cn+90A==
X-Gm-Message-State: AOJu0Yx0YlnpZPfn40ZyuPsb3LVM1aldGNdHMlENkPYx2fMVVKIyK3mD
	5uQM7CSfYIu5cbatqEhinUaZEQTe70myaK8JMTzBIfBLB723r/LMC2Vcd3pgSFfkz0JemKtRKfc
	LfMs=
X-Google-Smtp-Source: AGHT+IGM+MVq7sUz+w0xUQkwCBsMXwpqZobC5T/bPLIyh/0HVF8QptBkN97q7n6xwTNQ/0q9f8xGIw==
X-Received: by 2002:a17:906:7051:b0:a62:b97b:b3bb with SMTP id a640c23a62f3a-a69a0268920mr340841066b.74.1717669131643;
        Thu, 06 Jun 2024 03:18:51 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c80728893sm75448766b.191.2024.06.06.03.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 03:18:51 -0700 (PDT)
Message-ID: <d794537c-a626-43c9-ac5b-2ab4edb1b100@linaro.org>
Date: Thu, 6 Jun 2024 12:18:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/4] arm64: dts: qcom: sm6375-pdx225: correct
 touchscreen interrupt flags
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240605160032.150587-1-krzysztof.kozlowski@linaro.org>
 <20240605160032.150587-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240605160032.150587-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5.06.2024 6:00 PM, Krzysztof Kozlowski wrote:
> Interrupt flags 0x2008 looks like some downstream copy-paste, because
> generic GPIOLIB code, used by Qualcomm pin controller drivers, ignores
> flags outside of IRQ_TYPE_SENSE_MASK.  Probably the intention was to
> pass just 0x8, so IRQ_TYPE_LEVEL_LOW.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

