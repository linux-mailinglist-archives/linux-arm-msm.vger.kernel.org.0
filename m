Return-Path: <linux-arm-msm+bounces-86939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0E7CE93D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 10:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76E2D30036FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 09:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B28F25D53B;
	Tue, 30 Dec 2025 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sE7kF5ta"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716EE248886
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767087622; cv=none; b=PuvbyVH3U4q8osEr3Izg1Wod/9A3ZjE7ZaBt9MAt+wHLv7BmuzJtU9MYgUbXaBOwkiR1ByG1w+uEo64IgkBixvQnoyt4tHel3c034sl3m3GgvbR00gxGbOodz0zNnBBtn5Y7TZGh4dT4HRwHZeW13du2h5lxHVwMsCxW2tWQm+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767087622; c=relaxed/simple;
	bh=SnDVtQVl8WBWF3R0OmivmMiBUsApQ5x6MGy42kKYg4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HURHxtmBRpUB67yjB4B7LP2rVRVFGHDm0NlL42jm6cq8JBTsAiXkHPUV4E/HuBbFrjS2BuEg6lMGCil5b8vRW1n8JZRZMq83cd50rfUEjIOpRArk/hD8qPSFfOxiy+to2hH8KAsLxvZXdl8qE7ZWhXx7wBLgwshHUxQLbULQSpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sE7kF5ta; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b73161849e1so1889991866b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 01:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767087618; x=1767692418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zN/ur9M0KwImi0DBm0/fgIedoRti4CPacoiNg7hhK38=;
        b=sE7kF5tarGehhNxx80TO1z8euVHK2gI1h0xjtbmWrksONGMpk7xA4Cet5uUZ/djeFZ
         5l9TFjWoSGdBhifevZuaocTtIQQKfy+vX3SkQZI67pHmoLpIiOKXtJrc1n4jh80vdJ2s
         MLWYlfVA3dONqcU7wB0YVnIDzcmWL+DYB5jeBH3NpJ3/hJllT2uXSKdFS2mDbh/G+FZX
         uzOgRrlQRp/+48YKmTH6ocd2ndDjsOktYnH0XfiOjYJypUCC0hspZ8ThXTMGMFaH4TRG
         b16bVDTJfR5jbD9oKcKlVWFX/gkr33jT4AT90jmJhdAlJ3Ug7YnpVBwN4wi+nTeexA8P
         C4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767087618; x=1767692418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zN/ur9M0KwImi0DBm0/fgIedoRti4CPacoiNg7hhK38=;
        b=vkY2sQmzQ8gvV1jH6Q5Lhh6FWAjQw0f3d4+ny683CnfkORLwHOQGoIut0fqwlA4mit
         5NnWxgfGQlylUtP0T9/za6fvoAkgKl/FJiVz+gd4P1pPGqiH/nczBjOlWUdy5Zlpx+tf
         MV5nRpX4//abOMNzSd3aMT3QEITHAFXb+A3OLsg/NeDVf6nxW0ZM+UXhNTRvJKWcMNQk
         NGxnajvQRcCIICElLaYQ4Z12ynQPhCxsklAlikTFqfx7GFO68aszmu0osb+7nv6vLvd1
         q/qI0stmSK8DJYIg7lHvhfEnUCmKhHhaupO0ejdUStprbZUDxcR3tYSXunpX76N3OV/T
         tYLA==
X-Forwarded-Encrypted: i=1; AJvYcCXphPM9RQZaqLNyWV5Rzkjy2pyEq/7e7TC4tACUIGlTF0sO3eGHGepqMzwpxafZx92uMVlyqceWqynkPW/0@vger.kernel.org
X-Gm-Message-State: AOJu0YzDf4W4XePdpk8iHpG4oGUAwoMzjMyXmHlllLE0X2GgdSq9MoL9
	diS6a+QL1ZeJ6ETg/jk2Rrna8eKffsymauA27q5LdzzRuo93oztPs13BuD5alZiaImJgMhBN85O
	V8af7jIVHgA==
