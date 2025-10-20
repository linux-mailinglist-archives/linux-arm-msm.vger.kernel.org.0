Return-Path: <linux-arm-msm+bounces-78049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAFABF2DEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 20:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7865C18C176D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 18:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2222D0298;
	Mon, 20 Oct 2025 18:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JgI9XzHu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417DD2857F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 18:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983774; cv=none; b=Ipbl/D8Kb2UDIoxec4LI1SflLwVWW9JH6dDeTNQvm0GjxdBCLx0aElluiW7TY2Kxk/IIjkRUYuq3ZJr9lhud9UNFTw8OwEhw0gmueh0qmUVqP6LI0laTAW3CKRmwhySmbfJ6LWbyYtPWPd7dG6wXoh4y+5slR1hIDDWtJfL7aQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983774; c=relaxed/simple;
	bh=Spo6HloAQdKAcrrCYmr+241UVY+67PAGLn2irZa0EUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bHbse7gVETHiguUQe6XydMwPsnprjGl+AOtbWrnRhPzqUpYzBk/ZP9FIuzqe9dK7Jl+VttVK99RbF3P2K3ay9m4dFkv/RU767OVLoZvQEvJgF9to4ABdvDktGMoeuqphvSRxvceyLjyuyppxN1veplKbRqyQ4Whs3+PfvAZHzSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JgI9XzHu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47117f92e32so29774205e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760983770; x=1761588570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ZdBYEg1NCjQhSeodjmOf4VxyFNAFHDsc711gGKZDrI=;
        b=JgI9XzHujl2nFNERdazjfyBYzKPvYQX0RZxG1WdzaqSW+M0FJGe9n2FfRphnq8KTKJ
         bORGp6FQZ/Of0nBJ/X4qAWMV9KApFob1ggqE2WTse+RiT0pebfVmvtmAANALuJSEssoV
         ABBZANzWSDLqLR8VN6DLP3cDhpZRo/9FDQve5C/Eg5ZLwQb57oWZ7ZWl8MKQ7uG9oP29
         t2ktN0V5iVnkVBy9HmE6KW74js0bQFbS+f3ORf8HelWK3XDEF+NdQQCpckV8uNn+EGaD
         D998Vcs8InVl28EQCCCKrARpbDEGggjKfl3vatPBJCv+JDX11ORSUDzNhv80OUw/mgr9
         /edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983770; x=1761588570;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZdBYEg1NCjQhSeodjmOf4VxyFNAFHDsc711gGKZDrI=;
        b=v3ET7aeB7OBN25FsBDidKW4Kuh+6lpcSHaCR4TKK38i+tBArP5LvwzteFQv2lmdRcw
         C8apakgHvJWsRupLIRQJ1feBd9i217G2+kkljeyba54wwrU8b5ZVlmRNSvDVJcGUWmqw
         kO2XPp6GBqmVw0TQ+uTyFxYIYOvbrcxz9Vxaka32RUkh7onhRXkVhIem3l8RAyu1QM9T
         gI38/VwGWdIY4zVTE5TtFfoX5SGl/oSgToo2Lylh3szN5kM4/RCKtmtCz0KGRb31fXUf
         P45Vc2bwpCWnftGgcUTjuvO00J/DqJYA34E51CNeDF93Em0B3p4KIks0v9WI1iexBBAV
         XGLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXShvCnuUCCAu7k+1DmCIlK/KX+zvMmEk9+2cUagouXD2oOyFDfg9Iwf2z4Eh6mEiGZHJxwVG4zr9vigNoT@vger.kernel.org
X-Gm-Message-State: AOJu0YxhHIetAKSaAUzBngqZzrYkprrD6PpNvIh/D90bErcQe8pPkP7t
	E4fCzu5wFK/IPjoXbKZ6zBEuKc4bycN7WP5E5oRYKDf5ClhBWIhWmVbKRqhGYpLjKTs=
X-Gm-Gg: ASbGnctaG2TVwlhnQUWdvhQ66nfd2nkqNuxWkfsyfOINb7IvvqJV9REx482A4tEFHBk
	Xx1Ifb6gDqKk6Pu3/4YdOaPmZjB3USBe1EMvjwJpH+6uMiqeJYaYUiZCeFG4C2vBBFd/ZJQA90Y
	P+P7D5XeJnOxsX17Rn9AqVlLPv1GA/Uj/iRIyl9P8N5LD92Pe+64sce82NNSWDkUwXo8EiStMWc
	6u9xcBZ1jypZk1+JmN1dyYikNUr7o5DOf8xh2HX0I0gS36MR03Kxa8rJOG+EA59soKD3i4BNGKz
	WRDW6hS8H6Qcv1ut9RTYmmFpmhBSqUFbI9swkApy/SDF9Bf8T8KOFf3qpcFf8gjA/5dc4beuXXo
	D0kgXKUEcA+IXrpiOSB7YYmB110DElIJERTsKRhceily573KsaOsLwUrwLwrHDZybxPHWd+2ysz
	p34Ce0GAc5pE23OEIi57gI+wigbDPqpa+5IYdQzfHthRpYown8Lbjz4GYBoc2LPCUb
