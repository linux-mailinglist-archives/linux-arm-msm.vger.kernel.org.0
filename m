Return-Path: <linux-arm-msm+bounces-86930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A1DCE8FEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 09:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 310B630022C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 08:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E8D292918;
	Tue, 30 Dec 2025 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tzCIdIFP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B638239E80
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 08:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767082732; cv=none; b=XKEF+pRyzbtr5I2CQWd0zB9tBH+Ses6ul5aAc+gEg2HaWmk7kf4iaInemghNSj0NzZZAeXfNMyjI86oHkJ/nEOz4nlLg6pERmtWxoSju/gr5hLqEY4IgmispoJzY9b6tg1jjQEmgWprJBLksqb2JmyGEgQQyeiGSlz25T/Kklbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767082732; c=relaxed/simple;
	bh=v8mrrc7yE3c9qhRU8zkJsHzZgCi7JoLcbMtMMJl130k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eBvddm+rgXJ578D97FqGtRGfVnH8KZLJbgswsp3KiHXqM2n5pQZ7nMWrQ30kkv8GyL2fEspiUobazuypUFefUmb+kFfBq3rHVgryAYgeDK5rw3blFNERiuhYZbHp9Q3NdDs/olcCf8Pe7bdr5mwrWXY3St3nnoiSw9gREtaKkYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tzCIdIFP; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59426dc96f2so334407e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 00:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767082729; x=1767687529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oWwnUl9perZUOAgUEtwYqm9KF/RzvwLKJJUUYt/2Ds=;
        b=tzCIdIFP/SoeGxvCcY5c6Z16oIYaydRghhZsPZeivK0N4NniK2kDWnUiwlZ9cLpll1
         /DyLzlY/EdpC73xqWa1+Mu0FREzsQWpgTfAx3Q12C/DjHVsa8LYfmLm5uXENK/HshkPW
         +sbVpkOYkR9/kIVcGVm1uRZTzOvIma+kwUwslApW2XshPiDCsiFPdABxCLp0jb9bRUEn
         FVNUS8v2gVZDYpRioIA/V52rjqJPFVdbKdc7I+XtFUOYiocF4cUx+oNsI8+3G1IgIHE/
         KX4FRuB8mBVHadk7lmM6wWmLyZMOkCtBrvmugWcYHdnZWFMz6ORAUUhcZDN+AhgUR3TI
         gvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767082729; x=1767687529;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7oWwnUl9perZUOAgUEtwYqm9KF/RzvwLKJJUUYt/2Ds=;
        b=rGJliRMQ9HPZ6Z3LhDSyHVdoJVetiFD36wRyuDJJWhDwmW0D7MIB4tUPqUDOFuABAq
         Gjq9AwCuvJm1PpouTY6iTwsU9FAGogYbila1V23LQqhU7LU+oNZDhHq+3Pq5ARi6adJb
         xap8W4ouPO02iiWKJR4DT5w1dwz3lgMFp0u6bEIM66E6iMU9eYA3wjCsf5WuCDYUP19v
         M6S5VCybzwQClVrvd7fqdVdlgf+Vg3sQohWL7y4lItd5iRmNxFTtprI2NCCTmhDYKFCC
         qC1cz8zfUfidsBqSjbYP1J41qV6cKO33dgKhAPl+P+E6uJzsfEISPQe8UM9SMVDHNAWH
         gNnA==
X-Forwarded-Encrypted: i=1; AJvYcCUscv0xujXJgRk0yE86jyR7lvsAdj8XyeHZvv6uExa8PmMl9i5Lv71zQNuiZlwmhF/4kNjwiXYVAsz29olE@vger.kernel.org
X-Gm-Message-State: AOJu0YywbXU4VPcUpYeeveM9duv/PoT+xXKqMtxksd/PyOW0vnNEuDHF
	OsYfDEn7C/FJdwJ4jkWeMpbimsNvd8amsbCf8a9RfgJEpCvSLRGv8ZAzQkMOx+KL9oI=
X-Gm-Gg: AY/fxX5uzZh3srbbdnM0uTlEjxjwbfK7MRWgcs6EQVa486ArhvcmcgjQrDWzwgtZC7A
	8DFoZg7HCW5Ffyl9vOSgQE3VrUvgiGecd0eYn6DBNxUEdlmCUpe4VRi9PyF1AAQe3qFHIHRxPt7
	OXQPE5JtY+/fw/HUXthmHX69lOk/VKPWTaJxUJD6COeR78707Im0C7wLcoh43KrKjnjieq+shHS
	e7Mw0ti/+j2YHXdVgovzrIPJHajN2INlolhRCrFmahnHL/Xq9AUYJp2WU1y6iUCIlq7gn1X1W5k
	gFkN1w0tGR9mqHYd8RGWB2FNK5kGyQyOH4/W38z+FZUkY0kraB53s8Lj1F+qecPVUoy6AgnJvTi
	FQNj29xfWHYDURaC/bSlSpsXMMXJu4VFzu4eiUML0fGvC2Ni9E31DmzXinSvKGRLPuP8cU1+Lhs
	BRh8J7x5aorFVILpxIxu5J7uR2zH0f/M51pX7i3oEMkQKESju3GU6+VbhArPxUB3JI5Q==
X-Google-Smtp-Source: AGHT+IGBKgEgA0DSoo96ohfu3tX0jdZSs0KRDNzH/uH1fTPEKyh004Q1HykeBKi833RCmFUzF1oqIg==
X-Received: by 2002:a05:6512:1321:b0:581:8db3:d5fe with SMTP id 2adb3069b0e04-59a17d70667mr6479215e87.2.1767082729178;
        Tue, 30 Dec 2025 00:18:49 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618a35sm10421379e87.66.2025.12.30.00.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 00:18:48 -0800 (PST)
Message-ID: <1fa74da9-bd3e-43c6-afbc-8cfcbb93af93@linaro.org>
Date: Tue, 30 Dec 2025 10:18:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: support for empty endpoint
 nodes
To: Richard Acayan <mailingradian@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20251230022759.9449-1-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251230022759.9449-1-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/30/25 04:27, Richard Acayan wrote:
> This series adds support for empty endpoint nodes. It is currently RFC
> because it continues an ongoing discussion on how to selectively connect
> some CAMSS ports to cameras and leave others disconnected.
> 
> The SDM670 patches are for a full example. If agreed on, this should
> expand to SoCs that have CAMSS.
> 
> Example SoC dtsi:
> 
> 	camss: isp@00000000 {
> 		...
> 
> 		status = "disabled";
> 
> 		ports {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			port@0 {
> 				reg = <0>;
> 
> 				camss_endpoint0: endpoint {
> 				};
> 			};

I do not see this device tree node layout as a valid one. A 'port' provides
an interface description (an option), and an 'endpoint' declares a connection
over a port (the accepted option).

 From dtschema/schemas/graph.yaml:

     Each port node contains an 'endpoint' subnode for each remote device port
     connected to this port.

This is violated in the example given by you above, when a remote device along
with its ports is just missing, thus there is no connection. A forced alternative
reading may (or will) break the legacy, so in this particular case you shall
start from making a change to the shared graph.yaml documentation, since it's
all not about CAMSS or even linux-media specifics.

-- 
Best wishes,
Vladimir

