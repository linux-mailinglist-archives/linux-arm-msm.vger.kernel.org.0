Return-Path: <linux-arm-msm+bounces-66087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2105EB0DA62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 15:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD4861C230FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 13:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39FEA2E9750;
	Tue, 22 Jul 2025 13:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eKPVTf3c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF9428C2DE
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753189274; cv=none; b=UA3lY04WeIrRdhZJpB0o7d3puq0B428WJUMrIxvpbWMpAmnlPgQsUiCXGu134kWgbbWV1c72KMoEpD5HLRCozkThIRDSeWnhiZV2oaC7sFRr88gismNdfRpd4h6gf1BWpNGAUR6GOOuOipXHtJiQRlQM0NFJ25Kl6gOC7jKZIog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753189274; c=relaxed/simple;
	bh=F3C8Y/zFrPx/vvJm+zVvmRcet046eQEDzPDmtI0Ab+I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=k97nnfAjRRyCChWTr2iNjSyzRiS6cB8YykDcN+Bi1PiZU1ft5gzH0mQhXb1ZcZK2rgjW4Miomyp7fnUKrgMSS+Z/G3sjoODbW/ykYk97qY4/svMQh7LLidtQD5UMbI2lViBu4jk9rg3m+8UE9YwI3de1Jnixle4gyNFoi5fCEEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eKPVTf3c; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a510432236so3267772f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 06:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753189271; x=1753794071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xebaum/5BKiumSnNJGDyurMqt6WaPewfW0ldlstT91w=;
        b=eKPVTf3cxOeJjqE7Tt2XYuLbUCcAF9/RUG0/VI4FfxO/j6V/NV/He+JXY2839U2Nmo
         r82QM+cr8igyFrhnA4JfzkqbBYzUnFy3XY4mCuMuRkLPx9Lsu+/BPsdtzQ8ilpFr7jMP
         Cg+q0MYzcEMaaeQ+s4pAOW4p7iEtAIc1sKtY9qay6MaF+J/SU2OSmRUp7/odxovZDcw5
         NVxODNgO6WAFhWX/boRLSgYoeVudxFlbfTcKcrofeSj3PpPDGz9+s4MSnYEje5kgI7kC
         pEbM5KvXuY49QY+u4n0QOCLjsSiaCXA3VvNsZjH83g3OATzLXp5dqLUl6Z+K3XNHz2CH
         FIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753189271; x=1753794071;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xebaum/5BKiumSnNJGDyurMqt6WaPewfW0ldlstT91w=;
        b=CkFishmF9j6+JjZcg5XPDxMUxyHhXjvIMP7kTkM2ZoCLNXg3fJm+a+cY6HxVH+J5Z+
         k+gJBGhH7vR5/e3Mv8Fo6TCg5fP993N32wYdshMz7nB85GQgm/9G05CTE7P2/atH1OmA
         dpnqF2+3rUpdaBf3kvxEW/MeHbfLQaDsEXfnnflcUZWT2aS0cSXmVXhogkfutVFN1N+K
         9WcipmvH9lrLjE4l7iTc7asj+OTlQLyhhuKdIYEr16eHqBYH4MuCLv/ILwrWzjKbOq36
         +QWMlAoXFG07E640Dm84qgkV50vC4ffP/5WqknqLNJAI/HZDT1eSrUJXgBTwKsL+IrvK
         M0Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVQkTutobn1DFBM92jJHBtxbbKOtEJeE07sLz5mCLOUF7DDd6iMDvQqYEiA66AnoNAQu5nAI5fVwqT7i7gf@vger.kernel.org
X-Gm-Message-State: AOJu0YyJFYm/EoL2PnfkLMViJIrL/Bb/6hbsORME8T55xyGWYRWRM9ag
	Z9ky2KCeWPftPvuKI8WEpb6uw3RNCwjXt2ELq6ASRnGYAbC+6y0gINDAkHT6nv4s9tU=
X-Gm-Gg: ASbGncsLFOovN+CUY0p6p8LjJ+geAfwSTqc25vPVOnEZ1g15hah8xmB7fFEzzLWGFii
	IUIdYdUf4FINn2tE7rZhDSQBOHXt3Aw6Q1NmCQ+5zEWrrhBrfnnWCkgOf4HdK9u3nCfa8sbdQgn
	i4iTpcFc4IKu9jCeHQC++ya3FQ1FkLv1jyQ7MRHATa2vuDBJz7LPSLqCtNHB95cFvyBVujENTpC
	XrUx0+kpdFoTzb+0O0p6Kc48gOJlp2YpJwQLmGq4ynUPPS/TKWWYSgjfIdNwAv2MKfKccUxHMCF
	EaEXaaloaOhJyq5GGvr9/q86p2U/8YODEPOwK2eaqiS/k+MptAq8Te73q28SbfKsC/mJrJWnWwt
	UJ25UiEORQMb2TmZAkqfHLXPbRS7+tBYJrspmlq8q31TySFZwakCOKXDHoy0D+8TmAOqiG1yw1p
	BYJuPcTC6RUA==
X-Google-Smtp-Source: AGHT+IGD6Ce2cKQNzAI2CflJsoQbN+wNC/y0wZhvJpelndK3mdzmr2kZcXpr/VTsPYXTVTSs4XZjQw==
X-Received: by 2002:a5d:6f19:0:b0:3a4:fa09:d13b with SMTP id ffacd0b85a97d-3b60e54aa5fmr17789875f8f.59.1753189270137;
        Tue, 22 Jul 2025 06:01:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bce4:725d:6922:d1ba? ([2a01:e0a:3d9:2080:bce4:725d:6922:d1ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2bf99sm13404605f8f.32.2025.07.22.06.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 06:01:09 -0700 (PDT)
Message-ID: <d431435b-4ac0-44aa-922d-0bde126ca563@linaro.org>
Date: Tue, 22 Jul 2025 15:01:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 0/3] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
To: Johan Hovold <johan@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <aCw9pYehCdfXXeiR@hovoldconsulting.com>
 <aG-QyF12rGY55gcG@hovoldconsulting.com>
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
In-Reply-To: <aG-QyF12rGY55gcG@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/07/2025 12:07, Johan Hovold wrote:
> Hi Chris (and Neil),
> 
> On Tue, May 20, 2025 at 10:30:29AM +0200, Johan Hovold wrote:
> 
>> On Wed, Apr 02, 2025 at 03:36:31PM +0100, Christopher Obbard wrote:
>>> The Snapdragon Lenovo T14s Gen6 can be bought with a number of different
>>> panels. This patch series adds support for the OLED model which has a
>>> Samsung ATNA40YK20 panel.
>>>
>>> With this patch series the backlight of the OLED eDP panel does not
>>> illuminate since the brightness is incorrectly read from the eDP panel
>>> as (to be clear this is not a regression). This is fixed in [0].
>>>
>>> [0]: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org/
>>
>> It would be good to get OLED support for the T14s merged. Are you
>> planning on sending another revision of this series?
> 
> No reply for over a month. Do you intend to respin these or should
> someone else take over?
> 
> Neil, do you have the OLED version now?

I'm not sure, how do I determine that ? Is there something specific in the type number ?

Neil

> 
>>> Christopher Obbard (3):
>>>        arm64: dts: qcom: x1e80100: add epd hpd pinctrl
>>>        arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp controller
>>
>>>        arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
>>
>> Strictly speaking you could have posted this last patch on it's own as
>> it doesn't depend on adding the hpd pinctrl.
> 
> Johan


