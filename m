Return-Path: <linux-arm-msm+bounces-62625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C4EAE9BFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 12:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EB013AC480
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 10:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C880826C3AE;
	Thu, 26 Jun 2025 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UEYEKqWd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5123126C39F
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750935409; cv=none; b=VN3f8g5Nj04y59phhYKjRCDCBWvJc/vpPnX2v/kgXOytSUk81TSkEAm1mLIv9KAHw3zzk59UX9pl/1orFMmAVFYbJ9FNjZfPFnG9sjC7/3DT1X/Rj7TyzD5VYF3F3/nkzoYyjJXcYsv+awh/iDVBx6tzLzprtm5kqNoEUGsOTSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750935409; c=relaxed/simple;
	bh=unJVU3Xl3Wm7HDliPBmbf0uw3veqwlYT5BkTyANO19U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U0Q5+WKklOibt5oOzzZH0RbCMmSjIGoHGc8Eq/SH7SFRt6dPHdQTn9Earh1yBVV/5RhTArG4+AH0OSd94qWwEF9ejnPQFGwROKXBOVbmqDzOiQ14yE/bvQaMISW+/+uB5NZR4QkwyhP+5qzMmT65opQbcsrNvGtV8TfJQwYc6PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UEYEKqWd; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b4eb13e8cso992821fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 03:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750935405; x=1751540205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RrVEb7SOHXOjIaJsMr6PdsN8zJOeLk7RyAInvGFhJ0Q=;
        b=UEYEKqWdJJgWuMFvBOsD4Q6B/UfuBOrxO0TvlXtnGGFC2fcQgqtvwC5yuFviBretQI
         U5W6hcU9Lskj41m0iWJ59Supnxik4DeJ7Yb96UF9660zRiqfFTjIi0O+jJ0PCY6nq0pD
         J/g4icH0y+p3xlKTqlbS7Nbi0iUcL2jWtfhuBywdLqZF/sdVfVLKrLx3TA3ZG4vo4f4I
         Cn1evGDvVSE0KuJH33zrEmlYpEBQilUQj9ss6a11SUqfEZWnRFMppL4xEGMmBS+FIljU
         wOqop6o9/fznGMq5qtWhULatKz9lDHxXqpV40EZCM2CCkbbr8bUVHK6qORgAhmN6aNZV
         4S8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750935405; x=1751540205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RrVEb7SOHXOjIaJsMr6PdsN8zJOeLk7RyAInvGFhJ0Q=;
        b=qkPlywqMFeujh82RsxQ3R+DhzEnjn98yXeURs+Ed5pQVdQZg+HRx16I9szlnwFX0BJ
         v+U+EZgkOmsp96QNcqlOHHXcOUB13GNn0vK7u+36OQ9CNnTvx9W12ZhYMFhYG07J/yXj
         ySRIVDzuNHtv5pAwWBY8rpne74W9yIcI0u/OA47lhjTwn2h8XUxkhP0BXHCcowbGyxgP
         AxfWO03IJeazpc4xU5jHBDnsY6pluEHNFMz8kYkcwn7Na1ZlpBVkOzII36TiR1yxV2vr
         UQ9WEDd4NoaX5LN6C3UnrO5Go41Hkr9JDpR3v7Q9XBu80hwbxDyujffLVYZLfBcDjpef
         GMjA==
X-Forwarded-Encrypted: i=1; AJvYcCUi+Fy0oE+NP5kbs8dSsX69AmnRbNuAoL4HeiTMSo74QQdYdvUk9u0C75VEz32YWZcBNC2fel307KUUYvZy@vger.kernel.org
X-Gm-Message-State: AOJu0YzH5XpWrCAk0tR+bdqVYjIKq0Xu4J7F7gM9XLUqfbxmC+EzdY6B
	Er8jwlPogaFFwWjlCISJWwo9rOtc6rfOipPCEI4Y8yC9Jj0CrLQx/tNAWBl4wIBmNGo=
X-Gm-Gg: ASbGncsJI0FIa0LVi77/BAulKutiJMMqKf0S1Km2tzLDJ1BlINVrGZE69kbXULghFUU
	LkLEnZgzguF/94ZQoPSgKaZLin7AA0JlsAveeyj+qqrZEF1Tinv+nc/rkg/wbdPDilLfDTUGS9z
	WOsVxyrRlcJfUd285eqpmpEPv17dYYPr1HxrXWJqHrnkszUh8LisbNe3LybewpV34gSv2uIrzzn
	/QhTcmDDKmbLxSbktxmXAZCBZ2Az7uCKZUCENQNdFv/49ZKPAv99in2wY/7oNLel767Z5d6iSeq
	IEAaY2R2cn7NCClQywgGplTTQiouH8l6V3sMW0VTIHM+9bPAE09y9YThqJzd0kELksc3xQExAxu
	3GQDKPbWaks/g95ifAwkduW7r4lWxz1KHCA0QNh1c
X-Google-Smtp-Source: AGHT+IH57sZpqtFwHoa4JW0LInHA8kw3WhTt17SJ6Qp+hkH5OY5V3UsY/0SWnVUa5DXSYTbv462qjA==
X-Received: by 2002:a05:6512:234e:b0:554:f74e:9f0a with SMTP id 2adb3069b0e04-554fdd59ee7mr658062e87.14.1750935405424;
        Thu, 26 Jun 2025 03:56:45 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c2ef7sm2581675e87.144.2025.06.26.03.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 03:56:45 -0700 (PDT)
Message-ID: <c4fc49d5-e946-4526-9100-0e891c4a5e4c@linaro.org>
Date: Thu, 26 Jun 2025 13:56:44 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] media: qcom: camss: Add support for MSM8939
Content-Language: ru-RU
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org>
 <20250613-camss-8x39-vbif-v5-2-a002301a7730@mailoo.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250613-camss-8x39-vbif-v5-2-a002301a7730@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Vincent.

On 6/13/25 12:33, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> The camera subsystem for the MSM8939 is the same as MSM8916 except with
> 3 CSID instead of 2, and some higher clock rates.
> 
> As a quirk, this SoC needs writing values to 2 VFE VBIF registers
> (see downstream msm8939-camera.dtsi vbif-{regs,settings} properties).
> This fixes black stripes across sensor and garbage in CSID TPG outputs.
> 
> Add support for the MSM8939 camera subsystem.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

I would repeat my ask given previously:

https://lore.kernel.org/all/877a72fa-cdae-4a66-9991-5ea86ef76aac@linaro.org/

<snip>

>   
> +static const struct camss_resources msm8939_resources = {
> +	.version = CAMSS_8x39,
> +	.csiphy_res = csiphy_res_8x39,
> +	.csid_res = csid_res_8x39,
> +	.ispif_res = &ispif_res_8x39,
> +	.vfe_res = vfe_res_8x39,
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_8x39),
> +	.csid_num = ARRAY_SIZE(csid_res_8x39),
> +	.vfe_num = ARRAY_SIZE(vfe_res_8x39),
> +	.link_entities = camss_link_entities

There shall be no more dragging of the .link_entities, it's gone
a bit more than 6 weeks ago.

https://lore.kernel.org/all/20250513142353.2572563-4-vladimir.zapolskiy@linaro.org/

> +};
> +

For sake of simplicty you may include that particular change preserving
all its tags into your MSM8939 changeset, it will help a maintainer
to resolve merge conflicts.

-- 
Best wishes,
Vladimir

