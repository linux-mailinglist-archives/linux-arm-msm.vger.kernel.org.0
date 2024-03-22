Return-Path: <linux-arm-msm+bounces-14833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB61C886C2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 13:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B9D7B20DBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 12:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE163FE28;
	Fri, 22 Mar 2024 12:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pb/Z/h0q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9462F844
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 12:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711110938; cv=none; b=Gnv312ye16CBDnSmZOT9LxktWPichEdFaM5erNISpgiFdsg7ls+jXdSXbGx7LLW+ikgjfQtpVqXXeU0GHauhpAzQcPfLqFR7SIppvJgCcP6IkAj8M5Uzv3BDI1+52LZB7q7aFIohXipffOKd3Vn18HlTHQGFZ1miWjBbs2s0rqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711110938; c=relaxed/simple;
	bh=vXf4oistVLvkPyc/6m9dpyTFXPudu0cONm6C5paqSz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ak0K0GDdKUjIV5hjedL8HdhEA2kOoU3nG3rge+z+bg3hcATIPFJo6mDfcH9A2JbD/LqFF+GYN8iZI+DH6nlS3GqURiwItryc3eQYFa8Ab5MUZzEUsBMcUNjPW4rXfeiN9cTJ1msKYr9zKOIXOBBMLLtg0guvzD9O4TsKGevcNwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pb/Z/h0q; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4146e9e45c8so15235465e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 05:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711110935; x=1711715735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qaiT7un8HqnHgeFe5iogGWeHvRb9rIMP24UTadK+jiA=;
        b=pb/Z/h0qbxsL08FeZn/dHpkP2eO3kIiZ4v7XGgsx9dQIaXq+J6KoZHf53Wd9GCJcLH
         0EVyh3vSEg0Vps9ZpG+NdwSGjU/VohyBnZ2ejq+kk9TyJYBoxr9zZ8/Z7r7dU1PNi72j
         2aq4jEoNSqqhX2QaMSIB383rK6rUqURS1CMkoxPODaZDYVyLJ1uD6wTwoS9DQDxWJE4e
         NXQQPqcSjUHAjeKE8RwIugFZPvluwkZP84XGC6759yO/szKpk2Fq+f0FsciJYlBRCQUV
         bB3egH3zMBBhO3oxtBOiylX/exPqXShiiztiYNwIHtHW4gth0OgeqY/owVn/OMRIt0WO
         OuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711110935; x=1711715735;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qaiT7un8HqnHgeFe5iogGWeHvRb9rIMP24UTadK+jiA=;
        b=wXOorHT/7EKQrox9VegNAoCL5UjVrrvfHpRfZF+k/gKXMBhby1TQG8XEBKlVwt+jZa
         7veKmIKySyJLeuehhEmygtL5/lRLisVpOo9h3RFCCLvZmadhqlYof8Qzd32zjdhrFrf0
         bRMisWJfYi663CKxVN0joJgOq3C/JI2EtJz/MCbe57IDE/ae6hVKOY6FT9CEkZCvtWPq
         ofo1umbs+YHvwEBHSvTNZPEKK/58nbcSJuIi5v3gmY/oWN611gXohFTthDoDyRtmoNvk
         jTUBAhhxNrQf5RL7fQgEoMOc/ydNpoZ0y+5zEJnpzUNVU1OZaXznrywN5WsdBj0Elyl4
         2i7Q==
X-Gm-Message-State: AOJu0YwMCcWL0Gs1ww2yy6IZJ4kg2G3mDAqMu/mEQF+v7suPAzYHfjVk
	EFQ/IWzQ3BmkD0xZt1THoAkP5Yn/7RE1jquwA50uhmJWEc1wVuHGcrZiEAbjXdxZ7TPsSjLN4Ns
	z
X-Google-Smtp-Source: AGHT+IEr23lPjPBzHfm4e4fwAdjKbh+mxb36ENN4fFzUMtd+xvx1PD26UevBeCxTwHiEfO+ScZYTkA==
X-Received: by 2002:a5d:4047:0:b0:33e:5970:e045 with SMTP id w7-20020a5d4047000000b0033e5970e045mr1909894wrp.21.1711110935515;
        Fri, 22 Mar 2024 05:35:35 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id az27-20020adfe19b000000b0033ed84facdbsm1986781wrb.82.2024.03.22.05.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 05:35:35 -0700 (PDT)
Message-ID: <230eab52-9751-43fd-8e47-fbfe12410e44@linaro.org>
Date: Fri, 22 Mar 2024 12:35:34 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,pmic-typec: drop port
 description
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240322-typec-fix-example-v1-0-6b01c347419e@linaro.org>
 <20240322-typec-fix-example-v1-1-6b01c347419e@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240322-typec-fix-example-v1-1-6b01c347419e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/2024 11:52, Dmitry Baryshkov wrote:
> The PMIC Type-C controller doesn't have separate role-switching signal.
> Instead it has an HS signal connection between embedded USB-C connector
> node and the HS port of the USB controller.

I take your point on port as a signal but the way type-c determines 
data-role is via the DR_Swap message.

https://www.embedded.com/usb-type-c-and-power-delivery-101-power-delivery-protocol/

We receive an IRQ which is a packet containing DR_Swap - TCPM consumes 
that data and does a data-role switch.

The port then establishes the link between typec-port and redriver or PHY.

So, I think HS should be dropped from the commit logs and names in both 
series.

BTW for the GLINK devices I think the adsp firmware just notifies the 
APSS of the data-role switch so, these types of devices probably should 
have an epdoint with "usb_role_switch" in the name.

---
bod