X-Google-Smtp-Source: AGHT+IFNzhmhSoTvu4cZ2Fxsh6eT7ubwrXOKq3S1oS3OV3JiX8/nti6w2bD3gES+I31XuVIOCrVziw==
X-Received: by 2002:a05:600c:4e89:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-471178a236cmr99126355e9.10.1760983770479;
        Mon, 20 Oct 2025 11:09:30 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4731c95efb9sm116135695e9.8.2025.10.20.11.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:09:30 -0700 (PDT)
Message-ID: <872988b5-8802-4cdd-b3bd-e1a8c718bb6a@linaro.org>
Date: Mon, 20 Oct 2025 19:09:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: media: camss: Add qcom,kaanapali-camss
 binding
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
 <20250924-knp-cam-v1-2-b72d6deea054@oss.qualcomm.com>
 <CAFEp6-1o11B9o3HjdJY-xQhDXquOTknXo0JeW=HfpTxXcEaK3g@mail.gmail.com>
 <a7be3a42-bd4f-46dc-b6de-2b0c0320cb0d@oss.qualcomm.com>
 <d8dfe11f-c55a-4eb2-930a-bfa31670bef0@kernel.org>
 <CAFEp6-1zpobZNLHt1192Ahtn2O7bV+As0P1YvVHrkRsORyH_Aw@mail.gmail.com>
 <ac96922e-d2a3-4a99-8f34-a822c3dd2d02@kernel.org>
 <7140b8a8-1380-4859-84a3-681b3f1ce505@kernel.org>
 <f5a1076f-f06c-404d-88d4-fef4f7694c82@linaro.org>
 <4fb3c83a-2bef-4b15-b676-73e8e8957452@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <4fb3c83a-2bef-4b15-b676-73e8e8957452@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/10/2025 18:37, Vijay Kumar Tumati wrote:
> Hi @Bryan, @Krzyszto, just my two cents. I think we should consider 
> separating CSIPHY, CSID, IFE and IFE Lite into distinct DT nodes. Having 
> a modular DT structure brings in several advantages,
> 
>  1. Simple to manage with much better readability.
>  2. Better control to disable certain HW modules from DT.
>  3. Less error prone as we don't need to maintain long lists of clocks
>     or other resources against their names. Accordingly, easy to review.
>  4. No need to maintain resource lists within the CAMSS driver to
>     identify the resources specific to the HW block. Offers centralized
>     control for the HW resources.
>  5. Allows re use between the platforms when a same version of a subset
>     of HW modules is carried over to future chip sets.
>  6. Is more scalable when we add more functionality to the CAMSS driver.
>  7. Finally, it brings in parallel development ability with engineers
>     (within the local teams) working on different HW modules within
>     camera subsystem.
> 
> If not for the current patches in the pipeline, if you are comfortable 
> with this approach, we will try to push the changes for the future chip 
> sets with the modular bindings, leaving the existing SOC drivers and 
> bindings untouched (if that's recommended). Please let us know your 
> thoughts. Thanks.

I think the Rockchip breaking up of blocks is structurally nice and how 
you would do things if you were adding stuff in from scratch.

Old Irish Joke:
Man in car stops asks local: "How do I get to Tralee"
Local scratches head under cap: "Well; I wouldn't start from here"

We have existing bindings and one message that has been repeated is that 
new bindings should follow old bindings of a similar class.

There's a good argument to separate out the CSIPHY - because it has 
distinct power-rails and has a real-world effect for users - in that 
their PCB.

It would really be up to yourselves to justify why it is a whole new 
binding is required i.e. what benefit does it actually bring, and to 
show, prove, that existing users of this driver either benefit or don't 
suffer i.e. doing work for old silicon too, not just the new stuff.

If the only objective you have is to facilitate co-existence of a 
downstream driver with upstream bindings.

Anyway there's absolutely no reason to hold up this series or any 
subsequent series on a hypothetical rewrite unless/until that rewrite 
gets proposed, reviewed and applied.

---
bod

