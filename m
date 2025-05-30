Return-Path: <linux-arm-msm+bounces-59885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1FAAC8D31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 13:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 501B79E2A8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 11:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDA220B806;
	Fri, 30 May 2025 11:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kuJgAGYB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A39A22579B
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748606017; cv=none; b=HJU/aADMzcoxm4h0rU+YwUTpfy4WWFbZTFyKZvz5BBrF6NoMIW6pegwsebwu+NE34MfL4Gc6xGfANK2jhKl6lFu9xDkf9AtApFO+ojufwVi2s9d68vai+1lvWHNI7uJ1U9Ll1l66ekOutHZH8PJDgrSwMZpx9Vc8DJ1icWxRlxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748606017; c=relaxed/simple;
	bh=S3VeWtxKlJvzTgUsBlJdwT0AenvLuNtDX75s3YzO5DM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FUilAUy/F9EaBotHy1P+67KmoBUYLXNZeZcJUo0gAPU+5h8mL4dO2CqtkHDssaJ+10I4b7ZF7JbKxyzkK17p4T8M+DwNN7QQejJtliVoNxtreT5gukxW4qPGOZGYVPm7milobBOy7qrVesELUBjKmHSPKJFmARB/zif+1zENOMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kuJgAGYB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so14261665e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748606013; x=1749210813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4UPJVljTY3N7PN9rlPr1KNAMnaMWaV65uercPLaJI+o=;
        b=kuJgAGYBzJCf6Ip7t/utX+OMl1melh/8OtH6rBCZ8QfFzYHE5lbO+ozlZFdYfxqPON
         4VVf8TjtC90VND4TUeJORRMOWTRJf5bbtecJO7/ov+ahPz0RPwLRYPqBDmFHAd2f227k
         33J5AC2X6UdxnmHqyN7u/D+xvwgKIAd4ARHwjQu5pOMdPX3nGIIVA7f+IL2dyzcuSnWZ
         AjPHEn5RCVB3uAz1WUuRx7Jc1zO/ZAENf9PIi8jLL+KlyN28g6Rm1yznEC4DyrZpYaPV
         qKNrLaGMkDLhVFKe0w5xs2DGvxc/Ud3ez4L0yifW+29KEuWhk9UotL7u+UWBWohbg07I
         8hhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748606013; x=1749210813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4UPJVljTY3N7PN9rlPr1KNAMnaMWaV65uercPLaJI+o=;
        b=RpqBLy3+w8FTnj+zIDPtXDf4apBDWWwkI4W0MDSs7stJBCoLR/HfW/ut0dhu2GNsJL
         nNMRnFXbadsR7IQprS+oYL2BQvWWNbF5N/lpriwALwMe/PsE8X5l0QsrgTtppJq9yS31
         Voe9d0EF8R3BwW4rfa54l+k2oPrMfRh4OZ9ZRT8W9DPs1NfI5hIidio8IJb3iCmqKWaK
         XpsA/BliaNhV7U7H1NDYhk+ktUs4h9oHnFFNnICuECvE4ZjI1uIG2FcdNfo+pcHFo2Ah
         /L7vPYwgLcNxWOpZklPFqava8KeB7SxAweguaVuy+D53ssAYUtoplN12KVwB1kXkbtuG
         EnVg==
X-Forwarded-Encrypted: i=1; AJvYcCU00AMrwqv7N6l5jvxWde18//YGh7/8r6ZP2tu8eB2FTTzM0Q/IGooPxsB+tCsQfZQm5DZ7VjliKdhCVMyv@vger.kernel.org
X-Gm-Message-State: AOJu0YyWWIYzdZ9xxwEepaWZ/RjsnYswrhwEoG7uhF20mq5tzAurgGK3
	QfsgHdFrhIQLz1DtjeXCrHHm/NxW8nMThRr5u5PtASQoxBI7AfGD6EbxOuQyLP4ghTw=
X-Gm-Gg: ASbGncvQQ6nfwb/WLkRasfxAbn/HB5ZARzuq/iSyR/kfclqd5Yl/yDtmIaW76BQM77J
	adq2NYiQsktXLlJAk1zZav9Uxw3o5YDkqzOn2aMzYYbGFIGhmeELwP6GN2eW/Akm25QHt37RkY4
	cqVaZaBJIfNlcRcrHIlHmsmZYozFMawrt8WzUFQuL/J78h6UbWwmmdLfXxfIG4z1w3//KFkFbcx
	Y3lAkPyReVcRJ9BdthJNHk/B9tajcTCD5kkvzrVirVmJxblKk+9tIn70e56fkXE1FzCZ4KRqxEQ
	MfS+Wp7+f09tJvkth1ZFyv/dMb2r1z+fW+jSEg+GjYCkeM0qo3gXgGay85dJx0m4V7Pp4MqXyfn
	dDXDNEw08yJq6fVfJ0e7la21gOUg=
X-Google-Smtp-Source: AGHT+IEf5MxDQRZ1AOD7sTcnaYqSwj8ugFOpC72ckU4hsD9LywwTEslaQnTKyHBKOB6AHALVuW7X/A==
X-Received: by 2002:a05:600c:348c:b0:450:d07e:ee14 with SMTP id 5b1f17b1804b1-450d8874cecmr19582285e9.17.1748606013438;
        Fri, 30 May 2025 04:53:33 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8000d8csm16096695e9.24.2025.05.30.04.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 04:53:32 -0700 (PDT)
Message-ID: <05ac9918-cc95-4288-a185-48bd4b31b77c@linaro.org>
Date: Fri, 30 May 2025 12:53:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: qcom: camss: Add support for MSM8939
To: Bryan O'Donoghue <bod.linux@nxsw.ie>, vincent.knecht@mailoo.org,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org>
 <20250530-camss-8x39-vbif-v3-2-fc91d15bb5d6@mailoo.org>
 <e28b518b-26ac-4d3c-bfaa-21a7cce63366@nxsw.ie>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e28b518b-26ac-4d3c-bfaa-21a7cce63366@nxsw.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/05/2025 12:49, Bryan O'Donoghue wrote:
> On 30/05/2025 10:00, Vincent Knecht via B4 Relay wrote:
>> +	    camss->res->version == CAMSS_8x39 ||
> This is not correct - it should be 893x since 8939 and 8936 are ~ the
> same SoC - probably 36 is just a binned version of 39.
> 
> Anyway the x is the least significant digit.
> 
> Please fix
> ---
> bod
> 

No wait I'm wrong 8939 or 8039 - when adding 36 we will probably just 
use the compat string to differentiate.

This is fine.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

