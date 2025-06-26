Return-Path: <linux-arm-msm+bounces-62612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF648AE9A31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CAF63AD359
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 09:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C332C08CF;
	Thu, 26 Jun 2025 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VCQc3imn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6292BF3DB
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750930486; cv=none; b=Ww/X+MDGlXtX88UusRD6+B+IOX0uYM3RjMmIqavsIglEnbfLnCCNAHCMPWVZ5Se4O/Zm/EKUj8lOqhaiI77onkFnKUG+Uz5XzUc7LjVQrUYf9LnFqpWxQtG2gcaIheszoDyydEwV3lD5AtGNIsA9nL3TJ9nhvAc8rrEgtVdMWq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750930486; c=relaxed/simple;
	bh=daWENH4sK516masqOiqrmZ6Qx3lAJVRs4pOEyMGTS2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=moJwVaRdCiiRufaiS8Vxdsm39Uvdj/7Av6XNzrikcGf5RvwAxmA4g1WcUBCLXqUPOknnF/43+H07A0JZM3BqS1ghg8UuJ8zqVVkat5lQf9+phqTrLhXECaL6TYh8zc7Y8kcuOU5yDtQpsYd0ePuxHl1kPwg5A0h4CdONvJD2rv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VCQc3imn; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-451d54214adso4650325e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750930483; x=1751535283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jmk5itUcCIG6Y80ZPXMFyz9ACwii6tzjqEWxl1mzR5U=;
        b=VCQc3imnVsBnNK9cD8sfl6GgjI8pRKX2KrqquL8wXHhsYO9X425iJ7Gt8YWN23djrD
         s0WCjgG7D9OhM57kheWlhdsd5xr1r64NoWZt6dyzksvpRappQNGLqsOb47kX8GB8b9Ly
         c+qDyNT3HhfPNsYDIDvQTdQByOj7FBbnSuOZm22CwIjp63pclj4//e3XtnL/fxkqqO2a
         AJgiTRCo7ZeB5RoOlAxR7PW2yr+ahMBNSe0CFFDLrGVn8wCni4K1z22J/f4fqBthShZH
         iQ6Y15k0oQKbA9V++JM+iiiJA5gLGKUeArR70Ir7y/G/nVr+Fb1JUp0LnhOqGF4f8oiZ
         Qj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750930483; x=1751535283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmk5itUcCIG6Y80ZPXMFyz9ACwii6tzjqEWxl1mzR5U=;
        b=n/6uYeOE3D/xXwI0LifIU+Qy7PFycZmQjxUS1NKXP6PVK8LBshnQ0SmfFrZEHRDL/b
         KI6GVnGE2m/DUObwUqkuIVJ91LrADTyOoJ1/xdCxdL04Hsi+7YMAZ6iYVks9JawW6Qvn
         IOTJlh+sRlUHFWTFfL8/BC4omOBj5weMqneg+PhF4LLlMBBDQqzwjHhpEGCTnp5TB9vn
         EGwppwcWxkGhIDXjYYe36UE+DDAlAskUsSogdXUGfBmibjMGgOxI4DCqxZtRFc/3CuZU
         mqmqu97JuXb88rmHxMT+sYvqiJ6m99zzzzBzl9UYUA1+3LitnMQnfXimQofhFHNPetCf
         jTNw==
X-Forwarded-Encrypted: i=1; AJvYcCURXTUbhyFp3hbCcI9Ep3DIIzlOsQRh7lr8wO2Fbq/RUR5eW98dq79DlZ9kuwecgnrRQsFzQAgRmuIk4L/P@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1dzsd3OJrxkHeKykytNzw9CcXq46Dp4bI2CAwG8nW6MvXWHXM
	+lwlAy1/uGabTXk/kLQ1hTENDWF8cgsOQJqflVM2j4IRH6JzFVExl4POLCU34485/sk=
X-Gm-Gg: ASbGnctatsGgoDfd64andQtWhAgfL8ikexKONYS46JE+t202K+49k5RvT10vVM7O+Xh
	qXHPIBH8LLNp3e/K93RtN+hHiV6mt06ki4PdyBzTPLln0Q2rKFyuFjDJkqRbLiw5FklbRTFRr3z
	j6SlS6IeUjtkHUldXmzrbM8UJZyr3CsQTWBeSj25yVg2Y6Xqqfgk57HPbxB2KxUr971mv9q+3/O
	z6231FnXvNvQG4mQ/ay0eeCWJZxpTOwqgveGTH5Dso6xjrKXPYvXagS76fBpxlQazbLWf6ibr8F
	OepVTFIPJMrjis9yAYFi6x53JBRNPXK0y5MehLEOpZjw10HZrzAhns5oDy2RVrSgvVBtQWv8TTv
	+uVdNsdyvdI0rplmrhaRL2kgqmKU=
X-Google-Smtp-Source: AGHT+IFsKTdNJ5UoksfB3ZzoCCyLEvAmb7v32X3qcFkFmLrA7HtlHe0xa0JRXmgqGSDIbpaNAIULcQ==
X-Received: by 2002:a5d:5847:0:b0:3a3:7593:818b with SMTP id ffacd0b85a97d-3a6ed62eb62mr5516826f8f.21.1750930483250;
        Thu, 26 Jun 2025 02:34:43 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4213f0sm13810175e9.36.2025.06.26.02.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 02:34:42 -0700 (PDT)
Message-ID: <2dce02ad-6913-494b-afa3-315e9b50529b@linaro.org>
Date: Thu, 26 Jun 2025 10:34:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnects alphabetically
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250624094253.57441-1-vladimir.zapolskiy@linaro.org>
 <20250624094253.57441-2-vladimir.zapolskiy@linaro.org>
 <aa56b956-95f3-484d-8afa-058925b95bfd@kernel.org>
 <fff77f71-e21b-43b9-9da5-6cf819add970@linaro.org>
 <5a5b78f7-e156-4c5e-8407-b249040e227d@kernel.org>
 <c29385d4-30ea-4774-9cf9-699b08e29800@linaro.org>
 <329b89a4-85a9-496f-8b1b-6239dfc9057b@kernel.org>
 <930edec1-7403-4ecf-bb17-2e68b8d351f8@kernel.org>
 <e0eb8d55-b4fd-4f3b-94b0-5c56d48b4671@linaro.org>
 <c923723f-5e94-4621-9bb8-36c8572f9b51@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c923723f-5e94-4621-9bb8-36c8572f9b51@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/2025 10:11, Krzysztof Kozlowski wrote:
> Hm? This was not a true statement and anyway this was not from me. Why
> are you both with Bryan creating some fake rules and then later use them
> in arguments in discussions?
> 
> We don't talk here what sort of rule other person invented.

Ah here lads stop dragging this up

https://lore.kernel.org/all/c1539cce-92eb-43fc-9267-f6e002611bbb@linaro.org/
Date: Mon, 30 Sep 2024 09:55:19 +0100	

We've subsequently discussed this twice now face-to-face, subsequently.

It's very clearly not OK to reorder the interconnect nodes.

Stop @ me about this.

---
bod

