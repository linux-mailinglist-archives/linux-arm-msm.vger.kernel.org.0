Return-Path: <linux-arm-msm+bounces-72580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B30B48EB4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 776D8441C3E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 13:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD4D30AD1B;
	Mon,  8 Sep 2025 13:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jw3Zj2o8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7A030AAD4
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 13:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336752; cv=none; b=k40P1qOgsB3K/JnoD20ZRhZTVRERzwm7QXOaf1QaRFh7JFe3/neVOLv+wr2IigNvM9kHH2Mru+PFLfkel+zMEKcomPyTpAbPlAHOo8bW+WM6gTFjFEyzDAQkRXjWq+ccVYnvwWY0IGUbezXHCtxELkvQOazX88MV4k1yqSUePDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336752; c=relaxed/simple;
	bh=rNr1BuodeVHKFmMzhnNYGEA8GhwKg+g9c8Aplx4gw3A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lOVpKcH0zKXow+m+Atkifibzpg83bVYzC7iyvn5kvLjgWajYfmy6kjYuzhP34Bwz/RHs8jRFu+6dE8QesrHazG+PlrRExCgFHnkTDR8/PNLuwxAP09ekJYRs6Fo7y6reXQN0Z7ZlQP+MR+o0w7gTgCktnd2Iy38NfEA/gVfEFG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jw3Zj2o8; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3e07ffffb87so2019211f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 06:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336749; x=1757941549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5chc44wHZ1zV1Y72wQqklmYPWfkYptX0wWGS8/7Iz8=;
        b=jw3Zj2o82jspaxmNp4qF6gIjKxqkHewpj/TJUtsVn9alHkh/lx/ew5VAeWcWJaA4mB
         1I6N6CgpoWaHZ8hhxrpsVeVIvI88gKbO4SagaQ7u9L4PixugBilBu1Wx6MNK65RL1zUf
         PC6SCr4be62TUfGGnmSodBqmmX+YGdFYvhHcKGmXnAWH3s5hdPhV/+IRBiQGFrG8TPIm
         UMEqy9BcfpEfYoa336anqzPH9/S5Q5GpbytfqSDNPOs2yfgbzxJghHq4zlDCOs2G6VvE
         q/nUqNzdxH9J/3DKw1rYgftw2UVjGqhuYjJgJmAw+3Z+GuZtDfoN+zReb8gVl6lZZSFK
         ituw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336749; x=1757941549;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u5chc44wHZ1zV1Y72wQqklmYPWfkYptX0wWGS8/7Iz8=;
        b=vmdUOMHZcLJXfveWQMNqG28qTLTWcdshbXuXDN9HMNqBz/Gs7jFpv9//5+H7jUQ7DL
         qAE6OvJZFnyj5xYmHleLfpnSM2wpjPkPo3XPWWpZtdf+22X30C/ST0hNlhicy5zopSsY
         q6qjJBjl3b74XLYOIfutdeNh5u9+WUr2RF4d/TxJjA2QPZQBQxqfRRbBglkyHPMsCcHJ
         F26yrFsedbwknanvNCy1gF9XxPCHWCgj9SdKUF147yb9P5HyeVh9vpbQYKHTh+R7EBrh
         ii1odfm1mLgedO+fwKLtsigS2cWBfhaWVmiaqdRCUuUUMEXkEDPwgtUGZh4bldXN6fAZ
         F+cA==
X-Gm-Message-State: AOJu0Yxm0CKxH4im824rds6on6piv4p8eCxPoA4Y3rvKBJk62c3E3v73
	WIvoP7R+thR1758WDI6DD55++Fj/07fnR0ZlhNJsMkp+CcMm4dh9IoF+toqIHHMATwQ=
X-Gm-Gg: ASbGncstqgKDAnkitudMbHYbOGlS4W7vYP0E3Ye5WnKjzqoLDv8D6QA8sd03Ep0Guij
	LYaBoNj7uK7TcLIQvtZLo4QU5o5MN9CU8uSoQyUKj6ImVULTdeZ9I94I2iv51GqtwKvUZrOIr+7
	wd8xfn9EXsJlGfy0EP8u1txtMf71Qma1l4do/8uHD2XTWsz7Mx7KnRWmxINjuR2id8J9CrpeAHI
	Hc2fE36FxsIGtvNur1UhzmmM1cv6TQdAM0R+UzxhH+f1Ft0GjXo+0n9b6yF26JBj51zTHRNH+zM
	Mll5Ln2Wy5SEs9ypFQvNCiMIXgf+pW1ExvIfZcIKQdLOT/ICY9KZAagrJA9fgqgJ+Glw8Q9VLuL
	+iYGMkoU78nxrFWIAJ+86n3UUJwaYMapBcf8HSNLdHKlhn9RqOHCw5QhtzF1x0ztIjokQEX8ljW
	CF3u62Cs7YCQ==
X-Google-Smtp-Source: AGHT+IEPgn/6M8XG6uNtkAHbgUnHhrF1VcVsINtk7OaZFicYzT9+CmrAjlGK+/IQepoHlqkM1JUPpg==
X-Received: by 2002:a05:6000:43cc:20b0:3e7:404f:685 with SMTP id ffacd0b85a97d-3e7404f09a2mr4422330f8f.44.1757336748536;
        Mon, 08 Sep 2025 06:05:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:61c1:5d31:4427:381b? ([2a01:e0a:3d9:2080:61c1:5d31:4427:381b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7483597ccsm4673380f8f.31.2025.09.08.06.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 06:05:48 -0700 (PDT)
Message-ID: <eadb4276-e5c5-48f6-af50-e5c1df52479d@linaro.org>
Date: Mon, 8 Sep 2025 15:05:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 0/3] phy: qcom: qmp-combo: set default qmpphy_mode
 from DT for Thinkpad HDMI support
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
 <fe92c4e7-6a1d-4cec-a3d1-c50adff9f7f5@oldschoolsolutions.biz>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <fe92c4e7-6a1d-4cec-a3d1-c50adff9f7f5@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/09/2025 10:45, Jens Glathe wrote:
> On 21.08.25 15:53, Neil Armstrong wrote:
>> The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
>> connected to the third QMP Combo PHY 4 lanes.
> 
> Hi Neil,
> 
> thank you for the patch. Integrated it on my tree and tested on the T14s, working very well. Also tested hotplug and suspend/resume.
> 
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Thanks a lot for testing !

I've sent a new version, which is quite different due to different feedbacks so I didn't take your Tested-by.

If you can re-test, it would be very welcome !

Neil

> 
> with best regards
> 
> Jens
> 


