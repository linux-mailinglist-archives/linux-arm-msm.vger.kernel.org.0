Return-Path: <linux-arm-msm+bounces-5428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A06DC818F0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 18:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D25DB1C250F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 17:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BABC374FF;
	Tue, 19 Dec 2023 17:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BLAM3rBf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C5C37D09
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 17:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c69403b3eso48373385e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 09:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703008468; x=1703613268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QAZ0HvxFl1b1Uz1AqrWWlyqL8jpRTOfiKc+ri1uR42M=;
        b=BLAM3rBfKRgKVk5jI3LwihubCf0v1G8tq9sXJ1W735Xx2BM/F5uAqetVjPL2MkyxyN
         s3FpEDWGZdno04+oWbLD6ISaUo/iglwftlyCCK6W+a9lhcYUahuegHDAnAy08D45kVKh
         Gf1yL1NqkZG3ygbcMhIrpf97gbm5dwEgui9Msc4G4ZBD+RprW9l9MbaMn4CQcUxVbPQv
         SZVNE/ltFJkzsPaheXDV1rrknIV84vC0TT2WZ4snyAC2//999f93UvHvDxzEZs6tl52t
         U1Yv/wmv9pZMD7lOZaGB/U9msbI9KrTnQgaSnJ8N+BJve+qqfAz2RuCHnPBpKdJp0x6w
         IH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703008468; x=1703613268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAZ0HvxFl1b1Uz1AqrWWlyqL8jpRTOfiKc+ri1uR42M=;
        b=lrqoyadoowdMLKbYbs/ojAyOxoO1LW/1cdKhRJonuHYVoTpglaIF8/Fv+J8chQrWWL
         ltCKmdKtul00Z/jcJVY8IK0+fat/QP0KEPbIBtYy69Hhb+IvnhzWkI1udXx1NUWJe1hu
         g5qA8QD9jQdQFjfAfjGvOfBUoYPHiOQ5zPKevQgWvuevO7lXttGzed4PrziUROMksdy2
         2xepR1nmklF3sCjezZ4ELuCko6c2H6RLDSasSJ0ZilExVgkEZuZXKxKWnGMAPvwwKj+e
         JemXrpEwhVwyRI+l0TJiMz4plB3V9DVUCeJjLyDTxg19tegvkygRVT0o34a0JOGrXuD5
         6owg==
X-Gm-Message-State: AOJu0Yy6Rf3cv1lyhYPHzbBd4XNIX18dfSBiBvUUILLON3NManNy8sz2
	WY8Hq/PFsk/JwjyP3ldPPxqlRA==
X-Google-Smtp-Source: AGHT+IFm2bDzn5vBqEgH35Z4tRcu8mym1MPP/kL1m9Ae2ihUX/Qz9NB9j7ySTDRSbPCTnxYwN6/F5w==
X-Received: by 2002:a7b:ca5a:0:b0:40b:5e21:ec3f with SMTP id m26-20020a7bca5a000000b0040b5e21ec3fmr9745933wml.113.1703008468047;
        Tue, 19 Dec 2023 09:54:28 -0800 (PST)
Received: from [192.168.10.46] ([37.170.14.102])
        by smtp.googlemail.com with ESMTPSA id p41-20020a05600c1da900b0040b360cc65csm4026585wms.0.2023.12.19.09.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 09:54:27 -0800 (PST)
Message-ID: <d1c97276-c538-4a6d-b7f4-e0e4b5e98c32@linaro.org>
Date: Tue, 19 Dec 2023 18:54:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] dt-bindings: thermal: qcom-spmi-adc-tm5/hc: fix up
 examples
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231130174114.13122-1-johan+linaro@kernel.org>
 <ZYG9yqyoul-gaEGs@hovoldconsulting.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <ZYG9yqyoul-gaEGs@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/12/2023 16:59, Johan Hovold wrote:
> Hi Daniel and Rafael,
> 
> On Thu, Nov 30, 2023 at 06:41:12PM +0100, Johan Hovold wrote:
>> When reviewing the various SPMI PMIC bindings, I noticed that several
>> examples were incorrect and misleading and could also use some cleanup.
>>
>> This series addresses the thermal ones.
> 
>> Johan Hovold (2):
>>    dt-bindings: thermal: qcom-spmi-adc-tm5/hc: fix example node names
>>    dt-bindings: thermal: qcom-spmi-adc-tm5/hc: clean up examples
> 
> Can we get these merged for 6.8?

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