X-Gm-Gg: AY/fxX59PtOj4gNXOUxqO/gd9s9aO5d8Tw2sdsxpeR5OTCDNEJFLXQqxVLKJXrfEpSz
	cTmgf09i0F2Scfaxk7baN/uj6KQ0NH/euWAcOd3LG5WL00a5C0kzWxAkwtnSydWQtirLcdjc8m/
	UIBlyxeor2k9Ihwiz9JsuylspiQwxy1vVKy30QQ0flx/IgAhWt5tQcrasUVunNX6iAexjkvRUeo
	DYSedqAChp0NV63qgYjsw32E5kNHS2nlECjMARjR8Vq5UIW2g/2t3r3lRtuezAdQF49Z4CFMB7l
	imOquB/PFVJDqhK1+KD9Pi2bMrEh71fZI8et1wec/xX8Paz8XixShCYfNtNoQQd8vO6VFerTh1e
	6hX9qy3PiPYZr7YuzkhPhl1dbHsA0JP1IcjdaazBwG/Rxo8v0/nRWfxQvq+sPCfSROl9iUnMsEd
	19mdeWM26jbk+F/dxqgzG3dvzjtQele+nPRpIm+ySbL4ap42NtiTcpcKk/upPF/1t7JQfubxzEU
	gNxe7VCIRGk8bC2lh/LzQ0WXFZBs0O9pPteAPjEDZYwrIU2fS+CBQvT+Q3SBCzsJKEZFnUWfXRv
	fw==
X-Google-Smtp-Source: AGHT+IE8Q46S3n9z98hBCK7b3FNRHPYazHdbcsKH8q0ouiyW6bKhI/VDEMVG/7P+rDWf5zjXZV3M/g==
X-Received: by 2002:a17:907:962a:b0:b83:2af7:372a with SMTP id a640c23a62f3a-b832af73869mr1449856066b.41.1767087617722;
        Tue, 30 Dec 2025 01:40:17 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b910601c7sm34033399a12.14.2025.12.30.01.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 01:40:17 -0800 (PST)
Message-ID: <7b1b0259-90d4-4e7c-8bc5-01e22c371e24@linaro.org>
Date: Tue, 30 Dec 2025 09:40:14 +0000
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
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20251230022759.9449-1-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20251230022759.9449-1-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/12/2025 02:27, Richard Acayan wrote:
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
> 
> 			port@1 {
> 				reg = <1>;
> 
> 				camss_endpoint1: endpoint {
> 				};
> 			};
> 
> 			port@2 {
> 				reg = <2>;
> 
> 				camss_endpoint2: endpoint {
> 				};
> 			};
> 		};
> 	};
> 
> Example device dts:
> 
> 	&camss {
> 		status = "okay";
> 	};
> 
> 	&camss_endpoint1 {
> 		clock-lanes = <7>;
> 		data-lanes = <0 1 2 3>;
> 		remote-endpoint = <&cam_front_endpoint>;
> 	};
> 
> 	&cci_i2c1 {
> 		camera@1a {
> 			...
> 
> 			port {
> 				cam_front_endpoint: endpoint {
> 					data-lanes = <1 2 3 4>;
> 					link-frequencies = /bits/ 64 <360000000>;
> 					remote-endpoint = <&camss_endpoint1>;
> 				};
> 			};
> 		};
> 	};
> 
> Richard Acayan (3):
>    dt-bindings: media: camss: sdm670: Make endpoint properties optional
>    media: qcom: camss: allow endpoints with no remote
>    arm64: dts: qcom: sdm670: remove status properties of camss endpoints
> 
>   .../devicetree/bindings/media/qcom,sdm670-camss.yaml | 12 ------------
>   arch/arm64/boot/dts/qcom/sdm670.dtsi                 |  3 ---
>   drivers/media/platform/qcom/camss/camss.c            |  5 ++---
>   3 files changed, 2 insertions(+), 18 deletions(-)
> 

I don't think I am 100% understanding what the intent of this series is, 
i.e. at a high level the problem you're aiming to solve.

Can you elaborate a bit ?

---
bod

