Return-Path: <linux-arm-msm+bounces-52918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCACA773FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 07:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 060F07A3BC9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 05:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4631DB55C;
	Tue,  1 Apr 2025 05:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eSSDghq6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092901553AB
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 05:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743485916; cv=none; b=tF/grj8HuCmZ9ywZEhqlAbDhHxEo10LDtL0gRsq0pgJajI1PjHo4F6dj7A8kproZQTAbLzgyQdk+gZWp12lGC1mK5oh2sNeTa8T/7T1qh92kdkOenzy7NrwVoX1k6R2VKnd+MM8+Dcm2Tkgh5tLwytgZxFeKHx60pOA6g1ySKSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743485916; c=relaxed/simple;
	bh=CErkKDEjU9Ktzy6kTr9k/XT5kFEz9hg4L3vyVBes7gU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jd09cHAZFmbq/2KEzMhs0fedZte3mpSPARfhToMim9ZQMFomlGBG3sgnnINodKJoyQTe7wriz1jIcc7XZKkBTyht0cNd2y4+Wc5Uj/9pKfmRRRI7rmk4xzjA88TuzdyNbt5OTPtaxDFBKckkpsFIwdzRILGatA5f6AtiN9UzuXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eSSDghq6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso2745715e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 22:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743485913; x=1744090713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bOpoP6PSaztLl4THg2Btve5EdP4mRwwEJFJZnZpMdgM=;
        b=eSSDghq6WjlPvmAYJcJ96cByFZhgzFSngECRPwqrqRuoskN0tD0oGL/NuOZL/oG2rs
         moc20F2JfZ0B12TCx8RYvBDepAgAfiXYCw6uBkU/HInLrUNT7jIJmHNd9laTOThFpaie
         RmzKNesQxnLWIvogolRSS7N92xlnWq6bhbRTcqyfaU+XuGgHWZJX3QDML+v94D2F7+tz
         5jcGuve1+f4FEfpPQ+5HLvo90rv63xWycnMfnQMXz+rNt74MCBa+NUGaXDYy0cQoWPL5
         lTFH5nWsTfbHaVqo7tjtWLg8CP4aKzqztGBt6ykARXOTELHSmM26OW6UE893eTEW/wmA
         3glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743485913; x=1744090713;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bOpoP6PSaztLl4THg2Btve5EdP4mRwwEJFJZnZpMdgM=;
        b=jYZh3lPWHoJEKFYDt+FfM2Mxo8KZ7gRmMhdyjG1UOCCPXz5s5uI7ebHvm1BEzng+UO
         BB310R1r3Ufv/jkxnU3Ge2lcL6tGJkSWr7i7b9zhGGJjSO7xo6qPU55bRq2Yl51Fx9KJ
         FSA8MUZh+9P/oRF++nQS+fMU/YpCWi8QWdZxACZ9h3jg+gXdMCcLo1nlwhEWHnfiPQI+
         crwYeaIsl1v8WDUFIByCiUAhGXwAETunNXnOoVWIGzv6nC89Bar8LOdJMMJDh0QCN613
         SLIqxVvnMj1DzbdAVRQ9za0mACDqBOauvnwpIp4hZiBFce91Bo63+RIxsfcsbwwf/8/t
         7W9g==
X-Forwarded-Encrypted: i=1; AJvYcCWDolSMaewhSd15lj6tOSNTcEoHfYxkSSp3pqo+RcPEh6NYIg357me47l+w+sfDiX3qAmgOtuW5Hx2LEi5K@vger.kernel.org
X-Gm-Message-State: AOJu0YxpCFawSFmPjANU74QV45/78FuJ+g4RjbIsR4VWz7Im9Ve+duqX
	tYbz+4Z37BlCUxIHh0Cbtg/Np9BrGBZUNvivyFXm9cAMZacUj5iWXAZZHpC3mvI=
X-Gm-Gg: ASbGncuHl6ttVgP4H8KYCly4ueAUWignIcNni7v5CbFynzZH0409XNM3hmSOwHh0hUz
	Vzaq59tbtf+85kpg63Hd2gX9YNBgod4p4iEMTqzXFR9GN5vl2b8poaTOFDP0n6vHHFn7cO8gWx/
	wANNIs79cUkcMzTazxqyETm/FzFnHhUP91upZKzMTwQfDwWGmXR9CDW7H5YdovCecM5WA2G28Et
	KhmjTk4janAD7HUbjF25H99iBncC1D0keozohXLLxo6yD3Tcx9lFTeKWq+g1pz9S1VQyN3sZtqU
	Goo6fJtLLRY1ix2ymr+AvDPkYo8OrxmynKLyc6FqiOSXlBQrctXi9KXjM5Mf+Ik=
X-Google-Smtp-Source: AGHT+IHolxMjUnLGFkfC2w74/f/AQfcpTxmuYQXIpvrtRTrSCdapL3ByrIc22eis1XEbS7cr+DyvLw==
X-Received: by 2002:a5d:47a8:0:b0:39c:1ef2:fe3e with SMTP id ffacd0b85a97d-39c24707735mr242318f8f.6.1743485913265;
        Mon, 31 Mar 2025 22:38:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b658838sm12938694f8f.5.2025.03.31.22.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 22:38:32 -0700 (PDT)
Message-ID: <fb1fc0aa-4921-4ee3-9b8a-6167ef6558eb@linaro.org>
Date: Tue, 1 Apr 2025 07:38:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] dt-bindings: arm: qcom: Add Asus Zenbook A14
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20250331215720.19692-1-alex.vinarskis@gmail.com>
 <20250331215720.19692-5-alex.vinarskis@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250331215720.19692-5-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2025 23:53, Aleksandrs Vinarskis wrote:
> Document the X1E-78-100 and X1P-42-100/X1-26-100 variants.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 08c329b1e919..1b7e2ed56baa 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1133,6 +1133,7 @@ properties:
>        - items:
>            - enum:
>                - asus,vivobook-s15
> +              - asus,x1e80100-zenbook-a14

asus,zenbook-a14-x1e80100

asus did not make a component of x1e80100 soc.

>                - dell,xps13-9345
>                - hp,omnibook-x14
>                - lenovo,yoga-slim7x
> @@ -1144,6 +1145,7 @@ properties:
>  
>        - items:
>            - enum:
> +              - asus,x1p42100-zenbook-a14

Same here.


Best regards,
Krzysztof

