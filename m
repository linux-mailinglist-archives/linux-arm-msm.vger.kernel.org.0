Return-Path: <linux-arm-msm+bounces-42005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F9E9F0BEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 13:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D743C1695FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B611DF974;
	Fri, 13 Dec 2024 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rFHuZ0Co"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA351DF759
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 12:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734091797; cv=none; b=kcvKBXpFgi5yvabPzaebnaLJSBl/HdAzqDPLBwWCoDuZXinFyHcqkJ92M54+7BJscetn7vaDfdLQUG/BAnbq1D3BSo3U7VuTMX/Hs7LN09oqK+Yz9TeDOC/bIuN4sl2QrqTjVPHTgLrKE+Xqpd/v7tGdUVXABnWMj9NuzclfrI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734091797; c=relaxed/simple;
	bh=281oP6qwT10KC5cASlCTcsOtDLGcNGdhFI0idcV9z5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/oaUOWhiAKL4CFmOH4j83rIRrFB/z7Dqz4jOf91Fmd8vsUxSNnJ0ozv2WuUB1yPa34SHAcN2pioa7YkJG6ohRbkPlqqytaIPeFHPzx8oIsoGjZiRd+3iPzmfRxNYQLEieACikZRSffhhiTL0hxURVk0VerCHiqInLFvp+uy+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rFHuZ0Co; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d2726c0d45so2964043a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 04:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734091794; x=1734696594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kU/TAxCt8O0FWz8YtfbV46t6PIq+DpJp8s1Cxp3EtkU=;
        b=rFHuZ0CoKgWTQ6HQbYB35TM58bFyosIR3rH9wdVZ8ieHb439g/uAxGHm76IBiY3T9p
         pKxWP/IA0ygCGkXQLgDQDGa1W0xMlCikoCgCLHHEK9TTl8GyVj1EOyesqblgGjJb/xvL
         phRq79I/HiS4DukKdNBNFQ01BynAfTsNrfahiTu07wEbuspwy8OmhDakYdPggq+uuuJg
         Sojk3iv62ylfXPNNxJ9K3e/Sr+er3qLviPKnfYZunycWn1ochDM8yAOgrk3bfDm9tWF4
         vU25rNbCVtYXotK6COkZD6KWcBf8LIIMk3aSsXoB1G6bW5Dl1gThrmhWZipc/cF6IIdB
         zXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734091794; x=1734696594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kU/TAxCt8O0FWz8YtfbV46t6PIq+DpJp8s1Cxp3EtkU=;
        b=Ckhg1BoPJI+4sk/dXVbqWI/7RhG2CYTtGk5DMOhnViFtjJXm9x/OojmMYYvKlyr25o
         XAdhM28rFrrWb4SYFH6lpLYnLVFnyEKcWtdKi+fA29MTEDNuevEoLfWS5h9QQFZR3Zfg
         8qq4Y6U/C99xTlWu1KZZ9LQNVVnMJUINuoVE3yr21Syu/8K/rsH74MCYgchrM7vRMbQU
         IgA0uM2B+VPZI9r6VRyBEaONUyY/5MCql/MdiwH/psOEKSq2aCcBc2WAD0nGtZ9YqWtl
         EDjJPtdzfG/VLWp4X97xp2IkToBHKBF4KZ9s/hpkXs8KJCa2tXlofs5NkEGx19X+iupj
         BGsw==
X-Forwarded-Encrypted: i=1; AJvYcCVRKq1jKEwnWP0wzhsfoJnFPVH2Iu35vliVFCkUnhFfIDE3GGbsYARwHwd8PI0L3tLOW+gKcEhQXetv0h86@vger.kernel.org
X-Gm-Message-State: AOJu0YzxknKXdbyj9b7MxQIrp4YnbWBGxQtsfuRKWtscGAzwUfO4x4Xt
	TW9ue5Ls7fe4l0YSDjo+gs+WBkyBBBdT5FqzSx4AYRRmFOpWdUR8lIhDojU+FzE=
X-Gm-Gg: ASbGncvRCQ14eTHJkPvM+hzDGtT7Nam/QRP7nxfjsSw7S+pGbPykXY4uF1cbHKlR73u
	Yv/N8/5FmkxpZmYnEMm+Yax7C/KS/Vg0OADTYVjrdmavolheEC/ZONCmgD3nZxroPzVSlxCpq29
	MjUOwikBs/kzX3LYkCwHE/CAUQE7qVPzDq+DSQqK6pMHxTplvZ00id2baFT4tn+0bWqf1eVomAo
	CVAiFshwZqLZ0piZMQ8OdG94bbM1ilCtFWDRRgmnGgv76bdA1gUrkCZ9wfoNgWqaap3NQ==
X-Google-Smtp-Source: AGHT+IHg0QPsSMkYDMNreim6HkBAf2q/HK4rWikIiumxCf6Lq9iDoqA7IB717TtG6/sfnrY5KpOkgw==
X-Received: by 2002:a17:907:7da9:b0:aa5:b1b9:5d6a with SMTP id a640c23a62f3a-aab77ed2feamr198015666b.54.1734091793863;
        Fri, 13 Dec 2024 04:09:53 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e33f7sm1232156566b.183.2024.12.13.04.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 04:09:53 -0800 (PST)
Message-ID: <3d93e6d7-a740-4314-a5b3-03e0c8d7749b@linaro.org>
Date: Fri, 13 Dec 2024 12:09:52 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: media: camss: Restrict bus-type
 property
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Barnabas Czeman <barnabas.czeman@mainlining.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, David Heidelberg
 <david@ixit.cz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <20241209-camss-dphy-v1-1-5f1b6f25ed92@fairphone.com>
 <nqggstwkytqxpxy3iuhkl6tup5elf45lqi3qlgyv6eaizvnfdr@2uy57umdzqfa>
 <e4bd515a-eb98-4ea1-8d73-4ba5e7c9b66e@linaro.org>
 <D6AJ9U23ANWI.1DLHNPU5A6HQ4@fairphone.com>
 <d7e3076e-5b32-4ab8-afe8-f52458769f23@linaro.org>
 <244ab38d-762f-4860-b38e-51b08389ee6a@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <244ab38d-762f-4860-b38e-51b08389ee6a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/12/2024 11:54, Vladimir Zapolskiy wrote:
>>
>> New additions should include this bus-type number as we will need it
>> when we add CPHY support and the subsequently move to the PHY API for
>> CAMSS PHYs.
> 
> This particular reason is invalid IMO, since dtb changes are not relied on
> drivers and shall be kept agnostic.

Its perfectly valid to add a DT description which describes the hardware 
whether or not the driver consumes that data.

DT is supposed to be a standalone hardware description.

---
bod

