Return-Path: <linux-arm-msm+bounces-13687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A45487620B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 11:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6398B225F4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 10:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E48E55763;
	Fri,  8 Mar 2024 10:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWyEUL0N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9636654FB0
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Mar 2024 10:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709894059; cv=none; b=oMMxDAmFgVXWaGU9xrFbcXnxAQo0lMSUegydUIUhJCw+aQbgPwM1gpJoyqOMij92elyU2WSVYXQcWNmIl9dMPHDH8v4SwMQIYseJ8JhzWcvdIX864xCxc9+89A+AjkI83Rf9eMK6Jtu0zQydHU7IKwGUYCL26wCPUwIdbzqFSSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709894059; c=relaxed/simple;
	bh=Xm89ZKWWZjY8yNkp02Xl7vA53Uu1k/MUtwqKxIuFicg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uch37iEtJ5FRgs1Mtb2fqffzYRjyNK7Dgvvcj21rMMjabbaXkOLYBO9NH7o6Wpb5pcm+Z42WAqoVm4fhb2HkR8o0/+z6cD1HPjo43OVdVHeRJV0MOKM0X1YQd9BTzRqOWhrMtaI4fFB8yISZ3vSVvvLDxIIBn19mkvuS0CYqUj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWyEUL0N; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7db994598cfso400582241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Mar 2024 02:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709894055; x=1710498855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8DDxbjeaMm4gvwFP7/UbLgJ/gdk97S0v1rjg79ZJtNY=;
        b=TWyEUL0NHK7JDmYXr31PlrbiZeXIoGtptv97Gs8mRQ27rsfe/9wQ9Y3Oax9vP8i0Ro
         7h4fc9inw+J/AQP9U3aLhR+OAUoH79QBG9GbYz1MDnuOZO8qyY9qh07VYIjXEHY5nZBZ
         3no99fFZQb9dtN+HdUr1a15nUMC1WEeGk+PIu/Xc0D2djnq7g4oxRXUJSBYDA7aeZo/2
         LtE8gOqIub2t9/pA881xOAXVmtLuKhi3mYEkPEbgBnaBLhDreLqYYWfzRxgCj4Om/Gux
         +HviX2K+4vF5BnPZyOkvB+oMWtL4GU7PDCix6o3AWeQ+wC5/W4hDIWXpO4ZRLORWY7tn
         u8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709894055; x=1710498855;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8DDxbjeaMm4gvwFP7/UbLgJ/gdk97S0v1rjg79ZJtNY=;
        b=i8WG6kdNuMiUdFxR7I9DSXvugKiUgCh4zSDEiP9pg0esoshuHnZ6I9BgXcchvE5KXF
         uD8XSBZdUC7x3PA5jxKw36CBBMD61IGE3rbrvl8Mn/z7AIX7EAdJPwtqQ2GzmfXEaf3D
         ZQIu7Y/Pg1Pq94LR9SF/RCL+5RN5eAD0WHeKe/OIruSajgtQS1AwJ5qZ6GRD/TCMgWlR
         0jk0GBfF2hj9YtzmhsHc68tjhdPMtSgmlq4ZwtjrdYmh5bEl9n5jDkXYJCVBvx/YU9Ea
         iokQhYzUAkC8iqkS1ztxVw7hzaqnPandMLoXZMoj9iKRMUhxyIUVH6T4ZH3WhsKwMYsz
         oVdA==
X-Forwarded-Encrypted: i=1; AJvYcCW41en2dwFVRiVv07o5WcEvd3FKZzFgvRPBVRmWJOEzNoYDZpuGuj0JgMN2bDiYeZyCRG/d6AwUBAFy3CTpDNAaabuALsE/v0FKGqd6iQ==
X-Gm-Message-State: AOJu0YwNuJ8GY1vobAuByKQSt9eWYKRaWLw4lBOKJ4ETYgBRbEioXdeG
	yicNZmz6RFO8/SnsKyPjdfgXuYAwnQQl6b+mjQgqFusN75CYwbL5TyqAErcbAaY=
X-Google-Smtp-Source: AGHT+IG+L/5RFZ1wUdeWoEuqlJ7SChz+AJ7fAx7rWUp1GgelKZ8LVuXj2WUEEFn4Ps6NxSxdeZf2Qw==
X-Received: by 2002:a67:e289:0:b0:473:ed7:fbc with SMTP id g9-20020a67e289000000b004730ed70fbcmr1300159vsf.5.1709894055377;
        Fri, 08 Mar 2024 02:34:15 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id e12-20020ac8598c000000b0042ee2bda028sm5938865qte.54.2024.03.08.02.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 02:34:15 -0800 (PST)
Message-ID: <b78ab5c7-9510-4c46-ba6e-328446335ec9@linaro.org>
Date: Fri, 8 Mar 2024 11:34:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] spi: dt-bindings: Introduce qcom,spi-qpic-snand
Content-Language: en-US
To: Md Sadre Alam <quic_mdalam@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, broonie@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 manivannan.sadhasivam@linaro.org, neil.armstrong@linaro.org,
 daniel@makrotopia.org, arnd@arndb.de, chris.packham@alliedtelesis.co.nz,
 christophe.kerello@foss.st.com, linux-arm-msm@vger.kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20240308091752.16136-1-quic_mdalam@quicinc.com>
 <20240308091752.16136-2-quic_mdalam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240308091752.16136-2-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/03/2024 10:17, Md Sadre Alam wrote:
> Document the QPIC-SPI-NAND flash controller present in the IPQ SoCs.
> It can work both in serial and parallel mode and supports typical
> SPI-NAND page cache operations.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
> Change in [v4]
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


